SET foreign_key_checks = 0;
#
# TABLE STRUCTURE FOR: anexos
#

DROP TABLE IF EXISTS `anexos`;

CREATE TABLE `anexos` (
  `idAnexos` int(11) NOT NULL AUTO_INCREMENT,
  `anexo` varchar(45) DEFAULT NULL,
  `thumb` varchar(45) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `os_id` int(11) NOT NULL,
  PRIMARY KEY (`idAnexos`),
  KEY `fk_anexos_os1` (`os_id`),
  CONSTRAINT `fk_anexos_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: anotacoes_os
#

DROP TABLE IF EXISTS `anotacoes_os`;

CREATE TABLE `anotacoes_os` (
  `idAnotacoes` int(11) NOT NULL AUTO_INCREMENT,
  `anotacao` varchar(255) NOT NULL,
  `data_hora` datetime NOT NULL,
  `os_id` int(11) NOT NULL,
  PRIMARY KEY (`idAnotacoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: categorias
#

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `idCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(80) DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: ci_sessions
#

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f3qv4og0l50vdlsd3pkb1d62qr24rs2h', '::1', 1650884237, '__ci_last_regenerate|i:1650884237;nome|s:5:\"teste\";email|s:15:\"teste@teste.com\";url_image_user|s:36:\"7b13013d34516c9c05d1493cbe0d1a39.png\";id|s:1:\"1\";permissao|s:1:\"1\";logado|b:1;success|s:26:\"Foto alterada com sucesso.\";__ci_vars|a:1:{s:7:\"success\";s:3:\"old\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7n8o5d6ul3dhh3u0uii32thfdaabocbb', '::1', 1650884238, '__ci_last_regenerate|i:1650884237;nome|s:5:\"teste\";email|s:15:\"teste@teste.com\";url_image_user|s:36:\"7b13013d34516c9c05d1493cbe0d1a39.png\";id|s:1:\"1\";permissao|s:1:\"1\";logado|b:1;');


#
# TABLE STRUCTURE FOR: clientes
#

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(255) NOT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `pessoa_fisica` tinyint(1) NOT NULL DEFAULT 1,
  `documento` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `dataCadastro` date DEFAULT NULL,
  `rua` varchar(70) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `contato` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `fornecedor` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: cobrancas
#

DROP TABLE IF EXISTS `cobrancas`;

CREATE TABLE `cobrancas` (
  `idCobranca` int(11) NOT NULL AUTO_INCREMENT,
  `charge_id` varchar(255) DEFAULT NULL,
  `conditional_discount_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `custom_id` int(11) DEFAULT NULL,
  `expire_at` date NOT NULL,
  `message` varchar(255) NOT NULL,
  `payment_method` varchar(11) DEFAULT NULL,
  `payment_url` varchar(255) DEFAULT NULL,
  `request_delivery_address` varchar(64) DEFAULT NULL,
  `status` varchar(36) NOT NULL,
  `total` varchar(15) DEFAULT NULL,
  `barcode` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `payment_gateway` varchar(255) DEFAULT NULL,
  `payment` varchar(64) NOT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `vendas_id` int(11) DEFAULT NULL,
  `os_id` int(11) DEFAULT NULL,
  `clientes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCobranca`),
  KEY `fk_cobrancas_os1` (`os_id`),
  KEY `fk_cobrancas_vendas1` (`vendas_id`),
  KEY `fk_cobrancas_clientes1` (`clientes_id`),
  CONSTRAINT `fk_cobrancas_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobrancas_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobrancas_vendas1` FOREIGN KEY (`vendas_id`) REFERENCES `vendas` (`idVendas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: configuracoes
#

DROP TABLE IF EXISTS `configuracoes`;

CREATE TABLE `configuracoes` (
  `idConfig` int(11) NOT NULL AUTO_INCREMENT,
  `config` varchar(20) NOT NULL,
  `valor` text DEFAULT NULL,
  PRIMARY KEY (`idConfig`),
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (2, 'app_name', 'Map-OS');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (3, 'app_theme', 'white');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (4, 'per_page', '10');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (5, 'os_notification', 'cliente');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (6, 'control_estoque', '1');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (7, 'notifica_whats', 'Prezado(a), {CLIENTE_NOME} a OS de nº {NUMERO_OS} teve o status alterado para :{STATUS_OS} segue a descrição {DESCRI_PRODUTOS} com valor total de {VALOR_OS}!\r\n Para mais informações entre em contato conosco.\r\n Atenciosamente, {EMITENTE} {TELEFONE_EMITENTE}.');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (8, 'control_baixa', '0');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (9, 'control_editos', '1');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (10, 'control_datatable', '1');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (11, 'pix_key', '');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (12, 'os_status_list', '[\"Aberto\",\"Faturado\",\"Negocia\\u00e7\\u00e3o\",\"Em Andamento\",\"Or\\u00e7amento\",\"Finalizado\",\"Cancelado\",\"Aguardando Pe\\u00e7as\",\"Aprovado\"]');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (13, 'control_edit_vendas', '1');
INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES (14, 'email_automatico', '1');


#
# TABLE STRUCTURE FOR: contas
#

DROP TABLE IF EXISTS `contas`;

CREATE TABLE `contas` (
  `idContas` int(11) NOT NULL AUTO_INCREMENT,
  `conta` varchar(45) DEFAULT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `tipo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idContas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: documentos
#

DROP TABLE IF EXISTS `documentos`;

CREATE TABLE `documentos` (
  `idDocumentos` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(70) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `categoria` varchar(80) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `tamanho` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDocumentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: email_queue
#

DROP TABLE IF EXISTS `email_queue`;

CREATE TABLE `email_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(255) NOT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `status` enum('pending','sending','sent','failed') DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: emitente
#

DROP TABLE IF EXISTS `emitente`;

CREATE TABLE `emitente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `ie` varchar(50) DEFAULT NULL,
  `rua` varchar(70) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url_logo` varchar(225) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: equipamentos
#

DROP TABLE IF EXISTS `equipamentos`;

CREATE TABLE `equipamentos` (
  `idEquipamentos` int(11) NOT NULL AUTO_INCREMENT,
  `equipamento` varchar(150) NOT NULL,
  `num_serie` varchar(80) DEFAULT NULL,
  `modelo` varchar(80) DEFAULT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `tensao` varchar(45) DEFAULT NULL,
  `potencia` varchar(45) DEFAULT NULL,
  `voltagem` varchar(45) DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `marcas_id` int(11) DEFAULT NULL,
  `clientes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipamentos`),
  KEY `fk_equipanentos_marcas1_idx` (`marcas_id`),
  KEY `fk_equipanentos_clientes1_idx` (`clientes_id`),
  CONSTRAINT `fk_equipanentos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipanentos_marcas1` FOREIGN KEY (`marcas_id`) REFERENCES `marcas` (`idMarcas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: equipamentos_os
#

DROP TABLE IF EXISTS `equipamentos_os`;

CREATE TABLE `equipamentos_os` (
  `idEquipamentos_os` int(11) NOT NULL AUTO_INCREMENT,
  `defeito_declarado` varchar(200) DEFAULT NULL,
  `defeito_encontrado` varchar(200) DEFAULT NULL,
  `solucao` varchar(45) DEFAULT NULL,
  `equipamentos_id` int(11) DEFAULT NULL,
  `os_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipamentos_os`),
  KEY `fk_equipamentos_os_equipanentos1_idx` (`equipamentos_id`),
  KEY `fk_equipamentos_os_os1_idx` (`os_id`),
  CONSTRAINT `fk_equipamentos_os_equipanentos1` FOREIGN KEY (`equipamentos_id`) REFERENCES `equipamentos` (`idEquipamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipamentos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: garantias
#

DROP TABLE IF EXISTS `garantias`;

CREATE TABLE `garantias` (
  `idGarantias` int(11) NOT NULL AUTO_INCREMENT,
  `dataGarantia` date DEFAULT NULL,
  `refGarantia` varchar(15) DEFAULT NULL,
  `textoGarantia` text DEFAULT NULL,
  `usuarios_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGarantias`),
  KEY `fk_garantias_usuarios1` (`usuarios_id`),
  CONSTRAINT `fk_garantias_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: itens_de_vendas
#

DROP TABLE IF EXISTS `itens_de_vendas`;

CREATE TABLE `itens_de_vendas` (
  `idItens` int(11) NOT NULL AUTO_INCREMENT,
  `subTotal` varchar(45) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco` varchar(15) DEFAULT NULL,
  `vendas_id` int(11) NOT NULL,
  `produtos_id` int(11) NOT NULL,
  PRIMARY KEY (`idItens`),
  KEY `fk_itens_de_vendas_vendas1` (`vendas_id`),
  KEY `fk_itens_de_vendas_produtos1` (`produtos_id`),
  CONSTRAINT `fk_itens_de_vendas_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_de_vendas_vendas1` FOREIGN KEY (`vendas_id`) REFERENCES `vendas` (`idVendas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: lancamentos
#

DROP TABLE IF EXISTS `lancamentos`;

CREATE TABLE `lancamentos` (
  `idLancamentos` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` varchar(15) NOT NULL,
  `desconto` decimal(10,2) DEFAULT 0.00,
  `valor_desconto` decimal(10,2) DEFAULT 0.00,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `baixado` tinyint(1) DEFAULT 0,
  `cliente_fornecedor` varchar(255) DEFAULT NULL,
  `forma_pgto` varchar(100) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `anexo` varchar(250) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `clientes_id` int(11) DEFAULT NULL,
  `categorias_id` int(11) DEFAULT NULL,
  `contas_id` int(11) DEFAULT NULL,
  `vendas_id` int(11) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`idLancamentos`),
  KEY `fk_lancamentos_clientes1` (`clientes_id`),
  KEY `fk_lancamentos_categorias1_idx` (`categorias_id`),
  KEY `fk_lancamentos_contas1_idx` (`contas_id`),
  KEY `fk_lancamentos_usuarios1` (`usuarios_id`),
  CONSTRAINT `fk_lancamentos_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`idCategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lancamentos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lancamentos_contas1` FOREIGN KEY (`contas_id`) REFERENCES `contas` (`idContas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lancamentos_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: logs
#

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `idLogs` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) DEFAULT NULL,
  `tarefa` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLogs`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `logs` (`idLogs`, `usuario`, `tarefa`, `data`, `hora`, `ip`) VALUES (1, 'teste', 'Efetuou login no sistema', '2022-04-25', '12:41:48', '::1');
INSERT INTO `logs` (`idLogs`, `usuario`, `tarefa`, `data`, `hora`, `ip`) VALUES (2, 'teste', 'Alterou a Imagem do Usuario.', '2022-04-25', '12:42:13', '::1');


#
# TABLE STRUCTURE FOR: marcas
#

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `idMarcas` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `situacao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idMarcas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: migrations
#

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `migrations` (`version`) VALUES ('20210125173741');


#
# TABLE STRUCTURE FOR: os
#

DROP TABLE IF EXISTS `os`;

CREATE TABLE `os` (
  `idOs` int(11) NOT NULL AUTO_INCREMENT,
  `dataInicial` date DEFAULT NULL,
  `dataFinal` date DEFAULT NULL,
  `garantia` varchar(45) DEFAULT NULL,
  `descricaoProduto` text DEFAULT NULL,
  `defeito` text DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `laudoTecnico` text DEFAULT NULL,
  `valorTotal` varchar(15) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT 0.00,
  `valor_desconto` decimal(10,2) DEFAULT 0.00,
  `clientes_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `lancamento` int(11) DEFAULT NULL,
  `faturado` tinyint(1) NOT NULL,
  `garantias_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOs`),
  KEY `fk_os_clientes1` (`clientes_id`),
  KEY `fk_os_usuarios1` (`usuarios_id`),
  KEY `fk_os_lancamentos1` (`lancamento`),
  KEY `fk_os_garantias1` (`garantias_id`),
  CONSTRAINT `fk_os_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_lancamentos1` FOREIGN KEY (`lancamento`) REFERENCES `lancamentos` (`idLancamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: permissoes
#

DROP TABLE IF EXISTS `permissoes`;

CREATE TABLE `permissoes` (
  `idPermissao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `permissoes` text DEFAULT NULL,
  `situacao` tinyint(1) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO `permissoes` (`idPermissao`, `nome`, `permissoes`, `situacao`, `data`) VALUES (1, 'Administrador', 'a:53:{s:8:\"aCliente\";s:1:\"1\";s:8:\"eCliente\";s:1:\"1\";s:8:\"dCliente\";s:1:\"1\";s:8:\"vCliente\";s:1:\"1\";s:8:\"aProduto\";s:1:\"1\";s:8:\"eProduto\";s:1:\"1\";s:8:\"dProduto\";s:1:\"1\";s:8:\"vProduto\";s:1:\"1\";s:8:\"aServico\";s:1:\"1\";s:8:\"eServico\";s:1:\"1\";s:8:\"dServico\";s:1:\"1\";s:8:\"vServico\";s:1:\"1\";s:3:\"aOs\";s:1:\"1\";s:3:\"eOs\";s:1:\"1\";s:3:\"dOs\";s:1:\"1\";s:3:\"vOs\";s:1:\"1\";s:6:\"aVenda\";s:1:\"1\";s:6:\"eVenda\";s:1:\"1\";s:6:\"dVenda\";s:1:\"1\";s:6:\"vVenda\";s:1:\"1\";s:9:\"aGarantia\";s:1:\"1\";s:9:\"eGarantia\";s:1:\"1\";s:9:\"dGarantia\";s:1:\"1\";s:9:\"vGarantia\";s:1:\"1\";s:8:\"aArquivo\";s:1:\"1\";s:8:\"eArquivo\";s:1:\"1\";s:8:\"dArquivo\";s:1:\"1\";s:8:\"vArquivo\";s:1:\"1\";s:10:\"aPagamento\";N;s:10:\"ePagamento\";N;s:10:\"dPagamento\";N;s:10:\"vPagamento\";N;s:11:\"aLancamento\";s:1:\"1\";s:11:\"eLancamento\";s:1:\"1\";s:11:\"dLancamento\";s:1:\"1\";s:11:\"vLancamento\";s:1:\"1\";s:8:\"cUsuario\";s:1:\"1\";s:9:\"cEmitente\";s:1:\"1\";s:10:\"cPermissao\";s:1:\"1\";s:7:\"cBackup\";s:1:\"1\";s:10:\"cAuditoria\";s:1:\"1\";s:6:\"cEmail\";s:1:\"1\";s:8:\"cSistema\";s:1:\"1\";s:8:\"rCliente\";s:1:\"1\";s:8:\"rProduto\";s:1:\"1\";s:8:\"rServico\";s:1:\"1\";s:3:\"rOs\";s:1:\"1\";s:6:\"rVenda\";s:1:\"1\";s:11:\"rFinanceiro\";s:1:\"1\";s:9:\"aCobranca\";s:1:\"1\";s:9:\"eCobranca\";s:1:\"1\";s:9:\"dCobranca\";s:1:\"1\";s:9:\"vCobranca\";s:1:\"1\";}', 1, '2022-04-25');


#
# TABLE STRUCTURE FOR: produtos
#

DROP TABLE IF EXISTS `produtos`;

CREATE TABLE `produtos` (
  `idProdutos` int(11) NOT NULL AUTO_INCREMENT,
  `codDeBarra` varchar(70) NOT NULL,
  `descricao` varchar(80) NOT NULL,
  `unidade` varchar(10) DEFAULT NULL,
  `precoCompra` decimal(10,2) DEFAULT NULL,
  `precoVenda` decimal(10,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `estoqueMinimo` int(11) DEFAULT NULL,
  `saida` tinyint(1) DEFAULT NULL,
  `entrada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: produtos_os
#

DROP TABLE IF EXISTS `produtos_os`;

CREATE TABLE `produtos_os` (
  `idProdutos_os` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `preco` varchar(15) DEFAULT NULL,
  `os_id` int(11) NOT NULL,
  `produtos_id` int(11) NOT NULL,
  `subTotal` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idProdutos_os`),
  KEY `fk_produtos_os_os1` (`os_id`),
  KEY `fk_produtos_os_produtos1` (`produtos_id`),
  CONSTRAINT `fk_produtos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_os_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: resets_de_senha
#

DROP TABLE IF EXISTS `resets_de_senha`;

CREATE TABLE `resets_de_senha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `token` varchar(255) NOT NULL,
  `data_expiracao` datetime NOT NULL,
  `token_utilizado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: servicos
#

DROP TABLE IF EXISTS `servicos`;

CREATE TABLE `servicos` (
  `idServicos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idServicos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: servicos_os
#

DROP TABLE IF EXISTS `servicos_os`;

CREATE TABLE `servicos_os` (
  `idServicos_os` int(11) NOT NULL AUTO_INCREMENT,
  `servico` varchar(80) DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  `preco` varchar(15) DEFAULT NULL,
  `os_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL,
  `subTotal` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idServicos_os`),
  KEY `fk_servicos_os_os1` (`os_id`),
  KEY `fk_servicos_os_servicos1` (`servicos_id`),
  CONSTRAINT `fk_servicos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicos_os_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`idServicos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: usuarios
#

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `rua` varchar(70) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `situacao` tinyint(1) NOT NULL,
  `dataCadastro` date NOT NULL,
  `permissoes_id` int(11) NOT NULL,
  `dataExpiracao` date DEFAULT NULL,
  `asaas_id` varchar(255) DEFAULT NULL,
  `url_image_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `fk_usuarios_permissoes1_idx` (`permissoes_id`),
  CONSTRAINT `fk_usuarios_permissoes1` FOREIGN KEY (`permissoes_id`) REFERENCES `permissoes` (`idPermissao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `usuarios` (`idUsuarios`, `nome`, `rg`, `cpf`, `cep`, `rua`, `numero`, `bairro`, `cidade`, `estado`, `email`, `senha`, `telefone`, `celular`, `situacao`, `dataCadastro`, `permissoes_id`, `dataExpiracao`, `asaas_id`, `url_image_user`) VALUES (1, 'teste', 'MG-25.502.560', '600.021.520-87', '70005-115', 'Rua Acima', '12', 'Alvorada', 'Teste', 'MG', 'teste@teste.com', '$2y$10$hYFMkrZzRJ//41.dl99Q5OeYpecibAipA1nAgPed1k67wdgV.hpjO', '000000-0000', '', 1, '2022-04-25', 1, '3000-01-01', NULL, '7b13013d34516c9c05d1493cbe0d1a39.png');


#
# TABLE STRUCTURE FOR: vendas
#

DROP TABLE IF EXISTS `vendas`;

CREATE TABLE `vendas` (
  `idVendas` int(11) NOT NULL AUTO_INCREMENT,
  `dataVenda` date DEFAULT NULL,
  `valorTotal` varchar(45) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT 0.00,
  `valor_desconto` decimal(10,2) DEFAULT 0.00,
  `faturado` tinyint(1) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `observacoes_cliente` text DEFAULT NULL,
  `clientes_id` int(11) NOT NULL,
  `usuarios_id` int(11) DEFAULT NULL,
  `lancamentos_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVendas`),
  KEY `fk_vendas_clientes1` (`clientes_id`),
  KEY `fk_vendas_usuarios1` (`usuarios_id`),
  KEY `fk_vendas_lancamentos1` (`lancamentos_id`),
  CONSTRAINT `fk_vendas_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_lancamentos1` FOREIGN KEY (`lancamentos_id`) REFERENCES `lancamentos` (`idLancamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET foreign_key_checks = 1;
