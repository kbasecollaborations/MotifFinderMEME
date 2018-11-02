
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
 * <p>Original spec-file type: BuildSeqIn</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "workspace_name",
    "SequenceSetRef",
    "fasta_outpath"
})
public class BuildSeqIn {

    @JsonProperty("workspace_name")
    private String workspaceName;
    @JsonProperty("SequenceSetRef")
    private String SequenceSetRef;
    @JsonProperty("fasta_outpath")
    private String fastaOutpath;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("workspace_name")
    public String getWorkspaceName() {
        return workspaceName;
    }

    @JsonProperty("workspace_name")
    public void setWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
    }

    public BuildSeqIn withWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
        return this;
    }

    @JsonProperty("SequenceSetRef")
    public String getSequenceSetRef() {
        return SequenceSetRef;
    }

    @JsonProperty("SequenceSetRef")
    public void setSequenceSetRef(String SequenceSetRef) {
        this.SequenceSetRef = SequenceSetRef;
    }

    public BuildSeqIn withSequenceSetRef(String SequenceSetRef) {
        this.SequenceSetRef = SequenceSetRef;
        return this;
    }

    @JsonProperty("fasta_outpath")
    public String getFastaOutpath() {
        return fastaOutpath;
    }

    @JsonProperty("fasta_outpath")
    public void setFastaOutpath(String fastaOutpath) {
        this.fastaOutpath = fastaOutpath;
    }

    public BuildSeqIn withFastaOutpath(String fastaOutpath) {
        this.fastaOutpath = fastaOutpath;
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
        return ((((((((("BuildSeqIn"+" [workspaceName=")+ workspaceName)+", SequenceSetRef=")+ SequenceSetRef)+", fastaOutpath=")+ fastaOutpath)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
