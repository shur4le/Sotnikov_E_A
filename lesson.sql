CREATE TABLE lesson(
  id INT PRIMARY KEY,
  materials VARCHAR2(50) NOT NULL,
  id_discipline INT,
  id_teacher INT
  );

ALTER TABLE group_to_teacher
ADD CONSTRAINT conn_to_discipline
FOREIGN KEY (id_discipline) REFERENCES discipline(id),
ADD CONSTRAINT conn_to_teacher
FOREIGN KEY (id_teacher) REFERENCES teacher(id);
