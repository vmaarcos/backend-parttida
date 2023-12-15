/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `User`;

-- CreateTable
CREATE TABLE `Usuario` (
    `usuario_id` BIGINT NOT NULL AUTO_INCREMENT,
    `nome_completo` VARCHAR(191) NOT NULL,
    `data_de_nascimento` DATETIME(3) NOT NULL,
    `genero` VARCHAR(191) NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `telefone` VARCHAR(191) NULL,
    `endereco` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `que_esporte_pratica` VARCHAR(191) NOT NULL,
    `quanto_tempo_pratica_esporte` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Usuario_email_key`(`email`),
    UNIQUE INDEX `Usuario_cpf_key`(`cpf`),
    PRIMARY KEY (`usuario_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Professor` (
    `professor_id` BIGINT NOT NULL AUTO_INCREMENT,
    `usuario_id` BIGINT NOT NULL,
    `cnpj` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `experiencias_profissionais` VARCHAR(191) NOT NULL,
    `formacoes` VARCHAR(191) NOT NULL,
    `quanto_tempo_ministra_aulas` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Professor_usuario_id_key`(`usuario_id`),
    UNIQUE INDEX `Professor_cnpj_key`(`cnpj`),
    UNIQUE INDEX `Professor_cpf_key`(`cpf`),
    PRIMARY KEY (`professor_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Quadra` (
    `quadra_id` BIGINT NOT NULL AUTO_INCREMENT,
    `usuario_id` BIGINT NOT NULL,
    `cnpj_dono` VARCHAR(191) NOT NULL,
    `cpf_responsavel` VARCHAR(191) NOT NULL,
    `avaliacao` VARCHAR(191) NOT NULL,
    `quanto_tempo_atua_no_mercado` BIGINT NOT NULL,
    `tipos_de_quadras` VARCHAR(191) NOT NULL,
    `quais_esportes` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Quadra_quadra_id_key`(`quadra_id`),
    UNIQUE INDEX `Quadra_usuario_id_key`(`usuario_id`),
    UNIQUE INDEX `Quadra_cnpj_dono_key`(`cnpj_dono`),
    UNIQUE INDEX `Quadra_cpf_responsavel_key`(`cpf_responsavel`),
    PRIMARY KEY (`cnpj_dono`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Redes_sociais` (
    `usuario_id` BIGINT NOT NULL AUTO_INCREMENT,
    `seguidores` BIGINT NOT NULL,
    `seguindo` BIGINT NOT NULL,
    `numero_de_post` BIGINT NOT NULL,
    `comentarios` BIGINT NOT NULL,
    `curtidas` BIGINT NOT NULL,
    `visitas_no_perfil` BIGINT NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`usuario_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Aulas` (
    `aulas_id` BIGINT NOT NULL AUTO_INCREMENT,
    `professor_id` BIGINT NOT NULL,
    `usuario_id` BIGINT NOT NULL,
    `modalidade` VARCHAR(191) NOT NULL,
    `horario` DATETIME(3) NOT NULL,
    `tipo_do_pagamento` VARCHAR(191) NOT NULL,
    `valor_do_pagamento` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`aulas_id`, `professor_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Contrato` (
    `usuario_id` BIGINT NOT NULL,
    `professor_id` BIGINT NOT NULL,
    `contratro_id` BIGINT NOT NULL,
    `dia` DATETIME(3) NOT NULL,
    `horario` VARCHAR(191) NOT NULL,
    `tipo_de_pagamento` VARCHAR(191) NOT NULL,
    `valor_do_pagamento` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`contratro_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tipos_de_pagamento` (
    `tipos_de_pagamento` VARCHAR(191) NOT NULL,
    `professor_id` BIGINT NOT NULL,
    `usuario_id` BIGINT NOT NULL,
    `catao_de_credito` VARCHAR(191) NOT NULL,
    `pix` VARCHAR(191) NOT NULL,
    `codigo_qr` VARCHAR(191) NOT NULL,
    `cartao_virtual` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`tipos_de_pagamento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tipo_de_contrato` (
    `tipo_de_contrato_id` BIGINT NOT NULL,
    `anual` VARCHAR(191) NOT NULL,
    `mensal` VARCHAR(191) NOT NULL,
    `avulso` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `update_at` DATETIME(3) NOT NULL,
    `professor_id` BIGINT NOT NULL,
    `usuario_id` BIGINT NOT NULL,

    PRIMARY KEY (`tipo_de_contrato_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Aula_vs_professor` (
    `cpf_professor` VARCHAR(191) NOT NULL,
    `usuario_id` BIGINT NOT NULL,
    `professor_id` BIGINT NOT NULL,
    `aulas_id` BIGINT NOT NULL,
    `contrato_id` BIGINT NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`aulas_id`, `usuario_id`, `professor_id`, `contrato_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Historico` (
    `dia_hora` DATETIME(3) NOT NULL,
    `usuario_id` BIGINT NOT NULL,
    `professor_id` BIGINT NOT NULL,
    `aulas_id` BIGINT NOT NULL,
    `quadra_id` BIGINT NOT NULL,
    `contrato_id` BIGINT NOT NULL,
    `alugou_quadra` BIGINT NOT NULL,
    `contratou_profissionais` BIGINT NOT NULL,
    `como_foi_a_aula` BIGINT NOT NULL,
    `dono_inseriu_quadra` BIGINT NOT NULL,
    `dono_retirou_quadra` BIGINT NOT NULL,
    `professor_inseriu_certificacao` BIGINT NOT NULL,

    PRIMARY KEY (`aulas_id`, `professor_id`, `usuario_id`, `contrato_id`, `quadra_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Professor` ADD CONSTRAINT `Professor_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Quadra` ADD CONSTRAINT `Quadra_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Redes_sociais` ADD CONSTRAINT `Redes_sociais_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Aulas` ADD CONSTRAINT `Aulas_professor_id_fkey` FOREIGN KEY (`professor_id`) REFERENCES `Professor`(`professor_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Aulas` ADD CONSTRAINT `Aulas_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Contrato` ADD CONSTRAINT `Contrato_professor_id_fkey` FOREIGN KEY (`professor_id`) REFERENCES `Professor`(`professor_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Contrato` ADD CONSTRAINT `Contrato_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tipos_de_pagamento` ADD CONSTRAINT `Tipos_de_pagamento_professor_id_fkey` FOREIGN KEY (`professor_id`) REFERENCES `Professor`(`professor_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tipos_de_pagamento` ADD CONSTRAINT `Tipos_de_pagamento_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tipo_de_contrato` ADD CONSTRAINT `Tipo_de_contrato_professor_id_fkey` FOREIGN KEY (`professor_id`) REFERENCES `Professor`(`professor_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tipo_de_contrato` ADD CONSTRAINT `Tipo_de_contrato_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Aula_vs_professor` ADD CONSTRAINT `Aula_vs_professor_professor_id_fkey` FOREIGN KEY (`professor_id`) REFERENCES `Professor`(`professor_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Aula_vs_professor` ADD CONSTRAINT `Aula_vs_professor_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Historico` ADD CONSTRAINT `Historico_professor_id_fkey` FOREIGN KEY (`professor_id`) REFERENCES `Professor`(`professor_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Historico` ADD CONSTRAINT `Historico_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`usuario_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
