import express , { Router } from 'express';
import { promisify } from 'util';
import fs from 'fs';
import path from 'path';

const router = Router();

const writeFile = promisify(fs.writeFile);
const readFile = promisify(fs.readFile);


// Função para ler os arquivos de uma pasta
function lerArquivosPasta(pasta) {
    return new Promise((resolve, reject) => {
      fs.readdir(pasta, (err, arquivos) => {
        if (err) {
          reject(err);
        } else {
          resolve(arquivos);
        }
      });
    });
  }
  
  // Função para selecionar um arquivo aleatório
  async function selecionarArquivoAleatorio() {
    const pasta = './imagens/'
    try {
      const arquivos = await lerArquivosPasta(pasta);
      if (arquivos.length === 0) {
        console.log('A pasta está vazia.');
        return;
      }
  
      const arquivoAleatorio = arquivos[Math.floor(Math.random() * arquivos.length)];
      const caminhoArquivoAleatorio = path.join(pasta, arquivoAleatorio);
      console.log('Arquivo aleatório selecionado:', caminhoArquivoAleatorio);

      return caminhoArquivoAleatorio
      // Faça o que precisar com o arquivo selecionado...
    } catch (erro) {
      console.error('Ocorreu um erro:', erro);
    }
  }
  

router.use(express.json());

router.get('/imagens', async (req, res) => {
    const path = await selecionarArquivoAleatorio()
    const img = await readFile('./' + path);
    res.writeHead(200, { 'Content-Type': 'image/jpg' });
    res.end(img);
});

export default router;