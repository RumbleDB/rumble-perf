from pyspark import SparkContext
import json
import time

start = int(round(time.time() * 1000))
sc = SparkContext("local[*]", "PySpark query 1")
df = sc.textFile("../../confusion-2014-03-02/confusion-2014-03-02.json", 105)
df2 = df.map(lambda x: json.loads(x))
df3 = df2.filter(lambda x: x["target"] == x["guess"] and x["target"] == "Russian")
df3.saveAsTextFile("../output1")
end = int(round(time.time() * 1000))
print((end - start),"milliseconds")
