import express from "express";
import morgan from "morgan";
import cors from "cors";
import { dirname, extname, join } from "path";
import { fileURLToPath } from "url";
import jwt from "jsonwebtoken";
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
import WorkerRoutes from "./routes/worker.route.js";
import ClientRoutes from "./routes/client.route.js";
import SessionClientRoutes from "./routes/sessionclient.route.js";
import MaintenanceRequestRoutes from "./routes/maintenancerequest.route.js";
import InventoryRoutes from "./routes/inventory.route.js";
import MaintenanceOrderRoutes from "./routes/maintenanceorder.route.js";
import MaintenanceProcedureRoutes from "./routes/maintenanceprocedure.route.js";
import MaintenanceReportRoutes from "./routes/maintenancereport.route.js";
import PurchaseRoutes from "./routes/purchase.route.js";
import RequirementsRoutes from "./routes/requirements.route.js";
import UsedInventoryRoutes from "./routes/usedinventory.route.js";

const app = express();
const port = PORT;
const CURRENT_DIR = dirname(fileURLToPath(import.meta.url));
app.use(cors());
app.use(morgan("dev"));
app.use(express.json());

//Ruta de inicio
app.get("/", (req, res) => {
  res.json({
    message: `Coneccion exitosa al API-Restfull mantenimiento`,
  });
});

//Login
app.post("/login", async (req, res) => {
  try {
    const { username, password } = req.body;
    const rs = await db.query(
      `SELECT * from view_searchworkerclient as v where v.dni = "${username}" and v.pass = "${password}" ;`,
    );
    const { id, dni, largename, name, image, pass, levelWork } = rs[0][0];
    const token = getToken(id, dni, largename, name, image, pass, levelWork);
    res.json({ token });
  } catch (error) {
    console.log(error);
  }
});

//Middleware de autenticacion
app.use((req, res, next) => {
  const authHeader = req.headers.token;
  if (authHeader) {
    const token = authHeader.split(" ")[0];
    jwt.verify(token, "mantenimiento", (err, decoded) => {
      if (err) {
        return res.status(403).json({ message: "Token inválido", type: 1 });
      }
      next();
    });
  } else {
    res.status(401).json({ message: "Se requiere iniciar sesion", type: 2 });
  }
});

app.use("/prueba", (req, res) => {
  res.json({
    message: "OK",
    type: 0,
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
app.use("/worker/", WorkerRoutes);
app.use("/client/", ClientRoutes);
app.use("/sessionclient/", SessionClientRoutes);
app.use("/maintenancerequest/", MaintenanceRequestRoutes);
app.use("/inventory/", InventoryRoutes);
app.use("/maintenanceorder/", MaintenanceOrderRoutes);
app.use("/maintenanceprocedure/", MaintenanceProcedureRoutes);
app.use("/maintenancereport/", MaintenanceReportRoutes);
app.use("/purchase/", PurchaseRoutes);
app.use("/requirements/", RequirementsRoutes);
app.use("/usedinventory/", UsedInventoryRoutes);

// para acceder a las imagenes
app.use("/public/", express.static(join(CURRENT_DIR, "./uploads")));

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

// genera el token
const getToken = (id, dni, largename, name, image, pass, levelWork) => {
  const payload = { id, dni, largename, name, image, pass, levelWork };
  const secret = "mantenimiento";
  const options = { expiresIn: "24h" }; // '30m' '1h' '24h'
  return jwt.sign(payload, secret, options);
};
