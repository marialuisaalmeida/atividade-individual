Documento da atividade- passo a passo



**1-  Faça uma consulta filtrando um campo de texto utilizando like;**

utilizei o site W3 schools para entender o comando que tinha que utilizar, dessa forma usei a estrutura "SELECT \* FROM Customers WHERE CustomerName LIKE 'a%';".

assim, fiz a seguinte consulta: "SELECT \* FROM funcionarios WHERE nome LIKE 'a%';".



**2-  Execute um comando explain e tire um print (anexe nesta atividade);**

coloquei o EXPLAIN na frente do SELECT para ver o plano de execução.



**3-  Crie um index para a coluna que utilizou no filtro acima;**

para criar o índice utilizei novamente o site W3 schools para entender a explicação. 

usei a sintaxe "CREATE INDEX index\_name ON table\_name (column1, column2, ...); ".

ficou assim: CREATE INDEX idx\_funcionarios\_nome ON funcionarios(nome);



**4- Refaça a consulta e execute o explain novamente. Tire um novo print (anexe neste atividade) e compare com o anterior. Aponte as diferenças.**

refiz a consulta e executei o explain novamente. Vi que teria que aparecer "index scan" mas não apareceu, continuou idêntico.



**5- Altere uma coluna de varchar para int, avalie o retorno, inclusive se for erro;**

pesquisei no google sobre a estrutura, pois não encontrei no w3 schools. 

ele me passou a estrutura "ALTER TABLE sua tabela ALTER COLUMN sua coluna TYPE INT;"

utilizei essa sintaxe, dessa forma: ALTER TABLE funcionarios ALTER COLUMN salario type INT;

o resultado foi como esperado, não demonstrou erro.



**6- Altere uma coluna de int para varchar avalie o retorno, inclusive se for erro;**

pesquisei no google novamente sobre a sintaxe, e ele me passou a estrutura: "alter table sua tabela alter column sua coluna type varchar (20);"

utilizei dessa forma: alter table funcionarios alter column salario type varchar(20);

o resultado não demonstrou erro



**7-  Crie um usuário com seu nome e dê todas as permissões de acesso para todas as tabelas;**

perguntei para o carlos sobre a estrutura e ele me ajudou, utilizei: "create user maria with password "senha"; grant all privileges on database db\_revenda\_maria to maria;"



**8- Crie um usuário para seu colega apenas com permissão de select em uma das tabelas;**

Carlos me auxiliou na criação dessa etapa. usei: create user biatrice with password 'senha1'; grant select on funcionarios to biatrice;



**9- Refaça todos os items no usuário que criou para seu colega, registre tudo que ocorreu (erros e acertos).**

Refiz os itens!

SELECT \* FROM funcionarios WHERE nome LIKE 'a%'; -- não deu erro



explain SELECT \* FROM funcionarios WHERE nome LIKE 'a%'; -- não deu erro



CREATE INDEX idx\_funcionarios\_nome ON funcionarios(nome); -- deu erro



explain SELECT \* FROM funcionarios WHERE nome LIKE 'a%'; -- não deu erro



ALTER TABLE funcionarios ALTER COLUMN salario type INT; --deu erro



alter table funcionarios alter column salario type varchar(20); - deu erro



**10- De volta no seu usuário, crie 12 consultas, sendo 3 consultas semelhantes (somente com alteração do tipo de join: inner, left e right). Ou seja, são 4 consultas diferentes, sendo que cada consulta terá 3 versões, uma com cada tipo de join;**

criei 12 consultas com select e os 3 tipos de join



**11- Atualize vários registros com colunas NULL;**

atualizei!



**12- Execute as consultas com Join novamente, avalie os resultados.**

o null garantiu que os resultados sejam consistentes e utilizáveis.

