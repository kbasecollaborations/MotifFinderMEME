package MotifFinderMEME::MotifFinderMEMEClient;

use JSON::RPC::Client;
use POSIX;
use strict;
use Data::Dumper;
use URI;
use Bio::KBase::Exceptions;
my $get_time = sub { time, 0 };
eval {
    require Time::HiRes;
    $get_time = sub { Time::HiRes::gettimeofday() };
};

use Bio::KBase::AuthToken;

# Client version should match Impl version
# This is a Semantic Version number,
# http://semver.org
our $VERSION = "0.1.0";

=head1 NAME

MotifFinderMEME::MotifFinderMEMEClient

=head1 DESCRIPTION


A KBase module: MotifFinderMEME


=cut

sub new
{
    my($class, $url, @args) = @_;
    

    my $self = {
	client => MotifFinderMEME::MotifFinderMEMEClient::RpcClient->new,
	url => $url,
	headers => [],
    };

    chomp($self->{hostname} = `hostname`);
    $self->{hostname} ||= 'unknown-host';

    #
    # Set up for propagating KBRPC_TAG and KBRPC_METADATA environment variables through
    # to invoked services. If these values are not set, we create a new tag
    # and a metadata field with basic information about the invoking script.
    #
    if ($ENV{KBRPC_TAG})
    {
	$self->{kbrpc_tag} = $ENV{KBRPC_TAG};
    }
    else
    {
	my ($t, $us) = &$get_time();
	$us = sprintf("%06d", $us);
	my $ts = strftime("%Y-%m-%dT%H:%M:%S.${us}Z", gmtime $t);
	$self->{kbrpc_tag} = "C:$0:$self->{hostname}:$$:$ts";
    }
    push(@{$self->{headers}}, 'Kbrpc-Tag', $self->{kbrpc_tag});

    if ($ENV{KBRPC_METADATA})
    {
	$self->{kbrpc_metadata} = $ENV{KBRPC_METADATA};
	push(@{$self->{headers}}, 'Kbrpc-Metadata', $self->{kbrpc_metadata});
    }

    if ($ENV{KBRPC_ERROR_DEST})
    {
	$self->{kbrpc_error_dest} = $ENV{KBRPC_ERROR_DEST};
	push(@{$self->{headers}}, 'Kbrpc-Errordest', $self->{kbrpc_error_dest});
    }

    #
    # This module requires authentication.
    #
    # We create an auth token, passing through the arguments that we were (hopefully) given.

    {
	my %arg_hash2 = @args;
	if (exists $arg_hash2{"token"}) {
	    $self->{token} = $arg_hash2{"token"};
	} elsif (exists $arg_hash2{"user_id"}) {
	    my $token = Bio::KBase::AuthToken->new(@args);
	    if (!$token->error_message) {
	        $self->{token} = $token->token;
	    }
	}
	
	if (exists $self->{token})
	{
	    $self->{client}->{token} = $self->{token};
	}
    }

    my $ua = $self->{client}->ua;	 
    my $timeout = $ENV{CDMI_TIMEOUT} || (30 * 60);	 
    $ua->timeout($timeout);
    bless $self, $class;
    #    $self->_validate_version();
    return $self;
}




=head2 find_motifs

  $output = $obj->find_motifs($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a MotifFinderMEME.find_motifs_params
$output is a MotifFinderMEME.extract_output_params
find_motifs_params is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	fastapath has a value which is a string
	motif_min_length has a value which is an int
	motif_max_length has a value which is an int
	SS_ref has a value which is a string
	obj_name has a value which is a string
extract_output_params is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string

</pre>

=end html

=begin text

$params is a MotifFinderMEME.find_motifs_params
$output is a MotifFinderMEME.extract_output_params
find_motifs_params is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	fastapath has a value which is a string
	motif_min_length has a value which is an int
	motif_max_length has a value which is an int
	SS_ref has a value which is a string
	obj_name has a value which is a string
extract_output_params is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string


=end text

=item Description



=back

=cut

 sub find_motifs
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function find_motifs (received $n, expecting 1)");
    }
    {
	my($params) = @args;

	my @_bad_arguments;
        (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"params\" (value was \"$params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to find_motifs:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'find_motifs');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "MotifFinderMEME.find_motifs",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'find_motifs',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method find_motifs",
					    status_line => $self->{client}->status_line,
					    method_name => 'find_motifs',
				       );
    }
}
 


=head2 BuildFastaFromSequenceSet

  $output = $obj->BuildFastaFromSequenceSet($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a MotifFinderMEME.BuildSeqIn
$output is a MotifFinderMEME.BuildSeqOut
BuildSeqIn is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	SequenceSetRef has a value which is a string
	fasta_outpath has a value which is a string
BuildSeqOut is a reference to a hash where the following keys are defined:
	fasta_outpath has a value which is a string

</pre>

=end html

=begin text

$params is a MotifFinderMEME.BuildSeqIn
$output is a MotifFinderMEME.BuildSeqOut
BuildSeqIn is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	SequenceSetRef has a value which is a string
	fasta_outpath has a value which is a string
BuildSeqOut is a reference to a hash where the following keys are defined:
	fasta_outpath has a value which is a string


=end text

=item Description



=back

=cut

 sub BuildFastaFromSequenceSet
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function BuildFastaFromSequenceSet (received $n, expecting 1)");
    }
    {
	my($params) = @args;

	my @_bad_arguments;
        (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"params\" (value was \"$params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to BuildFastaFromSequenceSet:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'BuildFastaFromSequenceSet');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "MotifFinderMEME.BuildFastaFromSequenceSet",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'BuildFastaFromSequenceSet',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method BuildFastaFromSequenceSet",
					    status_line => $self->{client}->status_line,
					    method_name => 'BuildFastaFromSequenceSet',
				       );
    }
}
 


=head2 ExtractPromotersFromFeatureSetandDiscoverMotifs

  $output = $obj->ExtractPromotersFromFeatureSetandDiscoverMotifs($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a MotifFinderMEME.extract_input
$output is a MotifFinderMEME.extract_output_params
extract_input is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	genome_ref has a value which is a string
	featureSet_ref has a value which is a string
	promoter_length has a value which is an int
	motif_min_length has a value which is an int
	motif_max_length has a value which is an int
	obj_name has a value which is a string
extract_output_params is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string

</pre>

=end html

=begin text

$params is a MotifFinderMEME.extract_input
$output is a MotifFinderMEME.extract_output_params
extract_input is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	genome_ref has a value which is a string
	featureSet_ref has a value which is a string
	promoter_length has a value which is an int
	motif_min_length has a value which is an int
	motif_max_length has a value which is an int
	obj_name has a value which is a string
extract_output_params is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string


=end text

=item Description



=back

=cut

 sub ExtractPromotersFromFeatureSetandDiscoverMotifs
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function ExtractPromotersFromFeatureSetandDiscoverMotifs (received $n, expecting 1)");
    }
    {
	my($params) = @args;

	my @_bad_arguments;
        (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"params\" (value was \"$params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to ExtractPromotersFromFeatureSetandDiscoverMotifs:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'ExtractPromotersFromFeatureSetandDiscoverMotifs');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "MotifFinderMEME.ExtractPromotersFromFeatureSetandDiscoverMotifs",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'ExtractPromotersFromFeatureSetandDiscoverMotifs',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method ExtractPromotersFromFeatureSetandDiscoverMotifs",
					    status_line => $self->{client}->status_line,
					    method_name => 'ExtractPromotersFromFeatureSetandDiscoverMotifs',
				       );
    }
}
 


=head2 DiscoverMotifsFromFasta

  $output = $obj->DiscoverMotifsFromFasta($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a MotifFinderMEME.discover_fasta_input
$output is a MotifFinderMEME.extract_output_params
discover_fasta_input is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	fasta_path has a value which is a string
extract_output_params is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string

</pre>

=end html

=begin text

$params is a MotifFinderMEME.discover_fasta_input
$output is a MotifFinderMEME.extract_output_params
discover_fasta_input is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	fasta_path has a value which is a string
extract_output_params is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string


=end text

=item Description



=back

=cut

 sub DiscoverMotifsFromFasta
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function DiscoverMotifsFromFasta (received $n, expecting 1)");
    }
    {
	my($params) = @args;

	my @_bad_arguments;
        (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"params\" (value was \"$params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to DiscoverMotifsFromFasta:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'DiscoverMotifsFromFasta');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "MotifFinderMEME.DiscoverMotifsFromFasta",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'DiscoverMotifsFromFasta',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method DiscoverMotifsFromFasta",
					    status_line => $self->{client}->status_line,
					    method_name => 'DiscoverMotifsFromFasta',
				       );
    }
}
 


=head2 DiscoverMotifsFromSequenceSet

  $output = $obj->DiscoverMotifsFromSequenceSet($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a MotifFinderMEME.discover_seq_input
$output is a MotifFinderMEME.extract_output_params
discover_seq_input is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	genome_ref has a value which is a string
	SS_ref has a value which is a string
	promoter_length has a value which is an int
	motif_min_length has a value which is an int
	motif_max_length has a value which is an int
	obj_name has a value which is a string
	background has a value which is an int
	mask_repeats has a value which is an int
extract_output_params is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string

</pre>

=end html

=begin text

$params is a MotifFinderMEME.discover_seq_input
$output is a MotifFinderMEME.extract_output_params
discover_seq_input is a reference to a hash where the following keys are defined:
	workspace_name has a value which is a string
	genome_ref has a value which is a string
	SS_ref has a value which is a string
	promoter_length has a value which is an int
	motif_min_length has a value which is an int
	motif_max_length has a value which is an int
	obj_name has a value which is a string
	background has a value which is an int
	mask_repeats has a value which is an int
extract_output_params is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string


=end text

=item Description



=back

=cut

 sub DiscoverMotifsFromSequenceSet
{
    my($self, @args) = @_;

# Authentication: required

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function DiscoverMotifsFromSequenceSet (received $n, expecting 1)");
    }
    {
	my($params) = @args;

	my @_bad_arguments;
        (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"params\" (value was \"$params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to DiscoverMotifsFromSequenceSet:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'DiscoverMotifsFromSequenceSet');
	}
    }

    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
	    method => "MotifFinderMEME.DiscoverMotifsFromSequenceSet",
	    params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{error}->{code},
					       method_name => 'DiscoverMotifsFromSequenceSet',
					       data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method DiscoverMotifsFromSequenceSet",
					    status_line => $self->{client}->status_line,
					    method_name => 'DiscoverMotifsFromSequenceSet',
				       );
    }
}
 
  
sub status
{
    my($self, @args) = @_;
    if ((my $n = @args) != 0) {
        Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
                                   "Invalid argument count for function status (received $n, expecting 0)");
    }
    my $url = $self->{url};
    my $result = $self->{client}->call($url, $self->{headers}, {
        method => "MotifFinderMEME.status",
        params => \@args,
    });
    if ($result) {
        if ($result->is_error) {
            Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
                           code => $result->content->{error}->{code},
                           method_name => 'status',
                           data => $result->content->{error}->{error} # JSON::RPC::ReturnObject only supports JSONRPC 1.1 or 1.O
                          );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method status",
                        status_line => $self->{client}->status_line,
                        method_name => 'status',
                       );
    }
}
   

sub version {
    my ($self) = @_;
    my $result = $self->{client}->call($self->{url}, $self->{headers}, {
        method => "MotifFinderMEME.version",
        params => [],
    });
    if ($result) {
        if ($result->is_error) {
            Bio::KBase::Exceptions::JSONRPC->throw(
                error => $result->error_message,
                code => $result->content->{code},
                method_name => 'DiscoverMotifsFromSequenceSet',
            );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(
            error => "Error invoking method DiscoverMotifsFromSequenceSet",
            status_line => $self->{client}->status_line,
            method_name => 'DiscoverMotifsFromSequenceSet',
        );
    }
}

sub _validate_version {
    my ($self) = @_;
    my $svr_version = $self->version();
    my $client_version = $VERSION;
    my ($cMajor, $cMinor) = split(/\./, $client_version);
    my ($sMajor, $sMinor) = split(/\./, $svr_version);
    if ($sMajor != $cMajor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Major version numbers differ.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor < $cMinor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Client minor version greater than Server minor version.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor > $cMinor) {
        warn "New client version available for MotifFinderMEME::MotifFinderMEMEClient\n";
    }
    if ($sMajor == 0) {
        warn "MotifFinderMEME::MotifFinderMEMEClient version is $svr_version. API subject to change.\n";
    }
}

=head1 TYPES



=head2 find_motifs_params

=over 4



=item Description

SS_ref - optional, used for exact genome locations if possible


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
fastapath has a value which is a string
motif_min_length has a value which is an int
motif_max_length has a value which is an int
SS_ref has a value which is a string
obj_name has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
fastapath has a value which is a string
motif_min_length has a value which is an int
motif_max_length has a value which is an int
SS_ref has a value which is a string
obj_name has a value which is a string


=end text

=back



=head2 extract_input

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
genome_ref has a value which is a string
featureSet_ref has a value which is a string
promoter_length has a value which is an int
motif_min_length has a value which is an int
motif_max_length has a value which is an int
obj_name has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
genome_ref has a value which is a string
featureSet_ref has a value which is a string
promoter_length has a value which is an int
motif_min_length has a value which is an int
motif_max_length has a value which is an int
obj_name has a value which is a string


=end text

=back



=head2 extract_output_params

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
report_name has a value which is a string
report_ref has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
report_name has a value which is a string
report_ref has a value which is a string


=end text

=back



=head2 discover_fasta_input

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
fasta_path has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
fasta_path has a value which is a string


=end text

=back



=head2 BuildSeqIn

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
SequenceSetRef has a value which is a string
fasta_outpath has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
SequenceSetRef has a value which is a string
fasta_outpath has a value which is a string


=end text

=back



=head2 BuildSeqOut

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
fasta_outpath has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
fasta_outpath has a value which is a string


=end text

=back



=head2 discover_seq_input

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
genome_ref has a value which is a string
SS_ref has a value which is a string
promoter_length has a value which is an int
motif_min_length has a value which is an int
motif_max_length has a value which is an int
obj_name has a value which is a string
background has a value which is an int
mask_repeats has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
workspace_name has a value which is a string
genome_ref has a value which is a string
SS_ref has a value which is a string
promoter_length has a value which is an int
motif_min_length has a value which is an int
motif_max_length has a value which is an int
obj_name has a value which is a string
background has a value which is an int
mask_repeats has a value which is an int


=end text

=back



=cut

package MotifFinderMEME::MotifFinderMEMEClient::RpcClient;
use base 'JSON::RPC::Client';
use POSIX;
use strict;

#
# Override JSON::RPC::Client::call because it doesn't handle error returns properly.
#

sub call {
    my ($self, $uri, $headers, $obj) = @_;
    my $result;


    {
	if ($uri =~ /\?/) {
	    $result = $self->_get($uri);
	}
	else {
	    Carp::croak "not hashref." unless (ref $obj eq 'HASH');
	    $result = $self->_post($uri, $headers, $obj);
	}

    }

    my $service = $obj->{method} =~ /^system\./ if ( $obj );

    $self->status_line($result->status_line);

    if ($result->is_success) {

        return unless($result->content); # notification?

        if ($service) {
            return JSON::RPC::ServiceObject->new($result, $self->json);
        }

        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    elsif ($result->content_type eq 'application/json')
    {
        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    else {
        return;
    }
}


sub _post {
    my ($self, $uri, $headers, $obj) = @_;
    my $json = $self->json;

    $obj->{version} ||= $self->{version} || '1.1';

    if ($obj->{version} eq '1.0') {
        delete $obj->{version};
        if (exists $obj->{id}) {
            $self->id($obj->{id}) if ($obj->{id}); # if undef, it is notification.
        }
        else {
            $obj->{id} = $self->id || ($self->id('JSON::RPC::Client'));
        }
    }
    else {
        # $obj->{id} = $self->id if (defined $self->id);
	# Assign a random number to the id if one hasn't been set
	$obj->{id} = (defined $self->id) ? $self->id : substr(rand(),2);
    }

    my $content = $json->encode($obj);

    $self->ua->post(
        $uri,
        Content_Type   => $self->{content_type},
        Content        => $content,
        Accept         => 'application/json',
	@$headers,
	($self->{token} ? (Authorization => $self->{token}) : ()),
    );
}



1;
