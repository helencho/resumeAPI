DROP DATABASE IF EXISTS resume;
CREATE DATABASE resume;
\c resume;

DROP TABLE education;
CREATE TABLE education (
    id SERIAL UNIQUE, 
    name VARCHAR NOT NULL, 
    start_date VARCHAR,
    end_date VARCHAR, 
    city VARCHAR,
    state VARCHAR NOT NULL,
    PRIMARY KEY (id) 
);

DROP TABLE experience;
CREATE TABLE experience (
    id SERIAL UNIQUE,
    name VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    city VARCHAR,
    state VARCHAR NOT NULL,
    start_date VARCHAR,
    end_date VARCHAR, 
    PRIMARY KEY (id) 
);

DROP TABLE degrees;
CREATE TABLE degrees (
    id SERIAL UNIQUE, 
    education_id INTEGER,
    level VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (education_id) REFERENCES education(id) 
);

DROP TABLE projects;
CREATE TABLE projects (
    id SERIAL UNIQUE,
    experience_id INTEGER,
    name VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    start_date VARCHAR,
    end_date VARCHAR,
    PRIMARY KEY (id),
    FOREIGN KEY (experience_id) REFERENCES experience(id) 
);

DROP TABLE skills;
CREATE TABLE skills (
    id SERIAL UNIQUE, 
    name VARCHAR NOT NULL,
    description VARCHAR,
    PRIMARY KEY (id)
);

DROP TABLE tech_stacks;
CREATE TABLE tech_stacks (
    skill_id INTEGER,
    project_id INTEGER,
    experience_id INTEGER,
    FOREIGN KEY (skill_id) REFERENCES skills(id),
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (experience_id) REFERENCES experience(id)
);

DROP TABLE project_source;
CREATE TABLE project_source (
    id SERIAL UNIQUE,
    project_id INTEGER,
    url VARCHAR NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES projects(id) 
);

DROP TABLE project_live;
CREATE TABLE project_live (
    id SERIAL UNIQUE, 
    project_id INTEGER,
    url VARCHAR NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

DROP TABLE contact;
CREATE TABLE contact (
    email VARCHAR,
    phone VARCHAR,
    linkedin VARCHAR,
    twitter VARCHAR,
    github VARCHAR,
    pinterest VARCHAR,
    facebook VARCHAR,
    instagram VARCHAR
);

-- Seed data 
-- INSERT INTO education (name, start_date, end_date, city, state)
-- VALUES 
--     ('University at Albany', '2009', '2014', 'Albany', 'NY')
-- ;

-- INSERT INTO experience (name, description, city, state, start_end, end_date)
-- VALUES 
--     ('Coalition for Queens (C4Q)', 'Gained hands on experience building dynamic web applications using Postgres, Express, React and Node.js', 'Long Island City', 'NY', '2017-09', '2018-06')
-- ;

-- INSERT INTO degrees (education_id, level, name)
-- VALUES 
--     (1, 'Bachelor of Arts', 'English Literature')
-- ;

-- INSERT INTO projects (experience_id, name, description, start_date, end_date)
-- VALUES 
--     (1, 'Smood', 'Track your moods', '2018-05', '2018-06')
-- ;

-- INSERT INTO skills (name)
-- VALUES 
--     ('JavaScript'),
--     ('React'),
--     ('Redux'),
--     ('Node.js'),
--     ('Express'),
--     ('Postgres'),
--     ('SQL'),
--     ('HTML'),
--     ('CSS'),
--     ('jQuery'),
--     ('RESTful API'),
--     ('Git'),
--     ('GitHub'),
--     ('Heroku'),
--     ('Illustrator'),
--     ('Hootsuite'),
--     ('QuickBooks')
-- ;

-- INSERT INTO project_source (project_id, url) 
-- VALUES 
--     (1, 'https://github.com/helencho/smood')
-- ;

-- INSERT INTO project_live (project_id, url)
-- VALUES 
--     (1, 'https://smood.herokuapp.com')
-- ;

-- INSERT INTO contact (email, phone, linkedin, twitter, github, pinterest, facebook, instagram) 
-- VALUES 
--     ('helencho@ac.c4q.nyc', '5162447969', 'https://www.linkedin.com/in/haeyoungcho/', 'https://twitter.com/hellohelencho', 'https://github.com/helencho', null, null, null)
-- ;