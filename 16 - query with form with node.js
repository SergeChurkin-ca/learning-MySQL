// writing to db with form submittion

const express = require('express');

const app = express();
var mysql = require('mysql');

var bodyParser = require('body-parser')
app.set("view engine", "ejs")
app.use(bodyParser.urlencoded({ extended: true }));

// make sure middlewarwe static will have this and directory is the same as app.js directory to serve static .css
// view .ejs tempales will have .css links and they will work

app.use(express.static(__dirname + "/static"));

// this was comes from form is stored with body-parser

var connection = mysql.createConnection({
    host: '********',
    user: 'eadmin',
    password: '********,
    database: 'dummy_db'
});

var q = "SELECT count(*) as count from users"

// route is to views directory on ejx 
app.get("/", function(req, res) {
    connection.query(q, (err, results) => {
        var count = results[0].count
        if (err) throw err;
        res.render("home", { datacount: count })
    })
})

app.get("/thankyou", function(req, res) {
    console.log("requested thank you route");

    var q = "SELECT first_name from users order by created_at limit 1";
    connection.query(q, (err, result) => {
        if (err) throw err;
        var htmlContent = `
            <p>Thanks you for registering!</p>
            <br><br>
            <p><a href="/">return to home page</a></p>
        `;
        res.send(htmlContent);
    });
});

app.post("/register", function(req, res) {
    var person = {
        email: req.body.email,
        first_name: req.body.first_name,
        last_name: req.body.last_name
    };

    connection.query('INSERT INTO users SET ? ', person,
        function(err, result) {
            if (err) throw err;
            console.log(result)
            res.redirect('/thankyou')
        })
})

app.listen(8888, function() {
    console.log('Server is running on port 8888')
})
