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