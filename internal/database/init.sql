
CREATE TABLE IF NOT EXISTS users
(
    id serial PRIMARY KEY,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    created_at timestamp NOT NULL DEFAULT NOW(),
    updated_at timestamp NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS posts
(
    id serial PRIMARY KEY,
    title text NOT NULL,
    content text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp NOT NULL DEFAULT NOW(),
    updated_at timestamp NOT NULL DEFAULT NOW()
);



CREATE TABLE IF NOT EXISTS comments
(
    id serial PRIMARY KEY,
    content text NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp NOT NULL DEFAULT NOW(),
    updated_at timestamp NOT NULL DEFAULT NOW()
);



    CREATE TABLE IF NOT EXISTS likes
(
    id serial PRIMARY KEY,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp NOT NULL DEFAULT NOW(),
    updated_at timestamp NOT NULL DEFAULT NOW()
);



ALTER TABLE comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES posts(id);

ALTER TABLE comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES posts(id);

ALTER TABLE likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id); 


INSERT INTO users (name, email, password) VALUES ('John Doe', 'john@example.com', '$2a$10$2b2cU8CPhOTaGrs1HRQuAueS7JTT2zgr2ep9MCQUmPS6CJmZAqym6'), ('Jane Doe', 'jane@example.com', '$2a$10$2b2cU8CPhOTaGrs1HRQuAueS7JTT2zgr2ep9MCQUmPS6CJmZAqym6');

INSERT INTO posts (title, content, user_id) VALUES ('Hello, world!', 'This is my first post.', 1), ('Learn Go', 'Go is a powerful programming language.', 1);

INSERT INTO comments (content, post_id, user_id) VALUES ('First!', 1, 1), ('Second!', 1, 2);

INSERT INTO likes (post_id, user_id) VALUES (1, 1), (1, 2);
