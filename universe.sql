CREATE DATABASE universe;

-- TABLES
CREATE TABLE galaxy(
	galaxy_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE,
    age NUMERIC(5,2) NOT NULL,
    is_spiral BOOLEAN,
    description TEXT
);

CREATE TABLE star(
	star_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    temperature INT,
    is_active BOOLEAN NOT NULL
);

CREATE TABLE planet(
	planet_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE,
	star_id INT REFERENCES star(star_id),
    mass NUMERIC(5,2),
    is_habitable BOOLEAN NOT NULL
);

CREATE TABLE moon(
	moon_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE,
	planet_id INT REFERENCES planet(planet_id),
    diameter INT,
    has_life BOOLEAN NOT NULL
);

CREATE TABLE spacecraft(
	spacecraft_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE,
    speed INT NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    mission TEXT
);

-- ROWS
INSERT INTO galaxy(name, age, is_spiral, description) VALUES
('Milky Way', 13.51, TRUE, 'Our home galaxy, contains the Solar System.'),
('Andromeda', 10.00, TRUE, 'Nearest spiral galaxy to the Milky Way, will collide with it in 4.5 billion years.'),
('Triangulum', 12.00, TRUE, 'A small spiral galaxy in the Local Group.'),
('Messier 87', 13.70, FALSE, 'A giant elliptical galaxy in the Virgo Cluster.'),
('Sombrero', 12.80, TRUE, 'Has a bright nucleus and large central bulge, making it look like a hat.'),
('Large Magellanic Cloud', 13.10, FALSE, 'A satellite galaxy of the Milky Way.');

INSERT INTO star (name, galaxy_id, temperature, is_active) VALUES
('Sun', 1, 5778, TRUE),
('Proxima Centauri', 1, 3042, TRUE),  
('Alpha Andromedae', 2, 13800, TRUE), 
('TRI-1221', 3, 5800, FALSE), 
('M87-Core', 4, 9000, TRUE),  
('LMC-X1', 6, 25000, TRUE); 
  
INSERT INTO planet (name, star_id, mass, is_habitable) VALUES
('Earth', 1, 5.97, TRUE), 
('Mars', 1, 0.64, FALSE),   
('Jupiter', 1, 1898.00, FALSE),   
('Proxima b', 2, 1.27, TRUE),
('Andros', 3, 6.50, TRUE),  
('Veridon', 3, 3.14, FALSE),  
('Triangula Prime', 4, 2.71, TRUE),
('Delta Trianguli', 4, 0.85, FALSE),
('M87a', 5, 10.23, FALSE),
('M87b', 5, 7.80, FALSE),  
('Lumen I', 6, 1.11, TRUE),       
('Lumen II', 6, 0.98, FALSE);     

INSERT INTO moon (name, planet_id, diameter, has_life) VALUES
('Luna', 1, 3475, FALSE),
('Phobos', 2, 22, FALSE),
('Deimos', 2, 12, FALSE),
('Io', 3, 3643, FALSE),
('Europa', 3, 3122, FALSE),
('Ganymede', 3, 5268, FALSE),
('Callisto', 3, 4820, FALSE),
('ProxiMoon-1', 4, 1500, FALSE),
('ProxiMoon-2', 4, 800, FALSE),
('Andros Alpha', 5, 2300, TRUE),
('Andros Beta', 5, 1700, FALSE),
('Verdusk', 6, 1000, FALSE),
('Tria', 7, 900, FALSE),
('Quaria', 7, 650, FALSE),
('Delta X', 8, 1200, FALSE),
('M8-X1', 9, 1800, FALSE),
('M8-X2', 9, 2100, FALSE),
('M8-Zeta', 10, 1000, FALSE),
('Lumora', 11, 600, TRUE),
('Shadewind', 12, 700, FALSE);

INSERT INTO spacecraft (name, speed, planet_id, mission) VALUES
('Voyager I', 62000, 1, 'Explore outer planets and interstellar space'),
('Curiosity Rover', 200, 2, 'Mars surface exploration and data collection'),
('Europa Clipper', 40000, 3, 'Investigate habitability of Europa'),
('Proxima Scout', 75000, 4, 'Send probes to Proxima b for atmosphere sampling'),
('Andros Ark', 150000, 5, 'First manned mission to Andros'),
('Lumen Seeker', 92000, 11, 'Search for life on Lumora');
