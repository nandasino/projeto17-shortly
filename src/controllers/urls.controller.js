import { db } from "../database/db.js";
import { nanoid } from "nanoid";

export async function postUrl(req,res){
    const { url } = req.body;
    const userId = res.locals.idUser;
    try {
        const shortUrl = nanoid();
        await db.query(`
        INSERT INTO links ("shortUrl", url,"userId") VALUES ($1, $2, $3);`,
        [ shortUrl, url, userId]);
        res.status(201).send({ shortUrl: shortUrl });
      } catch (error) {
        res.status(422).send(error);
      }
}

export async function getUrl(req, res){
    const { id } = req.params;
    try{
        const urlExist = await db.query('SELECT * FROM links WHERE id = $1;', [id]); 
        if(urlExist.rowCount==0){
            return res.sendStatus(404);
        }
        const selectUrl= urlExist.rows[0];
        res.status(200).send({
            id: selectUrl.id,
            shortUrl: selectUrl.shortUrl,
            url: selectUrl.url,
        });
    }catch(error){
        res.sendStatus(500);
    }
}