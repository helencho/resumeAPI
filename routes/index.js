const express = require('express');
const router = express.Router();
const db = require('../db/queries/index'); 

/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });

router.get('/', db.getAll);

module.exports = router;
