USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Region]    ****/
DROP PROCEDURE [dbo].[usp_Load_Region]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Region]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Region]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblRegionDim;

		INSERT INTO dbo.tblRegionDim
		SELECT DISTINCT 
		   s.acct_region_id AS region_id
		 , 'Unknown' AS region_desc
		FROM dbo.stg_p1 AS s
		ORDER BY 1;

    END;
GO