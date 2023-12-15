/*
  Warnings:

  - The primary key for the `Notificacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `comentarios` on the `Notificacao` table. All the data in the column will be lost.
  - You are about to drop the column `curtidas` on the `Notificacao` table. All the data in the column will be lost.
  - You are about to drop the column `notificacao_id` on the `Notificacao` table. All the data in the column will be lost.
  - You are about to drop the column `seguidores` on the `Notificacao` table. All the data in the column will be lost.
  - You are about to drop the column `seguindo` on the `Notificacao` table. All the data in the column will be lost.
  - The primary key for the `Perfil_Profissional` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `perfil_profissional_id` on the `Perfil_Profissional` table. All the data in the column will be lost.
  - The primary key for the `Perfil_Usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `perfil_usuario_id` on the `Perfil_Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `usuarioUsuario_id` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `qual_seu_esporte_favortio` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the `Comentarios` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Curtidas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Dono_de_quadra` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Perfil_Quadras` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `seguidores` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[profissionalId]` on the table `Perfil_Profissional` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[usuarioId]` on the table `Perfil_Usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id` to the `Notificacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `titulo` to the `Notificacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario_id` to the `Notificacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Perfil_Profissional` table without a default value. This is not possible if the table is not empty.
  - Added the required column `profissionalId` to the `Perfil_Profissional` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Perfil_Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuarioId` to the `Perfil_Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `update_at` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Comentarios` DROP FOREIGN KEY `Comentarios_comentario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Curtidas` DROP FOREIGN KEY `Curtidas_curtidas_id_fkey`;

-- DropForeignKey
ALTER TABLE `Dono_de_quadra` DROP FOREIGN KEY `Dono_de_quadra_dono_de_quadra_id_fkey`;

-- DropForeignKey
ALTER TABLE `Notificacao` DROP FOREIGN KEY `Notificacao_notificacao_id_fkey`;

-- DropForeignKey
ALTER TABLE `Perfil_Profissional` DROP FOREIGN KEY `Perfil_Profissional_perfil_profissional_id_fkey`;

-- DropForeignKey
ALTER TABLE `Perfil_Quadras` DROP FOREIGN KEY `Perfil_Quadras_perfil_quadra_id_fkey`;

-- DropForeignKey
ALTER TABLE `Perfil_Usuario` DROP FOREIGN KEY `Perfil_Usuario_perfil_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Post` DROP FOREIGN KEY `Post_usuarioUsuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Post` DROP FOREIGN KEY `postComentario`;

-- DropForeignKey
ALTER TABLE `Post` DROP FOREIGN KEY `postCurtidas`;

-- DropForeignKey
ALTER TABLE `seguidores` DROP FOREIGN KEY `seguidores_seguidores_id_fkey`;

-- AlterTable
ALTER TABLE `Notificacao` DROP PRIMARY KEY,
    DROP COLUMN `comentarios`,
    DROP COLUMN `curtidas`,
    DROP COLUMN `notificacao_id`,
    DROP COLUMN `seguidores`,
    DROP COLUMN `seguindo`,
    ADD COLUMN `conteudo` VARCHAR(191) NULL,
    ADD COLUMN `id` BIGINT NOT NULL AUTO_INCREMENT,
    ADD COLUMN `titulo` VARCHAR(191) NOT NULL,
    ADD COLUMN `usuario_id` BIGINT NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Perfil_Profissional` DROP PRIMARY KEY,
    DROP COLUMN `perfil_profissional_id`,
    ADD COLUMN `id` BIGINT NOT NULL AUTO_INCREMENT,
    ADD COLUMN `profissionalId` BIGINT NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Perfil_Usuario` DROP PRIMARY KEY,
    DROP COLUMN `perfil_usuario_id`,
    ADD COLUMN `id` BIGINT NOT NULL AUTO_INCREMENT,
    ADD COLUMN `usuarioId` BIGINT NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Post` DROP COLUMN `usuarioUsuario_id`,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `descricao` VARCHAR(191) NULL,
    ADD COLUMN `update_at` DATETIME(3) NOT NULL,
    ADD COLUMN `usuario_id` BIGINT NULL;

-- AlterTable
ALTER TABLE `Usuario` DROP COLUMN `qual_seu_esporte_favortio`,
    ADD COLUMN `qual_seu_esporte_favorito` VARCHAR(191) NULL,
    ADD COLUMN `quanto_tempo_pratica` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `Comentarios`;

-- DropTable
DROP TABLE `Curtidas`;

-- DropTable
DROP TABLE `Dono_de_quadra`;

-- DropTable
DROP TABLE `Perfil_Quadras`;

-- DropTable
DROP TABLE `seguidores`;

-- CreateTable
CREATE TABLE `Segue` (
    `seguidorId` BIGINT NOT NULL,
    `seguindoId` BIGINT NOT NULL,

    PRIMARY KEY (`seguidorId`, `seguindoId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DonoDeQuadra` (
    `donoDeQuadraId` BIGINT NOT NULL AUTO_INCREMENT,
    `userId` BIGINT NOT NULL,

    UNIQUE INDEX `DonoDeQuadra_userId_key`(`userId`),
    PRIMARY KEY (`donoDeQuadraId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Quadra` (
    `quadraId` BIGINT NOT NULL AUTO_INCREMENT,
    `donoId` BIGINT NOT NULL,
    `localizacao` VARCHAR(191) NOT NULL,
    `tipo_de_quadra` VARCHAR(191) NOT NULL,
    `tempo_de_atuacao` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`quadraId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FotoQuadra` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `src` VARCHAR(191) NOT NULL,
    `quadraId` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CurtidasComentarios` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `usuarioId` BIGINT NOT NULL,
    `comentario_id` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comentario` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `conteudo` VARCHAR(191) NOT NULL,
    `usuarioId` BIGINT NOT NULL,
    `postId` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Curtida` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `usuarioId` BIGINT NOT NULL,
    `post_id` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Perfil_Profissional_profissionalId_key` ON `Perfil_Profissional`(`profissionalId`);

-- CreateIndex
CREATE UNIQUE INDEX `Perfil_Usuario_usuarioId_key` ON `Perfil_Usuario`(`usuarioId`);

-- AddForeignKey
ALTER TABLE `Segue` ADD CONSTRAINT `Segue_seguidorId_fkey` FOREIGN KEY (`seguidorId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Segue` ADD CONSTRAINT `Segue_seguindoId_fkey` FOREIGN KEY (`seguindoId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DonoDeQuadra` ADD CONSTRAINT `DonoDeQuadra_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Quadra` ADD CONSTRAINT `Quadra_donoId_fkey` FOREIGN KEY (`donoId`) REFERENCES `DonoDeQuadra`(`donoDeQuadraId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FotoQuadra` ADD CONSTRAINT `FotoQuadra_quadraId_fkey` FOREIGN KEY (`quadraId`) REFERENCES `Quadra`(`quadraId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Perfil_Usuario` ADD CONSTRAINT `Perfil_Usuario_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Perfil_Profissional` ADD CONSTRAINT `Perfil_Profissional_profissionalId_fkey` FOREIGN KEY (`profissionalId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CurtidasComentarios` ADD CONSTRAINT `CurtidasComentarios_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CurtidasComentarios` ADD CONSTRAINT `CurtidasComentarios_comentario_id_fkey` FOREIGN KEY (`comentario_id`) REFERENCES `Comentario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comentario` ADD CONSTRAINT `Comentario_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post`(`post_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comentario` ADD CONSTRAINT `Comentario_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Curtida` ADD CONSTRAINT `Curtida_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Curtida` ADD CONSTRAINT `Curtida_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `Post`(`post_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notificacao` ADD CONSTRAINT `Notificacao_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `Post_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE SET NULL ON UPDATE CASCADE;
