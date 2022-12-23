import { Router } from "express";
import { shorten } from "../controllers/urls.controller.js";
import { authValidation } from "../middlewares/authValidation.js";

const router = Router();
router.post('/urls/shorten', authValidation, shorten);


export default router;