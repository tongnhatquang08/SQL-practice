-- bai 1:
SELECT email
FROM users
WHERE role != 'admin' AND role != 'premium'
ORDER BY email ASC;

-- bai 2:
SELECT name
FROM Products
ORDER BY name ASC
LIMIT 1;

-- bai 3:
SELECT name
FROM scoring
ORDER BY score DESC
LIMIT 5 OFFSET 3;

-- bai 4:
SELECT name, id
FROM Grades
WHERE Final > Midterm1 + Midterm2
ORDER BY LEFT(name, 3), id ASC;

-- bai 5:
select id, name, surname
from suspect
where height <= 170 and name like 'B%' and surname like 'Gre_n';

-- bai 6:
select * 
from usersname
where attribute like concat( '%', first_name , '_' , 'second_name')
order by attribute ASC;

-- bai 7:
SELECT
  id,
  CASE
    WHEN given_answer = 'NULL' THEN 'no_answer'
    WHEN given_answer = correct_answer THEN 'correct'
    ELSE 'incorrect'
  END AS checks
FROM answers
ORDER BY id ASC;

-- bai 8:
SELECT * 
FROM expressions
WHERE CASE operation
    WHEN '+' THEN a + b = c
    WHEN '-' THEN a - b = c
    WHEN '*' THEN a * b = c
    WHEN '/' THEN a / b = c
END;

-- bai 9:
SELECT DISTINCT subcriber
FROM full_year
WHERE newspaper LIKE '%Daily%'
UNION -- ket hop kqua tu truy van khac
SELECT DISTINCT subcriber
FROM half_year
WHERE newspaper LIKE '%Daily%'
ORDER BY subcriber ASC;
