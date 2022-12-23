import { Router } from "express";
import { getRanking, getUsersMe } from "../controllers/userRanking.controller.js";
import { authValidation } from "../middlewares/authValidation.js";

const router = Router();
router.get('/users/me', authValidation, getUsersMe);
router.get('/ranking', getRanking);

export default router;