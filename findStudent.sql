USE wits_lowy
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 5/11/22
-- Description:	finds student
-- =============================================
CREATE PROCEDURE [dbo].[udp_findStudent] (
	@student_email VARCHAR (50)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @student_id INT
    SET @student_id = 0
    SET @student_id = (SELECT TOP 1 student_id
                     FROM wits_lowy.student
					 WHERE student_email = @student_email)
   IF @student_id IS NULL 
	BEGIN
		RETURN 0
    END
  RETURN @student_id

END
GO
