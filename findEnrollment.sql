USE wits_lowy
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 5/11/22
-- Description:	finds enrollment
-- =============================================
CREATE PROCEDURE [dbo].[udp_findEnrollment] (
	@course_offering_id INT,
	@student_id INT
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @enrollment_id INT
    SET @enrollment_id = 0
    SET @enrollment_id = (SELECT TOP 1 enrollment_id
                     FROM wits_lowy.enrollment
					 WHERE @course_offering_id = @course_offering_id AND @student_id = @student_id)
   IF @enrollment_id IS NULL 
	BEGIN
		RETURN 0
    END
  RETURN @enrollment_id

END
GO

