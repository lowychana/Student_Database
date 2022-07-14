--Chana Lowy
--3/25/22
--This query creates tables for the wits database

CREATE SCHEMA wits_lowy;
GO

-- The ID in all the tables always uses the primary key constraint so that it can be uniqely identified by the ID

CREATE TABLE wits_lowy.advisor ( 
   advisor_id INT PRIMARY KEY IDENTITY (1, 1),
   advisor_first_name VARCHAR (50) NOT NULL,
   advisor_last_name VARCHAR (50) NOT NULL,
   advisor_email VARCHAR (50) NOT NULL,
);

CREATE TABLE wits_lowy.major (
    major_id INT PRIMARY KEY IDENTITY (1, 1),
    major_name VARCHAR (50) NOT NULL,
    major_requirements VARCHAR (50) NOT NULL,
);

CREATE TABLE wits_lowy.student  ( 
    student_id INT PRIMARY KEY IDENTITY (1, 1),
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    student_email VARCHAR (50) NOT NULL,
	student_cellphone INT NOT NULL,
	advisor_id INT,
	major_id INT,
	CONSTRAINT fk_adv FOREIGN KEY (advisor_id) 
    REFERENCES wits_lowy.advisor(advisor_id), -- this is so that each student can have one advisor, but each advisor can have many students
	CONSTRAINT fk_maj FOREIGN KEY (major_id) 
    REFERENCES wits_lowy.major(major_id)	-- this is so that each student can have one major, but each major can have many students
);

CREATE TABLE wits_lowy.course (
    course_id INT PRIMARY KEY IDENTITY (1, 1),
    course_name VARCHAR (50) NOT NULL,
	course_description VARCHAR (50) NULL
);

CREATE TABLE wits_lowy.instructor (
	instructor_id INT PRIMARY KEY IDENTITY (1,1),
	instructor_first VARCHAR (50) NULL,
	instructor_last VARCHAR (50) NOT NULL,
	instructor_email VARCHAR (50) NOT NULL
);

CREATE TABLE wits_lowy.course_offering (
	course_offering_id INT PRIMARY KEY IDENTITY (1,1),
	course_id INT,
	instructor_id INT,
	semester VARCHAR (50) NOT NULL,
	time VARCHAR (50) NOT NULL,
	day VARCHAR (50) NOT NULL,
	year VARCHAR (50) NOT NULL,
	room_number VARCHAR (50) NOT NULL,
	CONSTRAINT fk_instruct FOREIGN KEY (instructor_id) 
    REFERENCES wits_lowy.instructor(instructor_id), -- this is so that each course offered can have one instructor, but each instructor can have many courses offered
	CONSTRAINT fk_cour FOREIGN KEY (course_id) 
    REFERENCES wits_lowy.course(course_id) -- this is so that each course offered can have one course_id, but each course_id can have many courses offered
);

CREATE TABLE wits_lowy.enrollment (
	enrollment_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	course_offering_id INT NOT NULL,
	student_id INT NOT NULL,
	grade INT NULL,
	CONSTRAINT fk_cou FOREIGN KEY (course_offering_id) 
    REFERENCES wits_lowy.course_offering(course_offering_id), -- this is so that each enrollment can have one course_offering_id, but each course_offering_id can have many enrollments
	CONSTRAINT fk_stu FOREIGN KEY (student_id) 
    REFERENCES wits_lowy.student(student_id) -- this is so that each enrollment can have one student, but each student can have many enrollments
);
