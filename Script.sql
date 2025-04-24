DROP table IF EXISTS salesfacts;
DROP table IF EXISTS customertype;
DROP table IF EXISTS priority;
DROP table IF EXISTS province;
DROP table IF EXISTS orderdate;

CREATE TABLE public.customertype (
	id serial NOT NULL,
	description text NOT NULL,
	CONSTRAINT customertype_pk PRIMARY KEY (id)
);
CREATE INDEX customertype_description_idx ON public.customertype USING btree (description);

CREATE TABLE public.orderdate (
	id serial NOT NULL,
	rawdate timestamp NULL,
	"year" int4 NULL,
	quarter int4 NULL,
	"month" int4 NULL,
	dayofmonth int4 NULL,
	dayofweek int4 NULL,
	dayofyear int4 NULL,
	weekofyear int4 NULL,
	decade int4 NULL,
	CONSTRAINT orderdate_pk PRIMARY KEY (id)
);

CREATE TABLE public.priority (
	id serial NOT NULL,
	description text NULL,
	CONSTRAINT priority_pk PRIMARY KEY (id)
);
CREATE INDEX priority_description_idx ON public.priority USING btree (description);


CREATE TABLE public.province (
	id serial NOT NULL,
	"name" text NULL,
	CONSTRAINT province_pk PRIMARY KEY (id)
);
CREATE INDEX province_name_idx ON public.province USING btree (name);


CREATE TABLE public.salesfacts (
	provinceid int4 NOT NULL,
	priorityid int4 NOT NULL,
	orderdateid int4 NOT NULL,
	customertypeid int4 NOT NULL,
	quantity int4 NULL,
	discount float4 NULL,
	unitprice float4 NULL,
	unitcost float4 NULL,
	shipcost float4 NULL,
	shipdelay float4 NULL,
	ordertotal float4 NULL,
	unitprofit float4 NULL,
	CONSTRAINT salesfacts_pk PRIMARY KEY (provinceid, priorityid, orderdateid, customertypeid),
	CONSTRAINT salesfacts_customertype_fk FOREIGN KEY (customertypeid) REFERENCES customertype(id),
	CONSTRAINT salesfacts_orderdate_fk FOREIGN KEY (orderdateid) REFERENCES orderdate(id),
	CONSTRAINT salesfacts_priority_fk FOREIGN KEY (priorityid) REFERENCES priority(id),
	CONSTRAINT salesfacts_province_fk FOREIGN KEY (provinceid) REFERENCES province(id)
);

CREATE INDEX salesfacts_priorityid_idx ON public.salesfacts (priorityid) ;

CREATE INDEX salesfacts_orderdateid_idx ON public.salesfacts (orderdateid) ;

CREATE INDEX salesfacts_customertypeid_idx ON public.salesfacts (customertypeid) ; 