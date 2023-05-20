import express from "express";
import { getAllClient, getOneClient } from "../controller/client.controller.js";

const router = express.Router();

router.get("/", getAllClient);
router.get("/:id", getOneClient);

export default router;
