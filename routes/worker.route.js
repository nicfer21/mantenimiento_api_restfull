import express from "express";
import { getAllWorker, getOneWorker } from "../controller/worker.controller.js";

const router = express.Router();

router.get("/", getAllWorker);
router.get("/:id", getOneWorker);

export default router;
