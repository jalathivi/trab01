--Seleciona lixeiras, seus bairros e sua capacidade
SELECT cod_lixeira, bairro.nome, capacidade FROM bairro RIGHT OUTER JOIN lixeira ON (lixeira.cod_bairro = bairro.cod_bairro);

--Seleciona a marca, modelo, ano, placa e capacidade dos caminhões
SELECT marca.nome, modelo.nome, modelo.ano, caminhao.placa, caminhao.capacidade FROM marca LEFT OUTER JOIN modelo ON (marca.cod_marca = modelo.cod_marca) LEFT OUTER JOIN caminhao ON (modelo.cod_modelo = caminhao.cod_modelo)  

--Seleciona os motoristas que alocaram veiculos mostrando nome, data, hora da alocação, final da alocação e a placa do caminhao alocado 
SELECT motorista.nome, aloca.data_alocacao, aloca.hora_inic, aloca.hora_fim, caminhao.placa FROM motorista RIGHT OUTER JOIN aloca ON (motorista.cod_motorista = aloca.cod_motorista) LEFT OUTER JOIN caminhao ON (aloca.cod_caminhao = caminhao.cod_caminhao) ORDER BY nome;

--Seleciona a descrição dos Status registrados. OBS: não há registro do status 3 - OK, por isso o NULL
SELECT situacao_operacional.cod_status, status.descricao FROM situacao_operacional RIGHT OUTER JOIN status ON (situacao_operacional.cod_status = status.cod_status);
