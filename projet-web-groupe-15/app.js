const express = require('express');
const createError = require('http-errors');
const path = require('path');
const session = require('express-session');
const logger = require('morgan');
const config = require('./config');

const indexRouter = require('./routes/index');
const questionsRouter = require('./routes/questions');
const membersRouter = require('./routes/members');
const usersRouter = require('./routes/users');
const adminsRouter = require('./routes/admins');

const app = express();
const port = 3000;

const hbs = require('hbs');
hbs.registerPartials(__dirname + '/views/partials');

// Setup views folder and handlebar engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev')); // Log each request
app.use(express.urlencoded({ extended: false })); // Decode form values
app.use(express.static(path.join(__dirname, 'public'))); // Get static files from public folder
app.use('/css', express.static(__dirname + '/node_modules/bootstrap/dist/css'));
app.use('/js', express.static(__dirname + '/node_modules/bootstrap/dist/js'));
app.use('/umd', express.static(__dirname + '/node_modules/@popperjs/core/dist/umd'));

app.use(session({ secret: config.secret,
  resave: false,
  saveUninitialized: false
}));

app.use('/', indexRouter);
app.use('/questions', questionsRouter);
app.use('/members', membersRouter);
app.use('/users', usersRouter);
app.use('/admins', adminsRouter);

hbs.registerHelper('eq', (a, b) => {
  return a === b;
});

hbs.registerHelper('ne', (a, b) => {
  return a !== b;
});

// Create error on page not found
app.use((req, res, next) => {
  next(createError(404))
});

// Show error hbs page
app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.render('error', { error });
});

// Launch server
app.listen(port, () => console.log(`App listening on port ${port} \nhttp://localhost:${port}`));