import org.json.JSONArray;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class JSONDataRow implements Serializable, Comparable<JSONDataRow> {
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

    /*
        Compares 2 JSONDataRows. In aggregation TreeSets are used which don't allow duplicate elements.
        Perform full comparison of 2 JSONDataRows.
     */
    @Override
    public int compareTo(JSONDataRow o) {
        Integer compareDate = this.date.compareTo(o.date);
        if (compareDate != 0) {
            return compareDate;
        } else {
            Integer compareSample = this.sample.compareTo(o.sample);
            if (compareSample != 0) {
                return compareSample;
            } else {
                Integer compareCountry = this.country.compareTo(o.country);
                if (compareCountry != 0) {
                    return compareCountry;
                } else {
                    Integer compareTarget = this.target.compareTo(o.target);
                    if (compareTarget != 0) {
                        return compareTarget;
                    } else {
                        Integer compareGuess = this.guess.compareTo(o.guess);
                        if (compareGuess != 0) {
                            return compareGuess;
                        } else {
                            Boolean compareChoices = equalLists(this.choices, o.choices);
                            if (compareChoices == true) {
                                return 0;
                            } else {
                                return 1;
                            }
                        }
                    }
                }
            }
        }
    }

    /**
     * Helper method for comparing two lists for equality
     * @param one
     * @param two
     * @return returns true if lists are equal, false otherwise
     */
    public boolean equalLists(List<String> one, List<String> two){
        if (one == null && two == null){
            return true;
        }

        if((one == null && two != null)
                || one != null && two == null
                || one.size() != two.size()){
            return false;
        }

        //to avoid messing the order of the lists we will use a copy
        //as noted in comments by A. R. S.
        one = new ArrayList<String>(one);
        two = new ArrayList<String>(two);

        Collections.sort(one);
        Collections.sort(two);
        return one.equals(two);
    }
}