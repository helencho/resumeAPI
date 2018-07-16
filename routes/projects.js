const express = require('express');
const router = express.Router();
const db = require('../db/queries/projects'); 

router.get('/', db.getAll);

module.exports = router; 