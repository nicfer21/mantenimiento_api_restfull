import express from "express";
import {
  getAllProfesion,
  getOneProfesion,
} from "../controller/profesion.controller.js";

const router = express.Router();

router.get("/", getAllProfesion);
router.get("/:id", getOneProfesion);

export default router;
