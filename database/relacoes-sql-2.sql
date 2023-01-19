-- Active: 1673893759360@@127.0.0.1@3306

-- Práticas

CREATE TABLE users(

    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users(id, name, email, password)
VALUES
('berg01', 'bergson', 'bergson@gmail.com', 'berg123' ),
('dani02', 'daniele', 'dani@gmail.com', 'dani123'),
('luck03', 'lucky',' lucky@gmail.com', 'luck123');

CREATE TABLE follows(

    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followed_id) REFERENCES users (id)


);

INSERT INTO follows ( follower_id, followed_id)
VALUES
('b001', 'b002'),
('b001', 'b003'),
('b002', 'b001');

SELECT * FROM follows;

-- Mostra somente quem está seguindo
SELECT * FROM follows
INNER JOIN users
ON follows.follower_id = users.id;

-- Prática 3

-- Mostra quem está seguindo e quem não seguiu
-- A = follows e B = users , portanto RIGHT JOIN
SELECT * FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id;

-- Tb Mostra quem está seguindo e quem não seguiu,
-- mas muda a perspectiva A e B
-- A = users e B = follows , portanto LEFT JOIN
SELECT * FROM users
LEFT JOIN follows
ON follows.follower_id = users.id;

-- Mostrando os dados da pessoa q foi seguida
SELECT
    follows.follower_id AS followerId,
    follows.followed_id AS followedId,
    users.name AS followerName,
    followedUsers.name AS followedName,
    users.email AS followerEmail
FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id
LEFT JOIN users AS followedUsers
ON follows.followed_id = followedUsers.id;