for $o in jn:json-doc("../confusion-2014-03-02/small.json")
where $o("target") eq $o("guess") and $o("target") eq "Russian"
return $o

