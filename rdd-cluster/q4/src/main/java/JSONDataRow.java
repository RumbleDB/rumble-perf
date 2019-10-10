import org.json.JSONArray;

import java.io.Serializable;
import java.util.ArrayList;

public class JSONDataRow implements Serializable {
    private String guess;
    private String target;
    private String country;
    private ArrayList<String> choices;
    private String sample;
    private String date;

    public JSONDataRow(String guess, String target, String country, JSONArray choices, String sample, String date) {
        this.guess = guess;
        this.target = target;
        this.country = country;

        this.sample = sample;
        this.date = date;

        ArrayList<String> cho = new ArrayList<>();
        for (int i = 0; i < choices.length(); i++) {
            cho.add(choices.getString(i));
        }
        this.choices = cho;
    }

    public String getSample() {
        return sample;
    }

    public void setSample(String sample) {
        this.sample = sample;
    }

    public String getGuess() {
        return guess;
    }

    public void setGuess(String guess) {
        this.guess = guess;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public ArrayList<String> getChoices() {
        return choices;
    }

    public void setChoices(ArrayList<String> choices) {
        this.choices = choices;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("{guess:\"");
        sb.append(this.guess);
        sb.append("\", target:\"");
        sb.append(this.target);
        sb.append("\", country:\"");
        sb.append(this.country);
        sb.append("\", choices: [");
        for (int i = 0; i < this.choices.size(); i++) {
            sb.append("\"");
            sb.append(this.choices.get(i));
            if(i != this.choices.size() -1) {
                sb.append("\", ");
            }
        }
        sb.append("\"]");
        sb.append(", sample:\"");
        sb.append(this.sample);
        sb.append("\", date:\"");
        sb.append(this.date);
        sb.append("\"}");

        return sb.toString();
    }

}