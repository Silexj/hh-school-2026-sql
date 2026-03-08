CREATE TABLE area (
                        area_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        area_name text NOT NULL
);

CREATE TABLE employer (
                        employer_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        employer_name text NOT NULL
);

CREATE TABLE specialization (
                        specialization_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        specialization_name text NOT NULL
);

CREATE TABLE vacancy (
                        vacancy_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        vacancy_title text NOT NULL,
                        employer_id integer NOT NULL,
                        FOREIGN KEY (employer_id) REFERENCES employer (employer_id),
                        area_id integer NOT NULL,
                        FOREIGN KEY (area_id) REFERENCES area (area_id),
                        published_at timestamp NOT NULL,
                        compensation_from integer,
                        compensation_to integer,
                        hours_per_week integer,
                        department text NOT NULL,
                        specialization_id integer NOT NULL,
                        FOREIGN KEY (specialization_id) REFERENCES specialization (specialization_id)
);

CREATE TABLE resume (
                        resume_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        resume_title text NOT NULL,
                        created_at timestamp NOT NULL,
                        first_name text NOT NULL,
                        last_name text NOT NULL,
                        middle_name text,
                        compensation integer,
                        area_id integer NOT NULL,
                        FOREIGN KEY (area_id) REFERENCES area (area_id),
                        specialization_id integer NOT NULL,
                        FOREIGN KEY (specialization_id) REFERENCES specialization (specialization_id)
);

CREATE TABLE response (
                        response_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                        created_at timestamp NOT NULL,
                        vacancy_id integer NOT NULL,
                        FOREIGN KEY (vacancy_id) REFERENCES vacancy (vacancy_id),
                        resume_id integer NOT NULL,
                        FOREIGN KEY (resume_id) REFERENCES resume (resume_id)
);

