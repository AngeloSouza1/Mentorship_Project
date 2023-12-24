## Mentorship_Project
### *Challenge 1 - Preparation*
##### Mentoria Desenvolvendome 
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/AngeloSouza1/Mentorship_Project/blob/develop/LICENSE)

## Sobre o projeto
No contexto deste desafio, abordamos a integração de Bancos de Dados e seus Relacionamentos, bem como a criação de CRUDs específicos.<br>

#### Tecnologias utilizadas
- Ruby version : 3.0.2 
- Rails version: 7.1.2
- System Linux:  Linux Mint 21.2
- DataBase : SQLITE

#### Funcionalidades!
- https://challenge1.fly.dev

- [Assista ao vídeo de demonstração 1](https://videoapi-muybridge.vimeocdn.com/animated-thumbnails/image/67a3e007-6aab-4153-8452-52902c2d5b72.gif?ClientID=vimeo-core-prod&Date=1703192610&Signature=8a8b9ae748d68909687d85b73eade345655cbd24)
- [Assista ao vídeo de demonstração 2](https://videoapi-muybridge.vimeocdn.com/animated-thumbnails/image/004c3faf-a348-422f-a5ce-9fed5f4f3893.gif?ClientID=vimeo-core-prod&Date=1703193109&Signature=8e19b4a40bcb32e854cf6045794d50d8f4249df4)
- [Assista ao vídeo de demonstração 3](https://videoapi-muybridge.vimeocdn.com/animated-thumbnails/image/1be41e9a-a605-4eff-8496-d533d4f322b9.gif?ClientID=vimeo-core-prod&Date=1703197689&Signature=2c63e0b68eefc89d1ed431955498050aaea9fe24)
- [Assista ao vídeo de demonstração 4](https://videoapi-muybridge.vimeocdn.com/animated-thumbnails/image/47904b9f-64e5-49a9-b29e-594437e48204.gif?ClientID=vimeo-core-prod&Date=1703198042&Signature=fb75f3a8ea818cf19020198ee7c193c298e9d135)
  
### 1. Batalha  - *DATABASE*   
 #### 1.1 - Implementação dos Bancos de Dados
- BD Fornecimento
Criação tabelas: *suppliers* e *accounts* <br>
<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/table_suppliers.png">
</p>

<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/table_accounts.png">
</p>

- Relacionamento do BD Fornecimento 1:1
<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/BD_Fornecimento(1%3A1).png">
</p>

#### Explicação:
<p style="text-align: justify;">
A relação do BD Fornecimento 1:1 (um para um) entre as tabelas suppliers e accounts significa que para cada registro na tabela suppliers, há no máximo um registro correspondente na tabela accounts, e vice-versa. Essa relação é estabelecida por meio da comparação do campo id da tabela suppliers com o campo supplier_id da tabela accounts.
</p>

- BD Livraria
Criação tabelas: *books* e *authors* <br>
<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/table_books.png ">
</p>

<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/table_authors.png">
</p>

- Relacionamento do BD Livraria 1:N
<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/BD_Livraria(1%3AN).png">
</p>

#### Explicação:
<p style="text-align: justify;">
A relação do BD Livraria 1:N (um para muitos) entre as tabelas books e authors, onde a relação é estabelecida pelo campo author_id da tabela books e o campo id da tabela authors.Essa relação indica que um autor pode ter muitos livros associados, mas cada livro pertence a apenas um autor.
</p>

- BD Montadora
Criação tabelas: *assemblies*, *parts* e *assemblies_part* <br>
<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/table_assemblies.png">
</p>

<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/table_parts.png">
</p>

<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/table_assemblies_part.png">
</p>

- Relacionamento do BD Montadora N:M
<p align="center">
  <img src="https://github.com/AngeloSouza1/tmp/blob/main/Assets/BD_Montadora(N%3AM).png">
</p>

#### Explicação:
<p style="text-align: justify;">
O relacionamento entre as tabelas assemblies e parts através da tabela associativa assemblies_parts é um relacionamento N:M (muitos para muitos). Isso significa que muitas montagens (assemblies) podem estar associadas a muitas peças (parts), e vice-versa.
</p>

#### 1.2 - Implementação dos C.R.U.D.S <br>
- Crud para Cadastrar Autores -[ Assista ao vídeo de demonstração](https://vimeo.com/897010192/80cde76f52)
- Crud para Cadastrar Livros vinculando com Autor-[ Assista ao vídeo de demonstração](https://vimeo.com/897025458/5a65e2878e)
- Crud para Cadastrar Fornecedores com uma Conta-[ Assista ao vídeo de demonstração](https://vimeo.com/897027139/f49b7d2789)
- Crud para Cadastrar Peças vinculando com Fornecedor-[ Assista ao vídeo de demonstração](https://vimeo.com/897032265/862b03d451)
- Crud para Cadastrar Montagens com várias Peças e vinculando com Livro-[ Assista ao vídeo de demonstração](https://vimeo.com/897032999/5eb055b83d)
  

### 2. Batalha  - *APIS*   
#### 2.1 - Implementação dos C.R.U.D.S <br>
- Crud para Cadastrar Autores 
- Crud para Cadastrar Livros vinculando com Autor
- Crud para Cadastrar Fornecedores com uma Conta
- Crud para Cadastrar Peças vinculando com Fornecedor
- Crud para Cadastrar Montagens com várias Peças e vinculando com Livro
#### O mesmo procedimento, porém, utilizando arquivos JSON para os CRUDS.   
https://github.com/AngeloSouza1/Mentorship_Project/assets/104176076/41579def-beed-4eb5-9ca6-50d5115c3603


### 3. Batalha  - *REGRAS*   
#### 3.1 - Inserções dos campos solicitados<br>
- Campo CNPJ na tabela Suppliers
- Campo Digito_Verificador na tabela Account
    <p> 
    <a href="https://gist.github.com/AngeloSouza1/6b763cc26a67de18fbcc7943e2b514e3">
    <img src="https://img.shields.io/badge/Solução-blue" alt="Ver Solução">
    </a>
- Campo ISBN na tabela Books
- Campo CPF na tabela Authors
- Cálculo Digito_Verificador em Account
- Validação dos campos : CNPJ na tabela Suppliers, ISBN na tabela Books e CPF na tabela Authors

### 4. Batalha  - *FILTROS*
#### 4.1 - Inserções de campos solicitados<br>
- Campo Título na tabela Books
- Campo Nome na tabela Parts
#### 4.2 - Inserções de filtros solicitados<br>
- Fornecedor por nome
- Fornecedor por número de conta em Conta
- Livros por título
- Livros por nome em Autor 
- Montatem por nome em Peça
- Fornecedor por nome do Autor 

### 5. Batalha  - *RELATÓRIOS*
- Adição do Campo valor em Peça
- Autor(com todas as informações) com seus Livros(com todas as informações) e o total de livros publicados
- Forneceor(com todas as informações) com todos os autores(com todas as informações) e livros(com todas as informações)
- Livros com a montagem(com todas as informações) com suas peças (com todas as informações), o total de peças e o custo total da montagem.








