
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
 * <p>Original spec-file type: BuildSeqOut</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "fasta_outpath"
})
public class BuildSeqOut {

    @JsonProperty("fasta_outpath")
    private String fastaOutpath;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("fasta_outpath")
    public String getFastaOutpath() {
        return fastaOutpath;
    }

    @JsonProperty("fasta_outpath")
    public void setFastaOutpath(String fastaOutpath) {
        this.fastaOutpath = fastaOutpath;
    }

    public BuildSeqOut withFastaOutpath(String fastaOutpath) {
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
        return ((((("BuildSeqOut"+" [fastaOutpath=")+ fastaOutpath)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
