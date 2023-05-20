import express from "express";
import {
  getAllTypeElement,
  getOneTypeElement,
} from "../controller/typeelement.controller.js";

const router = express.Router();

router.get("/", getAllTypeElement);
router.get("/:id", getOneTypeElement);

export default router;
