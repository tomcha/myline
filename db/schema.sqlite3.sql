CREATE TABLE IF NOT EXISTS tasks (
  id INTEGER PRIMARY KEY NOT NULL,
  userid text NOT NULL,
  remind_datetime text NOT NULL,
  deleted_flag INTEGER NOT NULL,
  created_at text NOT NULL
);
