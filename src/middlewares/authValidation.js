import {db} from "../database/db.js";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";
dotenv.config();

export async function authValidation(req, res, next){
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");
    if(!token){
        return res.sendStatus(401);
    }
    const secretKey = process.env.JWT_SECRET;

    try {
	    const data = jwt.verify(token, secretKey);
        const sessionisTrue = await connection.query(`SELECT * FROM sesions WHERE token = $1 AND valid = true;`, [token]);
        
        if(sessionisTrue.rowCount == 0){
            return res.sendStatus(401);
        }
        const user = (await db.query(`SELECT * FROM users WHERE id = $1;`, [data.userId])).rows[0];
        res.locals.idUser = data.userId;
        res.locals.user = user;
        next();

    } catch {
        //await db.query(`UPDATE sesions SET "valid" = $1 WHERE "token" = $2;`, [false,token]);
        return res.sendStatus(401);
    }

}