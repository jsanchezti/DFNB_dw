USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Transaction_Type]    ****/
DROP PROCEDURE [dbo].[usp_Load_Transaction_Type]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Transaction_Type]   ****/ 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Transaction_Type]
AS

    BEGIN
		TRUNCATE TABLE dbo.tblTransactionTypeDim;

		INSERT INTO dbo.tblTransactionTypeDim
		SELECT DISTINCT 
		   s.tran_type_id
		 , s.tran_type_code
		 , s.tran_type_desc
		 , s.tran_fee_prct
		 , s.cur_cust_req_ind
		FROM dbo.stg_p2 AS s
		ORDER BY 1
				, 2;
    END;
GO