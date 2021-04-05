USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Account]    ****/
DROP PROCEDURE [dbo].[usp_Load_Customer]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Account]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Customer]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblCustomerDim;

		INSERT INTO dbo.tblCustomerDim
		SELECT DISTINCT 
		   s.cust_id2 AS cust_id
		 , s.last_name
		 , s.first_name
		 , s.gender
		 , s.birth_date
		 , s.cust_since_date
		 , s.pri_branch_id
		 , s.cust_pri_branch_dist
		 , s.cust_add_id
		 , s.cust_lat
		 , s.cust_lon
		 , s.cust_rel_id
		FROM dbo.stg_p1 AS s
		ORDER BY 1;

    END;
GO