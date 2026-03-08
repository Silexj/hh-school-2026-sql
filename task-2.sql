INSERT INTO area (area_name)
VALUES
    ('Москва'),
    ('Санкт-Петербур'),
    ('Ярославль'),
    ('Новосибирск'),
    ('Хабаровск'),
    ('Екатеринбург'),
    ('Казань'),
    ('Томск'),
    ('Волгоград');

INSERT INTO employer (employer_name)
VALUES
    ('Google'),
    ('Head Hunter'),
    ('Yandex'),
    ('Jetbrains'),
    ('Sber'),
    ('T-BANK'),
    ('Postgrespro'),
    ('Selectel'),
    ('Kontur');

INSERT INTO specialization (specialization_name)
VALUES
    ('Backend engineer'),
    ('Frontend engineer'),
    ('Sys admin'),
    ('Sys analyst'),
    ('Product manager'),
    ('Product analyst'),
    ('Solution architect'),
    ('DevOps'),
    ('QA engineer');

WITH gen_data( title, emp_id, ar_id, pub_at, compensation, hours, dep, spec_id) AS (
    SELECT md5(random()::text) AS title,
           floor((random() * 9) + 1)::int  AS emp_id,
           floor((random() * 9) + 1)::int  AS ar_id,
           '2023-01-01 00:00:00'::timestamp + random() * interval '1096 days' AS pub_at,
           round((random() * 1000000)::int, -3) AS compensation,
           (floor((random() * 4) + 1)::int * 10) AS hours,
           md5(random()::text) AS dep,
           floor((random() * 9) + 1)::int  AS spec_id
    FROM generate_series(1, 10000))
INSERT INTO vacancy (vacancy_title, employer_id, area_id, published_at, compensation_from, compensation_to, hours_per_week, department, specialization_id)
SELECT title, emp_id, ar_id, pub_at, compensation, compensation + 20000, hours, dep, spec_id
FROM gen_data;


WITH gen_data(title, cr_at, f_name, l_name, ar_id, spec_id) AS (
    SELECT  md5(random()::text) AS title,
            '2023-01-01 00:00:00'::timestamp + random() * interval '1096 days' AS cr_at,
            md5(random()::text) AS f_name,
            md5(random()::text) AS l_name,
            floor((random() * 9) + 1)::int  AS ar_id,
            floor((random() * 9) + 1)::int  AS spec_id
    FROM generate_series(1, 100000))
INSERT INTO resume (resume_title, created_at, first_name, last_name, area_id, specialization_id)
SELECT title, cr_at, f_name, l_name, ar_id, spec_id
FROM gen_data;


INSERT INTO response (vacancy_id, resume_id, created_at)
SELECT v.vacancy_id,
       r.resume_id,
       v.published_at + (random() * interval '90 days')
FROM vacancy v
JOIN resume r ON v.specialization_id = r.specialization_id
WHERE random() < 0.05
AND v.published_at >= r.created_at
AND v.area_id = r.area_id;











