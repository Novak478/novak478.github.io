---
title: "Useful Scala Functions"
layout: post
date: date
projects: true
tag:
- tech
- programming
- bigdata
- scala
category: project
author: zacknovak
description: Scala functions that I realized I will probably want to keep and reference at a later date. 
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

## How to use this page

Hit CTRL+F and do your best. This is not currently organized in any particular way.
---

## 


Lesson from https://medium.com/@manuzhang/the-hidden-cost-of-spark-withcolumn-8ffea517c015:
The post basically states that each time you create a new column using `withColumn`, you are creating a new dataframe each iteration as Spark's Catalyst optimizer is analyzing that individual row and creating a new df (so, 1000 rows, 1000 dataframes). The post goes on to say how the author checked out the code within the optimizer and found a way to do what withColumn would have done but by only creating one new df (with a huge speed increase!). I've been playing around with it yesterday, and found the syntax here is a little easier to use/understand than the post's example! I use `WithColumn` a lot to call custom UDFs or to transform a column's datatype so I figured this was important to learn.
```scala
import org.apache.spark.sql.types.{StringType, IntegerType, DateType}
import org.apache.spark.sql.functions._
val exNew = ex.select(ex.columns.map { col =>
  if (col == "hour") { ex(col).cast(IntegerType)} 
  else if (col == "day") { ex(col).cast(DateType)}
  else { ex(col).cast(StringType)}
}: _*)

```


Yield a new array when if condition is met
```scala
//test
val a = Array(1, 2, 3, 4, 5)
for (e <- a if e > 2) yield e
//res1: Array[Int] = Array(3, 4, 5)

```

Change a string to timestamp without changing tz
```scala
import java.text.SimpleDateFormat
import java.sql.Timestamp
import java.util.Calendar

val convertToTimestamp= (logTimestamp: String) => {
  try {
    val sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ") //test with something like 2019-06-02T01:25:56.965+0000
    val theDate = sdf.parse(logTimestamp)
    new Timestamp(theDate.getTime)
  } catch {
    case _: Exception => null
  }
}

def convertToTimestampUDF = udf(convertToTimestamp)
val newDf = oldDf
  .withColumn("dtTs", convertToTimestampUDF($"stringDate"))
```



Change a timestamp from one tz to another
```scala
import java.text.SimpleDateFormat
import java.sql.Timestamp
import java.util.Calendar
import java.util.TimeZone

val convertToEst = (logTimestamp: String) => {
  try {
    val tzid = "EST";
    val tz = TimeZone.getTimeZone(tzid);
    val sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ") //2019-06-02T01:25:56.965+0000
    val theDate = sdf.parse(logTimestamp)
    val format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
    // format date in target timezone
    format.setTimeZone(tz);
    format.format(theDate)
  } catch {
    case _: Exception => null
  }
}

def convertToTimestampEstUDF = udf(convertToEst)

val newDf = oldDf
  .withColumn("dtTs", convertToTimestampEstUDF($"stringDate"))
```

get week number from date
```scala
import java.text.SimpleDateFormat
import java.sql.Timestamp
import java.util.Calendar
import java.util.TimeZone

val getWeek = (dateString: String) => {
  val input = dateString
  val format = "yyyy-MM-dd"

  val df = new SimpleDateFormat(format)
  val date = df.parse(input)

  val cal = Calendar.getInstance()
  cal.setTime(date)
  val dayOfWeek = cal.get(Calendar.DAY_OF_WEEK)
  dayOfWeek
}
val getWeekUDF = udf(getWeek)

val newDf = oldDf
  .withColumn("dayOfWeek", getWeekUDF($"txnDate"))
```

Get individual dates between two dates
```scala
import java.text.SimpleDateFormat
import java.sql.Timestamp
import java.util.Calendar
import java.util.TimeZone

val startDate = "2019-07-01"
val endDate = "2019-07-30"

var dates: Array[String] = null 

def getNextDay(date: String): String = {
  val formatter = new java.text.SimpleDateFormat("yyyy-MM-dd")
  val cal = java.util.Calendar.getInstance()
  cal.setTime(formatter.parse(date))
  cal.add(java.util.Calendar.DATE, 1)
  return formatter.format(cal.getTime())
}

def getDates(startDate: String, inclusiveEndDate: String): Seq[String] = {
  import scala.collection.mutable.ArrayBuffer
  var dates = ArrayBuffer[String]()
  var currDate = startDate
  while (currDate != getNextDay(inclusiveEndDate)) {
    dates += currDate
    currDate = getNextDay(currDate)
  }
  return dates
}

if (dates == null || dates.length == 0) {
  dates = getDates(startDate, endDate).toArray
}
```

Reading in day one day at at a time and avoiding using spark sql.
```scala
import org.apache.spark.sql.functions._
import spark.implicits._
case class KV(datetimestamp: Timestamp, service: String, id: string)
var basedf = Seq.empty[KV].toDF

for (date <- dates) {
  try {
    val s3FileLocation = s"s3a://s3bucket/subbucket/txndate=$date/*"
    val daysDf = spark.read.parquet(s3FileLocation).select($"datetimestamp", $"service", $"id")
    basedf = daysDf.union(basedf)
      } catch {
      case e: Exception => println(s"Error occurred while attempting to read in data from date [$date]")
                           e.printStackTrace
    }
  }

```


Checking to make sure that one date is after the other
```scala
//Check to make sure startDate is less than endDate
var dateGreateCheck = false

if (startDateUsed.equals(true) && endDateUsed.equals(true)) {
  val sdfCheck = new SimpleDateFormat("yyyy-MM-dd") //	2019-07-18 13:02:15,147
  var theDateCheck = sdfCheck.parse(endDate)
  val endDateCheck = new Timestamp(theDateCheck.getTime)
  println(endDateCheck)

  theDateCheck = sdfCheck.parse(startDate)
  val startDateCheck = new Timestamp(theDateCheck.getTime)
  println(startDateCheck)
  
  if (endDateCheck.after(startDateCheck)) {
    dateGreateCheck = true
  } else {
    println("!!!! endDate is before startDate !!!!")
  }
}
```

Replacing nulls 
```scala
val naFunctionsRollup = rollupLogsDf.na
val rolluplogsCleaned_df = naFunctionsRollup.fill("0")
val rollupWithDtTsDf = rolluplogsCleaned_df
```

Write to elasticsearch
```scala
import org.elasticsearch.spark._
import org.elasticsearch.spark.sql._

//write to elasticsearch index
EsSparkSQL.saveToEs(df,"es/index", 
                        Map("es.mapping.id" -> "id",
                          "es.batch.write.retry.count" -> "10",
                          "es.batch.write.retry.wait" -> "30s",
                          "es.write.operation" -> "index",
                          "es.nodes.wan.only" -> "true", 
                          "es.nodes" -> "es.node.ip.address")) //only write to one master node 
```

Import json data and clean up column names
```scala
import org.apache.spark.sql.types._

val schema = new StructType()
  .add("ID", IntegerType)
  .add("Other_ID", StringType)
  .add("Source", StringType)
  .add("Name", StringType)

val originalJsonDF = spark.read.schema(schema).option("mode", "DROPMALFORMED").json("s3a://bucket/subbucket/StaticFiles/jsondata.json")
val newJsonDf = originalJsonDF.toDF(originalJsonDF.columns map(_.toLowerCase):_*)
```

Checking to see if a value is in a list and summing up results
```scala
val isOther = udf((column: String) => {
  if (Seq("Y", "N", "U").exists(x => x == column)) 0 else 1
})

var aggData = subsetData
  .groupBy($"txndate")
  .agg(
    sum(lit(1)) as "TotalTxns", 
    sum(isOther($"otherStatus")) as "OtherStatusCount")
```

Flatten schema to remove nested structs and turn into a beautiful flattened df.
```scala
import org.apache.spark.sql.types.{DataType, StructType}
import org.apache.spark.sql.{DataFrame, Column}
import org.apache.spark.sql.functions.col

//////////////////////// Flatten schema ////////////////////////
implicit class DataFrameHelpers(df: DataFrame) {
  def flattenSchema: DataFrame = {
    df.select(flattenStructs(Nil, df.schema): _*)
  }
  def removeColPrefix(prefix: String): DataFrame = {
    df.select(df.columns.map(c => col(c).as(c.replaceFirst(prefix,""))): _*)
  }
}

protected def flattenStructs(path: Seq[String], schema: DataType): Seq[Column] = schema match {
  case s: StructType => s.fields.flatMap(f => flattenStructs(path :+ f.name, f.dataType))
  case other => col(path.map(n => s"`$n`").mkString(".")).as(path.mkString("_")) :: Nil
}
```

take a json on a single line and make it multiple lines (essentially pretty print)
```scala
val thisFrame = spark.read.textFile(s"$source/$todayLastHour")
//convert to single lines
val jsonStringDF = thisFrame.map(txt => txt.replace("}{", "}\n{")).flatMap(line => line.split("\n"))
```

extract json elements from json string using regex
```scala
def getSubStringGroupOrgUnit(pattern: String) = udf((request: String) => {
  val patternRegex = pattern.r
  patternRegex.findFirstIn(request).map(Array(_)).getOrElse(Array("null"))
})

val base = """id":"(.*?)"""
val patternOrg = s"${'"'}$base${'"'}"                                                                  
val basedfWithOrgUnit = basedf.select("*")
  .withColumn("patternMatchGroups", getSubStringGroupOrgUnit(patternOrg)($"request"))
  .withColumn("idextracted", $"patternMatchGroups".getItem(0))                                
  .drop("patternMatchGroups")

```

How to use `from_json` function
```scala
import org.apache.spark.sql._
val newDf = oldDf
  .select(from_json($"jsonStr", schema).alias("listRequest"), $"datetimestamp")
  .flattenSchema
  .removeColPrefix("listRequest_")
```

How to use when / otherwise syntax
```scala
val payloadPredict = payloadOnly
  .withColumn("newCol", when($"oldCol".isNull, s"EMPTY").otherwise(s"USED"))
```

How to conditionally yield values from a sequence (Scala)
Problem: I have 2 dataframes and need to determine all date/hour pairs for all hours whch saw count discrepancies between dataframes. I do not want to use a mutable array buffer to accomplish this task.
Solution: Instead of using a mutable array and appending to it whenever a count mismatch is detected in the loop, create the loop with the count mismatch condition directly on the loop and then yield the values.
```scala
// OLD WAY, APPENDS TO AN MUTABLE ARRAY
import scala.collection.mutable.ArrayBuffer
val badDateHours = new ArrayBuffer[(String, String)]
for ((txnDt, hour) <- txnDatesAndHours) {
  if (getCount(s3data, txnDt, hour) != getCount(redshiftData, txnDt, hour)) {
    badDateHours += ((txnDt, hour))
  }
}
 
// NEW WAY, BAD DATES COLLECTED INTO IMMUTABLE SEQUENCE
val badDateHours = for ((txnDt, hour) <- txnDatesAndHours if (getCount(s3data, txnDt, hour) != getCount(redshiftData, txnDt, hour))) yield ((txnDt, hour))
```

Assign multiple values in a single statement (Scala)
Problem: I need to initialize multiple values at once
Solution: Use tuples to initialize up to 22 values in a single line
```scala
// these 4 new values are instantiated and assigned the values of emailStats's properties:
val (emailTotalCount, emailValidCount, emailInvalidCount, emailMissingCount) = (myEmailStats.TotalCount, myEmailStats.ValidCount, myEmailStats.InvalidCount, myEmailStats.MissingCount)
```

Window.partitionBy (Spark using Scala) with row_number
Note: row_number: Returns a unique number for each row starting with 1. For rows that have duplicate values, numbers are arbitrarily assigned.
Problem: I need to get X records having highest (or lowest) column value for a given identifier
Solution: Use row_number over a Window.partitionBy on the grouping identifier having an orderBy on the column, filtering so the row number is equal to or less than X. Drop the row_number from the results.
```scala
import org.apache.spark.sql.functions._
import org.apache.spark.sql.functions.row_number
import org.apache.spark.sql.expressions.Window
 
// Get the 5 records having highest Amount for each MerchantId
val topFiveRecordsPerMerchant = myMerchantTxnData.toDF().withColumn("rn", row_number.over(Window.partitionBy($"MerchantId").orderBy($"Amount".desc))).where($"rn" <= 5).drop("rn")
```

replace null with etc. Spark doesn't work with nulls super well, so replacing them early with a value like 0 speeds up processing.
```scala
val naFunctionsRollup = rollupLogsDf.na
val rolluplogsCleaned_df = naFunctionsRollup.fill("0")
val rollupWithDtTsDf = rolluplogsCleaned_df

```

nested json struct. Note that you must place your most nested structs (work inside out from the struct).
```scala
val USDAmountSchema = new StructType()
  .add($"USD".string)

val ScoreSchema = new StructType()
  .add($"Lower".string)
  .add($"Upper".string)

val FiltersSchema = new StructType()
  .add($"AcctNumber".string)
  .add($"Status".string)
  .add($"Type".string)
  .add($"EndDateTime".string)
  .add($"LocalAmountCurrency".string)
  .add($"MerchantName".string)
  .add($"TransactionId".string)
  .add("USDAmount",USDAmountSchema)

val PayloadSchema = new StructType()
  .add($"FileFormat".string)
  .add("Filters",FiltersSchema)
  .add($"PageNumber".string)
  .add($"ResultEndIndex".string)
  .add($"ResultStartIndex".string)

val schema = new StructType()
.add("Payload",PayloadSchema)
.add($"SessionId".string)
.add($"Timestamp".string)
.add($"TransactionId".string)

schema.printTreeString
```

grab dates from a timestamp
```scala
val dfWithDates = dfWithOnlyTimestamp
  .withColumn("txnDate", date_format($"tsField", "yyyy-MM-dd"))
  .withColumn("txnHour", date_format($"tsField", "HH"))
```

How to union 2 dataframes who do not have same number of columns (Spark with Scala)

Problem: I need to union 2 dataframes together, but they do not necessarily share the same number of columns. Spark will throw an error if the dataframes have a different number of columns, so we need to prevent this.

Solution: Determine the set of all columns combined from both dataframes, then use this to append all missing columns as null to both dataframes prior to calling union.
```scala
import org.apache.spark.sql.DataFrame
import org.apache.spark.sql.functions.{lit, col}
def unionRegardlessOfColumns(df1: DataFrame, df2: DataFrame): DataFrame = {
  val cols1 = df1.columns.toSet
  val cols2 = df2.columns.toSet
  val allcolumns = cols1 ++ cols2
   
  def nullsForMissings(dfCols: Set[String], allCols: Set[String]) = {
    allCols.toList.map(x => x match {
      case x if dfCols.contains(x) => col(x)
      case _ => lit(null).as(x)
    })
  }
  return df1.select(nullsForMissings(cols1, allcolumns): _*).union(df2.select(nullsForMissings(cols2, allcolumns): _*))
}
```

How to filter by a list of multiple columns (Spark with Scala): e.g. filter by list of PID/MIDs

Problem: I have a list of tuples of #1ids and #2ids combinations that I need to use to filter my data.
Solution: Use the Spark function concat_ws to concatinate column values and filter this against all of the tuples in the list mapped to also be concatenated values.
```scala
val listOfColumnsTest = Seq(
                      ("142", "abc"),
                      ("141", "def"),
                      ("140", "ghj"),
                      ("139", "xvy")
                  )
 
import org.apache.spark.sql.functions.concat_ws
 
// concat_ws's first argument is separator between values, we're just using empty string here
val filteredData = df.filter(concat_ws("", $"column1", $"column2").isin(listOfColumnsTest.map{ tuple => tuple._1 + tuple._2}: _*))
```

How to add a cumulative total column to a DataFrame
```scala
import org.apache.spark.sql.expressions.Window
val centinelCurrByHourCumulative = centinelCurrByHour
    .withColumn("const", lit(1.toString))
    .withColumn("total_cumulative", sum($"totaltxns")
    .over(
        Window.partitionBy("const").orderBy($"hour".asc).rowsBetween(Window.unboundedPreceding, Window.currentRow))
    ).drop("const")
```