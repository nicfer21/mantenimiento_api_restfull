import express from "express";
import morgan from "morgan";
import cors from "cors";

import db from "./database/mantenimiento.db.js";
import { PORT } from "./src/config.js";

import MachineRoutes from "./routes/machine.route.js";
import PartRoutes from "./routes/part.route.js";
import SubPartRoutes from "./routes/subpart.route.js";
import QuialityRoutes from "./routes/quality.route.js";

const app = express();
const port = PORT;
app.use(cors());
app.use(morgan("dev"));
app.use(express.json());

//Ruta de inicio
app.get("/", (req, res) => {
  res.json({
    message: `Coneccion exitosa al API-Restfull logistica`,
  });
});

app.use("/machine/", MachineRoutes);
app.use("/part/", PartRoutes);
app.use("/subpart/", SubPartRoutes);
app.use("/quality/", QuialityRoutes);

//Ruta de error 404
app.use((req, res) => {
  //Si no encuentra la ruta manda error 404
  res.status(404).json({
    error: "404",
    message: "Ruta inexistente",
  });
});

app.listen(port, async () => {
  console.log(`Ready -> ${await comprobacion()}`);
});

const comprobacion = async () => {
  try {
    await db.authenticate();
    return "Clear";
  } catch (error) {
    return "Error";
  }
};
