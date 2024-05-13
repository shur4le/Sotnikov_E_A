-- все студенты одной группы
SELECT student.name
FROM student
JOIN u_group ON student.ID_GROUP = u_group.id
WHERE u_group.gr_numb = 'RT';

--Вывести по каким дисциплинам ведет препод
SELECT discipline.name
FROM discipline
JOIN lesson ON discipline.id = lesson.id_discipline
JOIN teachers ON lesson.id_teacher= teachers.id
WHERE teachers.name = 'Иван Иванович';

--Вывести по студенту все дисциплины, на которые он ходит
SELECT discipline.name
FROM discipline
JOIN lesson ON discipline.id = lesson.id_discipline
JOIN teachers ON lesson.id_teacher = teachers.id
JOIN group_to_teacher ON teachers.id = group_to_teacher.id_teacher
JOIN u_group ON group_to_teacher.id_group = u_group.id
JOIN student ON u_group.id = student.id_group
WHERE student.name = 'Иванов Иван Иванович';

--Вывести дисциплины, на которых больше одного препода
SELECT discipline.name
FROM discipline
JOIN lesson ON discipline.id = lesson.id_discipline
GROUP BY discipline.name
HAVING COUNT(DISTINCT lesson.id_teacher) > 1;
