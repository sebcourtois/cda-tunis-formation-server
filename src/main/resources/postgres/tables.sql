CREATE TABLE Users
(
    id         BIGSERIAL,
    email      VARCHAR(255) NOT NULL,
    password   VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name  VARCHAR(255),
    birth_date DATE         NOT NULL,
    role       VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (email)
);

CREATE TABLE Categories
(
    id   BIGSERIAL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE Lessons
(
    id          BIGSERIAL,
    name        VARCHAR(255) NOT NULL,
    price       MONEY        NOT NULL,
    online      BOOLEAN      NOT NULL,
    user_id     INTEGER      NOT NULL,
    category_id INTEGER      NOT NULL,
    image_url   VARCHAR(255),
    PRIMARY KEY (id),
    UNIQUE (name),
    FOREIGN KEY (user_id) REFERENCES Users (id),
    FOREIGN KEY (category_id) REFERENCES Categories (id)
);

CREATE TABLE Topics
(
    id          BIGSERIAL,
    title       VARCHAR(255) NOT NULL,
    content     TEXT         NOT NULL,
    create_date TIMESTAMP    NOT NULL,
    category_id INTEGER      NOT NULL,
    user_id     INTEGER      NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES Categories (id),
    FOREIGN KEY (user_id) REFERENCES Users (id)
);

CREATE TABLE Comments
(
    id         BIGSERIAL,
    content    TEXT      NOT NULL,
    send_date  TIMESTAMP NOT NULL,
    comment_id INTEGER,
    user_id    INTEGER   NOT NULL,
    topic_id   INTEGER   NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (comment_id) REFERENCES Comments (id),
    FOREIGN KEY (user_id) REFERENCES Users (id),
    FOREIGN KEY (topic_id) REFERENCES Topics (id)
);

CREATE TABLE Classrooms
(
    id         BIGSERIAL,
    start_date TIMESTAMP NOT NULL,
    end_date   TIMESTAMP NOT NULL,
    lesson_id  INTEGER   NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons (id)
);

CREATE TABLE Cursus
(
    id          BIGSERIAL,
    name        VARCHAR(255) NOT NULL,
    price       MONEY        NOT NULL,
    online      BOOLEAN      NOT NULL,
    user_id     INTEGER      NOT NULL,
    category_id INTEGER      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name),
    FOREIGN KEY (user_id) REFERENCES Users (id),
    FOREIGN KEY (category_id) REFERENCES Categories (id)
);

CREATE TABLE Modules
(
    id        BIGSERIAL,
    name      VARCHAR(255) NOT NULL,
    cursus_id INTEGER      NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cursus_id) REFERENCES Cursus (id)
);

CREATE TABLE Resources
(
    id        BIGSERIAL,
    format    VARCHAR(255) NOT NULL,
    uri       TEXT         NOT NULL,
    lesson_id INTEGER      NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons (id)
);

CREATE TABLE Assessments
(
    id              BIGSERIAL,
    name            VARCHAR(255) NOT NULL,
    resultat        VARCHAR(255),
    validation_date DATE         NOT NULL,
    lesson_id       INTEGER      NOT NULL,
    resource_id     INTEGER      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (lesson_id),
    UNIQUE (resource_id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons (id),
    FOREIGN KEY (resource_id) REFERENCES Resources (id)
);

CREATE TABLE Learners
(
    user_id    INTEGER,
    lesson_id  INTEGER,
    start_date DATE NOT NULL,
    end_date   DATE,
    PRIMARY KEY (user_id, lesson_id),
    FOREIGN KEY (user_id) REFERENCES Users (id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons (id)
);

CREATE TABLE Contains
(
    module_id INTEGER,
    lesson_id INTEGER,
    PRIMARY KEY (module_id, lesson_id),
    FOREIGN KEY (module_id) REFERENCES Modules (id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons (id)
);

CREATE TABLE Enrollments
(
    user_id    INTEGER,
    cursus_id  INTEGER,
    start_date DATE NOT NULL,
    end_date   DATE NOT NULL,
    PRIMARY KEY (user_id, cursus_id),
    FOREIGN KEY (user_id) REFERENCES Users (id),
    FOREIGN KEY (cursus_id) REFERENCES Cursus (id)
);

CREATE TABLE Messages
(
    recipient_id INTEGER,
    sender_id    INTEGER,
    lesson_id    INTEGER,
    content      TEXT      NOT NULL,
    send_date    TIMESTAMP NOT NULL,
    PRIMARY KEY (recipient_id, sender_id, lesson_id),
    FOREIGN KEY (recipient_id) REFERENCES Users (id),
    FOREIGN KEY (sender_id) REFERENCES Users (id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons (id)
);

CREATE TABLE Participants
(
    user_id      INTEGER,
    classroom_id INTEGER,
    PRIMARY KEY (user_id, classroom_id),
    FOREIGN KEY (user_id) REFERENCES Users (id),
    FOREIGN KEY (classroom_id) REFERENCES Classrooms (id)
);
