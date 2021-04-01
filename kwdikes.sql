STORED 1:

CREATE PROCEDURE gs(IN u_name VARCHAR(10),IN u_surname VARCHAR(10))
BEGIN
DECLARE num1 INT(3);
DECLARE num2 INT(3);
DECLARE num3 INT(3);
SELECT job_id FROM requestevaluation INNER JOIN employee ON employee.username=requestevaluation.empl_username INNER JOIN user ON  employee.username=user.username WHERE user.name LIKE u_name AND user.surname LIKE u_surname;
SELECT gradenum1,gradenum2,gradenum3,user.name,user.surname FROM GRADE INNER JOIN evaluator ON GRADE.evaluationname=evaluator.username INNER JOIN user WHERE evaluator.username=user.username ;

END $




/* STORED 2-3: */


DELIMITER $
CREATE PROCEDURE FOREMPLOYEE (IN id INT(4) , username VARCHAR(12))
BEGIN 
DECLARE eva_emp INT(4);
DECLARE evaluation_usr VARCHAR(12);
DECLARE graden_1 INT(4);
DECLARE graden_2 INT(4);
DECLARE graden_3 INT(4);
DECLARE inadequate_employee INT DEFAULT FALSE;
DECLARE sufficient_employee  INT DEFAULT FALSE;
DECLARE notevaluatedyet INT DEFAULT FALSE;
DECLARE work INT;
DECLARE work_1 INT;
DECLARE text VARCHAR(255) DEFAULT " ";


DECLARE employee_cursor CURSOR FOR 
SELECT employeee_username FROM aitisiproagwgis WHERE jb_id=id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET work = 1;

OPEN employee_cursor;
set work =0;


   CREATE TABLE inadequate_employees(
    empl_usr VARCHAR(12) NOT NULL,
    grad int(4),
    tex varchar(255)
    );

   
    create table sufficient_employees(
    employee_usr VARCHAR(12) NOT NULL,
    gradee int(4),
    textt varchar(255)
    );

    create table notevaluatedyet(
    employ_user VARCHAR(12) NOT NULL,
    gra int(4),
    te varchar(255)
    ); 


FETCH employee_cursor INTO username;

while work = 0 do 
SET inadequate_employees=0;
SET sufficient_employees =0;
SET notevaluatedyet=0;
SET graden_1= null;
set graden_2=null;
set graden_3=null; 
set text= " "; 

BEGIN 
declare continue handler for not found set work_1=1;
SELECT count(evaluationresult.evid) INTO eva_emp 
FROM evaluationresult
WHERE evaluationresult.empl_usrname=username AND evaluationresult.job_id=id
group by evaluationresult.empl_usrname;
set work=0;
end;

  if eva_emp = 0 THEN
       set text = CONCAT(text, "Not fully evaluated yet");
	   set inadequate_employee = 1;
     END IF;

if  inadequate_employees= 0 then 
SELECT gradenum1,gradenum2,gradenum3 INTO graden_1,graden_2,graden_3 
FROM GRADE 
WHERE GRADE.evaluationname=username AND evaluationresult.job_id=id
end if;

if (graden_1 < 2) THEN
      SET text = CONCAT_WS( ' ',text, "Failed the evaluation");
      set inadequate_employee = 1;

  elseif (graden_1>=2 AND graden_1<=4) THEN
      SET text = CONCAT_WS (' ','text', "Passed the evaluation");
      set sufficient_employee = 1;

  elseif (graden_1>4) then
      set text = CONCAT_WS (' ','text', "Not valid score.");
      set notevaluatedyet = 1;

  elseif (graden_1= null) then
      set text = CONCAT_WS (' ', 'text', "Not evaluated yet.");
      set notevaluatedyet=1;
  end if;

  if (graden_2 < 2) THEN
      SET text = CONCAT_WS( ' ','text', "Failed the evaluation");
      set inadequate_employee = 1;

	elseif (graden_2=2 AND graden_2<=4) THEN
      SET text = CONCAT_WS (' ','text', "Passed the evaluation");
      set sufficient_employee = 1;      

	elseif (graden_2>4) then
      set text = CONCAT_WS (' ','text', "Not valid score.");
      set notevaluatedyet = 1;

	elseif (graden_2= null) then
      set text = CONCAT_WS (' ', 'text', "Not evaluated yet.");
      set notevaluatedyet=1;
	end if;


     
	if (graden_3 < 1) THEN
      SET text = CONCAT_WS( ' ','text', "Failed the evaluation");
      set inadequate_employee = 1;

    elseif (graden_3>=1 AND graden_3<=2) THEN
      SET text = CONCAT_WS (' ','text', "Passed the evaluation");
      set sufficient_employee = 1;
      
	elseif (graden_3>2) then
      set text = CONCAT_WS (' ','text', "Not valid score.");
      set notevaluatedyet = 1;

	elseif (graden_3= null) then
      set text = CONCAT_WS (' ', 'text', "Not evaluated yet.");
      set notevaluatedyet=1;
     end if;

      if inadequate_employee = 1 then
      insert into inadequate_employees (empl_usr, grad, tex)
      SELECT username, grade, 'text';
    end if;

    if sufficient_employee = 1 then
      insert into sufficient_employees (employee_usr, gradee, textt)
      select username, grade, 'text';
      insert into GRADE (graden_1,graden_2, graden_3,evaluationname)
      select evaluationresult.empl_usrname, grade
      from evaluationresult
      where evaluationresult.empl_usrname = username and evaluationresult.job_id = id
          group by evaluationresult.empl_usrname;
     end if;


     if notevaluatedyet = 1 then
      insert into notevaluatedyet (employ_usr, gra, te)
      (SELECT COUNT(employ_usr) AS numberofnotevaluatedemployees from notevaluatedyet) UNION
      (SELECT username, grade, 'text' from notevaluatedyet) UNION
      (select concat_ws ('Evaluation in progress.', numberofnotevaluatedemployees, 'on hold'));
       end if;

        if notevaluatedyet = 0 then
      (select 'Evaluation completed.') UNION
      (SELECT 'Finalized Tables');
	 end if;
                    
	 fetch employee_cursor into username;
end while;

close employee_cursor;

    select * from inadequate_employees;
    
    select * from notevaluatedyet;
    
    
    select * from sufficient_employees
    order by gradee DESC;
    drop table inadequate_employees,notevaluatedyet, sufficient_employees;
    END$
    
    DELIMITER ;




/* O TRIGGER POU UPOLOGIZEI AUTOMATA THN VATHMOLOGIA STON PINAKA GRADE: */
 
DROP TRIGGER if exists
delimiter $
CREATE TRIGGER FinalGrade AFTER INSERT ON GRADE FOR EACH ROW
    
 Begin

     Declare grade1 INT;
     Declare grade2 INT;
     DECLARE grade3 INT;
     Declare sum INT;
         
         
    select gradenum1 INTO grade1 FROM GRADE; 
    select gradenum2 INTO grade2 FROM GRADE;
    select gradenum3 INTO grade3 FROM GRADE;
	set sum= grade1+ grade2 +grade3;
   insert into evaluationresult(grade) Value (sum);

end $
set @sum=5+4+3;
set @sum as 'total amm';


/*TRIGGERS GIA UPDATE,DELETE,INSERT */

SET @Time=0; 
SET @Namepr=" ";

/* job */

DELIMITER $
CREATE TRIGGER j_insert_before BEFORE INSERT ON job
FOR EACH ROW
BEGIN
SET @Time=NOW();
INSERT INTO PINAKASENERGEIWN VALUES (NULL,new.evaluator,NOW(),"insert",'job');
END $
DELIMITER ;

/* UPDATE job 
SET evaluator='kostas'
WHERE id=10;
*/


DELIMITER $
CREATE TRIGGER j_insert_after AFTER INSERT ON job
FOR EACH ROW
BEGIN
UPDATE PINAKASENERGEIWN set katastasi = 1 WHERE PK_date=@Time;
END $

DELIMITER $
CREATE TRIGGER j_update_before BEFORE UPDATE ON job
FOR EACH ROW
BEGIN
SET @Time=NOW();
insert into PINAKASENERGEIWN VALUES (NULL,old.evaluator, NOW(),0,"update", 'job');
END $

DELIMITER $
CREATE TRIGGER j_update_after AFTER UPDATE ON job
FOR EACH ROW
BEGIN
UPDATE PINAKASENERGEIWN set katastasi =  1 WHERE PK_date =@Time;
END $

DELIMITER $
CREATE TRIGGER j_delete_before BEFORE DELETE ON job
FOR EACH ROW
BEGIN
SET @Time=NOW();
insert into PINAKASENERGEIWN VALUES(NULL,old.evaluator,NOW(),0,"Delete",'job');
END $


DELIMITER $
CREATE TRIGGER j_delete_after AFTER DELETE ON job
FOR EACH ROW
BEGIN
UPDATE log set katastasi =  1 WHERE PK_date =@Time;
END $

/* EMPLOYEE TRIGGERS */ 

CREATE TRIGGER empl_insert_before BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
SET @Time=NOW();
insert into PINAKASENERGEIWN VALUES (NULL,new.username,NOW(), 0, "Insert",'employee');
END $


CREATE TRIGGER empl_insert_after AFTER INSERT ON employee
FOR EACH ROW
BEGIN
UPDATE log set katastasi =  1 WHERE PK_date =@Time; 
END $

DELIMITER $
CREATE TRIGGER empl_update_before BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
SET @Time=NOW();
INSERT INTO PINAKASENERGEIWN  VALUES (NULL,old.username,NOW(), 0, "Insert",'employee');
END $


DELIMITER $
CREATE TRIGGER empl_update_after AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
UPDATE PINAKASENERGEIWN set katastasi =  1 WHERE PK_date=@Time;
END $


DELIMITER $
CREATE TRIGGER empl_delete_before BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
SET @Time=NOW();
insert into PINAKASENERGEIWN values( NULL, old.username, NOW(), 0, "Delete", 'employee');
END $



DELIMITER $
CREATE TRIGGER empl_delete_after AFTER DELETE ON employee
FOR EACH ROW
BEGIN
UPDATE log set katastasi =  1 WHERE PK_date=@Time;
END $

/*triggers gia to requestsevaluation*/



DELIMITER $
CREATE TRIGGER requestsev_insert_before BEFORE INSERT ON requestevaluation
FOR EACH ROW
BEGIN
SET @Time=NOW();
insert into PINAKASENERGEIWN values(NULL, new.empl_username, NOW(), 0, "Insert", 'requestevaluation');
END $



DELIMITER $
CREATE TRIGGER requestsev_insert_after AFTER INSERT ON requestevaluation
FOR EACH ROW
BEGIN 
UPDATE PINAKASENERGEIWN set katastasi= 1 WHERE PK_date =@Time;
END $



DELIMITER $
CREATE TRIGGER requestsev_update_before BEFORE UPDATE ON requestevaluation
FOR EACH ROW
BEGIN
SET @Time=NOW();
insert into PINAKASENERGEIWN VALUES( NULL, new.empl_username, NOW(), 0, "Update", 'requestevaluation');
END $



DELIMITER $
CREATE TRIGGER requestev_update_after AFTER UPDATE ON requestevaluation
FOR EACH ROW
BEGIN
UPDATE PINAKASENERGEIWN set katastasi = 1 WHERE PK_date=@Time;
END $



DELIMITER $
CREATE TRIGGER requestev_delete_before BEFORE DELETE ON requestevaluation
FOR EACH ROW
BEGIN
SET @Time=NOW();
insert into PINAKASENERGEIWN VALUES(NULL, old.empl_username, NOW(),0,"Delete",'requestevaluation'); 
END $




DELIMITER $
CREATE TRIGGER requestev_delete_after AFTER DELETE ON requestevaluation
FOR EACH ROW
BEGIN
UPDATE PINAKASENERGEIWN set katastasi = 1 WHERE PK_date = @Time;
END $
DELIMITER ;



/* trigger gia enimerwsi tis etaireias */

SET @Namepr="";

 DELIMITER $
 CREATE TRIGGER comp_update_before BEFORE UPDATE ON COMPANY
 FOR EACH ROW
 BEGIN
 set new.AFM = old.AFM;
 set new.DOY = old.DOY;
 set new.name = old.name;
 SET @Time=NOW();
 select username into @Namepr from manager where firm = new.AFM Limit 0,1;
 insert into PINAKASENERGEIWN values( NULL, @Namepr, NOW(), 0, "Update", 'COMPANY');
 END $
 



DELIMITER $
CREATE TRIGGER comp_update_after AFTER UPDATE ON COMPANY
FOR EACH ROW
BEGIN
UPDATE PINAKASENERGEIWN set katastasi =  1 WHERE PK_date =@Time;
END $
DELIMITER ;


/*trigger ο οποίος αν οποιοσδήποτε χρήστης, εκτός του διαχειριστή
(administrator), προσπαθήσει να αλλάξει στοιχεία στο προφίλ του, τα οποία δεν επιτρέπεται
να μεταβάλει, να μην του το επιτρέπει */


DELIMITER $
CREATE TRIGGER updateFORUSER UPDATE ON user 
FOR EACH ROW

BEGIN

   DECLARE userforemployee VARCHAR(12);
   DECLARE userformanager VARCHAR(12); 
   DECLARE userforevaluator VARCHAR(12);
   Declare usernameuser VARCHAR(12);
   Set userforemployee ='';
   Set userformanager ='';
   Set userforevaluator ='';
   set usernameuser ='';
   
   select username into usernameuser From user;

   Select username Into userforemployee FROM employee INNER JOIN user ON employee.username=user.username Where employee.username=user.username;

   Select managerUsername Into userformanager FROM manager INNER JOIN user ON manager.managerUsername=user.username Where manager.managerUsername=user.username;

   Select username Into userforevaluator FROM evaluator INNER JOIN user ON evaluator.username=user.username Where evaluator.username=user.username; 
   
   set new.username=old.username;
   
   if (usernameuser=userforemployee OR usernameuser=userformanager) then
   set new.name=old.name;
   set new.surname=old.surname;
   set new.reg_date= old.reg_date;
   end if;
   
   if (usernameuser=userforemployee) then
		set new.email=old.email;
	end if;
END$
DELIMITER ;




DELIMITER $
CREATE TRIGGER UpdateFORmanager before update ON manager
For each row
BEGIN
	set new.firm=old.firm;
	set new.exp_years=old.exp_years;
	
END$
DELIMITER ;




