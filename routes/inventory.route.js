import express from "express";
import {
  getAllInventory,
  getOneInventory,
} from "../controller/inventory.controller.js";

const router = express.Router();

router.get("/", getAllInventory);
router.get("/:id", getOneInventory);

export default router;
