USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Account_Customer]    ****/
DROP PROCEDURE [dbo].[usp_Load_Account_Customer]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Account_Customer]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Account_Customer]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblAccountCustomerDim;

		INSERT INTO dbo.tblAccountCustomerDim
		SELECT DISTINCT 
		   s.acct_id
		 , s.cust_id
		 , s.acct_cust_role_id
		FROM dbo.stg_p1 AS s
		ORDER BY 1
				, 2;

    END;
GO