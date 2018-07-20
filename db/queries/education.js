const db = require('../index')

// GET : /education 
const getAll = (req, res) => {
    db
        .any("SELECT * FROM education;")
        .then(data => {
            res.status(200).json({
                status: 'Success',
                data: data,
                message: 'Retrieved all education'
            })
        })
        .catch(err => {
            res.status(500).json({
                message: err.message,
                error: {}
            })
        })
}

module.exports = {
    getAll
}