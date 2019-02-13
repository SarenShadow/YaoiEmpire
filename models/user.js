// var db = require('../database/db');
var express = require('express');
var router = express.Router();

User = function() {
    function ensureAuthenticated(req, res, next){
        if(req.isAuthenticated()){
            return next();
        } else {
            res.redirect('/');
        }
    }
}


module.exports = router;