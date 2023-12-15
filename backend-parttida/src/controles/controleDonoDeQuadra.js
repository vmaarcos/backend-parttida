import { prisma } from "../prismaclient/client.js"

export const controleDonoDeQuadra = {
    async criar_dono_de_quadra (req, res){
        const {userId} = req.body
         const DonoDeQuadra = await prisma.donoDeQuadra.create({
             data: {
                 userId
             }
         })
        res.status(201).json({msg: DonoDeQuadra})
    }
}