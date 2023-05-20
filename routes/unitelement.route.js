import express from "express";
import {
  getAllUnitElement,
  getOneUnitElement,
} from "../controller/unitelement.controller.js";

const router = express.Router();

router.get("/", getAllUnitElement);
router.get("/:id", getOneUnitElement);

export default router;
