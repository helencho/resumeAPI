const db = require('../index')

// GET : /experience 
const getAll = (req, res) => {
    db
        .any("SELECT * FROM experience;")
        .then(data => {
            res.status(200).json({
                status: 'Success',
                message: 'Retrieved all experience',
                data: data
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