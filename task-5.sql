SELECT v.vacancy_id, v.vacancy_title
FROM response r
JOIN vacancy v ON r.vacancy_id = v.vacancy_id
WHERE r.created_at <= v.published_at + interval '7 days'
AND r.created_at >= v.published_at
GROUP BY v.vacancy_id
HAVING count(*) > 5
ORDER BY v.vacancy_id