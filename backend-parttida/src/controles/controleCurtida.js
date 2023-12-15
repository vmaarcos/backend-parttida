import { Router } from 'express';
const router = new Router();

router.post('/curtir', (req, res) => {
    res.send('Curtiu');
})


export default router;