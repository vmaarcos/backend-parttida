import { hash } from 'bcrypt'
import { Router } from 'express';
import { prisma } from '../prismaclient/client.js';

const router = Router();

router.post('/signup', async (req, res) => {
    try {
        const {
            nome_completo,
            apelido,
            email,
            data_de_nascimento,
            senha,
            que_esporte_pratica,
            cpf
        } = req.body

        let user = await prisma.usuario.findUnique({
            where: {
                email
            }
        })

        if (user) {
            return res.json({
                error: "Esse usuario já existe com esse email "
            })
        }

        user = await prisma.usuario.create({
            data: {
                cpf,
                data_de_nascimento,
                email,
                nome_completo,
                apelido,
                que_esporte_pratica,
                senha
            },
            select: {
                data_de_nascimento: true,
                email: true,
                nome_completo: true,
                que_esporte_pratica: true,
                apelido: true
            }
        })

        return res.status(200).json({
            response: "Created OK",
            ...user
        });
    } catch (error) {
        console.log(error)
        return res.json({
            error: "Error No Servidor"
        });
    }
});


router.post('/login', async (req, res) => {
    try {
        const {
            email,
            senha
        } = req.body;

        const user = await prisma.usuario.findUnique({
            where: {
                email
            }
        });

        if (!user) {
            return res.status(401).json({
                error: "E-mail não encontrado"
            });
        }

        if (senha !== user.senha) {
            return res.status(401).json({
                error: "Senha incorreta"
            });
        }

        const passwordHash = await hash(user.senha, 5);

        return res.status(201).json({
            message: "Login bem-sucedido",
            user: {
                data_de_nascimento: user.data_de_nascimento,
                email: user.email,
                senha: passwordHash,
                endereco: user.endereco,
                nome_completo: user.nome_completo,
                quanto_tempo_pratica_esporte: user.quanto_tempo_pratica_esporte,
                que_esporte_pratica: user.que_esporte_pratica,
            }
        });
    } catch (error) {
        console.log(error);
        return res.json({
            error: "Error no Servidor"
        });
    }
})

export default router;