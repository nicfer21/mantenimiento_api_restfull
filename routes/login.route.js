import express from "express";
import { initLogging } from "../controller/login.controller.js";

const router = express.Router();

router.post("/", initLogging);

export default router;
