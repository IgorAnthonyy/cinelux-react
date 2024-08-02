-- 
drop database ingressosJa;

CREATE DATABASE ingressosJa;
USE ingressosja;

CREATE TABLE cinema(
idCinema INT PRIMARY KEY AUTO_INCREMENT,
endereco varchar(100),
nome varchar(100));

CREATE TABLE sala(
idSala INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(100),
capacidade int,
fkCinema int,
foreign key (fkCinema) references cinema(idCinema));

CREATE TABLE assento(
idAssento INT PRIMARY KEY AUTO_INCREMENT,
fkSala int,
numero varchar(4),
Tipo varchar(19),
foreign key (fkSala) references sala(idSala));

CREATE TABLE filme(
idFilme INT PRIMARY KEY AUTO_INCREMENT,
titulo varchar(100),
descricao text,
capa varchar(1000),
genero varchar(50),
duracaoMin int,
classificacao varchar(10),
exibicao varchar(10));

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	username VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
    telefone char(11),
    cpf char(11));

select * from cliente;

CREATE TABLE sessao(
idSessao INT PRIMARY KEY AUTO_INCREMENT,
fkSala int,
fkFilme int,
dataHora datetime,	
tipoSessao varchar(50),	
foreign key (fkSala) references sala(idSala),
foreign key (fkFilme) references filme(idFilme));

select dataHora from sessao;

SELECT DATE(dataHora) AS data
FROM sessao
GROUP BY DATE(dataHora);

CREATE TABLE preco(
idPreco INT PRIMARY KEY AUTO_INCREMENT,
dia varchar(20),
preco decimal
);

CREATE TABLE ingresso(
idIngresso INT PRIMARY KEY AUTO_INCREMENT,
fkCliente int,
fkSessao int,
fkAssento int,
dataHora varchar(50),
total decimal,
foreign key (fkSessao) references sessao(idSessao),
foreign key (fkCliente) references cliente(idCliente),
foreign key (fkAssento) references assento(idAssento)
);

INSERT INTO cinema (idCinema, endereco, nome) VALUES
(1, 'Avenida Paulista, 1000, São Paulo', 'Cinema Paulista'),
(2, 'Rua das Flores, 200, Rio de Janeiro', 'Cinema RJ'),
(3, 'Praça Sete, 300, Belo Horizonte', 'Cinema BH'),
(4, 'Avenida Beira Mar, 400, Salvador', 'Cinema Salvador'),
(5, 'Rua Augusta, 1500, São Paulo', 'Cinema Augusta'),
(6, 'Avenida Atlântica, 2100, Rio de Janeiro', 'Cinema Copacabana'),
(7, 'Rua da Bahia, 700, Belo Horizonte', 'Cinema Palace'),
(8, 'Avenida Paralela, 800, Salvador', 'Cinema Paralela'),
(9, 'Rua XV de Novembro, 900, Curitiba', 'Cinema Curitiba'),
(10, 'Avenida Brasil, 1100, Porto Alegre', 'Cinema Porto Alegre'),
(11, 'Rua Goiás, 1200, Goiânia', 'Cinema Goiânia'),
(12, 'Avenida Recife, 1300, Recife', 'Cinema Recife'),
(13, 'Rua das Palmeiras, 1400, Florianópolis', 'Cinema Florianópolis'),
(14, 'Avenida Amazonas, 1500, Manaus', 'Cinema Manaus');

INSERT INTO sala (nome, capacidade, fkCinema) VALUES
('Sala 1', 100, 1),
('Sala 2', 150, 1),
('Sala 1', 120, 2),
('Sala 2', 200, 2),
('Sala 1', 80, 3),
('Sala 2', 110, 3),
('Sala 1', 90, 4),
('Sala 2', 130, 4),
('Sala 3', 200, 1),
('Sala 4', 250, 1),
('Sala 3', 180, 2),
('Sala 4', 220, 2),
('Sala 3', 150, 3),
('Sala 4', 170, 3),
('Sala 3', 140, 4),
('Sala 4', 160, 4),
('Sala 1', 100, 5),
('Sala 2', 150, 5),
('Sala 1', 120, 6),
('Sala 2', 200, 6),
('Sala 1', 80, 7),
('Sala 2', 110, 7),
('Sala 1', 90, 8),
('Sala 2', 130, 8),
('Sala 1', 100, 9),
('Sala 2', 150, 9),
('Sala 1', 120, 10),
('Sala 2', 200, 10),
('Sala 1', 80, 11),
('Sala 2', 110, 11),
('Sala 1', 90, 12),
('Sala 2', 130, 12),
('Sala 1', 100, 13),
('Sala 2', 150, 13),
('Sala 1', 120, 14),
('Sala 2', 200, 14);
select * from sala;

INSERT INTO filme (titulo, descricao, capa, genero, duracaoMin, classificacao, exibicao) VALUES
('O Poderoso Chefão', 'A saga de uma família de mafiosos italo-americanos e suas lutas pelo poder.', 'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg', 'Drama', 175, '18+', 'Em cartaz'),
('Vingadores: Ultimato', 'Os Vingadores precisam unir forças para derrotar Thanos e salvar o universo.', 'https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg', 'Ação', 181, '12+', 'Em cartaz'),
('Interestelar', 'Um grupo de exploradores viaja através de um buraco de minhoca no espaço para salvar a humanidade.', 'https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg', 'Ficção Científica', 169, '10+', 'Em cartaz'),
('Parasita', 'Uma família pobre se infiltra na vida de uma família rica com consequências inesperadas.', 'https://upload.wikimedia.org/wikipedia/en/5/53/Parasite_%282019_film%29.png', 'Thriller', 132, '16+', 'Em cartaz'),
('Inception', 'Um ladrão que invade os sonhos das pessoas para roubar segredos corporativos.', 'https://upload.wikimedia.org/wikipedia/en/7/7f/Inception_ver3.jpg', 'Ficção Científica', 148, '14+', 'Em cartaz'),
('O Senhor dos Anéis: A Sociedade do Anel', 'Um hobbit embarca em uma jornada para destruir um poderoso anel.', 'https://upload.wikimedia.org/wikipedia/en/0/0c/The_Fellowship_Of_The_Ring.jpg', 'Fantasia', 178, '12+', 'Em cartaz'),
('Matrix', 'Um hacker descobre a verdade sobre a realidade e luta contra seus controladores.', 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg', 'Ficção Científica', 136, '14+', 'Em cartaz'),
('Clube da Luta', 'Um homem deprimido forma um clube de luta clandestino como forma de terapia.', 'https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg', 'Drama', 139, '18+', 'Em cartaz'),
('Forrest Gump', 'A história de um homem simples que tem uma vida extraordinária.', 'https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg', 'Drama', 142, '12+', 'Em breve'),
('O Cavaleiro das Trevas', 'Batman enfrenta o Coringa, um vilão anárquico que ameaça Gotham.', 'https://upload.wikimedia.org/wikipedia/en/8/8a/Dark_Knight.jpg', 'Ação', 152, '14+', 'Em cartaz'),
('A Origem dos Guardiões', 'Um grupo de guardiões mágicos se une para proteger a esperança das crianças.', 'https://upload.wikimedia.org/wikipedia/en/7/7e/Rise_of_the_Guardians_poster.jpg', 'Animação', 97, 'Livre', 'Em breve'),
('Gladiador', 'Um general romano busca vingança contra o imperador corrupto que matou sua família.', 'https://upload.wikimedia.org/wikipedia/en/8/8d/Gladiator_ver1.jpg', 'Ação', 155, '16+', 'Em breve');
select f.idFilme, f.titulo, f.exibicao from filme as f;

-- Cinema 1, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(1, 'A1', 'normal'),
(1, 'A2', 'vip'),
(1, 'A3', 'vip'),
(1, 'A4', 'normal'),
(1, 'A5', 'normal'),
(1, 'A6', 'vip'),
(1, 'A7', 'vip'),
(1, 'A8', 'normal');

-- Cinema 1, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(2, 'B1', 'normal'),
(2, 'B2', 'vip'),
(2, 'B3', 'vip'),
(2, 'B4', 'normal'),
(2, 'B5', 'normal'),
(2, 'B6', 'vip'),
(2, 'B7', 'vip'),
(2, 'B8', 'normal');

-- Cinema 2, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(3, 'A1', 'normal'),
(3, 'A2', 'vip'),
(3, 'A3', 'vip'),
(3, 'A4', 'normal'),
(3, 'A5', 'normal'),
(3, 'A6', 'vip'),
(3, 'A7', 'vip'),
(3, 'A8', 'normal');

-- Cinema 2, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(4, 'B1', 'normal'),
(4, 'B2', 'vip'),
(4, 'B3', 'vip'),
(4, 'B4', 'normal'),
(4, 'B5', 'normal'),
(4, 'B6', 'vip'),
(4, 'B7', 'vip'),
(4, 'B8', 'normal');

-- Cinema 3, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(5, 'A1', 'normal'),
(5, 'A2', 'vip'),
(5, 'A3', 'vip'),
(5, 'A4', 'normal'),
(5, 'A5', 'normal'),
(5, 'A6', 'vip'),
(5, 'A7', 'vip'),
(5, 'A8', 'normal');

-- Cinema 3, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(6, 'B1', 'normal'),
(6, 'B2', 'vip'),
(6, 'B3', 'vip'),
(6, 'B4', 'normal'),
(6, 'B5', 'normal'),
(6, 'B6', 'vip'),
(6, 'B7', 'vip'),
(6, 'B8', 'normal');

-- Cinema 4, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(7, 'A1', 'normal'),
(7, 'A2', 'vip'),
(7, 'A3', 'vip'),
(7, 'A4', 'normal'),
(7, 'A5', 'normal'),
(7, 'A6', 'vip'),
(7, 'A7', 'vip'),
(7, 'A8', 'normal');

-- Cinema 4, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(8, 'B1', 'normal'),
(8, 'B2', 'vip'),
(8, 'B3', 'vip'),
(8, 'B4', 'normal'),
(8, 'B5', 'normal'),
(8, 'B6', 'vip'),
(8, 'B7', 'vip'),
(8, 'B8', 'normal');

-- Cinema 5, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(9, 'A1', 'normal'),
(9, 'A2', 'vip'),
(9, 'A3', 'vip'),
(9, 'A4', 'normal'),
(9, 'A4', 'normal'),
(9, 'A5', 'normal'),
(9, 'A6', 'vip'),
(9, 'A7', 'vip'),
(9, 'A8', 'normal');

-- Cinema 5, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(10, 'B1', 'normal'),
(10, 'B2', 'vip'),
(10, 'B3', 'vip'),
(10, 'B4', 'normal'),
(10, 'B5', 'normal'),
(10, 'B6', 'vip'),
(10, 'B7', 'vip'),
(10, 'B8', 'normal');

-- Cinema 6, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(11, 'A1', 'normal'),
(11, 'A2', 'vip'),
(11, 'A3', 'vip'),
(11, 'A4', 'normal'),
(11, 'A5', 'normal'),
(11, 'A6', 'vip'),
(11, 'A7', 'vip'),
(11, 'A8', 'normal');

-- Cinema 6, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(12, 'B1', 'normal'),
(12, 'B2', 'vip'),
(12, 'B3', 'vip'),
(12, 'B4', 'normal'),
(12, 'B5', 'normal'),
(12, 'B6', 'vip'),
(12, 'B7', 'vip'),
(12, 'B8', 'normal');

-- Cinema 7, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(13, 'A1', 'normal'),
(13, 'A2', 'vip'),
(13, 'A3', 'vip'),
(13, 'A4', 'normal'),
(13, 'A5', 'normal'),
(13, 'A6', 'vip'),
(13, 'A7', 'vip'),
(13, 'A8', 'normal');

	-- Cinema 7, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(14, 'B1', 'normal'),
(14, 'B2', 'vip'),
(14, 'B3', 'vip'),
(14, 'B4', 'normal'),
(14, 'B5', 'normal'),
(14, 'B6', 'vip'),
(14, 'B7', 'vip'),
(14, 'B8', 'normal');

	-- Cinema 8, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(15, 'A1', 'normal'),
(15, 'A2', 'vip'),
(15, 'A3', 'vip'),
(15, 'A4', 'normal'),
(15, 'A5', 'normal'),
(15, 'A6', 'vip'),
(15, 'A7', 'vip'),
(15, 'A8', 'normal');


-- Cinema 8, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(16, 'B1', 'normal'),
(16, 'B2', 'vip'),
(16, 'B3', 'vip'),
(16, 'B4', 'normal'),
(16, 'B5', 'normal'),
(16, 'B6', 'vip'),
(16, 'B7', 'vip'),
(16, 'B8', 'normal');


-- Cinema 9, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(17, 'A1', 'normal'),
(17, 'A2', 'vip'),
(17, 'A3', 'vip'),
(17, 'A4', 'normal'),
(17, 'A5', 'normal'),
(17, 'A6', 'vip'),
(17, 'A7', 'vip'),
(17, 'A8', 'normal');


-- Cinema 9, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(18, 'B1', 'normal'),
(18, 'B2', 'vip'),
(18, 'B3', 'vip'),
(18, 'B4', 'normal'),
(18, 'B5', 'normal'),
(18, 'B6', 'vip'),
(18, 'B7', 'vip'),
(18, 'B8', 'normal');

-- Cinema 10, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(19, 'A1', 'normal'),
(19, 'A2', 'vip'),
(19, 'A3', 'vip'),
(19, 'A4', 'normal'),
(19, 'A5', 'normal'),
(19, 'A6', 'vip'),
(19, 'A7', 'vip'),
(19, 'A8', 'normal');


-- Cinema 10, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(20, 'B1', 'normal'),
(20, 'B2', 'vip'),
(20, 'B3', 'vip'),
(20, 'B4', 'normal'),
(20, 'B5', 'normal'),
(20, 'B6', 'vip'),
(20, 'B7', 'vip'),
(20, 'B8', 'normal');


-- Cinema 11, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(21, 'A1', 'normal'),
(21, 'A2', 'vip'),
(21, 'A3', 'vip'),
(21, 'A4', 'normal'),
(21, 'A5', 'normal'),
(21, 'A6', 'vip'),
(21, 'A7', 'vip'),
(21, 'A8', 'normal');


-- Cinema 11, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(22, 'B1', 'normal'),
(22, 'B2', 'vip'),
(22, 'B3', 'vip'),
(22, 'B4', 'normal'),
(22, 'B5', 'normal'),
(22, 'B6', 'vip'),
(22, 'B7', 'vip'),
(22, 'B8', 'normal');


-- Cinema 12, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(23, 'A1', 'normal'),
(23, 'A2', 'vip'),
(23, 'A3', 'vip'),
(23, 'A4', 'normal'),
(23, 'A5', 'normal'),
(23, 'A6', 'vip'),
(23, 'A7', 'vip'),
(23, 'A8', 'normal');


-- Cinema 12, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(24, 'B1', 'normal'),
(24, 'B2', 'vip'),
(24, 'B3', 'vip'),
(24, 'B4', 'normal'),
(24, 'B5', 'normal'),
(24, 'B6', 'vip'),
(24, 'B7', 'vip'),
(24, 'B8', 'normal');


-- Cinema 13, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(25, 'A1', 'normal'),
(25, 'A2', 'vip'),
(25, 'A3', 'vip'),
(25, 'A4', 'normal'),
(25, 'A5', 'normal'),
(25, 'A6', 'vip'),
(25, 'A7', 'vip'),
(25, 'A8', 'normal');


-- Cinema 13, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(26, 'B1', 'normal'),
(26, 'B2', 'vip'),
(26, 'B3', 'vip'),
(26, 'B4', 'normal'),
(26, 'B5', 'normal'),
(26, 'B6', 'vip'),
(26, 'B7', 'vip'),
(26, 'B8', 'normal');

-- Cinema 14, Sala 1
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(27, 'A1', 'normal'),
(27, 'A2', 'vip'),
(27, 'A3', 'vip'),
(27, 'A4', 'normal'),
(27, 'A5', 'normal'),
(27, 'A6', 'vip'),
(27, 'A7', 'vip'),
(27, 'A8', 'normal');


-- Cinema 14, Sala 2
INSERT INTO assento (fkSala, numero, Tipo) VALUES
(28, 'B1', 'normal'),
(28, 'B2', 'vip'),
(28, 'B3', 'vip'),
(28, 'B4', 'normal'),
(28, 'B5', 'normal'),
(28, 'B6', 'vip'),
(28, 'B7', 'vip'),
(28, 'B8', 'normal');

-- Cinema 1, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(1, 5, '2024-07-05 14:00:00', '2D'),
(1, 6, '2024-07-05 17:00:00', '3D'),
(1, 7, '2024-07-06 14:00:00', '2D'),
(1, 8, '2024-07-06 17:00:00', '3D');

-- Cinema 1, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(2, 5, '2024-07-07 14:00:00', '2D'),
(2, 6, '2024-07-07 17:00:00', '3D'),
(2, 7, '2024-07-08 14:00:00', '2D'),
(2, 8, '2024-07-08 17:00:00', '3D');

-- Cinema 2, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(3, 1, '2024-07-09 14:00:00', '2D'),
(3, 7, '2024-07-09 17:00:00', '3D'),
(3, 10, '2024-07-10 14:00:00', '2D'),
(3, 8, '2024-07-10 17:00:00', '3D');

-- Cinema 2, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(4, 10, '2024-07-11 14:00:00', '2D'),
(4, 11, '2024-07-11 17:00:00', '3D'),
(4, 12, '2024-07-12 14:00:00', '2D'),
(4, 8, '2024-07-12 17:00:00', '3D');

-- Cinema 3, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(5, 7, '2024-07-13 14:00:00', '2D'),
(5, 5, '2024-07-13 17:00:00', '3D'),
(5, 2, '2024-07-14 14:00:00', '2D'),
(5, 9, '2024-07-14 17:00:00', '3D');

-- Cinema 3, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(6, 10, '2024-07-15 14:00:00', '2D'),
(6, 12, '2024-07-15 17:00:00', '3D'),
(6, 3, '2024-07-16 14:00:00', '2D'),
(6, 7, '2024-07-16 17:00:00', '3D');

-- Cinema 4, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(7, 8, '2024-07-17 14:00:00', '2D'),
(7, 12, '2024-07-17 17:00:00', '3D'),
(7, 2, '2024-07-18 14:00:00', '2D'),
(7, 5, '2024-07-18 17:00:00', '3D');

-- Cinema 4, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(8, 12, '2024-07-19 14:00:00', '2D'),
(8, 11, '2024-07-19 17:00:00', '3D'),
(8, 7, '2024-07-20 14:00:00', '2D'),
(8, 8, '2024-07-20 17:00:00', '3D');

-- Cinema 5, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(9, 4, '2024-07-21 14:00:00', '2D'),
(9, 9, '2024-07-21 17:00:00', '3D'),
(9, 2, '2024-07-22 14:00:00', '2D'),
(9, 8, '2024-07-22 17:00:00', '3D');

-- Cinema 5, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(10, 2, '2024-07-23 14:00:00', '2D'),
(10, 7, '2024-07-23 17:00:00', '3D'),
(10, 10, '2024-07-24 14:00:00', '2D'),
(10, 8, '2024-07-24 17:00:00', '3D');

-- Cinema 6, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(11, 10, '2024-07-25 14:00:00', '2D'),
(11, 12, '2024-07-25 17:00:00', '3D'),
(11, 3, '2024-07-26 14:00:00', '2D'),
(11, 4, '2024-07-26 17:00:00', '3D');

-- Cinema 6, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(12, 2, '2024-07-27 14:00:00', '2D'),
(12, 6, '2024-07-27 17:00:00', '3D'),
(12, 8, '2024-07-28 14:00:00', '2D'),
(12, 10, '2024-07-28 17:00:00', '3D');

-- Cinema 7, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(13, 12, '2024-07-29 14:00:00', '2D'),
(13, 10, '2024-07-29 17:00:00', '3D'),
(13, 3, '2024-07-30 14:00:00', '2D'),
(13, 4, '2024-07-30 17:00:00', '3D');

-- Cinema 7, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(14, 1, '2024-07-31 14:00:00', '2D'),
(14, 2, '2024-07-31 17:00:00', '3D'),
(14, 3, '2024-08-01 14:00:00', '2D'),
(14, 4, '2024-08-01 17:00:00', '3D');

-- Cinema 8, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(15, 10, '2024-08-02 14:00:00', '2D'),
(15, 4, '2024-08-02 17:00:00', '3D'),
(15, 6, '2024-08-03 14:00:00', '2D'),
(15, 8, '2024-08-03 17:00:00', '3D');

-- Cinema 8, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(16, 2, '2024-08-04 14:00:00', '2D'),
(16, 1, '2024-08-04 17:00:00', '3D'),
(16, 9, '2024-08-05 14:00:00', '2D'),
(16, 5, '2024-08-05 17:00:00', '3D');

-- Cinema 9, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(17, 3, '2024-08-06 14:00:00', '2D'),
(17, 6, '2024-08-06 17:00:00', '3D'),
(17, 1, '2024-08-07 14:00:00', '2D'),
(17, 8, '2024-08-07 17:00:00', '3D');

-- Cinema 9, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(18, 1, '2024-08-08 14:00:00', '2D'),
(18, 5, '2024-08-08 17:00:00', '3D'),
(18, 9, '2024-08-09 14:00:00', '2D'),
(18, 10, '2024-08-09 17:00:00', '3D');

-- Cinema 10, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(19, 11, '2024-08-10 14:00:00', '2D'),
(19, 4, '2024-08-10 17:00:00', '3D'),
(19, 6, '2024-08-11 14:00:00', '2D'),
(19, 7, '2024-08-11 17:00:00', '3D');

-- Cinema 10, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(20, 7, '2024-08-12 14:00:00', '2D'),
(20, 8, '2024-08-12 17:00:00', '3D'),
(20, 3, '2024-08-13 14:00:00', '2D'),
(20, 1, '2024-08-13 17:00:00', '3D');

-- Cinema 11, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(21, 5, '2024-08-14 14:00:00', '2D'),
(21, 2, '2024-08-14 17:00:00', '3D'),
(21, 8, '2024-08-15 14:00:00', '2D'),
(21, 4, '2024-08-15 17:00:00', '3D');

-- Cinema 11, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(22, 10, '2024-08-16 14:00:00', '2D'),
(22, 2, '2024-08-16 17:00:00', '3D'),
(22, 5, '2024-08-17 14:00:00', '2D'),
(22, 9, '2024-08-17 17:00:00', '3D');

-- Cinema 12, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(23, 5, '2024-08-18 14:00:00', '2D'),
(23, 9, '2024-08-18 17:00:00', '3D'),
(23, 2, '2024-08-19 14:00:00', '2D'),
(23, 1, '2024-08-19 17:00:00', '3D');

-- Cinema 12, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(24, 5, '2024-08-20 14:00:00', '2D'),
(24, 9, '2024-08-20 17:00:00', '3D'),
(24, 7, '2024-08-21 14:00:00', '2D'),
(24, 10, '2024-08-21 17:00:00', '3D');

-- Cinema 13, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(25, 12, '2024-08-22 14:00:00', '2D'),
(25, 2, '2024-08-22 17:00:00', '3D'),
(25, 11, '2024-08-23 14:00:00', '2D'),
(25, 7, '2024-08-23 17:00:00', '3D');

-- Cinema 13, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(26, 8, '2024-08-24 14:00:00', '2D'),
(26, 10, '2024-08-24 17:00:00', '3D'),
(26, 2, '2024-08-25 14:00:00', '2D'),
(26, 1, '2024-08-25 17:00:00', '3D');

-- Cinema 14, Sala 1
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(27, 5, '2024-08-26 14:00:00', '2D'),
(27, 2, '2024-08-26 17:00:00', '3D'),
(27, 12, '2024-08-27 14:00:00', '2D'),
(27, 4, '2024-08-27 17:00:00', '3D');
select * from assento;
-- Cinema 14, Sala 2
INSERT INTO sessao (fkSala, fkFilme, dataHora, tipoSessao) VALUES
(28, 12, '2024-08-28 14:00:00', '2D'),
(28, 9, '2024-08-28 17:00:00', '3D'),
(28, 3, '2024-08-29 14:00:00', '2D'),
(28, 9, '2024-08-29 17:00:00', '3D');


SELECT * FROM sessao WHERE DATE(dataHora) = '2024-07-01' AND tipoSessao = '2D';
SELECT DATE(dataHora) AS data FROM sessao where fkFilme = 1 GROUP BY DATE(dataHora);
SELECT DATE(dataHora) AS data FROM sessao GROUP BY DATE(dataHora);
select * from sala join cinema on fkCinema = idCinema;
select f.idFilme, f.titulo, s.idSessao, s.tipoSessao from filme as f join sessao as s on fkFilme= idFilme;


INSERT INTO preco (dia, preco) VALUES
('Segunda-feira', 20.00),
('Terça-feira', 20.00),
('Quarta-feira', 15.00),
('Quinta-feira', 30.00),
('Sexta-feira', 30.00),
('Sábado', 40.00),
('Domingo', 40.00);

INSERT INTO cliente (nome, username, email, senha, telefone, cpf) VALUES
('João da Silva', 'joao123', 'joao.silva@example.com', 'senha123', '11987654321', '12345678901');

-- Inserindo dados na tabela ingresso
INSERT INTO ingresso (fkCliente, fkSessao, fkAssento, dataHora, total) VALUES
(1, 6, 27, '2024-06-28 12:00:00', 50.5);

select * from cliente;
select * from ingresso where fkSessao = 1 and fkAssento = 2;
select * from filme;
select * from sessao;
select * from preco;



select * from assento right join ingresso on fkAssento = idAssento where fkSessao = 1;

select a.numero, a.tipo, s.nome from assento as a join sala as s on fkSala = idSala where idSala = 1;

select a.* from assento as a join sala as s on fkSala = idSala where idSala = 1;






