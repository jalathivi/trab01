/* Create */

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
    cod_bairro INTEGER,
    capacidade FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_lixeira PRIMARY KEY(cod_lixeira),
    CONSTRAINT fk_bairro_lixeira FOREIGN KEY (cod_bairro) REFERENCES BAIRRO (cod_bairro)
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
    nivel FLOAT,
    hora_coleta TIME,
    data_coleta DATE,
    CONSTRAINT fk_coletor_coleta FOREIGN KEY (cod_coletor) REFERENCES COLETOR (cod_coletor),
    CONSTRAINT fk_lixeira_coleta FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);

CREATE TABLE DESCARTE (
    cod_cidadao INTEGER,
    cod_lixeira INTEGER,
    nivel FLOAT,
    data_descarte DATE,
    hora_descarte TIME,
    CONSTRAINT fk_cidadao_descarte FOREIGN KEY (cod_cidadao) REFERENCES CIDADAO (cod_cidadao),
    CONSTRAINT fk_lixeira_descarte FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);




/* Insert */

INSERT INTO BAIRRO (cod_bairro, nome) VALUES 
	(1,'Grande Goiabeiras'),
	(2,'Centro de Vitória'),
	(3,'Colina de Laranjeiras'),
	(4,'Porto de Santana'),
	(5,'Carapina'),
	(6,'Jardim da Penha'),
	(7,'Jardim Camburi'),
	(8,'Manguinhos'),
	(9,'Mata da Praia'),
	(10,'Bento Ferreira');
	
	
INSERT INTO LIXEIRA (cod_lixeira, cod_bairro, capacidade, latitude, longitude) VALUES
	(0,1,160,-40.2555063,-20.1961361),
	(1,2,200,-40.2530861,-20.1982403),
	(2,3,235,-40.2580835,-20.1986875),
	(3,4,241,-40.2587904,-20.1959193),
	(4,5,100,-40.2568421,-20.1925205),
	(5,6,50,-40.2529013,-20.1932706),
	(6,7,35,-40.2515352,-20.1950812),
	(7,8,60,-40.2516228,-20.1969409),
	(8,9,120,-40.2512328,-20.1969499),
	(9,10,200,-40.2529328,-20.1969579);


INSERT INTO COLETOR (cod_coletor, placa, modelo, marca, ano, capacidade, latitude, longitude) VALUES
	(0,'MTR-3338','VEGALIX','Mercedes Benz',2016,10000,-40.2555063,-20.1961361),
	(1,'MTV-4311','SITA 6000','Volkswagen',2015,10000,-40.2530861,-20.1982403),
	(2,'MQZ-8687','VEGALIX','Mercedes Benz',2013,12000,-40.2580835,-20.1986875),
	(3,'MTB-1361','EZ PACK','Volvo',2015,15000,-40.2587904,-20.1959193),
	(4,'MSG-4883','EZ PACK','Volvo',2013,10000,-40.2568421,-20.1925205),
	(5,'MSZ-7251','COLECOM','Scania',2016,12000,-40.2529013,-20.1932706),
	(6,'MRB-6206','COLECOM','Scania',2019,10000,-40.2515352,-20.1950812),
	(7,'MRY-5351','EZ PACK','Volvo',2019,12000,-40.2516228,-20.1969409),
	(8,'MRF-7474','SITA 6000','Volkswagen',2016,12000,-40.2512928,-40.1349409),
	(9,'MSI-6750','EZ PACK','Volvo',2018,15000,-40.2006228,-40.1962209);

	
INSERT INTO CIDADAO (cod_cidadao, nome, email, senha, longitude, latitude) VALUES
	(6532,'Livinho Silve','livinho@gmail.com','12312',-20.0507711,-40.2209473),
	(6598,'Maria Joaquina','maria@hotmail.com','12342',-20.0868885,-40.2703857),
	(5652,'Marcelo Paiva','marcelo@hotmail.com','12345',-20.2003460,-40.2484131),
	(2326,'Livia Estrela','livia@hotmail.com','12344',-20.2621971,-40.3417969),
	(2323,'Kellen Andrade','kellen@gmail.com','12312',-20.3909744,-40.2978516),
	(231,'Maria Luisa','maria123@gmail.com','12341',-20.2055012,-40.2044678),
	(1235,'Lais Laticinio','lala888@hotmail.com','32134',-20.1745675,-40.3363037),
	(2356,'Orides Identico','oi123@gmail.com','43242',-20.2950455,-40.3054047),
	(2821,'Otavio Freitas','oooo111@gmail.com','11128',-19.2950455,-39.3054029),
	(1122,'Daniel Miranda','miranda_d@gmail.com','22345',-18.2930455,-38.3052043);


INSERT INTO STATUS (cod_status, descricao) VALUES
	(1,'Quebrada'),
	(2,'Não atende a demanda'),
	(3,'OK'),
	(4,'Em manutenção');


INSERT INTO SITUACAO_OPERACIONAL (cod_lixeira, cod_status, data_status, hora_status, cod_coletor) VALUES
	(0,1,'2019-03-19','09:30',0),
	(1,2,'2019-03-20','09:35',1),
	(2,3,'2019-03-21','09:42',2),
	(3,4,'2019-03-22','10:24',3),
	(4,2,'2019-03-23','10:30',4),
	(5,1,'2019-03-24','12:10',5),
	(6,2,'2019-03-25','12:20',6),
	(7,3,'2019-03-26','12:30',7),
	(8,3,'2019-03-20','13:00',8),
	(9,2,'2019-03-21','14:00',3);


INSERT INTO DESCARTE (cod_lixeira, cod_cidadao, nivel, data_descarte, hora_descarte) VALUES
	(0,6532,48.48,'2019-03-19','10:10'),
	(1,6598,78.79,'2019-03-20','11:22'),
	(2,5652,100.00,'2019-03-21','10:00'),
	(3,2326,18.18,'2019-03-22','13:01'),
	(4,2323,0.00,'2019-03-23','15:21'),
	(5,231,27.27,'2019-03-24','16:11'),
	(6,1235,10.30,'2019-03-25','17:11'),
	(7,2356,18.79,'2019-03-26','18:11'),
	(8,2821,89.47,'2019-03-27','18:38'),
	(9,1122,29.34,'2019-03-28','19:00');


INSERT INTO COLETA (cod_lixeira, cod_coletor, nivel, data_coleta, hora_coleta) VALUES
	(0,0,48.48,'2019-03-19','10:10'),
	(1,0,78.79,'2019-03-20','11:22'),
	(2,1,100.00,'2019-03-21','10:00'),
	(3,1,18.18,'2019-03-22','13:01'),
	(4,4,0.00,'2019-03-23','15:21'),
	(5,2,27.27,'2019-03-24','16:11'),
	(6,2,10.30,'2019-03-25','17:11'),
	(7,3,18.79,'2019-03-26','18:11'),
	(8,3,89.47,'2019-03-27','18:39'),
	(9,2,29.34,'2019-03-28','20:01');


