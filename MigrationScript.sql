
CREATE TABLE Users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    points INTEGER DEFAULT 30,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_active TIMESTAMP
);


CREATE TABLE Skills (
    id BIGSERIAL PRIMARY KEY,
    skill_name VARCHAR(20),
    description TEXT
);


CREATE TABLE UserSkills (
    id BIGSERIAL PRIMARY KEY,
    user_id INTEGER,
    skill_id INTEGER,
    experience_level VARCHAR(15),
    type VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE, 
    FOREIGN KEY (skill_id) REFERENCES Skills(id) ON DELETE CASCADE 
);


CREATE TABLE Courses (
    id BIGSERIAL PRIMARY KEY,
    teacher_skill_id INTEGER,
    student_skill_id INTEGER,
    day_of_the_week VARCHAR(10),
    time_slot TIME,
    status VARCHAR(20),
    FOREIGN KEY (teacher_skill_id) REFERENCES UserSkills(id),
    FOREIGN KEY (student_skill_id) REFERENCES UserSkills(id)
);


CREATE TABLE Lessons (
    id BIGSERIAL PRIMARY KEY,
    course_id INTEGER,
    date DATE,
    time INTERVAL,
    status VARCHAR(20),
    points INTEGER,
    FOREIGN KEY (course_id) REFERENCES Courses(id) ON DELETE CASCADE
);


CREATE TABLE Reviews (
    id BIGSERIAL PRIMARY KEY,
    course_id INTEGER UNIQUE, 
    teacher_rating INTEGER CHECK (teacher_rating BETWEEN 1 AND 5), 
    student_rating INTEGER CHECK (student_rating BETWEEN 1 AND 5), 
    teacher_comment TEXT,
    student_comment TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Courses(id) ON DELETE CASCADE
);
