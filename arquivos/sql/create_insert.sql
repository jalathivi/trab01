/* Create */


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
    cod_marca INTEGER,
    CONSTRAINT pk_modelo PRIMARY KEY(cod_modelo),
    CONSTRAINT fk_marca_modelo FOREIGN KEY (cod_marca) REFERENCES MARCA (cod_marca)   
);

CREATE TABLE CAMINHAO (
    cod_caminhao INTEGER,
    cod_modelo INTEGER,
    placa VARCHAR(7) UNIQUE,
    capacidade FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    CONSTRAINT pk_caminhao PRIMARY KEY(cod_caminhao)
);

CREATE TABLE ALOCA (
    cod_motorista INTEGER,
    cod_caminhao INTEGER,
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
    cod_bairro INTEGER,
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
    cod_lixeira INTEGER,
    cod_caminhao INTEGER,
    data_coleta DATE,
    hora_coleta TIME,
    volume FLOAT,
    CONSTRAINT pk_coleta PRIMARY KEY(cod_coleta),
    CONSTRAINT fk_caminhao_coleta FOREIGN KEY (cod_caminhao) REFERENCES CAMINHAO (cod_caminhao),
    CONSTRAINT fk_lixeira_coleta FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);

CREATE TABLE DESCARTE (
	cod_lixeira INTEGER,
    cod_cidadao INTEGER,
    data_descarte DATE,
    hora_descarte TIME,
    volume FLOAT,
    CONSTRAINT fk_cidadao_descarte FOREIGN KEY (cod_cidadao) REFERENCES CIDADAO (cod_cidadao),
    CONSTRAINT fk_lixeira_descarte FOREIGN KEY (cod_lixeira) REFERENCES LIXEIRA (cod_lixeira)
);
 
CREATE TABLE SITUACAO_OPERACIONAL (
    cod_coleta INTEGER,
    cod_status INTEGER,
    CONSTRAINT fk_coleta_situacao_operacioanal FOREIGN KEY (cod_coleta) REFERENCES COLETA (cod_coleta),
    CONSTRAINT fk_status_situacao_operacioanal FOREIGN KEY (cod_status) REFERENCES STATUS (cod_status)
);



/* Insert */


INSERT INTO BAIRRO (cod_bairro, nome) VALUES 
	(1,'Grande Goiabeiras'),
	(2,'Centro de Vitória'),
	(3,'Colina de Laranjeiras'),
	(4,'Porto de Santana'),
	(5,'Carapina'),
	(6,'Jardim da Penha');
	
INSERT INTO LIXEIRA (cod_lixeira, cod_bairro, latitude, longitude, capacidade) VALUES 
	(1,1,-20.196136,-40.255506,160),
	(2,1,-20.198240,-40.253086,200),
	(3,1,-20.198688,-40.258084,205),
	(4,1,-20.195919,-40.258790,186),
	(5,1,-20.192521,-40.256842,100),
	(6,1,-20.193271,-40.252901,50),
	(7,2,-20.195081,-40.251535,35),
	(8,2,-20.196941,-40.251623,60),
	(9,2,-20.196950,-40.251233,120),
	(10,2,-20.196958,-40.252933,200),
	(11,2,-20.196928,-40.196928,100),
	(12,3,-20.196918,-40.196918,120),
	(13,3,-20.193958,-40.193958,110),
	(14,3,-20.196958,-40.196958,100),
	(15,3,-20.196758,-40.196758,160),
	(16,3,-20.196858,-40.196858,200),
	(17,4,-20.196998,-40.196998,300),
	(18,4,-20.192998,-40.192398,200),
	(19,4,-20.192398,-40.192698,400),
	(20,4,-20.198670,-40.258084,100),
	(21,5,-20.195919,-40.258790,110),
	(22,5,-20.197919,-40.219790,110),
	(23,5,-20.192521,-40.256855,120),
	(24,5,-20.193271,-40.252901,100),
	(25,5,-20.195081,-40.251535,100),
	(26,6,-20.196941,-40.251623,150),
	(27,6,-20.196941,-40.251293,100),
	(28,6,-20.193111,-40.200553,160),
	(29,6,-20.295046,-40.305405,100),
	(30,6,-19.295046,-39.305403,100);

INSERT INTO MARCA (cod_marca, nome) VALUES
	(1,'Mercedes Benz'),
	(2,'Volkswagen'),
	(3,'Scania'),
	(4,'Volvo');
	
INSERT INTO MODELO (cod_modelo, nome, ano, cod_marca) VALUES
	(1,2540,2009,1),
	(2,'MB Axor 2036',2019,1),
	(3,'G 440',2011,3),
	(4,'P94 360',2013,3),
	(5,'FH12 380',2005,4),
	(6,'VM 270',2013,4),
	(7,'VW 13180',2011,2),
	(8,'VW 8150',2012,2);

INSERT INTO CAMINHAO (cod_caminhao, placa, longitude, latitude, capacidade, cod_modelo) VALUES
	(1,'MTR3338',-20.1961361,-40.2555063,11000,1),
	(2,'MTV4311',-20.1982403,-40.2530861,10000,2),
	(3,'MQZ8687',-20.1986875,-40.2580835,12100,3),
	(4,'MTB1361',-20.1959193,-40.2587904,11000,3),
	(5,'MSG4883',-20.1925205,-40.2568421,10000,4),
	(6,'MSZ7251',-20.1932706,-40.2529013,12000,5),
	(7,'MRB6206',-20.1950812,-40.2515352,10000,5),
	(8,'MRY5351',-20.1969409,-40.2516228,12000,6),
	(9,'MRF7474',-20.1969409,-40.2512928,12100,7),
	(10,'MSI6750',-20.1931106,-40.2005528,14000,8),
	(11,'MRP5441',-20.1952112,-40.2558963,14000,8);

INSERT INTO CIDADAO (cod_cidadao, nome, email, senha, longitude, latitude) VALUES
	(1,'Livinho Silve','livinho@gmail.com','b3ddbc502e307665f346cbd6e52cc10d',-20.050771,-40.220947),
	(2,'Maria Joaquina','jomaria@hotmail.com','be041b21f66931f5a1d24e1e19a78539',-20.086889,-40.270386),
	(3,'Marcelo Paiva','marcelo@hotmail.com','827ccb0eea8a706c4c34a16891f84e7b',-20.200346,-40.248413),
	(4,'Livia Estrela','livia@hotmail.com','d10906c3dac1172d4f60bd41f224ae75',-20.262197,-40.341797),
	(5,'Kellen Andrade','kellen@gmail.com','b3ddbc502e307665f346cbd6e52cc10d',-20.390974,-40.297852),
	(6,'Maria Luisa','maria_lu@gmail.com','f190ce9ac8445d249747cab7be43f7d5',-20.205501,-40.204468),
	(7,'Lais Laticinio','lala@hotmail.com','d42dc2f3c49d74316bd17066c3577436',-20.174567,-40.336304),
	(8,'Orides Identico','orides@gmail.com','6dcb35fd55d25d92c4a08f67ec636059',-20.295046,-40.305405),
	(9,'Otavio Freitas','otaviof@gmail.com','293c3b96edea6588bc4b9415c3be4e66',-19.295046,-39.305403),
	(10,'Daniel Miranda','danielmi@gmail.com','09236968fe179eba9959ee08bb5bf80f',-18.293046,-38.305204);

INSERT INTO MOTORISTA (cod_motorista, nome, cnh) VALUES
	(1,'Carlos Berlim',79422697522),
	(2,'Bruno Aguiar',32137438011),
	(3,'Luis Barbosa',85592912563),
	(4,'Mathes Kaguinery',54883575163),
	(5,'Bruno Mendonça',57614486347),
	(6,'Daniel Oliveira',75366268453),
	(7,'José Matos Silva',61646505787),
	(8,'Antônio Belvedere',98624129824);

INSERT INTO DESCARTE (cod_lixeira, cod_cidadao, volume, data_descarte, hora_descarte) VALUES
	(1,1, 50.0,'2019-03-19','06:10:00'),
	(1,2, 46.0,'2019-03-19','09:10:00'),
	(1,3,48.0,'2019-03-19','10:10:00'),
	(2,4,64.0,'2019-03-20','11:20:00'),
	(2,6,43.0,'2019-03-20','11:24:00'),
	(2,5,44.0,'2019-03-20','11:25:00'),
	(2,7,43.0,'2019-03-20','11:40:00'),
	(3,1,61.1,'2019-03-21','08:00:00'),
	(3,2,41.1,'2019-03-21','08:10:00'),
	(3,3,52.1,'2019-03-21','08:11:00'),
	(3,8,50.1,'2019-03-21','08:12:00'),
	(4,9,61.9,'2019-03-22','13:01:00'),
	(4,10,60.9,'2019-03-22','13:01:00'),
	(4,4,62.9,'2019-03-22','13:02:00'),
	(5,5,70.0,'2019-03-23','15:21:00'),
	(6,6,40.0,'2019-03-24','16:11:00'),
	(7,7,30.1,'2019-03-25','17:11:00'),
	(8,8,59.4,'2019-03-26','06:11:00'),
	(9,10,120.0,'2019-03-27','12:00:00'),
	(10,9,200.0,'2019-03-27','17:10:00'),
	(11,2,90.0,'2019-03-27','17:11:00'),
	(12,3,96.0,'2019-03-27','17:12:00'),
	(13,6,110.0,'2019-03-27','18:39:00'),
	(14,2,100.0,'2019-03-27','18:42:00'),
	(15,1,42.6,'2019-03-27','18:40:00'),
	(15,5,42.6,'2019-03-27','18:41:00'),
	(15,7,42.6,'2019-03-27','18:40:00'),
	(16,4,60.0,'2019-03-27','19:35:00'),
	(16,5,60.0,'2019-03-27','19:35:00'),
	(16,6,60.0,'2019-03-27','19:36:00'),
	(17,10,75.2,'2019-03-27','19:38:00'),
	(17,2,76.2,'2019-03-27','19:39:00'),
	(17,4,71.2,'2019-03-27','20:39:00'),
	(17,3,74.2,'2019-03-27','20:40:00'),
	(21,1,33.0,'2019-03-30','08:00:00'),
	(7,2,21.0,'2019-03-30','08:10:00'),
	(23,3,33.3,'2019-03-30','08:11:00'),
	(21,7,25.0,'2019-03-30','08:12:00'),
	(4,2,27.5,'2019-03-30','13:01:00'),
	(21,1,22.0,'2019-03-30','13:01:00'),
	(6,5,34.0,'2019-03-31','06:10:00'),
	(22,7,36.0,'2019-03-31','09:10:00'),
	(22,4,33.4,'2019-03-31','10:10:00'),
	(1,9,37.4,'2019-03-31','11:20:00'),
	(4,10,44.0,'2019-03-31','11:24:00'),
	(1,5,42.0,'2019-03-31','11:40:00'),
	(6,5,48.2,'2019-03-31','17:11:00'),
	(22,7,31.0,'2019-03-31','17:12:00'),
	(21,4,22.0,'2019-03-31','18:39:00'),
	(23,9,26.0,'2019-03-31','18:42:00'),
	(4,10,44.2,'2019-03-31','18:40:00'),
	(23,5,32.3,'2019-03-31','18:41:00'),
	(2,8,22.1,'2019-04-01','06:20:00'),
	(5,4,15.0,'2019-04-01','08:00:00');	

INSERT INTO COLETA (cod_coleta, cod_lixeira, cod_caminhao, volume, data_coleta, hora_coleta) VALUES
	(1,1,1,144.0,'2019-03-20','14:10:00'),
	(2,2,1,194.0,'2019-03-20','14:12:00'),
	(3,3,2,204.45,'2019-03-27','10:14:30'),
	(4,4,2,185.57,'2019-03-27','10:16:00'),
	(5,5,2,70.0,'2019-03-27','10:18:00'),
	(6,6,2,40.0,'2019-03-27','10:20:00'),
	(7,7,2,30.1,'2019-03-27','10:23:00'),
	(8,8,2,59.4,'2019-03-27','10:25:00'),
	(9,9,2,120.0,'2019-03-27','10:25:00'),
	(10,10,2,200.0,'2019-03-27','10:25:00'),
	(11,11,3,90.0,'2019-03-29','13:13:00'),
	(12,12,3,96.0,'2019-03-29','13:14:00'),
	(13,13,3,110.0,'2019-03-29','13:14:00'),
	(14,14,3,100.0,'2019-03-29','13:14:00'),
	(15,15,3,128.0,'2019-03-29','13:20:00'),
	(16,16,3,180.0,'2019-03-29','13:22:00'),
	(17,17,3,297.0,'2019-03-29','13:25:00'),
	(18,21,1,102.0,'2019-04-01','10:14:30'),
	(19,22,1,100.4,'2019-04-01','10:16:00'),
	(20,23,1,91.6,'2019-04-01','10:18:00'),
	(21,4,1,115.7,'2019-04-01','10:20:00'),
	(22,6,1,82.2,'2019-04-01','10:23:00');
	
INSERT INTO STATUS (cod_status, descricao) VALUES
	(1,'Quebrada'),
	(2,'Não atende a demanda'),
	(3,'OK');

INSERT INTO SITUACAO_OPERACIONAL (cod_coleta, cod_status) VALUES
	(3,2),
	(4,2),
	(9,1),
	(10,1),
	(13,1),
	(14,1);

INSERT INTO ALOCA (cod_motorista, cod_caminhao, data_alocacao, hora_inic, hora_fim) VALUES
	(2,1,'2019-03-20','13:48:00','14:37:00'),
	(5,2,'2019-03-27','09:50:00','10:45:00'),
	(6,3,'2019-03-29','12:55:00','13:46:00'),
	(3,1,'2019-04-01','09:47:00','10:38:00');
	

