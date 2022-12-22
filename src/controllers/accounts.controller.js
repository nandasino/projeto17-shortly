import bcrypt from "bcrypt";
import { db } from "../database/db.js"
import jwt from "jsonwebtoken";

export async function signUp(req,res){
    const {name,email,password} = res.locals.signUp;

    const hiddenPassword = bcrypt.hashSync(password, 12);

    try{
        await db.query(
        `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
        [name, email, hiddenPassword]); 
        res.sendStatus(201);
    }catch(error){
        res.sendStatus(500);
    }
}

