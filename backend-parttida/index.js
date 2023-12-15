import express from "express";
import routes from "./src/router.js"
const port = process.env.API_DOCKER_PORT || 8082;

const app = express();
app.use(express.json())
app.use(routes)

app.listen(port, () => {
  console.log("TA RODANDO", port);
});