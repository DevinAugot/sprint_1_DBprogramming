const Pool = require("pg").Pool;
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "sprint_1_db",
  password: "Keyin2021",
  port: 5432,
});

// #1. What airports are in what cities? (WORKING WITH INNER JOIN! http://localhost:3000/airport_city)

const getAirportCities = (request, response) => {
  pool.query(
    "SELECT * FROM airports INNER JOIN cities ON airport_id = city_id",
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

// # 2. list all aircraft passengers have travelled on (working with INNER JOIN)

const getAircraftPassenger = (request, response) => {
  pool.query(
    "SELECT * FROM aircraft a INNER JOIN passengers p ON a.passenger_id = p.pass_id",
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

// # 3 which airports can aircraft take off from and land at? (working)(table already show multiple aircraft taking off or landing at many aiports so join not needed)

const getAircraftAirport = (request, response) => {
  pool.query("SELECT * FROM airport_aircraft", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

// #4. What airports have passengers used? (Airports can only be in one city)(working with INNER JOIN, thinking was that passengers would more likley to use home city airport )

const getAirportPassenger = (request, response) => {
  pool.query(
    "SELECT * FROM passengers INNER JOIN airports ON home_city_id = airport_id ",
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};
module.exports = {
  getAirportCities,
  getAircraftPassenger,
  getAircraftAirport,
  getAirportPassenger,
};
