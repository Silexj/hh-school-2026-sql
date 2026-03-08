SELECT a.area_id, a.area_name,
       round(AVG((v.compensation_from + v.compensation_to) / 2), 2) AS avg_,
       round(AVG(v.compensation_from), 2) AS avg_from,
       round(AVG(v.compensation_to), 2) AS avg_to
FROM vacancy v
JOIN area a ON a.area_id = v.area_id
GROUP BY a.area_id
ORDER BY a.area_id;