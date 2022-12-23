import { db } from "../database/db.js";
import { nanoid } from "nanoid";

export async function shorten(req,res){
    const { url } = req.body;
    const userId = res.locals.idUser;
    try {
        const shortUrl = nanoid();
        await db.query(`
        INSERT INTO links ("shortUrl", url,"userId") VALUES ($1, $2, $3);`,
        [ shortUrl, url, userId]);
        res.status(201).send({ shortUrl: shortUrl });
      } catch (error) {
        res.status(422).send(error.detail);
      }
}