/*
  Warnings:

  - The primary key for the `DonoDeQuadra` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `FotoQuadra` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE `Quadra` DROP FOREIGN KEY `Quadra_donoId_fkey`;

-- AlterTable
ALTER TABLE `DonoDeQuadra` DROP PRIMARY KEY,
    MODIFY `donoDeQuadraId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`donoDeQuadraId`);

-- AlterTable
ALTER TABLE `FotoQuadra` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Quadra` MODIFY `donoId` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Quadra` ADD CONSTRAINT `Quadra_donoId_fkey` FOREIGN KEY (`donoId`) REFERENCES `DonoDeQuadra`(`donoDeQuadraId`) ON DELETE RESTRICT ON UPDATE CASCADE;
