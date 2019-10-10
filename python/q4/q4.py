from pyspark import SparkContext
import json
from Key import Key
import time

start = int(round(time.time() * 1000))
sc = SparkContext("local[*]", "PySpark query 4")
df = sc.textFile("../../confusion-2014-03-02/confusion-2014-03-02.json", 105)
df2 = df.map(lambda x: json.loads(x))
df3 = df2.filter(lambda x: x["target"] == x["guess"])
df4 = df3.map(lambda x: (Key(x["target"], x["country"], x["date"]), x))
df5 = df4.sortByKey(True)
df6 = df5.map(lambda x: json.dumps(x[1]))
df6.saveAsTextFile("../output4")
end = int(round(time.time() * 1000))
print((end - start),"milliseconds")
