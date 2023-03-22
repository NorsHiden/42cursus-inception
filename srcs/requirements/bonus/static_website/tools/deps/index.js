const express = require("express");

const app = express();

app.use('/static_website', express.static("/var/www/html"));

app.listen(3000, () => {
	console.log("Server started on port 3000");
});