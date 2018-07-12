DROP DATABASE IF EXISTS resume;
CREATE DATABASE resume;
\c resume;

DROP TABLE education;
CREATE TABLE education (
    id SERIAL UNIQUE, 
    name VARCHAR NOT NULL, 
    start_date DATE,
    end_date DATE, 
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
    start_date DATE,
    end_date DATE, 
    PRIMARY KEY (id) 
);

DROP TABLE degrees;
CREATE TABLE degrees (
    id SERIAL UNIQUE, 
    education_id INTEGER,
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
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (experience_id) REFERENCES experience(id) 
);

DROP TABLE skills;
CREATE TABLE skills (
    id SERIAL UNIQUE, 
    project_id INTEGER,
    experience_id INTEGER,
    name VARCHAR NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (experience_id) REFERENCES experience(id) 
);

DROP TABLE project_links;
CREATE TABLE project_links (
    id SERIAL UNIQUE,
    project_id INTEGER,
    url VARCHAR NOT NULL,
    type VARCHAR NOT NULL,
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