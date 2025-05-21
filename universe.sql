
CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  galaxy_type VARCHAR(50) NOT NULL,
  age_in_millions_of_years INT NOT NULL
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  is_visible BOOLEAN NOT NULL,
  distance_from_earth NUMERIC(10,2) NOT NULL,
  star_type VARCHAR(50) NOT NULL
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT REFERENCES star(star_id),
  has_life BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  number_of_moons INT NOT NULL,
  planet_type VARCHAR(50) NOT NULL
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  is_spherical BOOLEAN NOT NULL,
  distance_from_planet NUMERIC(10,2) NOT NULL
);

CREATE TABLE element (
  element_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  atomic_number INT NOT NULL,
  discovered BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, description, galaxy_type, age_in_millions_of_years) VALUES
('Milky Way', 'Our home galaxy', 'Spiral', 13600),
('Andromeda', 'Closest major galaxy', 'Spiral', 10000),
('Triangulum', 'Nearby small spiral', 'Spiral', 8000),
('Messier 81', 'Bright galaxy in Ursa Major', 'Spiral', 12000),
('Sombrero', 'Unusual disk galaxy', 'Elliptical', 13000),
('Whirlpool', 'Interacting spiral galaxy', 'Spiral', 9000);

INSERT INTO star (name, galaxy_id, is_visible, distance_from_earth, star_type) VALUES
('Sun', 1, TRUE, 0.00, 'G-type'),
('Alpha Centauri A', 1, TRUE, 4.37, 'G-type'),
('Proxima Centauri', 1, TRUE, 4.24, 'M-type'),
('Betelgeuse', 1, TRUE, 642.5, 'Red Supergiant'),
('Sirius', 1, TRUE, 8.6, 'A-type'),
('Vega', 1, TRUE, 25.0, 'A-type');

INSERT INTO planet (name, star_id, has_life, is_spherical, number_of_moons, planet_type) VALUES
('Earth', 1, TRUE, TRUE, 1, 'Terrestrial'),
('Mars', 1, FALSE, TRUE, 2, 'Terrestrial'),
('Jupiter', 1, FALSE, TRUE, 79, 'Gas Giant'),
('Venus', 1, FALSE, TRUE, 0, 'Terrestrial'),
('Mercury', 1, FALSE, TRUE, 0, 'Terrestrial'),
('Neptune', 1, FALSE, TRUE, 14, 'Ice Giant'),
('Uranus', 1, FALSE, TRUE, 27, 'Ice Giant'),
('Saturn', 1, FALSE, TRUE, 83, 'Gas Giant'),
('Kepler-22b', 2, FALSE, TRUE, 0, 'Exoplanet'),
('Proxima b', 3, FALSE, TRUE, 0, 'Exoplanet'),
('TRAPPIST-1e', 3, FALSE, TRUE, 0, 'Exoplanet'),
('TRAPPIST-1f', 3, FALSE, TRUE, 0, 'Exoplanet');

INSERT INTO moon (name, planet_id, is_spherical, distance_from_planet) VALUES
('Moon', 1, TRUE, 384.4),
('Phobos', 2, FALSE, 9.4),
('Deimos', 2, FALSE, 23.5),
('Europa', 3, TRUE, 670.9),
('Ganymede', 3, TRUE, 1070.4),
('Callisto', 3, TRUE, 1882.7),
('Io', 3, TRUE, 421.7),
('Titan', 8, TRUE, 1221.9),
('Enceladus', 8, TRUE, 238.0),
('Mimas', 8, TRUE, 185.5),
('Rhea', 8, TRUE, 527.0),
('Iapetus', 8, TRUE, 3561.3),
('Tethys', 8, TRUE, 294.7),
('Dione', 8, TRUE, 377.4),
('Oberon', 7, TRUE, 583.5),
('Titania', 7, TRUE, 435.9),
('Ariel', 7, TRUE, 190.9),
('Umbriel', 7, TRUE, 266.0),
('Triton', 6, TRUE, 354.8),
('Charon', 5, TRUE, 19591.0);

INSERT INTO element (name, atomic_number, discovered) VALUES
('Hydrogen', 1, TRUE),
('Oxygen', 8, TRUE),
('Unobtainium', 999, FALSE);
