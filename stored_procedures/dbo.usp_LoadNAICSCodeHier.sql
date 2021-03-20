USE [DFNB3]
GO

DROP PROCEDURE [dbo].[usp_LoadNAICSCodeHier]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadNAICSCodeHier]
AS

	BEGIN
		TRUNCATE TABLE dbo.tblNAICSCodeHier;

		INSERT INTO dbo.tblNAICSCodeHier
		SELECT v.*
		FROM etl.v_naics_code_hier_load AS v 

	END;