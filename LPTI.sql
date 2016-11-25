-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 25-Nov-2016 às 11:20
-- Versão do servidor: 5.5.47-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `LPTI`
--
CREATE DATABASE IF NOT EXISTS `LPTI` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `LPTI`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Categoria`
--

CREATE TABLE IF NOT EXISTS `Categoria` (
  `idCategoria` int(255) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `Categoria`
--

INSERT INTO `Categoria` (`idCategoria`, `nome`) VALUES
(1, 'Mini Curso');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Comentario`
--

CREATE TABLE IF NOT EXISTS `Comentario` (
  `idComentario` int(255) NOT NULL AUTO_INCREMENT,
  `idPost` int(255) DEFAULT NULL,
  `idUsuario` int(255) DEFAULT NULL,
  `textoComentario` longtext,
  `dataComentario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `fk_ComentPost_PostPost_idx` (`idPost`),
  KEY `fk_ComentUsr_UserUsr_idx` (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE IF NOT EXISTS `contatos` (
  `idcontato` int(255) NOT NULL AUTO_INCREMENT,
  `nomeContato` varchar(1000) DEFAULT NULL,
  `emailContato` varchar(1000) DEFAULT NULL,
  `comentarioContato` longtext,
  `data` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcontato`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Curso`
--

CREATE TABLE IF NOT EXISTS `Curso` (
  `idCurso` int(255) NOT NULL AUTO_INCREMENT,
  `nomeCurso` varchar(50) NOT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Disciplina`
--

CREATE TABLE IF NOT EXISTS `Disciplina` (
  `idDisciplina` int(255) NOT NULL AUTO_INCREMENT,
  `ementa` mediumblob,
  `nome` varchar(1000) NOT NULL,
  `creditos` int(255) NOT NULL,
  `Curso_idCurso` int(255) NOT NULL,
  `periodo` int(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`idDisciplina`),
  KEY `fk_Disciplina_Curso1_idx` (`Curso_idCurso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Evento`
--

CREATE TABLE IF NOT EXISTS `Evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `local` varchar(100) NOT NULL,
  `horario` time NOT NULL,
  `palestrante` varchar(50) NOT NULL,
  `tema` varchar(45) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `classificacao` int(255) NOT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `Evento`
--

INSERT INTO `Evento` (`idEvento`, `data`, `local`, `horario`, `palestrante`, `tema`, `descricao`, `classificacao`) VALUES
(1, '2016-11-29', 'cefet', '15:50:00', 'rafa', 'teste1', 'oi', 0),
(2, '2016-11-26', 'cefet', '16:50:00', 'rafa', 'teste2', 'teste2', 0),
(3, '2016-11-30', 'cefet', '14:14:00', 'carol', 'teste3', 'teste3', 0),
(4, '2016-11-30', 'cefet', '14:14:00', 'carol', 'teste3', 'teste3', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `EventoUsuario`
--

CREATE TABLE IF NOT EXISTS `EventoUsuario` (
  `Evento_idEvento` int(11) NOT NULL,
  `Usuario_idUsuario` int(255) NOT NULL,
  PRIMARY KEY (`Evento_idEvento`,`Usuario_idUsuario`),
  KEY `fk_Evento_has_Usuario_Usuario1_idx` (`Usuario_idUsuario`),
  KEY `fk_Evento_has_Usuario_Evento1_idx` (`Evento_idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Post`
--

CREATE TABLE IF NOT EXISTS `Post` (
  `idPost` int(255) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(255) DEFAULT NULL,
  `dataPost` varchar(50) DEFAULT NULL,
  `conteudoPost` longtext,
  `Tag` varchar(50) DEFAULT NULL,
  `Categoria_idCategoria` int(255) DEFAULT NULL,
  PRIMARY KEY (`idPost`),
  KEY `fk_Post_1_idx` (`idUsuario`),
  KEY `fk_Post_Categoria1_idx` (`Categoria_idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Extraindo dados da tabela `Post`
--

INSERT INTO `Post` (`idPost`, `idUsuario`, `dataPost`, `conteudoPost`, `Tag`, `Categoria_idCategoria`) VALUES
(19, 6, '25/11/2016', 'oioi', '#oi', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `TipoUsuario`
--

CREATE TABLE IF NOT EXISTS `TipoUsuario` (
  `idTipoUsuario` int(255) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `TipoUsuario`
--

INSERT INTO `TipoUsuario` (`idTipoUsuario`, `tipo`) VALUES
(1, 'Admin'),
(2, 'Aluno');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` int(255) NOT NULL AUTO_INCREMENT,
  `nome` varchar(1000) DEFAULT NULL,
  `sobrenome` varchar(1000) DEFAULT NULL,
  `senha` longtext,
  `email` varchar(1000) DEFAULT NULL,
  `identificacao` int(50) DEFAULT NULL,
  `TipoUsuario_idTipoUsuario` int(255) DEFAULT NULL,
  `Atividade` int(1) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_TipoUsuario1_idx` (`TipoUsuario_idTipoUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `Usuario`
--

INSERT INTO `Usuario` (`idUsuario`, `nome`, `sobrenome`, `senha`, `email`, `identificacao`, `TipoUsuario_idTipoUsuario`, `Atividade`) VALUES
(6, 'Carol', 'Marostica', '123123', 'carolsmarostica@gmail.com', 1, 1, 0),
(7, 'Rafa', 'Custodio', '4297f44b13955235245b2497399d7a93', 'rafa@gmail.com', 123456, 2, 0);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `Comentario`
--
ALTER TABLE `Comentario`
  ADD CONSTRAINT `fk_ComentPost_PostPost` FOREIGN KEY (`idPost`) REFERENCES `Post` (`idPost`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ComentUsr_UserUsr` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Disciplina`
--
ALTER TABLE `Disciplina`
  ADD CONSTRAINT `fk_Disciplina_Curso1` FOREIGN KEY (`Curso_idCurso`) REFERENCES `Curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `EventoUsuario`
--
ALTER TABLE `EventoUsuario`
  ADD CONSTRAINT `fk_Evento_has_Usuario_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_has_Usuario_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `fk_PostUsr_UserUsr` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Post_Categoria1` FOREIGN KEY (`Categoria_idCategoria`) REFERENCES `Categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `fk_Usuario_TipoUsuario1` FOREIGN KEY (`TipoUsuario_idTipoUsuario`) REFERENCES `TipoUsuario` (`idTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
