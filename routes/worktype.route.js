import express from "express";
import {
  getAllWorkType,
  getOneWorkType,
} from "../controller/worktype.controller.js";

const router = express.Router();

router.get("/", getAllWorkType);
router.get("/:id", getOneWorkType);

export default router;
