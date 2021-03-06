CREATE TABLE memos (
  id BIGSERIAL PRIMARY KEY,
  post_id    integer NOT NULL,
  sort_order BIGSERIAL,
  body text NOT NULL
);
CREATE INDEX memos_sort_order ON memos (sort_order);

CREATE TABLE posts (
  id BIGSERIAL PRIMARY KEY,
  space_id integer NOT NULL,
  title character varying(255) NOT NULL
);

CREATE TABLE spaces (
  id BIGSERIAL PRIMARY KEY,
  space_type character varying(255) NOT NULL,
  user_key character varying(255) NOT NULL
);
