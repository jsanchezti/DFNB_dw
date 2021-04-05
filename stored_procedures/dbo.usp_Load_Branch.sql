USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Branch]   ****/
DROP PROCEDURE [dbo].[usp_Load_Branch]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Branch]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Branch]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblBranchDim;

		INSERT INTO dbo.tblBranchDim
		SELECT DISTINCT 
			   s.acct_branch_id AS branch_id
			 , s.acct_branch_code AS branch_code
			 , s.acct_branch_desc AS branch_desc
			 , s.acct_branch_add_id AS branch_add_id
			 , s.acct_region_id AS region_id
			 , s.acct_area_id AS area_id
		FROM dbo.stg_p1 AS s
		ORDER BY 1;
    END;
GO