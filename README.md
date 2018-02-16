# Candidatos

O script.sh faz o download dos arquivos do anos de 1996 até 2016, seguido pela concatenação por ano de todos os arquivos já que os mesmos vem separados por estado, codificação para UTF-8 dos arquivos já concatenados e por último é feita uma pequena limpeza dos dados.

Os arquivos csv disponibilizados pelo TSE se encontram neste [site](http://www.tse.jus.br/eleitor-e-eleicoes/estatisticas/repositorio-de-dados-eleitorais-1/repositorio-de-dados-eleitorais).

Na pasta *concatenados* se encontram os arquivos em formato csv no formato final.

## Importando para o MySQL

Para importar para o MySQL pode-se utilizar o arquivo *candidatos.sql*.

**Atenção**: o nome do database usado no sql está definido como candidatos.

```bash
mysql -uuser -ppassword < candidatos.sql
```

## Mapeamento dos csv

A seguinte tabela mostra um mapeamento dos csv onde cada célula representa a coluna correspondente no csv daquele ano onde aquele campo pertence.

*Obs.: O caractere '-' presente na tabela indica que no ano correspondente não foi disponibilizado aquele dado.*

**Exemplo:** O campo "CODIGO_MUNICIPIO_NASCIMENTO" está presente na coluna 39 do csv no ano de 2004 e na coluna 41 no ano de 2014.

| Campo                          | 1994 | 1996 | 1998 | 2000 | 2002 | 2004 | 2006 | 2008 | 2010 | 2012 | 2014 | 2016 |
|:-------------------------------|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| DATA_GERACAO                   | 1    | 1    | 1    | 1    | 1    | 1    | 1    | 1    | 1    | 1    | 1    | 1    |
| HORA_GERACAO                   | 2    | 2    | 2    | 2    | 2    | 2    | 2    | 2    | 2    | 2    | 2    | 2    |
| ANO_ELEICAO                    | 3    | 3    | 3    | 3    | 3    | 3    | 3    | 3    | 3    | 3    | 3    | 3    |
| NUM_TURNO                      | 4    | 4    | 4    | 4    | 4    | 4    | 4    | 4    | 4    | 4    | 4    | 4    |
| DESCRICAO_ELEICAO              | 5    | 5    | 5    | 5    | 5    | 5    | 5    | 5    | 5    | 5    | 5    | 5    |
| SIGLA_UF                       | 6    | 6    | 6    | 6    | 6    | 6    | 6    | 6    | 6    | 6    | 6    | 6    |
| SIGLA_UE                       | 7    | 7    | 7    | 7    | 7    | 7    | 7    | 7    | 7    | 7    | 7    | 7    |
| DESCRICAO_UE                   | 8    | 8    | 8    | 8    | 8    | 8    | 8    | 8    | 8    | 8    | 8    | 8    |
| CODIGO_CARGO                   | 9    | 9    | 9    | 9    | 9    | 9    | 9    | 9    | 9    | 9    | 9    | 9    |
| DESCRICAO_CARGO                | 10   | 10   | 10   | 10   | 10   | 10   | 10   | 10   | 10   | 10   | 10   | 10   |
| NOME_CANDIDATO                 | 11   | 11   | 11   | 11   | 11   | 11   | 11   | 11   | 11   | 11   | 11   | 11   |
| SEQUENCIAL_CANDIDATO           | 12   | 12   | 12   | 12   | 12   | 12   | 12   | 12   | 12   | 12   | 12   | 12   |
| NUMERO_CANDIDATO               | 13   | 13   | 13   | 13   | 13   | 13   | 13   | 13   | 13   | 13   | 13   | 13   |
| CPF_CANDIDATO                  | 14   | 14   | 14   | 14   | 14   | 14   | 14   | 14   | 14   | 14   | 14   | 14   |
| NOME_URNA_CANDIDATO            | 15   | 15   | 15   | 15   | 15   | 15   | 15   | 15   | 15   | 15   | 15   | 15   |
| COD_SITUACAO_CANDIDATURA       | 16   | 16   | 16   | 16   | 16   | 16   | 16   | 16   | 16   | 16   | 16   | 16   |
| DES_SITUACAO_CANDIDATURA       | 17   | 17   | 17   | 17   | 17   | 17   | 17   | 17   | 17   | 17   | 17   | 17   |
| NUMERO_PARTIDO                 | 18   | 18   | 18   | 18   | 18   | 18   | 18   | 18   | 18   | 18   | 18   | 18   |
| SIGLA_PARTIDO                  | 19   | 19   | 19   | 19   | 19   | 19   | 19   | 19   | 19   | 19   | 19   | 19   |
| NOME_PARTIDO                   | 20   | 20   | 20   | 20   | 20   | 20   | 20   | 20   | 20   | 20   | 20   | 20   |
| CODIGO_LEGENDA                 | 21   | 21   | 21   | 21   | 21   | 21   | 21   | 21   | 21   | 21   | 21   | 21   |
| SIGLA_LEGENDA                  | 22   | 22   | 22   | 22   | 22   | 22   | 22   | 22   | 22   | 22   | 22   | 22   |
| COMPOSICAO_LEGENDA             | 23   | 23   | 23   | 23   | 23   | 23   | 23   | 23   | 23   | 23   | 23   | 23   |
| NOME_LEGENDA                   | 24   | 24   | 24   | 24   | 24   | 24   | 24   | 24   | 24   | 24   | 24   | 24   |
| CODIGO_OCUPACAO                | 25   | 25   | 25   | 25   | 25   | 25   | 25   | 25   | 25   | 25   | 25   | 25   |
| DESCRICAO_OCUPACAO             | 26   | 26   | 26   | 26   | 26   | 26   | 26   | 26   | 26   | 26   | 26   | 26   |
| DATA_NASCIMENTO                | 27   | 27   | 27   | 27   | 27   | 27   | 27   | 27   | 27   | 27   | 27   | 27   |
| NUM_TITULO_ELEITORAL_CANDIDATO | 28   | 28   | 28   | 28   | 28   | 28   | 28   | 28   | 28   | 28   | 28   | 28   |
| IDADE_DATA_ELEICAO             | 29   | 29   | 29   | 29   | 29   | 29   | 29   | 29   | 29   | 29   | 29   | 29   |
| CODIGO_SEXO                    | 30   | 30   | 30   | 30   | 30   | 30   | 30   | 30   | 30   | 30   | 30   | 30   |
| DESCRICAO_SEXO                 | 31   | 31   | 31   | 31   | 31   | 31   | 31   | 31   | 31   | 31   | 31   | 31   |
| COD_GRAU_INSTRUCAO             | 32   | 32   | 32   | 32   | 32   | 32   | 32   | 32   | 32   | 32   | 32   | 32   |
| DESCRICAO_GRAU_INSTRUCAO       | 33   | 33   | 33   | 33   | 33   | 33   | 33   | 33   | 33   | 33   | 33   | 33   |
| CODIGO_ESTADO_CIVIL            | 34   | 34   | 34   | 34   | 34   | 34   | 34   | 34   | 34   | 34   | 34   | 34   |
| DESCRICAO_ESTADO_CIVIL         | 35   | 35   | 35   | 35   | 35   | 35   | 35   | 35   | 35   | 35   | 35   | 35   |
| CODIGO_COR_RACA                | -    | -    | -    | -    | -    | -    | -    | -    | -    | -    | 36   | 36   |
| DESCRICAO_COR_RACA             | -    | -    | -    | -    | -    | -    | -    | -    | -    | -    | 37   | 37   |
| CODIGO_NACIONALIDADE           | 36   | 36   | 36   | 36   | 36   | 36   | 36   | 36   | 36   | 36   | 38   | 38   |
| DESCRICAO_NACIONALIDADE        | 37   | 37   | 37   | 37   | 37   | 37   | 37   | 37   | 37   | 37   | 39   | 39   |
| SIGLA_UF_NASCIMENTO            | 38   | 38   | 38   | 38   | 38   | 38   | 38   | 38   | 38   | 38   | 40   | 40   |
| CODIGO_MUNICIPIO_NASCIMENTO    | 39   | 39   | 39   | 39   | 39   | 39   | 39   | 39   | 39   | 39   | 41   | 41   |
| NOME_MUNICIPIO_NASCIMENTO      | 40   | 40   | 40   | 40   | 40   | 40   | 40   | 40   | 40   | 40   | 42   | 42   |
| DESPESA_MAX_CAMPANHA           | 41   | 41   | 41   | 41   | 41   | 41   | 41   | 41   | 41   | 41   | 43   | 43   |
| COD_SIT_TOT_TURNO              | 42   | 42   | 42   | 42   | 42   | 42   | 42   | 42   | 42   | 42   | 44   | 44   |
| DESC_SIT_TOT_TURNO             | 43   | 43   | 43   | 43   | 43   | 43   | 43   | 43   | 43   | 43   | 45   | 45   |
| NM_EMAIL                       | -    | -    | -    | -    | -    | -    | -    | -    | -    | 44   | 46   | 46   |
