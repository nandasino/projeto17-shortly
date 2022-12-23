import joi from  "joi";

export const postUrlSchema = joi.object({
    url: joi.string().min(1).required(),
});