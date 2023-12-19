-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Tempo de geração: 19/12/2023 às 12:16
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
  `coach_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aulas`
--

INSERT INTO `aulas` (`id`, `titulo`, `descricao`, `coach_id`, `createdAt`, `updatedAt`) VALUES
(9, 'Aula de Força', 'Aula focada em exercícios de força.', 1, '2023-12-15 11:43:37', '2023-12-15 11:43:37'),
(10, 'Aula Cardio', 'Aula com foco em exercícios cardiovasculares.', 2, '2023-12-15 11:43:37', '2023-12-15 11:43:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicios`
--

CREATE TABLE `exercicios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `imagem_url` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exercicios`
--

INSERT INTO `exercicios` (`id`, `nome`, `descricao`, `imagem_url`, `createdAt`, `updatedAt`) VALUES
(1, 'Burpees', 'Exercício de corpo inteiro que proporciona treinamento de força e aeróbico.', 'https://www.crossfit.com/essentials/the-burpee-2', '2023-12-15 11:51:02', '2023-12-18 19:07:16'),
(2, 'Pull-ups', 'Exercício de força que trabalha a parte superior do corpo.', 'http://exemplo.com/imagens/pull-ups.jpg', '2023-12-15 11:51:02', '2023-12-15 11:51:02'),
(7, 'Burpees', 'Exercício de corpo inteiro que proporciona treinamento de força e aeróbico.', 'http://exemplo.com/imagens/burpees.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(8, 'Air Squat', 'Exercício básico de agachamento usando apenas o peso corporal.', 'http://exemplo.com/imagens/air-squat.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(9, 'Front Squat', 'Versão do agachamento com a barra posicionada na frente do corpo.', 'http://exemplo.com/imagens/front-squat.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(10, 'Overhead Squat', 'Variação de agachamento com a barra levantada acima da cabeça.', 'http://exemplo.com/imagens/overhead-squat.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(11, 'Deadlift', 'Levantamento de peso a partir do chão até a altura do quadril.', 'http://exemplo.com/imagens/deadlift.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(12, 'Sumo Deadlift High Pull', 'Variação de deadlift com postura mais aberta e puxada até o queixo.', 'http://exemplo.com/imagens/sumo-deadlift-high-pull.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(13, 'Clean', 'Levantamento de peso do chão até os ombros.', 'http://exemplo.com/imagens/clean.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(14, 'Power Clean', 'Variação do clean com recepção em posição mais alta.', 'http://exemplo.com/imagens/power-clean.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(15, 'Squat Clean', 'Clean seguido de um agachamento completo.', 'http://exemplo.com/imagens/squat-clean.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(16, 'Jerk', 'Levantamento de peso acima da cabeça a partir dos ombros.', 'http://exemplo.com/imagens/jerk.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(17, 'Push Jerk', 'Variação do jerk com um movimento rápido de empurrar acima da cabeça.', 'http://exemplo.com/imagens/push-jerk.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(18, 'Split Jerk', 'Variação do jerk onde uma perna é movida para frente e a outra para trás.', 'http://exemplo.com/imagens/split-jerk.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(19, 'Snatch', 'Levantamento de peso do chão diretamente acima da cabeça em um movimento.', 'http://exemplo.com/imagens/snatch.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(20, 'Power Snatch', 'Variação do snatch com recepção em uma posição mais alta.', 'http://exemplo.com/imagens/power-snatch.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(21, 'Thruster', 'Combinação de um front squat seguido de um push press.', 'http://exemplo.com/imagens/thruster.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(22, 'Kettlebell Swing', 'Movimento de balanço com kettlebell trabalhando principalmente a região posterior da coxa e glúteos.', 'http://exemplo.com/imagens/kettlebell-swing.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(23, 'Wall Ball', 'Movimento de agachamento seguido por um lançamento de bola medicinal contra uma parede.', 'http://exemplo.com/imagens/wall-ball.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(24, 'Box Jump', 'Salto para cima de uma caixa ou plataforma.', 'http://exemplo.com/imagens/box-jump.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(25, 'Double-Unders', 'Movimento de pular corda onde a corda passa duas vezes sob os pés em cada salto.', 'http://exemplo.com/imagens/double-unders.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(26, 'Muscle Ups', 'Exercício avançado que combina um pull-up seguido de um dip.', 'http://exemplo.com/imagens/muscle-ups.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(27, 'Pull-Ups', 'Exercício de puxar onde você levanta seu corpo até que o queixo passe da barra.', 'http://exemplo.com/imagens/pull-ups.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(28, 'Chin-Ups', 'Variação de pull-up com pegada mais fechada e palmas das mãos voltadas para você.', 'http://exemplo.com/imagens/chin-ups.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(29, 'Toes-to-Bar', 'Exercício onde você levanta os pés até tocarem a barra de pull-up.', 'http://exemplo.com/imagens/toes-to-bar.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(30, 'Handstand Push-Ups', 'Exercício onde você faz um push-up na posição de parada de mãos.', 'http://exemplo.com/imagens/handstand-push-ups.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(31, 'Ring Dips', 'Dips realizados usando anéis de ginástica.', 'http://exemplo.com/imagens/ring-dips.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(32, 'Sit-Ups', 'Exercício clássico para trabalhar os abdominais.', 'http://exemplo.com/imagens/sit-ups.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(33, 'Push-Ups', 'Exercício de flexão clássico para trabalhar o peitoral, ombros e tríceps.', 'http://exemplo.com/imagens/push-ups.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(34, 'Rowing', 'Exercício cardiovascular realizado em um remo ergométrico.', 'http://exemplo.com/imagens/rowing.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(35, 'Jump Rope', 'Pular corda para desenvolver coordenação e condicionamento cardiovascular.', 'http://exemplo.com/imagens/jump-rope.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(36, 'Running', 'Corrida para distâncias variadas para desenvolver resistência.', 'http://exemplo.com/imagens/running.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(37, 'Walking Lunges', 'Variação de lunges onde você avança continuamente para frente.', 'http://exemplo.com/imagens/walking-lunges.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(38, 'Bear Crawl', 'Movimento quadripedal onde você se move para frente sobre as mãos e pés.', 'http://exemplo.com/imagens/bear-crawl.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(39, 'Turkish Get-Up', 'Movimento complexo que envolve deitar-se no chão e levantar-se enquanto segura um peso.', 'http://exemplo.com/imagens/turkish-get-up.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(40, 'Pistol Squat', 'Agachamento realizado em uma perna só, exigindo força e equilíbrio.', 'http://exemplo.com/imagens/pistol-squat.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(41, 'Push Press', 'Pressionar um peso acima da cabeça usando um impulso inicial dos membros inferiores.', 'http://exemplo.com/imagens/push-press.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(42, 'Bench Press', 'Exercício de pressão de peito realizado em um banco.', 'http://exemplo.com/imagens/bench-press.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(43, 'Rope Climb', 'Exercício de subir em corda, requerendo força do braço e técnica.', 'http://exemplo.com/imagens/rope-climb.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(44, 'Farmer s Walk', 'Caminhada carregando pesos pesados em ambas as mãos.', 'http://exemplo.com/imagens/farmers-walk.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(45, 'Sled Push/Pull', 'Empurrar ou puxar um trenó carregado com pesos.', 'http://exemplo.com/imagens/sled-push-pull.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(46, 'Ball Slam', 'Levantar uma bola medicinal pesada acima da cabeça e então jogá-la no chão com força.', 'http://exemplo.com/imagens/ball-slam.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(47, 'Goblet Squat', 'Variação de agachamento segurando um peso na frente do peito.', 'http://exemplo.com/imagens/goblet-squat.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(48, 'Single-arm Dumbbell Snatch', 'Levantamento de um haltere com um braço, do chão diretamente acima da cabeça.', 'http://exemplo.com/imagens/single-arm-dumbbell-snatch.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(49, 'Dumbbell Thruster', 'Combinação de um agachamento seguido por um press de haltere.', 'http://exemplo.com/imagens/dumbbell-thruster.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(50, 'Sandbag Clean', 'Levantamento de um saco de areia do chão até os ombros.', 'http://exemplo.com/imagens/sandbag-clean.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(51, 'L-Sit', 'Exercício abdominal onde você se mantém suspenso com as pernas estendidas em um ângulo de 90 graus.', 'http://exemplo.com/imagens/l-sit.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(52, 'Handstand Walk', 'Andar sobre as mãos, mantendo o corpo na posição vertical.', 'http://exemplo.com/imagens/handstand-walk.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35'),
(53, 'Assault Bike', 'Exercício cardiovascular feito em uma bicicleta ergométrica especial que também envolve os braços.', 'http://exemplo.com/imagens/assault-bike.jpg', '2023-12-18 19:01:35', '2023-12-18 19:01:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicios_parte`
--

CREATE TABLE `exercicios_parte` (
  `parte_id` int(11) NOT NULL,
  `exercicio_id` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exercicios_parte`
--

INSERT INTO `exercicios_parte` (`parte_id`, `exercicio_id`, `createdAt`, `updatedAt`) VALUES
(7, 1, '2023-12-15 12:17:34', '2023-12-15 12:17:34'),
(8, 2, '2023-12-15 12:17:34', '2023-12-15 12:17:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `partesaulas`
--

CREATE TABLE `partesaulas` (
  `id` int(11) NOT NULL,
  `aula_id` int(11) NOT NULL,
  `tipo_tempo_id` int(11) NOT NULL,
  `duracao` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Estrutura para tabela `tiposcontroletempos`
--

CREATE TABLE `tiposcontroletempos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, 'EMOM', 'Every Minute on the Minute, realizar um exercício específico a cada início de minuto.'),
(7, 'AMRAP (As Many Rounds/Reps As Possible)', NULL),
(8, 'EMOM (Every Minute on the Minute)', NULL),
(9, 'For Time', NULL),
(10, 'Tabata', NULL),
(11, 'RFT (Rounds For Time)', NULL),
(12, 'Chipper', NULL),
(13, 'Ladder', NULL);

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
  `data_cadastro` date NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha_hash`, `tipo`, `data_cadastro`, `createdAt`, `updatedAt`) VALUES
(1, 'Nome do Coach 1', 'email1@exemplo.com', 'senha_hash', 'coach', '2023-12-11', '2023-12-15 12:18:48', '2023-12-15 12:18:48'),
(2, 'Nome do Coach 2', 'email2@exemplo.com', 'senha_hash', 'coach', '2023-12-11', '2023-12-15 12:18:48', '2023-12-15 12:18:48');

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
-- Índices de tabela `partesaulas`
--
ALTER TABLE `partesaulas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `partes_aula`
--
ALTER TABLE `partes_aula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aula_id` (`aula_id`),
  ADD KEY `tipo_tempo_id` (`tipo_tempo_id`);

--
-- Índices de tabela `tiposcontroletempos`
--
ALTER TABLE `tiposcontroletempos`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `partesaulas`
--
ALTER TABLE `partesaulas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `partes_aula`
--
ALTER TABLE `partes_aula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tiposcontroletempos`
--
ALTER TABLE `tiposcontroletempos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipos_controle_tempo`
--
ALTER TABLE `tipos_controle_tempo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
