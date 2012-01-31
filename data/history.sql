CREATE TABLE console (
  work_dir TEXT NOT NULL,
  command TEXT PRIMARY KEY NOT NULL,
  arguments TEXT,
  time TIMESTAMP NOT NULL
);
