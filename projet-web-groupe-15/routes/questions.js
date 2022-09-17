const express = require('express');
const router = express.Router();
const Questions = require('../models/Question.js');
const Answers = require('../models/Answer.js');
const Users = require('../models/User.js');
const Categories = require('../models/Category');

/* get question page */
router.get('/', (req, res, next) => {
    req.session.id_question = req.query.questionId;

    let question = Questions.questionByID(req.session.id_question);
    let answers = Answers.listByGoodAnswer(req.session.id_question);
    let user = Users.userByID(question.owner_of_question);

    req.session.is_question_of_user = false;

    if (req.session.login) {
        if (user.id_user === req.session.login.id_user) {
            req.session.is_question_of_user = true;
        }
    }
    /*nice date strings for the question and each answer*/
    const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
    answers.forEach(element => {
        element.date_answer = new Date(element.date_answer);
        element.date_answer = element.date_answer.toLocaleDateString(undefined, options);
        element.owner_of_answer = Users.userByID(element.owner_of_answer);
    });

    question.question_date = new Date(question.question_date);
    question.question_date = question.question_date.toLocaleDateString(undefined, options);

    res.render('questions/index', {
        error: req.session.error,
        question: question,
        answer: answers,
        loggedIn: req.session.login,
        category: Categories.list(),
        user_of_question: user,
        category_question: Categories.categoryByID(question.id_category),
        question_belong_user: req.session.is_question_of_user,
    });

    req.session.error = null;
});

/* show add question view */
router.get('/add', (req, res, next) => {
    if (req.session.login) {
        res.render('questions/create', {
            error: req.session.error,
            loggedIn: req.session.login,
            category: Categories.list(),
        });
        req.session.error = null;
    } else {
        res.redirect('/');
    }
});

/* add question */
router.post('/add', (req, res, next) => {
    let titleQuestion = req.body.titleQuestion;
    let subjectQuestion = req.body.subjectQuestion;

    if (titleQuestion.length < 1 || subjectQuestion.length < 1) {
        req.session.error = "Empty question";
        res.redirect('/questions/add');
    } else {
        let question = Questions.save({
            category: req.body.categoryQuestion,
            owner_of_question: req.session.login.id_user,
            titleQuestion: titleQuestion,
            subject: req.body.subjectQuestion
        });
        res.redirect('/questions?questionId=' + question.id_question);
    }
});

/* add answer */
router.post('/answers/add', (req, res, next) => {
    let question = Questions.questionByID(req.session.id_question);

    if (req.body.user_answer <= 0) {
        req.session.error = "Empty answer";
        res.redirect('/questions?questionId=' + req.session.id_question);
    } else {
        Answers.save({
            question_id: req.session.id_question,
            owner_of_answer: req.session.login.id_user,
            sub_answer: req.body.user_answer,
            loggedIn: req.session.login,
            question: question
        });
    }
    res.redirect('/questions?questionId=' + req.session.id_question);
});

/*report a question*/
router.post('/report', (req, res, next) => {
    Questions.report(req.session.id_question);
    res.redirect('/questions?questionId=' + req.session.id_question);
});

/*report with buttons on main page*/
router.post('/reportMainPage', (req, res, next) => {
    Questions.report(req.body.id_question);
    res.redirect('/');
});

/*report an answer*/
router.post('/answers/report', (req, res, next) => {
    Answers.report(req.body.answerId);
    res.redirect('/questions?questionId=' + req.session.id_question);
});

/*validate an answer*/
router.post('/answers/validate', (req, res, next) => {
    Questions.closeQuestion(req.session.id_question);
    Answers.rightAnswer(req.body.answerId);
    res.redirect('/questions?questionId=' + req.session.id_question);
});

/*random question*/
router.get('/random', (req, res, next) => {
    let question = Questions.randomQuestion();
    res.redirect('/questions?questionId=' + question.id_question);
});

module.exports = router;