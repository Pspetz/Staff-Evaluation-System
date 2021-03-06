CREATE TABLE COMPANY(
  AFM CHAR(9) NOT NULL,
  DOY VARCHAR(15) NOT NULL,
  name VARCHAR(35) NOT NULL,
  phone BIGINT(16) NOT NULL,
  street VARCHAR(15) NOT NULL,
  city VARCHAR(15) NOT NULL,
  country VARCHAR(15) NOT NULL,
  PRIMARY KEY(AFM)
)ENGINE=InnoDB;

CREATE TABLE user(
  username VARCHAR(12) NOT NULL,
  password VARCHAR(10) NOT NULL,
  name VARCHAR(25) NOT NULL,
  surname VARCHAR(35) NOT NULL,
  reg_date DATETIME NOT NULL,
  email VARCHAR(30) NOT NULL,
  PRIMARY KEY(username)
)ENGINE=InnoDB;


CREATE TABLE manager(
  managerUsername VARCHAR(12) NOT NULL,
  exp_years TINYINT(4) NOT NULL,
  firm CHAR(9) NOT NULL,
  report TEXT NOT NULL,
  PRIMARY KEY(managerUsername),
  CONSTRAINT A FOREIGN KEY(managerUsername) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT B FOREIGN KEY(firm) REFERENCES COMPANY(AFM) 
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;



CREATE TABLE evaluator(
  username VARCHAR(12) NOT NULL,
  exp_years tinyint(4) NOT NULL,
  firm char(9) NOT NULL,
  idaks INT(100) NOT NULL UNIQUE,
  PRIMARY KEY(username,firm,idaks),
  CONSTRAINT C FOREIGN KEY(username) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT D FOREIGN KEY(firm) REFERENCES COMPANY(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE job(
  id INT(4) NOT NULL,
  start_date DATE,
  salary float(6,1) NOT NULL,
  position VARCHAR(40) NOT NULL,
  edra VARCHAR(45) NOT NULL,
  evaluator VARCHAR(12) NOT NULL,
  announce_date DATETIME,
  submission_date DATE,
  PRIMARY KEY(id),
  CONSTRAINT E FOREIGN KEY(evaluator) REFERENCES evaluator(username)
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;


CREATE TABLE antikeim(
  title VARCHAR(36) NOT NULL,
  desc_i TINYTEXT,
  belongs_to VARCHAR(36) not NULL,
  PRIMARY KEY(title),
  CONSTRAINT F FOREIGN KEY(belongs_to) REFERENCES antikeim(title)
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE needs(
  job_id INT(4) NOT NULL,
  antikeim_title VARCHAR(36),
  PRIMARY KEY(job_id,antikeim_title),
  CONSTRAINT G FOREIGN KEY(job_id) REFERENCES job(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT H FOREIGN KEY(antikeim_title) REFERENCES antikeim(title)
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE employee(
  username VARCHAR(12) NOT NULL,
  am INT(10) NOT NULL,
  afm CHAR(9) NOT NULL,
  employeeexp_years INT(4) NOT NULL,
  bio TEXT NOT NULL,
  sistatikes VARCHAR(35) NOT NULL,
  certificate VARCHAR(35) NOT NULL,
  awards VARCHAR(35) NOT NULL,
  PRIMARY KEY(username,afm),
  CONSTRAINT EMPPL FOREIGN KEY(afm) REFERENCES COMPANY(AFM) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT US FOREIGN KEY(username) REFERENCES user(username)
  ON DELETE CASCADE ON UPDATE CASCADE

)ENGINE=InnoDB;


CREATE TABLE project(
  empl VARCHAR(12) NOT NULL,
  num TINYINT(4) NOT NULL,
  descr TEXT,
  url VARCHAR(60) NOT NULL,
  PRIMARY KEY(num,empl),
  CONSTRAINT I FOREIGN KEY(empl) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=InnoDB;

CREATE TABLE languages(
  employee VARCHAR(12) NOT NULL,
  lang SET('FR','EN','SP','GR'),
  PRIMARY KEY(employee,lang),
  CONSTRAINT J FOREIGN KEY(employee) REFERENCES employee(username)
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE requestevaluation(
  empl_username VARCHAR(12) NOT NULL,
  job_id INT(4),
  PRIMARY KEY(empl_username,job_id),
  CONSTRAINT K FOREIGN KEY(empl_username) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT L FOREIGN KEY(job_id) REFERENCES job(id)
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE degree(
  titlos VARCHAR(50) NOT NULL,
  idryma VARCHAR(40) NOT NULL,
  bathmida ENUM('LYKEIO','UNIV','MASTER','PHD'),
  PRIMARY KEY(titlos,idryma)
  )ENGINE=InnoDB;

CREATE TABLE has_degree(
degr_title VARCHAR(50) NOT NULL,
degr_idryma VARCHAR(40) NOT NULL,
empl_usrname VARCHAR(12) NOT NULL,
etos YEAR(4),
grade FLOAT(3,1),
PRIMARY KEY(degr_title,empl_usrname),
CONSTRAINT M FOREIGN KEY(degr_title) REFERENCES degree(titlos) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT N FOREIGN KEY(empl_usrname) REFERENCES employee(username)
ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE GRADE(
  gradenum1 INT(4) ,
  gradenum2 INT(4) ,
  gradenum3 INT(2) ,
  evaluationname VARCHAR(12) NOT NULL,
  PRIMARY KEY(evaluationname,gradenum1,gradenum2,gradenum3),
  CONSTRAINT EMSPL FOREIGN KEY(evaluationname) REFERENCES evaluator(username) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;
  

CREATE TABLE evaluationresult(
  evid INT(100) NOT NULL UNIQUE,
    empl_usrname VARCHAR(12) NOT NULL,
    job_id INT(4) NOT NULL,
    grade INT(4) DEFAULT '0',
    evaluationnam VARCHAR(12) NOT NULL,
  PRIMARY KEY(evid,empl_usrname),
  CONSTRAINT EV FOREIGN KEY(evid) REFERENCES evaluator(idaks) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT O FOREIGN KEY(empl_usrname) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT P FOREIGN KEY(job_id) REFERENCES job(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Q FOREIGN KEY(evaluationnam) REFERENCES GRADE(evaluationname)
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

 CREATE TABLE AKSIOLOGISI1(
   IDevaluator INT(100) NOT NULL UNIQUE,
   emp_username VARCHAR(12) NOT NULL,
   emp_bio TEXT NOT NULL ,
  evaluationna VARCHAR(12) NOT NULL,
   grade1 INT(4) DEFAULT '0' ,
   PRIMARY KEY(evaluationna,emp_username,IDevaluator,grade1),
  CONSTRAINT R FOREIGN KEY(emp_username) REFERENCES employee(username) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT S FOREIGN KEY(IDevaluator) REFERENCES evaluator(idaks) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT T FOREIGN KEY(evaluationna,grade1) REFERENCES GRADE(evaluationname,gradenum1)
 ON DELETE CASCADE ON UPDATE CASCADE

 )ENGINE=InnoDB;

 CREATE TABLE AKSIOLOGISI2(
   ID_AKSIO INT(100) NOT NULL UNIQUE,
   manager_username VARCHAR(12) NOT NULL,
   report_manager TEXT NOT NULL,
   evaluationm VARCHAR(12) NOT NULL,
   grade2 INT(4) DEFAULT '0' ,
   PRIMARY KEY(ID_AKSIO,evaluationm,manager_username),
  CONSTRAINT U FOREIGN KEY(ID_AKSIO) REFERENCES evaluator(idaks) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT V FOREIGN KEY(evaluationm) REFERENCES GRADE(evaluationname) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT W FOREIGN KEY(manager_username) REFERENCES manager(managerUsername)
  ON DELETE CASCADE ON UPDATE CASCADE

 )ENGINE=InnoDB; 

 

 
 CREATE TABLE AKSIOLOGISI3(
  ID_EV INT(100) NOT NULL UNIQUE,
 evaluationmm VARCHAR(12) NOT NULL,
  num_project TINYINT(4) NOT NULL,
  emp_awards VARCHAR(35) NOT NULL,
  emp_certificate VARCHAR(35) NOT NULL,
  empl_username VARCHAR(12) NOT NULL,
  grade3 INT(2) DEFAULT '0', 
  PRIMARY KEY(ID_EV,evaluationmm,empl_username,num_project),
  CONSTRAINT X FOREIGN KEY(ID_EV) REFERENCES evaluator(idaks) ON DELETE CASCADE ON UPDATE CASCADE, 
  CONSTRAINT Y FOREIGN KEY(evaluationmm) REFERENCES GRADE(evaluationname) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT Z FOREIGN KEY(empl_username) REFERENCES employee(username)  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT NUMP FOREIGN KEY(num_project) REFERENCES project(num) ON DELETE CASCADE ON UPDATE CASCADE
 )ENGINE=InnoDB;


 /*CREATE TABLE PINAKASENERGEIWN(
 user_username VARCHAR(12) NOT NULL,
 wrakhmerominia TIMESTAMP,
 ektelesi CHAR(3) NOT NULL,
 eidos VARCHAR(6) NOT NULL,
 pinanaforas VARCHAR(25) NOT NULL,
 PRIMARY KEY(user_username),
 CONSTRAINT DSDS FOREIGN KEY(user_username) REFERENCES user(username)
 ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT  Pss FOREIGN KEY(user_username) REFERENCES manager(managerUsername) 
 ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT USEM FOREIGN KEY(user_username) REFERENCES employee(username)
 ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT USEV FOREIGN KEY(user_username) REFERENCES evaluator(username)
 ON DELETE CASCADE ON UPDATE CASCADE
 )ENGINE=InnoDB; */

 CREATE TABLE aitisiproagwgis (
   employeee_username VARCHAR(12) NOT NULL,
   pdfwork VARCHAR(35),
   jb_id INT(4) NOT NULL,
   PRIMARY KEY(employeee_username,jb_id),
   CONSTRAINT  KJOB FOREIGN KEY (jb_id) REFERENCES job(id)
   ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT A_EMPLOY FOREIGN KEY(employeee_username) REFERENCES employee(username) 
   ON DELETE CASCADE ON UPDATE CASCADE
 ) ENGINE=InnoDB;


 CREATE TABLE PINAKASENERGEIWN (
  PE_id int(4) NOT NULL AUTO_INCREMENT,
  usernam VARCHAR(12) NOT NULL,
  PK_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  katastasi INT(1) DEFAULT NULL,
  type ENUM('Insert','Update','Delete') DEFAULT NULL,
  nametable VARCHAR(12) NOT NULL,
  PRIMARY KEY (PE_id,usernam),
  CONSTRAINT pkpk FOREIGN KEY (usernam) REFERENCES user (username) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;