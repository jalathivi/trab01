/*Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not*/
SELECT * FROM coleta WHERE volume < 50 AND data_coleta = '2019-03-27';

SELECT * FROM lixeira WHERE capacidade > 200 AND NOT nivel_atual = 0;

SELECT * FROM situacao_operacional WHERE cod_status = 1 OR cod_status = 2;

SELECT * FROM coletor WHERE marca = 'Volvo' OR ano = 2019;

SELECT * FROM descarte WHERE NOT data_descarte = '2019-03-27';


/*Criar no mínimo 3 consultas com operadores aritméticos*/

	/*Calcula o quanto resta para encher a lixeira*/
SELECT capacidade, nivel_atual, capacidade - ((capacidade * nivel_atual)/100) AS capacidade_disponivel FROM lixeira WHERE NOT (capacidade - ((capacidade * nivel_atual)/100) ) < 0;

	/*Calcula o volume de preenchimento da Lixeira*/
SELECT capacidade, (capacidade * nivel_atual)/100 AS volume_preenchido FROM lixeira;

	/*Calcula a capacidade para 70 por cento da lxeira  */
SELECT capacidade, (capacidade *70)/100 capacidade_70p FROM lixeira;
								  
								  
/*Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas*/


	/* Lixeiras quebradas */
SELECT cod_Lixeira as codigo_Lixeiras_Quebradas FROM situacao_operacional WHERE cod_status = 1;	

	/* Lixeiras cheias */
SELECT cod_Lixeira as codigo_Lixeiras_Cheias FROM lixeira WHERE nivel_atual >= 70;	
	
	/* Lixeiras  ok */
SELECT cod_Lixeira as codigo_Lixeiras_Ok FROM situacao_operacional WHERE cod_status = 3;	
	
	