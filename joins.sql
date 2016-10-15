SELECT * FROM users;
-- Returns 50000 rows

SELECT * FROM posts WHERE user_id = 100;
-- Returns 1 row

SELECT posts.id, posts.title, posts.url, posts.content, posts.created_at, posts.updated_at, users.first_name, users.last_name
FROM posts INNER JOIN users ON posts.user_id = users.id
WHERE user_id = 200;
-- Returns 1 row

SELECT posts.id, posts.title, posts.url, posts.content, posts.created_at, posts.updated_at, users.username
FROM posts INNER JOIN users ON posts.user_id = users.id
WHERE users.first_name = 'Norene' and users.last_name = 'Schmitt';
-- Returns 1 row

SELECT DISTINCT username
FROM users INNER JOIN  posts ON posts.user_id = users.id
WHERE posts.created_at > '2015-01-01 00:00:00-10'
ORDER BY username ASC;
-- Returns 20523 rows

SELECT posts.title, posts.content, users.username
FROM posts INNER JOIN users ON posts.user_id = users.id
WHERE users.created_at < '2015-01-01 00:00:00-10';
-- Returns 23488 rows

SELECT comments.id, posts.title AS "Post Title", comments.body, comments.created_at, comments.updated_at
FROM comments INNER JOIN posts ON comments.posts_id = posts.id;
-- Returns 19729 rows

SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments INNER JOIN posts ON comments.posts_id = posts.id
WHERE posts.created_at < '2015-01-01 00:00:00-10';
-- Returns 9126 rows

SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments INNER JOIN posts ON comments.posts_id = posts.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';
-- Returns 10603 rows

SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments INNER JOIN posts ON comments.posts_id = posts.id
WHERE comments.body LIKE '%USB%';
-- Returns 728 rows

SELECT posts.title AS "post_title", users.first_name, users.last_name, comments.body AS "comment_body"
FROM posts
INNER JOIN users ON posts.user_id = users.id
INNER JOIN comments ON comments.posts_id = posts.id
WHERE comments.body LIKE '%matrix%';
-- Returns 855 rows

SELECT users.first_name, users.last_name, comments.body AS "comment_body"
FROM comments
INNER JOIN users ON users.id = comments.user_id
INNER JOIN posts ON posts.id = comments.posts_id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';
-- Returns 102 rows

SELECT u.first_name AS "post_author_first_name", u.last_name AS "post_author_last_name", p.title AS "post_title", cu.username AS "comment_author_username", c.body AS "comment_body"
FROM comments AS c
INNER JOIN posts AS p ON p.id = c.posts_id
INNER JOIN users AS u ON u.id = p.user_id
INNER JOIN users AS cu ON cu.id = c.user_id
WHERE (c.body LIKE '%SSL%' OR c.body LIKE'%firewall%') AND p.content LIKE '%nemo%';
-- Returns 218 rows

SELECT posts.id, posts.title, posts.user_id AS post_author
FROM comments
INNER JOIN posts ON posts.id = comments.posts_id
WHERE comments.user_id = posts.user_id;
-- Returns 0 rows

SELECT COUNT(comments.id)
FROM comments
INNER JOIN posts on posts.id = comments.posts_id
WHERE posts.created_at > '2015-07-14 00:00:00-10';
-- Returns counts of 27

SELECT *
FROM users
INNER JOIN comments on comments.user_id = users.id
WHERE comments.body  LIKE '%programming%';
-- Returns 337