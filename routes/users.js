const express = require('express');
const router = express.Router();
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const db = require('../database/db');
const bcrypt = require('bcryptjs');
const bodyParser = require('body-parser');
const saltRounds = 11; 
// var request = require('request');

// ---- Pagina werwijzingen



// Login
router.get('/index', function (req, res) {
	res.render('index');
});

// Login
router.get('/header', function (req, res) {
	res.render('header');
});

// Login
router.get('/footer', function (req, res) {
	res.render('footer');
});

module.exports = router;