const express = require('express');
const router = express.Router();
const Questions = require('../models/Question');
const Categories = require('../models/Category');

/*get home page*/
router.get('/', (req, res, next) => {
    res.render('index', {
        question: Questions.list(),
        category: Categories.list(),
        loggedIn: req.session.login
    });
});

/*search question*/
router.get('/search', (req, res, next) => {
    let category = Categories.categoryByID(req.query.categorySearch);
    let searchTitle = req.query.searchTitle;

    if (category === undefined) {
        res.render('index', {
            question: Questions.search(searchTitle),
            category: Categories.list(),
            loggedIn: req.session.login,
            lastSearch: req.query.searchTitle
        });
    } else {
        res.render('index', {
            question: Questions.searchCategory(searchTitle, category.id_category),
            category: Categories.list(),
            loggedIn: req.session.login,
            lastSearch: req.query.searchTitle,
            lastSearchCategory: category.name_category
        });
   }
});

module.exports = router;