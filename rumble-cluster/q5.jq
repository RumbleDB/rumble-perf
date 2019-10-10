for $o in json-file("hdfs:///user/hadoop/confusion-2014-03-02-*.json")
group by $c := $o.country, $l := $o.target
return {
    "country" : $c,
    "language" : $l,
    "count": count($o)
}