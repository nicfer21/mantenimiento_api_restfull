import express from "express";
import {
  getAllStrategy,
  getOneStrategy,
} from "../controller/strategy.controller.js";

const router = express.Router();

router.get("/", getAllStrategy);
router.get("/:id", getOneStrategy);

export default router;
