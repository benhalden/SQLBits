USE [DatabaseName];
GO
IF EXISTS
(
    SELECT *
    FROM dbo.sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[procedure_name]')
          AND OBJECTPROPERTY(id, N'IsProcedure') = 1
)
    DROP PROCEDURE [dbo].[procedure_name];
GO

SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE PROCEDURE dbo.procedure_name @inp_processTimestamp DATETIME = NULL
AS
BEGIN

    IF @inp_processTimestamp IS NULL
        SET @inp_processTimestamp = { FN NOW()};


END;

/*
GO
GRANT EXEC ON procedure_name TO <username>;
GO
*/