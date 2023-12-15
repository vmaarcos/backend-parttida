/*
  Warnings:

  - You are about to drop the column `tipo_do_pagamento` on the `Aulas` table. All the data in the column will be lost.
  - You are about to drop the column `valor_do_pagamento` on the `Aulas` table. All the data in the column will be lost.
  - You are about to drop the column `endereco` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `quanto_tempo_pratica_esporte` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `telefone` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the `Aula_vs_professor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Contrato` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Historico` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Professor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Quadra` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redes_sociais` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Tipo_de_contrato` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Tipos_de_pagamento` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[cnpj]` on the table `Usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `apelido` to the `Usuario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Aula_vs_professor` DROP FOREIGN KEY `Aula_vs_professor_professor_id_fkey`;

-- DropForeignKey
ALTER TABLE `Aula_vs_professor` DROP FOREIGN KEY `Aula_vs_professor_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Aulas` DROP FOREIGN KEY `Aulas_professor_id_fkey`;

-- DropForeignKey
ALTER TABLE `Contrato` DROP FOREIGN KEY `Contrato_professor_id_fkey`;

-- DropForeignKey
ALTER TABLE `Contrato` DROP FOREIGN KEY `Contrato_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Historico` DROP FOREIGN KEY `Historico_professor_id_fkey`;

-- DropForeignKey
ALTER TABLE `Historico` DROP FOREIGN KEY `Historico_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Professor` DROP FOREIGN KEY `Professor_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Quadra` DROP FOREIGN KEY `Quadra_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Redes_sociais` DROP FOREIGN KEY `Redes_sociais_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Tipo_de_contrato` DROP FOREIGN KEY `Tipo_de_contrato_professor_id_fkey`;

-- DropForeignKey
ALTER TABLE `Tipo_de_contrato` DROP FOREIGN KEY `Tipo_de_contrato_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Tipos_de_pagamento` DROP FOREIGN KEY `Tipos_de_pagamento_professor_id_fkey`;

-- DropForeignKey
ALTER TABLE `Tipos_de_pagamento` DROP FOREIGN KEY `Tipos_de_pagamento_usuario_id_fkey`;

-- AlterTable
ALTER TABLE `Aulas` DROP COLUMN `tipo_do_pagamento`,
    DROP COLUMN `valor_do_pagamento`;

-- AlterTable
ALTER TABLE `Usuario` DROP COLUMN `endereco`,
    DROP COLUMN `quanto_tempo_pratica_esporte`,
    DROP COLUMN `telefone`,
    ADD COLUMN `altura` VARCHAR(191) NULL,
    ADD COLUMN `apelido` VARCHAR(191) NOT NULL,
    ADD COLUMN `cnpj` VARCHAR(191) NULL,
    ADD COLUMN `qual_seu_esporte_favortio` VARCHAR(191) NULL,
    MODIFY `data_de_nascimento` VARCHAR(191) NOT NULL,
    MODIFY `cpf` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `Aula_vs_professor`;

-- DropTable
DROP TABLE `Contrato`;

-- DropTable
DROP TABLE `Historico`;

-- DropTable
DROP TABLE `Professor`;

-- DropTable
DROP TABLE `Quadra`;

-- DropTable
DROP TABLE `Redes_sociais`;

-- DropTable
DROP TABLE `Tipo_de_contrato`;

-- DropTable
DROP TABLE `Tipos_de_pagamento`;

-- CreateTable
CREATE TABLE `Profissional` (
    `profissional_id` BIGINT NOT NULL AUTO_INCREMENT,
    `formacao` VARCHAR(191) NOT NULL,
    `celular` VARCHAR(191) NULL,
    `curriculo` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`profissional_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Dono_de_quadra` (
    `dono_de_quadra_id` BIGINT NOT NULL AUTO_INCREMENT,
    `localizacao` VARCHAR(191) NOT NULL,
    `tipos_de_quadras` VARCHAR(191) NOT NULL,
    `tempo_de_atuacao` VARCHAR(191) NOT NULL,
    `upload_fotos` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`dono_de_quadra_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Perfil_Usuario` (
    `perfil_usuario_id` BIGINT NOT NULL AUTO_INCREMENT,
    `foto_perfil` VARCHAR(191) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`perfil_usuario_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Perfil_Profissional` (
    `perfil_profissional_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`perfil_profissional_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Perfil_Quadras` (
    `perfil_quadra_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`perfil_quadra_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comentarios` (
    `comentario_id` BIGINT NOT NULL AUTO_INCREMENT,
    `comentario` VARCHAR(191) NOT NULL,
    `curtida_do_comentario` BIGINT NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`comentario_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Curtidas` (
    `curtidas_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`curtidas_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `seguidores` (
    `seguidores_id` BIGINT NOT NULL AUTO_INCREMENT,
    `seguidores` BIGINT NOT NULL,
    `seguindo` BIGINT NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`seguidores_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Notificacao` (
    `notificacao_id` BIGINT NOT NULL AUTO_INCREMENT,
    `seguidores` VARCHAR(191) NOT NULL,
    `seguindo` VARCHAR(191) NOT NULL,
    `curtidas` VARCHAR(191) NOT NULL,
    `comentarios` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`notificacao_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Post` (
    `post_id` BIGINT NOT NULL AUTO_INCREMENT,
    `foto_post` VARCHAR(191) NOT NULL,
    `usuarioUsuario_id` BIGINT NULL,

    PRIMARY KEY (`post_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Usuario_cnpj_key` ON `Usuario`(`cnpj`);

-- AddForeignKey
ALTER TABLE `Profissional` ADD CONSTRAINT `Profissional_profissional_id_fkey` FOREIGN KEY (`profissional_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Dono_de_quadra` ADD CONSTRAINT `Dono_de_quadra_dono_de_quadra_id_fkey` FOREIGN KEY (`dono_de_quadra_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Perfil_Usuario` ADD CONSTRAINT `Perfil_Usuario_perfil_usuario_id_fkey` FOREIGN KEY (`perfil_usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Perfil_Profissional` ADD CONSTRAINT `Perfil_Profissional_perfil_profissional_id_fkey` FOREIGN KEY (`perfil_profissional_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Perfil_Quadras` ADD CONSTRAINT `Perfil_Quadras_perfil_quadra_id_fkey` FOREIGN KEY (`perfil_quadra_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comentarios` ADD CONSTRAINT `Comentarios_comentario_id_fkey` FOREIGN KEY (`comentario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Curtidas` ADD CONSTRAINT `Curtidas_curtidas_id_fkey` FOREIGN KEY (`curtidas_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `seguidores` ADD CONSTRAINT `seguidores_seguidores_id_fkey` FOREIGN KEY (`seguidores_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notificacao` ADD CONSTRAINT `Notificacao_notificacao_id_fkey` FOREIGN KEY (`notificacao_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `postComentario` FOREIGN KEY (`post_id`) REFERENCES `Comentarios`(`comentario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `postCurtidas` FOREIGN KEY (`post_id`) REFERENCES `Curtidas`(`curtidas_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `Post_usuarioUsuario_id_fkey` FOREIGN KEY (`usuarioUsuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Aulas` ADD CONSTRAINT `Aulas_professor_id_fkey` FOREIGN KEY (`professor_id`) REFERENCES `Profissional`(`profissional_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
