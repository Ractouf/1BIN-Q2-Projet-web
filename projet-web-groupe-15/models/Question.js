const db = require('./db_conf');

module.exports.list = () => {
    return db.prepare('SELECT * FROM questions WHERE is_solved = false ORDER BY question_date DESC LIMIT 20').all();
};

module.exports.listReported = () => {
    return db.prepare('SELECT * FROM questions WHERE is_reported = 1').all();
};

module.exports.listSolvedQuestion = (id_user) => {
    return db.prepare('SELECT * FROM questions WHERE is_solved = 1 AND owner_of_question = ?').all(id_user);
};

module.exports.listUnsolvedQuestion = (id_user) => {
    return db.prepare('SELECT * FROM questions WHERE is_solved = 0 AND owner_of_question = ?').all(id_user);
};

module.exports.search = (title_question) => {
    return db.prepare('SELECT * FROM questions WHERE title_question LIKE ? ORDER BY question_date').all('%' + title_question + '%');
};

module.exports.searchCategory = (title_question, id_category) => {
    return db.prepare('SELECT * FROM questions WHERE title_question LIKE ? AND id_category = ? ORDER BY question_date').all('%' + title_question + '%', id_category)
};

module.exports.delete = (id_question) => {
    db.prepare('DELETE FROM answers WHERE id_question = ?').run(id_question);
    db.prepare('DELETE FROM questions WHERE id_question = ?').run(id_question);
};

module.exports.questionByID = (id_question) => {
    return db.prepare('SELECT * FROM questions WHERE id_question = ?').get(id_question);
};

module.exports.report = (id_question) => {
    db.prepare('UPDATE questions SET is_reported = 1 WHERE id_question = ?').run(id_question);
};

module.exports.unReportQuestion = (id_question) => {
    db.prepare('UPDATE questions SET is_reported = 0 WHERE id_question = ?').run(id_question);
};

module.exports.save = (question) => {
    return db.prepare('INSERT INTO questions (id_category, owner_of_question, title_question, subject_question) VALUES(?, ?, ?, ?) RETURNING id_question').get
        (question.category, question.owner_of_question, question.titleQuestion, question.subject);
};

module.exports.closeQuestion = (id_question) => {
    db.prepare('UPDATE questions SET is_solved = 1 WHERE id_question = ?').run(id_question);
};

module.exports.openQuestion = (id_question) => {
    db.prepare('UPDATE questions SET is_solved = 0 WHERE id_question = ?').run(id_question);
};

module.exports.randomQuestion = () => {
    return db.prepare('SELECT * FROM questions WHERE is_solved = 0 ORDER BY RANDOM() LIMIT 1').get();
};