/* View da lixeira com lixo */

CREATE VIEW lixeiraComLixo AS 
SELECT lixeira.cod_lixeira,
lixeira.capacidade, 
SUM(descarte.volume) AS volumeAtual,
(SUM(descarte.volume)/lixeira.capacidade) as nivel_Atual,
bairro.nome as bairro FROM lixeira
FULL OUTER JOIN descarte ON (lixeira.cod_lixeira = descarte.cod_lixeira)
FULL OUTER JOIN coleta ON (descarte.cod_lixeira = coleta.cod_lixeira)
FULL OUTER JOIN bairro ON (bairro.cod_bairro = lixeira.cod_bairro)
WHERE descarte.data_descarte > coleta.data_coleta 
OR (descarte.data_descarte = coleta.data_coleta AND descarte.hora_descarte > coleta.hora_coleta)
GROUP BY lixeira.cod_lixeira, lixeira.capacidade, bairro
ORDER BY lixeira.cod_lixeira


/* View da lixeira vazia */

CREATE VIEW lixeiraVazia AS 
SELECT lixeira.cod_lixeira, bairro.nome as bairro FROM lixeira 
INNER JOIN bairro ON (bairro.cod_bairro = lixeira.cod_bairro)
WHERE cod_lixeira NOT IN (
	SELECT descarte.cod_lixeira FROM descarte LEFT OUTER JOIN coleta ON (descarte.cod_lixeira = coleta.cod_lixeira) 
	WHERE descarte.data_descarte > coleta.data_coleta OR (descarte.data_descarte = coleta.data_coleta AND descarte.hora_descarte > coleta.hora_coleta) 
	GROUP BY descarte.cod_lixeira ORDER BY descarte.cod_lixeira)



/* View da lixeira coletadas */

CREATE VIEW lixeiraColetada AS
SELECT coleta.cod_lixeira, coleta.volume, bairro.nome AS bairro FROM coleta
INNER JOIN lixeira ON (lixeira.cod_lixeira = coleta.cod_lixeira)
INNER JOIN bairro ON (bairro.cod_bairro = lixeira.cod_bairro)
WHERE coleta.data_coleta IN (SELECT DISTINCT coleta.data_coleta FROM coleta ORDER BY coleta.data_coleta DESC LIMIT 1) 


/* View da Situacao Operacional das Lixeiras */

CREATE VIEW lixeiraSituacaoOperacional AS
SELECT coleta.cod_lixeira, status.descricao AS situacao_lixeira, coleta.data_coleta AS data_registro FROM situacao_operacional
INNER JOIN  coleta ON (coleta.cod_coleta =  situacao_operacional.cod_coleta)
INNER JOIN status ON (status.cod_status = situacao_operacional.cod_status)
ORDER BY coleta.data_coleta, coleta.cod_lixeira


/* View das Alocação de caminhao */

CREATE VIEW alocacao AS
SELECT motorista.nome as nome_motorista, caminhao.placa as placa_caminhao, aloca.data_alocacao, aloca.hora_inic as hora_alocacao FROM aloca
INNER JOIN  motorista ON (motorista.cod_motorista =  aloca.cod_motorista)
INNER JOIN caminhao ON (caminhao.cod_caminhao = aloca.cod_caminhao)
ORDER BY aloca.data_alocacao, aloca.hora_inic, motorista.nome 

/* View das Lixeiras com lixo acima de 70% da sua capacidade */

CREATE VIEW lixeiraCheia AS 
SELECT descarte.cod_lixeira, SUM(descarte.volume) AS volume, bairro.nome as bairro FROM descarte 
LEFT OUTER JOIN coleta ON (descarte.cod_lixeira = coleta.cod_lixeira)
INNER JOIN lixeira ON (lixeira.cod_lixeira = descarte.cod_lixeira)
INNER JOIN bairro ON (bairro.cod_bairro = lixeira.cod_bairro)
WHERE descarte.data_descarte > coleta.data_coleta GROUP BY descarte.cod_lixeira, lixeira.capacidade, bairro.nome
HAVING SUM(descarte.volume) > (lixeira.capacidade * 0.7)
ORDER BY descarte.cod_lixeira

