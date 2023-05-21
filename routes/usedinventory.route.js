import express from "express";
import {
  getAllUsedInventory,
  getOneUsedInventory,
} from "../controller/usedinventory.controller.js";

const router = express.Router();

router.get("/", getAllUsedInventory);
router.get("/:id", getOneUsedInventory);

export default router;
