/*  Os modelo de caminhão coletor diferente de 'VW 8150' */
SELECT DISTINCT nome as modelo_de_caminhao FROM modelo WHERE nome IN (SELECT DISTINCT nome FROM modelo WHERE nome <> 'VW 8150')



/* Código das lixeiras que possuem o nível atual de lixo acima da média dos níveis atuais de todas lixeiras*/
select lixeira.cod_lixeira as codigo, lixeira.nivel_atual from lixeira where nivel_atual > (select avg(nivel_atual) from lixeira)

/* Código das lixeiras que possuem o maior nível de lixo*/
select lixeira.cod_lixeira, lixeira.nivel_atual from lixeira inner join bairro on (lixeira.cod_bairro = bairro.cod_bairro) where lixeira.nivel_atual = (select max(lixeira.nivel_atual) from lixeira ) 
