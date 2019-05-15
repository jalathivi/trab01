/*9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)*/
SELECT * FROM lixeira WHERE capacidade > 100;
SELECT * FROM cidadao WHERE email = 'maria123@gmail.com';
SELECT * FROM bairro WHERE cod_bairro = '4';
SELECT * FROM situacao_operacional WHERE cod_status = 1;
SELECT * FROM coleta WHERE data_coleta > '2019-03-24';
SELECT * FROM coletor WHERE ano = 2019;
SELECT * FROM descarte WHERE hora_descarte < '17:00:00';
