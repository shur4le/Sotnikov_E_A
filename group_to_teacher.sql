CREATE TABLE group_to_teacher(
  id INT PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  id_group INT,
  id_teacher INT
  );

ALTER TABLE group_to_teacher
ADD CONSTRAINT conn_to_group
FOREIGN KEY (id_group) REFERENCES group(id),
ADD CONSTRAINT conn_to_teacher
FOREIGN KEY (id_teacher) REFERENCES teacher(id);
