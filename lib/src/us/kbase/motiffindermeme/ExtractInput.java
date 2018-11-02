
package us.kbase.motiffindermeme;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: extract_input</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "workspace_name",
    "genome_ref",
    "featureSet_ref",
    "promoter_length",
    "motif_min_length",
    "motif_max_length"
})
public class ExtractInput {

    @JsonProperty("workspace_name")
    private String workspaceName;
    @JsonProperty("genome_ref")
    private String genomeRef;
    @JsonProperty("featureSet_ref")
    private String featureSetRef;
    @JsonProperty("promoter_length")
    private Long promoterLength;
    @JsonProperty("motif_min_length")
    private Long motifMinLength;
    @JsonProperty("motif_max_length")
    private Long motifMaxLength;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("workspace_name")
    public String getWorkspaceName() {
        return workspaceName;
    }

    @JsonProperty("workspace_name")
    public void setWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
    }

    public ExtractInput withWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
        return this;
    }

    @JsonProperty("genome_ref")
    public String getGenomeRef() {
        return genomeRef;
    }

    @JsonProperty("genome_ref")
    public void setGenomeRef(String genomeRef) {
        this.genomeRef = genomeRef;
    }

    public ExtractInput withGenomeRef(String genomeRef) {
        this.genomeRef = genomeRef;
        return this;
    }

    @JsonProperty("featureSet_ref")
    public String getFeatureSetRef() {
        return featureSetRef;
    }

    @JsonProperty("featureSet_ref")
    public void setFeatureSetRef(String featureSetRef) {
        this.featureSetRef = featureSetRef;
    }

    public ExtractInput withFeatureSetRef(String featureSetRef) {
        this.featureSetRef = featureSetRef;
        return this;
    }

    @JsonProperty("promoter_length")
    public Long getPromoterLength() {
        return promoterLength;
    }

    @JsonProperty("promoter_length")
    public void setPromoterLength(Long promoterLength) {
        this.promoterLength = promoterLength;
    }

    public ExtractInput withPromoterLength(Long promoterLength) {
        this.promoterLength = promoterLength;
        return this;
    }

    @JsonProperty("motif_min_length")
    public Long getMotifMinLength() {
        return motifMinLength;
    }

    @JsonProperty("motif_min_length")
    public void setMotifMinLength(Long motifMinLength) {
        this.motifMinLength = motifMinLength;
    }

    public ExtractInput withMotifMinLength(Long motifMinLength) {
        this.motifMinLength = motifMinLength;
        return this;
    }

    @JsonProperty("motif_max_length")
    public Long getMotifMaxLength() {
        return motifMaxLength;
    }

    @JsonProperty("motif_max_length")
    public void setMotifMaxLength(Long motifMaxLength) {
        this.motifMaxLength = motifMaxLength;
    }

    public ExtractInput withMotifMaxLength(Long motifMaxLength) {
        this.motifMaxLength = motifMaxLength;
        return this;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperties(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public String toString() {
        return ((((((((((((((("ExtractInput"+" [workspaceName=")+ workspaceName)+", genomeRef=")+ genomeRef)+", featureSetRef=")+ featureSetRef)+", promoterLength=")+ promoterLength)+", motifMinLength=")+ motifMinLength)+", motifMaxLength=")+ motifMaxLength)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
