import express, { Router } from 'express';
import {controleDonoDeQuadra} from './controles/controleDonoDeQuadra.js';
import criarQuadra from './middlewares/uploadimagem.js';
import controlePost from './controles/controlesPosts.js';
import controleUser from './controles/controlesUsuario.js';


const router = Router();

router.use(express.urlencoded({ extended: true }))
router.use(express.json())

router.use('/post', controlePost)
router.use('/user', controleUser)

router.post("/criar/dono-quadra", controleDonoDeQuadra.criar_dono_de_quadra);
router.post("/upload/quadra", criarQuadra);

export default router;