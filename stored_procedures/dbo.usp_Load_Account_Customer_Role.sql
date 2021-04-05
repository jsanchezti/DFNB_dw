USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Account_Customer_Role]    ****/
DROP PROCEDURE [dbo].[usp_Load_Account_Customer_Role]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Account_Customer_Role]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Account_Customer_Role]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblAccountCustomerRoleDim;

		INSERT INTO dbo.tblAccountCustomerRoleDim
		SELECT DISTINCT 
			s.acct_cust_role_id
		 , CASE
			   WHEN s.acct_cust_role_id = 1
			   THEN 'Primary'
			   WHEN s.acct_cust_role_id = 2
			   THEN 'Secondary'
			   ELSE 'Unknown'
		   END AS acct_cust_role_desc
		FROM dbo.stg_p1 AS s
		ORDER BY 1
				, 2;

    END;
GO