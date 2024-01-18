
CREATE TABLE Students (
     StudentID SERIAL PRIMARY KEY,
     FirstName VARCHAR(50) NOT NULL,
     LastName VARCHAR(50) NOT NULL,
     Birthdate DATE,
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses
CREATE TABLE Courses (
     CourseID SERIAL PRIMARY KEY,
     CourseName VARCHAR(100) NOT NULL,
     Department VARCHAR(50) NOT NULL,
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Enrollments (
     EnrollmentID SERIAL PRIMARY KEY,
     StudentID INT REFERENCES Students(StudentID),
     CourseID INT REFERENCES Courses(CourseID),
     EnrollmentDate DATE DEFAULT CURRENT_DATE,
     CONSTRAINT chk_positive_value CHECK (EnrollmentDate > '2000-01-01'),
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Professors (
      ProfessorID SERIAL PRIMARY KEY,
      FirstName VARCHAR(50) NOT NULL,
      LastName VARCHAR(50) NOT NULL,
      Department VARCHAR(50) NOT NULL,
      record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Departments (
     DepartmentID SERIAL PRIMARY KEY,
     DepartmentName VARCHAR(50) NOT NULL,
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Assignments (
     AssignmentID SERIAL PRIMARY KEY,
     CourseID INT REFERENCES Courses(CourseID),
     AssignmentName VARCHAR(100) NOT NULL,
     Deadline DATE,
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Grades (
     GradeID SERIAL PRIMARY KEY,
     EnrollmentID INT REFERENCES Enrollments(EnrollmentID),
     AssignmentID INT REFERENCES Assignments(AssignmentID),
     Grade DECIMAL(4, 2),
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Campus (
     CampusID SERIAL PRIMARY KEY,
     CampusName VARCHAR(50) NOT NULL,
     Location VARCHAR(100),
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Buildings (
      BuildingID SERIAL PRIMARY KEY,
      CampusID INT REFERENCES Campus(CampusID),
      BuildingName VARCHAR(50) NOT NULL,
      record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Classrooms (
     ClassroomID SERIAL PRIMARY KEY,
     BuildingID INT REFERENCES Buildings(BuildingID),
     ClassroomNumber VARCHAR(10) NOT NULL,
     Capacity INT,
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Schedule (
     ScheduleID SERIAL PRIMARY KEY,
     CourseID INT REFERENCES Courses(CourseID),
     ProfessorID INT REFERENCES Professors(ProfessorID),
     ClassroomID INT REFERENCES Classrooms(ClassroomID),
     DayOfWeek VARCHAR(10) NOT NULL,
     StartTime TIME,
     EndTime TIME,
     record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


