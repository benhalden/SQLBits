USE [ABC_DW]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitParameterValues]    Script Date: 05/11/2021 13:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_SplitString]
    (
      @InputString VARCHAR(MAX),
	  @delimiter VARCHAR(10)
    )
RETURNS @ValuesList TABLE ( param VARCHAR(500) )
AS 
    BEGIN

        DECLARE @listValue VARCHAR(255)
        SET @InputString = @InputString + @delimiter
        WHILE LEN(@InputString) > 0 
            BEGIN
			
                SET @listValue = SUBSTRING(@InputString, 1,
                                           CHARINDEX(@delimiter, @InputString) - 1)
			
                INSERT  INTO @ValuesList
                        SELECT  @listValue
							
                SET @InputString = SUBSTRING(@InputString,
                                             CHARINDEX(@delimiter, @InputString) + 1,
                                             LEN(@InputString))
		
            END
		
 
        RETURN 

    END