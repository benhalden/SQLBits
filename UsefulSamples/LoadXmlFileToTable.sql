DECLARE @filename VARCHAR(200),
        @sourceDirectory VARCHAR(200),
        @sqlCommand VARCHAR(2000);

SET @filename = '';
SET @sourceDirectory = '';

CREATE TABLE #temp
(
    recordId INT IDENTITY(1, 1) NOT NULL,
    dba_timestamp DATETIME,
    xml_filename VARCHAR(200),
    rawXML XML
);

SET @sqlCommand
    = 'Declare @MyXML XML ' + 'select @MyXML = BulkColumn FROM OPENROWSET(BULK ''' + RTRIM(@sourceDirectory) + '\'
      + RTRIM(@filename) + ''' , SINGLE_BLOB) AS A '
      + 'INSERT INTO #temp 
(dba_timestamp,
xml_filename,
rawXML)
SELECT {fn NOW()},''' + RTRIM(@filename) + ''',@MyXML';

EXEC (@sqlCommand);

SELECT *
FROM #temp;
DROP TABLE #temp;