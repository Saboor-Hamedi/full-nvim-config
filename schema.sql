CREATE TABLE authors(
id serial primary key,
name  TEXT NOT NULL,
birth_year INTEGER,
death_year INTEGER);


CREATE TABLE books (
id SERIAL PRIMARY KEY,
gutenber_id INTEGER UNIQUE NOT NULL,
title TEXT NOT NULL,
language TEXT,
download_count INTEGER DEFAULT 0,
release_date DATE
);

 -- many to many relationship

CREATE TABLE book_authors (
  book_id INTEGER NOT NULL REFERENCES books(id) ON DEFAULT CASCADE,
  autho_id INTEGER NOT NULL REFERENCES authors(id) ON DEFAULT CASCADE
  PRIMARY KEY(book_id, autho_id)
);

-- subject table
CREATE TABLE  subjects(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NUL
);

-- many to many books to subjects
CREATE TABLE book_subject (
  book_id INTEGER NOT NULL REFERENCES books(id)  ON DELETE CASCADE,
  subject_id INTEGER NOT NULL REFERENCES subjects(id) ON DELETE CASCADE
);
-- this is optional  store the raw text/books
CREATE TABLE texts (
book_id INTEGER PRIMARY KEY REFERENCES books(id) ON DELETE CASCADE,
content  TEXT,
word_count INTEGER,
char_count INTEGER
);
-- indexing
CREATE INDEX idx_book_authors_author ON book_author(autho_id);
CREATE INDEX idx_subjects_subject ON  book_subjects(subject_id);
CREATE INDEX idx_books_language ON books(language);
CREATE INDEX idx_books_download ON books(download_count);




