import { postUrlSchema } from "../models/postUrl.model.js";

export function postUrlValidation(req, res, next){
    const { url } = req.body;

    const {error} = postUrlSchema.validate({url}, {abortEarly: false});
    if(error){
        const errors = error.details.map((detail)=> detail.message)
        return res.status(422).send(errors);
    };
    next();
}