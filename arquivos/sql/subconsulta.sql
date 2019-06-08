/*  Os modelo de caminhão coletor diferente de VEGALIX */
select distinct coletor.modelo as modelo_de_caminhao from coletor where modelo in (select distinct coletor.modelo from coletor where modelo <> 'VEGALIX')

/* Código das lixeiras que possuem o nível atual de lixo acima da média dos níveis atuais de todas lixeiras*/
select lixeira.cod_lixeira as codigo, lixeira.nivel_atual from lixeira where nivel_atual > (select avg(nivel_atual) from lixeira)

/* Código das lixeiras que possuem o maior nível de lixo*/
select lixeira.cod_lixeira, lixeira.nivel_atual from lixeira inner join bairro on (lixeira.cod_bairro = bairro.cod_bairro) where lixeira.nivel_atual = (select max(lixeira.nivel_atual) from lixeira ) 