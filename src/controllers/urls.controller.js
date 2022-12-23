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

export async function getOPenUrl(req, res){
    const { shortUrl } = req.params;
    try{
        const shortenExist = await db.query('SELECT * FROM links WHERE "shortUrl" = $1;', [shortUrl]);
        if(shortenExist.rowCount==0){
            return res.sendStatus(404);
        }
        const urlId = shortenExist.rows[0].id;
        const url = shortenExist.rows[0].url;

        await db.query('INSERT INTO visits ("urlId") VALUES ($1);', [urlId]);
        
        res.redirect(url);

    }catch(error){
        res.sendStatus(500);
    }
}