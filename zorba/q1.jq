import module namespace file = "http://expath.org/ns/file";

parse-json(file:read-text("../confusion-2014-03-02/confusion-2014-03-02.json"))[$$.target eq $$.guess and $$.target eq "Russian"]

