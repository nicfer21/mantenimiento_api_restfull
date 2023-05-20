import express from "express";
import { getAllPlace, getOnePlace } from "../controller/place.controller.js";

const router = express.Router();

router.get("/", getAllPlace);
router.get("/:id", getOnePlace);

export default router;
