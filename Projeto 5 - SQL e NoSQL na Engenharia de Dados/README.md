# O Papel dos Bancos de Dados SQL e NoSQL na Engenharia de Dados

## Definições
## SQL

O **SQL (Structured Query Language)** é um linguagem utilizada para acessar bancos de dados relacionais que neste caso, são banco de dados estruturados que organizam os dados em tabelas.<br />
O SQL é dividido em subconjuntos de cordo com o que se quer executar no banco de dados são eles: **DML - Linguagem de Manipulação de Dados, DDL - Linguagem de Definição de Dados, DCL - Linguagem de Controle de Dados, DTL - Linguagem de Transação de Dados e DQL - Linguagem de Consulta de Dados.**<br />

## NoSQL

O **NoSQL** é uma linguagem utilizada para lidar com bancos de dados não relacionais, ou seja, bancos que não são estruturados como por exemplo imagens, vídeos, e-mails, dados de redes sociais, textos, sites entre outros.<br />
Ao usar bancos de dados NoSQL, você pode armazenar imensos volumes de dados não estruturados e com uma taxa de transferência e velocidades de leitura/gravação bem maiores, porém, não tem a mesma integridade dos bancos de dados relacionais.<br />
Existem 4 grandes tipos muito populares de banco de dados NoSQL, são eles: **Documentos, grafos, chave-valor e colunas.**

## Diferenças entre SQL e NoSQL

Os bancos de dados SQL são de uso geral enquanto os bancos de dados NoSQL são para usos mais específicos. As diferenças podem ser resumidas em 5 grandes categorias, API, modelo de dados, requisito do schema, escalabilidade e integridade.<br /><br />
**API:** Para linguagem SQL , o SQL é a única interface para lidar com os dados, porém, para o NoSQL o SQL não é necessário como uma API para os bancos de dados.
Modelo de Dados: Em NoSQL os dados não são armazenados em tabelas com colunas e linhas fixas, ao invés disso os dados podem estar como documentos JSON, grafos, chaves de valor, usam o conceito de tabelas mas as colunas podem ser dinâmicas.<br /><br />
**Requisito do Schema:** O Schema para banco de dados NoSQL é flexível, quer dizer que não existe uma estrutura fixa para os dados e eles podem ser armazenados de forma livre. Em SQL o Schema é fixoe com tipos de dados bem definidos e tamanho para cada coluna, cada linha deve corresponder ao layout e estrutura de coluna já definidos.<br /><br />
**Escalabilidade:** NoSQL são implementados de forma horizontal, já o SQL é de escalado de forma vertical e dessa forma alguns recursos são adicionados como CPU e memória para melhoria da performance.<br /><br />
**Integridade:** NoSQL gerencia a integridade com BASE (Basicamente disponível, estado flexível, consistência eventual). Dados podem ser inconsistentes por um período de tempo mas a replicação do banco de dados atualiza todas as cópias para se tornarem consistentes.<br />
Em SQL é baseado em ACID (Atomicidade, Consistência, Isolamento e Durabilidade) e essas 4 qualidades garantem a integridade dos dados.


Para ver os demais projetos deste bootcamp clique [aqui](https://github.com/VagnerF/BOOTCAMP-DIO-DATABASE-EXP)
