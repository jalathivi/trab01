SELECT cod_lixeira, cod_bairro, capacidade FROM lixeira WHERE capacidade > 100;
SELECT nome FROM cidadao WHERE email = 'maria123@gmail.com';
SELECT cod_bairro, nome FROM bairro WHERE cod_bairro = '4';
SELECT cod_lixeira FROM situacao_operacional WHERE cod_status = 1;
SELECT cod_coletor, data_coleta FROM coleta WHERE data_coleta > '2019-03-24';
SELECT placa, modelo, marca FROM coletor WHERE ano = 2019;
SELECT nivel, hora_descarte FROM descarte WHERE hora_descarte < '17:00:00';
