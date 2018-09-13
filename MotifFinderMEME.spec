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


      typedef structure {
        string workspace_name;
        string genome_ref;
        string featureSet_ref;
        int promoter_length;
        int motif_min_length;
        int motif_max_length;
      } get_promoter_for_gene_input;

      typedef structure {
        string report_name;
        string report_ref;
      } get_promoter_for_gene_output_params;


      funcdef find_motifs(get_promoter_for_gene_input params)
        returns (get_promoter_for_gene_output_params output) authentication required;

      funcdef get_promoter_for_gene(get_promoter_for_gene_input params)
        returns (string output) authentication required;


};
