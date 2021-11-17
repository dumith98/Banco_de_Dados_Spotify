CREATE SCHEMA spotify;
USE spotify;

CREATE TABLE usuario (
usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_usuario VARCHAR (45),
data_nasc DATE,
sexo VARCHAR (1),
email VARCHAR (45),
senha VARCHAR (45)
);

CREATE TABLE artista (
artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_artista VARCHAR(45),
sobrenome_artista VARCHAR(100)
);

CREATE TABLE genero (
genero_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
genero VARCHAR(45)
);

CREATE TABLE playlist (
playlist_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
usuario_id INT,
CONSTRAINT FKusuario
FOREIGN KEY (usuario_id)
REFERENCES usuario(usuario_id),
playlist_titulo VARCHAR(45),
playlist_qtd_musicas SMALLINT,
playlist_data_criacao DATETIME
);

CREATE TABLE album (
album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
album_titulo VARCHAR(45),
artista_id  INT,
CONSTRAINT FKartista
FOREIGN KEY (artista_id)
REFERENCES artista(artista_id)
);

CREATE TABLE cancoes (
cancao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cancao_titulo VARCHAR(45),
cancao_duracao DOUBLE,
cancao_qtd_reproducao INT,
cancao_qtd_likes INT,
album_id INT,
CONSTRAINT FKalbum
FOREIGN KEY (album_id)
REFERENCES album(album_id)
);

CREATE TABLE playlist_cancao (
playlist_cancao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cancao_id INT,
CONSTRAINT FKcancoes
FOREIGN KEY (cancao_id)
REFERENCES cancoes(cancao_id),
playlist_id INT,
CONSTRAINT FKplaylist
FOREIGN KEY (playlist_id)
REFERENCES playlist(playlist_id)
);


CREATE TABLE genero_cancao (
genero_cancao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cancao_id INT,
FOREIGN KEY (cancao_id)
REFERENCES cancoes(cancao_id),
genero_id INT,
CONSTRAINT FKgenero
FOREIGN KEY (genero_id)
REFERENCES genero(genero_id)
);




INSERT INTO usuario (nome_usuario, data_nasc, sexo, email, senha) 
VALUES ('Dumith', '1998-04-08', 'M', 'dumith98@gmail.com', 'senhaexemplo1');

INSERT INTO usuario (nome_usuario, data_nasc, sexo, email, senha) 
VALUES ('Aisha', '2003-04-16', 'F', 'aisha@emauil.com', 'senhaexemplo2');

INSERT INTO usuario (nome_usuario, data_nasc, sexo, email, senha) 
VALUES ('João', '1999-04-18', 'M', 'joao@email.com', 'senhaexemplo3');


INSERT INTO artista (nome_artista, sobrenome_artista)
VALUES ('Johan', 'Hegg');

INSERT INTO artista (nome_artista, sobrenome_artista)
VALUES ('Bruce', 'Dickinson');

INSERT INTO artista (nome_artista, sobrenome_artista)
VALUES ('Hansi', 'Kürsch');


INSERT INTO album (album_titulo, artista_id)
VALUES ('Jomsviking', 1);

INSERT INTO album (album_titulo, artista_id)
VALUES ('At the Edge of Time', 3);

INSERT INTO album (album_titulo, artista_id)
VALUES ('Death on the Road', 2);

INSERT INTO album (album_titulo, artista_id)
VALUES ('Berserker', 1);


INSERT INTO cancoes (cancao_titulo, cancao_duracao, cancao_qtd_reproducao, cancao_qtd_likes, album_id)
VALUES ('Valkyria', 283, 420071, 3649, 1);

INSERT INTO cancoes (cancao_titulo, cancao_duracao, cancao_qtd_reproducao, cancao_qtd_likes, album_id)
VALUES ('Skoll and Hati', 264, 258493, 2209, 1);

INSERT INTO cancoes (cancao_titulo, cancao_duracao, cancao_qtd_reproducao, cancao_qtd_likes, album_id)
VALUES ('No More Lies', 459, 127596 , 1012, 2);


UPDATE cancoes
SET album_id = 4
WHERE album_id = 1;


SELECT * FROM album;
