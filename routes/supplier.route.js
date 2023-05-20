import express from "express";
import {
  getAllSupplier,
  getOneSupplier,
} from "../controller/supplier.controller.js";

const router = express.Router();

router.get("/", getAllSupplier);
router.get("/:id", getOneSupplier);

export default router;
