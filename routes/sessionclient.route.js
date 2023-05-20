import express from "express";
import {
  getAllSessionClient,
  getOneSessionClient,
} from "../controller/sessionclient.controller.js";

const router = express.Router();

router.get("/", getAllSessionClient);
router.get("/:id", getOneSessionClient);

export default router;
