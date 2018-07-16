const db = require('../index')

// GET : /projects 
const getAll = (req, res) => {
    db
        .any('QUERY STRING')
        .then(data => {
            res.status(200).json({
                status: 'Success',
                data: data,
                message: 'Retrieved all projects'
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