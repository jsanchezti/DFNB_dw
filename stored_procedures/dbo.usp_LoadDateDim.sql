USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadDateDim]    Script Date: 11/17/2019 6:06:29 PM ******/
DROP PROCEDURE [dbo].[usp_LoadDateDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadDateDim]    Script Date: 11/17/2019 6:06:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--CREATE PROCEDURE [dbo].[usp_LoadDateDim] (@v_num_years as INT)
CREATE PROCEDURE [dbo].[usp_LoadDateDim] (@v_num_days as INT)
AS
BEGIN
/*****************************************************************************************************************
NAME:    dbo.usp_LoadDateDim
PURPOSE: Load the Date Dimension table

SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/17/2019   JJAUSSI      1. Built this starter script for LDS BC IT 243
1.1       03/20/2021   JSANCHEZ     1. Enhance with @v_num_days for better precision

RUNTIME: 
1 sec

NOTES: 
Load the Date Dimension - inspired by the Kimball Group's Calendar Date Dimension

Example usage...

EXEC dbo.usp_LoadDateDim 250;


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

-- Q1: Where to get the sample data from?
-- A1: Here it is...dump it to Excel > Date Dimension - sample v1.0.xlsx

--SELECT d.*
--  FROM RPT.dbo.datedim AS d
-- WHERE d.year_number = 2019
--       OR date_id IN
--                    (
--                     18500101
--                   , 99991231
--                    );



-- Q2: What are the first and last dates in the Date Dimension?
-- A2: Here they are > 99991231 is the go to default date > 250 years total

--SELECT MIN(d.date_id)
--     , MAX(d.date_id)
--  FROM RPT.dbo.datedim AS d;

--SELECT COUNT(1)
--  FROM RPT.dbo.DateDim AS dd;
---- 91,677 = 250 years + 1 day

--SELECT TOP 2 *
--  FROM RPT.dbo.DateDim AS dd
-- ORDER BY dd.date_id DESC;

-- 18500101 -- First day
-- 21001231 -- Last day
-- 99991231 -- Default day

--SELECT d.*
--  FROM RPT.dbo.datedim AS d
-- WHERE d.day_date = format((@v_first_date + n.n), 'yyyy-MM-dd');



-- Q3: How to load the Date Dimension
-- A3: Use dbo.Nums and figure it out



-- 1) Set the oldest date value

DECLARE @v_first_date as datetime

SET @v_first_date = '1849-12-31'



-- 2) Reload the base data

TRUNCATE TABLE dbo.DateDim;

INSERT INTO dbo.DateDim
SELECT CONVERT(VARCHAR, (@v_first_date + n.n), 112) AS date_id
     , FORMAT((@v_first_date + n.n), 'yyyy-MM-dd') AS day_date
     , DATEPART(WEEKDAY, (@v_first_date + n.n)) AS day_number_in_week
     , DAY((@v_first_date + n.n)) AS day_number_in_month
     , DATEPART(dayofyear, (@v_first_date + n.n)) AS day_number_in_year
     , DATENAME(WEEKDAY, (@v_first_date + n.n)) AS day_name
     , FORMAT((@v_first_date + n.n), 'ddd') AS day_abbreviation
     , 1 AS process_day_ind
     , DATENAME(WEEK, (@v_first_date + n.n)) AS week_number_in_year
     , FORMAT(DATEADD(dd, -(DATEPART(dw, (@v_first_date + n.n)) - 1), (@v_first_date + n.n)), 'yyyy-MM-dd') AS week_start_date
     , CONVERT(VARCHAR, DATEADD(dd, -(DATEPART(dw, (@v_first_date + n.n)) - 1), (@v_first_date + n.n)), 112) AS week_start_date_id
     , FORMAT(DATEADD(dd, 7 - DATEPART(dw, (@v_first_date + n.n)), (@v_first_date + n.n)), 'yyyy-MM-dd') AS week_end_date
     , CONVERT(VARCHAR, DATEADD(dd, 7 - DATEPART(dw, (@v_first_date + n.n)), (@v_first_date + n.n)), 112) AS week_end_date_id
     , CASE DATEPART(DW, @v_first_date + n.n)
            WHEN 1 THEN 0
            WHEN 2 THEN 1
            WHEN 3 THEN 1
            WHEN 4 THEN 1
            WHEN 5 THEN 1
            WHEN 6 THEN 1
            WHEN 7 THEN 0
        END AS weekday_flag
     , CASE DATEPART(DW, @v_first_date + n.n)
            WHEN 1 THEN 1
            WHEN 2 THEN 0
            WHEN 3 THEN 0
            WHEN 4 THEN 0
            WHEN 5 THEN 0
            WHEN 6 THEN 0
            WHEN 7 THEN 1
        END AS weekend_flag
     ,  CASE DATEPART(DW, @v_first_date + n.n)
            WHEN 1 THEN 0
            WHEN 2 THEN 0
            WHEN 3 THEN 0
            WHEN 4 THEN 0
            WHEN 5 THEN 0
            WHEN 6 THEN 0
            WHEN 7 THEN 1
        END AS last_day_in_week_flag
     , FORMAT((@v_first_date + n.n), 'MM') AS month_number
     , DATENAME(month, (@v_first_date + n.n)) AS month_name
     , FORMAT((@v_first_date + n.n), 'MMM')  AS month_abbreviation
     , FORMAT(EOMONTH(@v_first_date + n.n),'dd') AS month_last_day_number
     , DATEADD(DAY,1,EOMONTH(@v_first_date + n.n,-1)) AS month_start_date
     , CAST(convert(varchar(8),DATEADD(DAY,1,EOMONTH(@v_first_date + n.n,-1)),112) as int) AS month_start_date_id
     , EOMONTH(@v_first_date + n.n) AS month_end_date
     , CAST(convert(varchar(8),EOMONTH(@v_first_date + n.n),112) as int) AS month_end_date_id
     , EOMONTH(@v_first_date + n.n, -1) AS month_end_date_previous
     , CAST(convert(varchar(8),EOMONTH(@v_first_date + n.n, -1),112) as int) AS month_end_date_previous_id
     , CASE FORMAT((@v_first_date + n.n), 'yyyy-MM-dd')
			WHEN EOMONTH(@v_first_date + n.n) THEN 1 
			ELSE 0
	   END AS last_day_in_month_flag
     , DATEPART(Quarter, @v_first_date + n.n) AS quarter_number
     , CASE DATEPART(QQ, @v_first_date + n.n)
            WHEN 1 THEN 'First'
            WHEN 2 THEN 'Second'
            WHEN 3 THEN 'Third'
            WHEN 4 THEN 'Fourth'
        END  AS quarter_name
     ,  CASE DATEPART(QQ, @v_first_date + n.n)
            WHEN 1 THEN 'Q1'
            WHEN 2 THEN 'Q2'
            WHEN 3 THEN 'Q3'
            WHEN 4 THEN 'Q4'
        END  AS quarter_code
     , FORMAT(DATEADD(q, DATEDIFF(q, 0, @v_first_date + n.n), 0),'yyyy-MM-dd') AS quarter_start_date
     , CAST(convert(varchar(8),DATEADD(q, DATEDIFF(q, 0, @v_first_date + n.n), 0),112) as int) AS quarter_start_date_id
     , FORMAT(DATEADD(d, -1, DATEADD(q, DATEDIFF(q, 0, @v_first_date + n.n) + 1, 0)),'yyyy-MM-dd') AS quarter_end_date
     , CAST(convert(varchar(8),DATEADD(d, -1, DATEADD(q, DATEDIFF(q, 0, @v_first_date + n.n) + 1, 0)),112) as int) AS quarter_end_date_id
     , CASE FORMAT(DATEADD(d, -1, DATEADD(q, DATEDIFF(q, 0, @v_first_date + n.n) + 1, 0)),'yyyy-MM-dd')
			WHEN FORMAT((@v_first_date + n.n), 'yyyy-MM-dd') THEN 1 
			ELSE 0
	   END AS last_day_in_quarter_flag
     , DATEPART(yyyy,@v_first_date + n.n) AS year_number
     , FORMAT(DATEADD(yy, DATEDIFF(yy, 0, @v_first_date + n.n), 0),'yyyy-MM-dd') AS year_start_date
     , CAST(convert(varchar(8),DATEADD(yy, DATEDIFF(yy, 0, @v_first_date + n.n), 0),112) as int) AS year_start_date_id
     , FORMAT(DATEADD (dd, -1, DATEADD(yy, DATEDIFF(yy, 0, @v_first_date + n.n) +1, 0)),'yyyy-MM-dd') AS year_end_date
     , CAST(convert(varchar(8),DATEADD (dd, -1, DATEADD(yy, DATEDIFF(yy, 0, @v_first_date + n.n) +1, 0)),112) as int) AS year_end_date_id
     , CAST(CONCAT(DATEPART(yyyy,@v_first_date + n.n), DATEPART(mm,@v_first_date + n.n)) AS INT) AS yyyymm 
     , CASE FORMAT(DATEADD (dd, -1, DATEADD(yy, DATEDIFF(yy, 0, @v_first_date + n.n) +1, 0)),'yyyy-MM-dd')
			WHEN FORMAT((@v_first_date + n.n), 'yyyy-MM-dd') THEN 1 
			ELSE 0
	   END AS last_day_in_year_flag
     , NULL AS holiday_ind -- Challenge field
     , NULL AS holiday_name -- Challenge field
  FROM dbo.Nums AS n
  --WHERE n.n <= (365 * @v_num_years)
  WHERE n.n <= (@v_num_days + 1)
  ORDER BY 1;



-- 3) Reload the default date record

INSERT INTO dbo.DateDim
SELECT 99991231 AS date_id
     , '9999-12-31' AS day_date
     , 0 AS day_number_in_week
     , 0 AS day_number_in_month
     , 0 AS day_number_in_year
     , 'NA' AS day_name
     , 'NA' AS day_abbreviation
     , 1 AS process_day_ind
     , 0 AS week_number_in_year
     , '9999-12-31' AS week_start_date
     , 99991231 AS week_start_date_id
     , '9999-12-31' AS week_end_date
     , 99991231 AS week_end_date_id
     , NULL AS weekday_flag
     , NULL AS weekend_flag
     , NULL AS last_day_in_week_flag
     , NULL AS month_number
     , NULL AS month_name
     , NULL AS month_abbreviation
     , NULL AS month_last_day_number
     , NULL AS month_start_date
     , NULL AS month_start_date_id
     , NULL AS month_end_date
     , NULL AS month_end_date_id
     , NULL AS month_end_date_previous
     , NULL AS month_end_date_previous_id
     , NULL AS last_day_in_month_flag
     , NULL AS quarter_number
     , NULL AS quarter_name
     , NULL AS quarter_code
     , NULL AS quarter_start_date
     , NULL AS quarter_start_date_id
     , NULL AS quarter_end_date
     , NULL AS quarter_end_date_id
     , NULL AS last_day_in_quarter_flag
     , NULL AS year_number
     , NULL AS year_start_date
     , NULL AS year_start_date_id
     , NULL AS year_end_date
     , NULL AS year_end_date_id
     , NULL AS yyyymm
     , NULL AS last_day_in_year_flag
     , NULL AS holiday_ind -- Challenge field
     , NULL AS holiday_name -- Challenge field
	 ;

  END;

GO


