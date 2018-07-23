DROP DATABASE IF EXISTS resume;
CREATE DATABASE resume;
\c resume;

DROP TABLE education;
CREATE TABLE education (
    id SERIAL UNIQUE, 
    school_name VARCHAR NOT NULL, 
    start_date VARCHAR,
    end_date VARCHAR, 
    city VARCHAR,
    state VARCHAR NOT NULL,
    PRIMARY KEY (id) 
);

DROP TABLE experience;
CREATE TABLE experience (
    id SERIAL UNIQUE,
    workplace VARCHAR NOT NULL,
    position VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    city VARCHAR,
    state VARCHAR NOT NULL,
    start_date DATE,
    end_date DATE, 
    PRIMARY KEY (id) 
);

DROP TABLE degrees;
CREATE TABLE degrees (
    id SERIAL UNIQUE, 
    education_id INTEGER,
    level VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (education_id) REFERENCES education(id) 
);

DROP TABLE projects;
CREATE TABLE projects (
    id SERIAL UNIQUE,
    experience_id INTEGER,
    project_name VARCHAR NOT NULL,
    role VARCHAR,
    description VARCHAR NOT NULL,
    start_date DATE,
    end_date DATE,
    source VARCHAR,
    live VARCHAR,
    PRIMARY KEY (id),
    FOREIGN KEY (experience_id) REFERENCES experience(id) 
);

DROP TABLE skills;
CREATE TABLE skills (
    id SERIAL UNIQUE, 
    skill VARCHAR NOT NULL,
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

DROP TABLE basics;
CREATE TABLE basics (
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR,
    phone VARCHAR,
    website VARCHAR,
    linkedin VARCHAR,
    twitter VARCHAR,
    github VARCHAR,
    pinterest VARCHAR,
    facebook VARCHAR,
    instagram VARCHAR
);

-- Seed data 
INSERT INTO education (school_name, start_date, end_date, city, state)
VALUES 
    ('University at Albany', '2009', '2014', 'Albany', 'NY'),
    ('Herricks High School', null, '2009', 'New Hyde Park', 'NY')
;

INSERT INTO experience (workplace, position, description, city, state, start_date, end_date)
VALUES 
    ('Coalition for Queens (C4Q)', 'Full Stack Web Development Fellow', 'Build dynamic web applications using Postgres, Express, React and Node.js', 'Long Island City', 'NY', '2017-09-18', '2018-06-28'),
    ('Choe & Oh, P.C.', 'Legal Assistant', 'Draft contracts, make bill payments, direct phone calls', 'New York', 'NY', '2015-10-01', '2017-09-03'),
    ('Asian American Writers'' Workshop', 'Digital Media Intern', 'Design posters for events and curate Asian American literature on social media via Hootsuite', 'New York', 'NY', '2015-06-01', '2015-08-01'),
    ('Creative Minds', 'Assistant to the Director', 'Assist the program director in all areas, such as scheduling classes, planning field trips, data entry, and writing/sending letters to parents', 'Flushing', 'NY', '2014-09-01', '2015-10-01'),
    ('Creative Minds', 'After School Teacher', 'Babysit first-graders and help them with homework', 'Flushing', 'NY', '2014-06-01', '2015-10-01')
;

INSERT INTO degrees (education_id, level, title)
VALUES 
    (1, 'Bachelor of Arts', 'English Literature')
;

INSERT INTO projects (experience_id, project_name, role, description, start_date, end_date, source, live)
VALUES 
    (1, 'Smood', null, 'Track your moods', '2018-05-01', '2018-06-01', 'https://github.com/helencho/smood', 'https://smood.herokuapp.com'),
    (1, 'Elevate', 'Design Lead', 'Organize and manage job applications', '2018-04-01', '2018-05-01', null, null),
    (1, 'Sinistagram', 'Technical Lead', 'Instagram inspired photo sharing app for the sinister', null, '2018-01-04', null, null),
    (1, 'Madlify', null, 'MadLibs inspired phrasal template word game', null, '2018-01-02', 'https://github.com/helencho/madlify', 'https://madlify.netlify.com/')
;

INSERT INTO skills (skill, description)
VALUES 
    ('JavaScript', 'High-level, interpreted programming language'),
    ('React', 'JavaScript library for building user interfaces'),
    ('Redux', 'JavaScript library for managing application state, commonly used with React or Angular'),
    ('Node.js', 'Runtime environment that executes JavaScript code outside the browser'),
    ('Express', 'Web application framework for Node'),
    ('Postgres', 'Object relational database management system'),
    ('SQL', 'Structured query language designed for managing data'),
    ('HTML', 'Hypertext markup language for creating web pages and web applications'),
    ('CSS', 'Cascading style sheet used for describing the presentation of a document written in HTML'),
    ('jQuery', 'JavaScript library designed to simplify the client-side scripting of HTML'),
    ('RESTful API', 'Understanding REST architecture of the web'),
    ('Git', 'Version control'),
    ('GitHub', 'Version control online'),
    ('Heroku', 'Hosting and deploying applications'),
    ('Inkscape', 'Open-source vector graphics editor, similar to Illustrator'),
    ('Hootsuite', 'Social media management platform'),
    ('QuickBooks', 'Accounting software')
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

INSERT INTO basics (first_name, last_name, email, phone, website, linkedin, twitter, github, pinterest, facebook, instagram) 
VALUES 
    ('Helen', 'Cho', 'helencho@ac.c4q.nyc', '5162447969', 'http://helencho.io', 'https://www.linkedin.com/in/haeyoungcho/', 'https://twitter.com/hellohelencho', 'https://github.com/helencho', null, null, null)
;
