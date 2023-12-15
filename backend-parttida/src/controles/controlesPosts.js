import { Router } from 'express';
import { prisma } from '../prismaclient/client.js';

const router = Router();

router.post('/', async (req, res) => {
    const {
        usuario_id
    } = req.body
    const posts = await prisma.post.findMany({
        where: {
            usuario_id
        }
    })
    res.json(posts)
})

router.post('/criar', async (req, res) => {
    try {
        const {
            descricao,
            foto_post,
            usuario_id,
        } = req.body;

        const criar_post = await prisma.post.create({
            data: {
                usuario_id,
                foto_post,
                descricao
            }
        })

        if (criar_post) {
            return res.json({
                msg: "o post ja foi criado"
            })
        }

        return res.status(200).json({
            response: "Created OK",
            ...criar_post
        });

    } catch (error) {
        console.log(error)
        return res.json({
            error: "Erro No Servidor"
        })
    }
})

export default router