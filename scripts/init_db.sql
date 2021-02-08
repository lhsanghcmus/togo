SELECT 'CREATE DATABASE togo'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'togo')\gexec

CREATE TABLE IF NOT EXISTS users
(
    id       TEXT              NOT NULL,
    password TEXT              NOT NULL,
    max_todo INTEGER DEFAULT 5 NOT NULL,
    CONSTRAINT users_PK PRIMARY KEY (id)
);

INSERT INTO users (id, password, max_todo)
VALUES ('firstUser', 'example', 5);

CREATE TABLE IF NOT EXISTS tasks
(
    id           TEXT NOT NULL,
    content      TEXT NOT NULL,
    user_id      TEXT NOT NULL,
    created_date TEXT NOT NULL,
    CONSTRAINT tasks_PK PRIMARY KEY (id),
    CONSTRAINT tasks_FK FOREIGN KEY (user_id) REFERENCES users (id)
);
