CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  password_digest VARCHAR(255) NOT NULL
);

CREATE TABLE recipes (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT,
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
