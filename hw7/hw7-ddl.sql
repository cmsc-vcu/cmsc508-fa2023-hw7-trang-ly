# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills(id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    PRIMARY KEY (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag) VALUES
    (1, 'Coding Wizardry', 'Master the art of coding with spells and magic', 'Skill 1'),
    (2, 'Data Alchemy', 'Transforming raw data into valuable insights', 'Skill 2'),
    (3, 'Cyber Sorcery', 'Protecting the digital realm from dark forces', 'Skill 3'),
    (4, 'AI Enchantment', 'Breathing life into machines with artificial intelligence', 'Skill 4'),
    (5, 'Blockchain Enchantment', 'Forging secure and transparent digital contracts', 'Skill 5'),
    (6, 'Cloud Conjuring', 'Summoning the power of the cloud for limitless computing', 'Skill 6'),
    (7, 'UI/UX Alchemy', 'Crafting user experiences with a touch of magic', 'Skill 7'),
    (8, 'Quantum Sorcery', 'Harnessing the power of quantum computing for unprecedented feats', 'Skill 8');

# Section 4
# Create people(id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int not null,
    people_first_name varchar(255),
    people_last_name varchar(255) not null,
    people_email varchar(255),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(4096),
    people_date_joined date not null,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_last_name, people_first_name, people_email, people_linkedin_url, people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined) VALUES 
    (1, 'Person 1', 'John', 'john@example.com', 'linkedin.com/john', 'example.com/john.jpg', 'john#1234', 'Experienced professional with a passion for innovation.', '2023-01-01'),
    (2, 'Person 2', 'Jane', 'jane@example.com', 'linkedin.com/jane', 'example.com/jane.jpg', 'jane#5678', 'Dedicated team player with a focus on results.', '2023-01-15'),
    (3, 'Person 3', 'Michael', 'michael@example.com', 'linkedin.com/michael', 'example.com/michael.jpg', 'michael#9101', 'Strategic thinker with a track record of success.', '2023-02-01'),
    (4, 'Person 4', 'Emily', 'emily@example.com', 'linkedin.com/emily', 'example.com/emily.jpg', 'emily#2345', 'Creative problem solver with strong communication skills.', '2023-02-15'),
    (5, 'Person 5', 'David', 'david@example.com', 'linkedin.com/david', 'example.com/david.jpg', 'david#6789', 'Passionate about driving organizational growth and development.', '2023-03-01'),
    (6, 'Person 6', 'Sarah', 'sarah@example.com', 'linkedin.com/sarah', 'example.com/sarah.jpg', 'sarah#0123', 'Focused on delivering exceptional customer experiences.', '2023-03-15'),
    (7, 'Person 7', 'Alex', 'alex@example.com', 'linkedin.com/alex', 'example.com/alex.jpg', 'alex#3456', 'Passionate about cutting-edge technology and innovation.', '2023-04-01'),
    (8, 'Person 8', 'Chris', 'chris@example.com', 'linkedin.com/chris', 'example.com/chris.jpg', 'chris#7890', 'Dedicated to solving complex problems with a creative approach.', '2023-04-15'),
    (9, 'Person 9', 'Olivia', 'olivia@example.com', 'linkedin.com/olivia', 'example.com/olivia.jpg', 'olivia#2468', 'Experienced in project management and team leadership.', '2023-05-01'),
    (10, 'Person 10', 'Daniel', 'daniel@example.com', 'linkedin.com/daniel', 'example.com/daniel.jpg', 'daniel#1357', 'Focused on delivering high-quality products with user-centric design.', '2023-05-15');

# Section 6
# Create peopleskills(id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int auto_increment,
    peopleskills_skills_id int not null,
    peopleskills_people_id int not null,
    peopleskills_date_acquired date not null,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (peopleskills_skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (peopleskills_people_id) REFERENCES people(people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills (peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) VALUES
    (1, 1, '2023-01-02'),
    (3, 1, '2023-01-05'),
    (6, 1, '2023-01-08'),
    (3, 2, '2023-01-20'),
    (4, 2, '2023-01-25'),
    (5, 2, '2023-01-28'),
    (1, 3, '2023-02-05'),
    (5, 3, '2023-02-10'),
    (3, 5, '2023-03-05'),
    (6, 5, '2023-03-10'),
    (2, 6, '2023-03-18'),
    (3, 6, '2023-03-20'),
    (4, 6, '2023-03-25'),
    (3, 7, '2023-04-05'),
    (5, 7, '2023-04-10'),
    (6, 7, '2023-04-15'),
    (1, 8, '2023-04-20'),
    (3, 8, '2023-04-25'),
    (5, 8, '2023-04-28'),
    (6, 8, '2023-05-02'),
    (2, 9, '2023-05-05'),
    (5, 9, '2023-05-08'),
    (6, 9, '2023-05-12'),
    (1, 10, '2023-05-18'),
    (4, 10, '2023-05-22'),
    (5, 10, '2023-05-25');

# Section 8
# Create roles(id, name, sort_priority)
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int auto_increment,
    roles_name varchar(255),
    roles_sort_priority int,
    PRIMARY KEY (roles_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_name, roles_sort_priority) VALUES
    ('Designer', 10),
    ('Developer', 20),
    ('Recruit', 30),
    ('Team Lead', 40),
    ('Boss', 50),
    ('Mentor', 60);

# Section 10
# Create peopleroles(id, people_id, role_id, date_assigned)
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int auto_increment not null,
    peopleroles_people_id int not null,
    peopleroles_role_id int not null,
    peopleroles_date_assigned date not null,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (peopleroles_people_id) REFERENCES people(people_id),
    FOREIGN KEY (peopleroles_role_id) REFERENCES roles(roles_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (peopleroles_people_id, peopleroles_role_id, peopleroles_date_assigned) VALUES
    (1, 2, '2023-01-03'),
    (2, 5, '2023-01-20'),
    (2, 6, '2023-01-25'),
    (3, 2, '2023-02-10'),
    (3, 4, '2023-02-18'),
    (4, 3, '2023-02-20'),
    (5, 3, '2023-03-05'),
    (6, 2, '2023-03-18'),
    (6, 1, '2023-03-20'),
    (7, 1, '2023-03-22'),
    (8, 1, '2023-03-25'),
    (8, 4, '2023-03-28'),
    (9, 2, '2023-04-02'),
    (10, 2, '2023-04-05'),
    (10, 1, '2023-04-08');