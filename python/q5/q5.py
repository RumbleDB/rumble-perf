from pyspark import SparkContext
import json
from Key import Key
import time

start = int(round(time.time() * 1000))
sc = SparkContext("local[*]", "PySpark query 5")
df = sc.textFile("../../confusion-2014-03-02/confusion-2014-03-02.json", 105)
df2 = df.map(lambda x: json.loads(x))
df4 = df2.map(lambda x: (Key(x["target"], x["country"]), 1))
df5 = df4.reduceByKey(lambda x, y: x + y)
df6 = df5.map(lambda x: json.dumps(dict(country=x[0]._country, target=x[0]._target, count=x[1])))
df6.saveAsTextFile("../output5")
end = int(round(time.time() * 1000))
print((end - start),"milliseconds")
