/*Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not*/
SELECT * FROM coleta WHERE volume < 50 AND data_coleta = '2019-03-27';

SELECT * FROM lixeira WHERE capacidade > 200 AND NOT nivel_atual = 0;

SELECT * FROM situacao_operacional WHERE cod_status = 1 OR cod_status = 2;

SELECT * FROM coletor WHERE marca = 'Volvo' OR ano = 2019;

SELECT * FROM descarte WHERE NOT data_descarte = '2019-03-27';


/*Criar no mínimo 3 consultas com operadores aritméticos*/

	/*Calcula o quanto resta para encher a lixeira*/
SELECT capacidade, nivel_atual, (capacidade - nivel_atual) AS restante FROM lixeira WHERE NOT (capacidade - nivel_atual) < 0;

	/*Calcula a porcentagem de preenchimento da Lixeira*/
SELECT ((nivel_atual*100)/capacidade) AS porcentagem_preenchimento FROM lixeira;

	/*Calcula o nível que a lixeira transbordou*/
SELECT (nivel_atual-capacidade) AS Transbordado FROM lixeira WHERE nivel_atual > capacidade;

/*Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas*/
	FALTA!
