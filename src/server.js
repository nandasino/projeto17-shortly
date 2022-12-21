import express from 'express';
import { json } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
dotenv.config()

const app = express();
app.use(json());
app.use(cors());

const port = process.env.PORT

app.listen(5000, ()=>console.log(`Server running in port: ${port}`));