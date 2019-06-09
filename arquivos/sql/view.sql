/* View da lixeira com lixo */
CREATE VIEW lixeiraComLixo AS SELECT descarte.cod_lixeira, SUM(descarte.volume) AS volume FROM descarte LEFT OUTER JOIN coleta ON (descarte.cod_lixeira = coleta.cod_lixeira)
WHERE descarte.data_descarte > coleta.data_coleta  GROUP BY descarte.cod_lixeira ORDER BY descarte.cod_lixeira

/* View da lixeira vazia */

CREATE VIEW lixeiraVazia AS SELECT lixeira.cod_lixeira FROM lixeira WHERE cod_lixeira 
NOT IN (SELECT descarte.cod_lixeira FROM descarte LEFT OUTER JOIN coleta ON (descarte.cod_lixeira = coleta.cod_lixeira)
WHERE descarte.data_descarte > coleta.data_coleta  GROUP BY descarte.cod_lixeira ORDER BY descarte.cod_lixeira)
