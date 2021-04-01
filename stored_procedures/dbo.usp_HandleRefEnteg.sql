USE [EXM]
GO

/****** Object:  StoredProcedure [dbo].[usp_HandleRefEnteg]    Script Date: 11/23/2019 9:47:36 AM ******/
DROP PROCEDURE [dbo].[usp_HandleRefEnteg]
GO

/****** Object:  StoredProcedure [dbo].[usp_HandleRefEnteg]    Script Date: 11/23/2019 9:47:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_HandleRefEnteg] (@v_op as varchar(10))
AS

/*****************************************************************************************************************
NAME:    dbo.usp_HandleRefEnteg
PURPOSE: Handle referential integrity

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/23/2019   JJAUSSI       1. Built this table for LDS BC IT243



RUNTIME: 
Approx. 30 sec

NOTES: 
@v_op
- op = operation
- drop = drop foreign keys, primary keys, indexes
- add = add foreign keys, primary keys, indexes

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

BEGIN


-- 1) Drop

IF @v_op = 'drop'

BEGIN


-- 1.1) Foreign Keys

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblBranchDim_region_id_tblRegionDim_region_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
)
    BEGIN

        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblBranchDim_area_id_tblAreaDim_area_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
)
    BEGIN

        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id;

END;

--Aqui

-- 1.2) Primary Keys

IF EXISTS
(
    SELECT i.*
      FROM sys.indexes AS i
     WHERE i.name = 'PK_tblPlayerDim'
           AND object_id = OBJECT_ID(N'dbo.tblPlayerDim')
)
    BEGIN

        ALTER TABLE dbo.tblPlayerDim DROP CONSTRAINT PK_tblPlayerDim;

END;

IF EXISTS
(
    SELECT i.*
      FROM sys.indexes AS i
     WHERE i.name = 'PK_tblPlayerFact'
           AND object_id = OBJECT_ID(N'dbo.tblPlayerFact')
)
    BEGIN

        ALTER TABLE dbo.tblPlayerFact DROP CONSTRAINT PK_tblPlayerFact;

END;

IF EXISTS
(
    SELECT i.*
      FROM sys.indexes AS i
     WHERE i.name = 'PK_tblPositionDim'
           AND object_id = OBJECT_ID(N'dbo.tblPositionDim')
)
    BEGIN

        ALTER TABLE dbo.tblPositionDim DROP CONSTRAINT PK_tblPositionDim;

END;

IF EXISTS
(
    SELECT i.*
      FROM sys.indexes AS i
     WHERE i.name = 'PK_tblTeamDim'
           AND object_id = OBJECT_ID(N'dbo.tblTeamDim')
)
    BEGIN

        ALTER TABLE dbo.tblTeamDim DROP CONSTRAINT PK_tblTeamDim;

END;



-- 1.3) Indexes



END;





-- 2) Add

IF @v_op = 'add'

BEGIN


-- 2.1) Primary Keys

ALTER TABLE dbo.tblPlayerDim 
ADD  CONSTRAINT PK_tblPlayerDim PRIMARY KEY CLUSTERED (pl_id ASC);

ALTER TABLE dbo.tblPlayerFact 
ADD  CONSTRAINT PK_tblPlayerFact PRIMARY KEY CLUSTERED (as_of_date ASC, pl_id ASC);

ALTER TABLE dbo.tblPositionDim 
ADD  CONSTRAINT PK_tblPositionDim PRIMARY KEY CLUSTERED (p_id ASC);

ALTER TABLE dbo.tblTeamDim 
ADD  CONSTRAINT PK_tblTeamDim PRIMARY KEY CLUSTERED (t_id ASC);



-- 2.2) Foreign Keys

ALTER TABLE dbo.tblPlayerDim
ADD CONSTRAINT FK_tblPlayerDim_tblPositionDim FOREIGN KEY(p_id) REFERENCES dbo.tblPositionDim(p_id);

ALTER TABLE dbo.tblPlayerDim
ADD CONSTRAINT FK_tblPlayerDim_tblTeamDim FOREIGN KEY(t_id) REFERENCES dbo.tblTeamDim(t_id);

ALTER TABLE dbo.tblPlayerFact
ADD CONSTRAINT FK_tblPlayerFact_tblPlayerDim FOREIGN KEY(pl_id) REFERENCES dbo.tblPlayerDim(pl_id);



-- 2.3) Indexes



END;

    END;

GO


