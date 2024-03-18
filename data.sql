use RecomendacaoJogos

INSERT INTO Usuarios (ID_Usuario, Nome, Email, Senha, DataCadastro)
VALUES 
    (1, 'Joao', 'joao@email.com', 'senha123', '2023-01-15'),
    (2, 'Maria', 'maria@email.com', 'senha456', '2023-02-20'),
    (3, 'Pedro', 'pedro@email.com', 'senha789', '2023-03-25'),
    (4, 'Ana', 'ana@email.com', 'senhaabc', '2023-04-30'),
    (5, 'Lucas', 'lucas@email.com', 'senhadef', '2023-05-05');

INSERT INTO Generos (ID_Genero, NomeGenero)
VALUES
    (1, 'Ação'),
    (2, 'RPG'),
    (3, 'Aventura'),
    (4, 'Exploração'),
    (5, 'Faroeste'),
	(6, 'Estrategia'),
	(7, 'Simulação'),
	(8, 'Esporte'),
	(9, 'Corrida');

INSERT INTO Plataformas (ID_Plataforma, NomePlataforma)
VALUES
    (1, 'PlayStation 4'),
    (2, 'PlayStation 5'),
    (3, 'Nintendo Switch'),
    (4, 'Xbox One'),	
	(5, 'Xbox Series'),
    (6, 'PC'),
	(7, 'Multiplataforma');

INSERT INTO Jogos (ID_Jogo, Nome, PlataformaID, GeneroID, DataLancamento, ClassificacaoIndicativa)
VALUES
    (1, 'The Witcher 3: Wild Hunt', 7, 2, '2015-05-19', 18),
    (2, 'The Legend of Zelda: Breath of the Wild', 3, 4, '2017-03-03', 10),
    (3, 'Red Dead Redemption 2', 7, 5, '2018-10-26', 18),
    (4, 'Uncharted 4: A Thief''s End', 1, 1, '2016-05-10', 16),
    (5, 'Cyberpunk 2077', 7, 2, '2020-12-10', 18);

INSERT INTO Avaliacoes (ID_Avaliacao, ID_Usuario, ID_Jogo, Nota, Comentario)
VALUES
    (1, 1, 1, 5, 'Um dos melhores jogos que já joguei!'),
    (2, 2, 3, 4, 'Gráficos incríveis e história envolvente.'),
    (3, 3, 2, 5, 'Ótimo jogo para quem gosta de exploração.'),
    (4, 4, 4, 4, 'Personagens cativantes e jogabilidade excelente.'),
    (5, 5, 5, 3, 'Esperava mais da jogabilidade.');

INSERT INTO Listas (ID_Lista, NomeLista, Descricao, UsuarioID)
VALUES
    (1, 'Favoritos', 'Meus jogos preferidos', 1),
    (2, 'Jogos para jogar', 'Lista de jogos pendentes', 2),
    (3, 'Jogos multiplayer', 'Para jogar com amigos', 3),
    (4, 'Jogos de aventura', 'Minha coleção de jogos de aventura', 4),
    (5, 'Retro Games', 'Lista de jogos clássicos', 5);

INSERT INTO Grupos_de_Usuarios (ID_Grupo, NomeGrupo, DescricaoGrupo, ID_Usuario_Criador)
VALUES
    (1, 'Grupo de RPG', 'Para amantes de jogos de RPG', 1),
    (2, 'Clube de Leitura de Jogos', 'Para discutir enredos de jogos', 2),
    (3, 'Equipe Competitiva', 'Grupo para jogar em competições', 3),
    (4, 'Fãs de Plataforma X', 'Para compartilhar dicas sobre uma plataforma específica', 4),
    (5, 'Jogadores Casual', 'Para quem joga por diversão', 5);

INSERT INTO Jogos_Listas (ID_JogoLista, JogoID, ListaID)
VALUES
    (1, 1, 1), -- JogoID 1 (The Witcher 3: Wild Hunt) na ListaID 1 (Favoritos)
    (2, 3, 2), -- JogoID 3 (Red Dead Redemption 2) na ListaID 2 (Jogos para jogar)
    (3, 2, 3), -- JogoID 2 (The Legend of Zelda: Breath of the Wild) na ListaID 3 (Jogos multiplayer)
    (4, 4, 4), -- JogoID 4 (Uncharted 4: A Thief's End) na ListaID 4 (Jogos de aventura)
    (5, 5, 5); -- JogoID 5 (Cyberpunk 2077) na ListaID 5 (Retro Games)
