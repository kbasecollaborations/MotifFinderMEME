
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
 * <p>Original spec-file type: discover_seq_input</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "workspace_name",
    "genome_ref",
    "SS_ref",
    "promoter_length",
    "motif_min_length",
    "motif_max_length",
    "obj_name",
    "background",
    "mask_repeats"
})
public class DiscoverSeqInput {

    @JsonProperty("workspace_name")
    private String workspaceName;
    @JsonProperty("genome_ref")
    private String genomeRef;
    @JsonProperty("SS_ref")
    private String SSRef;
    @JsonProperty("promoter_length")
    private Long promoterLength;
    @JsonProperty("motif_min_length")
    private Long motifMinLength;
    @JsonProperty("motif_max_length")
    private Long motifMaxLength;
    @JsonProperty("obj_name")
    private String objName;
    @JsonProperty("background")
    private Long background;
    @JsonProperty("mask_repeats")
    private Long maskRepeats;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("workspace_name")
    public String getWorkspaceName() {
        return workspaceName;
    }

    @JsonProperty("workspace_name")
    public void setWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
    }

    public DiscoverSeqInput withWorkspaceName(String workspaceName) {
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

    public DiscoverSeqInput withGenomeRef(String genomeRef) {
        this.genomeRef = genomeRef;
        return this;
    }

    @JsonProperty("SS_ref")
    public String getSSRef() {
        return SSRef;
    }

    @JsonProperty("SS_ref")
    public void setSSRef(String SSRef) {
        this.SSRef = SSRef;
    }

    public DiscoverSeqInput withSSRef(String SSRef) {
        this.SSRef = SSRef;
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

    public DiscoverSeqInput withPromoterLength(Long promoterLength) {
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

    public DiscoverSeqInput withMotifMinLength(Long motifMinLength) {
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

    public DiscoverSeqInput withMotifMaxLength(Long motifMaxLength) {
        this.motifMaxLength = motifMaxLength;
        return this;
    }

    @JsonProperty("obj_name")
    public String getObjName() {
        return objName;
    }

    @JsonProperty("obj_name")
    public void setObjName(String objName) {
        this.objName = objName;
    }

    public DiscoverSeqInput withObjName(String objName) {
        this.objName = objName;
        return this;
    }

    @JsonProperty("background")
    public Long getBackground() {
        return background;
    }

    @JsonProperty("background")
    public void setBackground(Long background) {
        this.background = background;
    }

    public DiscoverSeqInput withBackground(Long background) {
        this.background = background;
        return this;
    }

    @JsonProperty("mask_repeats")
    public Long getMaskRepeats() {
        return maskRepeats;
    }

    @JsonProperty("mask_repeats")
    public void setMaskRepeats(Long maskRepeats) {
        this.maskRepeats = maskRepeats;
    }

    public DiscoverSeqInput withMaskRepeats(Long maskRepeats) {
        this.maskRepeats = maskRepeats;
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
        return ((((((((((((((((((((("DiscoverSeqInput"+" [workspaceName=")+ workspaceName)+", genomeRef=")+ genomeRef)+", SSRef=")+ SSRef)+", promoterLength=")+ promoterLength)+", motifMinLength=")+ motifMinLength)+", motifMaxLength=")+ motifMaxLength)+", objName=")+ objName)+", background=")+ background)+", maskRepeats=")+ maskRepeats)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
