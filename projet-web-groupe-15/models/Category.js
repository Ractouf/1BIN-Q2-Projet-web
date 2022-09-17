const db = require('./db_conf');

module.exports.list = () => {
    return db.prepare("SELECT * FROM categories").all();
};

module.exports.categoryByID = (id_category) => {
    return db.prepare('SELECT * FROM categories WHERE id_category = ?').get(id_category);
};