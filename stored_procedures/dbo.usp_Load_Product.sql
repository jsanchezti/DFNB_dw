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
		 , 'Unknown' AS prod_desc
		FROM dbo.stg_p1 AS s
		ORDER BY 1;

    END;
GO