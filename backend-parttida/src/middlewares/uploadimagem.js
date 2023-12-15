import express, { Router } from 'express';
import multer from 'multer';
import path from 'path';
import { prisma } from '../prismaclient/client.js';


const router = Router();
router.use(express.json());
router.use(express.urlencoded({ extended: true }));

const storage = multer.diskStorage({
    destination: function (_, __, cb) {
        cb(null, 'uploads/');
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage, limits: { fileSize: 1024 * 1024 * 5 } }).array('imagens', 5);

router.post('/upload', (req, res) => {
    const { 
        localizacao,
        tipo_de_quadra,
        tempo_de_atuacao,
        donoId 
     } = req.body 
    try {
        upload(req, res, async (err) => {
            if (err) {
                console.log(err);
                return res.status(400).json({ error: "Não foi possivel fazer upload da imagem" })
            }
            const imageUrls = req.files.map(file => file.path); // Lista dos caminhos das imagens no servidor após o upload
            const quadra = await prisma.quadra.create({
                data: {
                    localizacao,
                    tipo_de_quadra,
                    tempo_de_atuacao,
                    donoId,
                    FotoQuadra: {
                        create: imageUrls.map(imageUrl => ({
                            url: imageUrl
                        }))
                    }
                },
                include: {
                    FotoQuadra: true
                }
            })
            res.status(201).json(quadra);
        })

    } catch (error) {
        return res.status(500).json(error.message);
    }
});

export default router;