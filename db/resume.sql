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
    title VARCHAR NOT NULL,
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
    role VARCHAR,
    description VARCHAR NOT NULL,
    start_date VARCHAR,
    end_date VARCHAR,
    source VARCHAR,
    live VARCHAR,
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
    project_id INTEGER,
    skill_id INTEGER,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (skill_id) REFERENCES skills(id)
);

DROP TABLE contact;
CREATE TABLE contact (
    first_name VARCHAR,
    last_name VARCHAR,
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
INSERT INTO education (name, start_date, end_date, city, state)
VALUES 
    ('University at Albany', '2009', '2014', 'Albany', 'NY'),
    ('Herricks High School', null, '2009', 'New Hyde Park', 'NY')
;

INSERT INTO experience (name, title, description, city, state, start_date, end_date)
VALUES 
    ('Coalition for Queens (C4Q)', 'Full Stack Web Development Fellow', 'Gained hands on experience building dynamic web applications using Postgres, Express, React and Node.js', 'Long Island City', 'NY', '2017-09', '2018-06'),
    ('Choe & Oh, P.C.', 'Legal Assistant', 'Draft contracts, make bill payments, direct phone calls', 'New York', 'NY', '2015-10', '2017-09')
;

INSERT INTO degrees (education_id, level, name)
VALUES 
    (1, 'Bachelor of Arts', 'English Literature')
;

INSERT INTO projects (experience_id, name, role, description, start_date, end_date, source, live)
VALUES 
    (1, 'Smood', null, 'Track your moods', '2018-05', '2018-06', 'https://github.com/helencho/smood', 'https://smood.herokuapp.com'),
    (1, 'Elevate', 'Design Lead', 'Organize and manage job applications', '2018-04', '2018-05', null, null),
    (1, 'Sinistagram', null, 'Instagram inspired photo sharing app for the sinister', null, null, null, null)
;

INSERT INTO skills (name, description)
VALUES 
    ('JavaScript', 'Javascript'),
    ('React', 'JavaScript framework'),
    ('Redux', 'Flux framework'),
    ('Node.js', 'Runtime environment'),
    ('Express', 'Server-side web framework'),
    ('Postgres', 'Database management'),
    ('SQL', 'Structured Query Language'),
    ('HTML', 'Templates'),
    ('CSS', 'Styles'),
    ('jQuery', 'Stylish JavaScript'),
    ('RESTful API', 'Understanding REST architecture of the web'),
    ('Git', 'Version control'),
    ('GitHub', 'Version control online'),
    ('Heroku', 'Hosting and deploying applications'),
    ('Illustrator', 'Vector software'),
    ('Hootsuite', 'Social media manager'),
    ('QuickBooks', 'Accounting system')
;

INSERT INTO tech_stacks (project_id, skill_id) 
VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 1),
    (3, 1)
;

INSERT INTO contact (first_name, last_name, email, phone, linkedin, twitter, github, pinterest, facebook, instagram) 
VALUES 
    ('Helen', 'Cho', 'helencho@ac.c4q.nyc', '5162447969', 'https://www.linkedin.com/in/haeyoungcho/', 'https://twitter.com/hellohelencho', 'https://github.com/helencho', null, null, null)
;
