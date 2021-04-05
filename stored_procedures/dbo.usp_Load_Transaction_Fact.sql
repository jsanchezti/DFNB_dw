USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Transaction_Fact]    ****/
DROP PROCEDURE [dbo].[usp_Load_Transaction_Fact]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Transaction_Fact]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Transaction_Fact]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblTransactionFact;

		INSERT INTO dbo.tblTransactionFact
		SELECT s.tran_date
		 , s.tran_time
		 , s.branch_id
		 , s.acct_id
		 , s.tran_type_id
		 , s.tran_amt
		 , s.tran_fee_amt
		FROM dbo.stg_p2 AS s
		ORDER BY 1
				, 2
				, 3
				, 4;
    END;
GO