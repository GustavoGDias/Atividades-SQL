create database RecomendacaoJogos

use RecomendacaoJogos

CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(100),
    Senha VARCHAR(50),
    DataCadastro DATE
);

CREATE TABLE Generos (
    ID_Genero INT PRIMARY KEY,
    NomeGenero VARCHAR(50)
);

CREATE TABLE Plataformas (
    ID_Plataforma INT PRIMARY KEY,
    NomePlataforma VARCHAR(50)
);

CREATE TABLE Jogos (
    ID_Jogo INT PRIMARY KEY,
    Nome VARCHAR(100),
    PlataformaID INT,
    GeneroID INT,
    DataLancamento DATE,
    ClassificacaoIndicativa INT,
    FOREIGN KEY (PlataformaID) REFERENCES Plataformas(ID_Plataforma),
    FOREIGN KEY (GeneroID) REFERENCES Generos(ID_Genero)
);

CREATE TABLE Avaliacoes (
    ID_Avaliacao INT PRIMARY KEY,
    ID_Usuario INT,
    ID_Jogo INT,
    Nota INT,
    Comentario TEXT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Jogo) REFERENCES Jogos(ID_Jogo)
);


CREATE TABLE Listas (
    ID_Lista INT PRIMARY KEY,
    NomeLista VARCHAR(100),
    Descricao TEXT,
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Jogos_Listas (
    ID_JogoLista INT PRIMARY KEY,
    JogoID INT,
    ListaID INT,
    FOREIGN KEY (JogoID) REFERENCES Jogos(ID_Jogo),
    FOREIGN KEY (ListaID) REFERENCES Listas(ID_Lista)
);

CREATE TABLE Grupos_de_Usuarios (
    ID_Grupo INT PRIMARY KEY,
    NomeGrupo VARCHAR(100),
    DescricaoGrupo TEXT,
    ID_Usuario_Criador INT,
    FOREIGN KEY (ID_Usuario_Criador) REFERENCES Usuarios(ID_Usuario)
);


select * from Usuarios

select * from Generos

select * from Plataformas

select * from Jogos

select * from Avaliacoes

select * from Listas

select * from Jogos_Listas

select * from Grupos_de_Usuarios