const express = require('express');
const router = express.Router();
const Users = require('../models/User.js');
const bcrypt = require("bcrypt");
const saltRounds = 10;
const Categories = require('../models/Category');

/* get users page */
router.get('/', (req, res, next) => {
    if (req.session.login) {
        res.redirect('/');
    } else {
        res.render('users/login', {
            loggedIn: req.session.login,
            category: Categories.list(),
            error: req.session.error
        });
        req.session.error = null;
    }
});

/* get register page */
router.get('/register', (req, res, next) => {
    if (req.session.login) {
        res.redirect('/');
    } else {
        res.render('users/register', {
            loggedIn: req.session.login,
            category: Categories.list(),
            error: req.session.error
        });
        req.session.error = null;
    }
});

/* user login */
router.post('/login', (req, res, next) => {
    const user = Users.userByEmail(req.body.email);

    if (user === undefined) {
        req.session.error = "No such user";
        res.redirect('/users');
    } else if (!bcrypt.compareSync(req.body.password, user.password)) {
        req.session.error = "Incorrect password";
        res.redirect('/users');
    } else {
        req.session.login = user;
        res.redirect('/');
    }
});

/* register a new user */
router.post('/add', (req, res) => {
    let email = req.body.user_email;

    if (Users.userByEmail(email)) {
        req.session.error = "User already exists, please log in";
        res.redirect('/users/register');
    } else if (req.body.user_pwd !== req.body.user_cpwd) {
        req.session.error = "Passwords don't match";
        res.redirect('/users/register');
    } else if (!email.endsWith('@vinci.be') && !email.endsWith('@student.vinci.be')) {
        req.session.error = "Please use vinci emails";
        res.redirect('/users/register');
    } else if (req.body.user_lastname <= 0 || req.body.user_firstname <= 0){
        req.session.error = "Please fill all the form";
        res.redirect('/users/register');
    } else {
        Users.save({
            lastname: req.body.user_lastname,
            firstname: req.body.user_firstname,
            email: req.body.user_email,
            pwd: bcrypt.hashSync(req.body.user_pwd, saltRounds)
        });
        req.session.login = Users.userByEmail(req.body.user_email);

        res.redirect('/');
    }
});

router.post('/signout', (req, res, next) => {
    req.session.destroy();
    res.redirect('/');
});

module.exports = router;