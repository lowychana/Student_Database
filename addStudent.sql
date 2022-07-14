USE wits_lowy
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 3/26/22
-- Description:	adds a student
-- =============================================

CREATE PROCEDURE [dbo].[udp_addStudent] 
	(
	@first_name NVARCHAR (50),
	@last_name NVARCHAR (50),
	@student_email NVARCHAR (50),
	@student_cellphone INT,
	@advisor_id INT,
	@major_id INT
	)
AS
BEGIN
	SET NOCOUNT ON;


	DECLARE @student_id INT
	EXEC @student_id = dbo.udp_findStudent @student_email
  
	IF @student_id > 0
	BEGIN
		RETURN @student_id
	END

	INSERT INTO wits_lowy.student (
	first_name,
	last_name,
	student_email,
	student_cellphone,
	advisor_id,
	major_id
	)
	VALUES(
	@first_name,
	@last_name,
	@student_email,
	@student_cellphone,
	@advisor_id,
	@major_id
	)
  
  EXEC @student_id = dbo.udp_findStudent @student_email
  RETURN @student_id

END
GO