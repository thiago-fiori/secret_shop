CREATE DATABASE `secretshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

-- secretshop.cliente definition

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `atributo` varchar(3) NOT NULL,
  `vida` int(11) NOT NULL,
  `mana` int(11) NOT NULL,
  `dano` int(11) NOT NULL,
  `forca` decimal(4,1) DEFAULT NULL,
  `agilidade` decimal(4,1) DEFAULT NULL,
  `inteligencia` decimal(4,1) DEFAULT NULL,
  `armadura` decimal(4,1) DEFAULT NULL,
  `velocidadeDeAtaque` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- secretshop.item definition

CREATE TABLE `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `preco` int(11) NOT NULL,
  `forca` decimal(4,1) DEFAULT NULL,
  `agilidade` decimal(4,1) DEFAULT NULL,
  `inteligencia` decimal(4,1) DEFAULT NULL,
  `vida` decimal(5,2) DEFAULT NULL,
  `mana` decimal(5,2) DEFAULT NULL,
  `dano` int(11) DEFAULT NULL,
  `armadura` decimal(4,1) DEFAULT NULL,
  `velocidadeDeAtaque` decimal(4,1) DEFAULT NULL,
  `habilidadeAtiva` varchar(30) DEFAULT NULL,
  `descricaoAtiva` varchar(500) DEFAULT NULL,
  `habilidadePassiva` varchar(30) DEFAULT NULL,
  `descricaoPassiva` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- secretshop.composicao definition

CREATE TABLE `composicao` (
  `idItem` int(11) NOT NULL,
  `idItemBase` int(11) NOT NULL,
  PRIMARY KEY (`idItem`,`idItemBase`),
  KEY `composicao_FK_1` (`idItemBase`),
  CONSTRAINT `composicao_FK` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `composicao_FK_1` FOREIGN KEY (`idItemBase`) REFERENCES `item` (`idItem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- secretshop.estoque definition

CREATE TABLE `estoque` (
  `idItem` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idItem`),
  CONSTRAINT `estoque_FK` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- secretshop.mochila definition

CREATE TABLE `mochila` (
  `idCliente` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`,`idItem`),
  KEY `mochila_FK_1` (`idItem`),
  CONSTRAINT `mochila_FK` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mochila_FK_1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;