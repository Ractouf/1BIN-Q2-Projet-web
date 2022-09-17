const express = require('express');
const router = express.Router();
const Questions = require('../models/Question');
const Answers = require('../models/Answer');
const Categories = require('../models/Category');

/*get admin page*/
router.get('/', (req, res, next) => {
    if (req.session.login) {
        if (req.session.login.is_admin) {
            res.render('admins/index', {
                loggedIn: req.session.login,
                category: Categories.list(),
                reportedQuestion: Questions.listReported(),
                reportedAnswer: Answers.listReported()
            });
        }
    } else {
        res.redirect('/');
    }
});

/*delete a reported question*/
router.post('/report/question/accept', (req, res, next) => {
    Questions.delete(req.body.questionId);
    res.redirect('/admins');
});

/*unreport a reported question*/
router.post('/report/question/decline', (req, res, next) => {
    Questions.unReportQuestion(req.body.questionId);
    res.redirect('/admins');
});

/*delete a reported answer*/
router.post('/report/answer/accept', (req, res, next) => {
    let answer = Answers.answerById(req.body.answerId);

    if (answer.is_right_answer) {
        Questions.openQuestion(answer.id_question)
    }

    Answers.delete(answer.id_answer);
    res.redirect('/admins');

});

/*unreport a reported answer*/
router.post('/report/answer/decline', (req, res, next) => {
    Answers.unReportAnswer(req.body.answerId);
    res.redirect('/admins');
});

module.exports = router;