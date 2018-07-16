const pgp = require('pg-promise')({})
require('dotenv').config()
const connection = process.env.DATABASE_URL
const db = pgp(connection)

module.exports = db 