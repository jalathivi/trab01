
CREATE TABLE CIDADAO (
    cod_cidadao INTEGER,
    nome VARCHAR(100),
    senha VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_cidadao PRIMARY KEY(cod_cidadao)
);

CREATE TABLE MOTORISTA (
    cod_motorista INTEGER,
    nome VARCHAR(100),
    cnh VARCHAR(11) UNIQUE,
    CONSTRAINT pk_motorista PRIMARY KEY(cod_motorista)
);

CREATE TABLE MARCA (
    cod_marca INTEGER,
    nome VARCHAR(100) UNIQUE,
    CONSTRAINT pk_marca PRIMARY KEY(cod_marca)
);

CREATE TABLE MODELO (
    cod_modelo INTEGER,
    nome VARCHAR(100),
    ano INTEGER,
    cod_marca INTEGER NOT NULL,
    CONSTRAINT pk_modelo PRIMARY KEY(cod_modelo),
    CONSTRAINT fk_marca_modelo FOREIGN KEY (cod_marca) REFERENCES MARCA (cod_marca)   
);

CREATE TABLE CAMINHAO (
    cod_caminhao INTEGER,
    cod_modelo INTEGER NOT NULL,
    placa VARCHAR(7) UNIQUE,
    capacidade FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_caminhao PRIMARY KEY(cod_caminhao)
);

CREATE TABLE ALOCA (
    cod_motorista INTEGER NOT NULL,
    cod_caminhao INTEGER NOT NULL,
    data_alocacao DATE,
    hora_inic TIME,
    hora_fim TIME,
    CONSTRAINT fk_motorista_modelo FOREIGN KEY (cod_motorista) REFERENCES MOTORISTA (cod_motorista),
    CONSTRAINT fk_caminhao_modelo FOREIGN KEY (cod_caminhao) REFERENCES CAMINHAO (cod_caminhao)    
);

CREATE TABLE BAIRRO (
    cod_bairro INTEGER,
    nome VARCHAR(100) UNIQUE,
    CONSTRAINT pk_bairro PRIMARY KEY(cod_bairro)
);

CREATE TABLE LIXEIRA (
    cod_lixeira INTEGER ,
    cod_bairro INTEGER NOT NULL,
    capacidade FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_lixeira PRIMARY KEY(cod_lixeira),
    CONSTRAINT fk_bairro_lixeira FOREIGN KEY (cod_bairro) REFERENCES BAIRRO (cod_bairro)
);

CREATE TABLE STATUS (
    cod_status INTEGER,
    descricao VARCHAR(100) UNIQUE,
    CONSTRAINT pk_status PRIMARY KEY(cod_status)
);


CREATE TABLE COLETA (
    cod_coleta INTEGER,
    cod_lixeira INTEGER NOT NULL,
    cod_caminhao INTEGER,
    data_coleta DATE,
    hora_coleta TIME,
    volume FLOAT,
    CONSTRAINT pk_coleta PRIMARY KEY(cod_coleta),
    CONSTRAINT fk_caminhao_coleta FOREIGN KEY (cod_caminhao) REFERENCES CAMINHAO (cod_caminhao),
    CONSTRAINT fk_lixeira_coleta FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);

CREATE TABLE DESCARTE (
    cod_lixeira INTEGER NOT NULL,
    cod_cidadao INTEGER,
    data_descarte DATE,
    hora_descarte TIME,
    volume FLOAT,
    CONSTRAINT fk_cidadao_descarte FOREIGN KEY (cod_cidadao) REFERENCES CIDADAO (cod_cidadao),
    CONSTRAINT fk_lixeira_descarte FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);
 
CREATE TABLE SITUACAO_OPERACIONAL (
    cod_coleta INTEGER NOT NULL,
    cod_status INTEGER NOT NULL,
    CONSTRAINT fk_coleta_situacao_operacioanal FOREIGN KEY (cod_coleta) REFERENCES COLETA (cod_coleta),
    CONSTRAINT fk_status_situacao_operacioanal FOREIGN KEY (cod_status) REFERENCES STATUS (cod_status)
);

