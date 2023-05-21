import express from "express";
import {
  getAllMaintenanceOrder,
  getOneMaintenanceOrder,
} from "../controller/maintenanceorder.controller.js";

const router = express.Router();

router.get("/", getAllMaintenanceOrder);
router.get("/:id", getOneMaintenanceOrder);

export default router;
