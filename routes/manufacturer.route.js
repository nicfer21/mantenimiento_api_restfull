import express from "express";
import {
  getAllManufacturer,
  getOneManufacturer,
} from "../controller/manufacturer.controller.js";

const router = express.Router();

router.get("/", getAllManufacturer);
router.get("/:id", getOneManufacturer);

export default router;
