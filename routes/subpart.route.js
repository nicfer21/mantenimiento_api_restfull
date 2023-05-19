import express from "express";
import {
  getAllSubPart,
  getByParent,
  getOneSubPart,
} from "../controller/subpart.controller.js";

const router = express.Router();

router.get("/", getAllSubPart);
router.get("/:id", getOneSubPart);
router.get("/parent/:id", getByParent);

export default router;
