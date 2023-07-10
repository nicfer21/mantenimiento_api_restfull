import express from "express";
import {
  createMaintenanceOrder,
  getAllMaintenanceOrder,
  getCalendarMaintenanceOrder,
  getMaintenanceOrderForGraf,
  getMaintenanceOrderForInicio,
  getOneMaintenanceOrder,
} from "../controller/maintenanceorder.controller.js";

const router = express.Router();

router.get("/", getAllMaintenanceOrder);
router.get("/:id", getOneMaintenanceOrder);

router.get("/calendar/:id", getCalendarMaintenanceOrder);

router.get("/inicio/:date/:idWorker", getMaintenanceOrderForInicio);

router.get("/graf/:month/:year", getMaintenanceOrderForGraf);

router.post("/", createMaintenanceOrder);

export default router;
