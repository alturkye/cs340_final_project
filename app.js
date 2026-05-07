/*
    SETUP
*/
// Testing! -> Delete when ready!
// console.log("REGISTERING /trainers ROUTE");


// Express
const express = require('express');  // We are using the express library for the web server
const app = express();               // We need to instantiate an express object to interact with the server in our code
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

const PORT = process.env.PORT || 5005;

// Testing! -> Delete when ready!
// app.get('/trainers', (req, res) => {
//     res.send("TRAINERS ROUTE IS WORKING");
// });

// Database
const db = require('./db-connector');

// Handlebars
const { engine } = require('express-handlebars'); // Import express-handlebars engine
app.engine('.hbs', engine({ extname: '.hbs' })); // Create instance of handlebars
app.set('view engine', '.hbs'); // Use handlebars engine for *.hbs files.

/*
    ROUTES
*/

app.get('/', async function (req, res) {
    try {
        res.render('home'); // Render the home.hbs file
    } catch (error) {
        console.error('Error rendering page:', error);
        // Send a generic error message to the browser
        res.status(500).send('An error occurred while rendering the page.');
    }
});

// GET Trainers page
app.get('/trainers', function(req, res) {
    // Display all Trainers
    let query1 = 'SELECT * FROM Trainers;';

    db.pool.query(query1, function(error, rows, fields) {
        if (error) {
            console.log(error);
            res.sendStatus(400);
        } else {
            res.render('trainers', { trainers: rows });
        }
    });
});

// Testing! -> Delete when ready!
// app.get('/trainers', function(req, res) {
//     console.log("HIT /trainers ROUTE");
//     res.send("TRAINERS WORKS");
// });

app.get('/test', (req, res) => {
    res.send("TEST OK");
});

// GET Members page
app.get('/members', function(req,res) {
    // query 1 - get all members for the table
    let query1 = "SELECT * FROM Members;";

    let query2 = "SELECT * FROM Trainers;";

    db.pool.query(query1, function(error, rows, fields){
        let members = rows;

        db.pool.query(query2, (error, rows, fields) => {
            let trainers = rows;
            res.render('members', {data: members, trainers: trainers});
        });
    });
});

// GET Equipment Records Page
app.get('/equipment_records', function(req,res){
    let query = "SELECT * FROM Equipment_Records;";
    db.pool.query(query, function(error, rows, fields){
        res.render('equipment_records', {data: rows});
    });
});

// GET Enrollments Page -- still working on this one
app.get('/enrollments', function(req, res) {
    let query = "SELECT * FROM Enrollments;";
    db.pool.query(query, function(error, rows, fields) {
        res.render('enrollments', {data: rows});
    });
});

// POST Route to Add a Member
app.post('/add-member', function(req, res) {
    // capture the data from the form
    let data = req.body;

    // capture NULL for trainer_id if "none" was selected
    let trainer = parseInt(data['trainer_id']);
    if (isNaN(trainer)) {
        trainer = 'NULL';
    }

    // create the INSERT query
    let query = `INSERT INTO Members (first_name, last_name, email, trainer_id, join_date)
                 VALUES ('${data['first_name']}', '${data['last_name']}', '${data['email']}', ${trainer}, '${data['join_date']}')`;

    // run the query in the database
    db.pool.query(query, function(error, rows, fields) {
        if (error) {
            console.log(error);
            res.sendStatus(400);
        } else {
            // If successful reload the members page to see the new addition
            res.redirect('/members');
        }
    });
});


/*
    LISTENER
*/

app.listen(PORT, function(){            // This is the basic syntax for what is called the 'listener' which receives incoming requests on the specified PORT.
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});