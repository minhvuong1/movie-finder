CREATE DATABASE movies_app;

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title TEXT,
  image_url TEXT,
  year INTEGER
);