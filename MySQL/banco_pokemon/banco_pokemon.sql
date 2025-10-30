create database bd_pokemon;
use bd_pokemon;
drop database bd_pokemon;

create table tb_treinador(
	id_treinador int primary key auto_increment not null,
    nome_treinador varchar (100) not null,
    idade_treinador int not null,
    caracteristicas_treinador varchar (200) not null,
    insignias_treinador int not null,
    fk_ginasio_id int not null, 
    fk_num_pokedex int not null,
    fk_id_pokemon int not null
);

select * from tb_treinador;
select * from tb_pokemon_treinador;
select * from tb_pokemon_selvagem;
select * from tb_ginasio;

insert into tb_treinador (nome_treinador, idade_treinador, caracteristicas_treinador, insignias_treinador, fk_ginasio_id, fk_num_pokedex, fk_id_pokemon) VALUES
('Ash Ketchum', 10, 'Protagonista do anime, determinado e nunca desiste.', 8, 1, 1, 1),
('Red', 11, 'Lendário campeão de Kanto, silencioso e muito poderoso.', 8, 1, 2, 2),
('Blue (Gary Carvalho)', 11, 'Rival de Red e Ash, arrogante e estrategista.', 8, 1, 3, 3),
('Cynthia', 20, 'Campeã da Liga Pokémon de Sinnoh, estudiosa de mitos.', 0, 1, 4, 4),
('N', 18, 'Ex-líder da Equipe Plasma, busca um mundo livre de conflitos entre humanos e Pokémon.', 0, 1, 5, 5);

alter table tb_treinador
drop primary key,
add constraint pk_id_treinador primary key (id_treinador),
add constraint fk_num_pokedex foreign key(fk_num_pokedex) references tb_pokemon_selvagem (num_pokedex),
add constraint fk_id_ginasio foreign key(fk_ginasio_id) references tb_ginasio (id_ginasio),
add constraint fk_id_pokemon foreign key (fk_id_pokemon) references tb_pokemon_treinador (id_pokemon); 

create table tb_pokemon_treinador (
	id_pokemon int primary key auto_increment not null,
    nome_pokemon varchar (30),
    nivel_pokemon int not null,
    experiencia_pokemon int not null,
    natureza_pokemon varchar (30),
    hp_max int not null,
    hp_atual int not null,
    status varchar (50),
    na_equipe boolean not null,
    slot_equipe int not null,
    fk_id_treinador int,
    fk_num_pokedex int
);

insert into tb_pokemon_treinador ( nome_pokemon, nivel_pokemon, experiencia_pokemon, natureza_pokemon, hp_max, hp_atual, status, na_equipe, slot_equipe, fk_id_treinador, fk_num_pokedex) values
('Pikachu do Ash', 100, 999999, 'Hardy', 250, 250, 'Healthy', TRUE, 1, 1, 1),
('Snorlax do Red', 88, 500000, 'Careful', 400, 400, 'Healthy', TRUE, 2, 2, 3),
('Blastoise do Blue', 86, 450000, 'Jolly', 300, 300, 'Healthy', TRUE, 3, 3, 2),
('Garchomp da Cynthia', 100, 999999, 'Jolly', 350, 350, 'Healthy', TRUE, 4, 4, 4),
('Zoroark do N', 70, 300000, 'Lonely', 280, 280, 'Healthy', TRUE, 5, 5, 5);

alter table tb_pokemon_treinador
drop primary key,
add constraint pk_id_pokemon primary key (id_pokemon),
add constraint fk_num_pokedex_pokemon foreign key(fk_num_pokedex) references tb_pokemon_selvagem (num_pokedex),
add constraint fk_id_treinador_pokemon foreign key (fk_id_treinador) references tb_treinador (id_treinador);

create table tb_pokemon_selvagem (
	num_pokedex int primary key auto_increment not null,
    nome_pokemon_selvagem varchar (30) not null,
    forma_pokemon enum ("Famele", "Male") not null,
    tipo_1 varchar (20) not null,
    tipo_2 varchar (20) not null,
    hp_base int not null,
    atk_base int not null,
    def_base int not null,
    sp_atk_base int not null,
    sp_def_base int not null,
    agl_base int not null,
    fk_id_treinador int not null,
    fk_id_pokemon int not null
);

insert into tb_pokemon_selvagem (nome_pokemon_selvagem, forma_pokemon, tipo_1, tipo_2, hp_base, atk_base, def_base, sp_atk_base, sp_def_base, agl_base, fk_id_treinador, fk_id_pokemon ) values
('Pikachu', 'Male', 'Elétrico', 'Elétrico', 35, 55, 40, 50, 50, 90, 1, 1),
('Charizard', 'Male', 'Fogo', 'Voador', 78, 84, 78, 109, 85, 100, 1, 1),
('Snorlax', 'Male', 'Normal', 'Normal', 160, 110, 65, 65, 110, 30, 1, 1),
('Garchomp', 'Male', 'Dragão', 'Terra', 108, 130, 95, 80, 85, 102, 1, 1),
('Zoroark', 'Male', 'Sombrio', 'Sombrio', 60, 105, 60, 120, 60, 105, 1, 1);

alter table tb_pokemon_selvagem
drop primary key,
add constraint pk_num_pokedex primary key (num_pokedex),
add constraint fk_pokemon_pokedex foreign key(fk_id_pokemon) references tb_pokemon_treinador(id_pokemon),
add constraint fk_id_treinador_pokedex foreign key (fk_id_treinador) references tb_treinador (id_treinador);

create table tb_ginasio (
	id_ginasio int primary key auto_increment not null,
    nome_ginasio varchar (40),
    nome_lider varchar (100),
    regiao_ginasio varchar (50),
    tipo_ginasio enum ("Pedra", "Água", "Elétrico", "Grama", "Veneno", "Psíquico", "Fogo", "Terra"),
    fk_id_treinador int not null
);

insert into tb_ginasio (nome_ginasio, nome_lider, regiao_ginasio, tipo_ginasio, fk_id_treinador) values
('Pewter City Gym', 'Brock', 'Kanto', 'Pedra', 101),
('Cerulean City Gym', 'Misty', 'Kanto', 'Água', 102),
('Vermilion City Gym', 'Lt. Surge', 'Kanto', 'Elétrico', 103),
('Celadon City Gym', 'Erika', 'Kanto', 'Grama', 104),
('Fuchsia City Gym', 'Koga', 'Kanto', 'Veneno', 105);


alter table tb_ginasio
add constraint fk_id_treinador_ginasio foreign key (fk_id_treinador) references tb_treinador (id_treinador);