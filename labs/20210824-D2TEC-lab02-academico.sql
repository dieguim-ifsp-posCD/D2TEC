drop database IF EXISTS academico;
Create database if not exists academico;
use academico;

-- criacao de tabelas 
CREATE TABLE if not exists CURSO
(
  CODCURSO  CHAR (3) NOT NULL,
  NOME    CHAR (30),
  MENSALIDADE FLOAT,
  PRIMARY KEY (CODCURSO)
);

CREATE TABLE if not exists DISCIPLINA
(    CodDisc char(5) not null,
      Nome char(30),
      CodCurso char(5),
      NroCreditos int,
      PRIMARY KEY (CodDisc),
      FOREIGN KEY (CodCurso) REFERENCES CURSO(CODCURSO) on delete cascade
);

CREATE TABLE if not exists ALUNO
(
  RA	CHAR(9) ,
  RG	CHAR(9) ,
  NOME	CHAR(30),
  CODCURSO	CHAR(3) NULL,
 PRIMARY KEY (RA),
 FOREIGN KEY (CODCURSO) REFERENCES CURSO (CODCURSO) on delete set null
);

CREATE TABLE if not exists BOLETIM
(     Ra char(9) ,
      CodDisc  char(5) ,
      NotaAlu  decimal(6,2),
      PRIMARY KEY (Ra,CodDisc),
      FOREIGN KEY (Ra) REFERENCES ALUNO (Ra) on delete cascade ,
      FOREIGN KEY (CodDisc) REFERENCES DISCIPLINA(CodDisc) on delete cascade 
);

-- insercao de dados
insert into CURSO VALUES ('AS','ANALISE DE SISTEMAS',1000);
insert into CURSO VALUES ('CC','CIENCIA DA COMPUTACAO',950);
insert into CURSO VALUES ('SI','SISTEMAS DE INFORMACAO',800);

insert into ALUNO VALUES ('123','12345','BIANCA MARIA PEDROSA','AS ');
insert into ALUNO VALUES ('212','21234','TATIANE CITTON','AS');
insert into ALUNO VALUES ('221','22145','ALEXANDRE PEDROSA ','CC'); 
insert into ALUNO VALUES ('231','23144','ALEXANDRE MONTEIRO','CC'); 
insert into ALUNO VALUES ('321','32111','MARCIA RIBEIRO ','CC'); 
insert into ALUNO VALUES ('661','66123','JUSSARA MARANDOLA','SI'); 
insert into ALUNO VALUES ('765','76512','WALTER RODRIGUES','SI'); 

insert into DISCIPLINA values ('BD','BANCO DE DADOS','CC',4);
insert into DISCIPLINA values ('BDA','BANCO DE DADOS AVANCADOS','CC',6);
insert into DISCIPLINA values ('BDOO','BANCO DE DADOS O OBJETOS','SI',4);

insert into BOLETIM values ('123','BD',10);
insert into BOLETIM values ('212','BDA',7.5);
insert into BOLETIM values ('231','BD',9);
insert into BOLETIM values ('231','BDA',9.6);
insert into BOLETIM values ('661','BDOO',8);
insert into BOLETIM values ('765','BDA',6);