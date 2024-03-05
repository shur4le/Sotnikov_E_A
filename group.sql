CREATE TABLE group(
  id INT PRIMARY KEY,
  gr_numb VARCHAR2(6), CHECK 
  (gr_numb = '^[A-Za-z][A-Za-z][0-9][-0-9]?[-0-9]?[0-9]$')
  );

