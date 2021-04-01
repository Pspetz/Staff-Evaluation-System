INSERT INTO COMPANY VALUES
('106204522','PATRAS','KUKNOS',2610234235,'ARXIEPISKOPOU','PATRAS','GREECE'),
('023453344', 'C Patras', 'EXPENDITURE Ltd', 2610256321, 'Maizonos',  'Patra', 'Greece'),
('023451232', 'A Patras', 'Typology Ltd', 2610231452, 'Korinthou', 'Patra', 'Greece'),
('123432211', 'A Geraka', 'SoftSol A.E.', 2103452133, 'Ahepa', 'Athina', 'Greece'),
('18765549', 'C Peiraia', 'Unigram', 2103452672, 'Karaiskaki', 'Peiraias', 'Greece'),
('561234561', 'GS 35321 L', 'InCodeWeTrust', 1242345612, 'Oxford', 'London', 'United Kingdom'),
('23122345', 'SF 1234 BG', 'SocialSc', 3200123451, 'General Sklevi', 'Sofia', 'Bulgaria');


INSERT INTO user VALUES
('cleogeo', 'upL34r', 'Cleomenis', 'Georgiadis', '2018-02-13 12:23:34', 'cleom17@gmail.com'),
('zazahir23', 'zoolhger', 'Ahmet', 'Mobasher-Hirs', '2017-05-11 14:08:23', 'ahmetTech@yahoo.com'),
('lionarF', 'erg2378', 'Freddy', 'Lionar', '2018-10-07 20:09:10', 'Lionarfre@ezra.co.uk'),
('liagourma', 'sionpass', 'Maria', 'Liagkoumi', '2018-05-22 17:03:01', 'mliagkr@gmail.com'),
('mnikol', 'm@n0lis', 'Manolis', 'Nikopoloulos', '2017-11-08 21:07:12', 'nikolp@gmail.com'),
('abrown', 'w1lcoxon', 'Andrew', 'McBrown', '2018-01-27 16:02:56', 'andrewbr@yahoo.com');


INSERT INTO manager VALUES
('panos15',2,'106204522','vathmos'),
('giorgosBotsas',4,'023453344','vathmos'),
('elenimakrh',2,'561234561','vathmos'),
('GiwtaDrymwna',10,'18765549','vathmos'),
('EricBugenhagen',20,'23122345','vathmos');

INSERT INTO evaluator VALUES
('msmith', 4, '18765549',2510),
('varcon82', 2 , '561234561',3363),
('bettyg', 6, '123432211',1098),
('papad', 5, '123432211',0987),
('n_tri', 8, '023451232',2671),
('Giankost', 8, '023451232',8762),
('pavkie', 10, '23122345',0672)
;


INSERT INTO user(username,password,name,surname,reg_date,email)VAlUES
('panos15', 'panagiotis10', 'panagiotis', 'spentzaris', '2016-06-23 13:12:34', 'panos15@unigram.com'),
('giorgosBotsas', 'kanoni12', 'giorgos', 'botsas', '2015-11-03 18:11:39', 'giorgosbotsas@thesi.com'),
('elenimakrh', 'elenh678', 'elenh', 'makrh', '2011-04-12 12:13:10', 'eleni14@softsol.gr'),
('GiwtaDrymwna', 'llaksudg', 'giota', 'drymwna', '2018-11-17 23:07:08', 'giota124@softsol.gr'),
('EricBugenhagen', 'steroids12', 'Eric', 'Bugenhagen', '2018-03-07 20:09:20', 'Ericnatty@typology.gr');


INSERT INTO user VALUES
('msmith', 'dsal;', 'smith', 'spentzaris', '2016-06-23 13:12:34', 'panos15@unigram.com'),                                             
('varcon82', 'piouef', 'kostas', 'botsas', '2015-11-03 18:11:39', 'giorgosbotsas@thesi.com'),                                        
('bettyg', 'esadds', 'bety', 'makrh', '2011-04-12 12:13:10', 'eleni14@softsol.gr'),
('papad', 'llagrtg', 'xristos', 'drymwna', '2018-11-17 23:07:08', 'giota124@softsol.gr'),
('Giankost', 'sweids12', 'vaios', 'Bugenhagen', '2018-03-07 20:09:20', 'Ericnatty@typology.gr'),
('pavkie', 'stw4rtids12', 'paulos', 'Bugenhagen', '2018-03-07 20:09:20', 'Ericnatty@typology.gr'),
("n_tri",'afdga','giorgos','tsel','2018-03-07 20:09:20','eleni14@softsol.gr');




insert into job (start_date, salary, position, edra, evaluator, announce_date, submission_date,id) values
('2019-01-01', 1800, 'data analyst', 'Patra, Greece', 'n_tri', '2018-07-13', '2018-12-20',10),
('2019-02-01', 1450, 'web programmer', 'Patra, Greece', 'n_tri', '2018-07-13', '2019-01-10',5),
('2019-02-01', 2100, 'mobile app developer', 'Patra, Greece', 'n_tri', '2018-10-24', '2018-01-12',12),
('2018-12-25', 2700, 'NLP expert', 'Peiraias, Greece', 'msmith', '2018-10-10', '2018-11-10',1),
('2019-03-01', 2100, 'Graphics designer', 'Peiraias, Greece', 'msmith', '2018-10-10', '2019-02-01',2),
('201-03-01', 2300, 'Visualization expert', 'Peiraias, Greece','Giankost', '2018-10-20', '2019-01-10',3),
('2019-05-01', 1850, 'web and mobile app programmer', 'Athina, Greece','papad', '2018-11-20', '2019-04-12',6),
('2019-05-01', 1600, 'graphics expert', 'Athina, Greece','bettyg', '2018-11-20', '2019-04-12',7),
('2019-05-01', 1850, 'DB expert', 'Athina, Greece','papad', '2018-11-20', '2019-04-12',9),
('2019-04-01', 2100, 'AI expert', 'Sofia, Bulgaria', 'pavkie', '2018-11-21', '2019-03-10',26),
('2019-02-01', 2600, 'Algorithmic efficiency expert', 'Sofia, Bulgaria', 'pavkie', '2018-11-01', '2019-01-16',14),
('2019-03-01', 2800, 'web and media programmer', 'Oxford, London', 'varcon82', '2018-11-01', '2019-01-03',11)
;

insert into antikeim VALUES  
('Databases', 'Level one element, child of Computer Science', 'Databases'),
('AI', 'Level one element, child of Computer Science', 'AI'),
('Algorithms', 'Level one element, child of Computer Science', 'Algorithms'),
('Networking', 'Level one element, child of Computer Science', 'Networking'),
('Graphics', 'Level one element, child of Computer Science', 'Graphics'),
('2D', 'Level two element, child of Graphics', '2D'),
('3D', 'Level two element, child of Graphics', '3D'),
('Animation', 'Level two element, child of Graphics', 'Animation'),
('Programming', 'Level one element, child of Computer Science', 'Programming'),
('Web Programming', 'Level two element, child of Programming', 'Web Programming'),
('Mobile Apps', 'Level two element, child of Programming', 'Mobile Apps');


INSERT INTO needs VALUES

(1, 'Databases'),
(1,'Algorithms'),
(2,'Programming'),
(2,'Web Programming'),
(3, 'Mobile Apps'),
(3, 'Animation'),
(5, 'AI'),
(5, 'Graphics'),
(6, 'Graphics'),
(6, 'Algorithms'),
(6, 'Programming'),
(7, 'Web Programming'),
(7, 'Mobile Apps'),
(6, '2D'),
(6, '3D'),
(9, 'Databases');

INSERT INTO employee VAlUES

('cleogeo',11234,106204522,4, 'Cleomenis is a secodary education graduate who has long work experience in web programming technologies (has worked for than 25 years in the field). He has been also certified as a CISCO security expert (CCIE Security) and an IT project manager (PMI Project Management Professional and Project Management Professional).', 'RecLetters.pdf', 'certifALL.pdf','Awardwin1.pdf'),
('zazahir23', 15620,106204522,5,'Mr Mobasher is a highly skilled web programmer who also has experience in 2d and 3d graphics generation as well as animation rendering. Moreover he has long experience with design, development and administration of large scale DBs, mostly relational.', 'Mobasher_rec.pdf', 'Mobasher-certif.pdf','MobasherAWard.pdf'),
('lionarF',89620,106204522,6,'Freddy is an experienced web programmer but has also worked on mobile apps development the last 5 years. He is a freelancer and can work from a distance. He can also manage 2d graphics and has long experience with DB scripting (My SQL, MariaDB, MS SQL Server and Oracle.', 'LionFr_letters.pdf', 'LionFR_cert.pdf',"LionAwards.pdf"),
('liagourma',10720,106204522,1, 'Mrs Liagkoumi has a long experience in NLP and more specifically Information Retrieval and has also long research background on both areas. In addition she has worked on large coprus datasets and data visualization algorithms.', 'lettersLiagk.pdf', 'trainingLiagk.pdf','liagAwards.pdf'),
('mnikol',10220,106204522,8, 'Mr Nikolopoulos holds a Computer Science diploma and an MSc and has long work experience in AI applications as well as Robotics. He has also managed large R&D projects in these domains and has teaching and research experience as well. Please refer to his referral letters for more details.','referralLetNikol.pdf','degreesAndCertNikol.pdf',"nik0Awards.pdf"),
('abrown',10856,106204522,7, 'Andrew has a strong theoretical background in Algorithms and Data Stuctures and has worked for more than a decade in a software house that specializes in high performance data management. He is well skilled in high complexity schemes and heavy load memory management.', 'lettersscannedMcBr.pdf', 'degrees-cert.pdf',"mcbrAwards.pdf")
;


INSERT INTO project VALUES

('abrown', 1, 'Minimal examples of data structures and algorithms in Python', 'https://github.com/a_brown/algorithms'),
('abrown', 2, 'Interactive Online Platform that Visualizes Algorithms from Code', 'https://github.com/a_brown/algorithm-visualizer'),
('abrown', 3, 'Repository which contains links and resources on different topics of Computer Science', 'https://github.com/a_brown/AlgoWiki'),
('mnikol', 1, 'Essential Cheat Sheets for deep learning and machine learning researchers', 'https://github.com/nikolo0p/cheatsheets-ai'),
('mnikol', 2, 'Python sample codes for robotics algorithms.', 'https://github.com/nikolo0p/PythonRobotics'),
('zazahir23',1,'Go Graphics - 2D rendering in Go with a simple API.','https://github.com/mob@s/gg'),
('zazahir23',2,'Draco is a library for compressing and decompressing 3D geometric meshes and point clouds. It is intended to improve the storage and transmission of 3D graphics.','https://github.com/mob@s/draco'),
('zazahir23',3,'Data Discovery and Lineage for Big Data Ecosystem.','https://github.com/linkedin/WhereHows'),
('lionarF', 1, 'HTML5 Mobile App UI templates created using Intel App Framework.', 'https://github.com/lionarGF/appframework-templates'),
('lionarF', 2, 'Mobile Version of Travel sample App using Couchbase Lite 2.0.', 'https://github.com/lionarFG/mobile-travel-sample'),
('lionarF', 3, 'Appium Demo App with clearly defined Page Object Pattern for React Native Mobile App. Test Language - Javascript.','https://github.com/lionarFG/Appium-Page-Object-Model-Demo'),
('liagourma', 1, 'WebGL2 powered geospatial visualization layers. offers an extensive catalog of pre-packaged visualization "layers", including ScatterplotLayer, ArcLayer, TextLayer, GeoJsonLayer, etc. The input to a layer is usually an array of JSON objects. Each layer offers highly-flexible API to customize how the data should be rendered.', 'https://github.com/liagk0R/deck.gl'),
('liagourma', 2, 'Messy datasets? Missing values? missingno provides a small toolset of flexible and easy-to-use missing data visualizations and utilities that allows a quick visual summary of the completeness (or lack thereof) of the dataset.','https://github.com/liagk0R/missingno'),
('liagourma', 3,'Repository to track the progress in Natural Language Processing (NLP), including the datasets and the current state-of-the-art for the most common NLP tasks','https://github.com/liagk0R/NLP-progress'),
('liagourma', 4,'Supporting Rapid Prototyping with a Toolkit (incl. Datasets and Neural Network Layers)', 'https://github.com/liagk0R/PyTorch-NLP')
;

insert into languages (employee, lang) values
('cleogeo', 'EN,SP,GR'),
('zazahir23', 'GR,EN'),
('lionarF', 'EN,FR'),
('liagourma', 'GR,EN'),
('mnikol', 'GR,FR'),
('abrown', 'EN,FR,SP');


INSERT INTO requestevaluation VALUES

('cleogeo', 2),
('cleogeo',7),
('zazahir23', 2),
('zazahir23',3),
('zazahir23',6),
('zazahir23',7),
('zazahir23',9),
('zazahir23',12),
('lionarF', 2),
('lionarF',3),
('lionarF',5),
('lionarF',6),
('lionarF',7),
('lionarF',9),
('lionarF',12),
('liagourma', 5),
('liagourma',6),
('liagourma',10),
('mnikol', 5),
('mnikol',11),
('abrown', 1),
('abrown', 9),
('abrown', 11)
;

INSERT INTO degree VALUES
('PTUXIO','CEID','UNIV'),
('Lysium certificate', '2nd Lysium of Aigaleo', 'LYKEIO'),
('Computer and Infromatics Eng.', ' Patras University', 'UNIV'),
('Electrical and Computer Eng.', 'Metsovio Polytexneio', 'UNIV'),
('Computer Science Dipl.', 'Lancster University', 'UNIV'),
('Computer Vision and Modelling', 'Princeton University', 'MASTER'),
('Artificial Intelligence', ' Cambrigde University', 'MASTER'),
('Big Data and Analytics', ' Imperial College London', 'MASTER'),
('Advanced Rendering Techniques', 'Delft University of Technology', 'MASTER'),
('Computer Science and Engineering', 'Delft University of Technology', 'UNIV'),
('Data Science Bachelor','Eindhoven University of Technology', 'UNIV'),
('PDEng Data Science', 'Eindhoven University of Technology', 'PHD'),
('NLP related high efficiency algorithms', 'Patras University', 'PHD'),
('Big Data Structures and Algorithms', 'Technical University of Denmark', 'MASTER')
;


insert into has_degree (empl_usrname, degr_title, degr_idryma, etos, grade) values
('cleogeo','Lysium certificate', '2nd Lysium of Aigaleo', 1999, 19.2),
('zazahir23', 'Computer Science and Engineering', 'Delft University of Technology',2000, 8.2),
('zazahir23', 'PDEng Data Science', 'Eindhoven University of Technology',2006, 9),
('lionarF', 'Electrical and Computer Eng.', 'Metsovio Polytexneio', 1998, 7.6),
('lionarF', 'Computer Vision and Modelling', 'Princeton University', 2001, 8.5),
('liagourma', 'Computer and Infromatics Eng.', ' Patras University', 2003, 8.6),
('liagourma', 'Artificial Intelligence', ' Cambrigde University', 2008, 8),
('liagourma', 'NLP related high efficiency algorithms', 'Patras University', 2013, 9),
('mnikol', 'Computer Science Dipl.', 'Lancster University', 2001, 8.4),
('mnikol', 'Computer Vision and Modelling', 'Princeton University', 2006, 7.4),
('abrown','Data Science Bachelor','Eindhoven University of Technology',2004, 9.2),
('abrown','Big Data and Analytics', ' Imperial College London', 2006, 8),
('abrown','Big Data Structures and Algorithms', 'Technical University of Denmark', 2008, 8.2);


INSERT INTO GRADE VALUES

(NULL,3,NULL,'msmith'),
 (null,null,2,'varcon82'),
 (2,3,2,'bettyg'),
 (3,1,1,'papad'),
  (3,3,null,'Giankost'),
  (3,null,2,'pavkie'),
  (1,3,2,'msmith'),
   (4,3,2,'papad');








INSERT INTO evaluationresult VALUES

(2510,'zazahir23',7,DEFAULT,'msmith'),
(1098,'lionarF',7,DEFAULT,'bettyg'),
(2671,'mnikol',12,DEFAULT,'papad'),
(0672,'abrown',9,DEFAULT,'pavkie'),
(3363,'cleogeo',5,DEFAULT,'varcon82');


INSERT INTO AKSIOLOGISI1 VALUES

(2510,'zazahir23','Mr Mobasher is a highly skilled web programmer who also has experience in 2d and 3d graphics generation as well as animation rendering. Moreover he has long experience with design, development and administration of large scale DBs, mostly relational.','msmith',NULL),
(1098,'lionarF','Freddy is an experienced web programmer but has also worked on mobile apps development the last 5 years. He is a freelancer and can work from a distance. He can also manage 2d graphics and has long experience with DB scripting (My SQL, MariaDB, MS SQL Server and Oracle.','varcon82',null),
(2671,'mnikol','Mr Nikolopoulos holds a Computer Science diploma and an MSc and has long work experience in AI applications as well as Robotics. He has also managed large R&D projects in these domains and has teaching and research experience as well. Please refer to his referral letters for more details.','bettyg',2),
(0672,'abrown','Andrew has a strong theoretical background in Algorithms and Data Stuctures and has worked for more than a decade in a software house that specializes in high performance data management. He is well skilled in high complexity schemes and heavy load memory management.','papad',3),
(3363,'cleogeo','Cleomenis is a secodary education graduate who has long work experience in web programming technologies (has worked for than 25 years in the field). He has been also certified as a CISCO security expert (CCIE Security) and an IT project manager (PMI Project Management Professional and Project Management Professional)','msmith',1);


INSERT INTO AKSIOLOGISI2 VALUES

(2510,'giorgosBotsas','he is a very skilled person with a lot of interest in his craft','msmith',3),
(1098,'panos15','he just gets the job done','bettyg',3),
(0672,'giorgosBotsas','he is an absolute perfectionist his work is on point','pavkie',null),
(3363,'panos15','he has good qualities and is very eager to work','varcon82',null),
(2671,'giorgosBotsas','poor work ethic not very obedient','papad',1);


INSERT INTO AKSIOLOGISI3 VALUES
(2510,'msmith',2,'MobasherAWard.pdf','Mobasher-certif.pdf','zazahir23',null),
(1098,'bettyg',2,'LionAwards.pdf','LionFR_cert.pdf','lionarF',2),
(0672,'pavkie',2,'mcbrAwards.pdf','degrees-cert.pdf','abrown',2),
(3363,'varcon82',2,'Awardwin1.pdf','certifALL.pdf','cleogeo',2),
(2671,'papad',2,'nik0Awards.pdf','degreesAndCertNikol.pdf','mnikol',2);




 INSERT INTO aitisiproagwgis VALUES
 ('zazahir23','aitish1.pdf',10),
 ('lionarF','aithsh2.pdf',11),
 ('mnikol','aithsh3.pdf',9),
 ('abrown','aithsh5.pdf',2),
 ('cleogeo','aithsh22.pdf',1);

 INSERT INTO PINAKASENERGEIWN VALUES
(2510,'panos15',2015-11-25,2,'Insert','degree'),
(1098,'giorgosBotsas',2014-10-25,3,'Update','user'),
(0672,'elenimakrh',2015-01-25,4,'Delete','employee'),
(3363,'GiwtaDrymwna',2017-05-25,5,'Insert','degree'),
(2671,'EricBugenhagen',2008-18-25,6,'Delete','degree');
