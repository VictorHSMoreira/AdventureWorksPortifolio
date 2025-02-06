## Análise Exploratória de Dados


Iniciamos a análise exploratória, buscando compreender o comportamento do faturamento bruto. 
Durante essa análise, identificamos um fator importante; o faturamento da empresa iniciou ao fim de dezembro/2010, 
e o último mês faturado foi antes de completar janeiro/2014. 
Com essa informação, algumas análises posteriores, foi preciso desconsiderar esses 2 anos.

<br>


Inicialmente agrupamos os dados em um CTE (Common Table Expression), somando todo o faturamento, ano a ano. 
Após o agrupamento dos dados, usamos a função LAG, afim de apresentar o faturamento do ano anterior, facilitando a análise. 

<img width="500" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%201.png?raw=true">
<img width="250" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%201.1.png?raw=true">

<a href="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/SQL/Adventure%20Queries.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.

<br>

Nessa primeira análise, já conseguimos identificar que o ano de 2012, apresentou menor faturamento bruto, porém no ano seguinte, 2013, o faturamento aumentou 10,5 milhões. 
Tal evolução, mereceu maior atenção, portando continuamos nossas análises buscando compreender o motivo.

<br> 

Seguindo a análise, verificamos o valor médio de compra por cliente, usando a função AVG e agrupando os dados. O valor médio, foi de $310.

<img width="500" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%202.png?raw=true">
<img width="250" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%202.1.png?raw=true">

<a href="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/SQL/Adventure%20Queries.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.

<br>

Aprofundando essa análise, buscamos entender quais eram os clientes com maior média de compra no ano de 2013. Para tal, foi realizado JOIN’s, das tabelas de Data e Clientes, concatenado o primeiro e último nome. Como os dados estavam agrupados, usamos o HAVING, para realizar o filtro no ano de 2013 e por fim ordenado de forma decrescente. O resultado da consulta foi o seguinte:

<img width="500" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%203.1.png?raw=true">
<img width="250" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%203.png?raw=true">

<a href="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/SQL/Adventure%20Queries.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.

Essa análise nos permite traçar planos de vendas para um grupo específico de cliente, buscando manter ativo, estes com maior potencial de compra.

<br>

Seguindo, buscamos verificar se há alguma sazonalidade no negócio. Neste select, lançamos mão da CTE, agrupando as informações de meses e faturamento. Na sequência, apenas um select simples, usando o recurso TOP 3.

Com o resultado dessa consulta, não identificamos uma forte sazonalização, porém há uma informação importante, uma tendência no aumento de faturamento nos meses de férias escolares e/ou datas de forte comércio, como Black Friday e Natal. 

<img width="500" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%204.1.png?raw=true">
<img width="250" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%204.png?raw=true">

<a href="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/SQL/Adventure%20Queries.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.


Afunilando essa análise de sazonalidade, buscamos entender o comportamento do cliente, identificando quais os melhores dias da semana para vender.
A lógica desse select, foi semelhante a anterior, e como resultado o top 3, foi este:

<img width="500" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%205.1.png?raw=true">
<img width="250" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%205.png?raw=true">

<a href="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/SQL/Adventure%20Queries.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.

A importância de se entender o comportamento de consumo, é que se torna viável lançar campanhas de vendas específicas de forma mais assertiva, pois há informação do momento exato em que o cliente está buscando pelo produto.

<br>

Em complemento a esta análise da receita foi realizado uma CTE, relacionando 3 tabelas e agrupando os dados e, posteriormente, usamos o filtro WHERE de ano e trimestre. Esse recurso da CTE, permite replicar de forma mais rápida outras análises semelhantes.

Com isso, a categoria com maior soma foram as bicicletas

<img width="500" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%207.1.png?raw=true">
<img width="250" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%207.png?raw=true">

<a href="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/SQL/Adventure%20Queries.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.

Essa categoria também apresenta a maior margem. Para isso, no select, fizemos uma simples operação de valor da venda – custo de produção.

<img width="500" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%208.1.png?raw=true">
<img width="250" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%208.png?raw=true">

<a href="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/SQL/Adventure%20Queries.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.

A última análise realizada, elucida o crescimento do faturamento total no ano de 2013. Realizamos um select buscando entender a entrada de novos produtos na carteira. No ano de 2013, foram iniciados 194 produtos novos. Valor muito superior aos anos anteriores. Esse aumento no portifólio gerou um aumento na receita total do ano.

<img width="500" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%206.1.png?raw=true">
<img width="250" src="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/Nova%20pasta/Querie%206.png?raw=true">

<a href="https://github.com/VictorHSMoreira/AdventureWorksPortifolio/blob/main/SQL/Adventure%20Queries.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.

<br>

### Conclusão
Compreendemos que a linguagem SQL, não é a melhor ferramenta para vizualização de dados, mas com ela, é possível responder a vários requisitos do negócio, afim de apoiar a decisão estratégica. No case em específico, identificamos 2 principais insight's

- A empresa AdventureWorks, apresentou pontos positivos, como os produtos com maior margem de lucro, também serem os produtos mais vendidos. Isso permite que a empresa não necessite de um altíssimo giro de estoque para cobrir a defasagem de margem.

- O aumento do faturamento se deu pelo aumento no número de produtos cadastrados. Esse aumento no portifólio da empresa, trouxe novas fontes de receitas e também pode ter ajudado a vendas de produtos já existente na base.


