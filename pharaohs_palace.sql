-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 02-Fev-2018 às 00:04
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharaohs_palace`
--

-- --------------------------------------------------------
    create database pharaohs_palace;
    use pharaohs_palace;
--
-- Estrutura da tabela `t_funcionario`
--

CREATE TABLE `t_funcionario` (
  `COD_FUNC` tinyint(4) NOT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `LOGIN` varchar(30) DEFAULT NULL,
  `SENHA` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Armazena os funcionários do hotel';

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_hospedagem`
--

CREATE TABLE `t_hospedagem` (
  `COD_HOSPEDAGEM` int(11) DEFAULT NULL,
  `NUM_QUARTO` int(11) DEFAULT NULL,
  `COD_RESERVA` int(11) DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT NULL,
  `DATA_ENTRADA` datetime DEFAULT NULL,
  `DATA_SAIDA` datetime DEFAULT NULL,
  `VALOR_TOTAL` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relacionamento responsável por armazenar e definir os aspectos da hospedagem: quantidade de quartos reservados, status, valor total gasto e a data de entrada e de saída';

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_hospede`
--

CREATE TABLE `t_hospede` (
  `COD_HOSPEDE` int(11) NOT NULL,
  `TIPO_HOSPEDE` tinyint(4) DEFAULT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `TELEFONE` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Armazena os hospedes no bd';

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_quarto`
--

CREATE TABLE `t_quarto` (
  `NUM_QUARTO` int(11) NOT NULL,
  `COD_TIP_QUARTO` tinyint(4) DEFAULT NULL,
  `VALOR_QUARTO` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Armazena os dados dos quartos';

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_reserva`
--

CREATE TABLE `t_reserva` (
  `COD_RESERVA` int(11) NOT NULL,
  `COD_FUNC` tinyint(4) DEFAULT NULL,
  `COD_HOSP` int(11) DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Armazena as reservas que foram criadas';

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_tipo_hospede`
--

CREATE TABLE `t_tipo_hospede` (
  `COD_TIP_HOSP` tinyint(4) NOT NULL,
  `HOSP_DESC` varchar(30) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Define o tipo de hospede';

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_tipo_quarto`
--

CREATE TABLE `t_tipo_quarto` (
  `COD_TIP_QUARTO` tinyint(4) NOT NULL,
  `QTD_PESSOAS` tinyint(4) DEFAULT NULL,
  `FRIGOBAR` char(1) DEFAULT NULL,
  `BANHEIRO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Define o tipo de quarto (se contém banheiro, frigobar e a quantidade de pessoas)';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_funcionario`
--
ALTER TABLE `t_funcionario`
  ADD PRIMARY KEY (`COD_FUNC`);

--
-- Indexes for table `t_hospedagem`
--
ALTER TABLE `t_hospedagem`
  ADD KEY `FK_RESERVA_QUARTO` (`NUM_QUARTO`),
  ADD KEY `FK_QUARTO_RESERVA` (`COD_RESERVA`);

--
-- Indexes for table `t_hospede`
--
ALTER TABLE `t_hospede`
  ADD PRIMARY KEY (`COD_HOSPEDE`),
  ADD KEY `FK_TIP_HOSP_HOSPEDE` (`TIPO_HOSPEDE`);

--
-- Indexes for table `t_quarto`
--
ALTER TABLE `t_quarto`
  ADD PRIMARY KEY (`NUM_QUARTO`),
  ADD KEY `FK_TIP_QUART_QUARTO` (`COD_TIP_QUARTO`);

--
-- Indexes for table `t_reserva`
--
ALTER TABLE `t_reserva`
  ADD PRIMARY KEY (`COD_RESERVA`),
  ADD KEY `FK_FUNC_RESERVA` (`COD_FUNC`),
  ADD KEY `FK_HOSP_RESERVA` (`COD_HOSP`);

--
-- Indexes for table `t_tipo_hospede`
--
ALTER TABLE `t_tipo_hospede`
  ADD PRIMARY KEY (`COD_TIP_HOSP`);

--
-- Indexes for table `t_tipo_quarto`
--
ALTER TABLE `t_tipo_quarto`
  ADD PRIMARY KEY (`COD_TIP_QUARTO`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `t_hospedagem`
--
ALTER TABLE `t_hospedagem`
  ADD CONSTRAINT `FK_QUARTO_RESERVA` FOREIGN KEY (`COD_RESERVA`) REFERENCES `t_reserva` (`COD_RESERVA`),
  ADD CONSTRAINT `FK_RESERVA_QUARTO` FOREIGN KEY (`NUM_QUARTO`) REFERENCES `t_quarto` (`NUM_QUARTO`);

--
-- Limitadores para a tabela `t_hospede`
--
ALTER TABLE `t_hospede`
  ADD CONSTRAINT `FK_TIP_HOSP_HOSPEDE` FOREIGN KEY (`TIPO_HOSPEDE`) REFERENCES `t_tipo_hospede` (`COD_TIP_HOSP`);

--
-- Limitadores para a tabela `t_quarto`
--
ALTER TABLE `t_quarto`
  ADD CONSTRAINT `FK_TIP_QUART_QUARTO` FOREIGN KEY (`COD_TIP_QUARTO`) REFERENCES `t_tipo_quarto` (`COD_TIP_QUARTO`);

--
-- Limitadores para a tabela `t_reserva`
--
ALTER TABLE `t_reserva`
  ADD CONSTRAINT `FK_FUNC_RESERVA` FOREIGN KEY (`COD_FUNC`) REFERENCES `t_funcionario` (`COD_FUNC`),
  ADD CONSTRAINT `FK_HOSP_RESERVA` FOREIGN KEY (`COD_HOSP`) REFERENCES `t_hospede` (`COD_HOSPEDE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
