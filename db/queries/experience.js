const db = require('../index')

// GET : /experience 
const getAll = (req, res) => {
    db
        .any("SELECT workplace, position, description, city, state, to_char(start_date, 'mm/yyyy') AS start, to_char(end_date, 'mm/yyyy') AS end FROM experience ORDER BY end_date DESC;")
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

const getOne = (req, res) => {
    db
        .one("SELECT * FROM experience WHERE id=${id}", {
            id: req.params.id
        })
        .then(data => {
            res.status(200).json({
                status: 'Success',
                message: 'Retrieved one experience',
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
    getAll,
    getOne
}