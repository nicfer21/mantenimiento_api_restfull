import express from "express";
import {
  getAllMaintenanceProcedure,
  getOneMaintenanceProcedure,
} from "../controller/maintenanceprocedure.controller.js";

const router = express.Router();

router.get("/", getAllMaintenanceProcedure);
router.get("/:id", getOneMaintenanceProcedure);

export default router;
