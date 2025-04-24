CREATE TABLE public.committe (
	committe_id int4 NOT NULL,
	committe_name varchar NOT NULL,
	committe_type varchar NOT NULL,
	state bpchar(1) NOT NULL,
	CONSTRAINT committe_pk PRIMARY KEY (committe_id)
);

CREATE TABLE public.contributions (
	contribution_id int4 NOT NULL,
	committe_id int4 NOT NULL,
	contributor_id int4 NOT NULL,
	party_id int4 NOT NULL,
	"date" date NOT NULL,
	amount numeric NOT NULL,
	transaction_type varchar NOT NULL,
	location_id int4 NOT NULL,
	CONSTRAINT contributions_pk PRIMARY KEY (contribution_id, committe_id, contributor_id, party_id, date, location_id),
	CONSTRAINT contributions_committe_fk FOREIGN KEY (committe_id) REFERENCES public.committe(committe_id),
	CONSTRAINT contributions_contributor_fk FOREIGN KEY (contributor_id) REFERENCES public.contributor(contributor_id),
	CONSTRAINT contributions_date_fk FOREIGN KEY ("date") REFERENCES public."date"("date"),
	CONSTRAINT contributions_location_fk FOREIGN KEY (location_id) REFERENCES public."location"(location_id),
	CONSTRAINT contributions_party_fk FOREIGN KEY (party_id) REFERENCES public.party(party_id)
);

CREATE TABLE public.contributor (
	contributor_id int4 NOT NULL,
	"name" varchar NOT NULL,
	employer varchar NOT NULL,
	occupation varchar NOT NULL,
	entity_type varchar NOT NULL,
	income_level varchar NOT NULL,
	industry_id int4 NOT NULL,
	CONSTRAINT contributor_pk PRIMARY KEY (contributor_id),
	CONSTRAINT contributor_industry_fk FOREIGN KEY (industry_id) REFERENCES public.industry(industry_id)
);

CREATE TABLE public."date" (
	"date" date NOT NULL,
	"year" int4 NOT NULL,
	quarter int4 NOT NULL,
	"month" int4 NOT NULL,
	"day" int4 NOT NULL,
	week int4 NOT NULL,
	CONSTRAINT date_pk PRIMARY KEY (date)
);

CREATE TABLE public.industry (
	industry_id int4 NOT NULL,
	industry_name varchar NOT NULL,
	sector varchar NOT NULL,
	CONSTRAINT industry_pk PRIMARY KEY (industry_id)
);

CREATE TABLE public."location" (
	location_id int4 NOT NULL,
	state bpchar(1) NOT NULL,
	city varchar NOT NULL,
	CONSTRAINT location_pk PRIMARY KEY (location_id)
);

CREATE TABLE public.party (
	party_id int4 NOT NULL,
	party_name varchar NOT NULL,
	affiliation varchar NOT NULL,
	CONSTRAINT party_pk PRIMARY KEY (party_id)
);

