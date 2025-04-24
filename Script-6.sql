CREATE TABLE public.committee (
	committee_id varchar NOT NULL,
	committee_name varchar NOT NULL,
	committee_type varchar NOT NULL,
	CONSTRAINT committee_pk PRIMARY KEY (committee_id)
);
CREATE TABLE public.contributor (
	contributor_id serial NOT NULL,
	city varchar NULL,
	state varchar NULL,
	zipcode varchar NULL,
	contributor_name varchar NULL,
	CONSTRAINT contributor_pk PRIMARY KEY (contributor_id)
);
CREATE TABLE public."date" (
	date_id serial NOT NULL,
	"date" varchar NOT NULL,
	"day" int4 NOT NULL,
	"month" varchar NOT NULL,
	"year" int4 NOT NULL,
	CONSTRAINT date_pk PRIMARY KEY (date_id)
);
CREATE TABLE public.emp_info (
	emp_info_id serial NOT NULL,
	"name" varchar NOT NULL,
	occupation varchar NOT NULL,
	employer varchar NOT NULL,
	CONSTRAINT emp_info_pk PRIMARY KEY (emp_info_id)
);
CREATE TABLE public.contributions (
	emp_info_id serial NOT NULL,
	committee_id varchar NOT NULL,
	contributor_id serial NOT NULL,
	date_id serial NOT NULL,
	amount int4 NOT NULL,
	CONSTRAINT contributions_pk PRIMARY KEY (emp_info_id, committee_id, contributor_id, date_id),
	CONSTRAINT contributions_committee_fk FOREIGN KEY (committee_id) REFERENCES public.committee(committee_id),
	CONSTRAINT contributions_contributor_fk FOREIGN KEY (contributor_id) REFERENCES public.contributor(contributor_id),
	CONSTRAINT contributions_date_fk FOREIGN KEY (date_id) REFERENCES public."date"(date_id),
	CONSTRAINT contributions_emp_info_fk FOREIGN KEY (emp_info_id) REFERENCES public.emp_info(emp_info_id)
);