--populate tables
--Chana Lowy
--5/13/22


--Add Advisors:

USE [wits_lowy]
GO

DECLARE @RC int
DECLARE @advisor_first_name nvarchar(50)
DECLARE @advisor_last_name nvarchar(50)
DECLARE @advisor_email nvarchar(50)

EXECUTE @RC = [dbo].[udp_addAdvisor] 
   Stacy
  ,Smith
  ,'ssmith@gmail.com'
GO

DECLARE @RC int
DECLARE @advisor_first_name nvarchar(50)
DECLARE @advisor_last_name nvarchar(50)
DECLARE @advisor_email nvarchar(50)

EXECUTE @RC = [dbo].[udp_addAdvisor] 
   Allison
  ,Jobe
  ,'ajobegmail.com'
GO

--Add Course

USE [wits_lowy]
GO

DECLARE @RC int
DECLARE @course_name nvarchar(50)
DECLARE @course_description nvarchar(50)

EXECUTE @RC = [dbo].[udp_addCourse] 
   'CIS 404'
  ,JavaScript
GO

USE [wits_lowy]
GO

DECLARE @RC int
DECLARE @course_name nvarchar(50)
DECLARE @course_description nvarchar(50)

EXECUTE @RC = [dbo].[udp_addCourse] 
   'ENG 101'
  ,English
GO
--Add Instructor

DECLARE @RC int
DECLARE @instructor_first nvarchar(50)
DECLARE @instructor_last nvarchar(50)
DECLARE @instructor_email nvarchar(50)

EXECUTE @RC = [dbo].[udp_addInstructor] 
   Shira
  ,Rotberg
  ,'srotberg@gmail.com'
GO

DECLARE @RC int
DECLARE @instructor_first nvarchar(50)
DECLARE @instructor_last nvarchar(50)
DECLARE @instructor_email nvarchar(50)

EXECUTE @RC = [dbo].[udp_addInstructor] 
   Anna
  ,Gold
  ,'agold@gmail.com'
GO

--Add Course Offering

DECLARE @RC int
DECLARE @course_id int
DECLARE @instructor_id int
DECLARE @semester nvarchar(50)
DECLARE @time nvarchar(50)
DECLARE @day nvarchar(50)
DECLARE @year nvarchar(50)
DECLARE @room_number nvarchar(50)

EXECUTE @RC = [dbo].[udp_addCourseOffering] 
   1
  ,1
  ,Fall
  ,'2:00pm'
  ,Monday
  ,2022
  ,201
GO

DECLARE @RC int
DECLARE @course_id int
DECLARE @instructor_id int
DECLARE @semester nvarchar(50)
DECLARE @time nvarchar(50)
DECLARE @day nvarchar(50)
DECLARE @year nvarchar(50)
DECLARE @room_number nvarchar(50)

EXECUTE @RC = [dbo].[udp_addCourseOffering] 
   2
  ,2
  ,Spring
  ,'4:00pm'
  ,Tuesday
  ,2022
  ,202
GO

-- Add Enrollment

DECLARE @RC int
DECLARE @course_offering_id int
DECLARE @student_id int
DECLARE @grade int

EXECUTE @RC = [dbo].[udp_addEnrollment] 
   1
  ,1
  ,100
GO

DECLARE @RC int
DECLARE @course_offering_id int
DECLARE @student_id int
DECLARE @grade int

EXECUTE @RC = [dbo].[udp_addEnrollment] 
   2
  ,2
  ,97
GO

--Add Major

DECLARE @RC int
DECLARE @major_name nvarchar(50)
DECLARE @major_requirements nvarchar(50)

EXECUTE @RC = [dbo].[udp_addMajor] 
   Programming
  ,'CIS 404'
GO

DECLARE @RC int
DECLARE @major_name nvarchar(50)
DECLARE @major_requirements nvarchar(50)

EXECUTE @RC = [dbo].[udp_addMajor] 
   English
  ,'ENG 101'
GO

--Add Student

DECLARE @RC int
DECLARE @first_name nvarchar(50)
DECLARE @last_name nvarchar(50)
DECLARE @student_email nvarchar(50)
DECLARE @student_cellphone int
DECLARE @advisor_id int
DECLARE @major_id int

EXECUTE @RC = [dbo].[udp_addStudent] 
   Anna
  ,Lee
  ,'alee@gmail.com'
  ,2
 
  ,1
  ,1
GO

DECLARE @RC int
DECLARE @first_name nvarchar(50)
DECLARE @last_name nvarchar(50)
DECLARE @student_email nvarchar(50)
DECLARE @student_cellphone int

DECLARE @advisor_id int
DECLARE @major_id int

EXECUTE @RC = [dbo].[udp_addStudent] 
   Karen 
  ,Bard
  ,'kbard@gmail.com'
  ,3
 
  ,2
  ,2
GO

DECLARE @RC int
DECLARE @first_name nvarchar(50)
DECLARE @last_name nvarchar(50)
DECLARE @student_email nvarchar(50)
DECLARE @student_cellphone int

DECLARE @advisor_id int
DECLARE @major_id int

EXECUTE @RC = [dbo].[udp_addStudent] 
   Devorah
  ,Neuberger
  ,'dneuberger@gmail.com'
  ,8
  
  ,2
  ,1
GO

DECLARE @RC int
DECLARE @first_name nvarchar(50)
DECLARE @last_name nvarchar(50)
DECLARE @student_email nvarchar(50)
DECLARE @student_cellphone int

DECLARE @advisor_id int
DECLARE @major_id int

EXECUTE @RC = [dbo].[udp_addStudent] 
   Sarah
  ,McBeth
  ,'smcbeth@gmail.com'
  ,6
  
  ,1
  ,2
GO

DECLARE @RC int
DECLARE @first_name nvarchar(50)
DECLARE @last_name nvarchar(50)
DECLARE @student_email nvarchar(50)
DECLARE @student_cellphone int
DECLARE @advisor_id int
DECLARE @major_id int

EXECUTE @RC = [dbo].[udp_addStudent] 
   Karen 
  ,Bard
  ,'kbard@gmail.com'
  ,3
  
  ,2
  ,2
GO

DECLARE @RC int
DECLARE @first_name nvarchar(50)
DECLARE @last_name nvarchar(50)
DECLARE @student_email nvarchar(50)
DECLARE @student_cellphone int

DECLARE @advisor_id int
DECLARE @major_id int

EXECUTE @RC = [dbo].[udp_addStudent] 
   Kelly
  ,Klien
  ,'kklein@gmail.com'
  ,4
  
  ,2
  ,2
GO

DECLARE @RC int
DECLARE @first_name nvarchar(50)
DECLARE @last_name nvarchar(50)
DECLARE @student_email nvarchar(50)
DECLARE @student_cellphone int
DECLARE @advisor_id int
DECLARE @major_id int

EXECUTE @RC = [dbo].[udp_addStudent] 
   Sharon
  ,Stern
  ,'sstern@gmail.com'
  ,1
  ,1
  ,2
GO