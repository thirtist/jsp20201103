DROP TABLE post;
CREATE TABLE post (
    id NUMBER GENERATED AS IDENTITY,
    title VARCHAR2(255),
    body VARCHAR2(4000),
    PRIMARY KEY (id)
);

SELECT * FROM post;

SELECT id, title FROM post;

SELECT title FROM post WHERE id =1;