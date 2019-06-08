--9.7 Group By e Funções de Ordenação
SELECT cidadao.nome, COUNT(*) AS QTD_Descartes FROM descarte INNER JOIN cidadao ON (cidadao.cod_cidadao = descarte.cod_cidadao) GROUP BY cidadao.nome ORDER BY cidadao.nome;
SELECT SUM(volume) AS Volume_Coletado, coleta.data_coleta FROM coleta GROUP BY coleta.data_coleta;
SELECT bairro.nome, COUNT(*) AS QTD_Lixeiras FROM lixeira INNER JOIN bairro ON (bairro.cod_bairro = lixeira.cod_bairro) GROUP BY bairro.cod_bairro ORDER BY COUNT(*);
SELECT capacidade AS Capacidades FROM lixeira GROUP BY capacidade ORDER BY capacidade;
SELECT cod_status, COUNT(*) FROM situacao_operacional GROUP BY cod_status;
SELECT cod_coletor, COUNT(*) AS QTD_REGISTROS FROM situacao_operacional GROUP BY cod_coletor;

