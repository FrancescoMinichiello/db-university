--Query select join

--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT *
FROM `students` 
JOIN degrees 
ON students.degree_id = degrees.id 
WHERE degrees.name = 'Corso di Laurea in Economia';

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT * 
FROM `degrees` 
JOIN `departments` 
ON degrees.department_id = departments.id 
WHERE departments.name = 'dipartimento di neuroscienze' 
AND degrees.level = 'magistrale';

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT * 
FROM `courses` 
JOIN `course_teacher` 
ON course_teacher.course_id = courses.id 
JOIN `teachers` 
ON course_teacher.teacher_id = teachers.id 
WHERE teachers.id = '44';

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT * 
FROM `students` 
JOIN `degrees` 
ON students.degree_id = degrees.id 
JOIN `departments` 
ON degrees.department_id = departments.id 
ORDER BY students.surname ASC, students.name ASC;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT * 
FROM `degrees` 
JOIN `courses` 
ON courses.degree_id = degrees.id 
JOIN `course_teacher` 
ON course_teacher.course_id = courses.id 
JOIN `teachers` 
ON course_teacher.teacher_id = teachers.id;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT teachers.* 
FROM `teachers` 
JOIN `course_teacher` 
ON course_teacher.teacher_id = teachers.id 
JOIN `courses` 
ON course_teacher.course_id = courses.id 
JOIN `degrees` 
ON courses.degree_id = degrees.id 
JOIN `departments` 
ON degrees.department_id = departments.id 
WHERE departments.name = 'dipartimento di matematica'

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente,filtrare i tentativi con voto minimo 18.



--Query select and group by

--1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(enrolment_date),
COUNT(*) FROM `students` 
GROUP BY YEAR(enrolment_date);

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT office_address, COUNT(*) FROM `teachers` 
GROUP BY office_address;

--3. Calcolare la media dei voti di ogni appello d'esame

SELECT exam_id, AVG(vote) FROM `exam_student` 
GROUP BY exam_id;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT departments.name, COUNT(*) FROM `degrees` 
INNER JOIN `departments` 
ON degrees.department_id = departments.id 
GROUP BY department_id;