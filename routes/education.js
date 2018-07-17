const express = require('express');
const router = express.Router();
const db = require('../db/queries/education');

router.get('/', db.getAll);

module.exports = router;