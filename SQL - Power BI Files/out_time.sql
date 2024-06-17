--Changing column names

DECLARE @oldColumnName NVARCHAR(MAX), @newColumnName NVARCHAR(MAX), @sql NVARCHAR(MAX);

DECLARE columnCursor CURSOR FOR
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'out_time' AND COLUMN_NAME <> 'ID'

OPEN columnCursor;

FETCH NEXT FROM columnCursor INTO @oldColumnName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @newColumnName = REPLACE(@oldColumnName, '#', '.');
    SET @sql = 'EXEC sp_rename ''out_time.' + @oldColumnName + ''', ''' + @newColumnName + ''', ''COLUMN'';';
    EXEC sp_executesql @sql;
    FETCH NEXT FROM columnCursor INTO @oldColumnName;
END

CLOSE columnCursor;
DEALLOCATE columnCursor;

-------------------------------------------
DECLARE @tableName NVARCHAR(MAX) = 'out_time';
DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql = @sql + 
    'UPDATE ' + QUOTENAME(@tableName) + ' SET ' + QUOTENAME(name) + ' = NULL WHERE ' + QUOTENAME(name) + ' = ''NA'';' + CHAR(13)
FROM sys.columns
WHERE object_id = OBJECT_ID(@tableName) AND name <> 'ID';

EXEC sp_executesql @sql;

----------------------

UPDATE out_time
SET 
    [14.01.2015] = NULLIF([14.01.2015], 'NA'),
    [26.01.2015] = NULLIF([26.01.2015], 'NA'),
	[5.03.2015] = NULLIF([5.03.2015], 'NA'),
	[1.05.2015] = NULLIF([1.05.2015], 'NA'),
	[17.07.2015] = NULLIF([17.07.2015], 'NA'),
	[17.09.2015] = NULLIF([17.09.2015], 'NA'),
	[2.10.2015] = NULLIF([2.10.2015], 'NA'),
	[9.11.2015] = NULLIF([9.11.2015], 'NA'),
	[10.11.2015] = NULLIF([10.11.2015], 'NA'),
	[11.11.2015] = NULLIF([11.11.2015], 'NA')

select * from out_time
order by ID