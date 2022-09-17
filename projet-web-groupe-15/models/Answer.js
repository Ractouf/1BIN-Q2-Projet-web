const db = require('./db_conf');

module.exports.list = () => {
    return db.prepare("SELECT * FROM answers ORDER BY date_answer").all();
};

module.exports.listByGoodAnswer = (id_question) => {
    return db.prepare("SELECT * FROM answers WHERE id_question = ? ORDER BY is_right_answer DESC, date_answer").all(id_question);
};

module.exports.listReported = () => {
    return db.prepare('SELECT * FROM answers WHERE is_reported = 1').all();
};

module.exports.save = (answer) => {
    db.prepare('INSERT INTO answers (id_question, owner_of_answer, subject_answer) VALUES (?, ?, ?)').run(answer.question_id, answer.owner_of_answer, answer.sub_answer);
};

module.exports.delete = (id_answer) => {
    db.prepare('DELETE FROM answers WHERE id_answer = ?').run(id_answer);
};

module.exports.rightAnswer = (id_answer) => {
    db.prepare('UPDATE answers SET is_right_answer = 1 WHERE id_answer = ?').run(id_answer);
};

module.exports.report = (id_answer) => {
    db.prepare('UPDATE answers SET is_reported = true WHERE id_answer = ?').run(id_answer);
};
module.exports.unReportAnswer = (id_answer) => {
    db.prepare('UPDATE answers SET is_reported = 0 WHERE id_answer = ?').run(id_answer);
};

module.exports.answerById = (id_answer) => {
    return db.prepare('SELECT * FROM answers WHERE id_answer = ?').get(id_answer);
};