JDate
=====

Javascript Date class implementation for Jalali calendar

The library contains a `JDate` class that is implements API of orignal `Date` class, but operates in Jalali calendar.


	>>> j = new JDate
	>>> j.toLocaleString()
	"1393/04/25 14:51:21"

Underlying date object can be accessed via `_date` attribute;

	>>> d = j._date
	>>> d instanceof Date
	true
	>>> d.toString()
	"Wed Jul 16 2014 14:51:21 GMT+0430 (IRDT)"

Usage
-----
jdate.min.js is minified version of calendar.js and jdate-class.js.

	<script src="jdate.min.js"></script>


Initializing a JDate object
-----
Like original Date class, JDate class can be intialized in various ways.

NOTE: unlike Date, JDate cannot be used a function (without new keyword). Original Date class returns the string
representation of date, if called as a function.

Initilize to now, if no argument is provided

	>>> j = new JDate

Initialize to another `Date` or `JDate` instance.

	>>> d = new Date(2014, 2, 15)
	>>> j = new JDate(d)
	>>> j.toLocaleString()
	"1392/12/24 00:00:00"
	>>> j2 = new JDate(j)
	>>> j2.toLocaleString()
	"1392/12/24 00:00:00"

Initialize to numeric values

	>>> d = new Date(2014, 3, 25)
	>>> d.valueOf()
	1398367800000
	>>> j = new JDate(d.valueOf())
	>>> j.toLocaleString()
	"1393/02/05 00:00:00"
	>>> j.valueOf()
	1398367800000

Parse a date string (ISO8601 dates and similar local formats accepted).

	>>> new JDate('1392/2/5').toLocaleString()
	"1393/02/05 00:00:00"
	>>> new JDate('1392').toLocaleString() // Interpreted as ISO8601 UTC date
	"1392/01/01 03:30:00"
	>>> new JDate('1392-02').toLocaleString() // Interpreted as ISO8601 UTC date
	"1392/02/01 04:30:00"
	>>> new JDate('1392/02').toLocaleString() // Interpreted as local date
	"1392/02/01 00:00:00"
	>>> new JDate('1392-02-05 12:31').toLocaleString() //  local date
	"1392/02/05 12:31:00"
	>>> new JDate('1392-02-05T12:31Z').toLocaleString() //  ISO8601 UTC date
	"1392/02/05 17:01:00"
	new JDate('1392-02-05T09:10:01-0230').toLocaleString()  // ISO8601 with fixed timezone
	"1392/02/05 11:10:01"

Construct with year/month(/day/hour/minute/second/millesecond). NOTE that like `Date` class, month parameter is 0-based
(0-11), and day is 1-based (1-31).

	>>> new JDate(1392, 2).toLocaleString()
	"1393/03/01 00:00:00"
	>>> new JDate(1392, 2, 3).toLocaleString()
	"1393/03/03 00:00:00"
	>>> new JDate(1392, 2, 3, 17).toLocaleString()
	"1393/03/03 17:00:00"

JDate class methods
------
Like `Date` class `JDate` have these class methods: now, UTC, parse

`JDate.now` returns current time as number, and is exactly same as `Date.now` (It's return value does not depends on
calendar being used)

`JDate.UTC` can be used to convert jalali dates (in UTC time) to numeric value:

	>>> JDate.UTC(1393, 2, 3, 17, 19)
	1400951940000
	>>> new JDate('1393-03-03T17:19+0000').getTime()
	1400951940000

`JDate.parse` converts jalali string dates to numeric values and is defined by `new JDate(str).getTime()`
 

JDate instance methods
-------

`JDate` instances have nearly all methods `Date` class have.

Time methods inherited from Date class directly (getHours getMilliseconds getMinutes getSeconds getTime getUTCDay
getUTCHours getTimezoneOffset getUTCMilliseconds getUTCMinutes getUTCSeconds setHours setMilliseconds setMinutes
setSeconds setTime setUTCHours setUTCMilliseconds setUTCMinutes setUTCSeconds toTimeString)

ToString methods except toLocaleString (toDateString toISOString toJSON toString toLocaleDateString toLocaleTimeString
toUTCString) is also inherited from Date class and represent Gregorian dates.

	>>> j = new JDate(1393, 2, 15, 17, 19)
	>>> j.toLocaleString()
	"1393/04/15 17:19:00"
	>>> j._date.toString()
	"Sun Jul 06 2014 17:19:00 GMT+0430 (IRDT)"

	>>> j.getFullYear()
	1393
	>>> j.getMonth()
	2
	>>> j.getDate()
	15

	>>> j.setMonth(1)
	>>> j.toLocaleString()
	"1393/02/15 17:19:00"
	>>> j._date.toString()
	"Mon May 05 2014 17:19:00 GMT+0430 (IRDT)"

	>>> j.setFullYear(1391)
	>>> j.toLocaleString()
	"1391/02/15 17:19:00"
	>>> j._date.toString()
	"Fri May 04 2012 17:19:00 GMT+0430 (IRDT)"

Usecase: highcharts
------

This `JDate` is compatible with original javascript `Date` class and can bring Jalali calendar support to libraries
without any knowledge of this calendar.

One sample is highcharts (or highstock): [Jalali date for highcharts demo](http://tahajahangir.github.io/jdate/jalali-highcharts-demo.html)
![Jalali date for highcharts](http://tahajahangir.github.io/jdate/highstock-demo.png)
