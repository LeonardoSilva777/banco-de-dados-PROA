create database banco_livros; /*cria o banco de dado*/

drop database banco_livros; /*Exclui fisicamente o banco? */

use banco_livros; /*Entrei no banco*/

create table tb_livro(
	pk_id_livro int primary key auto_increment not null,
    nome_livro varchar (100),
    numero_paginas int,
    genero_livro enum("suspense","terror", "ficção cientifica", "comedia", "ação"),
    preco_livro decimal(8,2),
	capa_dura enum("mole", "pacaná", "cartão","roller"),
    data_leitura date,
    tipo_livro enum("digital","impresso","audiobook"),
    idioma enum("portugues", "ingles","espanhol","alemão","francês"),
    avaliacao_livro enum("otimo","bom","regular","ruim","pessimo"),
    status_livro enum("lido", "lendo", "não lido"),
    edicao_livro varchar (30),
    estado_livro enum ("novo", "usado", "semi-novo")
);

insert into tb_livro (nome_livro,numero_paginas, genero_livro, preco_livro, capa_dura, data_leitura, tipo_livro, idioma, avaliacao_livro, status_livro, edicao_livro, estado_livro) values 


("Harry Potter", 150 , "ficção cientifica", 250.00 , "mole" , '2025-10-21' , "impresso" , "ingles" , "otimo", "lido" , "Primeira edição" , "novo" ),
("O Pequeno Príncipe", 96, "ação", 45.90, "pacaná", '2025-05-10', "impresso", "portugues", "otimo", "lido", "Edição Especial", "usado" ),
("A Garota do Lago", 400, "suspense", 89.90, "cartão", "2025-05-10", "impresso", "portugues", "otimo", "lido", "1ª Edição", "novo"),
("O Iluminado", 600, "terror", 65.50, "mole", "2025-07-25", "impresso", "ingles", "otimo", "lido", "Edição de Bolso", "usado"),
("Androides Sonham com Ovelhas Elétricas?", 256, "ficção cientifica", 49.99, "pacaná", "2025-10-21", "digital", "portugues", "bom", "lendo", "Única", "semi-novo"),
("O Guia do Mochileiro das Galáxias", 224, "comedia", 40.20, "cartão", "2025-06-12", "audiobook", "ingles", "otimo", "lido", "42ª Edição", "usado"),
("O Código Da Vinci", 450, "suspense", 75.75, "roller", "2026-01-15", "impresso", "portugues", "bom", "não lido", "Edição de Cinema", "novo"),
("Cujo", 320, "terror", 55.90, "pacaná", "2025-11-05", "impresso", "ingles", "regular", "lido", "Nova Capa", "novo"),
("Blade Runner", 250, "ficção cientifica", 39.90, "mole", "2026-03-20", "digital", "espanhol", "pessimo", "lendo", "Filme Edition", "semi-novo"),
("Um Estranho Mundo", 200, "ação", 60.00, "roller", "2025-09-01", "impresso", "alemão", "ruim", "lido", "10º Aniversário", "usado");

/*----------------------------------------------------------------------*/
describe tb_livro; /*exibe a estrutura da tabela*/ 

select * from tb_livro; /*Exibe o conteudo da tabela*/

drop table tb_livro; /*apaga o DB*/