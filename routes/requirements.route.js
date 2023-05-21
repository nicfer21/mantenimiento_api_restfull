import express from "express";
import {
  getAllRequirements,
  getOneRequirements,
} from "../controller/requirements.controller.js";

const router = express.Router();

router.get("/", getAllRequirements);
router.get("/:id", getOneRequirements);

export default router;
