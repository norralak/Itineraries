const express = require("express") //importing express
const app = express() //running express library
const cors = require("cors")

//middleware always use express.use
app.use(cors());
app.use(express.json());

//listens to port number to start server
app.listen(5000, () => {
    console.log("SERVER STARTED ON PORT 5000")
})