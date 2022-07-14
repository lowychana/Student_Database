USE wits_lowy
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 5/11/22
-- Description:	finds major
-- =============================================
CREATE PROCEDURE [dbo].[udp_findMajor] (
	@major_name VARCHAR (50)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @major_id INT
    SET @major_id = 0
    SET @major_id = (SELECT TOP 1 major_id 
                     FROM wits_lowy.major
					 WHERE major_name = @major_name)
   IF @major_id IS NULL 
	BEGIN
		RETURN 0
    END
  RETURN @major_id

END
GO