Q1. Retrieve details of students in 4th sem doing a project.

SELECT Fname,Lname,SRN,sem_sec, Cgpa, Dno
FROM STUDENT,PROJECT
WHERE proj_name=pname AND sem_sec LIKE '%4%';

  fname   |   lname   |    srn    | sem_sec | cgpa | dno
----------+-----------+-----------+---------+------+-----
 James    | Borg      | 888665555 | 4A      |  8.0 | 101
 Alicia   | Zelaya    | 999887777 | 4E      |  8.8 | 102
 Ramesh   | Narayan   | 666884444 | 4F      |  9.0 | 203
 Ahmed    | Jabbar    | 987987987 | 4B      |  9.4 | 201
 Ravi     | Kumar     | 135246789 | 4G      |  8.5 | 201
 Sheldon  | Cooper    | 335246789 | 4C      |  9.4 | 102
 George   | Clooney   | 435246789 | 4D      |  9.8 | 201
 Jimmy    | Fallon    | 635246789 | 4E      |  9.0 | 402
 Meryl    | Streep    | 735246789 | 4F      |  8.1 | 101
 Scarlett | Johansson | 935246789 | 4H      |  9.9 | 402
 Jimmy    | Kimmel    | 665246789 | 4E      |  9.1 | 102
 Hannah   | Peitersen | 888246789 | 4H      |  5.9 | 102
 Diya     | Shah      | 881146789 | 4H      |  5.9 | 102
(13 rows)

Q2. Retrieve details of students who have finished a project along with the project details, ordered alphabetically by the first name. 

SELECT S.Fname,S.Lname, S.SRN, P.Pname 
FROM  STUDENT AS S, PROJECT AS P 
WHERE P.Status = 'Done' AND  P.Pname =S.Proj_name 
ORDER BY S.Fname, S.Lname; 

  fname   |   lname   |    srn    |  pname
----------+-----------+-----------+----------
 Diya     | Shah      | 881146789 | ProductU
 Emma     | Stone     | 835246789 | ProductJ
 Franklin | Wong      | 333445555 | ProductY
 Gina     | Rogriguez | 276738946 | ProductW
 James    | Borg      | 888665555 | ProductX
 Jimmy    | Fallon    | 635246789 | ProductH
 Jimmy    | Kimmel    | 665246789 | ProductM
 Mike     | Hannigan  | 935206789 | ProductT
 Pheobe   | Buffay    | 935946789 | ProductO
 Taylor   | Swift     | 535246789 | ProductG
 Tony     | Stark     | 035246789 | ProductL
 Will     | Buyers    | 235246789 | ProductD
(12 rows)

Q3. Retrieve the names of students working on a project or internship under the domain B.

( SELECT Fname, Lname  
  FROM STUDENT,PROJECT   
  WHERE Domain1 = 'Domain B'
	AND Pname = Proj_name)   
UNION 
( SELECT Fname, Lname   
  FROM STUDENT,INTERNSHIP   
  WHERE Domain1 = 'Domain B'   
        AND S_srn=SRN );

  fname   |   lname
----------+-----------
 Chandler | Bing
 Ellie    | Thumann
 Jadeja   | Joshi
 Jay      | Kapoor
 Joey     | Tribianni
 Katrina  | Benett
 Kimball  | Choo
 Monica   | Geller
 Nancy    | Davis
 Ray      | Romano
 Wayne    | Rigsby
 Will     | Buyers
(12 rows)


Q4. Retrieve the details of students working on a project under Chandler along with details of the project.

SELECT S.Fname, S.Lname, S.SRN, P.Pname, P.Status  
FROM STUDENT AS S,PROJECT AS P,FACULTY AS F   
WHERE F.Fname = 'Chandler'
      AND F.Fid = P.F_id AND P.Pname= S.Proj_name;

 fname  |   lname   |    srn    |  pname   | status
--------+-----------+-----------+----------+---------
 Alicia | Zelaya    | 999887777 | ProductP |  Done
 Jimmy  | Kimmel    | 665246789 | ProductM | Done
 Lily   | Singh     | 935246780 | ProductN | Ongoing
 Pheobe | Buffay    | 935946789 | ProductO | Done
 Hannah | Peitersen | 888246789 | ProductS | Ongoing
 Mike   | Hannigan  | 935206789 | ProductT | Done
(6 rows)

Q5. Retrieve the details of faculty who are supervising projects.

SELECT DISTINCT Fid, Fname, Contact, Email_Id
FROM FACULTY, PROJECT   
WHERE F_id=Fid;

 fid |  fname   |  contact   |       email_id
-----+----------+------------+----------------------
  43 | Suresh   | 8574373332 | suresh0@gmail.com
  23 | Avinash  | 7783876661 | avi776 @gmail.com
   3 | Shruthi  | 8784789787 | shruthik2@gmail.com
  21 | Naveen   | 9783873971 | naveen34@gmail.com
  22 | Raghu    | 7783873891 | raghu123@gmail.com
   1 | Shylaja  | 9875646465 | shylaja23@gmail.com
  32 | Anil     | 9119372519 | anil223@gmail.com
  12 | Shilpa   | 8783865341 | shilpa55@gmail.com
   4 | Mamtha   | 7778884447 | mamtha22@gmail.com
  14 | Chandler | 8789473281 | chandi102@gmail.com
  41 | Ashwini  | 9574373332 | ashwini00@gmail.com
  42 | Sowmya   | 9577373332 | sowmya2@gmail.com
  11 | Roopa    | 8783873771 |
   2 | Deepa    |            | deepas@gmail.com
  31 | Ramesh   | 9574372219 | rameshjs33@gmail.com
(15 rows)

Q6. List the first name and last name of students who are works on the projects controlled by department number 201.

SELECT fname,lname
FROM STUDENT,WORKS_ON,PROJECT
WHERE dno=201 AND proj_name=pname AND srn=ssrn;

 fname  |  lname
--------+---------
 Joyce  | English
 Ahmed  | Jabbar
 Ravi   | Kumar
 George | Clooney
(4 rows)

Q7. Retrieve the average CGPA of all the students of each department.

SELECT dno,AVG(cgpa),MAX(cgpa),MIN(cgpa)
FROM STUDENT
GROUP BY dno;

 dno |        avg         | max | min
-----+--------------------+-----+-----
 102 | 8.3533333333333333 | 9.8 | 5.9
 101 | 8.4230769230769231 | 9.3 | 7.6
 402 | 8.7875000000000000 | 9.9 | 6.9
 203 | 7.9200000000000000 | 9.5 | 5.9
 201 | 9.1230769230769231 | 9.9 | 7.1
(5 rows)

Q8. Retrieve the details of all the students doing an internship.

SELECT fname,lname,srn, Birth_date, Sem_sec, Cgpa
FROM STUDENT, INTERNSHIP
WHERE s_srn= SRN;

  fname   |   lname   |    srn    | birth_date |  sem_sec  | cgpa
----------+-----------+-----------+------------+-----------+------
 Jay      | Kapoor    | 896235179 | 1998-12-01 | 6J        |  7.3
 Bhumi    | Lakshmi   | 357935179 | 1999-07-21 | 4I        |  8.4
 Louis    | Litt      | 776687987 | 2000-03-29 | 2D        |  9.9
 Teresa   | Lisbon    | 234500893 | 1998-11-14 | 6B        |  6.9
 Grace    | Vanpelt   | 670916739 | 1997-12-19 | 6A        |  7.4
 Wayne    | Rigsby    | 903401235 | 2000-10-31 | 4J        |  8.5
 Kimball  | Choo      | 233289107 | 1999-05-03 | 6E        |  9.3
 Margo    | Robbie    | 568910234 | 1998-08-14 | 8G        |  7.2
 Erica    | Flynn     | 378890234 | 1999-05-16 | 4K        |  5.9
 Sneha    | Shankar   | 689235179 | 1999-02-24 | 4G        |  8.4
 Patrick  | Jane      | 823401235 | 2000-10-01 | 4B        |  8.2
 Nancy    | Davis     | 643289107 | 1999-05-13 | 6C        |  7.9
 Julia    | Bernhardt | 328910234 | 1998-08-24 | 8C        |  9.8
 Shruthi  | Bhat      | 347890234 | 1999-05-06 | 4G        |  9.9
 Roopa    | Joshi     | 678235179 | 1999-02-20 | 4H        |  9.3
 Matt     | Damon     | 865246789 | 1999-06-28 | 4A        |  9.1
 Ellie    | Thumann   | 915246780 | 1997-11-30 | Graduated |  8.6
 Meghan   | Fox       | 935911189 | 1998-10-16 | 6G        |  9.8
 Tobias   | Eaton     | 886746789 | 1998-05-21 | 4D        |  5.9
 Karan    | Saxena    | 905206789 | 1999-04-28 | 6F        |  8.9
 Ray      | Romano    | 485063589 | 1998-02-23 | 6D        |  9.4
 Lincoln  | Jackson   | 935539027 | 2000-08-21 | 4E        |  9.6
 Vicky    | Kaushal   | 300039263 | 1997-05-16 | 8G        |  9.2
 Nate     | Duncan    | 233173819 | 1999-09-11 | 4A        |  8.8
 Katrina  | Benett    | 998235179 | 1999-12-12 | 6I        |  7.3
 John     | Smith     | 123456789 | 1999-01-09 | 4C        |  8.5
 Jadeja   | Joshi     | 908235179 | 1998-10-20 | 4K        |  7.1
 Serena   | Williams  | 568235179 | 1998-02-22 | 6A        |  8.3
 David    | Dobrik    | 273235179 | 1998-02-20 | 4B        |  6.3
 Jordan   | Belford   | 778235179 | 1999-02-20 | 4A        |  9.3
 Jim      | Halpert   | 673216739 | 1997-02-21 | 8A        |  9.5
 Rachel   | Green     | 376491827 | 1999-05-07 | 4A        |  9.6
 Monica   | Geller    | 267891236 | 1998-10-11 | 6F        |  8.3
 Chandler | Bing      | 726358901 | 2000-03-22 | 4G        |  9.1
 Joey     | Tribianni | 162738946 | 1997-08-19 | Graduated |  8.8
 Phoebe   | Buffay    | 639281289 | 1999-06-21 | 4C        |  7.6
 Meredith | Grey      | 377289346 | 1999-03-30 | 4A        |  8.2
 Cristina | Yang      | 178263589 | 1998-02-23 | 6D        |  9.4
 Alex     | Karev     | 762539027 | 2000-08-21 | 4E        |  9.6
 Michael  | Ross      | 362719263 | 1997-05-16 | 8G        |  9.2
 Tony     | Stark     | 789273819 | 1999-09-11 | 4A        |  8.8
 Alexis   | Castle    | 486491827 | 1999-05-07 | 4A        |  9.6
 Tyrion   | Jacob     | 867891236 | 1998-10-11 | 6F        |  8.3
 Jamie    | Wheet     | 452358901 | 2000-03-22 | 4G        |  9.1
 Michelle | Scott     | 475381289 | 1999-06-21 | 4C        |  7.6
 Drew     | Barrymore | 928489346 | 1999-03-30 | 4A        |  8.2
(46 rows)