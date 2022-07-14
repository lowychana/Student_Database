USE wits_lowy
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 3/26/22
-- Description:	adds an instructor
-- =============================================

CREATE PROCEDURE [dbo].[udp_addInstructor] 
	(
	@instructor_first NVARCHAR(50),
    @instructor_last NVARCHAR(50),
	@instructor_email NVARCHAR(50)
	)
AS
BEGIN
	SET NOCOUNT ON;


	DECLARE @instructor_id INT
	EXEC @instructor_id = dbo.udp_findInstructor @instructor_email
  
	IF @instructor_id > 0
	BEGIN
		RETURN @instructor_id
	END

	INSERT INTO wits_lowy.instructor (
	
	instructor_first,
    instructor_last,
	instructor_email
	)
	VALUES(
	@instructor_first,
    @instructor_last,
	@instructor_email
	)
  
  EXEC @instructor_id = dbo.udp_findInstructor @instructor_email
  RETURN @instructor_id

END
GO