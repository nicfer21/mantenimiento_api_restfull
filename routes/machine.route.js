import express from "express";
import {
  getAllMachine,
  getOneMachine,
} from "../controller/machine.controller.js";

const router = express.Router();

router.get("/", getAllMachine);
router.get("/:id", getOneMachine);

export default router;
