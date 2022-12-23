import { Router } from "express";
import { getOPenUrl, getUrl, postUrl } from "../controllers/urls.controller.js";
import { authValidation } from "../middlewares/authValidation.js";

const router = Router();
router.post('/urls/shorten', authValidation, postUrl);
router.get('/urls/:id', getUrl);
router.get('/urls/open/:shortUrl', getOPenUrl);


export default router;