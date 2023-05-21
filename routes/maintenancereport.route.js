import express from "express";
import {
  createMaintenanceReport,
  getAllMaintenanceReport,
  getOneMaintenanceReport,
} from "../controller/maintenancereport.controller.js";
import { multerUpload } from "../src/multer.js";

const router = express.Router();

router.get("/", getAllMaintenanceReport);
router.get("/:id", getOneMaintenanceReport);

router.post("/", multerUpload.single("file"), createMaintenanceReport);

export default router;
