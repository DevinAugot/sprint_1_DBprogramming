const Pool = require("pg").Pool;
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "week_6_db",
  password: "Keyin2021",
  port: 5432,
});

const getStudents = (request, response) => {
  pool.query("SELECT * FROM student ORDER BY id ASC", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

const createStudent = (request, response) => {
  const { id, first_name, last_name, student_id, address_id } = request.body;

  pool.query(
    "INSERT INTO student (id, first_name, last_name, student_id, address_id) VALUES ($1, $2, $3, $4, $5)",
    [id, first_name, last_name, student_id, address_id],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(201).send(`Student added with ID: ${results.id}`);
    }
  );
};
const deleteStudent = (request, response) => {
  const id = parseInt(request.params.id); // when using deletes make sure to use WHERE clauses

  pool.query("DELETE FROM student WHERE id = $1", [id], (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).send(`Student deleted with ID: ${id}`);
  });
};

const updateStudent = (request, response) => {
  const id = parseInt(request.params.id);
  const { first_name, last_name, student_id, address_id } = request.body;

  pool.query(
    "UPDATE student SET first_name = $1, last_name = $2, student_id = $3, address_id = $4 WHERE id = $5",
    [first_name, last_name, student_id, address_id, id],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`Student modified with ID: ${id}`);
    }
  );
};

module.exports = {
  getStudents,
  createStudent,
  updateStudent,
};

module.exports = {
  getStudents,
  createStudent,
  updateStudent,
  deleteStudent,
};
