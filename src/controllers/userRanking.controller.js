import { db } from "../database/db.js";

export async function getUsersMe(req,res){
    const userId = res.locals.idUser;
    const user = res.locals.user
    try{
        const userLInks = await db.query(`
            SELECT links.id, links."shortUrl", links."url", 
            COUNT(visits.id) AS "visitCount" FROM links
            LEFT JOIN visits ON links.id = visits."urlId"
            WHERE links."userId" = $1
            GROUP BY links.id;`,
            [userId]);

        const totalVisits = await db.query(`
            SELECT COUNT(visits.id) AS "visitCount" 
            FROM visits
            JOIN links ON visits."urlId" = links.id
            JOIN users ON links."userId" = users.id
            WHERE users.id = $1;`,
            [userId]);

        res.status(200).send({
            id: userId,
            name: user.name,
            visitCount: totalVisits.rows[0].visitCount,
            shortenedUrls: userLInks.rows,
        });

    }catch(error){
        res.sendStatus(500);
    }
}

export async function getRanking(req,res){
    try{
        const list = await db.query(`
            SELECT users.id, users.name, COUNT(links.id) AS "linksCount",
            COUNT(visits.id) AS "visitCount"
            FROM users
            LEFT JOIN links ON users.id = links."userId"
            LEFT JOIN visits ON links.id = visits."urlId"
            GROUP BY users.id, users.name
            ORDER BY 
            "visitCount" DESC, 
            "linksCount" DESC  LIMIT 10;`
        );
        res.status(200).send(list.rows);
    }catch(error){
        res.sendStatus(500);
    }
}