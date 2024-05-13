CREATE TABLE student(
  id INT PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  id_group INT
  );

ALTER TABLE student
ADD CONSTRAINT conn_to_group
FOREIGN KEY (id_group) REFERENCES group(id);