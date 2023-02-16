const Pool = require("pg").Pool;
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "sprint_1_db",
  password: "Keyin2021",
  port: 5432,
});

// #1. What airports are in what cities? (this works! http://localhost:3000/airport_city)

const getAirportCities = (request, response) => {
  pool.query(
    "SELECT * FROM airports, cities WHERE airport_id = city_id",
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

// # 2. list all aircraft passengers have travelled on
const getAircraftPassenger = (request, response) => {
  pool.query("SELECT * FROM aircraft, WHERE passenger_id = aircraft_id", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};
// # 3 whic airports can aircraft take off from and land at? 
const getAircraftAirport = (request, response) => {
  pool.query("SELECT * FROM airport_aircraft", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

// const deleteStudent = (request, response) => {
//   const id = parseInt(request.params.id); // when using deletes make sure to use WHERE clauses

//   pool.query("DELETE FROM student WHERE id = $1", [id], (error, results) => {
//     if (error) {
//       throw error;
//     }
//     response.status(200).send(`Student deleted with ID: ${id}`);
//   });
// };

// const updateStudent = (request, response) => {
//   const id = parseInt(request.params.id);
//   const { first_name, last_name, student_id, address_id } = request.body;

//   pool.query(
//     "UPDATE student SET first_name = $1, last_name = $2, student_id = $3, address_id = $4 WHERE id = $5",
//     [first_name, last_name, student_id, address_id, id],
//     (error, results) => {
//       if (error) {
//         throw error;
//       }
//       response.status(200).send(`Student modified with ID: ${id}`);
//     }
//   );
// };

// module.exports = {
//   getStudents,
//   createStudent,
//   updateStudent,
// };

module.exports = {
  getAirportCities,
  getAircraftPassenger,
  getAircraftAirport
};
