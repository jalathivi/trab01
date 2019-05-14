
CREATE TABLE CIDADAO (
    cod_cidadao INTEGER,
    nome VARCHAR(64),
    senha VARCHAR(16),
    email VARCHAR(64) UNIQUE,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_cidadao PRIMARY KEY(cod_cidadao)
);

CREATE TABLE COLETOR (
    cod_coletor INTEGER,
    placa VARCHAR(8),
    modelo VARCHAR(16),
    marca VARCHAR(16),
    ano INTEGER,
    capacidade FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_coletor PRIMARY KEY(cod_coletor)
);

CREATE TABLE BAIRRO (
    cod_bairro INTEGER,
    nome VARCHAR(32) UNIQUE,
    CONSTRAINT pk_bairro PRIMARY KEY(cod_bairro)
);

CREATE TABLE LIXEIRA (
    cod_lixeira INTEGER ,
    cod_regiao INTEGER,
    capacidade FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    nivel_atual FLOAT,
    CONSTRAINT pk_lixeira PRIMARY KEY(cod_lixeira),
    CONSTRAINT fk_bairro_lixeira FOREIGN KEY (cod_regiao) REFERENCES BAIRRO (cod_bairro)
);

CREATE TABLE STATUS (
    cod_status INTEGER,
    descricao VARCHAR(256) UNIQUE,
    CONSTRAINT pk_status PRIMARY KEY(cod_status)
);

CREATE TABLE SITUACAO_OPERACIONAL (
    cod_lixeira INTEGER,
    cod_coletor INTEGER,
    cod_status INTEGER,
    hora_status TIME,
    data_status DATE,
    CONSTRAINT fk_lixeira_situacao_operacioanal FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira),
    CONSTRAINT fk_coletor_situacao_operacioanal FOREIGN KEY (cod_coletor) REFERENCES COLETOR (cod_coletor),
    CONSTRAINT fk_status_situacao_operacioanal FOREIGN KEY (cod_status) REFERENCES STATUS (cod_status)
);

CREATE TABLE COLETA (
    cod_coletor INTEGER,
    cod_lixeira INTEGER,
    volume FLOAT,
    hora_coleta TIME,
    data_coleta DATE,
    CONSTRAINT fk_coletor_coleta FOREIGN KEY (cod_coletor) REFERENCES COLETOR (cod_coletor),
    CONSTRAINT fk_lixeira_coleta FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);

CREATE TABLE DESCARTE (
    cod_cidadao INTEGER,
    cod_lixeira INTEGER,
    volume FLOAT,
    data_descarte DATE,
    hora_descarte TIME,
    CONSTRAINT fk_cidadao_descarte FOREIGN KEY (cod_cidadao) REFERENCES CIDADAO (cod_cidadao),
    CONSTRAINT fk_lixeira_descarte FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);
 

