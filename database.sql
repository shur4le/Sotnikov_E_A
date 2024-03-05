<<<<<<< HEAD
CREATE TABLE std_table(
  id INT PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  gr_numb VARCHAR2(6), CHECK 
  (gr_numb = '^[A-Za-z][A-Za-z][0-9][-0-9]?[-0-9]?[0-9]$'),
  gr_id INT
  );
 

CREATE TABLE gr_table(
  id INT PRIMARY KEY,
  std_id INT,
  teach_id INT
  );

CREATE TABLE teach_table(
  id INT PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  les_id INT
  );

CREATE TABLE les_table(
  id INT PRIMARY KEY,
  lesson_type VARCHAR2(1) NOT NULL,
  materials VARCHAR2(50) NOT NULL
  );

ALTER TABLE std_table
ADD CONSTRAINT conn_to_gr
FOREIGN KEY (gr_id) REFERENCES gr_table(id); 

ALTER TABLE gr_table
ADD CONSTRAINT conn_to_std
FOREIGN KEY (std_id) REFERENCES std_table(id);

ALTER TABLE gr_table
ADD CONSTRAINT conn_to_teach
FOREIGN KEY (teach_id) REFERENCES teach_table(id);

ALTER TABLE teach_table
ADD CONSTRAINT conn_to_les
FOREIGN KEY (les_id) REFERENCES les_table(id);
=======
CREATE TABLE std_table(
  id INT PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  gr_id INT
  );
 

CREATE TABLE gr_table(
  id INT PRIMARY KEY,
  teach_id INT,
  gr_numb VARCHAR2(6), CHECK 
  (gr_numb = '^[A-Za-z][A-Za-z][0-9][-0-9]?[-0-9]?[0-9]$'),
  );

CREATE TABLE teach_table(
  id INT PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  les_id INT
  );

CREATE TABLE les_table(
  id INT PRIMARY KEY,
  lesson_type VARCHAR2(10) NOT NULL,
  materials VARCHAR2(50)
  );

ALTER TABLE std_table
ADD CONSTRAINT conn_to_gr
FOREIGN KEY (gr_id) REFERENCES gr_table(id); 

ALTER TABLE gr_table
ADD CONSTRAINT conn_to_teach
FOREIGN KEY (teach_id) REFERENCES teach_table(id);

ALTER TABLE teach_table
ADD CONSTRAINT conn_to_les
FOREIGN KEY (les_id) REFERENCES les_table(id);
>>>>>>> 267da9d8a06aa4ad485efe367d90ab05efcb17f6
