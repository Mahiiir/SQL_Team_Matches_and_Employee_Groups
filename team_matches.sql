-- Question - 1

-- In this we used the concept of Permutation & Combination.

CREATE TABLE match(
	team varchar(20)
)

INSERT INTO match (team)
VALUES
('India'),
('Pak'),
('Aus'),
('Eng');

SELECT * FROM match

WITH cte AS(
	SELECT *, ROW_NUMBER() OVER(ORDER BY team ASC) AS id
	FROM match
)
select a.team as "Team-A", b.team AS "Team-B"
FROM cte AS a
JOIN cte AS b
ON a.team <> b.team
WHERE a.id < b.id;
