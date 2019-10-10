for $o in json-file("hdfs:///user/hadoop/confusion-2014-03-02-*.json")
let $t := $o.target
let $g := $o.guess
where $t eq $g
order by $t, $o.country descending, $o.date descending
return $o