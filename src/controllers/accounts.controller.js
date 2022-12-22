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

export async function signIn(req, res){
    const { userId } = res.locals.signIn;

    const token = jwt.sign({userId}, process.env.TOKEN_SECRET);

    try{
        const session = await connection.query('INSERT INTO sessions (token, "userId") VALUES ($1, $2);', [token, userId]);
        return res.status(200).send({ token });
    }catch(error){
        res.sendStatus(422);
    }
}