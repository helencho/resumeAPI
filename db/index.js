const pgp = require('pg-promise')({})
const dotenv = require('dotenv').config()
const connection = DATABASE_URL
const db = pgp(connection)

module.exports = db 