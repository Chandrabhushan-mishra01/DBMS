show databases;
create database Employee;
SHOW DATABASES;

CREATE TABLE Employee(
    Fname VARCHAR(30),
    Minit VARCHAR(30),
    Lname VARCHAR(30),
    Ssn INT PRIMARY KEY,
    Bdate VARCHAR(30),
    Address VARCHAR(30),
    Sex VARCHAR(30),
    Salary INT NOT NULL,
    Super_ssn INT,
    Foreign key(Super_ssn) references Employee(Ssn)
);

ALTER TABLE Employee ADD Dno INT;
ALTER TABLE Employee ADD CONSTRAINT ALTER1 Foreign key(Dno) references Department(Dnumber);

CREATE TABLE Department(
    Dname VARCHAR(30),
    Dnumber INT PRIMARY KEY,
    Mgr_ssn INT,
    Mgr_start_date VARCHAR(30),
    foreign key(Mgr_ssn) references Employee(Ssn)
);

CREATE TABLE DEPT_LOCATIONS(
    Dnumber INT,
    Dlocation VARCHAR(50),
    Foreign key(Dnumber) references Department(Dnumber),
    PRIMARY KEY(Dnumber, Dlocation)
);

CREATE TABLE Project(
    Pname VARCHAR(30),
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(50),
    Dnum INT,
    foreign key(Dnum) references Department(Dnumber)
);

CREATE TABLE Works_on(
    Essn INT,
    Pno INT,
    Hours FLOAT,
    foreign key(Essn) references Employee(Ssn),
    foreign key(Pno) references Project(Pnumber),
    Primary Key(Essn, Pno)
);

CREATE TABLE Dependent(
    Essn INT,
    Dependent_name VARCHAR(30),
    Sex VARCHAR(30),
    Bdate VARCHAR(30),
    Relationship Varchar(30),
    foreign key(Essn) references Employee(Ssn),
    Primary key(Essn, Dependent_name)
);

SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM DEPT_LOCATIONS;
SELECT * FROM Project;
SELECT * FROM Works_on;
SELECT * FROM Dependent;

DESCRIBE TABLE Employee;
DESCRIBE TABLE Department;
DESCRIBE TABLE DEPT_LOCATIONS;
DESCRIBE TABLE Project;
DESCRIBE TABLE Works_on;
DESCRIBE TABLE Dependent;


DROP TABLE Employee;
DROP TABLE Department;
DROP TABLE DEPT_LOCATIONS;
DROP TABLE Project;
DROP TABLE Works_on;
DROP TABLE Dependent;



INSERT INTO Employee VALUES('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, NULL, NULL); 
INSERT INTO Employee VALUES('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, NULL, NULL); 
INSERT INTO Employee VALUES('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castel, Spring, TX', 'F', 25000, NULL, NULL); 
INSERT INTO Employee VALUES('Jeniffer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Beny, Bellaire, TX', 'F', 43000, NULL, NULL); 
INSERT INTO Employee VALUES('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fine Oak, Humble, TX', 'M', 38000, NULL, NULL); 
INSERT INTO Employee VALUES('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, NULL, NULL); 
INSERT INTO Employee VALUES('Ahmad', 'V', 'Jabbar', 987987987, '1969-08-29', '980 Dallas, Houston, TX', 'M', 25000, NULL, NULL); 
INSERT INTO Employee VALUES('James', 'E', 'Borg', 888665555, '1987-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, NULL); 

INSERT INTO Department VALUES('Research', 5, 333445555, '1988-05-22');
INSERT INTO Department VALUES('Administration', 4, 987654321, '1995-01-01');
INSERT INTO Department VALUES('Headquaters', 1, 888665555, '1981-06-19');

UPDATE Employee SET Super_ssn = 333445555, Dno = 5 WHERE Ssn = 123456789;
UPDATE Employee SET Super_ssn = 888665555, Dno = 5 WHERE Ssn = 333445555;
UPDATE Employee SET Super_ssn = 987654321, Dno = 4 WHERE Ssn = 999887777;
UPDATE Employee SET Super_ssn = 888665555, Dno = 4 WHERE Ssn = 987654321;
UPDATE Employee SET Super_ssn = 333445555, Dno = 5 WHERE Ssn = 666884444;
UPDATE Employee SET Super_ssn = 333445555, Dno = 5 WHERE Ssn = 453453453;
UPDATE Employee SET Super_ssn = 987654321, Dno = 4 WHERE Ssn = 987987987;
UPDATE Employee SET Dno = 1 WHERE Ssn = 888665555;

INSERT INTO DEPT_LOCATIONS VALUES(1, 'Hausion');
INSERT INTO DEPT_LOCATIONS VALUES(4, 'Headquaters');
INSERT INTO DEPT_LOCATIONS VALUES(5, 'Bellaire');
INSERT INTO DEPT_LOCATIONS VALUES(5, 'Sugarland');
INSERT INTO DEPT_LOCATIONS VALUES(5, 'Houston');

INSERT INTO Project VALUES('ProductX', 1, 'Bellaire', 5);
INSERT INTO Project VALUES('ProductY', 2, 'Sugarland', 5);
INSERT INTO Project VALUES('ProductZ', 3, 'Houston', 5);
INSERT INTO Project VALUES('Computerization', 10, 'Stafford', 4);
INSERT INTO Project VALUES('Reorganisation', 20, 'Hausion', 1);
INSERT INTO Project VALUES('Newbenefits', 30, 'Stafford', 4);

INSERT INTO WORKS_ON VALUES(123456789, 1,  32.5);
INSERT INTO WORKS_ON VALUES(123456789, 2,  7.5);
INSERT INTO WORKS_ON VALUES(666884444, 3,  40.0);
INSERT INTO WORKS_ON VALUES(453453453, 1,  20.0);
INSERT INTO WORKS_ON VALUES(453453453, 2,  20.0);
INSERT INTO WORKS_ON VALUES(333445555, 2,  10.0);
INSERT INTO WORKS_ON VALUES(333445555, 3,  10.0);
INSERT INTO WORKS_ON VALUES(333445555, 10,  10.0);
INSERT INTO WORKS_ON VALUES(333445555, 20,  10.0);
INSERT INTO WORKS_ON VALUES(999887777, 30,  30.0);
INSERT INTO WORKS_ON VALUES(999887777, 10,  10.0);
INSERT INTO WORKS_ON VALUES(987987987, 10,  35.0);
INSERT INTO WORKS_ON VALUES(987987987, 30,  5.0);
INSERT INTO WORKS_ON VALUES(987654321, 30,  20.0);
INSERT INTO WORKS_ON VALUES(987654321, 20,  15.0);
INSERT INTO WORKS_ON VALUES(888665555, 20,  NULL);

INSERT INTO Dependent VALUES(333445555, 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO Dependent VALUES(333445555, 'Theodore', 'M', '1983-10-25', 'Son');
INSERT INTO Dependent VALUES(333445555, 'Joy', 'F', '1958-05-03', 'Spouse');
INSERT INTO Dependent VALUES(987654321, 'Abner', 'M', '1942-02-28', 'Spouse');
INSERT INTO Dependent VALUES(123456789, 'Micheal', 'M', '1988-01-04', 'Son');
INSERT INTO Dependent VALUES(123456789, 'Alice', 'F', '1988-12-30', 'Daughter');
INSERT INTO Dependent VALUES(123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');