import express from "express";
import {
  getAllMaintenanceReport,
  getOneMaintenanceReport,
} from "../controller/maintenancereport.controller.js";

const router = express.Router();

router.get("/", getAllMaintenanceReport);
router.get("/:id", getOneMaintenanceReport);

export default router;
