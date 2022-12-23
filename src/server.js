import express from 'express';
import { json } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import accountsRoute from "./routers/accounts.router.js"
import urlsRoute from "./routers/urls.router.js"


dotenv.config()

const app = express();
app.use(json());
app.use(cors());
app.use(accountsRoute);
app.use(urlsRoute);

const port = process.env.PORT

app.listen(5000, ()=>console.log(`Server running in port: ${port}`));