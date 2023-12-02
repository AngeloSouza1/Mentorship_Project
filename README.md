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
- Crud para Cadastrar Autores -[ Assista ao vídeo de demonstração](https://vimeo.com/888319890/2e6803702c)
- Crud para Cadastrar Livros vinculando com Autor-[ Assista ao vídeo de demonstração](https://vimeo.com/888323765/a4f32ee0c9) 
- Crud para Cadastrar Fornecedores com uma Conta-[ Assista ao vídeo de demonstração](https://vimeo.com/888319472/72ea688605)
- Crud para Cadastrar Peças vinculando com Fornecedor-[ Assista ao vídeo de demonstração](https://vimeo.com/888319213/3d1aa00baf)
- Crud para Cadastrar Montagens com várias Peças e vinculando com Livro-[ Assista ao vídeo de demonstração](https://vimeo.com/888324184/a00d4713ff)

### 2. Batalha  - *APIS*   
#### 2.1 - Implementação dos C.R.U.D.S <br>
- Crud para Cadastrar Autores 
- Crud para Cadastrar Livros vinculando com Autor
- Crud para Cadastrar Fornecedores com uma Conta
- Crud para Cadastrar Peças vinculando com Fornecedor
- Crud para Cadastrar Montagens com várias Peças e vinculando com Livro
#### O mesmo procedimento, porém, utilizando arquivos JSON para os CRUDS.   
https://github.com/AngeloSouza1/Mentorship_Project/assets/104176076/41579def-beed-4eb5-9ca6-50d5115c3603





