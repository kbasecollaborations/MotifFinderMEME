
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
 * <p>Original spec-file type: discover_fasta_input</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "workspace_name",
    "fasta_path"
})
public class DiscoverFastaInput {

    @JsonProperty("workspace_name")
    private String workspaceName;
    @JsonProperty("fasta_path")
    private String fastaPath;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("workspace_name")
    public String getWorkspaceName() {
        return workspaceName;
    }

    @JsonProperty("workspace_name")
    public void setWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
    }

    public DiscoverFastaInput withWorkspaceName(String workspaceName) {
        this.workspaceName = workspaceName;
        return this;
    }

    @JsonProperty("fasta_path")
    public String getFastaPath() {
        return fastaPath;
    }

    @JsonProperty("fasta_path")
    public void setFastaPath(String fastaPath) {
        this.fastaPath = fastaPath;
    }

    public DiscoverFastaInput withFastaPath(String fastaPath) {
        this.fastaPath = fastaPath;
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
        return ((((((("DiscoverFastaInput"+" [workspaceName=")+ workspaceName)+", fastaPath=")+ fastaPath)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
