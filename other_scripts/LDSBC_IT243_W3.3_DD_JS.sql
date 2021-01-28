
/*****************************************************************************************************************
NAME:    HowToCreateMS_Description.sql
PURPOSE: How to Create MS_Description
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/03/2019   JJAUSSI       1. Built this table for LDS BC IT243
1.1     01/29/2020   JJAUSSI       1. Enhanced example
1.1     04/10/2020   JJAUSSI       1. Refined script formatting
RUNTIME: 
Approx. 0 sec
NOTES:
This is an example of how to create a custom propery named MS_Description which is widely used to
document schemas, tables, and fields in SQL Server. Can also be used to document contraints, indexes, 
and defualts. See any table in AdventureWorks for an example.
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/


-- Q1: How to use dynamic SQL to write SQL for me?
-- A1: Here is a simple example...

-- This example is for the Tables

SELECT t.TABLE_SCHEMA 
      ,t.TABLE_NAME
,'EXEC sys.sp_addextendedproperty @name=N''MS_Description'', 
@value=N''The Position Dimension table.'' , 
@level0type=N''SCHEMA'',@level0name=N''dbo'', 
@level1type=N''TABLE'',@level1name=N''' + t.TABLE_NAME + ''';' 
as sql1
  FROM INFORMATION_SCHEMA.TABLES as t
 WHERE t.TABLE_TYPE = 'BASE TABLE'
   AND t.TABLE_SCHEMA = 'dbo'
ORDER BY 1,2;


 -- Adapt the script above to use INFORMATION_SCHEMA.COLUMNS for the Columns



-- Q2: What does the final output look like for this stored procedure that I need to execute?
-- A2: Here it is - copy and paste from the data grid that results from the prior query

-- Table
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Position Dimension table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim';


-- Columns
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Position records.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim', @level2type=N'COLUMN',@level2name=N'p_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A one character abbreviation for the Position.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim', @level2type=N'COLUMN',@level2name=N'p_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full word verbiage of the Position name.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim', @level2type=N'COLUMN',@level2name=N'p_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The targeted talent inventory level for this position per team.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim', @level2type=N'COLUMN',@level2name=N'p_target';