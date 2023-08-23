CREATE TABLE TB_AMOSTRAS(
  id_amostra number(5) NOT NULL,
  id_proprietario number(5) NOT NULL,
  localizacao varchar2(60)NOT NULL ,
  data_coleta date NOT NULL,
  profundidade number(10,2) NOT NULL
);

ALTER TABLE TB_AMOSTRAS ADD CONSTRAINT id_amostra PRIMARY KEY(id_amostra);
ALTER TABLE TB_AMOSTRAS ADD CONSTRAINT id_proprietario FOREIGN KEY (id_proprietario)
REFERENCES PROPRIETARIO (id_proprietario);
 
CREATE TABLE PROPRIETARIO (
    id_proprietario NUMBER(5) NOT NULL,
    nome VARCHAR2(20) NOT NULL,
    sobrenome VARCHAR2(60)NOT NULL,
    telefone NUMBER(15) NOT NULL,
    CONSTRAINT PROPRIETARIO PRIMARY KEY (id_proprietario)
);

CREATE TABLE ELEMENTOS_QUIMICOS(
    id_elemento NUMBER(5) NOT NULL,
    nome VARCHAR2(30) NOT NULL,
    simbolo VARCHAR2(5) NOT NULL,
    numero_atomico NUMBER(15,5) NOT NULL,
    massa_atomica NUMBER(15,5) NOT NULL,
    CONSTRAINT PROPRIETARIO PRIMARY KEY (id_elemento)
);

CREATE TABLE ANALISE(
    id_analise NUMBER(5) NOT NULL,
    nome VARCHAR2(60) NOT NULL,
    descricao VARCHAR2(128),
    CONSTRAINT PROPRIETARIO PRIMARY KEY (id_analise)
);

CREATE TABLE RESULTADO(
    id_resultado NUMBER(5) NOT NULL,
    id_amostra NUMBER(5) NOT NULL,
    id_analise NUMBER(5) NOT NULL,
    id_elemento NUMBER(5) NOT NULL,
    valor NUMBER(10,2)
);

ALTER TABLE RESULTADO ADD CONSTRAINT id_resultado PRIMARY KEY(id_resultado);
ALTER TABLE RESULTADO ADD CONSTRAINT id_amostra FOREIGN KEY (id_amostra)
REFERENCES TB_AMOSTRAS (id_amostra); 
ALTER TABLE RESULTADO ADD CONSTRAINT id_analise FOREIGN KEY (id_analise)
REFERENCES ANALISE (id_analise); 
ALTER TABLE RESULTADO ADD CONSTRAINT id_elemento FOREIGN KEY (id_elemento)
REFERENCES ELEMENTOS_QUIMICOS (id_elementos);

DROP TABLE ANALISE;
COMMIT;