--GisterenIndicator
CASE WHEN CAST(DATEADD(dd, -1, GETDATE()) AS DATE) = [Datum] THEN 1 ELSE 0 END

--HuidigJaarIndicator
CASE WHEN YEAR([Datum])=YEAR(GETDATE()) THEN 1 ELSE 0 END

--HuidigJaarTmVandaagIndicator
CASE 
WHEN YEAR([Datum])=YEAR(GETDATE()) 
AND [Datum] <= GETDATE()
THEN 1 ELSE 0 END


--HuidigJaarTmVorigeWeekIndicator
CASE WHEN 
DATEADD(dd,  6, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) >= [Datum]
AND DATEPART(yy, CURRENT_TIMESTAMP) =  DATEPART(yy, [Datum])
THEN 1 
ELSE 0
END

--HuidigJaarHuidigeWeekIndicator
CASE WHEN [YearIndex] = 0 AND [WeekIndex] = 0
THEN 1
ELSE 0
END

--HuidigJaarHuidigeWeekMin1Indicator
CASE WHEN 
DATEADD(dd,  0, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) <= [Datum]
AND DATEADD(dd,  6, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) >= [Datum]
THEN 1 
ELSE 0
END


--HuidigJaarHuidigeWeekMin2Indicator
CASE WHEN 
DATEADD(dd,  0, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) <= DATEADD(dd, 7, [Datum])
AND DATEADD(dd,  6, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) >= DATEADD(dd, 7, [Datum])
THEN 1 
ELSE 0
END


--HuidigJaarHuidigeWeekMin3Indicator
CASE WHEN 
DATEADD(dd,  0, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) <= DATEADD(dd, 14, [Datum]) 	AND DATEADD(dd,  6, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) >= DATEADD(dd, 14, [Datum])
THEN 1 
ELSE 0
END

--HuidigJaarHuidigeWeekMin4Indicator
CASE WHEN 
DATEADD(dd,  0, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) <= DATEADD(dd, 21, [Datum]) 	AND DATEADD(dd,  6, DATEADD(ww, DATEDIFF(ww, 0, DATEADD(dd, -1, CURRENT_TIMESTAMP)) - 1, 0)) >= DATEADD(dd, 21, [Datum])
THEN 1 
ELSE 0
END


--HuidigJaarHuidigeWeekPlus1Indicator
CASE WHEN 
dateadd(day, 2-datepart(dw, getdate()), CONVERT(date,getdate())) <= DATEADD(dd, -7, [Datum])
AND dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate())) >= DATEADD(dd, -7, [Datum])
THEN 1 
ELSE 0
END


--HuidigJaarMin1HuidigeWeekIndicator
CASE WHEN 
		dateadd(day, 2-datepart(dw, dateadd(week, -52, getdate())), CONVERT(date,dateadd(week, -52, getdate()))) <= [Datum]
		AND dateadd(day, 8-datepart(dw, dateadd(week, -52, getdate())), CONVERT(date,dateadd(week, -52, getdate()))) >= [Datum]
		THEN 1 ELSE 0 END
		
		

--HuidigJaarMin1HuidigeWeekPlus1Indicator
CASE WHEN 
		dateadd(day, 2-datepart(dw, dateadd(week, -51, getdate())), CONVERT(date,dateadd(week, -51, getdate()))) <= [Datum]
		AND dateadd(day, 8-datepart(dw, dateadd(week, -51, getdate())), CONVERT(date,dateadd(week, -51, getdate()))) >= [Datum]
		THEN 1 ELSE 0 END


--VandaagIndicator
CASE WHEN CAST(GETDATE() AS DATE) = [Datum] THEN 1 ELSE 0 END

--VorigeMaandIndicator
CASE WHEN YEAR([Datum])=YEAR(GETDATE())-1 AND MONTH([Datum]) = MONTH(DATEADD(MONTH,-1,GETDATE())) THEN 1 ELSE 0 END


--VorigJaarIndicator
CASE WHEN YEAR([Datum])=YEAR(GETDATE())-1 THEN 1 ELSE 0 END


--VorigJaarTmVandaagIndicator
CASE 
WHEN YEAR([Datum])=YEAR(GETDATE()) - 1
AND [Datum] <= DATEADD(year, -1, GETDATE())
THEN 1 ELSE 0 END

+++++++++++++++++++++++++++++++++



AND

 

datefromparts(

datepart(yy, [DateValue])

,datepart(mm, [DateValue])

,1)

< 

datefromparts(

datepart(yy, getdate() )

,datepart(mm, getdate() )

,1)

 

 

 

--IsLastFull12Months

datefromparts(

datepart(yy, [DateValue])

,datepart(mm, [DateValue])

,1)

< 

datefromparts(

datepart(yy, getdate() )

,datepart(mm, getdate() )

,1)

 

AND

 

datefromparts(

datepart(yy, [DateValue])

,datepart(mm, [DateValue])

,1)

>=

datefromparts(

datepart(yy, dateadd(mm, -12, getdate()) )

,datepart(mm, dateadd(mm, -12, getdate()) )

,1)

 

--IsMonthBeforeLast

[DateValue]

>=

datefromparts(

datepart(yy, dateadd(mm, -2, getdate() ) )

,datepart(mm, dateadd(mm, -2, getdate() ) )

,1)

 

[DateValue]

< 

datefromparts(

datepart(yy, dateadd(mm, -1, getdate() ) )

,datepart(mm, dateadd(mm, -1, getdate() ) )

,1)

 

 

--IsPreviousMonth

 

[DateValue]

>=

datefromparts(

datepart(yy, dateadd(mm, -1, getdate() ) )

,datepart(mm, dateadd(mm, -1, getdate() ) )

,1)

 

[DateValue]

< 

datefromparts(

datepart(yy, getdate() )

,datepart(mm, getdate() )

,1)

 

--YearMonthNameShort

cast([Year] as varchar(50)) + ' ' + left([MonthName], 3)

 

--MonthNameShortYear

left([MonthName], 3) + ' ' + cast([Year] as varchar(50))


--+++++++++++++++++++++++++++++++++++

--GoldenNumber
[Year]%19

--Year/100
[Year]/100


--DaysSinceNewMoon
([Year/100]-([Year/100]/4)-((8*[Year/100]+13)/25)+(19*[GoldenNumber])+15)%30


--DaysSinceMarch21&PaschalFullMoon
([DaysSinceNewMoon]-(([DaysSinceNewMoon]/28)*(1-29/([DaysSinceNewMoon]+1)))*((21-[GoldenNumber])/11))

--PaschalFullMoonDay
([Year]+([Year]/4)+[PaschalFullMoonDay]+2-[Year/100]+([Year/100]/4))%7

--DaysBetweenMarch&Paschal
[DaysSinceMarche21&PaschalFullMoon]-[PaschalFullMoonDay]

--EasterMonth
3+(([DaysBetweenMarch&Paschal]+40)/44)

--Easter
[DaysBetweenMarch&Paschal]+28-31*([EasterMonth]/4)


--Easter Date
CAST(CAST([Year] AS CHAR)+'-'+CAST([EasterMonth] AS CHAR) +'-' +  CAST([Easter] AS CHAR) AS DATE)

--Easter Monday
DATEADD(dd, 1, [Easter Date])

--Whit Sunday
DATEADD(dd, 49, [Easter Date])

--Whit Monday
DATEADD(dd, 50, [Easter Date])

--Ascension Day
DATEADD(dd, 39, [Easter Date])
