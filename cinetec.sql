CREATE DATABASE cinetec;
USE cinetec;

CREATE TABLE tbl_diretor (
     id_diretor INT PRIMARY KEY AUTO_INCREMENT,
   nome_diretor VARCHAR(45) NOT NULL,
   nacionalidade VARCHAR(45) NOT NULL,
   dt_nascimento DATE NOT NULL,
   sexo ENUM('M','F') NOT NULL,
   deletado BOOLEAN DEFAULT FALSE
);

CREATE TABLE tbl_genero (
     id_genero INT PRIMARY KEY AUTO_INCREMENT,
   genero VARCHAR(45) NOT NULL,
   deletado BOOLEAN DEFAULT FALSE
);

CREATE TABLE tbl_ator (
     id_ator INT PRIMARY KEY AUTO_INCREMENT,
   nome_ator VARCHAR(45) NOT NULL,
   sexo VARCHAR(1) NOT NULL,
   dt_nascimento DATE NOT NULL,
   deletado BOOLEAN DEFAULT FALSE
);

CREATE TABLE tbl_filme (
     id_filme INT PRIMARY KEY AUTO_INCREMENT,
   nome_filme VARCHAR(45) NOT NULL,
   ano_lancamento INT(4) NOT NULL,
   duracao INT(3) NOT NULL,
   FK_id_genero INT NOT NULL,
   FK_id_diretor INT NOT NULL,
   deletado BOOLEAN DEFAULT FALSE,
     CONSTRAINT FK_id_genero FOREIGN KEY(FK_id_genero) REFERENCES tbl_genero
(id_genero),
     CONSTRAINT FK_id_diretor FOREIGN KEY(FK_id_diretor) REFERENCES tbl_diretor
(id_diretor)
);

CREATE TABLE tbl_filme_ator (
     FK_id_ator INT,
   FK_id_filme INT,
   CONSTRAINT FK_id_ator FOREIGN KEY(FK_id_ator) REFERENCES tbl_ator
(id_ator),
   CONSTRAINT FK_id_filme FOREIGN KEY(FK_id_filme) REFERENCES tbl_filme
(id_filme)
);

CREATE TABLE tbl_usuario (
     id_usuario INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(45) NOT NULL,
   email VARCHAR(45) NOT NULL,
   senha VARCHAR(45) NOT NULL,
   tipo_usuario ENUM('administrador', 'comum') NOT NULL DEFAULT 'comum',
   criado_em DATETIME DEFAULT NOW(),
   deletado BOOLEAN DEFAULT FALSE
);

select *from tbl_usuario;

ALTER TABLE tbl_filme_ator RENAME filme_e_ator;
select *from filme_e_ator;

INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Andrew Garfield", 'M', '1983-08-20');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Sandra Bullock", 'F', '1980-06-26');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Will Smith", 'M', '1968-09-25');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Harrison Ford", 'M', '1942-07-13');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Hugh Jackman", 'M', '1968-10-12');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Angelina Jolie", 'F', '1975-06-04');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Keanu Reeves", 'M', '1964-09-02');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Jennifer Lawrence", 'F', '1990-08-15');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Sylvester Stallone", 'M', '1946-07-06');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("James Mcavoy", 'M', '1979-04-21');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Brad Pitt", 'M', '1963-12-18');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Leonardo Dicaprio", 'M', '1974-11-11');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Vin Diesel", 'M', '1967-07-18');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Johnny Depp", 'M', '1963-06-09');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Robin Williams", 'M', '1951-07-21');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Robert Downey Jr.", 'M', '1965-04-04');
INSERT INTO tbl_ator (nome_ator, sexo, dt_nascimento) VALUES ("Patrick Stewart", 'M', '1940-07-13');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Sandra Bullock", 'F','1980-06-26');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Jackie Chan", 'M','1954-04-07');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Jennifer Aniston", 'F','1969-02-11');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Jim Carrey", 'M','1962-01-17');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Scarlett Johansson", 'F','1984-11-22');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Megan Fox", 'F','1986-05-16');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Ben Stiller", 'M','1965-11-30');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Emma Stone", 'F','1988-11-06');
INSERT INTO tbl_ator(nome_ator, sexo, dt_nascimento) VALUES ("Tom Hanks", 'M','1956-07-09');

select * from tbl_ator;

#INSERT'S NA TABELA Diretor.
INSERT INTO tbl_diretor (nome_diretor, nacionalidade, dt_nascimento, sexo) VALUES
("Steven Spielberg", "estados unidos", '1946-12-18', 'M'),
("James Cameron", "Canada", '1954-08-16', 'M'),
("José Padilha", "Brasil", '1967-08-01', 'M'),
("George Lucas", "Estados Unidos", '1944-05-14', 'M'),
("Alan Rickman", "Inglaterra", '1946-02-21', 'M'),
("Fernando Meirelles", "Brasil", '1965-11-09', 'M'),
("Robert Zemeckis", "Estados Unidos", '1952-05-14', 'M');

select * from tbl_diretor;

#INSERT'S NA TABELA GENERO.
INSERT INTO tbl_genero (genero) VALUES ("Terror");
INSERT INTO tbl_genero (genero) VALUES ("Ação");
INSERT INTO tbl_genero (genero) VALUES ("Comedia");
INSERT INTO tbl_genero (genero) VALUES ("Drama");
INSERT INTO tbl_genero (genero) VALUES ("Suspense");
INSERT INTO tbl_genero (genero) VALUES ("Ficção");
INSERT INTO tbl_genero (genero) VALUES ("Romance");
INSERT INTO tbl_genero (genero) VALUES ("Musical");

select * from tbl_genero;

#INSERT'S NA TABELA FILME.
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Viva: A Vida é Uma Festa", 2017, 105, 8, 5);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Tropa de Elite", 2017, 250, 2, 1);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Um Sonho de Liberdade", 1995, 142, 4, 5);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Matrix", 1999, 150, 6, 1);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Jumanji", 1996, 104, 3, 6);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Cidade de Deus", 2002, 135, 2, 3);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("O Resgate do Soldado Ryan", 1998, 170, 2, 6);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Extraordinário", 2017, 113, 4, 5);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("O Poderoso Chefão", 1972, 178, 2, 2);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Forrest Gump", 1994, 142, 7, 1);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Truque de Mestre", 2013, 125, 2, 4);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Fragmentado", 2017, 117, 4, 6);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Avatar", 2009, 162, 6, 2);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("O Preço do Amanhã", 2011, 109, 2, 3);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("O Senhor dos Anéis: O Retorno do Rei", 2003, 200, 6, 5);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Toy Story", 1995, 141, 8, 2);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Star Wars: Os Últimos Jedi", 2017, 152, 6, 4);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("O Menino do Pijama Listrado", 2008, 94, 4, 1);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("O Lobo de Wall Street", 2013, 181, 4, 6);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("A Hora do Rush", 1998, 98, 3, 5);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Piratas do Caribe - Maldição do Perola Negra", 2003, 143, 2, 4);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Passengeiros", 2016, 116, 2, 1);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Beleza Oculta", 2016, 97, 4, 2);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("It - A Coisa", 2017, 134, 1, 3);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Rocky V", 1990, 111, 4, 4);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Titanic", 1997, 195, 7, 4);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Vingadores 4", 2019, 150, 2, 2);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Velozes e Furiosos 8", 2017, 136, 2, 6);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Transformers", 2007, 150, 2, 4);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("A Ilha do Medo", 2010, 139, 5, 1);
INSERT INTO tbl_filme (nome_filme, ano_lancamento, duracao, FK_id_genero, FK_id_diretor) VALUES 
("Forest Gump: O contador de histórias", 1994, 142, 3, 7);

select * from tbl_filme;