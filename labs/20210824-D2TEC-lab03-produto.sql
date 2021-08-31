DROP DATABASE If EXISTS PRODUTO;
CREATE DATABASE Produto;
USE Produto;
-- -----------------------------------------------------
-- Table  Fornecedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  Fornecedor
(   idFornecedor  INT NOT NULL,
   Nome  VARCHAR(45) NULL,
   CNPJ  VARCHAR(20) NULL, 
   Endereco  VARCHAR(45) NULL,
   PRIMARY KEY ( idFornecedor )
) engine='innodb';
-- -----------------------------------------------------
-- Table  Produto 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  Produto  (
   idProduto  INT NOT NULL,
   Nome  VARCHAR(45) NULL,
   Preco  DECIMAL(8,2) NULL,
   idFornecedor  INT NULL,
  PRIMARY KEY ( idProduto ),
  FOREIGN KEY ( idFornecedor ) REFERENCES  Fornecedor  ( idFornecedor ) ON DELETE NO ACTION ON UPDATE NO ACTION
)engine='innodb';
-- -----------------------------------------------------
-- Table  Cliente 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  Cliente  (
   idCliente  INT NOT NULL,
   Nome  VARCHAR(45) NULL,
   CPF  VARCHAR(20) NULL,
   Endereco  VARCHAR(45) NULL,
  PRIMARY KEY ( idCliente )
)engine="innodb";
-- -----------------------------------------------------
-- Table  Compra 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  Compra  (
   idCompra  INT NOT NULL,
   dataCompra  DATE NULL,
   dataVencimento  DATE NULL,
   FormaPagto  VARCHAR(45) NULL,
   idCliente  INT NOT NULL,
  PRIMARY KEY ( idCompra ),
  FOREIGN KEY ( idCliente ) REFERENCES  Cliente  ( idCliente )
    ON DELETE NO ACTION    ON UPDATE NO ACTION
)engine='innodb';
-- -----------------------------------------------------
-- Table  Compra_has_Produto 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  Itens_Compra  (
   idCompra  INT NOT NULL,
   idProduto  INT NOT NULL,
   quantidade  INT NULL,
  PRIMARY KEY ( idCompra ,  idProduto ),
  FOREIGN KEY ( idCompra )  REFERENCES  Compra  ( idCompra )
    ON DELETE NO ACTION    ON UPDATE NO ACTION,
  FOREIGN KEY ( idProduto ) REFERENCES  Produto  ( idProduto )
    ON DELETE NO ACTION  ON UPDATE NO ACTION
)engine='innodb';

INSERT INTO Cliente values
(222,'João Souza','243456','Rua das Orquideas,300 - Bragança Pta'),
(201, 'Pedro Oliveira','231213', 'Rua das Hortências, 100 - Bragança Pta'),
(321 , 'Maria Souza', '121234','Rua das Pedras ,20 - Bragança Pta'),
(421 , 'Ana Freire', '198716','Rua das Hortências,200 - Campinas'),
(545 , 'Silvia Oliveira', '878765', 'Rua das Hortências,300 - Bragança Pta');

INSERT INTO Fornecedor values
(1, "CHAMEX","123123123","Rua Mogi das CRuzes, 101 Sao Paulo"),
(2, "HP","321123444","Rua da Fecilidade, 121 Sao Paulo"),
(3, "Elgin","667162432","Rua Fuxuco, 232 Rio de janeiro");

INSERT INTO Produto VALUES 
(1,'Papel A4',14.00,1),
(2,'Cartucho HP',45.00,2),
(3,'Etiqueta CD',17.00,1),
(4,'Cd RW',5.00,2),
(5,'Cd R',2.00,2);

INSERT INTO COMPRA VALUES
(10, "2020-04-1","2020-05-02","CC", 201),
(20, "2020-04-1","2020-05-02","CC", 321),
(30, "2020-04-5","2020-05-02","CC", 421),
(100, "2020-04-10","2020-05-02","CC", 421),
(112, "2020-04-10","2020-05-02","CC", 201);


INSERT INTO Itens_Compra VALUES
(10,1,1),
(10,2,1),
(10,3,1),
(20,1,20),
(20,4,1),
(30,1,10),
(30,2,1),
(100,1,10),
(112,5,1);
