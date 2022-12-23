import { Router } from "express";
import { getUsersMe } from "../controllers/userRanking.controller.js";
import { authValidation } from "../middlewares/authValidation.js";

const router = Router();
router.get('/users/me', authValidation, getUsersMe);


export default router;