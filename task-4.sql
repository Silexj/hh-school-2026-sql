SELECT to_char(published_at, 'YYYY-MM') AS month, COUNT(*) AS total
FROM vacancy
GROUP BY to_char(published_at, 'YYYY-MM')
ORDER BY total DESC
LIMIT 1;

SELECT to_char(created_at, 'YYYY-MM') AS month, COUNT(*) AS total
FROM resume
GROUP BY to_char(created_at, 'YYYY-MM')
ORDER BY total DESC
LIMIT 1;
