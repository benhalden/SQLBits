CREATE FUNCTION [dbo].[SplitParameterValues]
(
    @InputString VARCHAR(MAX)
)
RETURNS @ValuesList TABLE
(
    parameterValue VARCHAR(200)
)
AS
BEGIN

    DECLARE @listValue VARCHAR(200);
    SET @InputString = @InputString + ',';
    WHILE LEN(@InputString) > 0
    BEGIN

        SET @listValue = SUBSTRING(@InputString, 1, CHARINDEX(',', @InputString) - 1);

        INSERT INTO @ValuesList
        SELECT @listValue;

        SET @InputString = SUBSTRING(@InputString, CHARINDEX(',', @InputString) + 1, LEN(@InputString));

    END;


    RETURN;

END;