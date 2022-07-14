USE wits_lowy
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chana Lowy
-- Create date: 5/11/22
-- Description:	finds advisor
-- =============================================
CREATE PROCEDURE [dbo].[udp_findAdvisor] (
	@advisor_email VARCHAR (50)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @advisor_id INT
    SET @advisor_id = 0
    SET @advisor_id = (SELECT TOP 1 advisor_id 
                     FROM wits_lowy.advisor
					 WHERE advisor_email = @advisor_email)
   IF @advisor_id IS NULL 
	BEGIN
		RETURN 0
    END
  RETURN @advisor_id

END
GO
