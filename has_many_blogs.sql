DROP TABLE comments;
DROP TABLE posts;
DROP TABLE users;

CREATE TABLE users (
  id serial NOT NULL,
  username character varying(90) NOT NULL,
  first_name character varying(90) DEFAULT NULL,
  last_name character varying(90) DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp with time zone NOT NULL DEFAULT NOW(),
  PRIMARY KEY (id)
);

CREATE TABLE posts (
  id serial NOT NULL,
  title character varying(180) DEFAULT NULL,
  url character varying(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp with time zone NOT NULL DEFAULT NOW(),
  user_id integer,
  PRIMARY KEY(id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE comments (
  id serial NOT NULL,
  body character varying(510) DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp with time zone NOT NULL DEFAULT NOW(),
  user_id integer,
  posts_id integer,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (posts_id) REFERENCES posts (id)
);

\i scripts/blog_data.sql;