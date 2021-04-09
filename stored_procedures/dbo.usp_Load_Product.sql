USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Product]    ****/
DROP PROCEDURE [dbo].[usp_Load_Product]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Product]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Product]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblProductDim;

		INSERT INTO dbo.tblProductDim
		SELECT DISTINCT 
		   s.prod_id
		 , s.prod_code
		 , s.prod_desc
		 , s.revolve_ind
		 , s.loan_amt_lmt
		FROM stg.PRODUCT_PROFILES AS s
		WHERE s.prod_id <> -1
		ORDER BY 1;

    END;
GO