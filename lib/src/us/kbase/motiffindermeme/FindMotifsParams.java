
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
 * <p>Original spec-file type: find_motifs_params</p>
 * <pre>
 * SS_ref - optional, used for exact genome locations if possible
 * </pre>
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "workspace_name",
    "fastapath",
    "motif_min_length",
    "motif_max_length",
    "SS_ref",
    "obj_name"
})
public class FindMotifsParams {

    @JsonProperty("workspace_name")
    private String workspaceName;
    @JsonProperty("fastapath")
    private String fastapath;
    @JsonProperty("motif_min_length")
    private Long motifMinLength;
    @JsonProperty("motif_max_length")
    private Long motifMaxLength;
    @JsonProperty("SS_ref")
    private String SSRef;
    @JsonProperty("obj_name")
    private String objName;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("workspace_name")
    public String getWorkspaceName() {
        return workspaceName;
    }

    @JsonProperty("workspace_name")
    public void setWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
    }

    public FindMotifsParams withWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
        return this;
    }

    @JsonProperty("fastapath")
    public String getFastapath() {
        return fastapath;
    }

    @JsonProperty("fastapath")
    public void setFastapath(String fastapath) {
        this.fastapath = fastapath;
    }

    public FindMotifsParams withFastapath(String fastapath) {
        this.fastapath = fastapath;
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

    public FindMotifsParams withMotifMinLength(Long motifMinLength) {
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

    public FindMotifsParams withMotifMaxLength(Long motifMaxLength) {
        this.motifMaxLength = motifMaxLength;
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

    public FindMotifsParams withSSRef(String SSRef) {
        this.SSRef = SSRef;
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

    public FindMotifsParams withObjName(String objName) {
        this.objName = objName;
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
        return ((((((((((((((("FindMotifsParams"+" [workspaceName=")+ workspaceName)+", fastapath=")+ fastapath)+", motifMinLength=")+ motifMinLength)+", motifMaxLength=")+ motifMaxLength)+", SSRef=")+ SSRef)+", objName=")+ objName)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
