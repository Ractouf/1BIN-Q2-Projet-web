const express = require('express');
const router = express.Router();
const Questions = require('../models/Question');
const Users = require('../models/User');
const Categories = require('../models/Category');

/*get member page*/
router.get('/', (req, res, next) => {
    if (req.session.login) {
        let idUser = req.session.login.id_user;

        res.render('members/index', {
            loggedIn: req.session.login,
            questionSolved: Questions.listSolvedQuestion(idUser),
            questionsUnsolved:  Questions.listUnsolvedQuestion(idUser),
            category: Categories.list(),
        });
    } else {
        res.redirect('/');
    }
});

module.exports = router;