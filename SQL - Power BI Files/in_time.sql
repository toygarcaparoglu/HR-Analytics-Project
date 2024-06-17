--Changing column names

DECLARE @oldColumnName NVARCHAR(MAX), @newColumnName NVARCHAR(MAX), @sql NVARCHAR(MAX);

DECLARE columnCursor CURSOR FOR
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'in_time' AND COLUMN_NAME <> 'ID'

OPEN columnCursor;

FETCH NEXT FROM columnCursor INTO @oldColumnName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @newColumnName = REPLACE(@oldColumnName, '#', '.');
    SET @sql = 'EXEC sp_rename ''in_time.' + @oldColumnName + ''', ''' + @newColumnName + ''', ''COLUMN'';';
    EXEC sp_executesql @sql;
    FETCH NEXT FROM columnCursor INTO @oldColumnName;
END

CLOSE columnCursor;
DEALLOCATE columnCursor;

-----------------------------------

DECLARE @columnName NVARCHAR(MAX), @sql NVARCHAR(MAX);

DECLARE columnCursor CURSOR FOR
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'in_time' AND COLUMN_NAME <> 'ID'; -- 'ID' sütununu hariç tutun

OPEN columnCursor;

FETCH NEXT FROM columnCursor INTO @columnName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = 'UPDATE in_time SET ' + QUOTENAME(@columnName) + ' = NULLIF(' + QUOTENAME(@columnName) + ', ''NA'')';
    EXEC sp_executesql @sql;

    FETCH NEXT FROM columnCursor INTO @columnName;
END

CLOSE columnCursor;
DEALLOCATE columnCursor;

-------------------

UPDATE in_time
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



select * from in_time