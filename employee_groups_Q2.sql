-- Question - 2

/* We will perform this question into 4 steps:
Step - 1 Concatenation
Step - 2 Will use a Window function named NTILE(), It basically divide the row of data into equal number of groups.
Step - 3 String Aggregate Function
Step - 4 GROUP BY
*/

CREATE TABLE emp (
    id SERIAL PRIMARY KEY,
    name VARCHAR(10)
);

INSERT INTO emp (id, name) VALUES
(1, 'Emp1'),
(2, 'Emp2'),
(3, 'Emp3'),
(4, 'Emp4'),
(5, 'Emp5'),
(6, 'Emp6'),
(7, 'Emp7'),
(8, 'Emp8');

SELECT * FROM emp;

WITH cte AS(
	SELECT *, CONCAT(id, ' ', name) as con,
	NTILE(4) OVER(ORDER BY id ASC) as groups
	FROM emp
	)
SELECT STRING_AGG(con, ', ') as result, groups
FROM cte
GROUP BY groups
ORDER BY groups;
