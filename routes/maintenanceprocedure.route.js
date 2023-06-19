import express from "express";
import {
  getAllMaintenanceProcedure,
  getMaintenanceProcedureByMachine,
  getOneMaintenanceProcedure,
} from "../controller/maintenanceprocedure.controller.js";

const router = express.Router();

router.get("/", getAllMaintenanceProcedure);
router.get("/a/:id", getMaintenanceProcedureByMachine);
router.get("/b/:id", getOneMaintenanceProcedure);

export default router;
