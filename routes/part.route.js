import express from "express";
import {
  getAllPart,
  getByParent,
  getOnePart,
} from "../controller/part.controller.js";

const router = express.Router();

router.get("/", getAllPart);
router.get("/:id", getOnePart);
router.get("/parent/:id", getByParent);

export default router;
