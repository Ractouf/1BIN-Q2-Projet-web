const db = require('./db_conf');

module.exports.save = (data) => {
    db.prepare('INSERT INTO users (lastname, firstname, email, password) VALUES (?, ?, ?, ?)').run(data.lastname, data.firstname, data.email, data.pwd);
};

module.exports.userByEmail = (email) => {
    return db.prepare('SELECT * FROM users WHERE email = ?').get(email);
};

module.exports.userByID = (id_user) => {
    return db.prepare('SELECT * FROM users WHERE id_user = ?').get(id_user);
};