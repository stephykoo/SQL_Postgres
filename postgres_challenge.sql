CREATE TABLE members (id serial PRIMARY KEY, surname varchar, first_name varchar, address varchar, zipcode varchar, telephone varchar, recommend_by integer REFERENCES members(id), join_date timestamp without time zone);

 INSERT INTO members (surname, first_name, address, zipcode, telephone, recommend_by, join_date) VALUES ('Smith', 'Dan', '23 Highway Way, Boston', 23423, '123-344-2332', 1, '2018-02-28');

 CREATE TABLE facilities (id serial PRIMARY KEY, name varchar, members_cost numeric, guest_cost numeric, initialOL integer, Maintenance integer);

INSERT INTO facilities (name, members_cost, guest_cost, initial_over_lay, monthly_maintenance) VALUES ('Tennis Court 1', 25, 1000, 10000, 500);

CREATE TABLE bookings (id serial PRIMARY KEY, facility_id integer REFERENCES facilities(id), member_id integer REFERENCES members(id), start_time timestamp without time zone, slots integer);

EPIC 2 QUERY the Database using JOINs on the Foreign Keys:

 SELECT d.id, md.member_id, md.start_time FROM members d JOIN bookings md ON d.id = md.member_id WHERE member_id = 28 ORDER BY md.start_time;

OR

SELECT md.start_time FROM members d JOIN bookings md ON d.id = md.member_id WHERE member_id = 28 ORDER BY md.start_time; (If desired to be most succient)
