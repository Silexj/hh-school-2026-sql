-- Для поиска вакансий по диапазону или по начальной стартовой зп
CREATE INDEX vac_compensation_from_to_idx ON vacancy(compensation_from, compensation_to);

-- Для поиска вакансий по региону и/или специальности,
-- не совместил т.к. возможен поиск отдельно по специальности без конкретного региона
CREATE INDEX vac_area_id_idx ON vacancy(area_id);
CREATE INDEX vac_specialization_id_idx ON vacancy(specialization_id);

-- Для поиска вакансий по дате публикации
CREATE INDEX vac_published_at_idx ON vacancy(published_at);

-- Для поиска вакансий по работодателю
CREATE INDEX vac_employer_id_idx ON vacancy(employer_id);

-- Для поиска резюме по специальности
CREATE INDEX res_specialization_id_idx ON resume(specialization_id);
-- Для поиска резюме по региону
CREATE INDEX res_area_id_idx ON resume(area_id);

-- Для поиска откликов по вакансии (сторона работодателя)
-- и ограничение на 1 отклик от резюме
CREATE UNIQUE INDEX vacancy_resume_id_idx ON response(vacancy_id, resume_id);

-- Для поиска откликов по резюме (сторона соискателя)
CREATE INDEX resume_id_idx ON response(resume_id);