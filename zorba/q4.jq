import module namespace file = "http://expath.org/ns/file";

for $o in parse-json(file:read-text("../confusion-2014-03-02/confusion-2014-03-02.json"))
let $t := $o.target
let $g := $o.guess
where $t eq $g
order by $t, $o.country descending, $o.date descending
return $o