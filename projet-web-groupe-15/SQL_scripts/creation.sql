drop table answers;
drop table questions;
drop table categories;
drop table users;

CREATE TABLE categories
(
    id_category   INTEGER     NOT NULL
        constraint categories_pk
            primary key autoincrement,
    name_category varchar(30) NOT NULL
);

CREATE unique index categories_name_category_uindex
    on categories (name_category);


CREATE TABLE users
(
    id_user 	INTEGER NOT NULL
        constraint users_pk
            primary key autoincrement,
    firstname 	varchar(50) NOT NULL,
    lastname 	varchar(50) NOT NULL,
    email 	varchar(200) NOT NULL unique ,
    password 	varchar(100) NOT NULL,
    is_admin 	boolean DEFAULT false NOT NULL
);

create unique index users_email_uindex
    on users (email);

CREATE TABLE questions
(
    id_question      INTEGER NOT NULL
        constraint questions_pk
            primary key autoincrement,
    id_category      integer          NOT NULL
        REFERENCES categories,
    owner_of_question          integer          NOT NULL
        REFERENCES users,
    title_question   varchar(200) NOT NULL,
    subject_question text NOT NULL,
    is_solved        boolean   DEFAULT false NOT NULL,
    is_reported      boolean   DEFAULT false NOT NULL,
    question_date    TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'LOCALTIME')) NOT NULL
);

CREATE TABLE answers
(
    id_answer 		integer NOT NULL
        constraint answers_pk
            primary key autoincrement,
    id_question 	integer NOT NULL
        REFERENCES questions,
    owner_of_answer integer NOT NULL
        REFERENCES users,
    subject_answer 	text NOT NULL,
    is_right_answer 	boolean DEFAULT false NOT NULL,
    is_reported 		boolean DEFAULT false NOT NULL,
    date_answer		DATETIME DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'LOCALTIME'))  NOT NULL
);

INSERT INTO categories(name_category) VALUES ('Category');
INSERT INTO categories(name_category) VALUES ('Java');
INSERT INTO categories(name_category) VALUES ('JavaCript');
INSERT INTO categories(name_category) VALUES ('Python');
INSERT INTO categories(name_category) VALUES ('Algorithm');
INSERT INTO categories(name_category) VALUES ('Softwares');
INSERT INTO categories(name_category) VALUES ('C++');
INSERT INTO categories(name_category) VALUES ('Cobol');
INSERT INTO categories(name_category) VALUES ('SQLite');
INSERT INTO categories(name_category) VALUES ('C');
INSERT INTO categories(name_category) VALUES ('C#');
INSERT INTO categories(name_category) VALUES ('TypeCript');
INSERT INTO categories(name_category) VALUES ('Ruby');
INSERT INTO categories(name_category) VALUES ('Gitlab');
INSERT INTO categories(name_category) VALUES ('Ubuntu');
INSERT INTO categories(name_category) VALUES ('CSS');

INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (1, 'François', 'Vandeputte', 'francois.vandeputte@student.vinci.be', '$2b$10$X7UM9XZXxyyJa/2mk97OcOCdeVbQ/tDfEWjorZLxvuSsPXhGfEHjG', 1);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (2, 'Chehrazad', 'Ouazzani', 'chehrazad.ouazzani@student.vinci.be', '$2b$10$ZdPh019TrrT/.ATCjGSNz.qS5/6HyCxWC1Xe5kxNsiQmEZaQSpWDe', 1);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (3, 'Maria', 'Santa', 'maria.santa@student.vinci.be', '$2b$10$I5dWj0n6leBAtH.Q9rhZPO.K9NzyKqvq0iqw4GqV0bAG3xzNQTSvO', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (4, 'Chris', 'Tophe', 'chris.tophe@vinci.be', '$2b$10$0ZBC.KSVdOWHTbQkxgm.wu.u2dezluMTGZkvbYlvsA90fYSRu0C9m', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (5, 'Tristan', 'Letriste', 'tristan.letriste@vinci.be', '$2b$10$IzysA3isQaW3m7KIcSJqhuxdcPwlR.yYazHuqOt.HPJYTTAFQpU1q', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (6, 'Lucie', 'Vandeputte', 'lucie.vandeputte@student.vinci.be', '$2b$10$Uwh.Qd/CDNzSx31n/wpHRe9V/YNJdkV3dsAQGiSE5jZjsDvsDpgV.', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (7, 'Pierre', 'John', 'pierre.john@vinci.be', '$2b$10$vuyTW2UlKd24tM7qLMkax.WcxQUuv/GJZqhsnn3JNiY8xkALJM0Pu', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (8, 'Elon', 'Musk', 'elon.musk@vinci.be', '$2b$10$Dh493WYD4iDPMuyavoXLWu1P7u2V1nhzp6ld.e6gpTTCiV7bG2wIW', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (9, 'Elisabeth', 'Deux', 'elisabeth.deux@student.vinci.be', '$2b$10$jqnO6NA.HUGMhtcIktCruuEUQchBlpr8PVB41IWF9J2fHb8lqHUl.', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (10, 'Brad', 'Pitt', 'brad.pitt@student.vinci.be', '$2b$10$gghCRH9lU71Vm38FWjUL8eIMKtvNjDym/ejNJp2LPHnC72uTkrQMu', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (11, 'Angelina', 'Jolie', 'angelina.jolie@vinci.be', '$2b$10$h3SAUMbLUCpDzA6lIeVY6.B6yIU8zl0Y1Wfy1kwIdJZ1vEyDaC722', 1);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (12, 'Tom', 'Smith', 'tom.smith@vinci.be', '$2b$10$nDw9itaz/82yPWRZzncjquWi3wOtxAUYQuca4FwGRc99wQu6vFl0i', 0);
INSERT INTO users (id_user, firstname, lastname, email, password, is_admin) VALUES (13, 'Pedro', 'Sanchez', 'pedro.sanchez@student.vinci.be', '$2b$10$hph5XYketKhnfSQMHtXSP.fJLHlh8E3XgiLATQJaPpimWjJ11k0nq', 0);


INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (1, 6, 8, 'Want to buy Twitter !', 'Here''s my paypal to collect the funds !
www...', 0, 1, '2022-04-17 18:54:33');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (2, 14, 7, 'Problem to pull', 'Hello ! I have conflict merge. How to force git pull ? Thxx', 0, 0, '2022-04-17 19:02:48');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (3, 6, 9, 'How to copy paste on mac?', 'Good morning!
I would like to copy a text from a file. I used to press CTRL+C on my Windows but on Mac I don''t know, it really sad that Apple don''t make things easier....', 0, 0, '2022-04-17 19:07:55');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (4, 3, 4, 'how to hash password?', 'Hi, I am trying to create a website and I already created a database with the users but I would like to hash the code and I don''t know how to do it.', 0, 0, '2022-04-17 19:11:42');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (5, 5, 6, 'many if', 'hello my teacher gave us an exercice to write on paper but I have many if and it is not clean.
Any idea to have a clean code ? THANKS', 1, 0, '2022-04-17 19:35:08');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (6, 7, 5, 'how do we call an object on Unity ?', 'the question is on the title', 1, 0, '2022-04-17 19:42:48');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (7, 3, 11, 'how to create a table?', 'Hello, I am trying to create a table in my website please help me', 0, 0, '2022-04-17 19:44:12');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (8, 8, 3, 'how to display an error when increase my variable?', 'here''s my code:
ADD 1 TO J
END-ADD', 0, 0, '2022-04-17 19:51:31');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (9, 9, 12, 'how to search by title?', 'I am working with node js and sqlite and want to search data from database and return it', 0, 0, '2022-04-17 19:56:44');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (10, 8, 13, 'open file', 'how to open file and write in another file ?', 0, 0, '2022-04-17 20:03:11');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (11, 8, 13, 'date on Cobol', 'how to accept date from a variable', 1, 0, '2022-04-17 20:10:16');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (12, 2, 8, 'difference between integer and long', 'i don''t see the difference', 0, 0, '2022-04-17 20:23:03');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (13, 2, 10, 'Abstract class', 'can someone explain plz', 0, 0, '2022-04-17 20:26:58');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (14, 2, 10, 'problem with objects', 'String name = "John";
String name2= "John";

if( name == name2){
...
}
it never enter in the if I don''t know why ! Plz help', 0, 0, '2022-04-17 20:29:50');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (15, 12, 3, 'what is it TypeCript', 'I am beginner and want to learn something new can you provide me some cool websites plz', 0, 0, '2022-04-17 20:33:21');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (16, 4, 6, 'create a boolean', 'plz help', 0, 0, '2022-04-17 20:36:42');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (17, 14, 4, 'how does it work?', 'I don''t understand how I can work with my group on our project. The teacher said we have to push and pull how does it work please ?', 0, 0, '2022-04-17 23:11:09');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (18, 1, 7, 'want PS5', 'Please help me to find a PS5 for the birthday of my son!!', 0, 0, '2022-04-17 23:18:27');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (19, 15, 9, 'Command move', 'Hello!

Please help your queen, I would like to move a file in another directory.

Sincerely
Your Queen', 0, 0, '2022-04-17 23:32:46');
INSERT INTO questions (id_question, id_category, owner_of_question, title_question, subject_question, is_solved, is_reported, question_date) VALUES (20, 16, 11, 'Display', 'Hello, I am getting stucked with the CSS. I want to display my section with a lot of space between each label.

Help me please', 0, 0, '2022-04-17 23:38:20');


INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (1, 3, 4, 'OMG I love you my queen !!!!!!!!!!!!!! RIP Lady Di ', 0, 0, '2022-04-17 19:09:21');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (2, 2, 10, 'create a new project and pull', 0, 0, '2022-04-17 19:27:17');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (3, 3, 10, 'Hello Queen you are welcome to visit us in Hollywood and your grand son', 0, 0, '2022-04-17 19:28:04');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (4, 1, 10, 'Oh hii Elon long time no see ! Go check your paypall a little surprise with many zeroes ;) ', 0, 0, '2022-04-17 19:29:43');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (5, 4, 6, 'you working on PHP ? give us more details if you want us to help', 0, 0, '2022-04-17 19:32:33');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (6, 1, 6, 'that''s not the place to post this please remove this !', 0, 0, '2022-04-17 19:41:01');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (7, 4, 5, 'you must install bcrypt in your project + add those lines in your js file:
const bcrypt = require("bcrypt");
const saltRounds = 10;
...

and to save in your database:

pwd: bcrypt.hashSync(req.body.user_pwd, saltRounds)', 0, 0, '2022-04-17 19:41:42');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (8, 7, 3, 'it will be like this

<table>
        <tr>
            <th>Column1</th>
            <th>Column2</th>
        </tr>
        <tr>
            <td>row1 </td>
            <td>row2</td>
            <td>
        </tr>
</table>', 0, 0, '2022-04-17 19:47:07');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (9, 6, 3, 'hmm an Object (?) I am not sure I understand your question', 0, 0, '2022-04-17 19:48:25');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (10, 3, 3, 'To copy you must to press:
CMD + C
and to pass:
CMD + V', 0, 0, '2022-04-17 19:53:30');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (11, 6, 12, 'GameObject ', 1, 0, '2022-04-17 19:55:13');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (12, 2, 13, 'you have to stash your code and to pull', 0, 0, '2022-04-17 19:59:30');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (13, 5, 13, 'you have to use switch (integer){case 0: ...; break; case 1: ...; break; case 2: ... }', 1, 0, '2022-04-17 20:00:45');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (14, 13, 3, 'it''s abstract like it said', 0, 0, '2022-04-17 20:33:56');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (15, 9, 3, 'you asking a lot', 0, 0, '2022-04-17 20:34:25');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (16, 12, 3, 'both are for numbers', 0, 0, '2022-04-17 20:34:50');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (17, 10, 6, 'open *file* but write I don''t know sorry', 0, 0, '2022-04-17 20:38:00');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (18, 8, 7, 'you have to put : console.log("your error")', 0, 0, '2022-04-17 23:21:20');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (19, 1, 7, 'hi Elon I want to go to space plz', 0, 0, '2022-04-17 23:23:04');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (20, 17, 7, 'There is a powerfull website when you post a question it gives you thousands of answers it''s called GOOGLE !!!', 0, 0, '2022-04-17 23:24:09');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (21, 12, 7, 'I only use integer in my work , I can''t help sorry
', 0, 0, '2022-04-17 23:25:07');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (22, 16, 9, 'Hello !
What is a boolean my deer?

Sincerely
Your Queen', 0, 0, '2022-04-17 23:34:11');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (23, 11, 8, 'which format do you mean ? You can choose like you want ...', 0, 0, '2022-04-18 15:37:25');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (24, 20, 8, 'I hate CSS too feel u ! Good luck', 0, 0, '2022-04-18 15:37:58');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (25, 11, 2, 'ACCEPT *variableDate* FROM DATE YYYYMMDD

if you want the day of the week:

ACCEPT *variableDay* FROM DAY-OF-WEEK', 1, 0, '2022-04-18 16:19:51');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (26, 8, 6, 'ADD 1 TO J
   ON ERROR DISPLAY "..."
END-ADD', 0, 0, '2022-04-18 18:15:13');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (27, 18, 6, 'You have to ask in other website, here is for programmers so please delete your question or I''ll report it', 0, 0, '2022-04-18 18:18:44');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (28, 15, 9, 'Never heard of it', 0, 0, '2022-04-18 18:55:19');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (29, 19, 13, 'Hello ! You can use the man on the terminal to find out yourself ! ', 0, 0, '2022-04-18 19:46:08');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (30, 13, 13, 'abstract class doesn''t have a constructor you must asign it to another Object', 0, 0, '2022-04-18 19:47:16');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (31, 12, 9, 'long is for huge numbers so long > integer', 1, 0, '2022-04-18 19:58:52');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (32, 14, 9, 'you forgot it''s 2 objects so you must use equals !!', 0, 0, '2022-04-18 19:59:53');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (33, 20, 9, 'I have the same issue please help', 0, 0, '2022-04-18 20:00:29');
INSERT INTO answers (id_answer, id_question, owner_of_answer, subject_answer, is_right_answer, is_reported, date_answer) VALUES (34, 9, 9, 'you have to use LIKE in your query', 0, 0, '2022-04-18 20:01:04');