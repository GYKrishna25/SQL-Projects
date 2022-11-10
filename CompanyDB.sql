CREATE DATABASE CompanyDB;
USE CompanyDB;

SET SQL_SAFE_UPDATES = 0;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- 
-- Table structure for table `Employee`
--

CREATE TABLE IF NOT EXISTS Employee ( 
					Fname varchar (15) NOT NULL, 
                    Minit varchar(3), 
                    Lname varchar(15) NOT NULL, 
                    SSN char(9) NOT NULL, 
                    Bdate date, 
                    Address varchar(30), 
                    Sex varchar(1), Salary float, 
                    Super_ssn varchar(9), 
                    Dno int NOT NULL, -- it should be FK but i am at last it will change to Fk,if i make fk as now it wll create some errors 
                    PRIMARY KEY (ssn), 
                    FOREIGN KEY (Super_ssn) REFERENCES employee(ssn)
                    )ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;



--
-- Table structure for table `Department`
--

CREATE TABLE IF NOT EXISTS Department (
						Dname varchar(25) NOT NULL, 
                        Dnumber int NOT NULL, 
                        Mgr_ssn char(9) NOT NULL, 
                        Mgr_start_date date, 
                        PRIMARY KEY (Dnumber), 
                        UNIQUE(Dname), 
                        FOREIGN KEY (Mgr_ssn) REFERENCES employee(ssn)
                        )ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
                        
                        
					
--
-- Table structure for table `DEPT_LOCATIONS`
--

CREATE TABLE IF NOT EXISTS Dept_locations (
							Dnumber int NOT NULL, 
                            Dlocation varchar(25), 
                            PRIMARY KEY (Dnumber, Dlocation), 
                            FOREIGN KEY (Dnumber) REFERENCES department (Dnumber)
							)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
                            
  
  
--
-- Table structure for table `Project`
--

CREATE TABLE IF NOT EXISTS project(
					Pname varchar(25) NOT NULL, 
                    Pnumber int NOT NULL, 
                    Plocation varchar(25), 
                    Dnum int NOT NULL, 
                    PRIMARY KEY (Pnumber), 
                    UNIQUE (Pname), 
                    FOREIGN KEY (Dnum) REFERENCES department (Dnumber)
                    )ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
                    
                    
                    
--
-- Table structure for table `Works_on`
--

CREATE TABLE IF NOT EXISTS Works_on (
						Essn char(9) NOT NULL, 
                        Pno int NOT NULL, 
                        Hours float NOT NULL, 
                        PRIMARY KEY (Essn, Pno), 
                        FOREIGN KEY (Essn) REFERENCES employee(ssn), 
                        FOREIGN KEY (Pno) REFERENCES project(Pnumber)
                        )ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
                        

--
-- Table structure for table `Dependent`
--
CREATE TABLE IF NOT EXISTS dependent (
						Essn char(9) NOT NULL, 
                        Dependent_name varchar(25) NOT NULL, 
                        Sex char(1), 
                        Bdate date, 
                        Relationship varchar(25), 
                        PRIMARY KEY (Essn, Dependent_name), 
                        FOREIGN KEY (Essn) REFERENCES employee(ssn)
                        )ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;



--
-- Dumping data for table `Employee'
--

SET AUTOCOMMIT=0;
INSERT INTO employee (Fname, Minit, Lname, SSN, Bdate, Address, Sex, Salary, Super_ssn, Dno) values ('James', 'E', 'Borg', 888665555, '1937-11-10', '430 Stone, Houston, TX', 'M', 55000, NULL, 1),
 ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '1 Berry, Bellaire, TX', 'F',43000, 888665555, 4),
('Franklin', 'B', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5),
 ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5),
 ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5),
 ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4),
 ('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);



--
-- Dumping data for table `Department'
--
SET AUTOCOMMIT=0;
INSERT INTO department (Dname, Dnumber, Mgr_ssn, Mgr_start_date) values ('Research', 5, 333445555, '1988-05-22'),
 ('Administration', 4, 987654321, '1995-01-01'),
 ('Headquaters', 1, 888665555, '1981-06-19');


-- ALTERING EMPLOYEE TABLE TO ADD FOREIGN KEY CONSTRAINT
ALTER TABLE employee ADD CONSTRAINT FK_Manages FOREIGN KEY (Dno) REFERENCES department (Dnumber);

--
-- Dumping data for table `Dept_Locations'
--
SET AUTOCOMMIT=0;
INSERT INTO Dept_locations (Dnumber, Dlocation) values (1, 'Houston'),
														(4, 'Stafford'), 
                                                        (5, 'Bellaire'), 
                                                        (5, 'Sugarland'), 
                                                        (4, 'Houston');
                                                        
                                                        
													
--
-- Dumping data for table `Project'
--
SET AUTOCOMMIT=0;
INSERT INTO Project (Pname, Pnumber, Plocation, Dnum) values ('ProductX', 1, 'Bellaire', 5), 
															 ('ProductY', 2, 'Sugarland', 5),
                                                             ('ProductZ', 3, 'Houston', 5),
                                                             ('Computerization', 10, 'Stafford', 4),
                                                             ('Reorganization', 20, 'Houston', 1),
                                                             ('Newbenfits', 30, 'Stafford', 4);
                                                             
                                                             
															
--
-- Dumping data for table `Works_on'
--
SET AUTOCOMMIT=0;		
INSERT INTO Works_on (Essn, Pno, Hours) values (123456789, 1, 32.5),
												(123456789, 2, 7.5),
                                                (666884444, 3, 40.0),
                                                (453453453, 1, 20.0),
                                                (453453453, 2, 20.0),
                                                (333445555, 2, 10.0),
                                                (333445555, 3, 10.0),
                                                (333445555, 10, 10.0),
                                                (333445555, 20, 10.0),
                                                (999887777, 30, 30.0),
                                                (999887777, 10, 10.0),
                                                (987987987, 10, 35.0),
                                                (987987987, 30, 5.0),
												(987654321, 30, 20.0),
                                                (987654321, 20, 15.0),
                                                (888665555, 20, 0.0);
                                                
                                                
                                                
--
-- Dumping data for table `Dependent'
--
SET AUTOCOMMIT=0;                                                
INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship) values (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
																			  (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                                                                              (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                                                                              (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'), 
                                                                              (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                                                                              (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                                                                              (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');
commit;