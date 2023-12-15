/*
  Warnings:

  - The primary key for the `Aulas` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Comentario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Curtida` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `CurtidasComentarios` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Notificacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Perfil_Profissional` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Perfil_Usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Post` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Profissional` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Quadra` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Segue` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[profissional_id]` on the table `Profissional` will be added. If there are existing duplicate values, this will fail.
  - The required column `id` was added to the `Profissional` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE `Aulas` DROP FOREIGN KEY `Aulas_professor_id_fkey`;

-- DropForeignKey
ALTER TABLE `Aulas` DROP FOREIGN KEY `Aulas_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Comentario` DROP FOREIGN KEY `Comentario_postId_fkey`;

-- DropForeignKey
ALTER TABLE `Comentario` DROP FOREIGN KEY `Comentario_usuarioId_fkey`;

-- DropForeignKey
ALTER TABLE `Curtida` DROP FOREIGN KEY `Curtida_post_id_fkey`;

-- DropForeignKey
ALTER TABLE `Curtida` DROP FOREIGN KEY `Curtida_usuarioId_fkey`;

-- DropForeignKey
ALTER TABLE `CurtidasComentarios` DROP FOREIGN KEY `CurtidasComentarios_comentario_id_fkey`;

-- DropForeignKey
ALTER TABLE `CurtidasComentarios` DROP FOREIGN KEY `CurtidasComentarios_usuarioId_fkey`;

-- DropForeignKey
ALTER TABLE `DonoDeQuadra` DROP FOREIGN KEY `DonoDeQuadra_userId_fkey`;

-- DropForeignKey
ALTER TABLE `FotoQuadra` DROP FOREIGN KEY `FotoQuadra_quadraId_fkey`;

-- DropForeignKey
ALTER TABLE `Notificacao` DROP FOREIGN KEY `Notificacao_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Perfil_Profissional` DROP FOREIGN KEY `Perfil_Profissional_profissionalId_fkey`;

-- DropForeignKey
ALTER TABLE `Perfil_Usuario` DROP FOREIGN KEY `Perfil_Usuario_usuarioId_fkey`;

-- DropForeignKey
ALTER TABLE `Post` DROP FOREIGN KEY `Post_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `Profissional` DROP FOREIGN KEY `Profissional_profissional_id_fkey`;

-- DropForeignKey
ALTER TABLE `Segue` DROP FOREIGN KEY `Segue_seguidorId_fkey`;

-- DropForeignKey
ALTER TABLE `Segue` DROP FOREIGN KEY `Segue_seguindoId_fkey`;

-- AlterTable
ALTER TABLE `Aulas` DROP PRIMARY KEY,
    MODIFY `aulas_id` VARCHAR(191) NOT NULL,
    MODIFY `professor_id` VARCHAR(191) NOT NULL,
    MODIFY `usuario_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`aulas_id`, `professor_id`);

-- AlterTable
ALTER TABLE `Comentario` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `usuarioId` VARCHAR(191) NOT NULL,
    MODIFY `postId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Curtida` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `usuarioId` VARCHAR(191) NOT NULL,
    MODIFY `post_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `CurtidasComentarios` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `usuarioId` VARCHAR(191) NOT NULL,
    MODIFY `comentario_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `DonoDeQuadra` MODIFY `userId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `FotoQuadra` MODIFY `quadraId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Notificacao` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `usuario_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Perfil_Profissional` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `profissionalId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Perfil_Usuario` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `usuarioId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Post` DROP PRIMARY KEY,
    MODIFY `post_id` VARCHAR(191) NOT NULL,
    MODIFY `usuario_id` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`post_id`);

-- AlterTable
ALTER TABLE `Profissional` DROP PRIMARY KEY,
    ADD COLUMN `id` VARCHAR(191) NOT NULL,
    MODIFY `profissional_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Quadra` DROP PRIMARY KEY,
    MODIFY `quadraId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`quadraId`);

-- AlterTable
ALTER TABLE `Segue` DROP PRIMARY KEY,
    MODIFY `seguidorId` VARCHAR(191) NOT NULL,
    MODIFY `seguindoId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`seguidorId`, `seguindoId`);

-- AlterTable
ALTER TABLE `Usuario` DROP PRIMARY KEY,
    MODIFY `usuario_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`usuario_id`);

-- CreateIndex
CREATE UNIQUE INDEX `Profissional_profissional_id_key` ON `Profissional`(`profissional_id`);

-- AddForeignKey
ALTER TABLE `Segue` ADD CONSTRAINT `Segue_seguidorId_fkey` FOREIGN KEY (`seguidorId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Segue` ADD CONSTRAINT `Segue_seguindoId_fkey` FOREIGN KEY (`seguindoId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Profissional` ADD CONSTRAINT `Profissional_profissional_id_fkey` FOREIGN KEY (`profissional_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DonoDeQuadra` ADD CONSTRAINT `DonoDeQuadra_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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

-- AddForeignKey
ALTER TABLE `Aulas` ADD CONSTRAINT `Aulas_professor_id_fkey` FOREIGN KEY (`professor_id`) REFERENCES `Profissional`(`profissional_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Aulas` ADD CONSTRAINT `Aulas_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
