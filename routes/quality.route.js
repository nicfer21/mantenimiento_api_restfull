import express from "express";
import {
  getAllQuality,
  getOneQuality,
} from "../controller/quality.controller.js";

const router = express.Router();

router.get("/", getAllQuality);
router.get("/:id", getOneQuality);

export default router;
