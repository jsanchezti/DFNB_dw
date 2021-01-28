--SHOWING TABLES NAME
SELECT t.TABLE_SCHEMA 
      ,t.TABLE_NAME
,'EXEC sys.sp_addextendedproperty @name=N''MS_Description'', 
@value=N''The Position Dimension table.'' , 
@level0type=N''SCHEMA'',@level0name=N''dbo'', 
@level1type=N''TABLE'',@level1name=N''' + t.TABLE_NAME + ''';' 
as sql1
  FROM INFORMATION_SCHEMA.TABLES as t
 WHERE t.TABLE_NAME LIKE '%stg_%'
   

--SHOWING COLUMNS FOR TABLES stg_p1 and stg_p2
SELECT t.TABLE_SCHEMA,
	   t.TABLE_NAME,
       t.COLUMN_NAME
,'EXEC sys.sp_addextendedproperty @name=N''MS_Description'', 
@value=N''Primary key for Position records.'' , 
@level0type=N''SCHEMA'',@level0name=N''dbo'', 
@level1type=N''TABLE'',@level1name=N''tblPositionDim'', 
@level2type=N''COLUMN'',@level2name=N'''+t.COLUMN_NAME +''';' 
as sql1
  FROM INFORMATION_SCHEMA.COLUMNS as t
  WHERE t.TABLE_NAME like '%stg_%'

-- Table stg_p1
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description', 
	@value=N'stg_p1' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1';
	
-- Table stg_p2
EXEC sys.sp_addextendedproperty 
	@name=N'MS_Description', 
	@value=N'stg_p2' , 
	@level0type=N'SCHEMA', @level0name=N'dbo', 
	@level1type=N'TABLE', @level1name=N'stg_p2';


-- Columns dbo.stg_p1
EXEC sys.sp_addextendedproperty 
	@name=N'acct_id', 
	@value=N'Account ID.' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_id';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_id', 
	@value=N'Customer ID.' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_id';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_cust_role_id', 
	@value=N'Customer Account Role ID' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_cust_role_id';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_id2', 
	@value=N'Account ID number 2.' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_id2';

EXEC sys.sp_addextendedproperty 
	@name=N'prod_id', 
	@value=N'Product ID.' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'prod_id';

EXEC sys.sp_addextendedproperty 
	@name=N'open_date', 
	@value=N'Day when account was opened.' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'open_date';

EXEC sys.sp_addextendedproperty 
	@name=N'close_date', 
	@value=N'Day when account was closed.' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'close_date';

EXEC sys.sp_addextendedproperty 
	@name=N'open_close_code', 
	@value=N'code when account is opened and closed.' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'open_close_code';

EXEC sys.sp_addextendedproperty 
	@name=N'branch_id', 
	@value=N'Branch Identifier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'branch_id';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_rel_id', 
	@value=N'Account related to idenfier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_rel_id';

EXEC sys.sp_addextendedproperty 
	@name=N'pri_cust_id', 
	@value=N'Priority costumer identification' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'pri_cust_id';

EXEC sys.sp_addextendedproperty 
	@name=N'loan_amt', 
	@value=N'Loan amount' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'loan_amt';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_id', 
	@value=N'Identifier for Account Number and Branch' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_id';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_code', 
	@value=N'Code of Account and Branch' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_code';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_desc', 
	@value=N'Description of account in a branch' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_desc';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_region_id', 
	@value=N'Identifier of account at a region' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_region_id';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_area_id', 
	@value=N'Identifier of account at a area' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_area_id';


EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_lat', 
	@value=N'Branch location latitude' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_lat';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_lon', 
	@value=N'Branch location longitud' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_lon';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_add_id', 
	@value=N'Address Branch identifier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_add_id';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_add_lat', 
	@value=N'Account Address Branch latitude' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_add_lat';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_add_lon', 
	@value=N'Account Address Branch logitud' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_add_lon';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_branch_add_type', 
	@value=N'Account Address Branch type' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_branch_add_type';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_id2', 
	@value=N'ID number 2 of customer' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_id2';

EXEC sys.sp_addextendedproperty 
	@name=N'last_name', 
	@value=N'Customer last name' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'last_name';

EXEC sys.sp_addextendedproperty 
	@name=N'first_name', 
	@value=N'Customer first name' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'first_name';

EXEC sys.sp_addextendedproperty 
	@name=N'gender', 
	@value=N'Customer gender' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'gender';

EXEC sys.sp_addextendedproperty 
	@name=N'birth_date', 
	@value=N'Customer birth date' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'birth_date';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_since_date', 
	@value=N'Date since became customer' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_since_date';


EXEC sys.sp_addextendedproperty 
	@name=N'pri_branch_id', 
	@value=N'Primary Branch identifier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'pri_branch_id';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_pri_branch_dist', 
	@value=N'Customer primary branch distric' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_pri_branch_dist';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_lat', 
	@value=N'Customer location latitud' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_lat';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_lon', 
	@value=N'Customer location longitud' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_lon';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_rel_id', 
	@value=N'Customer relatioship identifier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_rel_id';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_add_id', 
	@value=N'Customer addres identifier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_add_id';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_add_lat', 
	@value=N'Customer addres latitud' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_add_lat';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_add_lon', 
	@value=N'Customer addres longitud' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_add_lon';

EXEC sys.sp_addextendedproperty 
	@name=N'cust_add_type', 
	@value=N'Customer addres type' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cust_add_type';

EXEC sys.sp_addextendedproperty 
	@name=N'as_of_date', 
	@value=N'as_of_date' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'as_of_date';

EXEC sys.sp_addextendedproperty 
	@name=N'acct_id3', 
	@value=N'Account identifier 3' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'acct_id3';

EXEC sys.sp_addextendedproperty 
	@name=N'cur_bal', 
	@value=N'current balance' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p1', 
	@level2type=N'COLUMN',@level2name=N'cur_bal';


-- Columns dbo.stg_p2

EXEC sys.sp_addextendedproperty 
	@name=N'branch_id', 
	@value=N'Branch identifier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'branch_id';


EXEC sys.sp_addextendedproperty 
	@name=N'acct_id', 
	@value=N'Account identifier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'acct_id';

EXEC sys.sp_addextendedproperty 
	@name=N'tran_date', 
	@value=N'Transaction date' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'tran_date';

EXEC sys.sp_addextendedproperty 
	@name=N'tran_time', 
	@value=N'Transaction time' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'tran_time';

EXEC sys.sp_addextendedproperty 
	@name=N'tran_type_id', 
	@value=N'Transaction type identifier' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'tran_type_id';

EXEC sys.sp_addextendedproperty 
	@name=N'tran_type_code', 
	@value=N'Transaction type code' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'tran_type_code';

EXEC sys.sp_addextendedproperty 
	@name=N'tran_type_desc', 
	@value=N'Transaction type description' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'tran_type_desc';

EXEC sys.sp_addextendedproperty 
	@name=N'tran_fee_prct', 
	@value=N'Transaction fee percentaje' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'tran_fee_prct';

EXEC sys.sp_addextendedproperty 
	@name=N'cur_cust_req_ind', 
	@value=N'Currency customer required' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'cur_cust_req_ind';

EXEC sys.sp_addextendedproperty 
	@name=N'tran_amt', 
	@value=N'Transaction Amount' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'tran_amt';

EXEC sys.sp_addextendedproperty 
	@name=N'tran_fee_amt', 
	@value=N'Transaction fee Amount' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'stg_p2', 
	@level2type=N'COLUMN',@level2name=N'tran_fee_amt';







