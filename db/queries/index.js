const db = require('../index')

// GET : / 
const getAll = (req, res) => {
    db
        .one("SELECT (SELECT row_to_json(basics) FROM basics) AS basics, (SELECT json_agg(project_item) FROM (SELECT projects.id, projects.project_name, projects.description, to_char(start_date, 'mm/yyyy') AS start_date, to_char(end_date, 'mm/yyyy') AS end_date, array_agg(skill) AS skills, (SELECT json_build_object('source', source, 'live', live) FROM projects c WHERE projects.id = c.id) AS links FROM projects LEFT JOIN tech_stacks ON projects.id = tech_stacks.project_id LEFT JOIN skills ON tech_stacks.skill_id = skills.id GROUP BY projects.id ORDER BY projects.end_date DESC) project_item) AS projects, (SELECT json_agg(experience_item) FROM (SELECT workplace, position, description, city, state, to_char(start_date, 'mm/yyyy') AS start_date, to_char(end_date, 'mm/yyyy') AS end_date FROM experience) experience_item) AS experience, (SELECT json_agg(education_item) FROM (SELECT * FROM education) education_item) AS education, (SELECT json_agg(skill_item) FROM (SELECT * FROM skills) skill_item) AS skills;")
        .then(data => {
            res.status(200).json({
                status: 'Success',
                message: 'Retrieved everything about Helen',
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