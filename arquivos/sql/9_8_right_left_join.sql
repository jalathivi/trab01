--Seleciona lixeiras, seus bairros e sua capacidade
SELECT cod_lixeira, bairro.cod_bairro, bairro.nome, capacidade FROM bairro LEFT OUTER JOIN lixeira ON (lixeira.cod_bairro = bairro.cod_bairro);

--Seleciona caminhão, modelo e modelo

