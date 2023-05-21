import express from "express";
import {
  createSessionClient,
  deleteSessionClient,
  getAllSessionClient,
  getOneSessionClient,
  updateSessionClient,
} from "../controller/sessionclient.controller.js";

const router = express.Router();

router.get("/", getAllSessionClient);
router.get("/:id", getOneSessionClient);

router.post("/", createSessionClient);

router.put("/:id", updateSessionClient);

router.delete("/:id", deleteSessionClient);

export default router;
