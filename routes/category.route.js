import express from "express";
import {
  getAllCategory,
  getOneCategory,
} from "../controller/category.controller.js";

const router = express.Router();

router.get("/", getAllCategory);
router.get("/:id", getOneCategory);

export default router;
