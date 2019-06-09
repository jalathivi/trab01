/*  Os modelo de caminhão coletor diferente de 'VW 8150' */
SELECT DISTINCT nome as modelo_de_caminhao FROM modelo WHERE nome IN (SELECT DISTINCT nome FROM modelo WHERE nome <> 'VW 8150')

/* Código das lixeiras vazias */
SELECT lixeira.cod_lixeira FROM lixeira WHERE cod_lixeira 
NOT IN (SELECT descarte.cod_lixeira FROM descarte LEFT OUTER JOIN coleta ON (descarte.cod_lixeira = coleta.cod_lixeira)
WHERE descarte.data_descarte > coleta.data_coleta  GROUP BY descarte.cod_lixeira ORDER BY descarte.cod_lixeira)

/* Código das lixeiras que possuem o maior nível de lixo*/
select lixeira.cod_lixeira, lixeira.nivel_atual from lixeira inner join bairro on (lixeira.cod_bairro = bairro.cod_bairro) where lixeira.nivel_atual = (select max(lixeira.nivel_atual) from lixeira ) 
