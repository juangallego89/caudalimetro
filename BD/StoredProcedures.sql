USE CAUDALIMETRO 
GO
CREATE PROC GetAllPersons
AS
BEGIN
    BEGIN TRY
       SELECT *
	   FROM
	   PERSONAS P
	   WHERE P.ESTADO_REGISTRO = 1
    END TRY
    BEGIN CATCH
        SELECT  
			 ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
GO
--
CREATE PROC GetAllUsers
AS
BEGIN
    BEGIN TRY
       SELECT *
	   FROM
	   USUARIOS U
	   WHERE U.ESTADO_REGISTRO = 1
    END TRY
    BEGIN CATCH
        SELECT  
			 ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
GO