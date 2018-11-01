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

      typedef structure{
        string workspace_name;
        string SequenceSetRef;
        int motif_min_length;
        int motif_max_length;

      } find_motifs_params;

      typedef structure {
        string workspace_name;
        string genome_ref;
        string featureSet_ref;
        int promoter_length;
        int motif_min_length;
        int motif_max_length;
      } extract_input;

      typedef structure {
        string report_name;
        string report_ref;
      } extract_output_params;


      typedef structure{
        string workspace_name;
        string SequenceSetRef;
        string fasta_outpath;
      } BuildSeqIn;

      typedef structure{
        string fasta_outpath;
      } BuildSeqOut;

      funcdef find_motifs(get_promoter_for_gene_input params)
        returns (extract_output_params output) authentication required;

      funcdef ExtractPromotersFromFeatureSetandDiscoverMotifs(extract_input params)
        returns (extract_output_params output) authentication required;

      funcdef BuildFastaFromSequenceSet(BuildSeqIn params)
        returns (BuildSeqOut output)

};
