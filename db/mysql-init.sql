USE example_db;

DROP TABLE IF EXISTS `testtab`;

CREATE TABLE `testtab`
(
id INTEGER AUTO_INCREMENT,
name TEXT,
PRIMARY KEY (id)
) COMMENT='Tabela de teste!';

INSERT INTO `example_db`.`testtab` (`name`) 
VALUES 
("Teste1"),
("Teste2"),
("Teste3"),
("Teste4"),
("Teste5")
;

CREATE TABLE IF NOT EXISTS `tb_usuario`
( 
	id_usuario INT AUTO_INCREMENT PRIMARY KEY NOT NULL COMMENT 'CÓDIGO DO USUÁRIO',
	ds_login   VARCHAR(30) NOT NULL COMMENT 'LOGIN DO USUÁRIO PARA ACESSO AO SISTEMA',
	ds_senha   VARCHAR(30) NOT NULL COMMENT 'SENHA DO USUÁRIO PARA ACESSO AO SISTEMA'   	
)
;

CREATE TABLE IF NOT EXISTS  `tb_pessoa` (
  `id_pessoa`           int             NOT NULL AUTO_INCREMENT COMMENT 'CÃ“DIGO DA PESSOA',
  `nm_pessoa`           varchar(70)     NOT NULL COMMENT 'NOME DA PESSOA',
  `fl_sexo`             char(1)         NOT NULL COMMENT 'INFORMAR M OU F',
  `dt_cadastro`         datetime        NOT NULL COMMENT 'DATA DE CADASTRO DO REGISTRO',
  `ds_email`            varchar(80)     NOT NULL COMMENT 'EMAIL DA PESSOA',
  `ds_endereco`         varchar(200)    NOT NULL COMMENT 'DESCRIÃ‡ÃƒO DO ENDEREÃ‡O',
  `fl_origemCadastro`   char(1)         NOT NULL COMMENT 'ORIGEM DO CADASTRO (I) = INPUT OU (X) = XML',
  `id_usuario_cadastro` int             NOT NULL COMMENT 'USUÃRIO LOGADO QUE CADASTROU A PESSOA',
  PRIMARY KEY (`id_pessoa`),
  KEY `id_usuario_cadastro` (`id_usuario_cadastro`),
  CONSTRAINT `tb_pessoa_ibfk_1` FOREIGN KEY (`id_usuario_cadastro`) REFERENCES `tb_usuario` (`id_usuario`)
);

INSERT IGNORE INTO tb_usuario
    (ds_login, ds_senha)
VALUES
    ('admin','12345');