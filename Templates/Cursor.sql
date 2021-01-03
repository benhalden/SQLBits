DECLARE @tableName VARCHAR(100)

DECLARE myCursor CURSOR
FOR
    SELECT  [name]
    FROM    sysobjects

OPEN myCursor

FETCH myCursor INTO @tableName

WHILE @@Fetch_Status = 0
    BEGIN

--Process	

        SELECT  @tableName

--next
        FETCH myCursor INTO @tableName           

    END

CLOSE myCursor

DEALLOCATE myCursor