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
    id_user    INTEGER NOT NULL
        constraint users_pk
            primary key autoincrement,
    firstname  varchar(50) NOT NULL,
    lastname   varchar(50) NOT NULL,
    email  varchar(200) NOT NULL unique ,
    password   varchar(100) NOT NULL,
    is_admin   boolean DEFAULT false NOT NULL
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
    id_answer     integer NOT NULL
        constraint answers_pk
            primary key autoincrement,
    id_question    integer NOT NULL
        REFERENCES questions,
    owner_of_answer integer NOT NULL
        REFERENCES users,
    subject_answer     text NOT NULL,
    is_right_answer    boolean DEFAULT false NOT NULL,
    is_reported       boolean DEFAULT false NOT NULL,
    date_answer       DATETIME DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'LOCALTIME'))  NOT NULL
);


INSERT INTO categories(name_category) VALUES ('JavaScript');
INSERT INTO categories(name_category) VALUES ('PHP');

INSERT INTO users (firstname, lastname, email, password)
VALUES ('o', 'ch', 'o.ch@vinci.be', '$2a$10$.WZ.mXbfZC3lAiWC.xYCZ.viy6Kn0LTWM0D3/AzO2TZ4jgmYEozqe');
INSERT INTO users (firstname, lastname, email, password)
VALUES ('s', 'eb', 's.eb@vinci.be', '$2a$10$.WZ.mXbfZC3lAiWC.xYCZ.viy6Kn0LTWM0D3/AzO2TZ4jgmYEozqe');
INSERT INTO users (firstname, lastname, email, password, is_admin)
VALUES ('s', 'tef', 's.tef@vinci.be', '$2a$10$.WZ.mXbfZC3lAiWC.xYCZ.viy6Kn0LTWM0D3/AzO2TZ4jgmYEozqe', 1);
INSERT INTO users (firstname, lastname, email, password)
VALUES ('l', 'le', 'l.le@vinci.be', '$2a$10$.WZ.mXbfZC3lAiWC.xYCZ.viy6Kn0LTWM0D3/AzO2TZ4jgmYEozqe');

INSERT INTO questions (id_category, owner_of_question, title_question, subject_question, question_date )
VALUES (1, 1, 'Error not found', 'J’ai une erreur Not found quand je vais sur http://localhost:3000', '2022-05-06 09:00:00');
INSERT INTO questions (id_category, owner_of_question, title_question, subject_question, question_date)
VALUES (1, 3, 'module not found', 'J’ai une erreur quand je fais un npm start', '2022-05-05 09:00:00');
INSERT INTO questions (id_category, owner_of_question, title_question, subject_question, question_date)
VALUES (2, 3, 'Php property error', 'Error accessing object property $id', '2022-05-04 09:00:00');
INSERT INTO questions (id_category, owner_of_question, title_question, subject_question, is_reported, question_date)
VALUES (2, 1, 'Php report', 'fu... PHP', 1, '2022-05-03 09:00:00');
INSERT INTO questions (id_category, owner_of_question, title_question, subject_question, is_solved, question_date)
VALUES (1, 3, 'View not found', 'Je n’arrive pas à afficher ma vue index.js', true, '2022-05-02 09:00:00');
INSERT INTO questions (id_category, owner_of_question, title_question, subject_question, is_reported, question_date)
VALUES (1, 4, 'Js report', 'Comment debugger en JS', 1, '2022-04-30 09:00:00');

INSERT INTO answers (id_question, owner_of_answer, subject_answer, date_answer)
VALUES (5, 1, 'tu dois créer un routeur','2022-05-03 09:00:00');
INSERT INTO answers (id_question, owner_of_answer, subject_answer, is_right_answer, date_answer)
VALUES (5, 4, 'tu dois vérifier l’existence du fichier vue et ainsi que son chemin', 1,'2022-05-04 09:00:00');
INSERT INTO answers (id_question, owner_of_answer, subject_answer, is_reported, date_answer)
VALUES (3, 1, 'fu.. Php 1', 1,'2022-05-05 09:00:00');
INSERT INTO answers (id_question, owner_of_answer, subject_answer, is_reported, date_answer)
VALUES (3, 1, 'fu.. Php 2 ', 1,'2022-05-06 09:00:00');
INSERT INTO answers (id_question, owner_of_answer, subject_answer, is_reported, date_answer)
VALUES (3, 1, 'Il faut désérialiser l’objet', 1,'2022-05-07 09:00:00');
INSERT INTO answers (id_question, owner_of_answer, subject_answer, date_answer)
VALUES (4, 3, 'Php report réponse 1','2022-05-06 09:00:00');
INSERT INTO answers (id_question, owner_of_answer, subject_answer, date_answer)
VALUES (4, 3, 'Php report réponse 2','2022-05-07 09:00:00');
INSERT INTO answers (id_question, owner_of_answer, subject_answer, date_answer)
VALUES (1, 1, 'Error not found réponse','2022-05-07 09:00:00');