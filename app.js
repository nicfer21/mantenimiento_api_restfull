import express from "express";
import morgan from "morgan";
import cors from "cors";

import db from "./database/mantenimiento.db.js";
import { PORT } from "./src/config.js";

import MachineRoutes from "./routes/machine.route.js";
import PartRoutes from "./routes/part.route.js";
import SubPartRoutes from "./routes/subpart.route.js";
import QuialityRoutes from "./routes/quality.route.js";
import WorkTypeRoutes from "./routes/worktype.route.js";
import PlaceRoutes from "./routes/place.route.js";
import ProfesionRoutes from "./routes/profesion.route.js";
import StrategyRoutes from "./routes/strategy.route.js";
import CategoryRoutes from "./routes/category.route.js";
import ManufacturerRoutes from "./routes/manufacturer.route.js";
import PriorityRoutes from "./routes/priority.route.js";
import SupplierRoutes from "./routes/supplier.route.js";
import TypeElementRoutes from "./routes/typeelement.route.js";
import UnitElementRoutes from "./routes/unitelement.route.js";

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
app.use("/worktype/", WorkTypeRoutes);
app.use("/place/", PlaceRoutes);
app.use("/profesion/", ProfesionRoutes);
app.use("/strategy/", StrategyRoutes);
app.use("/category/", CategoryRoutes);
app.use("/manufacturer/", ManufacturerRoutes);
app.use("/priority/", PriorityRoutes);
app.use("/supplier/", SupplierRoutes);
app.use("/typeelement/", TypeElementRoutes);
app.use("/unitelement/", UnitElementRoutes);

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
