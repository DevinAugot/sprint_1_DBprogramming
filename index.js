const express = require("express");
const bodyParser = require("body-parser");
const restAPP = express();
const pgDBAccessLayer = require("./pg_data_access/pg_db_access");
const port = 3000;


restAPP.use(bodyParser.json());

restAPP.use(
  
  bodyParser.urlencoded({
    extended: true,
  })
);

restAPP.get("/", (request, response) => {
  response.sendFile(__dirname + "/index.html")
 
  // response.json({ info: "Node.js, Express, and Postgres API" });
});

// working
restAPP.get("/airport_city", pgDBAccessLayer.getAirportCities);

// working
restAPP.get("/aircraft", pgDBAccessLayer.getAircraftPassenger);

restAPP.get("/airport_aircraft", pgDBAccessLayer.getAircraftAirport);

restAPP.get("/passengers", pgDBAccessLayer.getAirportPassenger);

// start the Express server
restAPP.listen(port, () => {
  console.log(`App running on port ${port}.`);
});
