var express = require('express');
var router = express.Router();
var db = require('../database/db');

// Check if logged in, Get Homepage
router.get('/', function(req, res){
	res.render('index');
});

module.exports = router;