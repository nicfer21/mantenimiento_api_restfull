import express from "express";
import {
  createMaintenanceRequest,
  getAllMaintenanceRequest,
  getOneMaintenanceRequest,
} from "../controller/maintenancerequest.controller.js";
import { multerUpload } from "../src/multer.js";

const router = express.Router();

router.get("/", getAllMaintenanceRequest);
router.get("/:id", getOneMaintenanceRequest);

router.post("/", multerUpload.single("file"), createMaintenanceRequest);

export default router;
