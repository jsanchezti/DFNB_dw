/*****************************************************************************************************************
NAME:    stg.NAICS_CODES_2017
PURPOSE: Create the stg.NAICS_CODES_2017 table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/12/2019   JJAUSSI       1. Built this table for LDS BC IT240



RUNTIME: 

NOTES:
NAICS Code Hierarchy


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

USE [DFNB3]
GO

DROP TABLE [stg].[NAICS_CODES_2017]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[NAICS_CODES_2017](
    [seq_no] float,
    [2017_NAICS_US _Code] float,
    [2017_NAICS_US_Title] nvarchar(255)
) ON [PRIMARY]
GO
