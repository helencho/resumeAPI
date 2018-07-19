const express = require('express');
const router = express.Router();
const db = require('../db/queries/experience'); 

router.get('/', db.getAll);
router.get('/:id', db.getOne);

module.exports = router; 