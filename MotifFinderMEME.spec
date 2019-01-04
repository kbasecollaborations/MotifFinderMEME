/*
A KBase module: MotifFinderMEME
*/

module MotifFinderMEME {
    /*
        Insert your typespec information here.
    */
    /*
     Genome is a KBase genome
     Featureset is a KBase featureset
     Promoter_length is the length of promoter requested for all genes
    */

      /*
      SS_ref - optional, used for exact genome locations if possible
      */
      typedef structure{
        string workspace_name;
        string fastapath;
        int motif_min_length;
        int motif_max_length;
        string SS_ref;
        string obj_name;
      } find_motifs_params;

      typedef structure {
        string workspace_name;
        string genome_ref;
        string featureSet_ref;
        int promoter_length;
        int motif_min_length;
        int motif_max_length;
        string obj_name;
      } extract_input;

      typedef structure {
        string report_name;
        string report_ref;
      } extract_output_params;

      typedef structure{
        string workspace_name;
        string fasta_path;
      } discover_fasta_input;

      typedef structure{
        string workspace_name;
        string SequenceSetRef;
        string fasta_outpath;
      } BuildSeqIn;

      typedef structure{
        string fasta_outpath;
      } BuildSeqOut;

      funcdef find_motifs(find_motifs_params params)
        returns (extract_output_params output) authentication required;

      funcdef BuildFastaFromSequenceSet(BuildSeqIn params)
        returns (BuildSeqOut output) authentication required;

      funcdef ExtractPromotersFromFeatureSetandDiscoverMotifs(extract_input params)
        returns (extract_output_params output) authentication required;

      funcdef DiscoverMotifsFromFasta(discover_fasta_input params)
        returns (extract_output_params output) authentication required;


};
