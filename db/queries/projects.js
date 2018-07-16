const db = require('../index')

// GET : /projects 
const getAll = (req, res) => {
    db
        .any("SELECT projects.id, projects.project_name, projects.description, projects.end_date, array_agg(skill) AS skills, (SELECT json_build_object('source', source, 'live', live) FROM projects c WHERE projects.id = c.id) AS links FROM projects LEFT JOIN tech_stacks ON projects.id = tech_stacks.project_id LEFT JOIN skills ON tech_stacks.skill_id = skills.id GROUP BY projects.id ORDER BY projects.end_date DESC;")
        .then(data => {
            res.status(200).json({
                status: 'Success',
                message: 'Retrieved all projects',
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

// GET : /projects/:id 
const getOne = (req, res) => {
    db
        .one('QUERY STRING', {
            id: req.params.id
        })
        .then(data => {
            res.status(200).json({
                status: 'Success',
                message: 'Retrieved one project',
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