USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Account_Fact]    ****/
DROP PROCEDURE [dbo].[usp_Load_Account_Fact]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Account_Fact]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Account_Fact]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblAccountFact;

		INSERT INTO dbo.tblAccountFact
		SELECT DISTINCT 
		   s.as_of_date
		 , s.acct_id3 AS acct_id
		 , s.cur_bal
		FROM dbo.stg_p1 AS s
		WHERE s.acct_cust_role_id = 1;
    END;
GO