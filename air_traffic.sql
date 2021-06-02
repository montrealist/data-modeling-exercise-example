-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

  CREATE TABLE flyer_name (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NUll
  )

CREATE TABLE airline (

  id Serial PRIMARY key,
  airline TEXT NOT NULL
)

CREATE TABLE country (

  id Serial PRIMARY KEY
  country_name TEXT NOT NULL
)

 CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airline(id),
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL REFERENCES country(id),
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL NULL REFERENCES country(id),
  flyer_id INT REFERENCES flyer_name(id)
);

INSERT INTO flyer_name (first_name,last_name) VALUES ('Jennifer', 'Finch'),('Thadeus', 'Gathercoal'),('Sonja', 'Pauley'),('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),('Alvin', 'Leathes'),('Cory', 'Squibbes')

INSERT INTO airline(airline) VALUES ('United'),('British Airways'),('Delta'),('TUI Fly Belgium'),('Air China'),('American Airlines'),('Avianca Brasil')

INSERT INTO country(country_name) VALUES ('United States'),('Japan'),('France'),('UAE'),('Brazil'),('United Kingdom'),('Mexico'),( 'Morocco'),('China'),('Chile')

INSERT INTO tickets
  (seat, departure, arrival, airline_id, from_city, from_country, to_city, to_country, flyer_id)
VALUES
  ( '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 'Washington DC', 1, 'Seattle', 1,1),
  ( '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 'Tokyo', 2, 'London', 6,2),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 'Los Angeles', 1, 'Las Vegas', 1,3),
  ( '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 'Seattle', 1, 'Mexico City', 7,1),
  ( '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 'Paris', 3, 'Casablanca',8,4),
  ( '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 'Dubai', 4, 'Beijing', 9,2),
  ( '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 'New York', 1, 'Charlotte', 1,5),
  ( '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 'Cedar Rapids', 1, 'Chicago',1,6),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 'Charlotte', 1, 'New Orleans', 1,5),
  ( '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 'Sao Paolo', 5, 'Santiago', 10,7);


SELECT first_name, last_name ,COUNT(flyer_id) FROM flyer_name JOIN tickets on  flyer_name.id = tickets.flyer_id GROUP BY(first_name,last_name) ORDER BY first_name