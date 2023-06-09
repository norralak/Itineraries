CREATE DATABASE itineraries;

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE budgets (
  budget_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  amount NUMERIC(10, 2) NOT NULL,
  timeframe VARCHAR(255) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE itineraries (
  itinerary_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  budget_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  is_valid BOOLEAN NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (budget_id) REFERENCES budgets(budget_id)
);

CREATE TABLE flights (
  flight_id SERIAL PRIMARY KEY,
  itinerary_id INT NOT NULL,
  departure_city VARCHAR(255) NOT NULL,
  arrival_city VARCHAR(255) NOT NULL,
  departure_date DATE NOT NULL,
  arrival_date DATE NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  flight_link VARCHAR(255),
  FOREIGN KEY (itinerary_id) REFERENCES itineraries(itinerary_id)
);

CREATE TABLE hotels (
  hotel_id SERIAL PRIMARY KEY,
  itinerary_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  hotel_link VARCHAR(255),
  FOREIGN KEY (itinerary_id) REFERENCES itineraries(itinerary_id)
);

CREATE TABLE attractions (
  attraction_id SERIAL PRIMARY KEY,
  itinerary_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  date DATE NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  activity_link VARCHAR(255),
  FOREIGN KEY (itinerary_id) REFERENCES itineraries(itinerary_id)
);

