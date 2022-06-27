
create table "user" (
user_id bigint NOT NULL PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(50) NOT NULL,
location varchar(50) NOT NULL,
phone_number varchar(50) NOT NULL,
last_login timestamp
);

create table job(
job_id bigint NOT NULL PRIMARY KEY,
budget decimal,
user_id bigint,
description varchar(255),
deadline varchar(50),
start_date timestamp,
end_date timestamp,
picture bytea,
location varchar(50),
status varchar(50)
);

create table rate(
rate_id bigint NOT NULL PRIMARY KEY,
quality_of_service int,
user_id bigint,
deadline varchar(50),
price int,
comment varchar(50),
created timestamp,
created_by varchar(50)
);

create table category(
category_id bigint NOT NULL PRIMARY KEY,
name varchar(50) NOT NULL
);

create table profession(
profession_id bigint NOT NULL PRIMARY KEY,
category_id bigint,
name varchar(50) NOT NULL
);

create table user_profession(
user_id bigint,
profession_id bigint
);

create table offer(
offer_id bigint NOT NULL PRIMARY KEY,
price bigint,
user_id bigint,
job_id bigint,
start_date timestamp,
end_date timestamp,
description varchar(255),
status varchar(50)
);


create table service(
service_id bigint NOT NULL PRIMARY KEY,
profession_id bigint,
name varchar(50) NOT NULL
);


ALTER TABLE job 
ADD CONSTRAINT fk_user_job 
FOREIGN KEY (user_id) 
REFERENCES "user" (user_id);

ALTER TABLE rate 
ADD CONSTRAINT fk_user_rate
FOREIGN KEY (user_id) 
REFERENCES "user" (user_id);

ALTER TABLE profession 
ADD CONSTRAINT fk_profession_category
FOREIGN KEY (category_id) 
REFERENCES category (category_id);

ALTER TABLE user_profession 
ADD CONSTRAINT fk_user_user_profession 
FOREIGN KEY (user_id) 
REFERENCES "user" (user_id);

ALTER TABLE user_profession 
ADD CONSTRAINT fk_profession_user_profession 
FOREIGN KEY (profession_id) 
REFERENCES profession (profession_id);
 
ALTER TABLE offer
ADD CONSTRAINT fk_offer_user
FOREIGN KEY (user_id)
REFERENCES "user" (user_id);
 
ALTER TABLE offer 
ADD CONSTRAINT fk_offer_job
FOREIGN KEY (job_id) 
REFERENCES job (job_id);
 
ALTER TABLE service 
ADD CONSTRAINT fk_service_profession 
FOREIGN KEY (profession_id) 
REFERENCES profession (profession_id);