import express from "express";
import {
  createMaintenanceRequest,
  getAllMaintenanceRequest,
  getMaintenanceRequestByMonth,
  getOneMaintenanceRequest,
  patchStateMaintenanceRequest,
} from "../controller/maintenancerequest.controller.js";
import { multerUpload } from "../src/multer.js";

const router = express.Router();

router.get("/", getAllMaintenanceRequest);
router.get("/:id", getOneMaintenanceRequest);
router.get("/data/:month/:year", getMaintenanceRequestByMonth);

router.post("/", multerUpload.single("file"), createMaintenanceRequest);

router.patch("/:id", patchStateMaintenanceRequest);

export default router;
