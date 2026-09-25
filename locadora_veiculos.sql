-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/09/2026 às 21:39
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locadora_veiculos_2`
--
CREATE DATABASE IF NOT EXISTS `locadora_veiculos_2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `locadora_veiculos_2`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `acessorios`
--

DROP TABLE IF EXISTS `acessorios`;
CREATE TABLE `acessorios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `acessorios`
--

INSERT INTO `acessorios` (`id`, `nome`) VALUES
(1, 'Ar Condicionado'),
(2, 'Direção Hidráulica'),
(3, 'Central Multimídia'),
(4, 'Lona Marítima');

-- --------------------------------------------------------

--
-- Estrutura para tabela `automovel`
--

DROP TABLE IF EXISTS `automovel`;
CREATE TABLE `automovel` (
  `id_tipo_veiculo` int(11) NOT NULL,
  `tamanho` varchar(50) DEFAULT NULL,
  `numero_passageiros` int(11) DEFAULT NULL,
  `numero_portas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `automovel`
--

INSERT INTO `automovel` (`id_tipo_veiculo`, `tamanho`, `numero_passageiros`, `numero_portas`) VALUES
(1, 'Compacto', 5, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `automovel_acessorio`
--

DROP TABLE IF EXISTS `automovel_acessorio`;
CREATE TABLE `automovel_acessorio` (
  `id_tipo_veiculo` int(11) NOT NULL,
  `id_acessorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `automovel_acessorio`
--

INSERT INTO `automovel_acessorio` (`id_tipo_veiculo`, `id_acessorio`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `camioneta_acessorio`
--

DROP TABLE IF EXISTS `camioneta_acessorio`;
CREATE TABLE `camioneta_acessorio` (
  `id_tipo_veiculo` int(11) NOT NULL,
  `id_acessorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `camioneta_acessorio`
--

INSERT INTO `camioneta_acessorio` (`id_tipo_veiculo`, `id_acessorio`) VALUES
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `camioneta_carga`
--

DROP TABLE IF EXISTS `camioneta_carga`;
CREATE TABLE `camioneta_carga` (
  `id_tipo_veiculo` int(11) NOT NULL,
  `capacidade_carga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `camioneta_carga`
--

INSERT INTO `camioneta_carga` (`id_tipo_veiculo`, `capacidade_carga`) VALUES
(2, 1500.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `camioneta_passageiros`
--

DROP TABLE IF EXISTS `camioneta_passageiros`;
CREATE TABLE `camioneta_passageiros` (
  `id_tipo_veiculo` int(11) NOT NULL,
  `tamanho` varchar(50) DEFAULT NULL,
  `numero_passageiros` int(11) DEFAULT NULL,
  `numero_portas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `camioneta_passageiros`
--

INSERT INTO `camioneta_passageiros` (`id_tipo_veiculo`, `tamanho`, `numero_passageiros`, `numero_portas`) VALUES
(3, 'Grande', 7, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codigo`, `nome`, `endereco`) VALUES
(1, 'Carlos Mendes', 'Rua das Flores, 123, Campinas - SP'),
(2, 'Logística Express Ltda', 'Av. das Indústrias, 456, São Paulo - SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_motorista`
--

DROP TABLE IF EXISTS `cliente_motorista`;
CREATE TABLE `cliente_motorista` (
  `codigo_cliente` int(11) NOT NULL,
  `id_motorista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente_motorista`
--

INSERT INTO `cliente_motorista` (`codigo_cliente`, `id_motorista`) VALUES
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `filial`
--

DROP TABLE IF EXISTS `filial`;
CREATE TABLE `filial` (
  `id` int(11) NOT NULL,
  `endereco` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filial`
--

INSERT INTO `filial` (`id`, `endereco`) VALUES
(1, 'Av. Brasil, 1000, Campinas - SP'),
(2, 'Rua Augusta, 200, São Paulo - SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fisico`
--

DROP TABLE IF EXISTS `fisico`;
CREATE TABLE `fisico` (
  `codigo_cliente` int(11) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fisico`
--

INSERT INTO `fisico` (`codigo_cliente`, `sexo`, `data_nascimento`, `cpf`) VALUES
(1, 'M', '1985-08-15', '12345678901');

-- --------------------------------------------------------

--
-- Estrutura para tabela `juridico`
--

DROP TABLE IF EXISTS `juridico`;
CREATE TABLE `juridico` (
  `codigo_cliente` int(11) NOT NULL,
  `inscricao_estadual` varchar(50) DEFAULT NULL,
  `cnpj` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `juridico`
--

INSERT INTO `juridico` (`codigo_cliente`, `inscricao_estadual`, `cnpj`) VALUES
(2, '123456789123', '12345678000199');

-- --------------------------------------------------------

--
-- Estrutura para tabela `locacao`
--

DROP TABLE IF EXISTS `locacao`;
CREATE TABLE `locacao` (
  `id` int(11) NOT NULL,
  `data_entrega` date DEFAULT NULL,
  `id_filial` int(11) DEFAULT NULL,
  `id_motorista` int(11) DEFAULT NULL,
  `placa_veiculo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `locacao`
--

INSERT INTO `locacao` (`id`, `data_entrega`, `id_filial`, `id_motorista`, `placa_veiculo`) VALUES
(1, '2026-09-25', 1, 1, 'ABC1D23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `motorista`
--

DROP TABLE IF EXISTS `motorista`;
CREATE TABLE `motorista` (
  `id` int(11) NOT NULL,
  `numero_habilitacao` varchar(20) NOT NULL,
  `data_vencimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `motorista`
--

INSERT INTO `motorista` (`id`, `numero_habilitacao`, `data_vencimento`) VALUES
(1, '98765432100', '2028-10-20'),
(2, '11223344556', '2027-05-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `data_reserva` date DEFAULT NULL,
  `data_prevista` date DEFAULT NULL,
  `codigo_cliente` int(11) DEFAULT NULL,
  `id_filial` int(11) DEFAULT NULL,
  `id_tipo_veiculo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reserva`
--

INSERT INTO `reserva` (`id`, `data_reserva`, `data_prevista`, `codigo_cliente`, `id_filial`, `id_tipo_veiculo`) VALUES
(1, '2026-09-20', '2026-09-25', 1, 1, 1),
(2, '2026-09-21', '2026-09-30', 2, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `revisao`
--

DROP TABLE IF EXISTS `revisao`;
CREATE TABLE `revisao` (
  `id` int(11) NOT NULL,
  `numero_horas` int(11) DEFAULT NULL,
  `pendencia` text DEFAULT NULL,
  `data_revisao` date DEFAULT NULL,
  `placa_veiculo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `revisao`
--

INSERT INTO `revisao` (`id`, `numero_horas`, `pendencia`, `data_revisao`, `placa_veiculo`) VALUES
(1, 4, 'Troca de pastilhas de freio e óleo', '2026-09-10', 'ABC1D23'),
(2, 2, 'Alinhamento e balanceamento', '2026-09-15', 'XYZ9W87');

-- --------------------------------------------------------

--
-- Estrutura para tabela `seguro`
--

DROP TABLE IF EXISTS `seguro`;
CREATE TABLE `seguro` (
  `id` int(11) NOT NULL,
  `data_seguro` date DEFAULT NULL,
  `id_locacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `seguro`
--

INSERT INTO `seguro` (`id`, `data_seguro`, `id_locacao`) VALUES
(1, '2026-09-25', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_veiculo`
--

DROP TABLE IF EXISTS `tipo_veiculo`;
CREATE TABLE `tipo_veiculo` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_veiculo`
--

INSERT INTO `tipo_veiculo` (`id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
CREATE TABLE `veiculo` (
  `placa` varchar(10) NOT NULL,
  `numero_chassis` varchar(50) NOT NULL,
  `numero_motor` varchar(50) DEFAULT NULL,
  `cor_veiculo` varchar(30) DEFAULT NULL,
  `quilometragem_atual` int(11) DEFAULT NULL,
  `quilometragem_diaria` int(11) DEFAULT NULL,
  `id_tipo_veiculo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`placa`, `numero_chassis`, `numero_motor`, `cor_veiculo`, `quilometragem_atual`, `quilometragem_diaria`, `id_tipo_veiculo`) VALUES
('ABC1D23', 'CHASSIS0000000001', 'MOTOR000001', 'Prata', 25000, 50, 1),
('XYZ9W87', 'CHASSIS0000000002', 'MOTOR000002', 'Branca', 85000, 120, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acessorios`
--
ALTER TABLE `acessorios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `automovel`
--
ALTER TABLE `automovel`
  ADD PRIMARY KEY (`id_tipo_veiculo`);

--
-- Índices de tabela `automovel_acessorio`
--
ALTER TABLE `automovel_acessorio`
  ADD PRIMARY KEY (`id_tipo_veiculo`,`id_acessorio`),
  ADD KEY `id_acessorio` (`id_acessorio`);

--
-- Índices de tabela `camioneta_acessorio`
--
ALTER TABLE `camioneta_acessorio`
  ADD PRIMARY KEY (`id_tipo_veiculo`,`id_acessorio`),
  ADD KEY `id_acessorio` (`id_acessorio`);

--
-- Índices de tabela `camioneta_carga`
--
ALTER TABLE `camioneta_carga`
  ADD PRIMARY KEY (`id_tipo_veiculo`);

--
-- Índices de tabela `camioneta_passageiros`
--
ALTER TABLE `camioneta_passageiros`
  ADD PRIMARY KEY (`id_tipo_veiculo`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `cliente_motorista`
--
ALTER TABLE `cliente_motorista`
  ADD PRIMARY KEY (`codigo_cliente`,`id_motorista`),
  ADD KEY `id_motorista` (`id_motorista`);

--
-- Índices de tabela `filial`
--
ALTER TABLE `filial`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fisico`
--
ALTER TABLE `fisico`
  ADD PRIMARY KEY (`codigo_cliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `juridico`
--
ALTER TABLE `juridico`
  ADD PRIMARY KEY (`codigo_cliente`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `locacao`
--
ALTER TABLE `locacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_filial` (`id_filial`),
  ADD KEY `id_motorista` (`id_motorista`),
  ADD KEY `placa_veiculo` (`placa_veiculo`);

--
-- Índices de tabela `motorista`
--
ALTER TABLE `motorista`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_habilitacao` (`numero_habilitacao`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_cliente` (`codigo_cliente`),
  ADD KEY `id_filial` (`id_filial`),
  ADD KEY `id_tipo_veiculo` (`id_tipo_veiculo`);

--
-- Índices de tabela `revisao`
--
ALTER TABLE `revisao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `placa_veiculo` (`placa_veiculo`);

--
-- Índices de tabela `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_locacao` (`id_locacao`);

--
-- Índices de tabela `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`placa`),
  ADD UNIQUE KEY `numero_chassis` (`numero_chassis`),
  ADD UNIQUE KEY `numero_motor` (`numero_motor`),
  ADD KEY `id_tipo_veiculo` (`id_tipo_veiculo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessorios`
--
ALTER TABLE `acessorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `filial`
--
ALTER TABLE `filial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `locacao`
--
ALTER TABLE `locacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `motorista`
--
ALTER TABLE `motorista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `revisao`
--
ALTER TABLE `revisao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `seguro`
--
ALTER TABLE `seguro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `automovel`
--
ALTER TABLE `automovel`
  ADD CONSTRAINT `automovel_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo` (`id`);

--
-- Restrições para tabelas `automovel_acessorio`
--
ALTER TABLE `automovel_acessorio`
  ADD CONSTRAINT `automovel_acessorio_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `automovel` (`id_tipo_veiculo`),
  ADD CONSTRAINT `automovel_acessorio_ibfk_2` FOREIGN KEY (`id_acessorio`) REFERENCES `acessorios` (`id`);

--
-- Restrições para tabelas `camioneta_acessorio`
--
ALTER TABLE `camioneta_acessorio`
  ADD CONSTRAINT `camioneta_acessorio_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `camioneta_passageiros` (`id_tipo_veiculo`),
  ADD CONSTRAINT `camioneta_acessorio_ibfk_2` FOREIGN KEY (`id_acessorio`) REFERENCES `acessorios` (`id`);

--
-- Restrições para tabelas `camioneta_carga`
--
ALTER TABLE `camioneta_carga`
  ADD CONSTRAINT `camioneta_carga_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo` (`id`);

--
-- Restrições para tabelas `camioneta_passageiros`
--
ALTER TABLE `camioneta_passageiros`
  ADD CONSTRAINT `camioneta_passageiros_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo` (`id`);

--
-- Restrições para tabelas `cliente_motorista`
--
ALTER TABLE `cliente_motorista`
  ADD CONSTRAINT `cliente_motorista_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`),
  ADD CONSTRAINT `cliente_motorista_ibfk_2` FOREIGN KEY (`id_motorista`) REFERENCES `motorista` (`id`);

--
-- Restrições para tabelas `fisico`
--
ALTER TABLE `fisico`
  ADD CONSTRAINT `fisico_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`) ON DELETE CASCADE;

--
-- Restrições para tabelas `juridico`
--
ALTER TABLE `juridico`
  ADD CONSTRAINT `juridico_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`) ON DELETE CASCADE;

--
-- Restrições para tabelas `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`id_filial`) REFERENCES `filial` (`id`),
  ADD CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`id_motorista`) REFERENCES `motorista` (`id`),
  ADD CONSTRAINT `locacao_ibfk_3` FOREIGN KEY (`placa_veiculo`) REFERENCES `veiculo` (`placa`);

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_filial`) REFERENCES `filial` (`id`),
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo` (`id`);

--
-- Restrições para tabelas `revisao`
--
ALTER TABLE `revisao`
  ADD CONSTRAINT `revisao_ibfk_1` FOREIGN KEY (`placa_veiculo`) REFERENCES `veiculo` (`placa`);

--
-- Restrições para tabelas `seguro`
--
ALTER TABLE `seguro`
  ADD CONSTRAINT `seguro_ibfk_1` FOREIGN KEY (`id_locacao`) REFERENCES `locacao` (`id`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
