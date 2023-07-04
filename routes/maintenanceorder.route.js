import express from "express";
import {
  createMaintenanceOrder,
  getAllMaintenanceOrder,
  getCalendarMaintenanceOrder,
  getOneMaintenanceOrder,
} from "../controller/maintenanceorder.controller.js";

const router = express.Router();

router.get("/", getAllMaintenanceOrder);
router.get("/:id", getOneMaintenanceOrder);

router.get("/calendar/:id", getCalendarMaintenanceOrder);

router.post("/", createMaintenanceOrder);

export default router;
