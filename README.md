# SERVICO_LOJABI
Esse projeto é uma continuação direta do projeto da LOJABI, com o resultado positivo do último projeto a diretoria solicitou que o setor de BI começasse a criar um projeto focado em todos os serviços de cada empresa, seus projetos e chamados delas. Com isso a equipe chegou nesse modelo multidimensional:

![modelo_multidimensional](https://github.com/VictorEMF/SERVICO_LOJABI/assets/70483515/1f5864c3-8b0a-4afc-978a-03da4cf5ef7b)

Com isso houve a criação do ETL que foi feito no SQL Server Integration Services (SSIS), o primeiro projeto serve para pegar os dados quem vem do excel e inserir na DB Origem, o projeto de inicio foca e pegar os arquivos que são divididos em arquivos de projetos em excel e de chamados e logo apois isso são colocados em uma pasta de Processados junto com a data de insert no banco de dados.

![PROJETO_CHAMADO](https://github.com/VictorEMF/SERVICO_LOJABI/assets/70483515/847f73fc-6b4d-4eea-9d15-32843ced6b19)

