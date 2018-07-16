const db = require('../index')

// GET : /projects 
const getAll = (req, res) => {
    db
        .any('SELECT * FROM projects LEFT JOIN tech_stacks ON projects.id = tech_stacks.project_id LEFT JOIN skills ON tech_stacks.skill_id = skills.id;')
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