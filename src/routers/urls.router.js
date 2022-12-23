import { Router } from "express";
import { deleteUrl, getOPenUrl, getUrl, postUrl } from "../controllers/urls.controller.js";
import { authValidation } from "../middlewares/authValidation.js";

const router = Router();
router.post('/urls/shorten', authValidation, postUrl);
router.get('/urls/:id', getUrl);
router.get('/urls/open/:shortUrl', getOPenUrl);
router.delete('/urls/:id', authValidation, deleteUrl);


export default router;