-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Tempo de geração: 12/12/2023 às 03:22
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cross_visual_academy`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aulas`
--

CREATE TABLE `aulas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `coach_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aulas`
--

INSERT INTO `aulas` (`id`, `titulo`, `descricao`, `coach_id`) VALUES
(9, 'Aula de Força', 'Aula focada em exercícios de força.', 1),
(10, 'Aula Cardio', 'Aula com foco em exercícios cardiovasculares.', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicios`
--

CREATE TABLE `exercicios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `imagem_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exercicios`
--

INSERT INTO `exercicios` (`id`, `nome`, `descricao`, `imagem_url`) VALUES
(1, 'Burpees', 'Exercício de corpo inteiro que proporciona treinamento de força e aeróbico.', 'http://exemplo.com/imagens/burpees.jpg'),
(2, 'Pull-ups', 'Exercício de força que trabalha a parte superior do corpo.', 'http://exemplo.com/imagens/pull-ups.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicios_parte`
--

CREATE TABLE `exercicios_parte` (
  `parte_id` int(11) NOT NULL,
  `exercicio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exercicios_parte`
--

INSERT INTO `exercicios_parte` (`parte_id`, `exercicio_id`) VALUES
(7, 1),
(8, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `partes_aula`
--

CREATE TABLE `partes_aula` (
  `id` int(11) NOT NULL,
  `aula_id` int(11) NOT NULL,
  `tipo_tempo_id` int(11) DEFAULT NULL,
  `duracao` int(11) NOT NULL,
  `ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `partes_aula`
--

INSERT INTO `partes_aula` (`id`, `aula_id`, `tipo_tempo_id`, `duracao`, `ordem`) VALUES
(7, 9, 1, 600, 1),
(8, 9, 2, 300, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_controle_tempo`
--

CREATE TABLE `tipos_controle_tempo` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipos_controle_tempo`
--

INSERT INTO `tipos_controle_tempo` (`id`, `nome`, `descricao`) VALUES
(1, 'AMRAP', 'As Many Rounds/Reps As Possible em um período de tempo específico.'),
(2, 'EMOM', 'Every Minute on the Minute, realizar um exercício específico a cada início de minuto.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `tipo` enum('coach','aluno') NOT NULL,
  `data_cadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha_hash`, `tipo`, `data_cadastro`) VALUES
(1, 'Nome do Coach 1', 'email1@exemplo.com', 'senha_hash', 'coach', '2023-12-11'),
(2, 'Nome do Coach 2', 'email2@exemplo.com', 'senha_hash', 'coach', '2023-12-11');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coach_id` (`coach_id`);

--
-- Índices de tabela `exercicios`
--
ALTER TABLE `exercicios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `exercicios_parte`
--
ALTER TABLE `exercicios_parte`
  ADD PRIMARY KEY (`parte_id`,`exercicio_id`),
  ADD KEY `exercicio_id` (`exercicio_id`);

--
-- Índices de tabela `partes_aula`
--
ALTER TABLE `partes_aula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aula_id` (`aula_id`),
  ADD KEY `tipo_tempo_id` (`tipo_tempo_id`);

--
-- Índices de tabela `tipos_controle_tempo`
--
ALTER TABLE `tipos_controle_tempo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `exercicios`
--
ALTER TABLE `exercicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `partes_aula`
--
ALTER TABLE `partes_aula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tipos_controle_tempo`
--
ALTER TABLE `tipos_controle_tempo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aulas`
--
ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `exercicios_parte`
--
ALTER TABLE `exercicios_parte`
  ADD CONSTRAINT `exercicios_parte_ibfk_1` FOREIGN KEY (`parte_id`) REFERENCES `partes_aula` (`id`),
  ADD CONSTRAINT `exercicios_parte_ibfk_2` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicios` (`id`);

--
-- Restrições para tabelas `partes_aula`
--
ALTER TABLE `partes_aula`
  ADD CONSTRAINT `partes_aula_ibfk_1` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`),
  ADD CONSTRAINT `partes_aula_ibfk_2` FOREIGN KEY (`tipo_tempo_id`) REFERENCES `tipos_controle_tempo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
