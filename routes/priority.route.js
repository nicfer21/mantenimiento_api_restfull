import express from "express";
import {
  getAllPriority,
  getOnePriority,
} from "../controller/priority.controller.js";

const router = express.Router();

router.get("/", getAllPriority);
router.get("/:id", getOnePriority);

export default router;
