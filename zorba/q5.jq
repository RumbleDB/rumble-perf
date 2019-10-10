import module namespace file = "http://expath.org/ns/file";

for $o in parse-json(file:read-text("../confusion-2014-03-02/confusion-2014-03-02.json"))
group by $c := $o.country, $l := $o.target
return {
    "country" : $c,
    "language" : $l,
    "count": count($o)
}
