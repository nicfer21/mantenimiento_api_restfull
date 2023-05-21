import express from "express";
import { getAllPurchase, getOnePurchase } from "../controller/purchase.controller.js";

const router = express.Router();

router.get("/", getAllPurchase);
router.get("/:id", getOnePurchase);

export default router;
