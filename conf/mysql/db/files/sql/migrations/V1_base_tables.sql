use pokemondb;

/*Borrado de tablas*/

drop table if exists MO;
drop table if exists MT;
drop table if exists nivel_aprendizaje;
drop table if exists pokemon_tipo;
drop table if exists piedra;
drop table if exists tipo_piedra;
drop table if exists nivel_evolucion;
drop table if exists pokemon_movimiento_forma;
drop table if exists pokemon_forma_evolucion;
drop table if exists forma_evolucion;
drop table if exists tipo_evolucion;
drop table if exists forma_aprendizaje;
drop table if exists tipo_forma_aprendizaje;
drop table if exists movimiento_efecto_secundario;
drop table if exists efecto_secundario;
drop table if exists movimiento;
drop table if exists tipo;
drop table if exists tipo_ataque;
drop table if exists tipo_forma_aprendizaje;
drop table if exists estadisticas_base;
drop table if exists evoluciona_de;
drop table if exists pokemon;

/*Tablas*/

Create table if not exists pokemon
(
    numero_pokedex int primary key AUTO_INCREMENT,
    nombre         varchar(15) not null,
    peso           real        not null,
    altura         real        not null
);

Create table if not exists tipo_ataque
(
    id_tipo_ataque int primary key AUTO_INCREMENT,
    tipo           varchar(8) not null
);


Create table if not exists tipo
(
    id_tipo        int primary key AUTO_INCREMENT,
    nombre         varchar(10) not null,
    id_tipo_ataque int         not null,
    foreign key (id_tipo_ataque) references tipo_ataque (id_tipo_ataque)
);


Create table if not exists pokemon_tipo
(
    numero_pokedex int not null,
    id_tipo        int not null,
    primary key (numero_pokedex, id_tipo),
    foreign key (numero_pokedex) references pokemon (numero_pokedex),
    foreign key (id_tipo) references tipo (id_tipo)
);

Create table if not exists estadisticas_base
(
    numero_pokedex int primary key,
    ps             int not null,
    ataque         int not null,
    defensa        int not null,
    especial       int not null,
    velocidad      int not null,
    foreign key (numero_pokedex) references pokemon (numero_pokedex)
);

Create table if not exists movimiento
(
    id_movimiento int primary key AUTO_INCREMENT,
    nombre        varchar(20)  not null,
    potencia      int          not null,
    precision_mov int          not null,
    descripcion   varchar(500) not null,
    pp            int          not null,
    id_tipo       int          not null,
    prioridad     int          not null default 0,
    foreign key (id_tipo) references tipo (id_tipo)
);

Create table if not exists efecto_secundario
(
    id_efecto_secundario int primary key,
    efecto_secundario    varchar(30) not null
);

Create table if not exists movimiento_efecto_secundario
(
    id_movimiento        int,
    id_efecto_secundario int,
    probabilidad         real not null,
    primary key (id_movimiento, id_efecto_secundario),
    foreign key (id_movimiento) references movimiento (id_movimiento),
    foreign key (id_efecto_secundario) references efecto_secundario (id_efecto_secundario)
);

Create table if not exists tipo_forma_aprendizaje
(
    id_tipo_aprendizaje int primary key AUTO_INCREMENT,
    tipo_aprendizaje    varchar(20) not null
);

Create table if not exists forma_aprendizaje
(
    id_forma_aprendizaje int primary key AUTO_INCREMENT,
    id_tipo_aprendizaje  int not null,
    foreign key (id_tipo_aprendizaje) references tipo_forma_aprendizaje (id_tipo_aprendizaje)
);

Create table if not exists MT
(
    id_forma_aprendizaje int primary key,
    MT                   varchar(5) not null,
    foreign key (id_forma_aprendizaje) references forma_aprendizaje (id_forma_aprendizaje)
);

Create table if not exists MO
(
    id_forma_aprendizaje int primary key,
    MO                   varchar(5) not null,
    foreign key (id_forma_aprendizaje) references forma_aprendizaje (id_forma_aprendizaje)
);

Create table if not exists nivel_aprendizaje
(
    id_forma_aprendizaje int primary key,
    nivel                int not null,
    foreign key (id_forma_aprendizaje) references forma_aprendizaje (id_forma_aprendizaje)
);

Create table if not exists pokemon_movimiento_forma
(
    numero_pokedex       int,
    id_movimiento        int,
    id_forma_aprendizaje int,
    primary key (numero_pokedex, id_movimiento, id_forma_aprendizaje),
    foreign key (numero_pokedex) references pokemon (numero_pokedex),
    foreign key (id_movimiento) references movimiento (id_movimiento),
    foreign key (id_forma_aprendizaje) references forma_aprendizaje (id_forma_aprendizaje)
);

Create table if not exists tipo_evolucion
(
    id_tipo_evolucion int primary key,
    tipo_evolucion    varchar(15) not null
);

Create table if not exists forma_evolucion
(
    id_forma_evolucion int primary key,
    tipo_evolucion     int not null,
    foreign key (tipo_evolucion) references tipo_evolucion (id_tipo_evolucion)
);

Create table if not exists evoluciona_de
(
    pokemon_evolucionado int,
    pokemon_origen       int,
    primary key (pokemon_evolucionado, pokemon_origen),
    foreign key (pokemon_evolucionado) references pokemon (numero_pokedex),
    foreign key (pokemon_origen) references pokemon (numero_pokedex)
);

Create table if not exists tipo_piedra
(
    id_tipo_piedra int primary key,
    nombre_piedra  varchar(20) not null
);

Create table if not exists piedra
(
    id_forma_evolucion int primary key,
    id_tipo_piedra     int,
    foreign key (id_tipo_piedra) references tipo_piedra (id_tipo_piedra),
    foreign key (id_forma_evolucion) references forma_evolucion (id_forma_evolucion)
);

Create table if not exists nivel_evolucion
(
    id_forma_evolucion int primary key,
    nivel              int not null,
    foreign key (id_forma_evolucion) references forma_evolucion (id_forma_evolucion)
);

Create table if not exists pokemon_forma_evolucion
(
    numero_pokedex     int,
    id_forma_evolucion int,
    primary key (numero_pokedex, id_forma_evolucion),
    foreign key (numero_pokedex) references pokemon (numero_pokedex),
    foreign key (id_forma_evolucion) references forma_evolucion (id_forma_evolucion)
);

/* insercion de datos */

/*Tipos de ataques*/
insert into tipo_ataque
values (1, 'Físico');
insert into tipo_ataque
values (2, 'Especial');

/*Tipos*/
insert into tipo
values (1, 'Agua', 2);
insert into tipo
values (2, 'Bicho', 1);
insert into tipo
values (3, 'Dragón', 2);
insert into tipo
values (4, 'Eléctrico', 2);
insert into tipo
values (5, 'Fantasma', 1);
insert into tipo
values (6, 'Fuego', 2);
insert into tipo
values (7, 'Hielo', 2);
insert into tipo
values (8, 'Lucha', 1);
insert into tipo
values (9, 'Normal', 1);
insert into tipo
values (10, 'Planta', 2);
insert into tipo
values (11, 'Psíquico', 2);
insert into tipo
values (12, 'Roca', 1);
insert into tipo
values (13, 'Tierra', 1);
insert into tipo
values (14, 'Veneno', 1);
insert into tipo
values (15, 'Volador', 1);

/*Pokemon*/

insert into pokemon
values (1, 'Bulbasaur', 6.9, 0.7);
insert into pokemon
values (2, 'Ivysaur', 13, 1);
insert into pokemon
values (3, 'Venasaur', 100, 2);
insert into pokemon
values (4, 'Charmander', 8.5, 0.6);
insert into pokemon
values (5, 'Charmeleon', 19, 1.1);
insert into pokemon
values (6, 'Charizard', 90.5, 1.7);
insert into pokemon
values (7, 'Squirtle', 9, 0.5);
insert into pokemon
values (8, 'Wartortle', 22.5, 1);
insert into pokemon
values (9, 'Blastoise', 85.5, 1.6);
insert into pokemon
values (10, 'Caperpie', 2.9, 0.3);
insert into pokemon
values (11, 'Metapod', 9.9, 0.7);
insert into pokemon
values (12, 'Butterfree', 32, 1.1);
insert into pokemon
values (13, 'Weedle', 3.2, 0.3);
insert into pokemon
values (14, 'Kakuna', 10, 0.6);
insert into pokemon
values (15, 'Beedrill', 29.5, 1.0);
insert into pokemon
values (16, 'Pidgey', 1.8, 0.3);
insert into pokemon
values (17, 'Pidgeotto', 30, 1.1);
insert into pokemon
values (18, 'Pidgeot', 39.5, 1.5);
insert into pokemon
values (19, 'Rattata', 3.5, 0.3);
insert into pokemon
values (20, 'Raticate', 18.5, 0.7);
insert into pokemon
values (21, 'Spearow', 2, 0.3);
insert into pokemon
values (22, 'Fearow', 38, 1.2);
insert into pokemon
values (23, 'Ekans', 6.9, 2);
insert into pokemon
values (24, 'Arbok', 65, 3.5);
insert into pokemon
values (25, 'Pikachu', 6, 0.4);
insert into pokemon
values (26, 'Raichu', 30, 0.8);
insert into pokemon
values (27, 'Sandshrew', 12, 0.6);
insert into pokemon
values (28, 'Sandslash', 29.5, 1);
insert into pokemon
values (29, 'Nidoran♀', 7, 0.4);
insert into pokemon
values (30, 'Nidorina', 20, 0.8);
insert into pokemon
values (31, 'Nidoqueen', 60, 1.3);
insert into pokemon
values (32, 'Nidoran♂', 9, 0.5);
insert into pokemon
values (33, 'Nidorino', 19.5, 0.9);
insert into pokemon
values (34, 'Nidoking', 62, 1.4);
insert into pokemon
values (35, 'Clefairy', 7.5, 0.6);
insert into pokemon
values (36, 'Clefable', 40, 1.3);
insert into pokemon
values (37, 'Vulpix', 9.9, 0.6);
insert into pokemon
values (38, 'Ninetales', 19.9, 1.1);
insert into pokemon
values (39, 'Jigglypuff', 5.5, 0.5);
insert into pokemon
values (40, 'Wigglytuff', 12, 1);
insert into pokemon
values (41, 'Zubat', 7.5, 0.8);
insert into pokemon
values (42, 'Golbat', 55, 1.6);
insert into pokemon
values (43, 'Oddish', 5.4, 0.5);
insert into pokemon
values (44, 'Gloom', 8.6, 0.8);
insert into pokemon
values (45, 'Vileplume', 18.6, 1.2);
insert into pokemon
values (46, 'Paras', 5.4, 0.3);
insert into pokemon
values (47, 'Parasect', 29.5, 1);
insert into pokemon
values (48, 'Venonat', 30, 1);
insert into pokemon
values (49, 'Venomoth', 12.5, 1.5);
insert into pokemon
values (50, 'Digglet', 0.8, 0.2);
insert into pokemon
values (51, 'Dugtrio', 33.3, 0.7);
insert into pokemon
values (52, 'Meowth', 4.2, 0.4);
insert into pokemon
values (53, 'Persian', 32, 1);
insert into pokemon
values (54, 'Psyduck', 19.6, 0.8);
insert into pokemon
values (55, 'Golduck', 76.6, 1.7);
insert into pokemon
values (56, 'Mankey', 28, 0.5);
insert into pokemon
values (57, 'Primeape', 32, 1);
insert into pokemon
values (58, 'Growlithe', 19, 0.7);
insert into pokemon
values (59, 'Arcanine', 155, 1.9);
insert into pokemon
values (60, 'Poliwag', 12.4, 0.6);
insert into pokemon
values (61, 'Poliwhirl', 20, 1);
insert into pokemon
values (62, 'Poliwrath', 54, 1.3);
insert into pokemon
values (63, 'Abra', 19.5, 0.9);
insert into pokemon
values (64, 'Kadabra', 56.5, 1.3);
insert into pokemon
values (65, 'Alakazam', 48, 1.5);
insert into pokemon
values (66, 'Machop', 19.5, 0.8);
insert into pokemon
values (67, 'Mackoke', 70.5, 1.5);
insert into pokemon
values (68, 'Machamp', 130, 1.6);
insert into pokemon
values (69, 'Bellsprout', 4.0, 0.7);
insert into pokemon
values (70, 'Weepinbell', 6.4, 1);
insert into pokemon
values (71, 'Victreebel', 15.5, 1.7);
insert into pokemon
values (72, 'Tentacool', 45.5, 0.9);
insert into pokemon
values (73, 'Tentacruel', 55, 1.6);
insert into pokemon
values (74, 'Geodude', 20, 0.4);
insert into pokemon
values (75, 'Graveler', 105, 1);
insert into pokemon
values (76, 'Golem', 300, 1.4);
insert into pokemon
values (77, 'Ponyta', 30, 1);
insert into pokemon
values (78, 'Rapidash', 95, 1.7);
insert into pokemon
values (79, 'Slowpoke', 36, 1.2);
insert into pokemon
values (80, 'Slowbro', 78.5, 1.6);
insert into pokemon
values (81, 'Magnemite', 6.0, 0.3);
insert into pokemon
values (82, 'Magneton', 60, 1);
insert into pokemon
values (83, 'Farfetch\'d', 15, 0.8);
insert into pokemon
values (84, 'Doduo', 39.2, 1.4);
insert into pokemon
values (85, 'Dodrio', 85.2, 1.8);
insert into pokemon
values (86, 'Seel', 90, 1.1);
insert into pokemon
values (87, 'Dewgong', 120, 1.7);
insert into pokemon
values (88, 'Grimer', 30, 0.9);
insert into pokemon
values (89, 'Muk', 30, 1.2);
insert into pokemon
values (90, 'Shellder', 4, 0.3);
insert into pokemon
values (91, 'Cloyster', 132.5, 1.5);
insert into pokemon
values (92, 'Gastly', 0.1, 1.3);
insert into pokemon
values (93, 'Haunter', 0.1, 1.6);
insert into pokemon
values (94, 'Gengar', 40.5, 1.5);
insert into pokemon
values (95, 'Onix', 210, 8.8);
insert into pokemon
values (96, 'Drowzee', 32.4, 1);
insert into pokemon
values (97, 'Hypno', 75.6, 1.6);
insert into pokemon
values (98, 'Krabby', 6.5, 0.4);
insert into pokemon
values (99, 'Kingler', 60, 1.3);
insert into pokemon
values (100, 'Voltorb', 10.4, 0.5);
insert into pokemon
values (101, 'Electrode', 66.6, 1.2);
insert into pokemon
values (102, 'Exeggcute', 2.5, 0.4);
insert into pokemon
values (103, 'Exeggutor', 120, 2);
insert into pokemon
values (104, 'Cubone', 6.5, 0.4);
insert into pokemon
values (105, 'Marowak', 45, 1);
insert into pokemon
values (106, 'Hitmonlee', 49.8, 1.5);
insert into pokemon
values (107, 'Hitmonchan', 50.2, 1.4);
insert into pokemon
values (108, 'Lickitung', 65, 1.2);
insert into pokemon
values (109, 'Koffing', 1, 0.6);
insert into pokemon
values (110, 'Weezing', 9.5, 1.2);
insert into pokemon
values (111, 'Rhyhorn', 115, 1);
insert into pokemon
values (112, 'Rhydon', 120, 1.9);
insert into pokemon
values (113, 'Chansey', 34.6, 1.1);
insert into pokemon
values (114, 'Tangela', 35, 1);
insert into pokemon
values (115, 'Kangaskhan', 80, 2.2);
insert into pokemon
values (116, 'Horsea', 8, 0.4);
insert into pokemon
values (117, 'Seadra', 25, 1.2);
insert into pokemon
values (118, 'Goldeen', 15, 0.6);
insert into pokemon
values (119, 'Seaking', 39, 1.3);
insert into pokemon
values (120, 'Staryu', 34.5, 0.8);
insert into pokemon
values (121, 'Starmie', 80, 1.1);
insert into pokemon
values (122, 'Mr. Mime', 54.5, 1.3);
insert into pokemon
values (123, 'Scyther', 56, 1.5);
insert into pokemon
values (124, 'Jynx', 40.6, 1.4);
insert into pokemon
values (125, 'Electabuzz', 30, 1.1);
insert into pokemon
values (126, 'Magmar', 44.5, 1.3);
insert into pokemon
values (127, 'Pinsir', 55, 1.5);
insert into pokemon
values (128, 'Tauros', 88.4, 1.4);
insert into pokemon
values (129, 'Magikarp', 10, 0.9);
insert into pokemon
values (130, 'Gyarados', 235, 6.5);
insert into pokemon
values (131, 'Lapras', 220, 2.5);
insert into pokemon
values (132, 'Ditto', 4, 0.3);
insert into pokemon
values (133, 'Eevee', 6.5, 0.3);
insert into pokemon
values (134, 'Vaporeon', 29, 1);
insert into pokemon
values (135, 'Jolteon', 24.5, 0.8);
insert into pokemon
values (136, 'Flareon', 25, 0.9);
insert into pokemon
values (137, 'Porygon', 36.5, 0.8);
insert into pokemon
values (138, 'Omanyte', 7.5, 04);
insert into pokemon
values (139, 'Omastar', 35, 1);
insert into pokemon
values (140, 'Kabuto', 11.5, 0.5);
insert into pokemon
values (141, 'Kabutops', 40.5, 1.3);
insert into pokemon
values (142, 'Aerodactyl', 59, 1.8);
insert into pokemon
values (143, 'Snorlax', 460, 2.1);
insert into pokemon
values (144, 'Articuno', 55.4, 1.7);
insert into pokemon
values (145, 'Zapdos', 52.6, 1.6);
insert into pokemon
values (146, 'Moltres', 60, 2);
insert into pokemon
values (147, 'Dratini', 3.3, 1.8);
insert into pokemon
values (148, 'Dragonair', 16.5, 4);
insert into pokemon
values (149, 'Dragonite', 210, 2.2);
insert into pokemon
values (150, 'Mewtwo', 122, 2);
insert into pokemon
values (151, 'Mew', 4, 0.4);


/* Evoluciona de */
insert into evoluciona_de
values (2, 1);
insert into evoluciona_de
values (3, 2);
insert into evoluciona_de
values (5, 4);
insert into evoluciona_de
values (5, 6);
insert into evoluciona_de
values (6, 5);
insert into evoluciona_de
values (8, 7);
insert into evoluciona_de
values (9, 8);
insert into evoluciona_de
values (11, 10);
insert into evoluciona_de
values (12, 11);
insert into evoluciona_de
values (14, 13);
insert into evoluciona_de
values (15, 14);
insert into evoluciona_de
values (17, 16);
insert into evoluciona_de
values (18, 17);
insert into evoluciona_de
values (20, 19);
insert into evoluciona_de
values (22, 21);
insert into evoluciona_de
values (24, 23);
insert into evoluciona_de
values (26, 25);
insert into evoluciona_de
values (28, 27);
insert into evoluciona_de
values (30, 29);
insert into evoluciona_de
values (31, 30);
insert into evoluciona_de
values (33, 32);
insert into evoluciona_de
values (34, 33);
insert into evoluciona_de
values (36, 35);
insert into evoluciona_de
values (38, 37);
insert into evoluciona_de
values (40, 39);
insert into evoluciona_de
values (42, 41);
insert into evoluciona_de
values (44, 43);
insert into evoluciona_de
values (45, 44);
insert into evoluciona_de
values (47, 46);
insert into evoluciona_de
values (49, 48);
insert into evoluciona_de
values (51, 50);
insert into evoluciona_de
values (53, 52);
insert into evoluciona_de
values (55, 54);
insert into evoluciona_de
values (57, 56);
insert into evoluciona_de
values (59, 58);
insert into evoluciona_de
values (61, 60);
insert into evoluciona_de
values (62, 61);
insert into evoluciona_de
values (64, 63);
insert into evoluciona_de
values (65, 64);
insert into evoluciona_de
values (67, 66);
insert into evoluciona_de
values (68, 67);
insert into evoluciona_de
values (70, 69);
insert into evoluciona_de
values (71, 70);
insert into evoluciona_de
values (73, 72);
insert into evoluciona_de
values (75, 74);
insert into evoluciona_de
values (76, 75);
insert into evoluciona_de
values (78, 77);
insert into evoluciona_de
values (80, 79);
insert into evoluciona_de
values (82, 81);
insert into evoluciona_de
values (85, 84);
insert into evoluciona_de
values (87, 86);
insert into evoluciona_de
values (89, 88);
insert into evoluciona_de
values (91, 90);
insert into evoluciona_de
values (93, 92);
insert into evoluciona_de
values (94, 93);
insert into evoluciona_de
values (97, 96);
insert into evoluciona_de
values (99, 98);
insert into evoluciona_de
values (101, 100);
insert into evoluciona_de
values (103, 102);
insert into evoluciona_de
values (105, 104);
insert into evoluciona_de
values (110, 109);
insert into evoluciona_de
values (112, 111);
insert into evoluciona_de
values (117, 116);
insert into evoluciona_de
values (119, 118);
insert into evoluciona_de
values (121, 120);
insert into evoluciona_de
values (130, 129);
insert into evoluciona_de
values (134, 133);
insert into evoluciona_de
values (135, 133);
insert into evoluciona_de
values (136, 133);
insert into evoluciona_de
values (139, 138);
insert into evoluciona_de
values (141, 140);
insert into evoluciona_de
values (148, 147);
insert into evoluciona_de
values (149, 148);


/*Tipos Pokemon*/

insert into pokemon_tipo
values (1, 10);
insert into pokemon_tipo
values (1, 14);
insert into pokemon_tipo
values (2, 10);
insert into pokemon_tipo
values (2, 14);
insert into pokemon_tipo
values (3, 10);
insert into pokemon_tipo
values (3, 14);
insert into pokemon_tipo
values (4, 6);
insert into pokemon_tipo
values (5, 6);
insert into pokemon_tipo
values (6, 6);
insert into pokemon_tipo
values (6, 15);
insert into pokemon_tipo
values (7, 1);
insert into pokemon_tipo
values (8, 1);
insert into pokemon_tipo
values (9, 1);
insert into pokemon_tipo
values (10, 2);
insert into pokemon_tipo
values (11, 2);
insert into pokemon_tipo
values (12, 2);
insert into pokemon_tipo
values (12, 15);
insert into pokemon_tipo
values (13, 2);
insert into pokemon_tipo
values (13, 14);
insert into pokemon_tipo
values (14, 2);
insert into pokemon_tipo
values (14, 14);
insert into pokemon_tipo
values (15, 2);
insert into pokemon_tipo
values (15, 14);
insert into pokemon_tipo
values (16, 9);
insert into pokemon_tipo
values (16, 15);
insert into pokemon_tipo
values (17, 9);
insert into pokemon_tipo
values (17, 15);
insert into pokemon_tipo
values (18, 9);
insert into pokemon_tipo
values (18, 15);
insert into pokemon_tipo
values (19, 9);
insert into pokemon_tipo
values (20, 9);
insert into pokemon_tipo
values (21, 9);
insert into pokemon_tipo
values (21, 15);
insert into pokemon_tipo
values (22, 9);
insert into pokemon_tipo
values (22, 15);
insert into pokemon_tipo
values (23, 14);
insert into pokemon_tipo
values (24, 14);
insert into pokemon_tipo
values (25, 4);
insert into pokemon_tipo
values (26, 4);
insert into pokemon_tipo
values (27, 13);
insert into pokemon_tipo
values (28, 13);
insert into pokemon_tipo
values (29, 14);
insert into pokemon_tipo
values (30, 14);
insert into pokemon_tipo
values (31, 14);
insert into pokemon_tipo
values (31, 13);
insert into pokemon_tipo
values (32, 14);
insert into pokemon_tipo
values (33, 14);
insert into pokemon_tipo
values (34, 14);
insert into pokemon_tipo
values (34, 13);
insert into pokemon_tipo
values (35, 9);
insert into pokemon_tipo
values (36, 9);
insert into pokemon_tipo
values (37, 6);
insert into pokemon_tipo
values (38, 6);
insert into pokemon_tipo
values (39, 9);
insert into pokemon_tipo
values (40, 9);
insert into pokemon_tipo
values (41, 14);
insert into pokemon_tipo
values (41, 15);
insert into pokemon_tipo
values (42, 14);
insert into pokemon_tipo
values (42, 15);
insert into pokemon_tipo
values (43, 10);
insert into pokemon_tipo
values (43, 14);
insert into pokemon_tipo
values (44, 10);
insert into pokemon_tipo
values (44, 14);
insert into pokemon_tipo
values (45, 10);
insert into pokemon_tipo
values (45, 14);
insert into pokemon_tipo
values (46, 2);
insert into pokemon_tipo
values (46, 10);
insert into pokemon_tipo
values (47, 2);
insert into pokemon_tipo
values (47, 10);
insert into pokemon_tipo
values (48, 2);
insert into pokemon_tipo
values (48, 14);
insert into pokemon_tipo
values (49, 2);
insert into pokemon_tipo
values (49, 14);
insert into pokemon_tipo
values (50, 13);
insert into pokemon_tipo
values (51, 13);
insert into pokemon_tipo
values (52, 9);
insert into pokemon_tipo
values (53, 9);
insert into pokemon_tipo
values (54, 1);
insert into pokemon_tipo
values (55, 1);
insert into pokemon_tipo
values (56, 8);
insert into pokemon_tipo
values (57, 8);
insert into pokemon_tipo
values (58, 6);
insert into pokemon_tipo
values (59, 6);
insert into pokemon_tipo
values (60, 1);
insert into pokemon_tipo
values (61, 1);
insert into pokemon_tipo
values (62, 1);
insert into pokemon_tipo
values (62, 8);
insert into pokemon_tipo
values (63, 11);
insert into pokemon_tipo
values (64, 12);
insert into pokemon_tipo
values (65, 13);
insert into pokemon_tipo
values (66, 8);
insert into pokemon_tipo
values (67, 8);
insert into pokemon_tipo
values (68, 8);
insert into pokemon_tipo
values (69, 10);
insert into pokemon_tipo
values (69, 14);
insert into pokemon_tipo
values (70, 10);
insert into pokemon_tipo
values (70, 14);
insert into pokemon_tipo
values (71, 10);
insert into pokemon_tipo
values (71, 14);
insert into pokemon_tipo
values (72, 1);
insert into pokemon_tipo
values (72, 14);
insert into pokemon_tipo
values (73, 1);
insert into pokemon_tipo
values (73, 14);
insert into pokemon_tipo
values (74, 12);
insert into pokemon_tipo
values (74, 13);
insert into pokemon_tipo
values (75, 12);
insert into pokemon_tipo
values (75, 13);
insert into pokemon_tipo
values (76, 12);
insert into pokemon_tipo
values (76, 13);
insert into pokemon_tipo
values (77, 6);
insert into pokemon_tipo
values (78, 6);
insert into pokemon_tipo
values (79, 1);
insert into pokemon_tipo
values (79, 11);
insert into pokemon_tipo
values (80, 1);
insert into pokemon_tipo
values (80, 11);
insert into pokemon_tipo
values (81, 4);
insert into pokemon_tipo
values (82, 4);
insert into pokemon_tipo
values (83, 9);
insert into pokemon_tipo
values (83, 15);
insert into pokemon_tipo
values (84, 9);
insert into pokemon_tipo
values (84, 15);
insert into pokemon_tipo
values (85, 9);
insert into pokemon_tipo
values (85, 15);
insert into pokemon_tipo
values (86, 1);
insert into pokemon_tipo
values (86, 7);
insert into pokemon_tipo
values (87, 1);
insert into pokemon_tipo
values (87, 7);
insert into pokemon_tipo
values (88, 14);
insert into pokemon_tipo
values (89, 14);
insert into pokemon_tipo
values (90, 1);
insert into pokemon_tipo
values (91, 1);
insert into pokemon_tipo
values (91, 7);
insert into pokemon_tipo
values (92, 5);
insert into pokemon_tipo
values (92, 14);
insert into pokemon_tipo
values (93, 5);
insert into pokemon_tipo
values (93, 14);
insert into pokemon_tipo
values (94, 5);
insert into pokemon_tipo
values (94, 14);
insert into pokemon_tipo
values (95, 12);
insert into pokemon_tipo
values (95, 13);
insert into pokemon_tipo
values (96, 11);
insert into pokemon_tipo
values (97, 11);
insert into pokemon_tipo
values (98, 1);
insert into pokemon_tipo
values (99, 1);
insert into pokemon_tipo
values (100, 4);
insert into pokemon_tipo
values (101, 4);
insert into pokemon_tipo
values (102, 10);
insert into pokemon_tipo
values (102, 11);
insert into pokemon_tipo
values (103, 10);
insert into pokemon_tipo
values (103, 11);
insert into pokemon_tipo
values (104, 13);
insert into pokemon_tipo
values (105, 13);
insert into pokemon_tipo
values (106, 8);
insert into pokemon_tipo
values (107, 8);
insert into pokemon_tipo
values (108, 9);
insert into pokemon_tipo
values (109, 14);
insert into pokemon_tipo
values (110, 14);
insert into pokemon_tipo
values (111, 12);
insert into pokemon_tipo
values (111, 13);
insert into pokemon_tipo
values (112, 12);
insert into pokemon_tipo
values (112, 13);
insert into pokemon_tipo
values (113, 9);
insert into pokemon_tipo
values (114, 10);
insert into pokemon_tipo
values (115, 9);
insert into pokemon_tipo
values (116, 1);
insert into pokemon_tipo
values (117, 1);
insert into pokemon_tipo
values (118, 1);
insert into pokemon_tipo
values (119, 1);
insert into pokemon_tipo
values (120, 1);
insert into pokemon_tipo
values (121, 1);
insert into pokemon_tipo
values (121, 11);
insert into pokemon_tipo
values (122, 11);
insert into pokemon_tipo
values (123, 2);
insert into pokemon_tipo
values (123, 15);
insert into pokemon_tipo
values (124, 7);
insert into pokemon_tipo
values (124, 11);
insert into pokemon_tipo
values (125, 4);
insert into pokemon_tipo
values (126, 6);
insert into pokemon_tipo
values (127, 2);
insert into pokemon_tipo
values (128, 9);
insert into pokemon_tipo
values (129, 1);
insert into pokemon_tipo
values (130, 1);
insert into pokemon_tipo
values (130, 15);
insert into pokemon_tipo
values (131, 1);
insert into pokemon_tipo
values (131, 7);
insert into pokemon_tipo
values (132, 9);
insert into pokemon_tipo
values (133, 9);
insert into pokemon_tipo
values (134, 1);
insert into pokemon_tipo
values (135, 4);
insert into pokemon_tipo
values (136, 6);
insert into pokemon_tipo
values (137, 9);
insert into pokemon_tipo
values (138, 12);
insert into pokemon_tipo
values (138, 1);
insert into pokemon_tipo
values (139, 1);
insert into pokemon_tipo
values (139, 12);
insert into pokemon_tipo
values (140, 1);
insert into pokemon_tipo
values (140, 12);
insert into pokemon_tipo
values (141, 1);
insert into pokemon_tipo
values (141, 12);
insert into pokemon_tipo
values (142, 12);
insert into pokemon_tipo
values (142, 15);
insert into pokemon_tipo
values (143, 9);
insert into pokemon_tipo
values (144, 7);
insert into pokemon_tipo
values (144, 15);
insert into pokemon_tipo
values (145, 4);
insert into pokemon_tipo
values (145, 15);
insert into pokemon_tipo
values (146, 6);
insert into pokemon_tipo
values (146, 15);
insert into pokemon_tipo
values (147, 3);
insert into pokemon_tipo
values (148, 3);
insert into pokemon_tipo
values (149, 3);
insert into pokemon_tipo
values (149, 15);
insert into pokemon_tipo
values (150, 11);
insert into pokemon_tipo
values (151, 11);

/*Estadisticas base*/

insert into estadisticas_base
values (1, 45, 49, 49, 65, 45);
insert into estadisticas_base
values (2, 60, 62, 63, 80, 60);
insert into estadisticas_base
values (3, 80, 82, 83, 100, 80);
insert into estadisticas_base
values (4, 39, 52, 43, 55, 65);
insert into estadisticas_base
values (5, 58, 64, 58, 73, 80);
insert into estadisticas_base
values (6, 78, 84, 78, 97, 100);
insert into estadisticas_base
values (7, 44, 48, 65, 57, 43);
insert into estadisticas_base
values (8, 59, 63, 80, 73, 58);
insert into estadisticas_base
values (9, 79, 83, 100, 95, 78);
insert into estadisticas_base
values (10, 45, 30, 35, 20, 45);
insert into estadisticas_base
values (11, 50, 20, 55, 25, 30);
insert into estadisticas_base
values (12, 60, 45, 50, 80, 70);
insert into estadisticas_base
values (13, 40, 35, 30, 20, 50);
insert into estadisticas_base
values (14, 45, 25, 50, 25, 35);
insert into estadisticas_base
values (15, 65, 80, 40, 63, 75);
insert into estadisticas_base
values (16, 40, 45, 40, 35, 56);
insert into estadisticas_base
values (17, 63, 60, 55, 50, 71);
insert into estadisticas_base
values (18, 83, 80, 75, 70, 91);
insert into estadisticas_base
values (19, 30, 56, 35, 30, 72);
insert into estadisticas_base
values (20, 55, 81, 60, 60, 97);
insert into estadisticas_base
values (21, 40, 60, 30, 31, 70);
insert into estadisticas_base
values (22, 65, 90, 65, 61, 100);
insert into estadisticas_base
values (23, 35, 60, 44, 47, 55);
insert into estadisticas_base
values (24, 60, 85, 69, 65, 79);
insert into estadisticas_base
values (25, 35, 55, 30, 45, 90);
insert into estadisticas_base
values (26, 60, 90, 55, 85, 100);
insert into estadisticas_base
values (27, 50, 75, 85, 25, 40);
insert into estadisticas_base
values (28, 75, 100, 110, 50, 65);
insert into estadisticas_base
values (29, 55, 47, 52, 40, 41);
insert into estadisticas_base
values (30, 70, 62, 67, 55, 56);
insert into estadisticas_base
values (31, 90, 82, 87, 80, 76);
insert into estadisticas_base
values (32, 46, 57, 40, 40, 50);
insert into estadisticas_base
values (33, 61, 72, 57, 55, 65);
insert into estadisticas_base
values (34, 81, 82, 77, 80, 85);
insert into estadisticas_base
values (35, 70, 45, 48, 63, 35);
insert into estadisticas_base
values (36, 95, 70, 73, 87, 60);
insert into estadisticas_base
values (37, 38, 41, 40, 57, 65);
insert into estadisticas_base
values (38, 73, 76, 75, 91, 100);
insert into estadisticas_base
values (39, 115, 45, 20, 30, 20);
insert into estadisticas_base
values (40, 140, 70, 45, 63, 45);
insert into estadisticas_base
values (41, 40, 45, 35, 35, 55);
insert into estadisticas_base
values (42, 75, 80, 70, 70, 90);
insert into estadisticas_base
values (43, 45, 50, 55, 70, 30);
insert into estadisticas_base
values (44, 60, 65, 70, 80, 40);
insert into estadisticas_base
values (45, 75, 80, 85, 95, 50);
insert into estadisticas_base
values (46, 35, 70, 55, 50, 25);
insert into estadisticas_base
values (47, 60, 95, 80, 70, 30);
insert into estadisticas_base
values (48, 60, 55, 50, 47, 45);
insert into estadisticas_base
values (49, 70, 65, 60, 83, 90);
insert into estadisticas_base
values (50, 10, 55, 25, 40, 95);
insert into estadisticas_base
values (51, 35, 80, 50, 60, 120);
insert into estadisticas_base
values (52, 40, 45, 35, 40, 90);
insert into estadisticas_base
values (53, 65, 70, 60, 65, 115);
insert into estadisticas_base
values (54, 50, 52, 48, 57, 55);
insert into estadisticas_base
values (55, 80, 82, 78, 87, 85);
insert into estadisticas_base
values (56, 40, 80, 35, 40, 70);
insert into estadisticas_base
values (57, 65, 105, 60, 65, 95);
insert into estadisticas_base
values (58, 55, 70, 45, 60, 60);
insert into estadisticas_base
values (59, 90, 110, 80, 90, 95);
insert into estadisticas_base
values (60, 45, 49, 49, 65, 45);
insert into estadisticas_base
values (61, 65, 65, 65, 50, 90);
insert into estadisticas_base
values (62, 90, 85, 95, 80, 70);
insert into estadisticas_base
values (63, 25, 20, 15, 80, 90);
insert into estadisticas_base
values (64, 40, 35, 30, 95, 105);
insert into estadisticas_base
values (65, 55, 50, 45, 110, 120);
insert into estadisticas_base
values (66, 70, 80, 50, 35, 35);
insert into estadisticas_base
values (67, 80, 100, 70, 55, 45);
insert into estadisticas_base
values (68, 90, 130, 80, 75, 55);
insert into estadisticas_base
values (69, 50, 75, 35, 50, 40);
insert into estadisticas_base
values (70, 65, 90, 50, 65, 40);
insert into estadisticas_base
values (71, 80, 105, 65, 80, 70);
insert into estadisticas_base
values (72, 40, 40, 35, 75, 70);
insert into estadisticas_base
values (73, 80, 70, 65, 100, 100);
insert into estadisticas_base
values (74, 40, 80, 100, 30, 20);
insert into estadisticas_base
values (75, 55, 95, 115, 45, 35);
insert into estadisticas_base
values (76, 80, 110, 130, 60, 45);
insert into estadisticas_base
values (77, 50, 85, 55, 65, 90);
insert into estadisticas_base
values (78, 65, 100, 70, 80, 105);
insert into estadisticas_base
values (79, 90, 65, 65, 80, 15);
insert into estadisticas_base
values (80, 95, 75, 110, 90, 30);
insert into estadisticas_base
values (81, 25, 35, 70, 75, 45);
insert into estadisticas_base
values (82, 50, 60, 95, 95, 70);
insert into estadisticas_base
values (83, 52, 65, 55, 60, 60);
insert into estadisticas_base
values (85, 60, 110, 70, 60, 100);
insert into estadisticas_base
values (86, 65, 45, 55, 58, 45);
insert into estadisticas_base
values (87, 90, 70, 80, 83, 70);
insert into estadisticas_base
values (88, 80, 80, 50, 45, 25);
insert into estadisticas_base
values (89, 105, 105, 75, 83, 50);
insert into estadisticas_base
values (90, 30, 65, 100, 35, 40);
insert into estadisticas_base
values (91, 50, 95, 180, 65, 70);
insert into estadisticas_base
values (92, 30, 35, 30, 68, 80);
insert into estadisticas_base
values (93, 45, 50, 45, 85, 95);
insert into estadisticas_base
values (94, 60, 65, 60, 103, 110);
insert into estadisticas_base
values (95, 35, 45, 160, 37, 70);
insert into estadisticas_base
values (96, 60, 48, 45, 67, 42);
insert into estadisticas_base
values (97, 85, 73, 70, 94, 67);
insert into estadisticas_base
values (98, 30, 105, 90, 25, 50);
insert into estadisticas_base
values (99, 55, 130, 115, 50, 75);
insert into estadisticas_base
values (100, 40, 30, 50, 55, 100);
insert into estadisticas_base
values (101, 60, 50, 70, 80, 140);
insert into estadisticas_base
values (102, 60, 40, 80, 53, 40);
insert into estadisticas_base
values (103, 95, 95, 85, 95, 55);
insert into estadisticas_base
values (104, 50, 50, 95, 55, 35);
insert into estadisticas_base
values (105, 60, 80, 110, 65, 45);
insert into estadisticas_base
values (106, 50, 120, 53, 73, 87);
insert into estadisticas_base
values (107, 50, 105, 79, 73, 76);
insert into estadisticas_base
values (108, 90, 55, 75, 67, 30);
insert into estadisticas_base
values (109, 40, 65, 95, 53, 35);
insert into estadisticas_base
values (110, 65, 90, 120, 77, 60);
insert into estadisticas_base
values (111, 80, 85, 95, 30, 25);
insert into estadisticas_base
values (112, 105, 130, 120, 45, 40);
insert into estadisticas_base
values (113, 250, 5, 5, 70, 50);
insert into estadisticas_base
values (114, 65, 55, 115, 70, 60);
insert into estadisticas_base
values (115, 105, 95, 80, 60, 90);
insert into estadisticas_base
values (116, 30, 40, 70, 48, 60);
insert into estadisticas_base
values (117, 55, 65, 95, 70, 85);
insert into estadisticas_base
values (118, 45, 67, 60, 43, 63);
insert into estadisticas_base
values (119, 80, 92, 65, 72, 68);
insert into estadisticas_base
values (120, 30, 45, 55, 63, 85);
insert into estadisticas_base
values (121, 60, 75, 85, 93, 115);
insert into estadisticas_base
values (122, 40, 45, 65, 110, 90);
insert into estadisticas_base
values (123, 70, 110, 80, 68, 105);
insert into estadisticas_base
values (124, 65, 50, 35, 105, 95);
insert into estadisticas_base
values (125, 65, 83, 57, 95, 105);
insert into estadisticas_base
values (126, 65, 95, 57, 90, 105);
insert into estadisticas_base
values (127, 65, 125, 100, 63, 85);
insert into estadisticas_base
values (128, 75, 100, 95, 55, 110);
insert into estadisticas_base
values (129, 20, 10, 55, 17, 80);
insert into estadisticas_base
values (130, 95, 125, 79, 80, 81);
insert into estadisticas_base
values (131, 130, 85, 80, 90, 60);
insert into estadisticas_base
values (132, 48, 48, 48, 48, 48);
insert into estadisticas_base
values (133, 55, 55, 50, 55, 55);
insert into estadisticas_base
values (134, 130, 65, 60, 103, 65);
insert into estadisticas_base
values (135, 65, 65, 60, 103, 130);
insert into estadisticas_base
values (136, 65, 130, 60, 103, 65);
insert into estadisticas_base
values (137, 65, 60, 70, 80, 40);
insert into estadisticas_base
values (138, 35, 40, 100, 73, 35);
insert into estadisticas_base
values (139, 70, 60, 125, 93, 55);
insert into estadisticas_base
values (140, 30, 80, 90, 50, 55);
insert into estadisticas_base
values (141, 60, 115, 105, 67, 80);
insert into estadisticas_base
values (142, 80, 105, 65, 67, 130);
insert into estadisticas_base
values (143, 160, 110, 65, 88, 30);
insert into estadisticas_base
values (144, 90, 85, 100, 110, 85);
insert into estadisticas_base
values (145, 90, 90, 85, 83, 100);
insert into estadisticas_base
values (146, 90, 100, 90, 105, 90);
insert into estadisticas_base
values (147, 41, 64, 45, 50, 50);
insert into estadisticas_base
values (148, 61, 84, 65, 70, 70);
insert into estadisticas_base
values (149, 91, 134, 95, 100, 80);
insert into estadisticas_base
values (150, 106, 110, 90, 122, 130);
insert into estadisticas_base
values (151, 100, 100, 100, 100, 100);

-- Piedras

insert into tipo_piedra
values (1, 'Piedra trueno');
insert into tipo_piedra
values (2, 'Piedra fuego');
insert into tipo_piedra
values (3, 'Piedra agua');
insert into tipo_piedra
values (4, 'Piedra lunar');
insert into tipo_piedra
values (5, 'Piedra hoja');


-- Tipo evolucion

insert into tipo_evolucion
values (1, 'Nivel');
insert into tipo_evolucion
values (2, 'Piedra');
insert into tipo_evolucion
values (3, 'Intercambio');

-- Formas de evolucion

insert into forma_evolucion
values (1, 3);
insert into forma_evolucion
values (2, 2);
insert into forma_evolucion
values (3, 2);
insert into forma_evolucion
values (4, 2);
insert into forma_evolucion
values (5, 1);
insert into forma_evolucion
values (6, 1);
insert into forma_evolucion
values (7, 1);
insert into forma_evolucion
values (8, 1);
insert into forma_evolucion
values (9, 1);
insert into forma_evolucion
values (10, 1);
insert into forma_evolucion
values (11, 1);
insert into forma_evolucion
values (12, 1);
insert into forma_evolucion
values (13, 2);
insert into forma_evolucion
values (14, 1);
insert into forma_evolucion
values (15, 2);
insert into forma_evolucion
values (16, 1);
insert into forma_evolucion
values (17, 1);
insert into forma_evolucion
values (18, 1);
insert into forma_evolucion
values (19, 1);
insert into forma_evolucion
values (20, 1);
insert into forma_evolucion
values (21, 1);
insert into forma_evolucion
values (22, 1);
insert into forma_evolucion
values (23, 1);
insert into forma_evolucion
values (24, 1);
insert into forma_evolucion
values (25, 1);
insert into forma_evolucion
values (26, 1);
insert into forma_evolucion
values (27, 1);
insert into forma_evolucion
values (28, 1);
insert into forma_evolucion
values (29, 1);

-- Formas de evolucion nivel

insert into nivel_evolucion
values (5, 7);
insert into nivel_evolucion
values (6, 10);
insert into nivel_evolucion
values (7, 16);
insert into nivel_evolucion
values (8, 18);
insert into nivel_evolucion
values (9, 20);
insert into nivel_evolucion
values (10, 22);
insert into nivel_evolucion
values (11, 32);
insert into nivel_evolucion
values (12, 36);
insert into nivel_evolucion
values (14, 21);
insert into nivel_evolucion
values (16, 24);
insert into nivel_evolucion
values (17, 31);
insert into nivel_evolucion
values (18, 26);
insert into nivel_evolucion
values (19, 28);
insert into nivel_evolucion
values (20, 33);
insert into nivel_evolucion
values (21, 25);
insert into nivel_evolucion
values (22, 30);
insert into nivel_evolucion
values (23, 40);
insert into nivel_evolucion
values (24, 37);
insert into nivel_evolucion
values (25, 34);
insert into nivel_evolucion
values (26, 38);
insert into nivel_evolucion
values (27, 35);
insert into nivel_evolucion
values (28, 42);
insert into nivel_evolucion
values (29, 55);

-- Formas de evolucion piedras

insert into piedra
values (2, 1);
insert into piedra
values (3, 2);
insert into piedra
values (4, 3);
insert into piedra
values (13, 4);
insert into piedra
values (15, 5);

-- Formas de evolucion pokemon

insert into pokemon_forma_evolucion
values (1, 7);
insert into pokemon_forma_evolucion
values (2, 11);
insert into pokemon_forma_evolucion
values (4, 7);
insert into pokemon_forma_evolucion
values (5, 12);
insert into pokemon_forma_evolucion
values (7, 7);
insert into pokemon_forma_evolucion
values (8, 12);
insert into pokemon_forma_evolucion
values (10, 5);
insert into pokemon_forma_evolucion
values (11, 6);
insert into pokemon_forma_evolucion
values (13, 5);
insert into pokemon_forma_evolucion
values (14, 6);
insert into pokemon_forma_evolucion
values (16, 8);
insert into pokemon_forma_evolucion
values (17, 12);
insert into pokemon_forma_evolucion
values (19, 9);
insert into pokemon_forma_evolucion
values (21, 9);
insert into pokemon_forma_evolucion
values (23, 10);
insert into pokemon_forma_evolucion
values (25, 2);
insert into pokemon_forma_evolucion
values (27, 10);
insert into pokemon_forma_evolucion
values (29, 8);
insert into pokemon_forma_evolucion
values (30, 13);
insert into pokemon_forma_evolucion
values (32, 8);
insert into pokemon_forma_evolucion
values (33, 13);
insert into pokemon_forma_evolucion
values (35, 13);
insert into pokemon_forma_evolucion
values (37, 3);
insert into pokemon_forma_evolucion
values (39, 13);
insert into pokemon_forma_evolucion
values (41, 10);
insert into pokemon_forma_evolucion
values (43, 14);
insert into pokemon_forma_evolucion
values (44, 15);
insert into pokemon_forma_evolucion
values (46, 16);
insert into pokemon_forma_evolucion
values (48, 17);
insert into pokemon_forma_evolucion
values (50, 18);
insert into pokemon_forma_evolucion
values (52, 19);
insert into pokemon_forma_evolucion
values (54, 20);
insert into pokemon_forma_evolucion
values (56, 19);
insert into pokemon_forma_evolucion
values (58, 3);
insert into pokemon_forma_evolucion
values (60, 21);
insert into pokemon_forma_evolucion
values (61, 4);
insert into pokemon_forma_evolucion
values (63, 7);
insert into pokemon_forma_evolucion
values (64, 1);
insert into pokemon_forma_evolucion
values (66, 19);
insert into pokemon_forma_evolucion
values (67, 1);
insert into pokemon_forma_evolucion
values (69, 14);
insert into pokemon_forma_evolucion
values (70, 15);
insert into pokemon_forma_evolucion
values (72, 22);
insert into pokemon_forma_evolucion
values (74, 21);
insert into pokemon_forma_evolucion
values (75, 1);
insert into pokemon_forma_evolucion
values (77, 23);
insert into pokemon_forma_evolucion
values (79, 24);
insert into pokemon_forma_evolucion
values (81, 22);
insert into pokemon_forma_evolucion
values (84, 17);
insert into pokemon_forma_evolucion
values (86, 25);
insert into pokemon_forma_evolucion
values (88, 26);
insert into pokemon_forma_evolucion
values (90, 4);
insert into pokemon_forma_evolucion
values (92, 21);
insert into pokemon_forma_evolucion
values (93, 1);
insert into pokemon_forma_evolucion
values (96, 18);
insert into pokemon_forma_evolucion
values (98, 19);
insert into pokemon_forma_evolucion
values (100, 22);
insert into pokemon_forma_evolucion
values (102, 15);
insert into pokemon_forma_evolucion
values (104, 19);
insert into pokemon_forma_evolucion
values (109, 27);
insert into pokemon_forma_evolucion
values (111, 28);
insert into pokemon_forma_evolucion
values (116, 11);
insert into pokemon_forma_evolucion
values (118, 20);
insert into pokemon_forma_evolucion
values (120, 4);
insert into pokemon_forma_evolucion
values (129, 9);
insert into pokemon_forma_evolucion
values (133, 2);
insert into pokemon_forma_evolucion
values (133, 3);
insert into pokemon_forma_evolucion
values (133, 4);
insert into pokemon_forma_evolucion
values (138, 23);
insert into pokemon_forma_evolucion
values (140, 23);
insert into pokemon_forma_evolucion
values (147, 22);
insert into pokemon_forma_evolucion
values (148, 29);

-- Movimientos

insert into movimiento
values (1, 'Placaje', 40, 100, 'Causa daño', 35, 9, 0);
insert into movimiento
values (2, 'Danza espada', 0, 100, 'Aumenta en dos niveles el ataque del usuario', 30, 9, 0);
insert into movimiento
values (3, 'Burbuja', 20, 100, 'Causa daño y tiene una probabilidad del 10% de bajar la velocidad', 30, 1, 0);
insert into movimiento
values (4, 'Cascada', 80, 100, 'Causa daño', 15, 1, 0);
insert into movimiento
values (5, 'Hidrobomba', 120, 80, 'Causa daño', 5, 1, 0);
insert into movimiento
values (6, 'Martillazo', 90, 85, 'Causa daño con probabilidad de dar golpe critico(12,5%)', 10, 1, 0);
insert into movimiento
values (7, 'Pistola de agua', 40, 100, 'Causa daño', 25, 1, 0);
insert into movimiento
values (8, 'Rayo burbuja', 65, 100, 'Causa daño y tiene una probabilidad del 10% de bajar la velocidad', 20, 1, 0);
insert into movimiento
values (9, 'Refugio', 0, 100, 'Aumenta la defensa en un nivel', 40, 1, 0);
insert into movimiento
values (10, 'Surf', 95, 100, 'Causa daño', 15, 1, 0);
insert into movimiento
values (11, 'Tenaza', 35, 75, 'Causa daño durante 2-5 turnos. Imposibilidad de atacar al objetivo', 15, 1, 0);
insert into movimiento
values (12, 'Chupa vidas', 20, 100, 'Causa daño y recupera el 50% PS quitados', 15, 2, 0);
insert into movimiento
values (13, 'Disparo demora', 0, 95, 'Baja la velocidad del objetivo', 40, 2, 0);
insert into movimiento
values (14, 'Doble ataque', 25, 100,
        'Causa daño golpeando dos veces. Cada golpe tiene un 20% de probabilidad de envenenar.', 20, 2, 0);
insert into movimiento
values (15, 'Pin misil', 14, 85, 'Causa daño al objetivo de 2 a 5 veces', 20, 2, 0);
insert into movimiento
values (16, 'Furia dragón', 0, 100, 'Quita siempre 40 PS al obejtivo', 10, 3, 0);
insert into movimiento
values (17, 'Impactrueno', 40, 100, 'Causa daño y tiene una probabilidad del 10% de paralizar el objetivo.', 30, 4, 0);
insert into movimiento
values (18, 'Onda trueno', 0, 100, 'Paraliza el objetivo', 20, 4, 0);
insert into movimiento
values (19, 'Puño trueno', 75, 100, 'Causa daño y tiene un 10% de paralizar el objetivo', 35, 4, 0);
insert into movimiento
values (20, 'Rayo', 95, 100, 'Causa daño y tiene un 10% de paralizar el objetivo', 15, 4, 0);
insert into movimiento
values (21, 'Trueno', 120, 70, 'Causa daño y tiene un 10% de paralizar el objetivo', 10, 4, 0);
insert into movimiento
values (23, 'Lenguetazo', 20, 100, 'Causa daño y tiene un 30% de paralizar el objetivo', 30, 5, 0);
insert into movimiento
values (24, 'Rayo confuso', 0, 100, 'Confunde al objetivo', 10, 5, 0);
insert into movimiento
values (25, 'Tinieblas', 0, 100, 'Resta la cantidad de PS equivalentes al nivel de usuario', 15, 5, 0);
insert into movimiento
values (26, 'Ascuas', 40, 100, 'Causa daño y tiene una probabilidad del 10% de quemar al objetivo', 25, 6, 0);
insert into movimiento
values (27, 'Giro fuego', 15, 100, 'Causa dañó de 2 a 5 turnos. Imposibilidad de atacar al objetivo', 15, 6, 0);
insert into movimiento
values (28, 'Lanzallamas', 95, 100, 'Causa daño y tiene una probabilidad del 10% de quemar al objetivo', 15, 6, 0);
insert into movimiento
values (29, 'Llamarada', 120, 85, 'Causa daño y tiene una probabilidad del 30% de quemar al objetivo', 5, 6, 0);
insert into movimiento
values (30, 'Puño fuego', 75, 100, 'Causa daño y tiene una probabilidad del 10% de quemar al objetivo', 15, 4, 0);
insert into movimiento
values (31, 'Neblina', 0, 0,
        'Neblina evita durante 5 turnos otros pokemon puedan reducir las estadisiticas del equipo aliado', 30, 7, 0);
insert into movimiento
values (32, 'Niebla', 0, 0,
        'Restaura todos los cambios, tantos positivos como negativos, en las estadisitcas de todos los pokemon.', 30, 7,
        0);
insert into movimiento
values (33, 'Puño hielo', 75, 100, 'Causa daño y tiene una probabilidad del 10% de congelar al objetivo', 15, 7, 0);
insert into movimiento
values (34, 'Rayo aurora', 65, 100,
        'Causa daño y tiene una probabilidad del 10% de bajar un nivel el ataque del objetivo', 20, 7, 0);
insert into movimiento
values (35, 'Rayo hielo', 95, 100, 'Causa daño y tiene una probabilidad del 10% de congelar al objetivo', 10, 7, 0);
insert into movimiento
values (36, 'Ventisca', 120, 90, 'Causa daño y tiene una probabilidad del 10% de congelar al objetivo', 5, 7, 0);
insert into movimiento
values (37, 'Contraataque', 0, 100, 'Devuelve el doble daño recibido si es un físico', 20, 8, -5);
insert into movimiento
values (38, 'Doble patada', 30, 100, 'Causa daño, golpeando 2 veces en un mismo turno', 30, 8, 0);
insert into movimiento
values (39, 'Movimiento sísmico', 0, 100, 'Resta la cantidad de PS equivalentes al nivel de usuario', 20, 8, 0);
insert into movimiento
values (40, 'Patada baja', 50, 90, 'Causa daño y tiene del 30% de retroceder al objetivo', 20, 8, 0);
insert into movimiento
values (41, 'Patada giro', 60, 85, 'Causa daño y tiene del 30% de retroceder al objetivo', 15, 8, 0);
insert into movimiento
values (42, 'Patada salto', 70, 100, 'Causa daño. Si falla, el usuario se golpea a si mismo restandole 1 PS.', 25, 8,
        0);
insert into movimiento
values (43, 'Patada salto alta', 85, 90, 'Causa daño. Si falla, el usuario se golpea a si mismo restandole 1 PS.', 20,
        8, 0);
insert into movimiento
values (44, 'Sumisión', 80, 80, 'Causa daño. Causa daño de retroceso al usuario de 1/4 del daño causado.', 20, 8, 0);
insert into movimiento
values (45, 'Afilar', 0, 100, 'sube el ataque del usuario en un nivel', 30, 9, 0);
insert into movimiento
values (46, 'Agarre', 55, 100, 'Causa daño.', 30, 9, 0);
insert into movimiento
values (47, 'Amortiguador', 0, 0, 'Restaura la mitad de los PS máximos del usuario', 10, 9, 0);
insert into movimiento
values (48, 'Anulación', 0, 55, 'Anula un movimiento del objetivo', 20, 9, 0);
insert into movimiento
values (49, 'Arañazo', 40, 100, 'Causa daño.', 35, 9, 0);
insert into movimiento
values (50, 'Atadura', 15, 75, 'Causa daño de 2 a 5 turnos. Imposibilidad de atacar al objetivo', 20, 9, 0);
insert into movimiento
values (51, 'Ataque arena', 0, 100, 'Baja la precisión en un nivel.', 15, 9, 0);
insert into movimiento
values (52, 'Ataque furia', 15, 85, 'Causa daño de 2 a 5 turnos.', 20, 9, 0);
insert into movimiento
values (53, 'Ataque rápido', 40, 100, 'Causa daño.', 30, 9, 1);
insert into movimiento
values (54, 'Autodestrucción', 130, 100, 'Causa daño y debilita al usuario.', 5, 9, 0);
insert into movimiento
values (55, 'Beso amoroso', 0, 75, 'Duerme al obejtivo', 10, 9, 0);
insert into movimiento
values (56, 'Bomba huevo', 100, 75, 'Causa daño', 10, 9, 0);
insert into movimiento
values (57, 'Bomba sónica', 0, 90, 'siempre quita 20 PS', 20, 9, 0);
insert into movimiento
values (58, 'Cabezazo', 100, 100, 'Se prepara durante el primer turno y ataca en el segundo', 15, 9, 0);
insert into movimiento
values (59, 'Canto', 0, 55, 'Duerme al objetivo.', 15, 9, 0);
insert into movimiento
values (60, 'Chirrido', 0, 85, 'Baja en dos niveles la defensa del objetivo.', 40, 9, 0);
insert into movimiento
values (61, 'Clavo cañón', 20, 100, 'Causa daño de 2 a 5 turnos.', 15, 9, 0);
insert into movimiento
values (62, 'Conversión', 0, 0, 'Cambia el tipo del usuario del oponente', 30, 9, 0);
insert into movimiento
values (63, 'Cornada', 65, 100, 'Causa daño.', 25, 9, 0);
insert into movimiento
values (64, 'Corte', 50, 100, 'Causa daño.', 30, 9, 0);
insert into movimiento
values (65, 'Cuchillada', 70, 100, 'Causa daño y tiene una alta probabilidad de causar un golpe crítico (12,5%).', 20,
        9, 0);
insert into movimiento
values (66, 'Derribo', 90, 85, 'Causa daño. Causa daño de retroceso al usuario de 1/4 del daño causado ', 20, 9, 0);
insert into movimiento
values (67, 'Desarrollo', 0, 0, 'Aumenta en un nivel el especial del usuario.', 40, 9, 0);
insert into movimiento
values (68, 'Deslumbrar', 0, 100, 'Provoca paralisis al objetivo.', 30, 9, 0);
insert into movimiento
values (69, 'Destello', 0, 100, 'Baja un nivel la precisición del oponente.', 20, 9, 0);
insert into movimiento
values (70, 'Destructor', 40, 100, 'Causa daño.', 35, 9, 0);
insert into movimiento
values (71, 'Día de pago', 40, 100, 'Causa daño. Se esparcen monedas que se recogen al final del combate', 20, 9, 0);
insert into movimiento
values (72, 'Doble equipo', 0, 0, 'Aumenta en un nivel la evasión del usuario.', 15, 9, 0);
insert into movimiento
values (73, 'Doble filo', 100, 100, 'Causa daño. Causa daño de retroceso al usuario de 1/4 del daño causado.', 15, 9,
        0);
insert into movimiento
values (74, 'Doblebofetón', 15, 85, 'Causa daño de 2 a 5 turnos.', 10, 9, 0);
insert into movimiento
values (75, 'Explosión', 170, 100, 'Causa daño y debilita al usuario.', 5, 9, 0);
insert into movimiento
values (76, 'Foco energía', 0, 0, 'Aumenta la probabilidad asestar golpes criticos.', 40, 9, 0);
insert into movimiento
values (77, 'Fortaleza', 0, 0, 'Aumenta en un nivel la defensa del usuario.', 30, 9, 0);
insert into movimiento
values (78, 'Fuerza', 80, 100, 'Causa daño.', 15, 9, 0);
insert into movimiento
values (79, 'Furia', 20, 100, 'Causa daño. No puede cambiar de movimiento.', 20, 9, 0);
insert into movimiento
values (80, 'Golpe', 90, 100, 'Causa daño entre 3 o 4 turnos seguidos. El usuario termina confundido.', 20, 9, 0);
insert into movimiento
values (81, 'Golpe cabeza', 70, 100, 'Causa daño y tiene una probabilidad del 30% de hacer retroceder.', 15, 9, 0);
insert into movimiento
values (82, 'Golpe cuerpo', 85, 100, 'Causa daño y tiene una probabilidad del 30% de paralizar el objetivo.', 15, 9, 0);
insert into movimiento
values (83, 'Golpe kárate', 50, 100, 'Causa daño y tiene un alto índice de golpe crítico.', 25, 9, 0);
insert into movimiento
values (84, 'Golpes furia', 50, 100, 'Causa daño de 2 a 5 turnos.', 15, 9, 0);
insert into movimiento
values (85, 'Gruñido', 0, 100, 'Baja un nivel el ataque del objetivo.', 40, 9, 0);
insert into movimiento
values (86, 'Guillotina', 0, 30, 'Si acierta, provoca KO en un turno.', 5, 9, 0);
insert into movimiento
values (87, 'Hipercolmillo', 80, 90, 'Causa daño y tiene un una probabilidad del 10% de hacer retroceder al objetivo.',
        15, 9, 0);
insert into movimiento
values (88, 'Hiperrayo', 150, 90, 'Causa daño. No podra moverse en el segundo turno.', 5, 9, 0);
insert into movimiento
values (89, 'Látigo', 0, 100, 'Baja en un nivel la defensa del oponente.', 30, 9, 0);
insert into movimiento
values (90, 'Malicioso', 0, 100, 'Baja en un nivel la defensa del oponente.', 30, 9, 0);
insert into movimiento
values (91, 'Megapatada', 120, 75, 'Causa daño.', 5, 9, 0);
insert into movimiento
values (92, 'MegaPuño', 80, 85, 'Causa daño.', 20, 9, 0);
insert into movimiento
values (93, 'Metrónomo', 0, 0, 'Utiliza un movimiento al azar.', 15, 9, 0);
insert into movimiento
values (94, 'Mimético', 0, 0, 'Permite al usuario elegir uno de los movimientos del objetivo y copiarlo.', 25, 9, 0);
insert into movimiento
values (95, 'Mordisco', 60, 100, 'Causa daño y tiene una probabilidad del 10% de hacer retroceder.', 25, 9, 0);
insert into movimiento
values (96, 'Pantalla de humo', 0, 100, 'Baja en un nivel la precisión del oponente.', 20, 9, 0);
insert into movimiento
values (97, 'Perforador', 0, 30, 'Si acierta, provoca KO en un turno.', 5, 9, 0);
insert into movimiento
values (98, 'Pisotón', 65, 100, 'Causa daño y tiene una probabilidad del 30% de hacer retroceder.', 20, 9, 0);
insert into movimiento
values (100, 'Atizar', 80, 75, 'Causa daño.', 20, 9, 0);
insert into movimiento
values (101, 'Presa', 50, 100, 'Causa daño de 2 a 5 turnos.', 20, 9, 0);
insert into movimiento
values (102, 'Puño cometa', 18, 85, 'Causa daño de 2 a 5 turnos.', 15, 9, 0);
insert into movimiento
values (103, 'Rapidez', 60, 0, 'Causa daño. No falla.', 20, 9, 0);
insert into movimiento
values (104, 'Recuperación', 0, 0, 'Restaura la mitad de los PS máximos del usuario', 20, 9, 0);
insert into movimiento
values (105, 'Reducción', 0, 0, 'Aumenta la evasión del usuario en un nivel.', 10, 9, 0);
insert into movimiento
values (106, 'Remolino', 0, 85, 'Ahuyenta a los pokemon salvajes.', 20, 9, 0);
insert into movimiento
values (107, 'Constricción', 15, 85, 'Causa daño de 2 a 5 turnos. Imposibilidad de atacar al objetivo', 20, 9, 0);
insert into movimiento
values (109, 'Rizo de defensa', 0, 100, 'Aumenta en un nivel la defensa del usuario.', 40, 9, 0);
insert into movimiento
values (110, 'Rugido', 0, 0, 'Ahuyenta a los pokemon salvajes.', 20, 9, -6);
insert into movimiento
values (111, 'Salpicadura', 0, 0, 'No tiene ningún efecto.', 40, 9, 0);
insert into movimiento
values (112, 'Superdiente', 0, 90, 'Quita al objetivo la mitad de sus PS actuales.', 10, 9, 0);
insert into movimiento
values (113, 'Supersónico', 0, 55, 'Confunde al objetivo.', 20, 9, 0);
insert into movimiento
values (114, 'Sustituto', 0, 0,
        'Crea un sustituo con el 25% de los PS maximos del usuario para que reciba el daño de los movimientos', 10, 9,
        0);
insert into movimiento
values (115, 'Tornado', 40, 100, 'Causa daño.', 35, 9, 0);
insert into movimiento
values (116, 'Transformación', 0, 0,
        'Convierte al usuario en el Pokémon objetivo, copiando su tipo, sus movimientos, habilidad, su ratio de captura, sus estadísticas y cambios en las mismas.',
        10, 9, 0);
insert into movimiento
values (117, 'Triataque', 80, 100, 'Causa daño. Tiene un 20% de provocar quemaduras, paralisis o congelación', 10, 9,
        0);
insert into movimiento
values (118, 'Venganza', 0, 0,
        ' Hace que el usuario se mantenga inmóvil durante 2-3 turnos seguidos, sin poder realizar ninguna acción, para después devolver el doble del daño recibido. El movimiento falla si el usuario no resulta dañado por el enemigo.',
        10, 9, 0);
insert into movimiento
values (119, 'Viento cortante', 80, 75,
        'carga en el primer turno que es efectuado, creando un remolino. En el segundo turno, causa daño.', 10, 9, 0);
insert into movimiento
values (120, 'Absorber', 20, 100,
        'Causa daño y el usuario recupera el 50% de los PS quitados por el movimiento al objetivo', 20, 10, 0);
insert into movimiento
values (121, 'Danza pétalo', 70, 100, 'Causa daño entre 3 o 4 turnos seguidos. El usuario termina confundido.', 20, 10,
        0);
insert into movimiento
values (122, 'Drenadoras', 0, 90,
        'Planta tres semillas en el oponente, las cuales le roban 1/16 de sus PS máximos al final de cada turno. El usuario recupera esa misma cantidad de PS. Si el usuario es cambiado, el Pokémon que pase a ocupar su lugar recibirá esos puntos de salud. El efecto se pasa al cambiar el Pokémon infectado por drenadoras. Drenadoras no afecta a Pokémon de tipo planta.',
        10, 10, 0);
insert into movimiento
values (123, 'Espora', 0, 100, 'Duerme al objetivo.', 15, 10, 0);
insert into movimiento
values (124, 'Hoja afilada', 55, 95, 'Causa daño y tiene una alta probabilidad de dar un golpe crítico (12,5%).', 25,
        10, 0);
insert into movimiento
values (125, 'Látigo cepa', 35, 100, 'Causa daño.', 25, 10, 0);
insert into movimiento
values (126, 'Megaagotar', 45, 100,
        'Causa daño y el usuario recupera el 50% de los PS quitados por el movimiento al objetivo', 15, 10, 0);
insert into movimiento
values (127, 'Paralizador', 0, 75, 'Paraliza al objetivo', 30, 10, 0);
insert into movimiento
values (128, 'Rayo solar', 120, 100,
        'utiliza este movimiento concentra la energía solar un turno, para liberar un rayo que causa daño en el siguiente turno.',
        10, 10, 0);
insert into movimiento
values (129, 'Somnífero', 0, 75, 'Duerme al objetivo', 15, 10, 0);
insert into movimiento
values (130, 'Agilidad', 0, 0, 'Sube en dos niveles la velocidad del usuario.', 30, 11, 0);
insert into movimiento
values (131, 'Amnesia', 0, 0, 'Aumenta en dos niveles el especial del usuario', 20, 11, 0);
insert into movimiento
values (132, 'Barrera', 0, 0, 'Aumneta en dos niveles la defensa del usuario.', 30, 11, 0);
insert into movimiento
values (133, 'Comesueños', 100, 100,
        'Causa daño a un objetivo dormido y el usuario recupera el 50% de los PS quitados por movimiento al objetivo.',
        15, 11, 0);
insert into movimiento
values (134, 'Confusión', 50, 100, 'Causa daño y tiene una probabilidad del 10% de confundir al objetivo.', 25, 11, 0);
insert into movimiento
values (135, 'Descanso', 0, 0,
        'hace que el usuario se duerma y recupere la totalidad de los PS, curando en el proceso cualquier problema de estado. El usuario después permanece dormido durante 2 turnos.',
        10, 11, 0);
insert into movimiento
values (136, 'Hipnosis', 0, 60, 'Duerme al objetivo.', 20, 11, 0);
insert into movimiento
values (137, 'Kinético', 0, 80, 'Baja la precisión del objetivo en un nivel.', 15, 11, 0);
insert into movimiento
values (138, 'Meditación', 0, 0, 'aumenta un nivel el ataque del usuario.', 40, 11, 0);
insert into movimiento
values (139, 'Pantalla de luz', 0, 0, 'Dobla la defensa especial del usuario.', 30, 11, 0);
insert into movimiento
values (140, 'Psicoonda', 0, 80,
        'Causa un daño variable al oponente, elegido al azar de un número entre 0,5 y 1,5 veces el nivel del usuario.',
        15, 11, 0);
insert into movimiento
values (141, 'Psicorrayo', 65, 60, 'Causa daño y tiene una probabilidad del 10% de confundir al objetivo.', 20, 11, 0);
insert into movimiento
values (142, 'Psíquico', 90, 100,
        'Causa daño y tiene una probabilidad del 30% de bajar en un nivel el especial del objetivo.', 20, 11, 0);
insert into movimiento
values (143, 'Reflejo', 0, 0, 'Dobla la defensa física del usuario.', 20, 11, 0);
insert into movimiento
values (144, 'Teletransporte', 0, 0, 'Permite huir de combates individuales.', 20, 11, 0);
insert into movimiento
values (145, 'Avalancha', 75, 90, 'Causa daño.', 10, 12, 0);
insert into movimiento
values (146, 'Lanzarocas', 50, 65, 'Causa daño.', 15, 12, 0);
insert into movimiento
values (147, 'Excavar', 100, 100, 'Cava en el primer turno y el segundo turno ataca.', 10, 13, 0);
insert into movimiento
values (148, 'Fisura', 0, 30, 'Si acierta, provoca un golpe fulminante.', 5, 13, 0);
insert into movimiento
values (149, 'Hueso palo', 65, 85, 'Causa daño y tiene una probabilidad del 10% de hacer retroceder al objetivo.', 20,
        13, 0);
insert into movimiento
values (150, 'Huesomerang', 50, 90, 'Causa daño, golpeando al objetivo en un mismo turno.', 10, 13, 0);
insert into movimiento
values (151, 'Terremoto', 100, 100, 'Causa daño.', 10, 13, 0);
insert into movimiento
values (152, 'Ácido', 40, 100, 'Causa daño y tiene una probabilidad deñ 10% de bajar un nivel la defensa del objetivo.',
        30, 14, 0);
insert into movimiento
values (153, 'Armadura ácida', 0, 0, 'Sube en dos niveles la defensa del usuario.', 20, 14, 0);
insert into movimiento
values (154, 'Gas venenoso', 0, 55, 'Envenena al objetivo', 40, 14, 0);
insert into movimiento
values (155, 'Picotazo venenoso', 15, 100, 'Causa daño y tiene una probabilidad del 30% de envenenar al oponente.', 35,
        14, 0);
insert into movimiento
values (156, 'Polución', 20, 70, 'Causa daño y tiene una probabilidad del 40% de envenar al objetivo.', 20, 14, 0);
insert into movimiento
values (157, 'Polvo veneno', 0, 75, 'Envenena al objetivo', 35, 14, 0);
insert into movimiento
values (158, 'Residuos', 65, 100, 'Causa daño y tiene una probabilidad del 30% de envenenar al objetivo.', 20, 14, 0);
insert into movimiento
values (159, 'Tóxico', 0, 85, 'provoca un grave envenenamiento que se agrava con el paso de los turnos.', 10, 14, 0);
insert into movimiento
values (160, 'Ataque aéreo', 140, 90, 'Se prepara durante el primer turno. En el segundo turno causa daño al objetivo.',
        5, 15, 0);
insert into movimiento
values (161, 'Ataque ala', 35, 100, 'Causa daño.', 35, 15, 0);
insert into movimiento
values (162, 'Movimiento espejo', 0, 0, 'Utiliza el último ataque usado que haya tenido al usuario por objetivo. ', 20,
        15, 0);
insert into movimiento
values (164, 'Pico taladro', 80, 100, 'Causa daño.', 20, 15, 0);
insert into movimiento
values (165, 'Picotazo', 35, 100, 'Causa daño.', 35, 15, 0);
insert into movimiento
values (166, 'Vuelo', 70, 100,
        ' emplea dos turnos: en el primero, el Pokémon vuela muy alto, tanto que estará fuera del alcance de la mayoría de los movimientos. En el segundo turno ocurre la caída del vuelo, en la cual el Pokémon golpea al oponente, pero puede ser interrumpida de muchas maneras.',
        15, 15, 0);
insert into movimiento
values (167, 'Restricción', 10, 100,
        'Restricción causa daño y tiene una probabilidad del 10% de bajar un nivel la velocidad del oponente.', 35, 9,
        0);
insert into movimiento
values (168, 'Puño mareo', 70, 100, 'Causa daño y tiene una probabilidad del 20% de confundir al objetivo.', 10, 9, 0);

--  Efectos secundarios
insert into efecto_secundario
values (1, 'Bajar velocidad');
insert into efecto_secundario
values (2, 'Probabilidad de critico');
insert into efecto_secundario
values (3, 'Imposibilidad de atacar');
insert into efecto_secundario
values (4, 'Envenenamiento leve');
insert into efecto_secundario
values (5, 'Paralizar');
insert into efecto_secundario
values (6, 'Quemar');
insert into efecto_secundario
values (7, 'Congelar');
insert into efecto_secundario
values (8, 'Bajar ataque');
insert into efecto_secundario
values (9, 'Retroceso');
insert into efecto_secundario
values (10, 'Confusión');
insert into efecto_secundario
values (11, 'Bajar especial');
insert into efecto_secundario
values (12, 'Bajar defensa');

-- Efectos secundarios movimientos

insert into movimiento_efecto_secundario
values (3, 1, 10);
insert into movimiento_efecto_secundario
values (6, 1, 12.5);
insert into movimiento_efecto_secundario
values (8, 1, 10);
insert into movimiento_efecto_secundario
values (11, 3, 100);
insert into movimiento_efecto_secundario
values (14, 4, 20);
insert into movimiento_efecto_secundario
values (17, 5, 10);
insert into movimiento_efecto_secundario
values (19, 5, 10);
insert into movimiento_efecto_secundario
values (20, 5, 10);
insert into movimiento_efecto_secundario
values (21, 5, 10);
insert into movimiento_efecto_secundario
values (23, 5, 30);
insert into movimiento_efecto_secundario
values (26, 6, 10);
insert into movimiento_efecto_secundario
values (27, 3, 100);
insert into movimiento_efecto_secundario
values (28, 6, 10);
insert into movimiento_efecto_secundario
values (29, 6, 30);
insert into movimiento_efecto_secundario
values (30, 6, 10);
insert into movimiento_efecto_secundario
values (33, 7, 10);
insert into movimiento_efecto_secundario
values (34, 8, 10);
insert into movimiento_efecto_secundario
values (35, 8, 10);
insert into movimiento_efecto_secundario
values (36, 8, 10);
insert into movimiento_efecto_secundario
values (40, 9, 30);
insert into movimiento_efecto_secundario
values (41, 9, 30);
insert into movimiento_efecto_secundario
values (65, 2, 12.5);
insert into movimiento_efecto_secundario
values (81, 9, 30);
insert into movimiento_efecto_secundario
values (82, 5, 30);
insert into movimiento_efecto_secundario
values (83, 2, 12.5);
insert into movimiento_efecto_secundario
values (87, 9, 10);
insert into movimiento_efecto_secundario
values (95, 9, 10);
insert into movimiento_efecto_secundario
values (98, 9, 30);
insert into movimiento_efecto_secundario
values (107, 3, 100);
insert into movimiento_efecto_secundario
values (117, 6, 20);
insert into movimiento_efecto_secundario
values (117, 5, 20);
insert into movimiento_efecto_secundario
values (117, 7, 20);
insert into movimiento_efecto_secundario
values (124, 2, 12.5);
insert into movimiento_efecto_secundario
values (141, 10, 10);
insert into movimiento_efecto_secundario
values (142, 11, 30);
insert into movimiento_efecto_secundario
values (149, 12, 10);
insert into movimiento_efecto_secundario
values (152, 11, 10);
insert into movimiento_efecto_secundario
values (155, 4, 30);
insert into movimiento_efecto_secundario
values (156, 4, 40);
insert into movimiento_efecto_secundario
values (158, 4, 30);
insert into movimiento_efecto_secundario
values (167, 1, 10);
insert into movimiento_efecto_secundario
values (168, 10, 20);


-- Tipos de aprendizaje

insert into tipo_forma_aprendizaje
values (1, 'MT');
insert into tipo_forma_aprendizaje
values (2, 'MO');
insert into tipo_forma_aprendizaje
values (3, 'Nivel');

-- Forma aprendizaje

insert into forma_aprendizaje
values (1, 1);
insert into forma_aprendizaje
values (2, 1);
insert into forma_aprendizaje
values (3, 1);
insert into forma_aprendizaje
values (4, 1);
insert into forma_aprendizaje
values (5, 1);
insert into forma_aprendizaje
values (6, 1);
insert into forma_aprendizaje
values (7, 1);
insert into forma_aprendizaje
values (8, 1);
insert into forma_aprendizaje
values (9, 1);
insert into forma_aprendizaje
values (10, 1);
insert into forma_aprendizaje
values (11, 1);
insert into forma_aprendizaje
values (12, 1);
insert into forma_aprendizaje
values (13, 1);
insert into forma_aprendizaje
values (14, 1);
insert into forma_aprendizaje
values (15, 1);
insert into forma_aprendizaje
values (16, 1);
insert into forma_aprendizaje
values (17, 1);
insert into forma_aprendizaje
values (18, 1);
insert into forma_aprendizaje
values (19, 1);
insert into forma_aprendizaje
values (20, 1);
insert into forma_aprendizaje
values (21, 1);
insert into forma_aprendizaje
values (22, 1);
insert into forma_aprendizaje
values (23, 1);
insert into forma_aprendizaje
values (24, 1);
insert into forma_aprendizaje
values (25, 1);
insert into forma_aprendizaje
values (26, 1);
insert into forma_aprendizaje
values (27, 1);
insert into forma_aprendizaje
values (28, 1);
insert into forma_aprendizaje
values (29, 1);
insert into forma_aprendizaje
values (30, 1);
insert into forma_aprendizaje
values (31, 1);
insert into forma_aprendizaje
values (32, 1);
insert into forma_aprendizaje
values (33, 1);
insert into forma_aprendizaje
values (34, 1);
insert into forma_aprendizaje
values (35, 1);
insert into forma_aprendizaje
values (36, 1);
insert into forma_aprendizaje
values (37, 1);
insert into forma_aprendizaje
values (38, 1);
insert into forma_aprendizaje
values (39, 1);
insert into forma_aprendizaje
values (40, 1);
insert into forma_aprendizaje
values (41, 1);
insert into forma_aprendizaje
values (42, 1);
insert into forma_aprendizaje
values (43, 1);
insert into forma_aprendizaje
values (44, 1);
insert into forma_aprendizaje
values (45, 1);
insert into forma_aprendizaje
values (46, 1);
insert into forma_aprendizaje
values (47, 1);
insert into forma_aprendizaje
values (48, 1);
insert into forma_aprendizaje
values (49, 1);
insert into forma_aprendizaje
values (50, 1);
insert into forma_aprendizaje
values (51, 2);
insert into forma_aprendizaje
values (52, 2);
insert into forma_aprendizaje
values (53, 2);
insert into forma_aprendizaje
values (54, 2);
insert into forma_aprendizaje
values (55, 2);
insert into forma_aprendizaje
values (56, 3);
insert into forma_aprendizaje
values (57, 3);
insert into forma_aprendizaje
values (58, 3);
insert into forma_aprendizaje
values (59, 3);
insert into forma_aprendizaje
values (60, 3);
insert into forma_aprendizaje
values (61, 3);
insert into forma_aprendizaje
values (62, 3);
insert into forma_aprendizaje
values (63, 3);
insert into forma_aprendizaje
values (64, 3);
insert into forma_aprendizaje
values (65, 3);
insert into forma_aprendizaje
values (66, 3);
insert into forma_aprendizaje
values (67, 3);
insert into forma_aprendizaje
values (68, 3);
insert into forma_aprendizaje
values (69, 3);
insert into forma_aprendizaje
values (70, 3);
insert into forma_aprendizaje
values (71, 3);
insert into forma_aprendizaje
values (72, 3);
insert into forma_aprendizaje
values (73, 3);
insert into forma_aprendizaje
values (74, 3);
insert into forma_aprendizaje
values (75, 3);
insert into forma_aprendizaje
values (76, 3);
insert into forma_aprendizaje
values (77, 3);
insert into forma_aprendizaje
values (78, 3);
insert into forma_aprendizaje
values (79, 3);
insert into forma_aprendizaje
values (80, 3);
insert into forma_aprendizaje
values (81, 3);
insert into forma_aprendizaje
values (82, 3);
insert into forma_aprendizaje
values (83, 3);
insert into forma_aprendizaje
values (84, 3);
insert into forma_aprendizaje
values (85, 3);
insert into forma_aprendizaje
values (86, 3);
insert into forma_aprendizaje
values (87, 3);
insert into forma_aprendizaje
values (88, 3);
insert into forma_aprendizaje
values (89, 3);
insert into forma_aprendizaje
values (90, 3);
insert into forma_aprendizaje
values (91, 3);
insert into forma_aprendizaje
values (92, 3);
insert into forma_aprendizaje
values (93, 3);
insert into forma_aprendizaje
values (94, 3);
insert into forma_aprendizaje
values (95, 3);
insert into forma_aprendizaje
values (96, 3);
insert into forma_aprendizaje
values (97, 3);
insert into forma_aprendizaje
values (98, 3);
insert into forma_aprendizaje
values (99, 3);
insert into forma_aprendizaje
values (100, 3);
insert into forma_aprendizaje
values (101, 3);
insert into forma_aprendizaje
values (102, 3);
insert into forma_aprendizaje
values (103, 3);
insert into forma_aprendizaje
values (104, 3);
insert into forma_aprendizaje
values (105, 3);
insert into forma_aprendizaje
values (106, 3);
insert into forma_aprendizaje
values (107, 3);
insert into forma_aprendizaje
values (108, 3);
insert into forma_aprendizaje
values (109, 3);
insert into forma_aprendizaje
values (110, 3);
insert into forma_aprendizaje
values (111, 3);
insert into forma_aprendizaje
values (112, 3);
insert into forma_aprendizaje
values (113, 3);
insert into forma_aprendizaje
values (114, 3);
insert into forma_aprendizaje
values (115, 3);
insert into forma_aprendizaje
values (116, 3);
insert into forma_aprendizaje
values (117, 3);

-- Nivel

insert into nivel_aprendizaje
values (56, 1);
insert into nivel_aprendizaje
values (57, 7);
insert into nivel_aprendizaje
values (58, 13);
insert into nivel_aprendizaje
values (59, 20);
insert into nivel_aprendizaje
values (60, 27);
insert into nivel_aprendizaje
values (61, 34);
insert into nivel_aprendizaje
values (62, 41);
insert into nivel_aprendizaje
values (63, 48);
insert into nivel_aprendizaje
values (64, 22);
insert into nivel_aprendizaje
values (65, 30);
insert into nivel_aprendizaje
values (66, 38);
insert into nivel_aprendizaje
values (67, 46);
insert into nivel_aprendizaje
values (68, 54);
insert into nivel_aprendizaje
values (69, 43);
insert into nivel_aprendizaje
values (70, 55);
insert into nivel_aprendizaje
values (71, 65);
insert into nivel_aprendizaje
values (72, 9);
insert into nivel_aprendizaje
values (73, 15);
insert into nivel_aprendizaje
values (74, 24);
insert into nivel_aprendizaje
values (75, 33);
insert into nivel_aprendizaje
values (76, 42);
insert into nivel_aprendizaje
values (77, 56);
insert into nivel_aprendizaje
values (78, 36);
insert into nivel_aprendizaje
values (79, 8);
insert into nivel_aprendizaje
values (80, 28);
insert into nivel_aprendizaje
values (81, 35);
insert into nivel_aprendizaje
values (82, 31);
insert into nivel_aprendizaje
values (83, 39);
insert into nivel_aprendizaje
values (84, 47);
insert into nivel_aprendizaje
values (85, 52);
insert into nivel_aprendizaje
values (86, 12);
insert into nivel_aprendizaje
values (87, 16);
insert into nivel_aprendizaje
values (88, 17);
insert into nivel_aprendizaje
values (89, 21);
insert into nivel_aprendizaje
values (90, 26);
insert into nivel_aprendizaje
values (91, 32);
insert into nivel_aprendizaje
values (92, 25);
insert into nivel_aprendizaje
values (93, 5);
insert into nivel_aprendizaje
values (94, 19);
insert into nivel_aprendizaje
values (95, 44);
insert into nivel_aprendizaje
values (96, 40);
insert into nivel_aprendizaje
values (97, 49);
insert into nivel_aprendizaje
values (98, 14);
insert into nivel_aprendizaje
values (99, 23);
insert into nivel_aprendizaje
values (100, 29);
insert into nivel_aprendizaje
values (101, 10);
insert into nivel_aprendizaje
values (102, 50);
insert into nivel_aprendizaje
values (103, 37);
insert into nivel_aprendizaje
values (104, 51);
insert into nivel_aprendizaje
values (105, 59);
insert into nivel_aprendizaje
values (106, 18);
insert into nivel_aprendizaje
values (107, 45);
insert into nivel_aprendizaje
values (108, 11);
insert into nivel_aprendizaje
values (109, 53);
insert into nivel_aprendizaje
values (110, 60);
insert into nivel_aprendizaje
values (111, 64);
insert into nivel_aprendizaje
values (112, 58);
insert into nivel_aprendizaje
values (113, 63);
insert into nivel_aprendizaje
values (114, 66);
insert into nivel_aprendizaje
values (115, 70);
insert into nivel_aprendizaje
values (116, 75);
insert into nivel_aprendizaje
values (117, 81);

-- MT

insert into MT
values (1, 'MT01');
insert into MT
values (2, 'MT02');
insert into MT
values (3, 'MT03');
insert into MT
values (4, 'MT04');
insert into MT
values (5, 'MT05');
insert into MT
values (6, 'MT06');
insert into MT
values (7, 'MT07');
insert into MT
values (8, 'MT08');
insert into MT
values (9, 'MT09');
insert into MT
values (10, 'MT10');
insert into MT
values (11, 'MT11');
insert into MT
values (12, 'MT12');
insert into MT
values (13, 'MT13');
insert into MT
values (14, 'MT14');
insert into MT
values (15, 'MT15');
insert into MT
values (16, 'MT16');
insert into MT
values (17, 'MT17');
insert into MT
values (18, 'MT18');
insert into MT
values (19, 'MT19');
insert into MT
values (20, 'MT20');
insert into MT
values (21, 'MT21');
insert into MT
values (22, 'MT22');
insert into MT
values (23, 'MT23');
insert into MT
values (24, 'MT24');
insert into MT
values (25, 'MT25');
insert into MT
values (26, 'MT26');
insert into MT
values (27, 'MT27');
insert into MT
values (28, 'MT28');
insert into MT
values (29, 'MT29');
insert into MT
values (30, 'MT30');
insert into MT
values (31, 'MT31');
insert into MT
values (32, 'MT32');
insert into MT
values (33, 'MT33');
insert into MT
values (34, 'MT34');
insert into MT
values (35, 'MT35');
insert into MT
values (36, 'MT36');
insert into MT
values (37, 'MT37');
insert into MT
values (38, 'MT38');
insert into MT
values (39, 'MT39');
insert into MT
values (40, 'MT40');
insert into MT
values (41, 'MT41');
insert into MT
values (42, 'MT42');
insert into MT
values (43, 'MT43');
insert into MT
values (44, 'MT44');
insert into MT
values (45, 'MT45');
insert into MT
values (46, 'MT46');
insert into MT
values (47, 'MT47');
insert into MT
values (48, 'MT48');
insert into MT
values (49, 'MT49');
insert into MT
values (50, 'MT50');

-- MO

insert into MO
values (51, 'MO01');
insert into MO
values (52, 'MO02');
insert into MO
values (53, 'MO03');
insert into MO
values (54, 'MO04');
insert into MO
values (55, 'MO05');


-- Pokemon aprende movimiento

insert into pokemon_movimiento_forma
values (1, 1, 56);
insert into pokemon_movimiento_forma
values (1, 85, 56);
insert into pokemon_movimiento_forma
values (1, 122, 57);
insert into pokemon_movimiento_forma
values (1, 125, 58);
insert into pokemon_movimiento_forma
values (1, 157, 59);
insert into pokemon_movimiento_forma
values (1, 124, 60);
insert into pokemon_movimiento_forma
values (1, 67, 61);
insert into pokemon_movimiento_forma
values (1, 129, 62);
insert into pokemon_movimiento_forma
values (1, 128, 63);
insert into pokemon_movimiento_forma
values (1, 2, 3);
insert into pokemon_movimiento_forma
values (1, 159, 6);
insert into pokemon_movimiento_forma
values (1, 82, 8);
insert into pokemon_movimiento_forma
values (1, 66, 9);
insert into pokemon_movimiento_forma
values (1, 73, 10);
insert into pokemon_movimiento_forma
values (1, 79, 20);
insert into pokemon_movimiento_forma
values (1, 126, 21);
insert into pokemon_movimiento_forma
values (1, 128, 22);
insert into pokemon_movimiento_forma
values (1, 94, 31);
insert into pokemon_movimiento_forma
values (1, 72, 32);
insert into pokemon_movimiento_forma
values (1, 143, 33);
insert into pokemon_movimiento_forma
values (1, 118, 34);
insert into pokemon_movimiento_forma
values (1, 135, 44);
insert into pokemon_movimiento_forma
values (1, 114, 50);
insert into pokemon_movimiento_forma
values (1, 64, 51);

insert into pokemon_movimiento_forma
values (2, 1, 56);
insert into pokemon_movimiento_forma
values (2, 85, 56);
insert into pokemon_movimiento_forma
values (2, 122, 56);
insert into pokemon_movimiento_forma
values (2, 122, 57);
insert into pokemon_movimiento_forma
values (2, 125, 58);
insert into pokemon_movimiento_forma
values (2, 157, 64);
insert into pokemon_movimiento_forma
values (2, 124, 65);
insert into pokemon_movimiento_forma
values (2, 67, 66);
insert into pokemon_movimiento_forma
values (2, 129, 67);
insert into pokemon_movimiento_forma
values (2, 128, 68);
insert into pokemon_movimiento_forma
values (2, 2, 3);
insert into pokemon_movimiento_forma
values (2, 159, 6);
insert into pokemon_movimiento_forma
values (2, 82, 8);
insert into pokemon_movimiento_forma
values (2, 66, 9);
insert into pokemon_movimiento_forma
values (2, 73, 10);
insert into pokemon_movimiento_forma
values (2, 79, 20);
insert into pokemon_movimiento_forma
values (2, 126, 21);
insert into pokemon_movimiento_forma
values (2, 128, 22);
insert into pokemon_movimiento_forma
values (2, 94, 31);
insert into pokemon_movimiento_forma
values (2, 72, 32);
insert into pokemon_movimiento_forma
values (2, 143, 33);
insert into pokemon_movimiento_forma
values (2, 118, 34);
insert into pokemon_movimiento_forma
values (2, 135, 44);
insert into pokemon_movimiento_forma
values (2, 114, 50);
insert into pokemon_movimiento_forma
values (2, 64, 51);

insert into pokemon_movimiento_forma
values (3, 1, 56);
insert into pokemon_movimiento_forma
values (3, 85, 56);
insert into pokemon_movimiento_forma
values (3, 122, 56);
insert into pokemon_movimiento_forma
values (3, 122, 57);
insert into pokemon_movimiento_forma
values (3, 125, 56);
insert into pokemon_movimiento_forma
values (3, 125, 58);
insert into pokemon_movimiento_forma
values (3, 157, 64);
insert into pokemon_movimiento_forma
values (3, 124, 65);
insert into pokemon_movimiento_forma
values (3, 67, 69);
insert into pokemon_movimiento_forma
values (3, 129, 70);
insert into pokemon_movimiento_forma
values (3, 128, 71);
insert into pokemon_movimiento_forma
values (3, 2, 3);
insert into pokemon_movimiento_forma
values (3, 159, 6);
insert into pokemon_movimiento_forma
values (3, 82, 8);
insert into pokemon_movimiento_forma
values (3, 66, 9);
insert into pokemon_movimiento_forma
values (3, 73, 10);
insert into pokemon_movimiento_forma
values (3, 88, 15);
insert into pokemon_movimiento_forma
values (3, 79, 20);
insert into pokemon_movimiento_forma
values (3, 126, 21);
insert into pokemon_movimiento_forma
values (3, 128, 22);
insert into pokemon_movimiento_forma
values (3, 94, 31);
insert into pokemon_movimiento_forma
values (3, 72, 32);
insert into pokemon_movimiento_forma
values (3, 143, 33);
insert into pokemon_movimiento_forma
values (3, 118, 34);
insert into pokemon_movimiento_forma
values (3, 135, 44);
insert into pokemon_movimiento_forma
values (3, 114, 50);
insert into pokemon_movimiento_forma
values (3, 64, 51);

insert into pokemon_movimiento_forma
values (4, 49, 56);
insert into pokemon_movimiento_forma
values (4, 85, 56);
insert into pokemon_movimiento_forma
values (4, 26, 72);
insert into pokemon_movimiento_forma
values (4, 90, 73);
insert into pokemon_movimiento_forma
values (4, 79, 64);
insert into pokemon_movimiento_forma
values (4, 65, 65);
insert into pokemon_movimiento_forma
values (4, 28, 66);
insert into pokemon_movimiento_forma
values (4, 27, 67);
insert into pokemon_movimiento_forma
values (4, 92, 1);
insert into pokemon_movimiento_forma
values (4, 2, 3);
insert into pokemon_movimiento_forma
values (4, 91, 5);
insert into pokemon_movimiento_forma
values (4, 159, 6);
insert into pokemon_movimiento_forma
values (4, 82, 8);
insert into pokemon_movimiento_forma
values (4, 66, 9);
insert into pokemon_movimiento_forma
values (4, 73, 10);
insert into pokemon_movimiento_forma
values (4, 44, 17);
insert into pokemon_movimiento_forma
values (4, 37, 18);
insert into pokemon_movimiento_forma
values (4, 39, 19);
insert into pokemon_movimiento_forma
values (4, 79, 20);
insert into pokemon_movimiento_forma
values (4, 16, 23);
insert into pokemon_movimiento_forma
values (4, 147, 28);
insert into pokemon_movimiento_forma
values (4, 94, 31);
insert into pokemon_movimiento_forma
values (4, 72, 32);
insert into pokemon_movimiento_forma
values (4, 143, 33);
insert into pokemon_movimiento_forma
values (4, 118, 34);
insert into pokemon_movimiento_forma
values (4, 29, 38);
insert into pokemon_movimiento_forma
values (4, 103, 39);
insert into pokemon_movimiento_forma
values (4, 58, 40);
insert into pokemon_movimiento_forma
values (4, 135, 44);
insert into pokemon_movimiento_forma
values (4, 18, 45);
insert into pokemon_movimiento_forma
values (4, 64, 51);
insert into pokemon_movimiento_forma
values (4, 78, 54);

insert into pokemon_movimiento_forma
values (5, 49, 56);
insert into pokemon_movimiento_forma
values (5, 85, 56);
insert into pokemon_movimiento_forma
values (5, 26, 56);
insert into pokemon_movimiento_forma
values (5, 90, 73);
insert into pokemon_movimiento_forma
values (5, 26, 72);
insert into pokemon_movimiento_forma
values (5, 65, 75);
insert into pokemon_movimiento_forma
values (5, 28, 76);
insert into pokemon_movimiento_forma
values (5, 27, 77);
insert into pokemon_movimiento_forma
values (5, 92, 1);
insert into pokemon_movimiento_forma
values (5, 2, 3);
insert into pokemon_movimiento_forma
values (5, 91, 5);
insert into pokemon_movimiento_forma
values (5, 159, 6);
insert into pokemon_movimiento_forma
values (5, 82, 8);
insert into pokemon_movimiento_forma
values (5, 66, 9);
insert into pokemon_movimiento_forma
values (5, 73, 10);
insert into pokemon_movimiento_forma
values (5, 44, 17);
insert into pokemon_movimiento_forma
values (5, 37, 18);
insert into pokemon_movimiento_forma
values (5, 39, 19);
insert into pokemon_movimiento_forma
values (5, 79, 20);
insert into pokemon_movimiento_forma
values (5, 16, 23);
insert into pokemon_movimiento_forma
values (5, 147, 28);
insert into pokemon_movimiento_forma
values (5, 94, 31);
insert into pokemon_movimiento_forma
values (5, 72, 32);
insert into pokemon_movimiento_forma
values (5, 143, 33);
insert into pokemon_movimiento_forma
values (5, 118, 34);
insert into pokemon_movimiento_forma
values (5, 29, 38);
insert into pokemon_movimiento_forma
values (5, 103, 39);
insert into pokemon_movimiento_forma
values (5, 58, 40);
insert into pokemon_movimiento_forma
values (5, 135, 44);
insert into pokemon_movimiento_forma
values (5, 114, 50);
insert into pokemon_movimiento_forma
values (5, 64, 51);
insert into pokemon_movimiento_forma
values (5, 78, 54);


insert into pokemon_movimiento_forma
values (6, 49, 56);
insert into pokemon_movimiento_forma
values (6, 85, 56);
insert into pokemon_movimiento_forma
values (6, 26, 56);
insert into pokemon_movimiento_forma
values (6, 90, 56);
insert into pokemon_movimiento_forma
values (6, 90, 73);
insert into pokemon_movimiento_forma
values (6, 26, 72);
insert into pokemon_movimiento_forma
values (6, 79, 74);
insert into pokemon_movimiento_forma
values (6, 65, 78);
insert into pokemon_movimiento_forma
values (6, 28, 67);
insert into pokemon_movimiento_forma
values (6, 27, 70);
insert into pokemon_movimiento_forma
values (6, 92, 1);
insert into pokemon_movimiento_forma
values (6, 2, 3);
insert into pokemon_movimiento_forma
values (6, 91, 5);
insert into pokemon_movimiento_forma
values (6, 159, 6);
insert into pokemon_movimiento_forma
values (6, 82, 8);
insert into pokemon_movimiento_forma
values (6, 66, 9);
insert into pokemon_movimiento_forma
values (6, 73, 10);
insert into pokemon_movimiento_forma
values (6, 44, 17);
insert into pokemon_movimiento_forma
values (6, 37, 18);
insert into pokemon_movimiento_forma
values (6, 39, 19);
insert into pokemon_movimiento_forma
values (6, 79, 20);
insert into pokemon_movimiento_forma
values (6, 16, 23);
insert into pokemon_movimiento_forma
values (6, 147, 28);
insert into pokemon_movimiento_forma
values (6, 94, 31);
insert into pokemon_movimiento_forma
values (6, 72, 32);
insert into pokemon_movimiento_forma
values (6, 143, 33);
insert into pokemon_movimiento_forma
values (6, 118, 34);
insert into pokemon_movimiento_forma
values (6, 29, 38);
insert into pokemon_movimiento_forma
values (6, 103, 39);
insert into pokemon_movimiento_forma
values (6, 58, 40);
insert into pokemon_movimiento_forma
values (6, 135, 44);
insert into pokemon_movimiento_forma
values (6, 114, 50);
insert into pokemon_movimiento_forma
values (6, 64, 51);
insert into pokemon_movimiento_forma
values (6, 78, 54);
insert into pokemon_movimiento_forma
values (6, 88, 15);
insert into pokemon_movimiento_forma
values (6, 151, 26);
insert into pokemon_movimiento_forma
values (6, 148, 27);
insert into pokemon_movimiento_forma
values (6, 166, 52);

insert into pokemon_movimiento_forma
values (7, 1, 56);
insert into pokemon_movimiento_forma
values (7, 89, 56);
insert into pokemon_movimiento_forma
values (7, 3, 79);
insert into pokemon_movimiento_forma
values (7, 7, 73);
insert into pokemon_movimiento_forma
values (7, 95, 64);
insert into pokemon_movimiento_forma
values (7, 9, 80);
insert into pokemon_movimiento_forma
values (7, 58, 81);
insert into pokemon_movimiento_forma
values (7, 5, 76);
insert into pokemon_movimiento_forma
values (7, 92, 1);
insert into pokemon_movimiento_forma
values (7, 91, 5);
insert into pokemon_movimiento_forma
values (7, 82, 8);
insert into pokemon_movimiento_forma
values (7, 66, 9);
insert into pokemon_movimiento_forma
values (7, 73, 10);
insert into pokemon_movimiento_forma
values (7, 8, 11);
insert into pokemon_movimiento_forma
values (7, 7, 12);
insert into pokemon_movimiento_forma
values (7, 35, 13);
insert into pokemon_movimiento_forma
values (7, 36, 14);
insert into pokemon_movimiento_forma
values (7, 44, 17);
insert into pokemon_movimiento_forma
values (7, 37, 18);
insert into pokemon_movimiento_forma
values (7, 39, 19);
insert into pokemon_movimiento_forma
values (7, 79, 20);
insert into pokemon_movimiento_forma
values (7, 147, 28);
insert into pokemon_movimiento_forma
values (7, 94, 31);
insert into pokemon_movimiento_forma
values (7, 72, 32);
insert into pokemon_movimiento_forma
values (7, 143, 33);
insert into pokemon_movimiento_forma
values (7, 118, 34);
insert into pokemon_movimiento_forma
values (7, 58, 40);
insert into pokemon_movimiento_forma
values (7, 135, 44);
insert into pokemon_movimiento_forma
values (7, 114, 50);
insert into pokemon_movimiento_forma
values (7, 10, 53);
insert into pokemon_movimiento_forma
values (7, 78, 54);

insert into pokemon_movimiento_forma
values (8, 1, 56);
insert into pokemon_movimiento_forma
values (8, 89, 56);
insert into pokemon_movimiento_forma
values (8, 3, 56);
insert into pokemon_movimiento_forma
values (8, 3, 79);
insert into pokemon_movimiento_forma
values (8, 7, 73);
insert into pokemon_movimiento_forma
values (8, 95, 74);
insert into pokemon_movimiento_forma
values (8, 9, 82);
insert into pokemon_movimiento_forma
values (8, 58, 83);
insert into pokemon_movimiento_forma
values (8, 5, 84);
insert into pokemon_movimiento_forma
values (8, 92, 1);
insert into pokemon_movimiento_forma
values (8, 91, 5);
insert into pokemon_movimiento_forma
values (8, 82, 8);
insert into pokemon_movimiento_forma
values (8, 66, 9);
insert into pokemon_movimiento_forma
values (8, 73, 10);
insert into pokemon_movimiento_forma
values (8, 8, 11);
insert into pokemon_movimiento_forma
values (8, 7, 12);
insert into pokemon_movimiento_forma
values (8, 35, 13);
insert into pokemon_movimiento_forma
values (8, 36, 14);
insert into pokemon_movimiento_forma
values (8, 44, 17);
insert into pokemon_movimiento_forma
values (8, 37, 18);
insert into pokemon_movimiento_forma
values (8, 39, 19);
insert into pokemon_movimiento_forma
values (8, 79, 20);
insert into pokemon_movimiento_forma
values (8, 147, 28);
insert into pokemon_movimiento_forma
values (8, 94, 31);
insert into pokemon_movimiento_forma
values (8, 72, 32);
insert into pokemon_movimiento_forma
values (8, 143, 33);
insert into pokemon_movimiento_forma
values (8, 118, 34);
insert into pokemon_movimiento_forma
values (8, 58, 40);
insert into pokemon_movimiento_forma
values (8, 135, 44);
insert into pokemon_movimiento_forma
values (8, 114, 50);
insert into pokemon_movimiento_forma
values (8, 10, 53);
insert into pokemon_movimiento_forma
values (8, 78, 54);

insert into pokemon_movimiento_forma
values (9, 1, 56);
insert into pokemon_movimiento_forma
values (9, 89, 56);
insert into pokemon_movimiento_forma
values (9, 3, 56);
insert into pokemon_movimiento_forma
values (9, 7, 56);
insert into pokemon_movimiento_forma
values (9, 3, 79);
insert into pokemon_movimiento_forma
values (9, 7, 73);
insert into pokemon_movimiento_forma
values (9, 95, 74);
insert into pokemon_movimiento_forma
values (9, 9, 82);
insert into pokemon_movimiento_forma
values (9, 58, 76);
insert into pokemon_movimiento_forma
values (9, 5, 85);
insert into pokemon_movimiento_forma
values (9, 92, 1);
insert into pokemon_movimiento_forma
values (9, 91, 5);
insert into pokemon_movimiento_forma
values (9, 82, 8);
insert into pokemon_movimiento_forma
values (9, 66, 9);
insert into pokemon_movimiento_forma
values (9, 73, 10);
insert into pokemon_movimiento_forma
values (9, 8, 11);
insert into pokemon_movimiento_forma
values (9, 7, 12);
insert into pokemon_movimiento_forma
values (9, 35, 13);
insert into pokemon_movimiento_forma
values (9, 36, 14);
insert into pokemon_movimiento_forma
values (9, 44, 17);
insert into pokemon_movimiento_forma
values (9, 37, 18);
insert into pokemon_movimiento_forma
values (9, 39, 19);
insert into pokemon_movimiento_forma
values (9, 79, 20);
insert into pokemon_movimiento_forma
values (9, 147, 28);
insert into pokemon_movimiento_forma
values (9, 94, 31);
insert into pokemon_movimiento_forma
values (9, 72, 32);
insert into pokemon_movimiento_forma
values (9, 143, 33);
insert into pokemon_movimiento_forma
values (9, 118, 34);
insert into pokemon_movimiento_forma
values (9, 58, 40);
insert into pokemon_movimiento_forma
values (9, 135, 44);
insert into pokemon_movimiento_forma
values (9, 114, 50);
insert into pokemon_movimiento_forma
values (9, 10, 53);
insert into pokemon_movimiento_forma
values (9, 78, 54);
insert into pokemon_movimiento_forma
values (9, 88, 15);
insert into pokemon_movimiento_forma
values (9, 151, 26);
insert into pokemon_movimiento_forma
values (9, 148, 27);

insert into pokemon_movimiento_forma
values (10, 1, 56);
insert into pokemon_movimiento_forma
values (10, 13, 56);

insert into pokemon_movimiento_forma
values (11, 77, 56);

insert into pokemon_movimiento_forma
values (12, 134, 56);
insert into pokemon_movimiento_forma
values (12, 134, 78);
insert into pokemon_movimiento_forma
values (12, 157, 73);
insert into pokemon_movimiento_forma
values (12, 127, 79);
insert into pokemon_movimiento_forma
values (12, 129, 80);
insert into pokemon_movimiento_forma
values (12, 113, 81);
insert into pokemon_movimiento_forma
values (12, 106, 82);
insert into pokemon_movimiento_forma
values (12, 141, 83);
insert into pokemon_movimiento_forma
values (12, 119, 2);
insert into pokemon_movimiento_forma
values (12, 106, 4);
insert into pokemon_movimiento_forma
values (12, 159, 6);
insert into pokemon_movimiento_forma
values (12, 66, 9);
insert into pokemon_movimiento_forma
values (12, 73, 10);
insert into pokemon_movimiento_forma
values (12, 88, 15);
insert into pokemon_movimiento_forma
values (12, 79, 20);
insert into pokemon_movimiento_forma
values (12, 126, 21);
insert into pokemon_movimiento_forma
values (12, 128, 22);
insert into pokemon_movimiento_forma
values (12, 142, 29);
insert into pokemon_movimiento_forma
values (12, 144, 30);
insert into pokemon_movimiento_forma
values (12, 94, 31);
insert into pokemon_movimiento_forma
values (12, 72, 32);
insert into pokemon_movimiento_forma
values (12, 143, 33);
insert into pokemon_movimiento_forma
values (12, 118, 34);
insert into pokemon_movimiento_forma
values (12, 103, 39);
insert into pokemon_movimiento_forma
values (12, 135, 44);
insert into pokemon_movimiento_forma
values (12, 140, 46);
insert into pokemon_movimiento_forma
values (12, 114, 50);
insert into pokemon_movimiento_forma
values (12, 69, 55);

insert into pokemon_movimiento_forma
values (13, 155, 56);
insert into pokemon_movimiento_forma
values (13, 13, 56);

insert into pokemon_movimiento_forma
values (14, 77, 56);

insert into pokemon_movimiento_forma
values (15, 52, 56);
insert into pokemon_movimiento_forma
values (15, 52, 86);
insert into pokemon_movimiento_forma
values (15, 76, 87);
insert into pokemon_movimiento_forma
values (15, 14, 59);
insert into pokemon_movimiento_forma
values (15, 79, 92);
insert into pokemon_movimiento_forma
values (15, 15, 65);
insert into pokemon_movimiento_forma
values (15, 130, 81);
insert into pokemon_movimiento_forma
values (15, 2, 3);
insert into pokemon_movimiento_forma
values (15, 159, 6);
insert into pokemon_movimiento_forma
values (15, 66, 9);
insert into pokemon_movimiento_forma
values (15, 73, 10);
insert into pokemon_movimiento_forma
values (15, 88, 15);
insert into pokemon_movimiento_forma
values (15, 79, 20);
insert into pokemon_movimiento_forma
values (15, 126, 21);
insert into pokemon_movimiento_forma
values (15, 94, 31);
insert into pokemon_movimiento_forma
values (15, 72, 32);
insert into pokemon_movimiento_forma
values (15, 143, 33);
insert into pokemon_movimiento_forma
values (15, 118, 34);
insert into pokemon_movimiento_forma
values (15, 103, 39);
insert into pokemon_movimiento_forma
values (15, 58, 40);
insert into pokemon_movimiento_forma
values (15, 135, 44);
insert into pokemon_movimiento_forma
values (15, 114, 50);
insert into pokemon_movimiento_forma
values (15, 64, 51);

insert into pokemon_movimiento_forma
values (16, 115, 56);
insert into pokemon_movimiento_forma
values (16, 51, 93);
insert into pokemon_movimiento_forma
values (16, 53, 86);
insert into pokemon_movimiento_forma
values (16, 106, 94);
insert into pokemon_movimiento_forma
values (16, 161, 80);
insert into pokemon_movimiento_forma
values (16, 130, 78);
insert into pokemon_movimiento_forma
values (16, 162, 95);
insert into pokemon_movimiento_forma
values (16, 119, 2);
insert into pokemon_movimiento_forma
values (16, 106, 4);
insert into pokemon_movimiento_forma
values (16, 159, 6);
insert into pokemon_movimiento_forma
values (16, 66, 9);
insert into pokemon_movimiento_forma
values (16, 73, 10);
insert into pokemon_movimiento_forma
values (16, 79, 20);
insert into pokemon_movimiento_forma
values (16, 94, 31);
insert into pokemon_movimiento_forma
values (16, 72, 32);
insert into pokemon_movimiento_forma
values (16, 143, 33);
insert into pokemon_movimiento_forma
values (16, 118, 34);
insert into pokemon_movimiento_forma
values (16, 103, 39);
insert into pokemon_movimiento_forma
values (16, 160, 43);
insert into pokemon_movimiento_forma
values (16, 135, 44);
insert into pokemon_movimiento_forma
values (16, 114, 50);
insert into pokemon_movimiento_forma
values (16, 166, 52);

insert into pokemon_movimiento_forma
values (17, 115, 56);
insert into pokemon_movimiento_forma
values (17, 51, 56);
insert into pokemon_movimiento_forma
values (17, 51, 93);
insert into pokemon_movimiento_forma
values (17, 53, 86);
insert into pokemon_movimiento_forma
values (17, 106, 89);
insert into pokemon_movimiento_forma
values (17, 161, 82);
insert into pokemon_movimiento_forma
values (17, 130, 96);
insert into pokemon_movimiento_forma
values (17, 162, 97);
insert into pokemon_movimiento_forma
values (17, 119, 2);
insert into pokemon_movimiento_forma
values (17, 106, 4);
insert into pokemon_movimiento_forma
values (17, 159, 6);
insert into pokemon_movimiento_forma
values (17, 66, 9);
insert into pokemon_movimiento_forma
values (17, 73, 10);
insert into pokemon_movimiento_forma
values (17, 79, 20);
insert into pokemon_movimiento_forma
values (17, 94, 31);
insert into pokemon_movimiento_forma
values (17, 72, 32);
insert into pokemon_movimiento_forma
values (17, 143, 33);
insert into pokemon_movimiento_forma
values (17, 118, 34);
insert into pokemon_movimiento_forma
values (17, 103, 39);
insert into pokemon_movimiento_forma
values (17, 160, 43);
insert into pokemon_movimiento_forma
values (17, 135, 44);
insert into pokemon_movimiento_forma
values (17, 114, 50);
insert into pokemon_movimiento_forma
values (17, 166, 52);

insert into pokemon_movimiento_forma
values (18, 115, 56);
insert into pokemon_movimiento_forma
values (18, 51, 56);
insert into pokemon_movimiento_forma
values (18, 53, 56);
insert into pokemon_movimiento_forma
values (18, 53, 86);
insert into pokemon_movimiento_forma
values (18, 51, 93);
insert into pokemon_movimiento_forma
values (18, 106, 89);
insert into pokemon_movimiento_forma
values (18, 161, 82);
insert into pokemon_movimiento_forma
values (18, 130, 95);
insert into pokemon_movimiento_forma
values (18, 162, 68);
insert into pokemon_movimiento_forma
values (18, 119, 2);
insert into pokemon_movimiento_forma
values (18, 106, 4);
insert into pokemon_movimiento_forma
values (18, 159, 6);
insert into pokemon_movimiento_forma
values (18, 66, 9);
insert into pokemon_movimiento_forma
values (18, 73, 10);
insert into pokemon_movimiento_forma
values (18, 88, 15);
insert into pokemon_movimiento_forma
values (18, 79, 20);
insert into pokemon_movimiento_forma
values (18, 94, 31);
insert into pokemon_movimiento_forma
values (18, 72, 32);
insert into pokemon_movimiento_forma
values (18, 143, 33);
insert into pokemon_movimiento_forma
values (18, 118, 34);
insert into pokemon_movimiento_forma
values (18, 103, 39);
insert into pokemon_movimiento_forma
values (18, 160, 43);
insert into pokemon_movimiento_forma
values (18, 135, 44);
insert into pokemon_movimiento_forma
values (18, 114, 50);
insert into pokemon_movimiento_forma
values (18, 166, 52);


insert into pokemon_movimiento_forma
values (19, 1, 56);
insert into pokemon_movimiento_forma
values (19, 89, 56);
insert into pokemon_movimiento_forma
values (19, 53, 57);
insert into pokemon_movimiento_forma
values (19, 87, 98);
insert into pokemon_movimiento_forma
values (19, 76, 99);
insert into pokemon_movimiento_forma
values (19, 112, 61);
insert into pokemon_movimiento_forma
values (19, 159, 6);
insert into pokemon_movimiento_forma
values (19, 82, 8);
insert into pokemon_movimiento_forma
values (19, 66, 9);
insert into pokemon_movimiento_forma
values (19, 73, 10);
insert into pokemon_movimiento_forma
values (19, 8, 11);
insert into pokemon_movimiento_forma
values (19, 7, 12);
insert into pokemon_movimiento_forma
values (19, 36, 14);
insert into pokemon_movimiento_forma
values (19, 79, 20);
insert into pokemon_movimiento_forma
values (19, 20, 24);
insert into pokemon_movimiento_forma
values (19, 21, 25);
insert into pokemon_movimiento_forma
values (19, 147, 28);
insert into pokemon_movimiento_forma
values (19, 94, 31);
insert into pokemon_movimiento_forma
values (19, 72, 32);
insert into pokemon_movimiento_forma
values (19, 118, 34);
insert into pokemon_movimiento_forma
values (19, 103, 34);
insert into pokemon_movimiento_forma
values (19, 103, 39);
insert into pokemon_movimiento_forma
values (19, 58, 40);
insert into pokemon_movimiento_forma
values (19, 135, 44);
insert into pokemon_movimiento_forma
values (19, 114, 50);

insert into pokemon_movimiento_forma
values (20, 1, 56);
insert into pokemon_movimiento_forma
values (20, 89, 56);
insert into pokemon_movimiento_forma
values (20, 53, 56);
insert into pokemon_movimiento_forma
values (20, 53, 57);
insert into pokemon_movimiento_forma
values (20, 87, 98);
insert into pokemon_movimiento_forma
values (20, 76, 60);
insert into pokemon_movimiento_forma
values (20, 112, 62);
insert into pokemon_movimiento_forma
values (20, 35, 13);
insert into pokemon_movimiento_forma
values (20, 159, 6);
insert into pokemon_movimiento_forma
values (20, 82, 8);
insert into pokemon_movimiento_forma
values (20, 66, 9);
insert into pokemon_movimiento_forma
values (20, 73, 10);
insert into pokemon_movimiento_forma
values (20, 8, 11);
insert into pokemon_movimiento_forma
values (20, 7, 12);
insert into pokemon_movimiento_forma
values (20, 36, 14);
insert into pokemon_movimiento_forma
values (20, 79, 20);
insert into pokemon_movimiento_forma
values (20, 20, 24);
insert into pokemon_movimiento_forma
values (20, 21, 25);
insert into pokemon_movimiento_forma
values (20, 147, 28);
insert into pokemon_movimiento_forma
values (20, 94, 31);
insert into pokemon_movimiento_forma
values (20, 72, 32);
insert into pokemon_movimiento_forma
values (20, 118, 34);
insert into pokemon_movimiento_forma
values (20, 103, 34);
insert into pokemon_movimiento_forma
values (20, 103, 39);
insert into pokemon_movimiento_forma
values (20, 58, 40);
insert into pokemon_movimiento_forma
values (20, 135, 44);
insert into pokemon_movimiento_forma
values (20, 114, 50);
insert into pokemon_movimiento_forma
values (20, 88, 15);

insert into pokemon_movimiento_forma
values (21, 165, 56);
insert into pokemon_movimiento_forma
values (21, 85, 56);
insert into pokemon_movimiento_forma
values (21, 90, 72);
insert into pokemon_movimiento_forma
values (21, 52, 73);
insert into pokemon_movimiento_forma
values (21, 162, 64);
insert into pokemon_movimiento_forma
values (21, 164, 100);
insert into pokemon_movimiento_forma
values (21, 130, 78);
insert into pokemon_movimiento_forma
values (21, 119, 2);
insert into pokemon_movimiento_forma
values (21, 106, 4);
insert into pokemon_movimiento_forma
values (21, 159, 6);
insert into pokemon_movimiento_forma
values (21, 66, 9);
insert into pokemon_movimiento_forma
values (21, 73, 10);
insert into pokemon_movimiento_forma
values (21, 79, 20);
insert into pokemon_movimiento_forma
values (21, 94, 31);
insert into pokemon_movimiento_forma
values (21, 72, 32);
insert into pokemon_movimiento_forma
values (21, 118, 34);
insert into pokemon_movimiento_forma
values (21, 103, 39);
insert into pokemon_movimiento_forma
values (21, 160, 43);
insert into pokemon_movimiento_forma
values (21, 135, 44);
insert into pokemon_movimiento_forma
values (21, 114, 50);
insert into pokemon_movimiento_forma
values (21, 166, 52);

insert into pokemon_movimiento_forma
values (22, 165, 56);
insert into pokemon_movimiento_forma
values (22, 85, 56);
insert into pokemon_movimiento_forma
values (22, 90, 56);
insert into pokemon_movimiento_forma
values (22, 90, 72);
insert into pokemon_movimiento_forma
values (22, 52, 73);
insert into pokemon_movimiento_forma
values (22, 162, 92);
insert into pokemon_movimiento_forma
values (22, 164, 61);
insert into pokemon_movimiento_forma
values (22, 130, 69);
insert into pokemon_movimiento_forma
values (22, 119, 2);
insert into pokemon_movimiento_forma
values (22, 106, 4);
insert into pokemon_movimiento_forma
values (22, 159, 6);
insert into pokemon_movimiento_forma
values (22, 66, 9);
insert into pokemon_movimiento_forma
values (22, 73, 10);
insert into pokemon_movimiento_forma
values (22, 88, 15);
insert into pokemon_movimiento_forma
values (22, 79, 20);
insert into pokemon_movimiento_forma
values (22, 94, 31);
insert into pokemon_movimiento_forma
values (22, 72, 32);
insert into pokemon_movimiento_forma
values (22, 118, 34);
insert into pokemon_movimiento_forma
values (22, 103, 39);
insert into pokemon_movimiento_forma
values (22, 160, 43);
insert into pokemon_movimiento_forma
values (22, 135, 44);
insert into pokemon_movimiento_forma
values (22, 114, 50);
insert into pokemon_movimiento_forma
values (22, 166, 52);

insert into pokemon_movimiento_forma
values (23, 107, 56);
insert into pokemon_movimiento_forma
values (23, 90, 56);
insert into pokemon_movimiento_forma
values (23, 155, 101);
insert into pokemon_movimiento_forma
values (23, 95, 88);
insert into pokemon_movimiento_forma
values (23, 68, 74);
insert into pokemon_movimiento_forma
values (23, 60, 82);
insert into pokemon_movimiento_forma
values (23, 152, 66);
insert into pokemon_movimiento_forma
values (23, 159, 6);
insert into pokemon_movimiento_forma
values (23, 82, 8);
insert into pokemon_movimiento_forma
values (23, 66, 9);
insert into pokemon_movimiento_forma
values (23, 73, 10);
insert into pokemon_movimiento_forma
values (23, 79, 20);
insert into pokemon_movimiento_forma
values (23, 126, 21);
insert into pokemon_movimiento_forma
values (23, 151, 26);
insert into pokemon_movimiento_forma
values (23, 148, 27);
insert into pokemon_movimiento_forma
values (23, 94, 31);
insert into pokemon_movimiento_forma
values (23, 72, 32);
insert into pokemon_movimiento_forma
values (23, 118, 34);
insert into pokemon_movimiento_forma
values (23, 58, 40);
insert into pokemon_movimiento_forma
values (23, 135, 44);
insert into pokemon_movimiento_forma
values (23, 145, 48);
insert into pokemon_movimiento_forma
values (23, 114, 50);
insert into pokemon_movimiento_forma
values (23, 78, 54);

insert into pokemon_movimiento_forma
values (24, 107, 56);
insert into pokemon_movimiento_forma
values (24, 90, 56);
insert into pokemon_movimiento_forma
values (24, 155, 56);
insert into pokemon_movimiento_forma
values (24, 155, 101);
insert into pokemon_movimiento_forma
values (24, 95, 88);
insert into pokemon_movimiento_forma
values (24, 68, 60);
insert into pokemon_movimiento_forma
values (24, 60, 78);
insert into pokemon_movimiento_forma
values (24, 152, 84);
insert into pokemon_movimiento_forma
values (24, 159, 6);
insert into pokemon_movimiento_forma
values (24, 82, 8);
insert into pokemon_movimiento_forma
values (24, 66, 9);
insert into pokemon_movimiento_forma
values (24, 73, 10);
insert into pokemon_movimiento_forma
values (24, 88, 15);
insert into pokemon_movimiento_forma
values (24, 79, 20);
insert into pokemon_movimiento_forma
values (24, 126, 21);
insert into pokemon_movimiento_forma
values (24, 151, 26);
insert into pokemon_movimiento_forma
values (24, 148, 27);
insert into pokemon_movimiento_forma
values (24, 94, 31);
insert into pokemon_movimiento_forma
values (24, 72, 32);
insert into pokemon_movimiento_forma
values (24, 118, 34);
insert into pokemon_movimiento_forma
values (24, 58, 40);
insert into pokemon_movimiento_forma
values (24, 135, 44);
insert into pokemon_movimiento_forma
values (24, 145, 48);
insert into pokemon_movimiento_forma
values (24, 114, 50);
insert into pokemon_movimiento_forma
values (24, 78, 54);

insert into pokemon_movimiento_forma
values (25, 17, 56);
insert into pokemon_movimiento_forma
values (25, 89, 56);
insert into pokemon_movimiento_forma
values (25, 18, 72);
insert into pokemon_movimiento_forma
values (25, 53, 87);
insert into pokemon_movimiento_forma
values (25, 103, 90);
insert into pokemon_movimiento_forma
values (25, 130, 75);
insert into pokemon_movimiento_forma
values (25, 21, 69);
insert into pokemon_movimiento_forma
values (25, 92, 1);
insert into pokemon_movimiento_forma
values (25, 91, 5);
insert into pokemon_movimiento_forma
values (25, 159, 6);
insert into pokemon_movimiento_forma
values (25, 82, 8);
insert into pokemon_movimiento_forma
values (25, 66, 9);
insert into pokemon_movimiento_forma
values (25, 73, 10);
insert into pokemon_movimiento_forma
values (25, 71, 16);
insert into pokemon_movimiento_forma
values (25, 44, 17);
insert into pokemon_movimiento_forma
values (25, 39, 19);
insert into pokemon_movimiento_forma
values (25, 79, 20);
insert into pokemon_movimiento_forma
values (25, 20, 24);
insert into pokemon_movimiento_forma
values (25, 21, 25);
insert into pokemon_movimiento_forma
values (25, 94, 31);
insert into pokemon_movimiento_forma
values (25, 72, 32);
insert into pokemon_movimiento_forma
values (25, 143, 33);
insert into pokemon_movimiento_forma
values (25, 118, 34);
insert into pokemon_movimiento_forma
values (25, 103, 39);
insert into pokemon_movimiento_forma
values (25, 58, 40);
insert into pokemon_movimiento_forma
values (25, 135, 44);
insert into pokemon_movimiento_forma
values (25, 18, 45);
insert into pokemon_movimiento_forma
values (25, 114, 50);
insert into pokemon_movimiento_forma
values (25, 69, 55);

insert into pokemon_movimiento_forma
values (26, 17, 56);
insert into pokemon_movimiento_forma
values (26, 89, 56);
insert into pokemon_movimiento_forma
values (26, 18, 56);
insert into pokemon_movimiento_forma
values (26, 92, 1);
insert into pokemon_movimiento_forma
values (26, 91, 5);
insert into pokemon_movimiento_forma
values (26, 159, 6);
insert into pokemon_movimiento_forma
values (26, 82, 8);
insert into pokemon_movimiento_forma
values (26, 66, 9);
insert into pokemon_movimiento_forma
values (26, 73, 10);
insert into pokemon_movimiento_forma
values (26, 88, 15);
insert into pokemon_movimiento_forma
values (26, 71, 16);
insert into pokemon_movimiento_forma
values (26, 44, 17);
insert into pokemon_movimiento_forma
values (26, 39, 19);
insert into pokemon_movimiento_forma
values (26, 79, 20);
insert into pokemon_movimiento_forma
values (26, 20, 24);
insert into pokemon_movimiento_forma
values (26, 21, 25);
insert into pokemon_movimiento_forma
values (26, 94, 31);
insert into pokemon_movimiento_forma
values (26, 72, 32);
insert into pokemon_movimiento_forma
values (26, 143, 33);
insert into pokemon_movimiento_forma
values (26, 118, 34);
insert into pokemon_movimiento_forma
values (26, 103, 39);
insert into pokemon_movimiento_forma
values (26, 58, 40);
insert into pokemon_movimiento_forma
values (26, 135, 44);
insert into pokemon_movimiento_forma
values (26, 18, 45);
insert into pokemon_movimiento_forma
values (26, 114, 50);
insert into pokemon_movimiento_forma
values (26, 69, 55);

insert into pokemon_movimiento_forma
values (27, 49, 56);
insert into pokemon_movimiento_forma
values (27, 51, 101);
insert into pokemon_movimiento_forma
values (27, 65, 88);
insert into pokemon_movimiento_forma
values (27, 155, 74);
insert into pokemon_movimiento_forma
values (27, 103, 82);
insert into pokemon_movimiento_forma
values (27, 84, 66);
insert into pokemon_movimiento_forma
values (27, 2, 3);
insert into pokemon_movimiento_forma
values (27, 159, 6);
insert into pokemon_movimiento_forma
values (27, 82, 8);
insert into pokemon_movimiento_forma
values (27, 66, 9);
insert into pokemon_movimiento_forma
values (27, 73, 10);
insert into pokemon_movimiento_forma
values (27, 44, 17);
insert into pokemon_movimiento_forma
values (27, 39, 19);
insert into pokemon_movimiento_forma
values (27, 79, 20);
insert into pokemon_movimiento_forma
values (27, 151, 26);
insert into pokemon_movimiento_forma
values (27, 148, 27);
insert into pokemon_movimiento_forma
values (27, 147, 28);
insert into pokemon_movimiento_forma
values (27, 94, 31);
insert into pokemon_movimiento_forma
values (27, 72, 32);
insert into pokemon_movimiento_forma
values (27, 118, 34);
insert into pokemon_movimiento_forma
values (27, 103, 39);
insert into pokemon_movimiento_forma
values (27, 58, 40);
insert into pokemon_movimiento_forma
values (27, 135, 44);
insert into pokemon_movimiento_forma
values (27, 145, 48);
insert into pokemon_movimiento_forma
values (27, 114, 50);
insert into pokemon_movimiento_forma
values (27, 78, 54);
insert into pokemon_movimiento_forma
values (27, 64, 51);

insert into pokemon_movimiento_forma
values (28, 49, 56);
insert into pokemon_movimiento_forma
values (28, 51, 56);
insert into pokemon_movimiento_forma
values (28, 51, 101);
insert into pokemon_movimiento_forma
values (28, 65, 88);
insert into pokemon_movimiento_forma
values (28, 155, 60);
insert into pokemon_movimiento_forma
values (28, 103, 78);
insert into pokemon_movimiento_forma
values (28, 84, 84);
insert into pokemon_movimiento_forma
values (28, 2, 3);
insert into pokemon_movimiento_forma
values (28, 159, 6);
insert into pokemon_movimiento_forma
values (28, 82, 8);
insert into pokemon_movimiento_forma
values (28, 66, 9);
insert into pokemon_movimiento_forma
values (28, 73, 10);
insert into pokemon_movimiento_forma
values (28, 88, 15);
insert into pokemon_movimiento_forma
values (28, 44, 17);
insert into pokemon_movimiento_forma
values (28, 39, 19);
insert into pokemon_movimiento_forma
values (28, 79, 20);
insert into pokemon_movimiento_forma
values (28, 151, 26);
insert into pokemon_movimiento_forma
values (28, 148, 27);
insert into pokemon_movimiento_forma
values (28, 147, 28);
insert into pokemon_movimiento_forma
values (28, 94, 31);
insert into pokemon_movimiento_forma
values (28, 72, 32);
insert into pokemon_movimiento_forma
values (28, 118, 34);
insert into pokemon_movimiento_forma
values (28, 103, 39);
insert into pokemon_movimiento_forma
values (28, 58, 40);
insert into pokemon_movimiento_forma
values (28, 135, 44);
insert into pokemon_movimiento_forma
values (28, 145, 48);
insert into pokemon_movimiento_forma
values (28, 114, 50);
insert into pokemon_movimiento_forma
values (28, 78, 54);
insert into pokemon_movimiento_forma
values (28, 64, 51);

insert into pokemon_movimiento_forma
values (29, 85, 56);
insert into pokemon_movimiento_forma
values (29, 1, 56);
insert into pokemon_movimiento_forma
values (29, 49, 79);
insert into pokemon_movimiento_forma
values (29, 155, 98);
insert into pokemon_movimiento_forma
values (29, 89, 89);
insert into pokemon_movimiento_forma
values (29, 95, 100);
insert into pokemon_movimiento_forma
values (29, 84, 78);
insert into pokemon_movimiento_forma
values (29, 38, 69);
insert into pokemon_movimiento_forma
values (29, 159, 6);
insert into pokemon_movimiento_forma
values (29, 82, 8);
insert into pokemon_movimiento_forma
values (29, 66, 9);
insert into pokemon_movimiento_forma
values (29, 73, 10);
insert into pokemon_movimiento_forma
values (29, 36, 14);
insert into pokemon_movimiento_forma
values (29, 79, 20);
insert into pokemon_movimiento_forma
values (29, 20, 24);
insert into pokemon_movimiento_forma
values (29, 21, 25);
insert into pokemon_movimiento_forma
values (29, 94, 31);
insert into pokemon_movimiento_forma
values (29, 72, 32);
insert into pokemon_movimiento_forma
values (29, 143, 33);
insert into pokemon_movimiento_forma
values (29, 118, 34);
insert into pokemon_movimiento_forma
values (29, 58, 40);
insert into pokemon_movimiento_forma
values (29, 135, 44);
insert into pokemon_movimiento_forma
values (29, 114, 50);
insert into pokemon_movimiento_forma
values (30, 85, 56);
insert into pokemon_movimiento_forma
values (30, 49, 56);
insert into pokemon_movimiento_forma
values (30, 1, 56);
insert into pokemon_movimiento_forma
values (30, 49, 79);
insert into pokemon_movimiento_forma
values (30, 155, 98);
insert into pokemon_movimiento_forma
values (30, 89, 99);
insert into pokemon_movimiento_forma
values (30, 95, 91);
insert into pokemon_movimiento_forma
values (30, 84, 62);
insert into pokemon_movimiento_forma
values (30, 38, 102);

insert into pokemon_movimiento_forma
values (30, 159, 6);
insert into pokemon_movimiento_forma
values (30, 97, 7);
insert into pokemon_movimiento_forma
values (30, 82, 8);
insert into pokemon_movimiento_forma
values (30, 66, 9);
insert into pokemon_movimiento_forma
values (30, 73, 10);
insert into pokemon_movimiento_forma
values (30, 8, 11);
insert into pokemon_movimiento_forma
values (30, 7, 12);
insert into pokemon_movimiento_forma
values (30, 35, 13);
insert into pokemon_movimiento_forma
values (30, 36, 14);
insert into pokemon_movimiento_forma
values (30, 79, 20);
insert into pokemon_movimiento_forma
values (30, 20, 24);
insert into pokemon_movimiento_forma
values (30, 21, 25);
insert into pokemon_movimiento_forma
values (30, 94, 31);
insert into pokemon_movimiento_forma
values (30, 72, 32);
insert into pokemon_movimiento_forma
values (30, 143, 33);
insert into pokemon_movimiento_forma
values (30, 118, 34);
insert into pokemon_movimiento_forma
values (30, 58, 40);
insert into pokemon_movimiento_forma
values (30, 135, 44);
insert into pokemon_movimiento_forma
values (30, 114, 50);

insert into pokemon_movimiento_forma
values (31, 1, 56);
insert into pokemon_movimiento_forma
values (31, 49, 56);
insert into pokemon_movimiento_forma
values (31, 89, 56);
insert into pokemon_movimiento_forma
values (31, 82, 56);
insert into pokemon_movimiento_forma
values (31, 155, 98);
insert into pokemon_movimiento_forma
values (31, 82, 99);
insert into pokemon_movimiento_forma
values (31, 92, 1);
insert into pokemon_movimiento_forma
values (31, 91, 5);
insert into pokemon_movimiento_forma
values (31, 159, 6);
insert into pokemon_movimiento_forma
values (31, 97, 7);
insert into pokemon_movimiento_forma
values (31, 82, 8);
insert into pokemon_movimiento_forma
values (31, 66, 9);
insert into pokemon_movimiento_forma
values (31, 73, 10);
insert into pokemon_movimiento_forma
values (31, 8, 11);
insert into pokemon_movimiento_forma
values (31, 7, 12);
insert into pokemon_movimiento_forma
values (31, 35, 13);
insert into pokemon_movimiento_forma
values (31, 36, 14);
insert into pokemon_movimiento_forma
values (31, 88, 15);
insert into pokemon_movimiento_forma
values (31, 71, 16);
insert into pokemon_movimiento_forma
values (31, 44, 17);
insert into pokemon_movimiento_forma
values (31, 37, 18);
insert into pokemon_movimiento_forma
values (31, 39, 19);
insert into pokemon_movimiento_forma
values (31, 79, 20);
insert into pokemon_movimiento_forma
values (31, 20, 24);
insert into pokemon_movimiento_forma
values (31, 21, 25);
insert into pokemon_movimiento_forma
values (31, 151, 26);
insert into pokemon_movimiento_forma
values (31, 148, 27);
insert into pokemon_movimiento_forma
values (31, 94, 31);
insert into pokemon_movimiento_forma
values (31, 72, 32);
insert into pokemon_movimiento_forma
values (31, 143, 33);
insert into pokemon_movimiento_forma
values (31, 118, 34);
insert into pokemon_movimiento_forma
values (31, 29, 38);
insert into pokemon_movimiento_forma
values (31, 58, 40);
insert into pokemon_movimiento_forma
values (31, 135, 44);
insert into pokemon_movimiento_forma
values (31, 145, 48);
insert into pokemon_movimiento_forma
values (31, 114, 50);
insert into pokemon_movimiento_forma
values (31, 10, 53);
insert into pokemon_movimiento_forma
values (31, 78, 54);

insert into pokemon_movimiento_forma
values (32, 1, 56);
insert into pokemon_movimiento_forma
values (32, 90, 56);
insert into pokemon_movimiento_forma
values (32, 63, 79);
insert into pokemon_movimiento_forma
values (32, 155, 98);
insert into pokemon_movimiento_forma
values (32, 76, 89);
insert into pokemon_movimiento_forma
values (32, 52, 100);
insert into pokemon_movimiento_forma
values (32, 97, 78);
insert into pokemon_movimiento_forma
values (32, 38, 69);
insert into pokemon_movimiento_forma
values (32, 159, 6);
insert into pokemon_movimiento_forma
values (32, 97, 7);
insert into pokemon_movimiento_forma
values (32, 82, 8);
insert into pokemon_movimiento_forma
values (32, 66, 9);
insert into pokemon_movimiento_forma
values (32, 73, 10);
insert into pokemon_movimiento_forma
values (32, 36, 14);
insert into pokemon_movimiento_forma
values (32, 79, 20);
insert into pokemon_movimiento_forma
values (32, 20, 24);
insert into pokemon_movimiento_forma
values (32, 21, 25);
insert into pokemon_movimiento_forma
values (32, 94, 31);
insert into pokemon_movimiento_forma
values (32, 72, 32);
insert into pokemon_movimiento_forma
values (32, 143, 33);
insert into pokemon_movimiento_forma
values (32, 118, 34);
insert into pokemon_movimiento_forma
values (32, 58, 40);
insert into pokemon_movimiento_forma
values (32, 135, 44);
insert into pokemon_movimiento_forma
values (32, 114, 50);

insert into pokemon_movimiento_forma
values (33, 90, 56);
insert into pokemon_movimiento_forma
values (33, 1, 56);
insert into pokemon_movimiento_forma
values (33, 63, 56);
insert into pokemon_movimiento_forma
values (33, 63, 79);
insert into pokemon_movimiento_forma
values (33, 155, 98);
insert into pokemon_movimiento_forma
values (33, 76, 99);
insert into pokemon_movimiento_forma
values (33, 52, 91);
insert into pokemon_movimiento_forma
values (33, 97, 62);
insert into pokemon_movimiento_forma
values (33, 38, 102);
insert into pokemon_movimiento_forma
values (33, 159, 6);
insert into pokemon_movimiento_forma
values (33, 97, 7);
insert into pokemon_movimiento_forma
values (33, 82, 8);
insert into pokemon_movimiento_forma
values (33, 66, 9);
insert into pokemon_movimiento_forma
values (33, 73, 10);
insert into pokemon_movimiento_forma
values (33, 8, 11);
insert into pokemon_movimiento_forma
values (33, 7, 12);
insert into pokemon_movimiento_forma
values (33, 35, 13);
insert into pokemon_movimiento_forma
values (33, 36, 14);
insert into pokemon_movimiento_forma
values (33, 79, 20);
insert into pokemon_movimiento_forma
values (33, 20, 24);
insert into pokemon_movimiento_forma
values (33, 21, 25);
insert into pokemon_movimiento_forma
values (33, 94, 31);
insert into pokemon_movimiento_forma
values (33, 72, 32);
insert into pokemon_movimiento_forma
values (33, 143, 33);
insert into pokemon_movimiento_forma
values (33, 118, 34);
insert into pokemon_movimiento_forma
values (33, 58, 40);
insert into pokemon_movimiento_forma
values (33, 135, 44);
insert into pokemon_movimiento_forma
values (33, 114, 50);

insert into pokemon_movimiento_forma
values (34, 1, 56);
insert into pokemon_movimiento_forma
values (34, 63, 56);
insert into pokemon_movimiento_forma
values (34, 155, 56);
insert into pokemon_movimiento_forma
values (34, 80, 56);
insert into pokemon_movimiento_forma
values (34, 80, 99);
insert into pokemon_movimiento_forma
values (34, 63, 79);
insert into pokemon_movimiento_forma
values (34, 155, 98);

insert into pokemon_movimiento_forma
values (34, 92, 1);
insert into pokemon_movimiento_forma
values (34, 91, 5);
insert into pokemon_movimiento_forma
values (34, 159, 6);
insert into pokemon_movimiento_forma
values (34, 97, 7);
insert into pokemon_movimiento_forma
values (34, 82, 8);
insert into pokemon_movimiento_forma
values (34, 66, 9);
insert into pokemon_movimiento_forma
values (34, 73, 10);
insert into pokemon_movimiento_forma
values (34, 8, 11);
insert into pokemon_movimiento_forma
values (34, 7, 12);
insert into pokemon_movimiento_forma
values (34, 35, 13);
insert into pokemon_movimiento_forma
values (34, 36, 14);
insert into pokemon_movimiento_forma
values (34, 88, 15);
insert into pokemon_movimiento_forma
values (34, 71, 16);
insert into pokemon_movimiento_forma
values (34, 44, 17);
insert into pokemon_movimiento_forma
values (34, 37, 18);
insert into pokemon_movimiento_forma
values (34, 39, 19);
insert into pokemon_movimiento_forma
values (34, 79, 20);
insert into pokemon_movimiento_forma
values (34, 20, 24);
insert into pokemon_movimiento_forma
values (34, 21, 25);
insert into pokemon_movimiento_forma
values (34, 151, 26);
insert into pokemon_movimiento_forma
values (34, 148, 27);
insert into pokemon_movimiento_forma
values (34, 94, 31);
insert into pokemon_movimiento_forma
values (34, 72, 32);
insert into pokemon_movimiento_forma
values (34, 143, 33);
insert into pokemon_movimiento_forma
values (34, 118, 34);
insert into pokemon_movimiento_forma
values (34, 29, 38);
insert into pokemon_movimiento_forma
values (34, 58, 40);
insert into pokemon_movimiento_forma
values (34, 135, 44);
insert into pokemon_movimiento_forma
values (34, 145, 48);
insert into pokemon_movimiento_forma
values (34, 114, 50);
insert into pokemon_movimiento_forma
values (34, 10, 53);
insert into pokemon_movimiento_forma
values (34, 78, 54);

insert into pokemon_movimiento_forma
values (35, 70, 56);
insert into pokemon_movimiento_forma
values (35, 85, 56);
insert into pokemon_movimiento_forma
values (35, 59, 58);
insert into pokemon_movimiento_forma
values (35, 74, 106);
insert into pokemon_movimiento_forma
values (35, 105, 74);
insert into pokemon_movimiento_forma
values (35, 93, 82);
insert into pokemon_movimiento_forma
values (35, 109, 83);
insert into pokemon_movimiento_forma
values (35, 139, 63);
insert into pokemon_movimiento_forma
values (35, 92, 1);
insert into pokemon_movimiento_forma
values (35, 91, 5);
insert into pokemon_movimiento_forma
values (35, 159, 6);
insert into pokemon_movimiento_forma
values (35, 82, 8);
insert into pokemon_movimiento_forma
values (35, 66, 9);
insert into pokemon_movimiento_forma
values (35, 73, 10);
insert into pokemon_movimiento_forma
values (35, 8, 11);
insert into pokemon_movimiento_forma
values (35, 7, 12);
insert into pokemon_movimiento_forma
values (35, 35, 13);
insert into pokemon_movimiento_forma
values (35, 36, 14);
insert into pokemon_movimiento_forma
values (35, 44, 17);
insert into pokemon_movimiento_forma
values (35, 37, 18);
insert into pokemon_movimiento_forma
values (35, 39, 19);
insert into pokemon_movimiento_forma
values (35, 79, 20);
insert into pokemon_movimiento_forma
values (35, 128, 22);
insert into pokemon_movimiento_forma
values (35, 20, 24);
insert into pokemon_movimiento_forma
values (35, 21, 25);
insert into pokemon_movimiento_forma
values (35, 142, 29);
insert into pokemon_movimiento_forma
values (35, 144, 30);
insert into pokemon_movimiento_forma
values (35, 94, 31);
insert into pokemon_movimiento_forma
values (35, 72, 32);
insert into pokemon_movimiento_forma
values (35, 143, 33);
insert into pokemon_movimiento_forma
values (35, 118, 34);
insert into pokemon_movimiento_forma
values (35, 93, 35);
insert into pokemon_movimiento_forma
values (35, 29, 38);
insert into pokemon_movimiento_forma
values (35, 58, 40);
insert into pokemon_movimiento_forma
values (35, 18, 45);
insert into pokemon_movimiento_forma
values (35, 140, 46);
insert into pokemon_movimiento_forma
values (35, 117, 49);
insert into pokemon_movimiento_forma
values (35, 114, 50);
insert into pokemon_movimiento_forma
values (35, 78, 54);
insert into pokemon_movimiento_forma
values (35, 69, 55);
insert into pokemon_movimiento_forma
values (36, 59, 56);
insert into pokemon_movimiento_forma
values (36, 74, 56);
insert into pokemon_movimiento_forma
values (36, 105, 56);
insert into pokemon_movimiento_forma
values (36, 93, 56);

insert into pokemon_movimiento_forma
values (36, 92, 1);
insert into pokemon_movimiento_forma
values (36, 91, 5);
insert into pokemon_movimiento_forma
values (36, 159, 6);
insert into pokemon_movimiento_forma
values (36, 82, 8);
insert into pokemon_movimiento_forma
values (36, 66, 9);
insert into pokemon_movimiento_forma
values (36, 73, 10);
insert into pokemon_movimiento_forma
values (36, 8, 11);
insert into pokemon_movimiento_forma
values (36, 7, 12);
insert into pokemon_movimiento_forma
values (36, 35, 13);
insert into pokemon_movimiento_forma
values (36, 36, 14);
insert into pokemon_movimiento_forma
values (36, 88, 15);
insert into pokemon_movimiento_forma
values (36, 44, 17);
insert into pokemon_movimiento_forma
values (36, 37, 18);
insert into pokemon_movimiento_forma
values (36, 39, 19);
insert into pokemon_movimiento_forma
values (36, 79, 20);
insert into pokemon_movimiento_forma
values (36, 128, 22);
insert into pokemon_movimiento_forma
values (36, 20, 24);
insert into pokemon_movimiento_forma
values (36, 21, 25);
insert into pokemon_movimiento_forma
values (36, 142, 29);
insert into pokemon_movimiento_forma
values (36, 144, 30);
insert into pokemon_movimiento_forma
values (36, 94, 31);
insert into pokemon_movimiento_forma
values (36, 72, 32);
insert into pokemon_movimiento_forma
values (36, 143, 33);
insert into pokemon_movimiento_forma
values (36, 118, 34);
insert into pokemon_movimiento_forma
values (36, 93, 35);
insert into pokemon_movimiento_forma
values (36, 29, 38);
insert into pokemon_movimiento_forma
values (36, 58, 40);
insert into pokemon_movimiento_forma
values (36, 18, 45);
insert into pokemon_movimiento_forma
values (36, 140, 46);
insert into pokemon_movimiento_forma
values (36, 117, 49);
insert into pokemon_movimiento_forma
values (36, 114, 50);
insert into pokemon_movimiento_forma
values (36, 78, 54);
insert into pokemon_movimiento_forma
values (36, 69, 55);

insert into pokemon_movimiento_forma
values (37, 26, 56);
insert into pokemon_movimiento_forma
values (37, 89, 56);
insert into pokemon_movimiento_forma
values (37, 53, 87);
insert into pokemon_movimiento_forma
values (37, 110, 89);
insert into pokemon_movimiento_forma
values (37, 24, 80);
insert into pokemon_movimiento_forma
values (37, 28, 81);
insert into pokemon_movimiento_forma
values (37, 27, 76);
insert into pokemon_movimiento_forma
values (37, 159, 6);
insert into pokemon_movimiento_forma
values (37, 82, 8);
insert into pokemon_movimiento_forma
values (37, 66, 9);
insert into pokemon_movimiento_forma
values (37, 73, 10);
insert into pokemon_movimiento_forma
values (37, 79, 20);
insert into pokemon_movimiento_forma
values (37, 147, 28);
insert into pokemon_movimiento_forma
values (37, 94, 31);
insert into pokemon_movimiento_forma
values (37, 72, 32);
insert into pokemon_movimiento_forma
values (37, 143, 33);
insert into pokemon_movimiento_forma
values (37, 118, 34);
insert into pokemon_movimiento_forma
values (37, 29, 38);
insert into pokemon_movimiento_forma
values (37, 103, 39);
insert into pokemon_movimiento_forma
values (37, 58, 40);
insert into pokemon_movimiento_forma
values (37, 135, 44);
insert into pokemon_movimiento_forma
values (37, 114, 50);

insert into pokemon_movimiento_forma
values (38, 26, 56);
insert into pokemon_movimiento_forma
values (38, 89, 56);
insert into pokemon_movimiento_forma
values (38, 53, 56);
insert into pokemon_movimiento_forma
values (38, 110, 56);
insert into pokemon_movimiento_forma
values (38, 159, 6);
insert into pokemon_movimiento_forma
values (38, 82, 8);
insert into pokemon_movimiento_forma
values (38, 66, 9);
insert into pokemon_movimiento_forma
values (38, 73, 10);
insert into pokemon_movimiento_forma
values (38, 88, 15);
insert into pokemon_movimiento_forma
values (38, 79, 20);
insert into pokemon_movimiento_forma
values (38, 147, 28);
insert into pokemon_movimiento_forma
values (38, 94, 31);
insert into pokemon_movimiento_forma
values (38, 72, 32);
insert into pokemon_movimiento_forma
values (38, 143, 33);
insert into pokemon_movimiento_forma
values (38, 118, 34);
insert into pokemon_movimiento_forma
values (38, 29, 38);
insert into pokemon_movimiento_forma
values (38, 103, 39);
insert into pokemon_movimiento_forma
values (38, 58, 40);
insert into pokemon_movimiento_forma
values (38, 135, 44);
insert into pokemon_movimiento_forma
values (38, 114, 50);

insert into pokemon_movimiento_forma
values (39, 59, 56);
insert into pokemon_movimiento_forma
values (39, 70, 72);
insert into pokemon_movimiento_forma
values (39, 48, 98);
insert into pokemon_movimiento_forma
values (39, 109, 94);
insert into pokemon_movimiento_forma
values (39, 74, 74);
insert into pokemon_movimiento_forma
values (39, 135, 100);
insert into pokemon_movimiento_forma
values (39, 82, 61);
insert into pokemon_movimiento_forma
values (39, 73, 83);
insert into pokemon_movimiento_forma
values (39, 92, 1);
insert into pokemon_movimiento_forma
values (39, 91, 5);
insert into pokemon_movimiento_forma
values (39, 159, 6);
insert into pokemon_movimiento_forma
values (39, 82, 8);
insert into pokemon_movimiento_forma
values (39, 66, 9);
insert into pokemon_movimiento_forma
values (39, 73, 10);
insert into pokemon_movimiento_forma
values (39, 8, 11);
insert into pokemon_movimiento_forma
values (39, 7, 12);
insert into pokemon_movimiento_forma
values (39, 35, 13);
insert into pokemon_movimiento_forma
values (39, 36, 14);
insert into pokemon_movimiento_forma
values (39, 44, 17);
insert into pokemon_movimiento_forma
values (39, 37, 18);
insert into pokemon_movimiento_forma
values (39, 39, 19);
insert into pokemon_movimiento_forma
values (39, 79, 20);
insert into pokemon_movimiento_forma
values (39, 128, 22);
insert into pokemon_movimiento_forma
values (39, 20, 24);
insert into pokemon_movimiento_forma
values (39, 21, 25);
insert into pokemon_movimiento_forma
values (39, 142, 29);
insert into pokemon_movimiento_forma
values (39, 144, 30);
insert into pokemon_movimiento_forma
values (39, 94, 31);
insert into pokemon_movimiento_forma
values (39, 72, 32);
insert into pokemon_movimiento_forma
values (39, 143, 33);
insert into pokemon_movimiento_forma
values (39, 118, 34);
insert into pokemon_movimiento_forma
values (39, 29, 38);
insert into pokemon_movimiento_forma
values (39, 58, 40);
insert into pokemon_movimiento_forma
values (39, 135, 44);
insert into pokemon_movimiento_forma
values (39, 18, 45);
insert into pokemon_movimiento_forma
values (39, 140, 46);
insert into pokemon_movimiento_forma
values (39, 117, 49);
insert into pokemon_movimiento_forma
values (39, 114, 50);
insert into pokemon_movimiento_forma
values (39, 78, 54);
insert into pokemon_movimiento_forma
values (39, 69, 55);

insert into pokemon_movimiento_forma
values (40, 59, 56);
insert into pokemon_movimiento_forma
values (40, 48, 56);
insert into pokemon_movimiento_forma
values (40, 109, 56);
insert into pokemon_movimiento_forma
values (40, 74, 56);
insert into pokemon_movimiento_forma
values (40, 88, 15);
insert into pokemon_movimiento_forma
values (40, 92, 1);
insert into pokemon_movimiento_forma
values (40, 91, 5);
insert into pokemon_movimiento_forma
values (40, 159, 6);
insert into pokemon_movimiento_forma
values (40, 82, 8);
insert into pokemon_movimiento_forma
values (40, 66, 9);
insert into pokemon_movimiento_forma
values (40, 73, 10);
insert into pokemon_movimiento_forma
values (40, 8, 11);
insert into pokemon_movimiento_forma
values (40, 7, 12);
insert into pokemon_movimiento_forma
values (40, 35, 13);
insert into pokemon_movimiento_forma
values (40, 36, 14);
insert into pokemon_movimiento_forma
values (40, 44, 17);
insert into pokemon_movimiento_forma
values (40, 37, 18);
insert into pokemon_movimiento_forma
values (40, 39, 19);
insert into pokemon_movimiento_forma
values (40, 79, 20);
insert into pokemon_movimiento_forma
values (40, 128, 22);
insert into pokemon_movimiento_forma
values (40, 20, 24);
insert into pokemon_movimiento_forma
values (40, 21, 25);
insert into pokemon_movimiento_forma
values (40, 142, 29);
insert into pokemon_movimiento_forma
values (40, 144, 30);
insert into pokemon_movimiento_forma
values (40, 94, 31);
insert into pokemon_movimiento_forma
values (40, 72, 32);
insert into pokemon_movimiento_forma
values (40, 143, 33);
insert into pokemon_movimiento_forma
values (40, 118, 34);
insert into pokemon_movimiento_forma
values (40, 29, 38);
insert into pokemon_movimiento_forma
values (40, 58, 40);
insert into pokemon_movimiento_forma
values (40, 135, 44);
insert into pokemon_movimiento_forma
values (40, 18, 45);
insert into pokemon_movimiento_forma
values (40, 140, 46);
insert into pokemon_movimiento_forma
values (40, 117, 49);
insert into pokemon_movimiento_forma
values (40, 114, 50);
insert into pokemon_movimiento_forma
values (40, 78, 54);
insert into pokemon_movimiento_forma
values (40, 69, 55);

insert into pokemon_movimiento_forma
values (41, 12, 56);
insert into pokemon_movimiento_forma
values (41, 113, 101);
insert into pokemon_movimiento_forma
values (41, 95, 73);
insert into pokemon_movimiento_forma
values (41, 24, 89);
insert into pokemon_movimiento_forma
values (41, 161, 80);
insert into pokemon_movimiento_forma
values (41, 32, 78);
insert into pokemon_movimiento_forma
values (41, 119, 2);
insert into pokemon_movimiento_forma
values (41, 106, 4);
insert into pokemon_movimiento_forma
values (41, 159, 6);
insert into pokemon_movimiento_forma
values (41, 66, 9);
insert into pokemon_movimiento_forma
values (41, 73, 10);
insert into pokemon_movimiento_forma
values (41, 79, 20);
insert into pokemon_movimiento_forma
values (41, 126, 21);
insert into pokemon_movimiento_forma
values (41, 94, 31);
insert into pokemon_movimiento_forma
values (41, 72, 32);
insert into pokemon_movimiento_forma
values (41, 118, 34);
insert into pokemon_movimiento_forma
values (41, 103, 39);
insert into pokemon_movimiento_forma
values (41, 135, 44);
insert into pokemon_movimiento_forma
values (41, 114, 50);

insert into pokemon_movimiento_forma
values (42, 60, 56);
insert into pokemon_movimiento_forma
values (42, 12, 56);
insert into pokemon_movimiento_forma
values (42, 113, 56);
insert into pokemon_movimiento_forma
values (42, 95, 73);
insert into pokemon_movimiento_forma
values (42, 24, 89);
insert into pokemon_movimiento_forma
values (42, 161, 91);
insert into pokemon_movimiento_forma
values (42, 32, 69);
insert into pokemon_movimiento_forma
values (42, 119, 2);
insert into pokemon_movimiento_forma
values (42, 106, 4);
insert into pokemon_movimiento_forma
values (42, 159, 6);
insert into pokemon_movimiento_forma
values (42, 66, 9);
insert into pokemon_movimiento_forma
values (42, 73, 10);
insert into pokemon_movimiento_forma
values (42, 88, 15);
insert into pokemon_movimiento_forma
values (42, 79, 20);
insert into pokemon_movimiento_forma
values (42, 126, 21);
insert into pokemon_movimiento_forma
values (42, 94, 31);
insert into pokemon_movimiento_forma
values (42, 72, 32);
insert into pokemon_movimiento_forma
values (42, 118, 34);
insert into pokemon_movimiento_forma
values (42, 103, 39);
insert into pokemon_movimiento_forma
values (42, 135, 44);
insert into pokemon_movimiento_forma
values (42, 114, 50);

insert into pokemon_movimiento_forma
values (43, 120, 56);
insert into pokemon_movimiento_forma
values (43, 157, 73);
insert into pokemon_movimiento_forma
values (43, 127, 88);
insert into pokemon_movimiento_forma
values (43, 129, 94);
insert into pokemon_movimiento_forma
values (43, 152, 74);
insert into pokemon_movimiento_forma
values (43, 121, 75);
insert into pokemon_movimiento_forma
values (43, 128, 67);
insert into pokemon_movimiento_forma
values (43, 2, 3);
insert into pokemon_movimiento_forma
values (43, 159, 6);
insert into pokemon_movimiento_forma
values (43, 66, 9);
insert into pokemon_movimiento_forma
values (43, 73, 10);
insert into pokemon_movimiento_forma
values (43, 79, 20);
insert into pokemon_movimiento_forma
values (43, 126, 21);
insert into pokemon_movimiento_forma
values (43, 128, 22);
insert into pokemon_movimiento_forma
values (43, 94, 31);
insert into pokemon_movimiento_forma
values (43, 72, 32);
insert into pokemon_movimiento_forma
values (43, 143, 33);
insert into pokemon_movimiento_forma
values (43, 118, 34);
insert into pokemon_movimiento_forma
values (43, 135, 44);
insert into pokemon_movimiento_forma
values (43, 114, 50);
insert into pokemon_movimiento_forma
values (43, 64, 51);

insert into pokemon_movimiento_forma
values (44, 120, 56);
insert into pokemon_movimiento_forma
values (44, 157, 56);
insert into pokemon_movimiento_forma
values (44, 127, 56);
insert into pokemon_movimiento_forma
values (44, 157, 73);
insert into pokemon_movimiento_forma
values (44, 127, 88);
insert into pokemon_movimiento_forma
values (44, 152, 80);
insert into pokemon_movimiento_forma
values (44, 121, 66);
insert into pokemon_movimiento_forma
values (44, 128, 85);
insert into pokemon_movimiento_forma
values (44, 2, 3);
insert into pokemon_movimiento_forma
values (44, 159, 6);
insert into pokemon_movimiento_forma
values (44, 66, 9);
insert into pokemon_movimiento_forma
values (44, 73, 10);
insert into pokemon_movimiento_forma
values (44, 79, 20);
insert into pokemon_movimiento_forma
values (44, 126, 21);
insert into pokemon_movimiento_forma
values (44, 128, 22);
insert into pokemon_movimiento_forma
values (44, 94, 31);
insert into pokemon_movimiento_forma
values (44, 72, 32);
insert into pokemon_movimiento_forma
values (44, 143, 33);
insert into pokemon_movimiento_forma
values (44, 118, 34);
insert into pokemon_movimiento_forma
values (44, 135, 44);
insert into pokemon_movimiento_forma
values (44, 114, 50);
insert into pokemon_movimiento_forma
values (44, 64, 51);

insert into pokemon_movimiento_forma
values (45, 127, 56);
insert into pokemon_movimiento_forma
values (45, 129, 56);
insert into pokemon_movimiento_forma
values (45, 152, 56);
insert into pokemon_movimiento_forma
values (45, 121, 56);
insert into pokemon_movimiento_forma
values (45, 157, 73);
insert into pokemon_movimiento_forma
values (45, 127, 88);
insert into pokemon_movimiento_forma
values (45, 129, 94);
insert into pokemon_movimiento_forma
values (45, 2, 3);
insert into pokemon_movimiento_forma
values (45, 159, 6);
insert into pokemon_movimiento_forma
values (45, 66, 9);
insert into pokemon_movimiento_forma
values (45, 73, 10);
insert into pokemon_movimiento_forma
values (45, 88, 15);
insert into pokemon_movimiento_forma
values (45, 79, 20);
insert into pokemon_movimiento_forma
values (45, 126, 21);
insert into pokemon_movimiento_forma
values (45, 128, 22);
insert into pokemon_movimiento_forma
values (45, 94, 31);
insert into pokemon_movimiento_forma
values (45, 72, 32);
insert into pokemon_movimiento_forma
values (45, 143, 33);
insert into pokemon_movimiento_forma
values (45, 118, 34);
insert into pokemon_movimiento_forma
values (45, 135, 44);
insert into pokemon_movimiento_forma
values (45, 114, 50);
insert into pokemon_movimiento_forma
values (45, 64, 51);



insert into pokemon_movimiento_forma
values (46, 49, 56);
insert into pokemon_movimiento_forma
values (46, 127, 58);
insert into pokemon_movimiento_forma
values (46, 12, 59);
insert into pokemon_movimiento_forma
values (46, 123, 60);
insert into pokemon_movimiento_forma
values (46, 65, 61);
insert into pokemon_movimiento_forma
values (46, 67, 62);
insert into pokemon_movimiento_forma
values (46, 2, 3);
insert into pokemon_movimiento_forma
values (46, 159, 6);
insert into pokemon_movimiento_forma
values (46, 82, 8);
insert into pokemon_movimiento_forma
values (46, 66, 9);
insert into pokemon_movimiento_forma
values (46, 73, 10);
insert into pokemon_movimiento_forma
values (46, 79, 20);
insert into pokemon_movimiento_forma
values (46, 126, 21);
insert into pokemon_movimiento_forma
values (46, 128, 22);
insert into pokemon_movimiento_forma
values (46, 147, 28);
insert into pokemon_movimiento_forma
values (46, 94, 31);
insert into pokemon_movimiento_forma
values (46, 72, 32);
insert into pokemon_movimiento_forma
values (46, 143, 33);
insert into pokemon_movimiento_forma
values (46, 118, 34);
insert into pokemon_movimiento_forma
values (46, 58, 40);
insert into pokemon_movimiento_forma
values (46, 135, 44);
insert into pokemon_movimiento_forma
values (46, 114, 50);
insert into pokemon_movimiento_forma
values (46, 64, 51);

insert into pokemon_movimiento_forma
values (47, 49, 56);
insert into pokemon_movimiento_forma
values (47, 127, 56);
insert into pokemon_movimiento_forma
values (47, 12, 56);
insert into pokemon_movimiento_forma
values (47, 127, 58);
insert into pokemon_movimiento_forma
values (47, 12, 59);
insert into pokemon_movimiento_forma
values (47, 123, 65);
insert into pokemon_movimiento_forma
values (47, 65, 83);
insert into pokemon_movimiento_forma
values (47, 67, 63);
insert into pokemon_movimiento_forma
values (47, 2, 3);
insert into pokemon_movimiento_forma
values (47, 159, 6);
insert into pokemon_movimiento_forma
values (47, 82, 8);
insert into pokemon_movimiento_forma
values (47, 66, 9);
insert into pokemon_movimiento_forma
values (47, 73, 10);
insert into pokemon_movimiento_forma
values (47, 88, 15);
insert into pokemon_movimiento_forma
values (47, 79, 20);
insert into pokemon_movimiento_forma
values (47, 126, 21);
insert into pokemon_movimiento_forma
values (47, 128, 22);
insert into pokemon_movimiento_forma
values (47, 147, 28);
insert into pokemon_movimiento_forma
values (47, 94, 31);
insert into pokemon_movimiento_forma
values (47, 72, 32);
insert into pokemon_movimiento_forma
values (47, 143, 33);
insert into pokemon_movimiento_forma
values (47, 118, 34);
insert into pokemon_movimiento_forma
values (47, 58, 40);
insert into pokemon_movimiento_forma
values (47, 135, 44);
insert into pokemon_movimiento_forma
values (47, 114, 50);
insert into pokemon_movimiento_forma
values (47, 64, 51);

insert into pokemon_movimiento_forma
values (48, 1, 56);
insert into pokemon_movimiento_forma
values (48, 48, 56);
insert into pokemon_movimiento_forma
values (48, 157, 74);
insert into pokemon_movimiento_forma
values (48, 12, 60);
insert into pokemon_movimiento_forma
values (48, 127, 65);
insert into pokemon_movimiento_forma
values (48, 141, 81);
insert into pokemon_movimiento_forma
values (48, 129, 66);
insert into pokemon_movimiento_forma
values (48, 142, 69);
insert into pokemon_movimiento_forma
values (48, 159, 6);
insert into pokemon_movimiento_forma
values (48, 66, 9);
insert into pokemon_movimiento_forma
values (48, 73, 10);
insert into pokemon_movimiento_forma
values (48, 79, 20);
insert into pokemon_movimiento_forma
values (48, 126, 21);
insert into pokemon_movimiento_forma
values (48, 128, 22);
insert into pokemon_movimiento_forma
values (48, 142, 29);
insert into pokemon_movimiento_forma
values (48, 94, 31);
insert into pokemon_movimiento_forma
values (48, 72, 32);
insert into pokemon_movimiento_forma
values (48, 143, 33);
insert into pokemon_movimiento_forma
values (48, 118, 34);
insert into pokemon_movimiento_forma
values (48, 135, 44);
insert into pokemon_movimiento_forma
values (48, 140, 46);
insert into pokemon_movimiento_forma
values (48, 114, 50);
insert into pokemon_movimiento_forma
values (48, 69, 55);

insert into pokemon_movimiento_forma
values (49, 1, 56);
insert into pokemon_movimiento_forma
values (49, 48, 56);
insert into pokemon_movimiento_forma
values (49, 157, 56);
insert into pokemon_movimiento_forma
values (49, 12, 56);
insert into pokemon_movimiento_forma
values (49, 157, 74);
insert into pokemon_movimiento_forma
values (49, 12, 60);
insert into pokemon_movimiento_forma
values (49, 127, 65);
insert into pokemon_movimiento_forma
values (49, 141, 66);
insert into pokemon_movimiento_forma
values (49, 129, 69);
insert into pokemon_movimiento_forma
values (49, 142, 102);
insert into pokemon_movimiento_forma
values (49, 119, 2);
insert into pokemon_movimiento_forma
values (49, 106, 4);
insert into pokemon_movimiento_forma
values (49, 88, 15);
insert into pokemon_movimiento_forma
values (49, 144, 30);
insert into pokemon_movimiento_forma
values (49, 103, 39);
insert into pokemon_movimiento_forma
values (49, 159, 6);
insert into pokemon_movimiento_forma
values (49, 66, 9);
insert into pokemon_movimiento_forma
values (49, 73, 10);
insert into pokemon_movimiento_forma
values (49, 79, 20);
insert into pokemon_movimiento_forma
values (49, 126, 21);
insert into pokemon_movimiento_forma
values (49, 128, 22);
insert into pokemon_movimiento_forma
values (49, 142, 29);
insert into pokemon_movimiento_forma
values (49, 94, 31);
insert into pokemon_movimiento_forma
values (49, 72, 32);
insert into pokemon_movimiento_forma
values (49, 143, 33);
insert into pokemon_movimiento_forma
values (49, 118, 34);
insert into pokemon_movimiento_forma
values (49, 135, 44);
insert into pokemon_movimiento_forma
values (49, 140, 46);
insert into pokemon_movimiento_forma
values (49, 114, 50);
insert into pokemon_movimiento_forma
values (49, 69, 55);

insert into pokemon_movimiento_forma
values (50, 49, 56);
insert into pokemon_movimiento_forma
values (50, 85, 73);
insert into pokemon_movimiento_forma
values (50, 147, 94);
insert into pokemon_movimiento_forma
values (50, 51, 74);
insert into pokemon_movimiento_forma
values (50, 65, 82);
insert into pokemon_movimiento_forma
values (50, 151, 96);
insert into pokemon_movimiento_forma
values (50, 159, 6);
insert into pokemon_movimiento_forma
values (50, 82, 8);
insert into pokemon_movimiento_forma
values (50, 66, 9);
insert into pokemon_movimiento_forma
values (50, 73, 10);
insert into pokemon_movimiento_forma
values (50, 79, 20);
insert into pokemon_movimiento_forma
values (50, 151, 26);
insert into pokemon_movimiento_forma
values (50, 148, 27);
insert into pokemon_movimiento_forma
values (50, 147, 28);
insert into pokemon_movimiento_forma
values (50, 94, 31);
insert into pokemon_movimiento_forma
values (50, 72, 32);
insert into pokemon_movimiento_forma
values (50, 118, 34);
insert into pokemon_movimiento_forma
values (50, 135, 44);
insert into pokemon_movimiento_forma
values (50, 145, 48);
insert into pokemon_movimiento_forma
values (50, 114, 50);
insert into pokemon_movimiento_forma
values (50, 64, 51);

insert into pokemon_movimiento_forma
values (51, 49, 56);
insert into pokemon_movimiento_forma
values (51, 85, 56);
insert into pokemon_movimiento_forma
values (51, 147, 56);
insert into pokemon_movimiento_forma
values (51, 85, 73);
insert into pokemon_movimiento_forma
values (51, 147, 94);
insert into pokemon_movimiento_forma
values (51, 51, 74);
insert into pokemon_movimiento_forma
values (51, 65, 81);
insert into pokemon_movimiento_forma
values (51, 151, 84);
insert into pokemon_movimiento_forma
values (51, 159, 6);
insert into pokemon_movimiento_forma
values (51, 82, 8);
insert into pokemon_movimiento_forma
values (51, 66, 9);
insert into pokemon_movimiento_forma
values (51, 73, 10);
insert into pokemon_movimiento_forma
values (51, 88, 15);
insert into pokemon_movimiento_forma
values (51, 79, 20);
insert into pokemon_movimiento_forma
values (51, 151, 26);
insert into pokemon_movimiento_forma
values (51, 148, 27);
insert into pokemon_movimiento_forma
values (51, 147, 28);
insert into pokemon_movimiento_forma
values (51, 94, 31);
insert into pokemon_movimiento_forma
values (51, 72, 32);
insert into pokemon_movimiento_forma
values (51, 118, 34);
insert into pokemon_movimiento_forma
values (51, 135, 44);
insert into pokemon_movimiento_forma
values (51, 145, 48);
insert into pokemon_movimiento_forma
values (51, 114, 50);
insert into pokemon_movimiento_forma
values (51, 64, 51);

insert into pokemon_movimiento_forma
values (52, 49, 56);
insert into pokemon_movimiento_forma
values (52, 85, 56);
insert into pokemon_movimiento_forma
values (52, 95, 86);
insert into pokemon_movimiento_forma
values (52, 71, 88);
insert into pokemon_movimiento_forma
values (52, 60, 74);
insert into pokemon_movimiento_forma
values (52, 84, 75);
insert into pokemon_movimiento_forma
values (52, 65, 95);
insert into pokemon_movimiento_forma
values (52, 159, 6);
insert into pokemon_movimiento_forma
values (52, 82, 8);
insert into pokemon_movimiento_forma
values (52, 66, 9);
insert into pokemon_movimiento_forma
values (52, 73, 10);
insert into pokemon_movimiento_forma
values (52, 8, 11);
insert into pokemon_movimiento_forma
values (52, 7, 12);
insert into pokemon_movimiento_forma
values (52, 71, 16);
insert into pokemon_movimiento_forma
values (52, 79, 20);
insert into pokemon_movimiento_forma
values (52, 20, 24);
insert into pokemon_movimiento_forma
values (52, 21, 25);
insert into pokemon_movimiento_forma
values (52, 94, 31);
insert into pokemon_movimiento_forma
values (52, 72, 32);
insert into pokemon_movimiento_forma
values (52, 118, 34);
insert into pokemon_movimiento_forma
values (52, 103, 39);
insert into pokemon_movimiento_forma
values (52, 58, 40);
insert into pokemon_movimiento_forma
values (52, 135, 44);
insert into pokemon_movimiento_forma
values (52, 114, 50);

insert into pokemon_movimiento_forma
values (53, 49, 56);
insert into pokemon_movimiento_forma
values (53, 85, 56);
insert into pokemon_movimiento_forma
values (53, 95, 56);
insert into pokemon_movimiento_forma
values (53, 95, 86);
insert into pokemon_movimiento_forma
values (53, 71, 88);
insert into pokemon_movimiento_forma
values (53, 60, 74);
insert into pokemon_movimiento_forma
values (53, 84, 103);
insert into pokemon_movimiento_forma
values (53, 65, 104);
insert into pokemon_movimiento_forma
values (53, 159, 6);
insert into pokemon_movimiento_forma
values (53, 82, 8);
insert into pokemon_movimiento_forma
values (53, 66, 9);
insert into pokemon_movimiento_forma
values (53, 73, 10);
insert into pokemon_movimiento_forma
values (53, 8, 11);
insert into pokemon_movimiento_forma
values (53, 7, 12);
insert into pokemon_movimiento_forma
values (53, 88, 15);
insert into pokemon_movimiento_forma
values (53, 71, 16);
insert into pokemon_movimiento_forma
values (53, 79, 20);
insert into pokemon_movimiento_forma
values (53, 20, 24);
insert into pokemon_movimiento_forma
values (53, 21, 25);
insert into pokemon_movimiento_forma
values (53, 94, 31);
insert into pokemon_movimiento_forma
values (53, 72, 32);
insert into pokemon_movimiento_forma
values (53, 118, 34);
insert into pokemon_movimiento_forma
values (53, 103, 39);
insert into pokemon_movimiento_forma
values (53, 58, 40);
insert into pokemon_movimiento_forma
values (53, 135, 44);
insert into pokemon_movimiento_forma
values (53, 114, 50);

insert into pokemon_movimiento_forma
values (54, 49, 56);
insert into pokemon_movimiento_forma
values (54, 89, 80);
insert into pokemon_movimiento_forma
values (54, 48, 82);
insert into pokemon_movimiento_forma
values (54, 134, 78);
insert into pokemon_movimiento_forma
values (54, 84, 69);
insert into pokemon_movimiento_forma
values (54, 5, 85);
insert into pokemon_movimiento_forma
values (54, 92, 1);
insert into pokemon_movimiento_forma
values (54, 91, 5);
insert into pokemon_movimiento_forma
values (54, 159, 6);
insert into pokemon_movimiento_forma
values (54, 82, 8);
insert into pokemon_movimiento_forma
values (54, 66, 9);
insert into pokemon_movimiento_forma
values (54, 73, 10);
insert into pokemon_movimiento_forma
values (54, 8, 11);
insert into pokemon_movimiento_forma
values (54, 7, 12);
insert into pokemon_movimiento_forma
values (54, 35, 13);
insert into pokemon_movimiento_forma
values (54, 36, 14);
insert into pokemon_movimiento_forma
values (54, 71, 16);
insert into pokemon_movimiento_forma
values (54, 44, 17);
insert into pokemon_movimiento_forma
values (54, 37, 18);
insert into pokemon_movimiento_forma
values (54, 39, 19);
insert into pokemon_movimiento_forma
values (54, 79, 20);
insert into pokemon_movimiento_forma
values (54, 147, 28);
insert into pokemon_movimiento_forma
values (54, 94, 31);
insert into pokemon_movimiento_forma
values (54, 72, 32);
insert into pokemon_movimiento_forma
values (54, 118, 34);
insert into pokemon_movimiento_forma
values (54, 103, 39);
insert into pokemon_movimiento_forma
values (54, 58, 40);
insert into pokemon_movimiento_forma
values (54, 135, 44);
insert into pokemon_movimiento_forma
values (54, 114, 50);
insert into pokemon_movimiento_forma
values (54, 10, 53);
insert into pokemon_movimiento_forma
values (54, 78, 54);

insert into pokemon_movimiento_forma
values (55, 49, 56);
insert into pokemon_movimiento_forma
values (55, 89, 56);
insert into pokemon_movimiento_forma
values (55, 48, 56);
insert into pokemon_movimiento_forma
values (55, 89, 80);
insert into pokemon_movimiento_forma
values (55, 48, 82);
insert into pokemon_movimiento_forma
values (55, 134, 83);
insert into pokemon_movimiento_forma
values (55, 84, 63);
insert into pokemon_movimiento_forma
values (55, 5, 105);
insert into pokemon_movimiento_forma
values (55, 92, 1);
insert into pokemon_movimiento_forma
values (55, 91, 5);
insert into pokemon_movimiento_forma
values (55, 159, 6);
insert into pokemon_movimiento_forma
values (55, 82, 8);
insert into pokemon_movimiento_forma
values (55, 66, 9);
insert into pokemon_movimiento_forma
values (55, 73, 10);
insert into pokemon_movimiento_forma
values (55, 8, 11);
insert into pokemon_movimiento_forma
values (55, 7, 12);
insert into pokemon_movimiento_forma
values (55, 35, 13);
insert into pokemon_movimiento_forma
values (55, 36, 14);
insert into pokemon_movimiento_forma
values (55, 88, 15);
insert into pokemon_movimiento_forma
values (55, 71, 16);
insert into pokemon_movimiento_forma
values (55, 44, 17);
insert into pokemon_movimiento_forma
values (55, 37, 18);
insert into pokemon_movimiento_forma
values (55, 39, 19);
insert into pokemon_movimiento_forma
values (55, 79, 20);
insert into pokemon_movimiento_forma
values (55, 147, 28);
insert into pokemon_movimiento_forma
values (55, 94, 31);
insert into pokemon_movimiento_forma
values (55, 72, 32);
insert into pokemon_movimiento_forma
values (55, 118, 34);
insert into pokemon_movimiento_forma
values (55, 103, 39);
insert into pokemon_movimiento_forma
values (55, 58, 40);
insert into pokemon_movimiento_forma
values (55, 135, 44);
insert into pokemon_movimiento_forma
values (55, 114, 50);
insert into pokemon_movimiento_forma
values (55, 10, 53);
insert into pokemon_movimiento_forma
values (55, 78, 54);

insert into pokemon_movimiento_forma
values (56, 49, 56);
insert into pokemon_movimiento_forma
values (56, 90, 56);
insert into pokemon_movimiento_forma
values (56, 83, 73);
insert into pokemon_movimiento_forma
values (56, 84, 89);
insert into pokemon_movimiento_forma
values (56, 76, 60);
insert into pokemon_movimiento_forma
values (56, 39, 75);
insert into pokemon_movimiento_forma
values (56, 80, 83);
insert into pokemon_movimiento_forma
values (56, 92, 1);
insert into pokemon_movimiento_forma
values (56, 91, 5);
insert into pokemon_movimiento_forma
values (56, 159, 6);
insert into pokemon_movimiento_forma
values (56, 82, 8);
insert into pokemon_movimiento_forma
values (56, 66, 9);
insert into pokemon_movimiento_forma
values (56, 73, 10);
insert into pokemon_movimiento_forma
values (56, 71, 16);
insert into pokemon_movimiento_forma
values (56, 44, 17);
insert into pokemon_movimiento_forma
values (56, 37, 18);
insert into pokemon_movimiento_forma
values (56, 39, 19);
insert into pokemon_movimiento_forma
values (56, 79, 20);
insert into pokemon_movimiento_forma
values (56, 20, 24);
insert into pokemon_movimiento_forma
values (56, 21, 25);
insert into pokemon_movimiento_forma
values (56, 147, 28);
insert into pokemon_movimiento_forma
values (56, 94, 31);
insert into pokemon_movimiento_forma
values (56, 72, 32);
insert into pokemon_movimiento_forma
values (56, 118, 34);
insert into pokemon_movimiento_forma
values (56, 93, 35);
insert into pokemon_movimiento_forma
values (56, 103, 39);
insert into pokemon_movimiento_forma
values (56, 58, 40);
insert into pokemon_movimiento_forma
values (56, 135, 44);
insert into pokemon_movimiento_forma
values (56, 145, 48);
insert into pokemon_movimiento_forma
values (56, 114, 50);
insert into pokemon_movimiento_forma
values (56, 78, 54);

insert into pokemon_movimiento_forma
values (57, 49, 56);
insert into pokemon_movimiento_forma
values (57, 90, 56);
insert into pokemon_movimiento_forma
values (57, 83, 56);
insert into pokemon_movimiento_forma
values (57, 84, 56);
insert into pokemon_movimiento_forma
values (57, 83, 73);
insert into pokemon_movimiento_forma
values (57, 84, 89);
insert into pokemon_movimiento_forma
values (57, 76, 60);
insert into pokemon_movimiento_forma
values (57, 39, 103);
insert into pokemon_movimiento_forma
values (57, 80, 67);
insert into pokemon_movimiento_forma
values (57, 92, 1);
insert into pokemon_movimiento_forma
values (57, 91, 5);
insert into pokemon_movimiento_forma
values (57, 159, 6);
insert into pokemon_movimiento_forma
values (57, 82, 8);
insert into pokemon_movimiento_forma
values (57, 66, 9);
insert into pokemon_movimiento_forma
values (57, 73, 10);
insert into pokemon_movimiento_forma
values (57, 88, 15);
insert into pokemon_movimiento_forma
values (57, 71, 16);
insert into pokemon_movimiento_forma
values (57, 44, 17);
insert into pokemon_movimiento_forma
values (57, 37, 18);
insert into pokemon_movimiento_forma
values (57, 39, 19);
insert into pokemon_movimiento_forma
values (57, 79, 20);
insert into pokemon_movimiento_forma
values (57, 20, 24);
insert into pokemon_movimiento_forma
values (57, 21, 25);
insert into pokemon_movimiento_forma
values (57, 147, 28);
insert into pokemon_movimiento_forma
values (57, 94, 31);
insert into pokemon_movimiento_forma
values (57, 72, 32);
insert into pokemon_movimiento_forma
values (57, 118, 34);
insert into pokemon_movimiento_forma
values (57, 93, 35);
insert into pokemon_movimiento_forma
values (57, 103, 39);
insert into pokemon_movimiento_forma
values (57, 58, 40);
insert into pokemon_movimiento_forma
values (57, 135, 44);
insert into pokemon_movimiento_forma
values (57, 145, 48);
insert into pokemon_movimiento_forma
values (57, 114, 50);
insert into pokemon_movimiento_forma
values (57, 78, 54);

insert into pokemon_movimiento_forma
values (58, 95, 56);
insert into pokemon_movimiento_forma
values (58, 110, 56);
insert into pokemon_movimiento_forma
values (58, 26, 106);
insert into pokemon_movimiento_forma
values (58, 90, 99);
insert into pokemon_movimiento_forma
values (58, 66, 65);
insert into pokemon_movimiento_forma
values (58, 130, 83);
insert into pokemon_movimiento_forma
values (58, 28, 102);
insert into pokemon_movimiento_forma
values (58, 159, 6);
insert into pokemon_movimiento_forma
values (58, 82, 8);
insert into pokemon_movimiento_forma
values (58, 66, 9);
insert into pokemon_movimiento_forma
values (58, 73, 10);
insert into pokemon_movimiento_forma
values (58, 79, 20);
insert into pokemon_movimiento_forma
values (58, 16, 23);
insert into pokemon_movimiento_forma
values (58, 147, 28);
insert into pokemon_movimiento_forma
values (58, 94, 31);
insert into pokemon_movimiento_forma
values (58, 72, 32);
insert into pokemon_movimiento_forma
values (58, 143, 33);
insert into pokemon_movimiento_forma
values (58, 118, 34);
insert into pokemon_movimiento_forma
values (58, 29, 38);
insert into pokemon_movimiento_forma
values (58, 103, 39);
insert into pokemon_movimiento_forma
values (58, 58, 40);
insert into pokemon_movimiento_forma
values (58, 135, 44);
insert into pokemon_movimiento_forma
values (58, 114, 50);

insert into pokemon_movimiento_forma
values (59, 110, 56);
insert into pokemon_movimiento_forma
values (59, 26, 56);
insert into pokemon_movimiento_forma
values (59, 90, 56);
insert into pokemon_movimiento_forma
values (59, 66, 56);
insert into pokemon_movimiento_forma
values (59, 159, 6);
insert into pokemon_movimiento_forma
values (59, 82, 8);
insert into pokemon_movimiento_forma
values (59, 66, 9);
insert into pokemon_movimiento_forma
values (59, 73, 10);
insert into pokemon_movimiento_forma
values (59, 88, 15);
insert into pokemon_movimiento_forma
values (59, 79, 20);
insert into pokemon_movimiento_forma
values (59, 16, 23);
insert into pokemon_movimiento_forma
values (59, 147, 28);
insert into pokemon_movimiento_forma
values (59, 94, 31);
insert into pokemon_movimiento_forma
values (59, 72, 32);
insert into pokemon_movimiento_forma
values (59, 143, 33);
insert into pokemon_movimiento_forma
values (59, 118, 34);
insert into pokemon_movimiento_forma
values (59, 29, 38);
insert into pokemon_movimiento_forma
values (59, 103, 39);
insert into pokemon_movimiento_forma
values (59, 58, 40);
insert into pokemon_movimiento_forma
values (59, 135, 44);
insert into pokemon_movimiento_forma
values (59, 114, 50);

insert into pokemon_movimiento_forma
values (60, 3, 56);
insert into pokemon_movimiento_forma
values (60, 136, 87);
insert into pokemon_movimiento_forma
values (60, 7, 94);
insert into pokemon_movimiento_forma
values (60, 74, 92);
insert into pokemon_movimiento_forma
values (60, 82, 82);
insert into pokemon_movimiento_forma
values (60, 131, 66);
insert into pokemon_movimiento_forma
values (60, 5, 107);
insert into pokemon_movimiento_forma
values (60, 159, 6);
insert into pokemon_movimiento_forma
values (60, 82, 8);
insert into pokemon_movimiento_forma
values (60, 66, 9);
insert into pokemon_movimiento_forma
values (60, 73, 10);
insert into pokemon_movimiento_forma
values (60, 8, 11);
insert into pokemon_movimiento_forma
values (60, 7, 12);
insert into pokemon_movimiento_forma
values (60, 35, 13);
insert into pokemon_movimiento_forma
values (60, 36, 14);
insert into pokemon_movimiento_forma
values (60, 79, 20);
insert into pokemon_movimiento_forma
values (60, 142, 29);
insert into pokemon_movimiento_forma
values (60, 94, 31);
insert into pokemon_movimiento_forma
values (60, 72, 32);
insert into pokemon_movimiento_forma
values (60, 118, 34);
insert into pokemon_movimiento_forma
values (60, 58, 40);
insert into pokemon_movimiento_forma
values (60, 135, 44);
insert into pokemon_movimiento_forma
values (60, 140, 46);
insert into pokemon_movimiento_forma
values (60, 114, 50);
insert into pokemon_movimiento_forma
values (60, 10, 53);

insert into pokemon_movimiento_forma
values (61, 3, 56);
insert into pokemon_movimiento_forma
values (61, 136, 56);
insert into pokemon_movimiento_forma
values (61, 7, 56);
insert into pokemon_movimiento_forma
values (61, 7, 94);
insert into pokemon_movimiento_forma
values (61, 136, 87);
insert into pokemon_movimiento_forma
values (61, 74, 90);
insert into pokemon_movimiento_forma
values (61, 82, 75);
insert into pokemon_movimiento_forma
values (61, 131, 62);
insert into pokemon_movimiento_forma
values (61, 5, 97);
insert into pokemon_movimiento_forma
values (61, 92, 1);
insert into pokemon_movimiento_forma
values (61, 91, 5);
insert into pokemon_movimiento_forma
values (61, 159, 6);
insert into pokemon_movimiento_forma
values (61, 82, 8);
insert into pokemon_movimiento_forma
values (61, 66, 9);
insert into pokemon_movimiento_forma
values (61, 73, 10);
insert into pokemon_movimiento_forma
values (61, 8, 11);
insert into pokemon_movimiento_forma
values (61, 7, 12);
insert into pokemon_movimiento_forma
values (61, 35, 13);
insert into pokemon_movimiento_forma
values (61, 36, 14);
insert into pokemon_movimiento_forma
values (61, 44, 17);
insert into pokemon_movimiento_forma
values (61, 37, 18);
insert into pokemon_movimiento_forma
values (61, 39, 19);
insert into pokemon_movimiento_forma
values (61, 79, 20);
insert into pokemon_movimiento_forma
values (61, 151, 26);
insert into pokemon_movimiento_forma
values (61, 148, 27);
insert into pokemon_movimiento_forma
values (61, 142, 29);
insert into pokemon_movimiento_forma
values (61, 94, 31);
insert into pokemon_movimiento_forma
values (61, 72, 32);
insert into pokemon_movimiento_forma
values (61, 118, 34);
insert into pokemon_movimiento_forma
values (61, 93, 35);
insert into pokemon_movimiento_forma
values (61, 58, 40);
insert into pokemon_movimiento_forma
values (61, 135, 44);
insert into pokemon_movimiento_forma
values (61, 140, 46);
insert into pokemon_movimiento_forma
values (61, 114, 50);
insert into pokemon_movimiento_forma
values (61, 10, 53);

insert into pokemon_movimiento_forma
values (62, 136, 56);
insert into pokemon_movimiento_forma
values (62, 7, 56);
insert into pokemon_movimiento_forma
values (62, 74, 56);
insert into pokemon_movimiento_forma
values (62, 82, 56);
insert into pokemon_movimiento_forma
values (62, 136, 87);
insert into pokemon_movimiento_forma
values (62, 7, 94);
insert into pokemon_movimiento_forma
values (62, 92, 1);
insert into pokemon_movimiento_forma
values (62, 91, 5);
insert into pokemon_movimiento_forma
values (62, 159, 6);
insert into pokemon_movimiento_forma
values (62, 82, 8);
insert into pokemon_movimiento_forma
values (62, 66, 9);
insert into pokemon_movimiento_forma
values (62, 73, 10);
insert into pokemon_movimiento_forma
values (62, 8, 11);
insert into pokemon_movimiento_forma
values (62, 7, 12);
insert into pokemon_movimiento_forma
values (62, 35, 13);
insert into pokemon_movimiento_forma
values (62, 36, 14);
insert into pokemon_movimiento_forma
values (62, 88, 15);
insert into pokemon_movimiento_forma
values (62, 44, 17);
insert into pokemon_movimiento_forma
values (62, 37, 18);
insert into pokemon_movimiento_forma
values (62, 39, 19);
insert into pokemon_movimiento_forma
values (62, 79, 20);
insert into pokemon_movimiento_forma
values (62, 151, 26);
insert into pokemon_movimiento_forma
values (62, 148, 27);
insert into pokemon_movimiento_forma
values (62, 142, 29);
insert into pokemon_movimiento_forma
values (62, 94, 31);
insert into pokemon_movimiento_forma
values (62, 72, 32);
insert into pokemon_movimiento_forma
values (62, 118, 34);
insert into pokemon_movimiento_forma
values (62, 93, 35);
insert into pokemon_movimiento_forma
values (62, 58, 40);
insert into pokemon_movimiento_forma
values (62, 135, 44);
insert into pokemon_movimiento_forma
values (62, 140, 46);
insert into pokemon_movimiento_forma
values (62, 114, 50);
insert into pokemon_movimiento_forma
values (62, 10, 53);
insert into pokemon_movimiento_forma
values (62, 78, 54);

insert into pokemon_movimiento_forma
values (63, 144, 56);
insert into pokemon_movimiento_forma
values (63, 92, 1);
insert into pokemon_movimiento_forma
values (63, 91, 5);
insert into pokemon_movimiento_forma
values (63, 159, 6);
insert into pokemon_movimiento_forma
values (63, 82, 8);
insert into pokemon_movimiento_forma
values (63, 66, 9);
insert into pokemon_movimiento_forma
values (63, 73, 10);
insert into pokemon_movimiento_forma
values (63, 44, 17);
insert into pokemon_movimiento_forma
values (63, 37, 18);
insert into pokemon_movimiento_forma
values (63, 39, 19);
insert into pokemon_movimiento_forma
values (63, 79, 20);
insert into pokemon_movimiento_forma
values (63, 142, 29);
insert into pokemon_movimiento_forma
values (63, 144, 30);
insert into pokemon_movimiento_forma
values (63, 94, 31);
insert into pokemon_movimiento_forma
values (63, 72, 32);
insert into pokemon_movimiento_forma
values (63, 143, 33);
insert into pokemon_movimiento_forma
values (63, 118, 34);
insert into pokemon_movimiento_forma
values (63, 93, 35);
insert into pokemon_movimiento_forma
values (63, 58, 40);
insert into pokemon_movimiento_forma
values (63, 135, 44);
insert into pokemon_movimiento_forma
values (63, 140, 46);
insert into pokemon_movimiento_forma
values (63, 117, 49);
insert into pokemon_movimiento_forma
values (63, 114, 50);
insert into pokemon_movimiento_forma
values (63, 69, 55);

insert into pokemon_movimiento_forma
values (64, 144, 56);
insert into pokemon_movimiento_forma
values (64, 134, 56);
insert into pokemon_movimiento_forma
values (64, 48, 56);
insert into pokemon_movimiento_forma
values (64, 134, 87);
insert into pokemon_movimiento_forma
values (64, 48, 59);
insert into pokemon_movimiento_forma
values (64, 141, 60);
insert into pokemon_movimiento_forma
values (64, 104, 82);
insert into pokemon_movimiento_forma
values (64, 142, 66);
insert into pokemon_movimiento_forma
values (64, 143, 76);
insert into pokemon_movimiento_forma
values (64, 92, 1);
insert into pokemon_movimiento_forma
values (64, 91, 5);
insert into pokemon_movimiento_forma
values (64, 159, 6);
insert into pokemon_movimiento_forma
values (64, 82, 8);
insert into pokemon_movimiento_forma
values (64, 66, 9);
insert into pokemon_movimiento_forma
values (64, 73, 10);
insert into pokemon_movimiento_forma
values (64, 44, 17);
insert into pokemon_movimiento_forma
values (64, 37, 18);
insert into pokemon_movimiento_forma
values (64, 39, 19);
insert into pokemon_movimiento_forma
values (64, 79, 20);
insert into pokemon_movimiento_forma
values (64, 143, 28);
insert into pokemon_movimiento_forma
values (64, 142, 29);
insert into pokemon_movimiento_forma
values (64, 144, 30);
insert into pokemon_movimiento_forma
values (64, 94, 31);
insert into pokemon_movimiento_forma
values (64, 72, 32);
insert into pokemon_movimiento_forma
values (64, 143, 33);
insert into pokemon_movimiento_forma
values (64, 118, 34);
insert into pokemon_movimiento_forma
values (64, 93, 35);
insert into pokemon_movimiento_forma
values (64, 58, 40);
insert into pokemon_movimiento_forma
values (64, 135, 44);
insert into pokemon_movimiento_forma
values (64, 140, 46);
insert into pokemon_movimiento_forma
values (64, 117, 49);
insert into pokemon_movimiento_forma
values (64, 114, 50);
insert into pokemon_movimiento_forma
values (64, 69, 55);

insert into pokemon_movimiento_forma
values (65, 144, 56);
insert into pokemon_movimiento_forma
values (65, 134, 56);
insert into pokemon_movimiento_forma
values (65, 48, 56);
insert into pokemon_movimiento_forma
values (65, 134, 87);
insert into pokemon_movimiento_forma
values (65, 48, 59);
insert into pokemon_movimiento_forma
values (65, 141, 60);
insert into pokemon_movimiento_forma
values (65, 104, 82);
insert into pokemon_movimiento_forma
values (65, 142, 66);
insert into pokemon_movimiento_forma
values (65, 143, 76);
insert into pokemon_movimiento_forma
values (65, 92, 1);
insert into pokemon_movimiento_forma
values (65, 91, 5);
insert into pokemon_movimiento_forma
values (65, 159, 6);
insert into pokemon_movimiento_forma
values (65, 82, 8);
insert into pokemon_movimiento_forma
values (65, 66, 9);
insert into pokemon_movimiento_forma
values (65, 73, 10);
insert into pokemon_movimiento_forma
values (65, 88, 15);
insert into pokemon_movimiento_forma
values (65, 44, 17);
insert into pokemon_movimiento_forma
values (65, 37, 18);
insert into pokemon_movimiento_forma
values (65, 39, 19);
insert into pokemon_movimiento_forma
values (65, 79, 20);
insert into pokemon_movimiento_forma
values (65, 143, 28);
insert into pokemon_movimiento_forma
values (65, 142, 29);
insert into pokemon_movimiento_forma
values (65, 144, 30);
insert into pokemon_movimiento_forma
values (65, 94, 31);
insert into pokemon_movimiento_forma
values (65, 72, 32);
insert into pokemon_movimiento_forma
values (65, 143, 33);
insert into pokemon_movimiento_forma
values (65, 118, 34);
insert into pokemon_movimiento_forma
values (65, 93, 35);
insert into pokemon_movimiento_forma
values (65, 58, 40);
insert into pokemon_movimiento_forma
values (65, 135, 44);
insert into pokemon_movimiento_forma
values (65, 140, 46);
insert into pokemon_movimiento_forma
values (65, 117, 49);
insert into pokemon_movimiento_forma
values (65, 114, 50);
insert into pokemon_movimiento_forma
values (65, 69, 55);

insert into pokemon_movimiento_forma
values (66, 83, 56);
insert into pokemon_movimiento_forma
values (66, 40, 59);
insert into pokemon_movimiento_forma
values (66, 90, 92);
insert into pokemon_movimiento_forma
values (66, 76, 91);
insert into pokemon_movimiento_forma
values (66, 39, 83);
insert into pokemon_movimiento_forma
values (66, 44, 67);
insert into pokemon_movimiento_forma
values (66, 92, 1);
insert into pokemon_movimiento_forma
values (66, 91, 5);
insert into pokemon_movimiento_forma
values (66, 159, 6);
insert into pokemon_movimiento_forma
values (66, 82, 8);
insert into pokemon_movimiento_forma
values (66, 66, 9);
insert into pokemon_movimiento_forma
values (66, 73, 10);
insert into pokemon_movimiento_forma
values (66, 44, 17);
insert into pokemon_movimiento_forma
values (66, 37, 18);
insert into pokemon_movimiento_forma
values (66, 39, 19);
insert into pokemon_movimiento_forma
values (66, 79, 20);
insert into pokemon_movimiento_forma
values (66, 151, 26);
insert into pokemon_movimiento_forma
values (66, 148, 27);
insert into pokemon_movimiento_forma
values (66, 147, 28);
insert into pokemon_movimiento_forma
values (66, 94, 31);
insert into pokemon_movimiento_forma
values (66, 72, 32);
insert into pokemon_movimiento_forma
values (66, 118, 34);
insert into pokemon_movimiento_forma
values (66, 93, 35);
insert into pokemon_movimiento_forma
values (66, 29, 38);
insert into pokemon_movimiento_forma
values (66, 58, 40);
insert into pokemon_movimiento_forma
values (66, 135, 44);
insert into pokemon_movimiento_forma
values (66, 145, 48);
insert into pokemon_movimiento_forma
values (66, 114, 50);
insert into pokemon_movimiento_forma
values (66, 78, 54);

insert into pokemon_movimiento_forma
values (67, 40, 56);
insert into pokemon_movimiento_forma
values (67, 90, 56);
insert into pokemon_movimiento_forma
values (67, 83, 56);
insert into pokemon_movimiento_forma
values (67, 40, 59);
insert into pokemon_movimiento_forma
values (67, 90, 92);
insert into pokemon_movimiento_forma
values (67, 76, 78);
insert into pokemon_movimiento_forma
values (67, 39, 95);
insert into pokemon_movimiento_forma
values (67, 44, 85);
insert into pokemon_movimiento_forma
values (67, 92, 1);
insert into pokemon_movimiento_forma
values (67, 91, 5);
insert into pokemon_movimiento_forma
values (67, 159, 6);
insert into pokemon_movimiento_forma
values (67, 82, 8);
insert into pokemon_movimiento_forma
values (67, 66, 9);
insert into pokemon_movimiento_forma
values (67, 73, 10);
insert into pokemon_movimiento_forma
values (67, 44, 17);
insert into pokemon_movimiento_forma
values (67, 37, 18);
insert into pokemon_movimiento_forma
values (67, 39, 19);
insert into pokemon_movimiento_forma
values (67, 79, 20);
insert into pokemon_movimiento_forma
values (67, 151, 26);
insert into pokemon_movimiento_forma
values (67, 148, 27);
insert into pokemon_movimiento_forma
values (67, 147, 28);
insert into pokemon_movimiento_forma
values (67, 94, 31);
insert into pokemon_movimiento_forma
values (67, 72, 32);
insert into pokemon_movimiento_forma
values (67, 118, 34);
insert into pokemon_movimiento_forma
values (67, 93, 35);
insert into pokemon_movimiento_forma
values (67, 29, 38);
insert into pokemon_movimiento_forma
values (67, 58, 40);
insert into pokemon_movimiento_forma
values (67, 135, 44);
insert into pokemon_movimiento_forma
values (67, 145, 48);
insert into pokemon_movimiento_forma
values (67, 114, 50);
insert into pokemon_movimiento_forma
values (67, 78, 54);

insert into pokemon_movimiento_forma
values (68, 40, 56);
insert into pokemon_movimiento_forma
values (68, 90, 56);
insert into pokemon_movimiento_forma
values (68, 83, 56);
insert into pokemon_movimiento_forma
values (68, 40, 59);
insert into pokemon_movimiento_forma
values (68, 90, 92);
insert into pokemon_movimiento_forma
values (68, 76, 78);
insert into pokemon_movimiento_forma
values (68, 39, 95);
insert into pokemon_movimiento_forma
values (68, 44, 85);
insert into pokemon_movimiento_forma
values (68, 92, 1);
insert into pokemon_movimiento_forma
values (68, 91, 5);
insert into pokemon_movimiento_forma
values (68, 159, 6);
insert into pokemon_movimiento_forma
values (68, 82, 8);
insert into pokemon_movimiento_forma
values (68, 66, 9);
insert into pokemon_movimiento_forma
values (68, 73, 10);
insert into pokemon_movimiento_forma
values (68, 88, 15);
insert into pokemon_movimiento_forma
values (68, 44, 17);
insert into pokemon_movimiento_forma
values (68, 37, 18);
insert into pokemon_movimiento_forma
values (68, 39, 19);
insert into pokemon_movimiento_forma
values (68, 79, 20);
insert into pokemon_movimiento_forma
values (68, 151, 26);
insert into pokemon_movimiento_forma
values (68, 148, 27);
insert into pokemon_movimiento_forma
values (68, 147, 28);
insert into pokemon_movimiento_forma
values (68, 94, 31);
insert into pokemon_movimiento_forma
values (68, 72, 32);
insert into pokemon_movimiento_forma
values (68, 118, 34);
insert into pokemon_movimiento_forma
values (68, 93, 35);
insert into pokemon_movimiento_forma
values (68, 29, 38);
insert into pokemon_movimiento_forma
values (68, 58, 40);
insert into pokemon_movimiento_forma
values (68, 135, 44);
insert into pokemon_movimiento_forma
values (68, 145, 48);
insert into pokemon_movimiento_forma
values (68, 114, 50);
insert into pokemon_movimiento_forma
values (68, 78, 54);

insert into pokemon_movimiento_forma
values (69, 89, 56);
insert into pokemon_movimiento_forma
values (69, 67, 56);
insert into pokemon_movimiento_forma
values (69, 107, 58);
insert into pokemon_movimiento_forma
values (69, 157, 73);
insert into pokemon_movimiento_forma
values (69, 129, 106);
insert into pokemon_movimiento_forma
values (69, 127, 89);
insert into pokemon_movimiento_forma
values (69, 152, 90);
insert into pokemon_movimiento_forma
values (69, 124, 75);
insert into pokemon_movimiento_forma
values (69, 100, 76);
insert into pokemon_movimiento_forma
values (69, 2, 3);
insert into pokemon_movimiento_forma
values (69, 159, 6);
insert into pokemon_movimiento_forma
values (69, 66, 9);
insert into pokemon_movimiento_forma
values (69, 73, 10);
insert into pokemon_movimiento_forma
values (69, 79, 20);
insert into pokemon_movimiento_forma
values (69, 126, 21);
insert into pokemon_movimiento_forma
values (69, 128, 22);
insert into pokemon_movimiento_forma
values (69, 94, 31);
insert into pokemon_movimiento_forma
values (69, 72, 32);
insert into pokemon_movimiento_forma
values (69, 143, 33);
insert into pokemon_movimiento_forma
values (69, 118, 34);
insert into pokemon_movimiento_forma
values (69, 135, 44);
insert into pokemon_movimiento_forma
values (69, 114, 50);
insert into pokemon_movimiento_forma
values (69, 64, 51);
insert into pokemon_movimiento_forma
values (69, 125, 56);

insert into pokemon_movimiento_forma
values (70, 67, 56);
insert into pokemon_movimiento_forma
values (70, 125, 56);
insert into pokemon_movimiento_forma
values (70, 107, 56);
insert into pokemon_movimiento_forma
values (70, 107, 58);
insert into pokemon_movimiento_forma
values (70, 157, 73);
insert into pokemon_movimiento_forma
values (70, 129, 106);
insert into pokemon_movimiento_forma
values (70, 127, 99);
insert into pokemon_movimiento_forma
values (70, 152, 100);
insert into pokemon_movimiento_forma
values (70, 124, 66);
insert into pokemon_movimiento_forma
values (70, 100, 97);
insert into pokemon_movimiento_forma
values (70, 2, 3);
insert into pokemon_movimiento_forma
values (70, 159, 6);
insert into pokemon_movimiento_forma
values (70, 66, 9);
insert into pokemon_movimiento_forma
values (70, 73, 10);
insert into pokemon_movimiento_forma
values (70, 79, 20);
insert into pokemon_movimiento_forma
values (70, 126, 21);
insert into pokemon_movimiento_forma
values (70, 128, 22);
insert into pokemon_movimiento_forma
values (70, 94, 31);
insert into pokemon_movimiento_forma
values (70, 72, 32);
insert into pokemon_movimiento_forma
values (70, 143, 33);
insert into pokemon_movimiento_forma
values (70, 118, 34);
insert into pokemon_movimiento_forma
values (70, 135, 44);
insert into pokemon_movimiento_forma
values (70, 114, 50);
insert into pokemon_movimiento_forma
values (70, 64, 51);

insert into pokemon_movimiento_forma
values (71, 129, 56);
insert into pokemon_movimiento_forma
values (71, 127, 56);
insert into pokemon_movimiento_forma
values (71, 152, 56);
insert into pokemon_movimiento_forma
values (71, 124, 56);
insert into pokemon_movimiento_forma
values (71, 107, 58);
insert into pokemon_movimiento_forma
values (71, 157, 73);
insert into pokemon_movimiento_forma
values (71, 129, 106);
insert into pokemon_movimiento_forma
values (71, 2, 3);
insert into pokemon_movimiento_forma
values (71, 159, 6);
insert into pokemon_movimiento_forma
values (71, 82, 8);
insert into pokemon_movimiento_forma
values (71, 66, 9);
insert into pokemon_movimiento_forma
values (71, 73, 10);
insert into pokemon_movimiento_forma
values (71, 88, 15);
insert into pokemon_movimiento_forma
values (71, 79, 20);
insert into pokemon_movimiento_forma
values (71, 126, 21);
insert into pokemon_movimiento_forma
values (71, 128, 22);
insert into pokemon_movimiento_forma
values (71, 94, 31);
insert into pokemon_movimiento_forma
values (71, 72, 32);
insert into pokemon_movimiento_forma
values (71, 143, 33);
insert into pokemon_movimiento_forma
values (71, 118, 34);
insert into pokemon_movimiento_forma
values (71, 135, 44);
insert into pokemon_movimiento_forma
values (71, 114, 50);

insert into pokemon_movimiento_forma
values (72, 152, 56);
insert into pokemon_movimiento_forma
values (72, 113, 57);
insert into pokemon_movimiento_forma
values (72, 107, 58);
insert into pokemon_movimiento_forma
values (72, 155, 106);
insert into pokemon_movimiento_forma
values (72, 7, 64);
insert into pokemon_movimiento_forma
values (72, 167, 90);
insert into pokemon_movimiento_forma
values (72, 132, 75);
insert into pokemon_movimiento_forma
values (72, 60, 96);
insert into pokemon_movimiento_forma
values (72, 5, 63);
insert into pokemon_movimiento_forma
values (72, 2, 3);
insert into pokemon_movimiento_forma
values (72, 159, 6);
insert into pokemon_movimiento_forma
values (72, 66, 9);
insert into pokemon_movimiento_forma
values (72, 73, 10);
insert into pokemon_movimiento_forma
values (72, 8, 11);
insert into pokemon_movimiento_forma
values (72, 7, 12);
insert into pokemon_movimiento_forma
values (72, 35, 13);
insert into pokemon_movimiento_forma
values (72, 36, 14);
insert into pokemon_movimiento_forma
values (72, 79, 20);
insert into pokemon_movimiento_forma
values (72, 126, 21);
insert into pokemon_movimiento_forma
values (72, 94, 31);
insert into pokemon_movimiento_forma
values (72, 72, 32);
insert into pokemon_movimiento_forma
values (72, 118, 34);
insert into pokemon_movimiento_forma
values (72, 143, 33);
insert into pokemon_movimiento_forma
values (72, 58, 40);
insert into pokemon_movimiento_forma
values (72, 135, 44);
insert into pokemon_movimiento_forma
values (72, 114, 50);
insert into pokemon_movimiento_forma
values (72, 64, 51);
insert into pokemon_movimiento_forma
values (72, 10, 53);

insert into pokemon_movimiento_forma
values (73, 152, 56);
insert into pokemon_movimiento_forma
values (73, 113, 56);
insert into pokemon_movimiento_forma
values (73, 107, 56);
insert into pokemon_movimiento_forma
values (73, 113, 57);
insert into pokemon_movimiento_forma
values (73, 107, 58);
insert into pokemon_movimiento_forma
values (73, 155, 106);
insert into pokemon_movimiento_forma
values (73, 7, 64);
insert into pokemon_movimiento_forma
values (73, 167, 60);
insert into pokemon_movimiento_forma
values (73, 132, 81);
insert into pokemon_movimiento_forma
values (73, 60, 69);
insert into pokemon_movimiento_forma
values (73, 5, 102);
insert into pokemon_movimiento_forma
values (73, 2, 3);
insert into pokemon_movimiento_forma
values (73, 159, 6);
insert into pokemon_movimiento_forma
values (73, 66, 9);
insert into pokemon_movimiento_forma
values (73, 73, 10);
insert into pokemon_movimiento_forma
values (73, 8, 11);
insert into pokemon_movimiento_forma
values (73, 7, 12);
insert into pokemon_movimiento_forma
values (73, 35, 13);
insert into pokemon_movimiento_forma
values (73, 36, 14);
insert into pokemon_movimiento_forma
values (73, 88, 15);
insert into pokemon_movimiento_forma
values (73, 79, 20);
insert into pokemon_movimiento_forma
values (73, 126, 21);
insert into pokemon_movimiento_forma
values (73, 94, 31);
insert into pokemon_movimiento_forma
values (73, 72, 32);
insert into pokemon_movimiento_forma
values (73, 118, 34);
insert into pokemon_movimiento_forma
values (73, 143, 33);
insert into pokemon_movimiento_forma
values (73, 58, 40);
insert into pokemon_movimiento_forma
values (73, 135, 44);
insert into pokemon_movimiento_forma
values (73, 114, 50);
insert into pokemon_movimiento_forma
values (73, 64, 51);
insert into pokemon_movimiento_forma
values (73, 10, 53);

insert into pokemon_movimiento_forma
values (74, 1, 56);
insert into pokemon_movimiento_forma
values (74, 109, 108);
insert into pokemon_movimiento_forma
values (74, 146, 87);
insert into pokemon_movimiento_forma
values (74, 54, 89);
insert into pokemon_movimiento_forma
values (74, 77, 90);
insert into pokemon_movimiento_forma
values (74, 151, 82);
insert into pokemon_movimiento_forma
values (74, 75, 78);
insert into pokemon_movimiento_forma
values (74, 92, 1);
insert into pokemon_movimiento_forma
values (74, 159, 6);
insert into pokemon_movimiento_forma
values (74, 82, 8);
insert into pokemon_movimiento_forma
values (74, 66, 9);
insert into pokemon_movimiento_forma
values (74, 73, 10);
insert into pokemon_movimiento_forma
values (74, 44, 17);
insert into pokemon_movimiento_forma
values (74, 37, 18);
insert into pokemon_movimiento_forma
values (74, 39, 19);
insert into pokemon_movimiento_forma
values (74, 79, 20);
insert into pokemon_movimiento_forma
values (74, 151, 26);
insert into pokemon_movimiento_forma
values (74, 148, 27);
insert into pokemon_movimiento_forma
values (74, 147, 28);
insert into pokemon_movimiento_forma
values (74, 94, 31);
insert into pokemon_movimiento_forma
values (74, 72, 32);
insert into pokemon_movimiento_forma
values (74, 118, 26);
insert into pokemon_movimiento_forma
values (74, 93, 35);
insert into pokemon_movimiento_forma
values (74, 54, 36);
insert into pokemon_movimiento_forma
values (74, 29, 38);
insert into pokemon_movimiento_forma
values (74, 135, 44);
insert into pokemon_movimiento_forma
values (74, 75, 47);
insert into pokemon_movimiento_forma
values (74, 145, 48);
insert into pokemon_movimiento_forma
values (74, 114, 50);
insert into pokemon_movimiento_forma
values (74, 78, 54);

insert into pokemon_movimiento_forma
values (75, 1, 56);
insert into pokemon_movimiento_forma
values (75, 109, 56);
insert into pokemon_movimiento_forma
values (75, 146, 56);
insert into pokemon_movimiento_forma
values (75, 109, 108);
insert into pokemon_movimiento_forma
values (75, 146, 87);
insert into pokemon_movimiento_forma
values (75, 54, 89);
insert into pokemon_movimiento_forma
values (75, 77, 100);
insert into pokemon_movimiento_forma
values (75, 151, 78);
insert into pokemon_movimiento_forma
values (75, 75, 69);
insert into pokemon_movimiento_forma
values (75, 92, 1);
insert into pokemon_movimiento_forma
values (75, 159, 6);
insert into pokemon_movimiento_forma
values (75, 82, 8);
insert into pokemon_movimiento_forma
values (75, 66, 9);
insert into pokemon_movimiento_forma
values (75, 73, 10);
insert into pokemon_movimiento_forma
values (75, 4, 17);
insert into pokemon_movimiento_forma
values (75, 37, 18);
insert into pokemon_movimiento_forma
values (75, 39, 19);
insert into pokemon_movimiento_forma
values (75, 79, 20);
insert into pokemon_movimiento_forma
values (75, 151, 26);
insert into pokemon_movimiento_forma
values (75, 148, 27);
insert into pokemon_movimiento_forma
values (75, 147, 28);
insert into pokemon_movimiento_forma
values (75, 94, 31);
insert into pokemon_movimiento_forma
values (75, 72, 32);
insert into pokemon_movimiento_forma
values (75, 118, 26);
insert into pokemon_movimiento_forma
values (75, 93, 35);
insert into pokemon_movimiento_forma
values (75, 54, 36);
insert into pokemon_movimiento_forma
values (75, 29, 38);
insert into pokemon_movimiento_forma
values (75, 135, 44);
insert into pokemon_movimiento_forma
values (75, 75, 47);
insert into pokemon_movimiento_forma
values (75, 145, 48);
insert into pokemon_movimiento_forma
values (75, 114, 50);
insert into pokemon_movimiento_forma
values (75, 78, 54);

insert into pokemon_movimiento_forma
values (76, 1, 56);
insert into pokemon_movimiento_forma
values (76, 109, 56);
insert into pokemon_movimiento_forma
values (76, 146, 56);
insert into pokemon_movimiento_forma
values (76, 109, 108);
insert into pokemon_movimiento_forma
values (76, 146, 87);
insert into pokemon_movimiento_forma
values (76, 54, 89);
insert into pokemon_movimiento_forma
values (76, 77, 100);
insert into pokemon_movimiento_forma
values (76, 151, 78);
insert into pokemon_movimiento_forma
values (76, 75, 69);
insert into pokemon_movimiento_forma
values (76, 92, 1);
insert into pokemon_movimiento_forma
values (76, 159, 6);
insert into pokemon_movimiento_forma
values (76, 82, 8);
insert into pokemon_movimiento_forma
values (76, 66, 9);
insert into pokemon_movimiento_forma
values (76, 73, 10);
insert into pokemon_movimiento_forma
values (76, 88, 15);
insert into pokemon_movimiento_forma
values (76, 44, 17);
insert into pokemon_movimiento_forma
values (76, 37, 18);
insert into pokemon_movimiento_forma
values (76, 39, 19);
insert into pokemon_movimiento_forma
values (76, 79, 20);
insert into pokemon_movimiento_forma
values (76, 151, 26);
insert into pokemon_movimiento_forma
values (76, 148, 27);
insert into pokemon_movimiento_forma
values (76, 147, 28);
insert into pokemon_movimiento_forma
values (76, 94, 31);
insert into pokemon_movimiento_forma
values (76, 72, 32);
insert into pokemon_movimiento_forma
values (76, 118, 26);
insert into pokemon_movimiento_forma
values (76, 93, 35);
insert into pokemon_movimiento_forma
values (76, 54, 36);
insert into pokemon_movimiento_forma
values (76, 29, 38);
insert into pokemon_movimiento_forma
values (76, 135, 44);
insert into pokemon_movimiento_forma
values (76, 75, 47);
insert into pokemon_movimiento_forma
values (76, 145, 48);
insert into pokemon_movimiento_forma
values (76, 114, 50);
insert into pokemon_movimiento_forma
values (76, 78, 54);

insert into pokemon_movimiento_forma
values (77, 26, 56);
insert into pokemon_movimiento_forma
values (77, 89, 65);
insert into pokemon_movimiento_forma
values (77, 98, 91);
insert into pokemon_movimiento_forma
values (77, 85, 81);
insert into pokemon_movimiento_forma
values (77, 27, 83);
insert into pokemon_movimiento_forma
values (77, 66, 69);
insert into pokemon_movimiento_forma
values (77, 130, 63);
insert into pokemon_movimiento_forma
values (77, 159, 6);
insert into pokemon_movimiento_forma
values (77, 97, 7);
insert into pokemon_movimiento_forma
values (77, 82, 8);
insert into pokemon_movimiento_forma
values (77, 66, 9);
insert into pokemon_movimiento_forma
values (77, 73, 10);
insert into pokemon_movimiento_forma
values (77, 79, 20);
insert into pokemon_movimiento_forma
values (77, 94, 31);
insert into pokemon_movimiento_forma
values (77, 72, 32);
insert into pokemon_movimiento_forma
values (77, 143, 33);
insert into pokemon_movimiento_forma
values (77, 118, 26);
insert into pokemon_movimiento_forma
values (77, 29, 38);
insert into pokemon_movimiento_forma
values (77, 103, 39);
insert into pokemon_movimiento_forma
values (77, 58, 40);
insert into pokemon_movimiento_forma
values (77, 135, 44);
insert into pokemon_movimiento_forma
values (77, 114, 50);

insert into pokemon_movimiento_forma
values (78, 26, 56);
insert into pokemon_movimiento_forma
values (78, 85, 56);
insert into pokemon_movimiento_forma
values (78, 89, 56);
insert into pokemon_movimiento_forma
values (78, 98, 56);
insert into pokemon_movimiento_forma
values (78, 89, 65);
insert into pokemon_movimiento_forma
values (78, 98, 91);
insert into pokemon_movimiento_forma
values (78, 85, 81);
insert into pokemon_movimiento_forma
values (78, 27, 83);
insert into pokemon_movimiento_forma
values (78, 66, 84);
insert into pokemon_movimiento_forma
values (78, 130, 70);
insert into pokemon_movimiento_forma
values (78, 159, 6);
insert into pokemon_movimiento_forma
values (78, 97, 7);
insert into pokemon_movimiento_forma
values (78, 82, 8);
insert into pokemon_movimiento_forma
values (78, 66, 9);
insert into pokemon_movimiento_forma
values (78, 73, 10);
insert into pokemon_movimiento_forma
values (78, 88, 15);
insert into pokemon_movimiento_forma
values (78, 79, 20);
insert into pokemon_movimiento_forma
values (78, 94, 31);
insert into pokemon_movimiento_forma
values (78, 72, 32);
insert into pokemon_movimiento_forma
values (78, 143, 33);
insert into pokemon_movimiento_forma
values (78, 118, 26);
insert into pokemon_movimiento_forma
values (78, 29, 38);
insert into pokemon_movimiento_forma
values (78, 103, 39);
insert into pokemon_movimiento_forma
values (78, 58, 40);
insert into pokemon_movimiento_forma
values (78, 135, 44);
insert into pokemon_movimiento_forma
values (78, 114, 50);

insert into pokemon_movimiento_forma
values (79, 134, 56);
insert into pokemon_movimiento_forma
values (79, 48, 106);
insert into pokemon_movimiento_forma
values (79, 81, 64);
insert into pokemon_movimiento_forma
values (79, 85, 60);
insert into pokemon_movimiento_forma
values (79, 7, 75);
insert into pokemon_movimiento_forma
values (79, 131, 96);
insert into pokemon_movimiento_forma
values (79, 142, 63);
insert into pokemon_movimiento_forma
values (79, 159, 6);
insert into pokemon_movimiento_forma
values (79, 82, 8);
insert into pokemon_movimiento_forma
values (79, 66, 9);
insert into pokemon_movimiento_forma
values (79, 73, 10);
insert into pokemon_movimiento_forma
values (79, 8, 11);
insert into pokemon_movimiento_forma
values (79, 7, 12);
insert into pokemon_movimiento_forma
values (79, 35, 13);
insert into pokemon_movimiento_forma
values (79, 36, 14);
insert into pokemon_movimiento_forma
values (79, 71, 16);
insert into pokemon_movimiento_forma
values (79, 79, 20);
insert into pokemon_movimiento_forma
values (79, 151, 26);
insert into pokemon_movimiento_forma
values (79, 148, 27);
insert into pokemon_movimiento_forma
values (79, 147, 28);
insert into pokemon_movimiento_forma
values (79, 142, 29);
insert into pokemon_movimiento_forma
values (79, 144, 30);
insert into pokemon_movimiento_forma
values (79, 94, 31);
insert into pokemon_movimiento_forma
values (79, 72, 32);
insert into pokemon_movimiento_forma
values (79, 143, 33);
insert into pokemon_movimiento_forma
values (79, 118, 34);
insert into pokemon_movimiento_forma
values (79, 29, 38);
insert into pokemon_movimiento_forma
values (79, 58, 40);
insert into pokemon_movimiento_forma
values (79, 135, 44);
insert into pokemon_movimiento_forma
values (79, 18, 45);
insert into pokemon_movimiento_forma
values (79, 140, 46);
insert into pokemon_movimiento_forma
values (79, 117, 49);
insert into pokemon_movimiento_forma
values (79, 114, 50);
insert into pokemon_movimiento_forma
values (79, 10, 53);
insert into pokemon_movimiento_forma
values (79, 78, 54);
insert into pokemon_movimiento_forma
values (79, 69, 55);

insert into pokemon_movimiento_forma
values (80, 134, 56);
insert into pokemon_movimiento_forma
values (80, 48, 56);
insert into pokemon_movimiento_forma
values (80, 81, 56);
insert into pokemon_movimiento_forma
values (80, 81, 64);
insert into pokemon_movimiento_forma
values (80, 48, 106);
insert into pokemon_movimiento_forma
values (80, 85, 60);
insert into pokemon_movimiento_forma
values (80, 7, 75);
insert into pokemon_movimiento_forma
values (80, 9, 103);
insert into pokemon_movimiento_forma
values (80, 131, 95);
insert into pokemon_movimiento_forma
values (80, 142, 70);
insert into pokemon_movimiento_forma
values (80, 92, 1);
insert into pokemon_movimiento_forma
values (80, 91, 5);
insert into pokemon_movimiento_forma
values (80, 159, 6);
insert into pokemon_movimiento_forma
values (80, 82, 8);
insert into pokemon_movimiento_forma
values (80, 66, 9);
insert into pokemon_movimiento_forma
values (80, 73, 10);
insert into pokemon_movimiento_forma
values (80, 8, 11);
insert into pokemon_movimiento_forma
values (80, 7, 12);
insert into pokemon_movimiento_forma
values (80, 35, 13);
insert into pokemon_movimiento_forma
values (80, 36, 14);
insert into pokemon_movimiento_forma
values (80, 88, 15);
insert into pokemon_movimiento_forma
values (80, 71, 16);
insert into pokemon_movimiento_forma
values (80, 44, 17);
insert into pokemon_movimiento_forma
values (80, 37, 18);
insert into pokemon_movimiento_forma
values (80, 39, 19);
insert into pokemon_movimiento_forma
values (80, 79, 20);
insert into pokemon_movimiento_forma
values (80, 151, 26);
insert into pokemon_movimiento_forma
values (80, 148, 27);
insert into pokemon_movimiento_forma
values (80, 147, 28);
insert into pokemon_movimiento_forma
values (80, 142, 29);
insert into pokemon_movimiento_forma
values (80, 144, 30);
insert into pokemon_movimiento_forma
values (80, 94, 31);
insert into pokemon_movimiento_forma
values (80, 72, 32);
insert into pokemon_movimiento_forma
values (80, 143, 33);
insert into pokemon_movimiento_forma
values (80, 118, 34);
insert into pokemon_movimiento_forma
values (80, 29, 38);
insert into pokemon_movimiento_forma
values (80, 58, 40);
insert into pokemon_movimiento_forma
values (80, 135, 44);
insert into pokemon_movimiento_forma
values (80, 18, 45);
insert into pokemon_movimiento_forma
values (80, 140, 46);
insert into pokemon_movimiento_forma
values (80, 117, 49);
insert into pokemon_movimiento_forma
values (80, 114, 50);
insert into pokemon_movimiento_forma
values (80, 10, 53);
insert into pokemon_movimiento_forma
values (80, 78, 54);
insert into pokemon_movimiento_forma
values (80, 69, 55);

insert into pokemon_movimiento_forma
values (81, 1, 56);
insert into pokemon_movimiento_forma
values (81, 57, 89);
insert into pokemon_movimiento_forma
values (81, 17, 92);
insert into pokemon_movimiento_forma
values (81, 113, 100);
insert into pokemon_movimiento_forma
values (81, 18, 81);
insert into pokemon_movimiento_forma
values (81, 103, 62);
insert into pokemon_movimiento_forma
values (81, 60, 84);
insert into pokemon_movimiento_forma
values (81, 159, 6);
insert into pokemon_movimiento_forma
values (81, 66, 9);
insert into pokemon_movimiento_forma
values (81, 73, 10);
insert into pokemon_movimiento_forma
values (81, 79, 20);
insert into pokemon_movimiento_forma
values (81, 20, 24);
insert into pokemon_movimiento_forma
values (81, 21, 25);
insert into pokemon_movimiento_forma
values (81, 144, 30);
insert into pokemon_movimiento_forma
values (81, 94, 31);
insert into pokemon_movimiento_forma
values (81, 72, 32);
insert into pokemon_movimiento_forma
values (81, 143, 33);
insert into pokemon_movimiento_forma
values (81, 118, 34);
insert into pokemon_movimiento_forma
values (81, 103, 39);
insert into pokemon_movimiento_forma
values (81, 135, 44);
insert into pokemon_movimiento_forma
values (81, 18, 45);
insert into pokemon_movimiento_forma
values (81, 114, 50);
insert into pokemon_movimiento_forma
values (81, 69, 55);

insert into pokemon_movimiento_forma
values (82, 1, 56);
insert into pokemon_movimiento_forma
values (82, 57, 56);
insert into pokemon_movimiento_forma
values (82, 17, 56);
insert into pokemon_movimiento_forma
values (82, 57, 89);
insert into pokemon_movimiento_forma
values (82, 17, 92);
insert into pokemon_movimiento_forma
values (82, 113, 100);
insert into pokemon_movimiento_forma
values (82, 18, 66);
insert into pokemon_movimiento_forma
values (82, 103, 67);
insert into pokemon_movimiento_forma
values (82, 60, 68);
insert into pokemon_movimiento_forma
values (82, 159, 6);
insert into pokemon_movimiento_forma
values (82, 66, 9);
insert into pokemon_movimiento_forma
values (82, 73, 10);
insert into pokemon_movimiento_forma
values (82, 88, 15);
insert into pokemon_movimiento_forma
values (82, 79, 20);
insert into pokemon_movimiento_forma
values (82, 20, 24);
insert into pokemon_movimiento_forma
values (82, 21, 25);
insert into pokemon_movimiento_forma
values (82, 144, 30);
insert into pokemon_movimiento_forma
values (82, 94, 31);
insert into pokemon_movimiento_forma
values (82, 72, 32);
insert into pokemon_movimiento_forma
values (82, 143, 33);
insert into pokemon_movimiento_forma
values (82, 118, 34);
insert into pokemon_movimiento_forma
values (82, 103, 39);
insert into pokemon_movimiento_forma
values (82, 135, 44);
insert into pokemon_movimiento_forma
values (82, 18, 45);
insert into pokemon_movimiento_forma
values (82, 114, 50);
insert into pokemon_movimiento_forma
values (82, 69, 55);

insert into pokemon_movimiento_forma
values (83, 165, 56);
insert into pokemon_movimiento_forma
values (83, 51, 56);
insert into pokemon_movimiento_forma
values (83, 90, 57);
insert into pokemon_movimiento_forma
values (83, 52, 73);
insert into pokemon_movimiento_forma
values (83, 2, 99);
insert into pokemon_movimiento_forma
values (83, 130, 82);
insert into pokemon_movimiento_forma
values (83, 65, 83);
insert into pokemon_movimiento_forma
values (83, 119, 2);
insert into pokemon_movimiento_forma
values (83, 2, 3);
insert into pokemon_movimiento_forma
values (83, 106, 4);
insert into pokemon_movimiento_forma
values (83, 159, 6);
insert into pokemon_movimiento_forma
values (83, 82, 8);
insert into pokemon_movimiento_forma
values (83, 66, 9);
insert into pokemon_movimiento_forma
values (83, 73, 10);
insert into pokemon_movimiento_forma
values (83, 79, 20);
insert into pokemon_movimiento_forma
values (83, 94, 31);
insert into pokemon_movimiento_forma
values (83, 72, 32);
insert into pokemon_movimiento_forma
values (83, 143, 33);
insert into pokemon_movimiento_forma
values (83, 118, 34);
insert into pokemon_movimiento_forma
values (83, 103, 39);
insert into pokemon_movimiento_forma
values (83, 58, 40);
insert into pokemon_movimiento_forma
values (83, 135, 44);
insert into pokemon_movimiento_forma
values (83, 114, 50);
insert into pokemon_movimiento_forma
values (83, 64, 51);
insert into pokemon_movimiento_forma
values (83, 166, 52);

insert into pokemon_movimiento_forma
values (84, 165, 56);
insert into pokemon_movimiento_forma
values (84, 85, 59);
insert into pokemon_movimiento_forma
values (84, 52, 74);
insert into pokemon_movimiento_forma
values (84, 164, 65);
insert into pokemon_movimiento_forma
values (84, 79, 78);
insert into pokemon_movimiento_forma
values (84, 117, 96);
insert into pokemon_movimiento_forma
values (84, 130, 95);
insert into pokemon_movimiento_forma
values (84, 106, 4);
insert into pokemon_movimiento_forma
values (84, 159, 6);
insert into pokemon_movimiento_forma
values (84, 82, 8);
insert into pokemon_movimiento_forma
values (84, 66, 9);
insert into pokemon_movimiento_forma
values (84, 73, 10);
insert into pokemon_movimiento_forma
values (84, 79, 20);
insert into pokemon_movimiento_forma
values (84, 94, 31);
insert into pokemon_movimiento_forma
values (84, 72, 32);
insert into pokemon_movimiento_forma
values (84, 143, 33);
insert into pokemon_movimiento_forma
values (84, 118, 34);
insert into pokemon_movimiento_forma
values (84, 58, 40);
insert into pokemon_movimiento_forma
values (84, 160, 43);
insert into pokemon_movimiento_forma
values (84, 135, 44);
insert into pokemon_movimiento_forma
values (84, 117, 49);
insert into pokemon_movimiento_forma
values (84, 114, 50);
insert into pokemon_movimiento_forma
values (84, 166, 52);

insert into pokemon_movimiento_forma
values (85, 165, 56);
insert into pokemon_movimiento_forma
values (85, 85, 56);
insert into pokemon_movimiento_forma
values (85, 52, 56);
insert into pokemon_movimiento_forma
values (85, 85, 59);
insert into pokemon_movimiento_forma
values (85, 52, 74);
insert into pokemon_movimiento_forma
values (85, 164, 65);
insert into pokemon_movimiento_forma
values (85, 79, 83);
insert into pokemon_movimiento_forma
values (85, 117, 107);
insert into pokemon_movimiento_forma
values (85, 130, 104);
insert into pokemon_movimiento_forma
values (85, 106, 4);
insert into pokemon_movimiento_forma
values (85, 159, 6);
insert into pokemon_movimiento_forma
values (85, 82, 8);
insert into pokemon_movimiento_forma
values (85, 66, 9);
insert into pokemon_movimiento_forma
values (85, 73, 10);
insert into pokemon_movimiento_forma
values (85, 88, 15);
insert into pokemon_movimiento_forma
values (85, 79, 20);
insert into pokemon_movimiento_forma
values (85, 94, 31);
insert into pokemon_movimiento_forma
values (85, 72, 32);
insert into pokemon_movimiento_forma
values (85, 143, 33);
insert into pokemon_movimiento_forma
values (85, 118, 34);
insert into pokemon_movimiento_forma
values (85, 58, 40);
insert into pokemon_movimiento_forma
values (85, 160, 43);
insert into pokemon_movimiento_forma
values (85, 135, 44);
insert into pokemon_movimiento_forma
values (85, 117, 49);
insert into pokemon_movimiento_forma
values (85, 114, 50);
insert into pokemon_movimiento_forma
values (85, 166, 52);

insert into pokemon_movimiento_forma
values (86, 81, 56);
insert into pokemon_movimiento_forma
values (86, 85, 65);
insert into pokemon_movimiento_forma
values (86, 34, 81);
insert into pokemon_movimiento_forma
values (86, 135, 96);
insert into pokemon_movimiento_forma
values (86, 66, 107);
insert into pokemon_movimiento_forma
values (86, 35, 102);
insert into pokemon_movimiento_forma
values (86, 159, 6);
insert into pokemon_movimiento_forma
values (86, 97, 7);
insert into pokemon_movimiento_forma
values (86, 82, 8);
insert into pokemon_movimiento_forma
values (86, 66, 9);
insert into pokemon_movimiento_forma
values (86, 73, 10);
insert into pokemon_movimiento_forma
values (86, 8, 11);
insert into pokemon_movimiento_forma
values (86, 7, 12);
insert into pokemon_movimiento_forma
values (86, 35, 13);
insert into pokemon_movimiento_forma
values (86, 36, 14);
insert into pokemon_movimiento_forma
values (86, 71, 16);
insert into pokemon_movimiento_forma
values (86, 79, 20);
insert into pokemon_movimiento_forma
values (86, 94, 31);
insert into pokemon_movimiento_forma
values (86, 72, 32);
insert into pokemon_movimiento_forma
values (86, 118, 34);
insert into pokemon_movimiento_forma
values (86, 58, 40);
insert into pokemon_movimiento_forma
values (86, 135, 44);
insert into pokemon_movimiento_forma
values (86, 114, 50);
insert into pokemon_movimiento_forma
values (86, 10, 53);
insert into pokemon_movimiento_forma
values (86, 78, 54);

insert into pokemon_movimiento_forma
values (87, 81, 56);
insert into pokemon_movimiento_forma
values (87, 85, 56);
insert into pokemon_movimiento_forma
values (87, 34, 56);
insert into pokemon_movimiento_forma
values (87, 85, 65);
insert into pokemon_movimiento_forma
values (87, 34, 81);
insert into pokemon_movimiento_forma
values (87, 135, 95);
insert into pokemon_movimiento_forma
values (87, 66, 102);
insert into pokemon_movimiento_forma
values (87, 35, 77);
insert into pokemon_movimiento_forma
values (87, 159, 6);
insert into pokemon_movimiento_forma
values (87, 97, 7);
insert into pokemon_movimiento_forma
values (87, 82, 8);
insert into pokemon_movimiento_forma
values (87, 66, 9);
insert into pokemon_movimiento_forma
values (87, 73, 10);
insert into pokemon_movimiento_forma
values (87, 8, 11);
insert into pokemon_movimiento_forma
values (87, 7, 12);
insert into pokemon_movimiento_forma
values (87, 35, 13);
insert into pokemon_movimiento_forma
values (87, 88, 15);
insert into pokemon_movimiento_forma
values (87, 36, 14);
insert into pokemon_movimiento_forma
values (87, 71, 16);
insert into pokemon_movimiento_forma
values (87, 79, 20);
insert into pokemon_movimiento_forma
values (87, 94, 31);
insert into pokemon_movimiento_forma
values (87, 72, 32);
insert into pokemon_movimiento_forma
values (87, 118, 34);
insert into pokemon_movimiento_forma
values (87, 58, 40);
insert into pokemon_movimiento_forma
values (87, 135, 44);
insert into pokemon_movimiento_forma
values (87, 114, 50);
insert into pokemon_movimiento_forma
values (87, 10, 53);
insert into pokemon_movimiento_forma
values (87, 78, 54);

insert into pokemon_movimiento_forma
values (88, 70, 56);
insert into pokemon_movimiento_forma
values (88, 48, 56);
insert into pokemon_movimiento_forma
values (88, 154, 65);
insert into pokemon_movimiento_forma
values (88, 105, 75);
insert into pokemon_movimiento_forma
values (88, 158, 103);
insert into pokemon_movimiento_forma
values (88, 77, 76);
insert into pokemon_movimiento_forma
values (88, 60, 63);
insert into pokemon_movimiento_forma
values (88, 153, 70);
insert into pokemon_movimiento_forma
values (88, 159, 6);
insert into pokemon_movimiento_forma
values (88, 82, 8);
insert into pokemon_movimiento_forma
values (88, 79, 20);
insert into pokemon_movimiento_forma
values (88, 126, 21);
insert into pokemon_movimiento_forma
values (88, 20, 24);
insert into pokemon_movimiento_forma
values (88, 21, 25);
insert into pokemon_movimiento_forma
values (88, 94, 31);
insert into pokemon_movimiento_forma
values (88, 72, 32);
insert into pokemon_movimiento_forma
values (88, 118, 34);
insert into pokemon_movimiento_forma
values (88, 54, 36);
insert into pokemon_movimiento_forma
values (88, 29, 38);
insert into pokemon_movimiento_forma
values (88, 135, 44);
insert into pokemon_movimiento_forma
values (88, 75, 47);
insert into pokemon_movimiento_forma
values (88, 114, 50);

insert into pokemon_movimiento_forma
values (89, 70, 56);
insert into pokemon_movimiento_forma
values (89, 154, 56);
insert into pokemon_movimiento_forma
values (89, 154, 65);
insert into pokemon_movimiento_forma
values (89, 48, 56);
insert into pokemon_movimiento_forma
values (89, 105, 75);
insert into pokemon_movimiento_forma
values (89, 158, 103);
insert into pokemon_movimiento_forma
values (89, 77, 107);
insert into pokemon_movimiento_forma
values (89, 60, 109);
insert into pokemon_movimiento_forma
values (89, 153, 110);
insert into pokemon_movimiento_forma
values (89, 88, 15);
insert into pokemon_movimiento_forma
values (89, 159, 6);
insert into pokemon_movimiento_forma
values (89, 82, 8);
insert into pokemon_movimiento_forma
values (89, 79, 20);
insert into pokemon_movimiento_forma
values (89, 126, 21);
insert into pokemon_movimiento_forma
values (89, 20, 24);
insert into pokemon_movimiento_forma
values (89, 21, 25);
insert into pokemon_movimiento_forma
values (89, 94, 31);
insert into pokemon_movimiento_forma
values (89, 72, 32);
insert into pokemon_movimiento_forma
values (89, 118, 34);
insert into pokemon_movimiento_forma
values (89, 54, 36);
insert into pokemon_movimiento_forma
values (89, 29, 38);
insert into pokemon_movimiento_forma
values (89, 135, 44);
insert into pokemon_movimiento_forma
values (89, 75, 47);
insert into pokemon_movimiento_forma
values (89, 114, 50);

insert into pokemon_movimiento_forma
values (90, 1, 56);
insert into pokemon_movimiento_forma
values (90, 9, 56);
insert into pokemon_movimiento_forma
values (90, 113, 106);
insert into pokemon_movimiento_forma
values (90, 11, 99);
insert into pokemon_movimiento_forma
values (90, 34, 65);
insert into pokemon_movimiento_forma
values (90, 90, 83);
insert into pokemon_movimiento_forma
values (90, 35, 102);
insert into pokemon_movimiento_forma
values (90, 159, 6);
insert into pokemon_movimiento_forma
values (90, 66, 9);
insert into pokemon_movimiento_forma
values (90, 73, 10);
insert into pokemon_movimiento_forma
values (90, 8, 11);
insert into pokemon_movimiento_forma
values (90, 7, 12);
insert into pokemon_movimiento_forma
values (90, 35, 13);
insert into pokemon_movimiento_forma
values (90, 36, 14);
insert into pokemon_movimiento_forma
values (90, 79, 20);
insert into pokemon_movimiento_forma
values (90, 144, 30);
insert into pokemon_movimiento_forma
values (90, 94, 31);
insert into pokemon_movimiento_forma
values (90, 72, 32);
insert into pokemon_movimiento_forma
values (90, 143, 33);
insert into pokemon_movimiento_forma
values (90, 118, 34);
insert into pokemon_movimiento_forma
values (90, 54, 36);
insert into pokemon_movimiento_forma
values (90, 103, 39);
insert into pokemon_movimiento_forma
values (90, 135, 44);
insert into pokemon_movimiento_forma
values (90, 75, 47);
insert into pokemon_movimiento_forma
values (90, 117, 49);
insert into pokemon_movimiento_forma
values (90, 114, 50);
insert into pokemon_movimiento_forma
values (90, 10, 53);

insert into pokemon_movimiento_forma
values (91, 9, 56);
insert into pokemon_movimiento_forma
values (91, 34, 56);
insert into pokemon_movimiento_forma
values (91, 113, 56);
insert into pokemon_movimiento_forma
values (91, 11, 56);
insert into pokemon_movimiento_forma
values (91, 61, 102);
insert into pokemon_movimiento_forma
values (91, 159, 6);
insert into pokemon_movimiento_forma
values (91, 66, 9);
insert into pokemon_movimiento_forma
values (91, 73, 10);
insert into pokemon_movimiento_forma
values (91, 8, 11);
insert into pokemon_movimiento_forma
values (91, 7, 12);
insert into pokemon_movimiento_forma
values (91, 35, 13);
insert into pokemon_movimiento_forma
values (91, 36, 14);
insert into pokemon_movimiento_forma
values (91, 88, 15);
insert into pokemon_movimiento_forma
values (91, 79, 20);
insert into pokemon_movimiento_forma
values (91, 144, 30);
insert into pokemon_movimiento_forma
values (91, 94, 31);
insert into pokemon_movimiento_forma
values (91, 72, 32);
insert into pokemon_movimiento_forma
values (91, 143, 33);
insert into pokemon_movimiento_forma
values (91, 118, 34);
insert into pokemon_movimiento_forma
values (91, 54, 36);
insert into pokemon_movimiento_forma
values (91, 103, 39);
insert into pokemon_movimiento_forma
values (91, 135, 44);
insert into pokemon_movimiento_forma
values (91, 75, 47);
insert into pokemon_movimiento_forma
values (91, 117, 49);
insert into pokemon_movimiento_forma
values (91, 114, 50);
insert into pokemon_movimiento_forma
values (91, 10, 53);

insert into pokemon_movimiento_forma
values (92, 23, 56);
insert into pokemon_movimiento_forma
values (92, 24, 56);
insert into pokemon_movimiento_forma
values (92, 25, 56);
insert into pokemon_movimiento_forma
values (92, 136, 60);
insert into pokemon_movimiento_forma
values (92, 133, 81);
insert into pokemon_movimiento_forma
values (92, 159, 6);
insert into pokemon_movimiento_forma
values (92, 79, 20);
insert into pokemon_movimiento_forma
values (92, 126, 21);
insert into pokemon_movimiento_forma
values (92, 20, 24);
insert into pokemon_movimiento_forma
values (92, 21, 25);
insert into pokemon_movimiento_forma
values (92, 142, 29);
insert into pokemon_movimiento_forma
values (92, 94, 31);
insert into pokemon_movimiento_forma
values (92, 72, 32);
insert into pokemon_movimiento_forma
values (92, 118, 34);
insert into pokemon_movimiento_forma
values (92, 54, 36);
insert into pokemon_movimiento_forma
values (92, 133, 42);
insert into pokemon_movimiento_forma
values (92, 135, 44);
insert into pokemon_movimiento_forma
values (92, 140, 46);
insert into pokemon_movimiento_forma
values (92, 75, 47);
insert into pokemon_movimiento_forma
values (92, 114, 50);

insert into pokemon_movimiento_forma
values (93, 23, 56);
insert into pokemon_movimiento_forma
values (93, 24, 56);
insert into pokemon_movimiento_forma
values (93, 25, 56);
insert into pokemon_movimiento_forma
values (93, 136, 100);
insert into pokemon_movimiento_forma
values (93, 133, 66);
insert into pokemon_movimiento_forma
values (93, 159, 6);
insert into pokemon_movimiento_forma
values (93, 79, 20);
insert into pokemon_movimiento_forma
values (93, 126, 21);
insert into pokemon_movimiento_forma
values (93, 20, 24);
insert into pokemon_movimiento_forma
values (93, 21, 25);
insert into pokemon_movimiento_forma
values (93, 142, 29);
insert into pokemon_movimiento_forma
values (93, 94, 31);
insert into pokemon_movimiento_forma
values (93, 72, 32);
insert into pokemon_movimiento_forma
values (93, 118, 34);
insert into pokemon_movimiento_forma
values (93, 54, 36);
insert into pokemon_movimiento_forma
values (93, 133, 42);
insert into pokemon_movimiento_forma
values (93, 135, 44);
insert into pokemon_movimiento_forma
values (93, 140, 46);
insert into pokemon_movimiento_forma
values (93, 75, 47);
insert into pokemon_movimiento_forma
values (93, 114, 50);

insert into pokemon_movimiento_forma
values (94, 23, 56);
insert into pokemon_movimiento_forma
values (94, 24, 56);
insert into pokemon_movimiento_forma
values (94, 25, 56);
insert into pokemon_movimiento_forma
values (94, 136, 100);
insert into pokemon_movimiento_forma
values (94, 133, 66);
insert into pokemon_movimiento_forma
values (94, 92, 1);
insert into pokemon_movimiento_forma
values (94, 91, 5);
insert into pokemon_movimiento_forma
values (94, 159, 6);
insert into pokemon_movimiento_forma
values (94, 82, 8);
insert into pokemon_movimiento_forma
values (94, 66, 9);
insert into pokemon_movimiento_forma
values (94, 73, 10);
insert into pokemon_movimiento_forma
values (94, 88, 15);
insert into pokemon_movimiento_forma
values (94, 44, 17);
insert into pokemon_movimiento_forma
values (94, 37, 18);
insert into pokemon_movimiento_forma
values (94, 39, 19);
insert into pokemon_movimiento_forma
values (94, 79, 20);
insert into pokemon_movimiento_forma
values (94, 126, 21);
insert into pokemon_movimiento_forma
values (94, 20, 24);
insert into pokemon_movimiento_forma
values (94, 21, 25);
insert into pokemon_movimiento_forma
values (94, 142, 29);
insert into pokemon_movimiento_forma
values (94, 94, 31);
insert into pokemon_movimiento_forma
values (94, 72, 32);
insert into pokemon_movimiento_forma
values (94, 118, 34);
insert into pokemon_movimiento_forma
values (94, 93, 35);
insert into pokemon_movimiento_forma
values (94, 54, 36);
insert into pokemon_movimiento_forma
values (94, 58, 40);
insert into pokemon_movimiento_forma
values (94, 133, 42);
insert into pokemon_movimiento_forma
values (94, 135, 44);
insert into pokemon_movimiento_forma
values (94, 140, 46);
insert into pokemon_movimiento_forma
values (94, 75, 47);
insert into pokemon_movimiento_forma
values (94, 114, 50);
insert into pokemon_movimiento_forma
values (94, 78, 54);

insert into pokemon_movimiento_forma
values (95, 1, 56);
insert into pokemon_movimiento_forma
values (95, 60, 56);
insert into pokemon_movimiento_forma
values (95, 50, 73);
insert into pokemon_movimiento_forma
values (95, 146, 94);
insert into pokemon_movimiento_forma
values (95, 79, 92);
insert into pokemon_movimiento_forma
values (95, 100, 75);
insert into pokemon_movimiento_forma
values (95, 77, 69);
insert into pokemon_movimiento_forma
values (95, 159, 6);
insert into pokemon_movimiento_forma
values (95, 82, 8);
insert into pokemon_movimiento_forma
values (95, 66, 9);
insert into pokemon_movimiento_forma
values (95, 73, 10);
insert into pokemon_movimiento_forma
values (95, 79, 20);
insert into pokemon_movimiento_forma
values (95, 151, 26);
insert into pokemon_movimiento_forma
values (95, 148, 27);
insert into pokemon_movimiento_forma
values (95, 147, 28);
insert into pokemon_movimiento_forma
values (95, 94, 31);
insert into pokemon_movimiento_forma
values (95, 72, 32);
insert into pokemon_movimiento_forma
values (95, 118, 34);
insert into pokemon_movimiento_forma
values (95, 54, 36);
insert into pokemon_movimiento_forma
values (95, 58, 40);
insert into pokemon_movimiento_forma
values (95, 135, 44);
insert into pokemon_movimiento_forma
values (95, 75, 47);
insert into pokemon_movimiento_forma
values (95, 145, 48);
insert into pokemon_movimiento_forma
values (95, 114, 50);
insert into pokemon_movimiento_forma
values (95, 78, 54);

insert into pokemon_movimiento_forma
values (96, 70, 56);
insert into pokemon_movimiento_forma
values (96, 136, 56);
insert into pokemon_movimiento_forma
values (96, 48, 86);
insert into pokemon_movimiento_forma
values (96, 134, 88);
insert into pokemon_movimiento_forma
values (96, 81, 74);
insert into pokemon_movimiento_forma
values (96, 154, 100);
insert into pokemon_movimiento_forma
values (96, 142, 91);
insert into pokemon_movimiento_forma
values (96, 138, 103);
insert into pokemon_movimiento_forma
values (96, 92, 1);
insert into pokemon_movimiento_forma
values (96, 91, 5);
insert into pokemon_movimiento_forma
values (96, 159, 6);
insert into pokemon_movimiento_forma
values (96, 82, 8);
insert into pokemon_movimiento_forma
values (96, 66, 9);
insert into pokemon_movimiento_forma
values (96, 73, 10);
insert into pokemon_movimiento_forma
values (96, 44, 17);
insert into pokemon_movimiento_forma
values (96, 37, 18);
insert into pokemon_movimiento_forma
values (96, 39, 19);
insert into pokemon_movimiento_forma
values (96, 79, 20);
insert into pokemon_movimiento_forma
values (96, 142, 29);
insert into pokemon_movimiento_forma
values (96, 144, 30);
insert into pokemon_movimiento_forma
values (96, 94, 31);
insert into pokemon_movimiento_forma
values (96, 72, 32);
insert into pokemon_movimiento_forma
values (96, 143, 33);
insert into pokemon_movimiento_forma
values (96, 118, 34);
insert into pokemon_movimiento_forma
values (96, 93, 35);
insert into pokemon_movimiento_forma
values (96, 58, 40);
insert into pokemon_movimiento_forma
values (96, 133, 42);
insert into pokemon_movimiento_forma
values (96, 135, 44);
insert into pokemon_movimiento_forma
values (96, 18, 45);
insert into pokemon_movimiento_forma
values (96, 140, 46);
insert into pokemon_movimiento_forma
values (96, 117, 49);
insert into pokemon_movimiento_forma
values (96, 114, 50);
insert into pokemon_movimiento_forma
values (96, 69, 55);

insert into pokemon_movimiento_forma
values (97, 70, 56);
insert into pokemon_movimiento_forma
values (97, 136, 56);
insert into pokemon_movimiento_forma
values (97, 48, 56);
insert into pokemon_movimiento_forma
values (97, 134, 56);
insert into pokemon_movimiento_forma
values (97, 48, 86);
insert into pokemon_movimiento_forma
values (97, 134, 88);
insert into pokemon_movimiento_forma
values (97, 81, 74);
insert into pokemon_movimiento_forma
values (97, 154, 75);
insert into pokemon_movimiento_forma
values (97, 142, 103);
insert into pokemon_movimiento_forma
values (97, 138, 69);
insert into pokemon_movimiento_forma
values (97, 92, 1);
insert into pokemon_movimiento_forma
values (97, 91, 5);
insert into pokemon_movimiento_forma
values (97, 159, 6);
insert into pokemon_movimiento_forma
values (97, 82, 8);
insert into pokemon_movimiento_forma
values (97, 66, 9);
insert into pokemon_movimiento_forma
values (97, 73, 10);
insert into pokemon_movimiento_forma
values (97, 88, 15);
insert into pokemon_movimiento_forma
values (97, 44, 17);
insert into pokemon_movimiento_forma
values (97, 37, 18);
insert into pokemon_movimiento_forma
values (97, 39, 19);
insert into pokemon_movimiento_forma
values (97, 79, 20);
insert into pokemon_movimiento_forma
values (97, 142, 29);
insert into pokemon_movimiento_forma
values (97, 144, 30);
insert into pokemon_movimiento_forma
values (97, 94, 31);
insert into pokemon_movimiento_forma
values (97, 72, 32);
insert into pokemon_movimiento_forma
values (97, 143, 33);
insert into pokemon_movimiento_forma
values (97, 118, 34);
insert into pokemon_movimiento_forma
values (97, 93, 35);
insert into pokemon_movimiento_forma
values (97, 58, 40);
insert into pokemon_movimiento_forma
values (97, 133, 42);
insert into pokemon_movimiento_forma
values (97, 135, 44);
insert into pokemon_movimiento_forma
values (97, 18, 45);
insert into pokemon_movimiento_forma
values (97, 140, 46);
insert into pokemon_movimiento_forma
values (97, 117, 49);
insert into pokemon_movimiento_forma
values (97, 114, 50);
insert into pokemon_movimiento_forma
values (97, 69, 55);

insert into pokemon_movimiento_forma
values (98, 3, 56);
insert into pokemon_movimiento_forma
values (98, 90, 56);
insert into pokemon_movimiento_forma
values (98, 46, 59);
insert into pokemon_movimiento_forma
values (98, 86, 92);
insert into pokemon_movimiento_forma
values (98, 98, 65);
insert into pokemon_movimiento_forma
values (98, 6, 81);
insert into pokemon_movimiento_forma
values (98, 77, 96);
insert into pokemon_movimiento_forma
values (98, 2, 3);
insert into pokemon_movimiento_forma
values (98, 159, 6);
insert into pokemon_movimiento_forma
values (98, 82, 8);
insert into pokemon_movimiento_forma
values (98, 66, 9);
insert into pokemon_movimiento_forma
values (98, 73, 10);
insert into pokemon_movimiento_forma
values (98, 8, 11);
insert into pokemon_movimiento_forma
values (98, 7, 12);
insert into pokemon_movimiento_forma
values (98, 35, 13);
insert into pokemon_movimiento_forma
values (98, 36, 14);
insert into pokemon_movimiento_forma
values (98, 79, 20);
insert into pokemon_movimiento_forma
values (98, 94, 31);
insert into pokemon_movimiento_forma
values (98, 72, 32);
insert into pokemon_movimiento_forma
values (98, 118, 34);
insert into pokemon_movimiento_forma
values (98, 135, 44);
insert into pokemon_movimiento_forma
values (98, 114, 50);
insert into pokemon_movimiento_forma
values (98, 64, 51);
insert into pokemon_movimiento_forma
values (98, 10, 53);
insert into pokemon_movimiento_forma
values (98, 78, 54);

insert into pokemon_movimiento_forma
values (99, 3, 56);
insert into pokemon_movimiento_forma
values (99, 46, 56);
insert into pokemon_movimiento_forma
values (99, 90, 56);
insert into pokemon_movimiento_forma
values (99, 46, 59);
insert into pokemon_movimiento_forma
values (99, 86, 92);
insert into pokemon_movimiento_forma
values (99, 98, 61);
insert into pokemon_movimiento_forma
values (99, 6, 76);
insert into pokemon_movimiento_forma
values (99, 77, 97);
insert into pokemon_movimiento_forma
values (99, 88, 15);
insert into pokemon_movimiento_forma
values (99, 2, 3);
insert into pokemon_movimiento_forma
values (99, 159, 6);
insert into pokemon_movimiento_forma
values (99, 82, 8);
insert into pokemon_movimiento_forma
values (99, 66, 9);
insert into pokemon_movimiento_forma
values (99, 73, 10);
insert into pokemon_movimiento_forma
values (99, 8, 11);
insert into pokemon_movimiento_forma
values (99, 7, 12);
insert into pokemon_movimiento_forma
values (99, 35, 13);
insert into pokemon_movimiento_forma
values (99, 36, 14);
insert into pokemon_movimiento_forma
values (99, 79, 20);
insert into pokemon_movimiento_forma
values (99, 94, 31);
insert into pokemon_movimiento_forma
values (99, 72, 32);
insert into pokemon_movimiento_forma
values (99, 118, 34);
insert into pokemon_movimiento_forma
values (99, 135, 44);
insert into pokemon_movimiento_forma
values (99, 114, 50);
insert into pokemon_movimiento_forma
values (99, 64, 51);
insert into pokemon_movimiento_forma
values (99, 10, 53);
insert into pokemon_movimiento_forma
values (99, 78, 54);

insert into pokemon_movimiento_forma
values (100, 1, 56);
insert into pokemon_movimiento_forma
values (100, 60, 56);
insert into pokemon_movimiento_forma
values (100, 57, 88);
insert into pokemon_movimiento_forma
values (100, 54, 64);
insert into pokemon_movimiento_forma
values (100, 139, 100);
insert into pokemon_movimiento_forma
values (100, 103, 78);
insert into pokemon_movimiento_forma
values (100, 75, 69);
insert into pokemon_movimiento_forma
values (100, 159, 6);
insert into pokemon_movimiento_forma
values (100, 66, 9);
insert into pokemon_movimiento_forma
values (100, 79, 20);
insert into pokemon_movimiento_forma
values (100, 20, 24);
insert into pokemon_movimiento_forma
values (100, 21, 25);
insert into pokemon_movimiento_forma
values (100, 144, 30);
insert into pokemon_movimiento_forma
values (100, 94, 31);
insert into pokemon_movimiento_forma
values (100, 72, 32);
insert into pokemon_movimiento_forma
values (100, 143, 33);
insert into pokemon_movimiento_forma
values (100, 118, 34);
insert into pokemon_movimiento_forma
values (100, 54, 36);
insert into pokemon_movimiento_forma
values (100, 103, 39);
insert into pokemon_movimiento_forma
values (100, 135, 44);
insert into pokemon_movimiento_forma
values (100, 18, 45);
insert into pokemon_movimiento_forma
values (100, 75, 47);
insert into pokemon_movimiento_forma
values (100, 114, 50);
insert into pokemon_movimiento_forma
values (100, 69, 55);

insert into pokemon_movimiento_forma
values (101, 1, 56);
insert into pokemon_movimiento_forma
values (101, 60, 56);
insert into pokemon_movimiento_forma
values (101, 57, 88);
insert into pokemon_movimiento_forma
values (101, 54, 64);
insert into pokemon_movimiento_forma
values (101, 139, 100);
insert into pokemon_movimiento_forma
values (101, 103, 78);
insert into pokemon_movimiento_forma
values (101, 75, 69);
insert into pokemon_movimiento_forma
values (101, 159, 6);
insert into pokemon_movimiento_forma
values (101, 66, 9);
insert into pokemon_movimiento_forma
values (101, 88, 15);
insert into pokemon_movimiento_forma
values (101, 79, 20);
insert into pokemon_movimiento_forma
values (101, 20, 24);
insert into pokemon_movimiento_forma
values (101, 21, 25);
insert into pokemon_movimiento_forma
values (101, 144, 30);
insert into pokemon_movimiento_forma
values (101, 94, 31);
insert into pokemon_movimiento_forma
values (101, 72, 32);
insert into pokemon_movimiento_forma
values (101, 143, 33);
insert into pokemon_movimiento_forma
values (101, 118, 34);
insert into pokemon_movimiento_forma
values (101, 54, 36);
insert into pokemon_movimiento_forma
values (101, 103, 39);
insert into pokemon_movimiento_forma
values (101, 135, 44);
insert into pokemon_movimiento_forma
values (101, 18, 45);
insert into pokemon_movimiento_forma
values (101, 75, 47);
insert into pokemon_movimiento_forma
values (101, 114, 50);
insert into pokemon_movimiento_forma
values (101, 69, 55);

insert into pokemon_movimiento_forma
values (102, 101, 56);
insert into pokemon_movimiento_forma
values (102, 136, 56);
insert into pokemon_movimiento_forma
values (102, 143, 92);
insert into pokemon_movimiento_forma
values (102, 122, 80);
insert into pokemon_movimiento_forma
values (102, 127, 91);
insert into pokemon_movimiento_forma
values (102, 157, 103);
insert into pokemon_movimiento_forma
values (102, 128, 76);
insert into pokemon_movimiento_forma
values (102, 129, 63);
insert into pokemon_movimiento_forma
values (102, 159, 6);
insert into pokemon_movimiento_forma
values (102, 66, 9);
insert into pokemon_movimiento_forma
values (102, 73, 10);
insert into pokemon_movimiento_forma
values (102, 79, 20);
insert into pokemon_movimiento_forma
values (102, 142, 29);
insert into pokemon_movimiento_forma
values (102, 144, 30);
insert into pokemon_movimiento_forma
values (102, 94, 31);
insert into pokemon_movimiento_forma
values (102, 72, 32);
insert into pokemon_movimiento_forma
values (102, 143, 33);
insert into pokemon_movimiento_forma
values (102, 118, 34);
insert into pokemon_movimiento_forma
values (102, 54, 36);
insert into pokemon_movimiento_forma
values (102, 56, 37);
insert into pokemon_movimiento_forma
values (102, 135, 44);
insert into pokemon_movimiento_forma
values (102, 140, 46);
insert into pokemon_movimiento_forma
values (102, 75, 47);
insert into pokemon_movimiento_forma
values (102, 114, 50);

insert into pokemon_movimiento_forma
values (103, 101, 56);
insert into pokemon_movimiento_forma
values (103, 136, 56);
insert into pokemon_movimiento_forma
values (103, 98, 80);
insert into pokemon_movimiento_forma
values (103, 159, 6);
insert into pokemon_movimiento_forma
values (103, 66, 9);
insert into pokemon_movimiento_forma
values (103, 73, 10);
insert into pokemon_movimiento_forma
values (103, 79, 20);
insert into pokemon_movimiento_forma
values (103, 142, 29);
insert into pokemon_movimiento_forma
values (103, 144, 30);
insert into pokemon_movimiento_forma
values (103, 94, 31);
insert into pokemon_movimiento_forma
values (103, 72, 32);
insert into pokemon_movimiento_forma
values (103, 143, 33);
insert into pokemon_movimiento_forma
values (103, 118, 34);
insert into pokemon_movimiento_forma
values (103, 54, 36);
insert into pokemon_movimiento_forma
values (103, 56, 37);
insert into pokemon_movimiento_forma
values (103, 135, 44);
insert into pokemon_movimiento_forma
values (103, 140, 46);
insert into pokemon_movimiento_forma
values (103, 75, 47);
insert into pokemon_movimiento_forma
values (103, 114, 50);
insert into pokemon_movimiento_forma
values (103, 88, 15);
insert into pokemon_movimiento_forma
values (103, 126, 21);
insert into pokemon_movimiento_forma
values (103, 128, 22);
insert into pokemon_movimiento_forma
values (103, 78, 54);

insert into pokemon_movimiento_forma
values (104, 85, 56);
insert into pokemon_movimiento_forma
values (104, 149, 56);
insert into pokemon_movimiento_forma
values (104, 90, 92);
insert into pokemon_movimiento_forma
values (104, 76, 82);
insert into pokemon_movimiento_forma
values (104, 80, 66);
insert into pokemon_movimiento_forma
values (104, 150, 69);
insert into pokemon_movimiento_forma
values (104, 79, 67);
insert into pokemon_movimiento_forma
values (104, 92, 1);
insert into pokemon_movimiento_forma
values (104, 91, 5);
insert into pokemon_movimiento_forma
values (104, 159, 6);
insert into pokemon_movimiento_forma
values (104, 82, 8);
insert into pokemon_movimiento_forma
values (104, 66, 9);
insert into pokemon_movimiento_forma
values (104, 73, 10);
insert into pokemon_movimiento_forma
values (104, 8, 11);
insert into pokemon_movimiento_forma
values (104, 7, 12);
insert into pokemon_movimiento_forma
values (104, 35, 13);
insert into pokemon_movimiento_forma
values (104, 36, 14);
insert into pokemon_movimiento_forma
values (104, 44, 17);
insert into pokemon_movimiento_forma
values (104, 37, 18);
insert into pokemon_movimiento_forma
values (104, 39, 19);
insert into pokemon_movimiento_forma
values (104, 79, 20);
insert into pokemon_movimiento_forma
values (104, 151, 26);
insert into pokemon_movimiento_forma
values (104, 148, 27);
insert into pokemon_movimiento_forma
values (104, 147, 28);
insert into pokemon_movimiento_forma
values (104, 94, 31);
insert into pokemon_movimiento_forma
values (104, 72, 32);
insert into pokemon_movimiento_forma
values (104, 118, 34);
insert into pokemon_movimiento_forma
values (104, 29, 38);
insert into pokemon_movimiento_forma
values (104, 58, 40);
insert into pokemon_movimiento_forma
values (104, 135, 44);
insert into pokemon_movimiento_forma
values (104, 114, 50);
insert into pokemon_movimiento_forma
values (104, 78, 54);

insert into pokemon_movimiento_forma
values (105, 85, 56);
insert into pokemon_movimiento_forma
values (105, 149, 56);
insert into pokemon_movimiento_forma
values (105, 90, 56);
insert into pokemon_movimiento_forma
values (105, 76, 56);
insert into pokemon_movimiento_forma
values (105, 90, 92);
insert into pokemon_movimiento_forma
values (105, 76, 75);
insert into pokemon_movimiento_forma
values (105, 80, 62);
insert into pokemon_movimiento_forma
values (105, 150, 63);
insert into pokemon_movimiento_forma
values (105, 79, 70);
insert into pokemon_movimiento_forma
values (105, 92, 1);
insert into pokemon_movimiento_forma
values (105, 91, 5);
insert into pokemon_movimiento_forma
values (105, 159, 6);
insert into pokemon_movimiento_forma
values (105, 82, 8);
insert into pokemon_movimiento_forma
values (105, 66, 9);
insert into pokemon_movimiento_forma
values (105, 73, 10);
insert into pokemon_movimiento_forma
values (105, 8, 11);
insert into pokemon_movimiento_forma
values (105, 7, 12);
insert into pokemon_movimiento_forma
values (105, 35, 13);
insert into pokemon_movimiento_forma
values (105, 36, 14);
insert into pokemon_movimiento_forma
values (105, 88, 15);
insert into pokemon_movimiento_forma
values (105, 44, 17);
insert into pokemon_movimiento_forma
values (105, 37, 18);
insert into pokemon_movimiento_forma
values (105, 39, 19);
insert into pokemon_movimiento_forma
values (105, 79, 20);
insert into pokemon_movimiento_forma
values (105, 151, 26);
insert into pokemon_movimiento_forma
values (105, 148, 27);
insert into pokemon_movimiento_forma
values (105, 147, 28);
insert into pokemon_movimiento_forma
values (105, 94, 31);
insert into pokemon_movimiento_forma
values (105, 72, 32);
insert into pokemon_movimiento_forma
values (105, 118, 34);
insert into pokemon_movimiento_forma
values (105, 29, 38);
insert into pokemon_movimiento_forma
values (105, 58, 40);
insert into pokemon_movimiento_forma
values (105, 135, 44);
insert into pokemon_movimiento_forma
values (105, 114, 50);
insert into pokemon_movimiento_forma
values (105, 78, 54);

insert into pokemon_movimiento_forma
values (106, 138, 56);
insert into pokemon_movimiento_forma
values (106, 38, 56);
insert into pokemon_movimiento_forma
values (106, 41, 75);
insert into pokemon_movimiento_forma
values (106, 76, 69);
insert into pokemon_movimiento_forma
values (106, 43, 63);
insert into pokemon_movimiento_forma
values (106, 91, 109);
insert into pokemon_movimiento_forma
values (106, 92, 1);
insert into pokemon_movimiento_forma
values (106, 91, 5);
insert into pokemon_movimiento_forma
values (106, 159, 6);
insert into pokemon_movimiento_forma
values (106, 82, 8);
insert into pokemon_movimiento_forma
values (106, 66, 9);
insert into pokemon_movimiento_forma
values (106, 73, 10);
insert into pokemon_movimiento_forma
values (106, 44, 17);
insert into pokemon_movimiento_forma
values (106, 37, 18);
insert into pokemon_movimiento_forma
values (106, 39, 19);
insert into pokemon_movimiento_forma
values (106, 79, 20);
insert into pokemon_movimiento_forma
values (106, 94, 31);
insert into pokemon_movimiento_forma
values (106, 72, 32);
insert into pokemon_movimiento_forma
values (106, 118, 34);
insert into pokemon_movimiento_forma
values (106, 93, 35);
insert into pokemon_movimiento_forma
values (106, 103, 39);
insert into pokemon_movimiento_forma
values (106, 58, 40);
insert into pokemon_movimiento_forma
values (106, 135, 44);
insert into pokemon_movimiento_forma
values (106, 114, 50);
insert into pokemon_movimiento_forma
values (106, 78, 54);

insert into pokemon_movimiento_forma
values (107, 102, 56);
insert into pokemon_movimiento_forma
values (107, 130, 56);
insert into pokemon_movimiento_forma
values (107, 30, 75);
insert into pokemon_movimiento_forma
values (107, 33, 66);
insert into pokemon_movimiento_forma
values (107, 19, 69);
insert into pokemon_movimiento_forma
values (107, 92, 63);
insert into pokemon_movimiento_forma
values (107, 37, 109);
insert into pokemon_movimiento_forma
values (107, 92, 1);
insert into pokemon_movimiento_forma
values (107, 91, 5);
insert into pokemon_movimiento_forma
values (107, 159, 6);
insert into pokemon_movimiento_forma
values (107, 82, 8);
insert into pokemon_movimiento_forma
values (107, 66, 9);
insert into pokemon_movimiento_forma
values (107, 73, 10);
insert into pokemon_movimiento_forma
values (107, 44, 17);
insert into pokemon_movimiento_forma
values (107, 37, 18);
insert into pokemon_movimiento_forma
values (107, 39, 19);
insert into pokemon_movimiento_forma
values (107, 79, 20);
insert into pokemon_movimiento_forma
values (107, 94, 31);
insert into pokemon_movimiento_forma
values (107, 72, 32);
insert into pokemon_movimiento_forma
values (107, 118, 34);
insert into pokemon_movimiento_forma
values (107, 93, 35);
insert into pokemon_movimiento_forma
values (107, 103, 39);
insert into pokemon_movimiento_forma
values (107, 58, 40);
insert into pokemon_movimiento_forma
values (107, 135, 44);
insert into pokemon_movimiento_forma
values (107, 114, 50);
insert into pokemon_movimiento_forma
values (107, 78, 54);

insert into pokemon_movimiento_forma
values (108, 107, 56);
insert into pokemon_movimiento_forma
values (108, 113, 56);
insert into pokemon_movimiento_forma
values (108, 98, 57);
insert into pokemon_movimiento_forma
values (108, 48, 73);
insert into pokemon_movimiento_forma
values (108, 109, 99);
insert into pokemon_movimiento_forma
values (108, 100, 82);
insert into pokemon_movimiento_forma
values (108, 60, 83);
insert into pokemon_movimiento_forma
values (108, 92, 1);
insert into pokemon_movimiento_forma
values (108, 2, 3);
insert into pokemon_movimiento_forma
values (108, 91, 5);
insert into pokemon_movimiento_forma
values (108, 159, 6);
insert into pokemon_movimiento_forma
values (108, 82, 8);
insert into pokemon_movimiento_forma
values (108, 66, 9);
insert into pokemon_movimiento_forma
values (108, 73, 10);
insert into pokemon_movimiento_forma
values (108, 8, 11);
insert into pokemon_movimiento_forma
values (108, 7, 12);
insert into pokemon_movimiento_forma
values (108, 35, 13);
insert into pokemon_movimiento_forma
values (108, 36, 14);
insert into pokemon_movimiento_forma
values (108, 88, 15);
insert into pokemon_movimiento_forma
values (108, 44, 17);
insert into pokemon_movimiento_forma
values (108, 37, 18);
insert into pokemon_movimiento_forma
values (108, 39, 19);
insert into pokemon_movimiento_forma
values (108, 79, 20);
insert into pokemon_movimiento_forma
values (108, 20, 24);
insert into pokemon_movimiento_forma
values (108, 21, 25);
insert into pokemon_movimiento_forma
values (108, 151, 26);
insert into pokemon_movimiento_forma
values (108, 148, 27);
insert into pokemon_movimiento_forma
values (108, 94, 31);
insert into pokemon_movimiento_forma
values (108, 72, 32);
insert into pokemon_movimiento_forma
values (108, 118, 34);
insert into pokemon_movimiento_forma
values (108, 29, 38);
insert into pokemon_movimiento_forma
values (108, 58, 40);
insert into pokemon_movimiento_forma
values (108, 135, 44);
insert into pokemon_movimiento_forma
values (108, 114, 50);
insert into pokemon_movimiento_forma
values (108, 64, 51);
insert into pokemon_movimiento_forma
values (108, 10, 53);
insert into pokemon_movimiento_forma
values (108, 78, 54);

insert into pokemon_movimiento_forma
values (109, 1, 56);
insert into pokemon_movimiento_forma
values (109, 156, 56);
insert into pokemon_movimiento_forma
values (109, 158, 91);
insert into pokemon_movimiento_forma
values (109, 96, 103);
insert into pokemon_movimiento_forma
values (109, 54, 96);
insert into pokemon_movimiento_forma
values (109, 32, 107);
insert into pokemon_movimiento_forma
values (109, 75, 63);
insert into pokemon_movimiento_forma
values (109, 159, 6);
insert into pokemon_movimiento_forma
values (109, 79, 20);
insert into pokemon_movimiento_forma
values (109, 20, 24);
insert into pokemon_movimiento_forma
values (109, 21, 25);
insert into pokemon_movimiento_forma
values (109, 94, 31);
insert into pokemon_movimiento_forma
values (109, 72, 32);
insert into pokemon_movimiento_forma
values (109, 118, 34);
insert into pokemon_movimiento_forma
values (109, 54, 36);
insert into pokemon_movimiento_forma
values (109, 29, 38);
insert into pokemon_movimiento_forma
values (109, 135, 44);
insert into pokemon_movimiento_forma
values (109, 75, 47);
insert into pokemon_movimiento_forma
values (109, 114, 50);

insert into pokemon_movimiento_forma
values (110, 1, 56);
insert into pokemon_movimiento_forma
values (110, 156, 56);
insert into pokemon_movimiento_forma
values (110, 158, 56);
insert into pokemon_movimiento_forma
values (110, 158, 91);
insert into pokemon_movimiento_forma
values (110, 96, 83);
insert into pokemon_movimiento_forma
values (110, 54, 69);
insert into pokemon_movimiento_forma
values (110, 32, 97);
insert into pokemon_movimiento_forma
values (110, 75, 109);
insert into pokemon_movimiento_forma
values (110, 159, 6);
insert into pokemon_movimiento_forma
values (110, 88, 15);
insert into pokemon_movimiento_forma
values (110, 79, 20);
insert into pokemon_movimiento_forma
values (110, 20, 24);
insert into pokemon_movimiento_forma
values (110, 21, 25);
insert into pokemon_movimiento_forma
values (110, 94, 31);
insert into pokemon_movimiento_forma
values (110, 72, 32);
insert into pokemon_movimiento_forma
values (110, 118, 34);
insert into pokemon_movimiento_forma
values (110, 54, 36);
insert into pokemon_movimiento_forma
values (110, 29, 38);
insert into pokemon_movimiento_forma
values (110, 135, 44);
insert into pokemon_movimiento_forma
values (110, 75, 47);
insert into pokemon_movimiento_forma
values (110, 114, 50);

insert into pokemon_movimiento_forma
values (111, 63, 56);
insert into pokemon_movimiento_forma
values (111, 98, 65);
insert into pokemon_movimiento_forma
values (111, 89, 81);
insert into pokemon_movimiento_forma
values (111, 52, 96);
insert into pokemon_movimiento_forma
values (111, 97, 107);
insert into pokemon_movimiento_forma
values (111, 90, 102);
insert into pokemon_movimiento_forma
values (111, 66, 70);
insert into pokemon_movimiento_forma
values (111, 159, 6);
insert into pokemon_movimiento_forma
values (111, 97, 7);
insert into pokemon_movimiento_forma
values (111, 82, 8);
insert into pokemon_movimiento_forma
values (111, 66, 9);
insert into pokemon_movimiento_forma
values (111, 73, 10);
insert into pokemon_movimiento_forma
values (111, 79, 20);
insert into pokemon_movimiento_forma
values (111, 20, 24);
insert into pokemon_movimiento_forma
values (111, 21, 25);
insert into pokemon_movimiento_forma
values (111, 151, 26);
insert into pokemon_movimiento_forma
values (111, 148, 27);
insert into pokemon_movimiento_forma
values (111, 147, 28);
insert into pokemon_movimiento_forma
values (111, 94, 31);
insert into pokemon_movimiento_forma
values (111, 72, 32);
insert into pokemon_movimiento_forma
values (111, 118, 34);
insert into pokemon_movimiento_forma
values (111, 29, 38);
insert into pokemon_movimiento_forma
values (111, 58, 40);
insert into pokemon_movimiento_forma
values (111, 135, 44);
insert into pokemon_movimiento_forma
values (111, 145, 48);
insert into pokemon_movimiento_forma
values (111, 114, 50);
insert into pokemon_movimiento_forma
values (111, 78, 54);

insert into pokemon_movimiento_forma
values (112, 89, 56);
insert into pokemon_movimiento_forma
values (112, 52, 56);
insert into pokemon_movimiento_forma
values (112, 98, 56);
insert into pokemon_movimiento_forma
values (112, 98, 65);
insert into pokemon_movimiento_forma
values (112, 63, 56);
insert into pokemon_movimiento_forma
values (112, 89, 81);
insert into pokemon_movimiento_forma
values (112, 52, 96);
insert into pokemon_movimiento_forma
values (112, 97, 63);
insert into pokemon_movimiento_forma
values (112, 90, 70);
insert into pokemon_movimiento_forma
values (112, 66, 111);
insert into pokemon_movimiento_forma
values (112, 92, 1);
insert into pokemon_movimiento_forma
values (112, 91, 5);
insert into pokemon_movimiento_forma
values (112, 159, 6);
insert into pokemon_movimiento_forma
values (112, 97, 7);
insert into pokemon_movimiento_forma
values (112, 82, 8);
insert into pokemon_movimiento_forma
values (112, 66, 9);
insert into pokemon_movimiento_forma
values (112, 73, 10);
insert into pokemon_movimiento_forma
values (112, 8, 11);
insert into pokemon_movimiento_forma
values (112, 7, 12);
insert into pokemon_movimiento_forma
values (112, 35, 13);
insert into pokemon_movimiento_forma
values (112, 36, 14);
insert into pokemon_movimiento_forma
values (112, 88, 15);
insert into pokemon_movimiento_forma
values (112, 71, 16);
insert into pokemon_movimiento_forma
values (112, 44, 17);
insert into pokemon_movimiento_forma
values (112, 37, 18);
insert into pokemon_movimiento_forma
values (112, 39, 19);
insert into pokemon_movimiento_forma
values (112, 79, 20);
insert into pokemon_movimiento_forma
values (112, 20, 24);
insert into pokemon_movimiento_forma
values (112, 21, 25);
insert into pokemon_movimiento_forma
values (112, 151, 26);
insert into pokemon_movimiento_forma
values (112, 148, 27);
insert into pokemon_movimiento_forma
values (112, 147, 28);
insert into pokemon_movimiento_forma
values (112, 94, 31);
insert into pokemon_movimiento_forma
values (112, 72, 32);
insert into pokemon_movimiento_forma
values (112, 118, 34);
insert into pokemon_movimiento_forma
values (112, 29, 38);
insert into pokemon_movimiento_forma
values (112, 58, 40);
insert into pokemon_movimiento_forma
values (112, 135, 44);
insert into pokemon_movimiento_forma
values (112, 145, 48);
insert into pokemon_movimiento_forma
values (112, 114, 50);
insert into pokemon_movimiento_forma
values (112, 10, 53);
insert into pokemon_movimiento_forma
values (112, 78, 54);

insert into pokemon_movimiento_forma
values (113, 70, 56);
insert into pokemon_movimiento_forma
values (113, 74, 56);
insert into pokemon_movimiento_forma
values (113, 59, 74);
insert into pokemon_movimiento_forma
values (113, 85, 65);
insert into pokemon_movimiento_forma
values (113, 105, 66);
insert into pokemon_movimiento_forma
values (113, 109, 95);
insert into pokemon_movimiento_forma
values (113, 139, 63);
insert into pokemon_movimiento_forma
values (113, 73, 68);
insert into pokemon_movimiento_forma
values (113, 92, 1);
insert into pokemon_movimiento_forma
values (113, 91, 5);
insert into pokemon_movimiento_forma
values (113, 159, 6);
insert into pokemon_movimiento_forma
values (113, 82, 8);
insert into pokemon_movimiento_forma
values (113, 66, 9);
insert into pokemon_movimiento_forma
values (113, 73, 10);
insert into pokemon_movimiento_forma
values (113, 8, 11);
insert into pokemon_movimiento_forma
values (113, 7, 12);
insert into pokemon_movimiento_forma
values (113, 35, 13);
insert into pokemon_movimiento_forma
values (113, 36, 14);
insert into pokemon_movimiento_forma
values (113, 88, 15);
insert into pokemon_movimiento_forma
values (113, 44, 17);
insert into pokemon_movimiento_forma
values (113, 37, 18);
insert into pokemon_movimiento_forma
values (113, 39, 19);
insert into pokemon_movimiento_forma
values (113, 79, 20);
insert into pokemon_movimiento_forma
values (113, 128, 22);
insert into pokemon_movimiento_forma
values (113, 20, 24);
insert into pokemon_movimiento_forma
values (113, 21, 25);
insert into pokemon_movimiento_forma
values (113, 142, 29);
insert into pokemon_movimiento_forma
values (113, 144, 30);
insert into pokemon_movimiento_forma
values (113, 94, 31);
insert into pokemon_movimiento_forma
values (113, 72, 32);
insert into pokemon_movimiento_forma
values (113, 143, 33);
insert into pokemon_movimiento_forma
values (113, 118, 34);
insert into pokemon_movimiento_forma
values (113, 93, 35);
insert into pokemon_movimiento_forma
values (113, 56, 37);
insert into pokemon_movimiento_forma
values (113, 29, 38);
insert into pokemon_movimiento_forma
values (113, 58, 40);
insert into pokemon_movimiento_forma
values (113, 47, 41);
insert into pokemon_movimiento_forma
values (113, 135, 44);
insert into pokemon_movimiento_forma
values (113, 18, 45);
insert into pokemon_movimiento_forma
values (113, 140, 46);
insert into pokemon_movimiento_forma
values (113, 117, 49);
insert into pokemon_movimiento_forma
values (113, 114, 50);
insert into pokemon_movimiento_forma
values (113, 78, 54);
insert into pokemon_movimiento_forma
values (113, 69, 55);

insert into pokemon_movimiento_forma
values (114, 167, 56);
insert into pokemon_movimiento_forma
values (114, 50, 56);
insert into pokemon_movimiento_forma
values (114, 120, 100);
insert into pokemon_movimiento_forma
values (114, 157, 91);
insert into pokemon_movimiento_forma
values (114, 127, 78);
insert into pokemon_movimiento_forma
values (114, 129, 83);
insert into pokemon_movimiento_forma
values (114, 100, 107);
insert into pokemon_movimiento_forma
values (114, 67, 97);
insert into pokemon_movimiento_forma
values (114, 2, 3);
insert into pokemon_movimiento_forma
values (114, 159, 6);
insert into pokemon_movimiento_forma
values (114, 82, 8);
insert into pokemon_movimiento_forma
values (114, 66, 9);
insert into pokemon_movimiento_forma
values (114, 73, 10);
insert into pokemon_movimiento_forma
values (114, 88, 15);
insert into pokemon_movimiento_forma
values (114, 79, 20);
insert into pokemon_movimiento_forma
values (114, 126, 21);
insert into pokemon_movimiento_forma
values (114, 128, 22);
insert into pokemon_movimiento_forma
values (114, 94, 31);
insert into pokemon_movimiento_forma
values (114, 72, 32);
insert into pokemon_movimiento_forma
values (114, 118, 34);
insert into pokemon_movimiento_forma
values (114, 58, 40);
insert into pokemon_movimiento_forma
values (114, 135, 44);
insert into pokemon_movimiento_forma
values (114, 114, 50);
insert into pokemon_movimiento_forma
values (114, 64, 51);

insert into pokemon_movimiento_forma
values (115, 102, 56);
insert into pokemon_movimiento_forma
values (115, 79, 56);
insert into pokemon_movimiento_forma
values (115, 95, 90);
insert into pokemon_movimiento_forma
values (115, 89, 82);
insert into pokemon_movimiento_forma
values (115, 92, 78);
insert into pokemon_movimiento_forma
values (115, 90, 62);
insert into pokemon_movimiento_forma
values (115, 168, 67);
insert into pokemon_movimiento_forma
values (115, 92, 1);
insert into pokemon_movimiento_forma
values (115, 91, 5);
insert into pokemon_movimiento_forma
values (115, 159, 6);
insert into pokemon_movimiento_forma
values (115, 82, 8);
insert into pokemon_movimiento_forma
values (115, 66, 9);
insert into pokemon_movimiento_forma
values (115, 73, 10);
insert into pokemon_movimiento_forma
values (115, 8, 11);
insert into pokemon_movimiento_forma
values (115, 7, 12);
insert into pokemon_movimiento_forma
values (115, 35, 13);
insert into pokemon_movimiento_forma
values (115, 36, 14);
insert into pokemon_movimiento_forma
values (115, 88, 15);
insert into pokemon_movimiento_forma
values (115, 44, 17);
insert into pokemon_movimiento_forma
values (115, 37, 18);
insert into pokemon_movimiento_forma
values (115, 39, 19);
insert into pokemon_movimiento_forma
values (115, 79, 20);
insert into pokemon_movimiento_forma
values (115, 20, 24);
insert into pokemon_movimiento_forma
values (115, 21, 25);
insert into pokemon_movimiento_forma
values (115, 151, 26);
insert into pokemon_movimiento_forma
values (115, 148, 27);
insert into pokemon_movimiento_forma
values (115, 94, 31);
insert into pokemon_movimiento_forma
values (115, 72, 32);
insert into pokemon_movimiento_forma
values (115, 118, 34);
insert into pokemon_movimiento_forma
values (115, 29, 38);
insert into pokemon_movimiento_forma
values (115, 58, 40);
insert into pokemon_movimiento_forma
values (115, 135, 44);
insert into pokemon_movimiento_forma
values (115, 145, 48);
insert into pokemon_movimiento_forma
values (115, 114, 50);
insert into pokemon_movimiento_forma
values (115, 10, 53);
insert into pokemon_movimiento_forma
values (115, 78, 54);

insert into pokemon_movimiento_forma
values (116, 3, 56);
insert into pokemon_movimiento_forma
values (116, 96, 94);
insert into pokemon_movimiento_forma
values (116, 90, 74);
insert into pokemon_movimiento_forma
values (116, 7, 65);
insert into pokemon_movimiento_forma
values (116, 130, 103);
insert into pokemon_movimiento_forma
values (116, 5, 107);
insert into pokemon_movimiento_forma
values (116, 159, 6);
insert into pokemon_movimiento_forma
values (116, 66, 9);
insert into pokemon_movimiento_forma
values (116, 73, 10);
insert into pokemon_movimiento_forma
values (116, 8, 11);
insert into pokemon_movimiento_forma
values (116, 7, 12);
insert into pokemon_movimiento_forma
values (116, 35, 13);
insert into pokemon_movimiento_forma
values (116, 36, 14);
insert into pokemon_movimiento_forma
values (116, 79, 20);
insert into pokemon_movimiento_forma
values (116, 94, 31);
insert into pokemon_movimiento_forma
values (116, 72, 32);
insert into pokemon_movimiento_forma
values (116, 118, 34);
insert into pokemon_movimiento_forma
values (116, 19, 39);
insert into pokemon_movimiento_forma
values (116, 58, 40);
insert into pokemon_movimiento_forma
values (116, 135, 44);
insert into pokemon_movimiento_forma
values (116, 114, 50);
insert into pokemon_movimiento_forma
values (116, 10, 53);

insert into pokemon_movimiento_forma
values (117, 8, 56);
insert into pokemon_movimiento_forma
values (117, 96, 56);
insert into pokemon_movimiento_forma
values (117, 96, 94);
insert into pokemon_movimiento_forma
values (117, 90, 74);
insert into pokemon_movimiento_forma
values (117, 7, 65);
insert into pokemon_movimiento_forma
values (117, 130, 62);
insert into pokemon_movimiento_forma
values (117, 5, 85);
insert into pokemon_movimiento_forma
values (117, 159, 6);
insert into pokemon_movimiento_forma
values (117, 66, 9);
insert into pokemon_movimiento_forma
values (117, 73, 10);
insert into pokemon_movimiento_forma
values (117, 8, 11);
insert into pokemon_movimiento_forma
values (117, 7, 12);
insert into pokemon_movimiento_forma
values (117, 35, 13);
insert into pokemon_movimiento_forma
values (117, 36, 14);
insert into pokemon_movimiento_forma
values (117, 88, 15);
insert into pokemon_movimiento_forma
values (117, 79, 20);
insert into pokemon_movimiento_forma
values (117, 94, 31);
insert into pokemon_movimiento_forma
values (117, 72, 32);
insert into pokemon_movimiento_forma
values (117, 118, 34);
insert into pokemon_movimiento_forma
values (117, 19, 39);
insert into pokemon_movimiento_forma
values (117, 58, 40);
insert into pokemon_movimiento_forma
values (117, 135, 44);
insert into pokemon_movimiento_forma
values (117, 114, 50);
insert into pokemon_movimiento_forma
values (117, 10, 53);


insert into pokemon_movimiento_forma
values (118, 165, 56);
insert into pokemon_movimiento_forma
values (118, 89, 56);
insert into pokemon_movimiento_forma
values (118, 113, 94);
insert into pokemon_movimiento_forma
values (118, 63, 74);
insert into pokemon_movimiento_forma
values (118, 52, 65);
insert into pokemon_movimiento_forma
values (118, 4, 103);
insert into pokemon_movimiento_forma
values (118, 97, 107);
insert into pokemon_movimiento_forma
values (118, 130, 68);
insert into pokemon_movimiento_forma
values (118, 159, 6);
insert into pokemon_movimiento_forma
values (118, 97, 7);
insert into pokemon_movimiento_forma
values (118, 66, 9);
insert into pokemon_movimiento_forma
values (118, 73, 10);
insert into pokemon_movimiento_forma
values (118, 8, 11);
insert into pokemon_movimiento_forma
values (118, 7, 12);
insert into pokemon_movimiento_forma
values (118, 35, 13);
insert into pokemon_movimiento_forma
values (118, 36, 14);
insert into pokemon_movimiento_forma
values (118, 79, 20);
insert into pokemon_movimiento_forma
values (118, 94, 31);
insert into pokemon_movimiento_forma
values (118, 72, 32);
insert into pokemon_movimiento_forma
values (118, 118, 34);
insert into pokemon_movimiento_forma
values (118, 19, 39);
insert into pokemon_movimiento_forma
values (118, 58, 40);
insert into pokemon_movimiento_forma
values (118, 135, 44);
insert into pokemon_movimiento_forma
values (118, 114, 50);
insert into pokemon_movimiento_forma
values (118, 10, 53);

insert into pokemon_movimiento_forma
values (119, 165, 56);
insert into pokemon_movimiento_forma
values (119, 89, 56);
insert into pokemon_movimiento_forma
values (119, 113, 56);
insert into pokemon_movimiento_forma
values (119, 113, 94);
insert into pokemon_movimiento_forma
values (119, 63, 74);
insert into pokemon_movimiento_forma
values (119, 52, 65);
insert into pokemon_movimiento_forma
values (119, 4, 83);
insert into pokemon_movimiento_forma
values (119, 97, 63);
insert into pokemon_movimiento_forma
values (119, 130, 68);
insert into pokemon_movimiento_forma
values (119, 159, 6);
insert into pokemon_movimiento_forma
values (119, 97, 7);
insert into pokemon_movimiento_forma
values (119, 66, 9);
insert into pokemon_movimiento_forma
values (119, 73, 10);
insert into pokemon_movimiento_forma
values (119, 8, 11);
insert into pokemon_movimiento_forma
values (119, 7, 12);
insert into pokemon_movimiento_forma
values (119, 35, 13);
insert into pokemon_movimiento_forma
values (119, 36, 14);
insert into pokemon_movimiento_forma
values (119, 88, 15);
insert into pokemon_movimiento_forma
values (119, 79, 20);
insert into pokemon_movimiento_forma
values (119, 94, 31);
insert into pokemon_movimiento_forma
values (119, 72, 32);
insert into pokemon_movimiento_forma
values (119, 118, 34);
insert into pokemon_movimiento_forma
values (119, 19, 39);
insert into pokemon_movimiento_forma
values (119, 58, 40);
insert into pokemon_movimiento_forma
values (119, 135, 44);
insert into pokemon_movimiento_forma
values (119, 114, 50);
insert into pokemon_movimiento_forma
values (119, 10, 53);

insert into pokemon_movimiento_forma
values (120, 1, 56);
insert into pokemon_movimiento_forma
values (120, 7, 88);
insert into pokemon_movimiento_forma
values (120, 77, 64);
insert into pokemon_movimiento_forma
values (120, 104, 60);
insert into pokemon_movimiento_forma
values (120, 103, 91);
insert into pokemon_movimiento_forma
values (120, 105, 103);
insert into pokemon_movimiento_forma
values (120, 139, 76);
insert into pokemon_movimiento_forma
values (120, 5, 84);
insert into pokemon_movimiento_forma
values (120, 159, 6);
insert into pokemon_movimiento_forma
values (120, 66, 9);
insert into pokemon_movimiento_forma
values (120, 73, 10);
insert into pokemon_movimiento_forma
values (120, 8, 11);
insert into pokemon_movimiento_forma
values (120, 7, 12);
insert into pokemon_movimiento_forma
values (120, 35, 13);
insert into pokemon_movimiento_forma
values (120, 36, 14);
insert into pokemon_movimiento_forma
values (120, 79, 20);
insert into pokemon_movimiento_forma
values (120, 20, 24);
insert into pokemon_movimiento_forma
values (120, 21, 25);
insert into pokemon_movimiento_forma
values (120, 142, 29);
insert into pokemon_movimiento_forma
values (120, 144, 30);
insert into pokemon_movimiento_forma
values (120, 94, 31);
insert into pokemon_movimiento_forma
values (120, 72, 32);
insert into pokemon_movimiento_forma
values (120, 143, 33);
insert into pokemon_movimiento_forma
values (120, 118, 34);
insert into pokemon_movimiento_forma
values (120, 19, 39);
insert into pokemon_movimiento_forma
values (120, 58, 40);
insert into pokemon_movimiento_forma
values (120, 135, 44);
insert into pokemon_movimiento_forma
values (120, 18, 45);
insert into pokemon_movimiento_forma
values (120, 117, 49);
insert into pokemon_movimiento_forma
values (120, 114, 50);
insert into pokemon_movimiento_forma
values (120, 10, 53);
insert into pokemon_movimiento_forma
values (120, 69, 55);

insert into pokemon_movimiento_forma
values (121, 1, 56);
insert into pokemon_movimiento_forma
values (121, 7, 56);
insert into pokemon_movimiento_forma
values (121, 77, 56);
insert into pokemon_movimiento_forma
values (121, 159, 6);
insert into pokemon_movimiento_forma
values (121, 66, 9);
insert into pokemon_movimiento_forma
values (121, 73, 10);
insert into pokemon_movimiento_forma
values (121, 8, 11);
insert into pokemon_movimiento_forma
values (121, 7, 12);
insert into pokemon_movimiento_forma
values (121, 35, 13);
insert into pokemon_movimiento_forma
values (121, 36, 14);
insert into pokemon_movimiento_forma
values (121, 88, 15);
insert into pokemon_movimiento_forma
values (121, 79, 20);
insert into pokemon_movimiento_forma
values (121, 20, 24);
insert into pokemon_movimiento_forma
values (121, 21, 25);
insert into pokemon_movimiento_forma
values (121, 142, 29);
insert into pokemon_movimiento_forma
values (121, 144, 30);
insert into pokemon_movimiento_forma
values (121, 94, 31);
insert into pokemon_movimiento_forma
values (121, 72, 32);
insert into pokemon_movimiento_forma
values (121, 143, 33);
insert into pokemon_movimiento_forma
values (121, 118, 34);
insert into pokemon_movimiento_forma
values (121, 19, 39);
insert into pokemon_movimiento_forma
values (121, 58, 40);
insert into pokemon_movimiento_forma
values (121, 135, 44);
insert into pokemon_movimiento_forma
values (121, 18, 45);
insert into pokemon_movimiento_forma
values (121, 117, 49);
insert into pokemon_movimiento_forma
values (121, 114, 50);
insert into pokemon_movimiento_forma
values (121, 10, 53);
insert into pokemon_movimiento_forma
values (121, 69, 55);

insert into pokemon_movimiento_forma
values (122, 132, 56);
insert into pokemon_movimiento_forma
values (122, 134, 73);
insert into pokemon_movimiento_forma
values (122, 139, 99);
insert into pokemon_movimiento_forma
values (122, 74, 82);
insert into pokemon_movimiento_forma
values (122, 138, 83);
insert into pokemon_movimiento_forma
values (122, 114, 84);
insert into pokemon_movimiento_forma
values (122, 92, 1);
insert into pokemon_movimiento_forma
values (122, 91, 5);
insert into pokemon_movimiento_forma
values (122, 159, 6);
insert into pokemon_movimiento_forma
values (122, 82, 8);
insert into pokemon_movimiento_forma
values (122, 66, 9);
insert into pokemon_movimiento_forma
values (122, 73, 10);
insert into pokemon_movimiento_forma
values (122, 88, 15);
insert into pokemon_movimiento_forma
values (122, 44, 17);
insert into pokemon_movimiento_forma
values (122, 37, 18);
insert into pokemon_movimiento_forma
values (122, 39, 19);
insert into pokemon_movimiento_forma
values (122, 79, 20);
insert into pokemon_movimiento_forma
values (122, 128, 22);
insert into pokemon_movimiento_forma
values (122, 20, 24);
insert into pokemon_movimiento_forma
values (122, 21, 25);
insert into pokemon_movimiento_forma
values (122, 142, 29);
insert into pokemon_movimiento_forma
values (122, 144, 30);
insert into pokemon_movimiento_forma
values (122, 94, 31);
insert into pokemon_movimiento_forma
values (122, 72, 32);
insert into pokemon_movimiento_forma
values (122, 143, 33);
insert into pokemon_movimiento_forma
values (122, 118, 34);
insert into pokemon_movimiento_forma
values (122, 93, 35);
insert into pokemon_movimiento_forma
values (122, 58, 40);
insert into pokemon_movimiento_forma
values (122, 135, 44);
insert into pokemon_movimiento_forma
values (122, 18, 45);
insert into pokemon_movimiento_forma
values (122, 140, 46);
insert into pokemon_movimiento_forma
values (122, 114, 50);
insert into pokemon_movimiento_forma
values (122, 69, 55);

insert into pokemon_movimiento_forma
values (123, 53, 56);
insert into pokemon_movimiento_forma
values (123, 90, 56);
insert into pokemon_movimiento_forma
values (123, 76, 56);
insert into pokemon_movimiento_forma
values (123, 72, 74);
insert into pokemon_movimiento_forma
values (123, 65, 100);
insert into pokemon_movimiento_forma
values (123, 2, 81);
insert into pokemon_movimiento_forma
values (123, 130, 76);
insert into pokemon_movimiento_forma
values (123, 2, 3);
insert into pokemon_movimiento_forma
values (123, 159, 6);
insert into pokemon_movimiento_forma
values (123, 66, 9);
insert into pokemon_movimiento_forma
values (123, 73, 10);
insert into pokemon_movimiento_forma
values (123, 88, 15);
insert into pokemon_movimiento_forma
values (123, 79, 20);
insert into pokemon_movimiento_forma
values (123, 94, 31);
insert into pokemon_movimiento_forma
values (123, 72, 32);
insert into pokemon_movimiento_forma
values (123, 118, 34);
insert into pokemon_movimiento_forma
values (123, 19, 39);
insert into pokemon_movimiento_forma
values (123, 58, 40);
insert into pokemon_movimiento_forma
values (123, 135, 44);
insert into pokemon_movimiento_forma
values (123, 114, 50);
insert into pokemon_movimiento_forma
values (123, 64, 51);

insert into pokemon_movimiento_forma
values (124, 70, 56);
insert into pokemon_movimiento_forma
values (124, 55, 56);
insert into pokemon_movimiento_forma
values (124, 23, 106);
insert into pokemon_movimiento_forma
values (124, 74, 99);
insert into pokemon_movimiento_forma
values (124, 33, 82);
insert into pokemon_movimiento_forma
values (124, 82, 83);
insert into pokemon_movimiento_forma
values (124, 80, 84);
insert into pokemon_movimiento_forma
values (124, 36, 112);
insert into pokemon_movimiento_forma
values (124, 92, 1);
insert into pokemon_movimiento_forma
values (124, 91, 5);
insert into pokemon_movimiento_forma
values (124, 159, 6);
insert into pokemon_movimiento_forma
values (124, 82, 8);
insert into pokemon_movimiento_forma
values (124, 66, 9);
insert into pokemon_movimiento_forma
values (124, 73, 10);
insert into pokemon_movimiento_forma
values (124, 8, 11);
insert into pokemon_movimiento_forma
values (124, 7, 12);
insert into pokemon_movimiento_forma
values (124, 35, 13);
insert into pokemon_movimiento_forma
values (124, 36, 14);
insert into pokemon_movimiento_forma
values (124, 88, 15);
insert into pokemon_movimiento_forma
values (124, 44, 17);
insert into pokemon_movimiento_forma
values (124, 37, 18);
insert into pokemon_movimiento_forma
values (124, 39, 19);
insert into pokemon_movimiento_forma
values (124, 79, 20);
insert into pokemon_movimiento_forma
values (124, 142, 29);
insert into pokemon_movimiento_forma
values (124, 144, 30);
insert into pokemon_movimiento_forma
values (124, 94, 31);
insert into pokemon_movimiento_forma
values (124, 72, 32);
insert into pokemon_movimiento_forma
values (124, 143, 33);
insert into pokemon_movimiento_forma
values (124, 118, 34);
insert into pokemon_movimiento_forma
values (124, 93, 35);
insert into pokemon_movimiento_forma
values (124, 58, 40);
insert into pokemon_movimiento_forma
values (124, 135, 44);
insert into pokemon_movimiento_forma
values (124, 140, 46);
insert into pokemon_movimiento_forma
values (124, 114, 50);

insert into pokemon_movimiento_forma
values (125, 53, 56);
insert into pokemon_movimiento_forma
values (125, 90, 56);
insert into pokemon_movimiento_forma
values (125, 17, 61);
insert into pokemon_movimiento_forma
values (125, 60, 103);
insert into pokemon_movimiento_forma
values (125, 19, 76);
insert into pokemon_movimiento_forma
values (125, 139, 97);
insert into pokemon_movimiento_forma
values (125, 21, 68);
insert into pokemon_movimiento_forma
values (125, 92, 1);
insert into pokemon_movimiento_forma
values (125, 91, 5);
insert into pokemon_movimiento_forma
values (125, 159, 6);
insert into pokemon_movimiento_forma
values (125, 82, 8);
insert into pokemon_movimiento_forma
values (125, 66, 9);
insert into pokemon_movimiento_forma
values (125, 73, 10);
insert into pokemon_movimiento_forma
values (125, 88, 15);
insert into pokemon_movimiento_forma
values (125, 44, 17);
insert into pokemon_movimiento_forma
values (125, 37, 18);
insert into pokemon_movimiento_forma
values (125, 39, 19);
insert into pokemon_movimiento_forma
values (125, 79, 20);
insert into pokemon_movimiento_forma
values (125, 20, 24);
insert into pokemon_movimiento_forma
values (125, 21, 25);
insert into pokemon_movimiento_forma
values (125, 142, 29);
insert into pokemon_movimiento_forma
values (125, 144, 30);
insert into pokemon_movimiento_forma
values (125, 94, 31);
insert into pokemon_movimiento_forma
values (125, 72, 32);
insert into pokemon_movimiento_forma
values (125, 143, 33);
insert into pokemon_movimiento_forma
values (125, 118, 34);
insert into pokemon_movimiento_forma
values (125, 93, 35);
insert into pokemon_movimiento_forma
values (125, 19, 39);
insert into pokemon_movimiento_forma
values (125, 58, 40);
insert into pokemon_movimiento_forma
values (125, 135, 44);
insert into pokemon_movimiento_forma
values (125, 18, 45);
insert into pokemon_movimiento_forma
values (125, 140, 46);
insert into pokemon_movimiento_forma
values (125, 114, 50);
insert into pokemon_movimiento_forma
values (125, 78, 54);
insert into pokemon_movimiento_forma
values (125, 69, 55);

insert into pokemon_movimiento_forma
values (126, 26, 56);
insert into pokemon_movimiento_forma
values (126, 90, 78);
insert into pokemon_movimiento_forma
values (126, 24, 83);
insert into pokemon_movimiento_forma
values (126, 30, 69);
insert into pokemon_movimiento_forma
values (126, 96, 63);
insert into pokemon_movimiento_forma
values (126, 156, 85);
insert into pokemon_movimiento_forma
values (126, 28, 70);
insert into pokemon_movimiento_forma
values (126, 92, 1);
insert into pokemon_movimiento_forma
values (126, 91, 5);
insert into pokemon_movimiento_forma
values (126, 159, 6);
insert into pokemon_movimiento_forma
values (126, 82, 8);
insert into pokemon_movimiento_forma
values (126, 66, 9);
insert into pokemon_movimiento_forma
values (126, 73, 10);
insert into pokemon_movimiento_forma
values (126, 88, 15);
insert into pokemon_movimiento_forma
values (126, 44, 17);
insert into pokemon_movimiento_forma
values (126, 37, 18);
insert into pokemon_movimiento_forma
values (126, 39, 19);
insert into pokemon_movimiento_forma
values (126, 79, 20);
insert into pokemon_movimiento_forma
values (126, 142, 29);
insert into pokemon_movimiento_forma
values (126, 144, 30);
insert into pokemon_movimiento_forma
values (126, 94, 31);
insert into pokemon_movimiento_forma
values (126, 72, 32);
insert into pokemon_movimiento_forma
values (126, 118, 34);
insert into pokemon_movimiento_forma
values (126, 93, 35);
insert into pokemon_movimiento_forma
values (126, 29, 38);
insert into pokemon_movimiento_forma
values (126, 58, 40);
insert into pokemon_movimiento_forma
values (126, 135, 44);
insert into pokemon_movimiento_forma
values (126, 140, 46);
insert into pokemon_movimiento_forma
values (126, 114, 50);
insert into pokemon_movimiento_forma
values (126, 78, 54);

insert into pokemon_movimiento_forma
values (127, 46, 56);
insert into pokemon_movimiento_forma
values (127, 39, 92);
insert into pokemon_movimiento_forma
values (127, 86, 65);
insert into pokemon_movimiento_forma
values (127, 76, 78);
insert into pokemon_movimiento_forma
values (127, 77, 69);
insert into pokemon_movimiento_forma
values (127, 65, 97);
insert into pokemon_movimiento_forma
values (127, 2, 68);
insert into pokemon_movimiento_forma
values (127, 2, 3);
insert into pokemon_movimiento_forma
values (127, 159, 6);
insert into pokemon_movimiento_forma
values (127, 82, 8);
insert into pokemon_movimiento_forma
values (127, 66, 9);
insert into pokemon_movimiento_forma
values (127, 73, 10);
insert into pokemon_movimiento_forma
values (127, 88, 15);
insert into pokemon_movimiento_forma
values (127, 44, 17);
insert into pokemon_movimiento_forma
values (127, 39, 19);
insert into pokemon_movimiento_forma
values (127, 79, 20);
insert into pokemon_movimiento_forma
values (127, 94, 31);
insert into pokemon_movimiento_forma
values (127, 72, 32);
insert into pokemon_movimiento_forma
values (127, 118, 34);
insert into pokemon_movimiento_forma
values (127, 135, 44);
insert into pokemon_movimiento_forma
values (127, 114, 50);
insert into pokemon_movimiento_forma
values (127, 64, 51);
insert into pokemon_movimiento_forma
values (127, 78, 54);

insert into pokemon_movimiento_forma
values (128, 1, 56);
insert into pokemon_movimiento_forma
values (128, 98, 56);
insert into pokemon_movimiento_forma
values (128, 89, 80);
insert into pokemon_movimiento_forma
values (128, 90, 81);
insert into pokemon_movimiento_forma
values (128, 79, 95);
insert into pokemon_movimiento_forma
values (128, 66, 104);
insert into pokemon_movimiento_forma
values (128, 159, 6);
insert into pokemon_movimiento_forma
values (128, 97, 7);
insert into pokemon_movimiento_forma
values (128, 82, 8);
insert into pokemon_movimiento_forma
values (128, 66, 9);
insert into pokemon_movimiento_forma
values (128, 73, 10);
insert into pokemon_movimiento_forma
values (128, 35, 13);
insert into pokemon_movimiento_forma
values (128, 36, 14);
insert into pokemon_movimiento_forma
values (128, 88, 15);
insert into pokemon_movimiento_forma
values (128, 79, 20);
insert into pokemon_movimiento_forma
values (128, 20, 24);
insert into pokemon_movimiento_forma
values (128, 21, 25);
insert into pokemon_movimiento_forma
values (128, 151, 26);
insert into pokemon_movimiento_forma
values (128, 148, 27);
insert into pokemon_movimiento_forma
values (128, 94, 31);
insert into pokemon_movimiento_forma
values (128, 72, 32);
insert into pokemon_movimiento_forma
values (128, 118, 34);
insert into pokemon_movimiento_forma
values (128, 29, 38);
insert into pokemon_movimiento_forma
values (128, 58, 40);
insert into pokemon_movimiento_forma
values (128, 135, 44);
insert into pokemon_movimiento_forma
values (128, 114, 50);
insert into pokemon_movimiento_forma
values (128, 78, 54);

insert into pokemon_movimiento_forma
values (129, 111, 56);
insert into pokemon_movimiento_forma
values (129, 1, 73);

insert into pokemon_movimiento_forma
values (130, 95, 56);
insert into pokemon_movimiento_forma
values (130, 16, 56);
insert into pokemon_movimiento_forma
values (130, 90, 56);
insert into pokemon_movimiento_forma
values (130, 5, 56);
insert into pokemon_movimiento_forma
values (130, 95, 59);
insert into pokemon_movimiento_forma
values (130, 16, 92);
insert into pokemon_movimiento_forma
values (130, 90, 91);
insert into pokemon_movimiento_forma
values (130, 5, 62);
insert into pokemon_movimiento_forma
values (130, 88, 85);
insert into pokemon_movimiento_forma
values (130, 159, 6);
insert into pokemon_movimiento_forma
values (130, 82, 8);
insert into pokemon_movimiento_forma
values (130, 66, 9);
insert into pokemon_movimiento_forma
values (130, 73, 10);
insert into pokemon_movimiento_forma
values (130, 8, 11);
insert into pokemon_movimiento_forma
values (130, 7, 12);
insert into pokemon_movimiento_forma
values (130, 35, 13);
insert into pokemon_movimiento_forma
values (130, 36, 14);
insert into pokemon_movimiento_forma
values (130, 88, 15);
insert into pokemon_movimiento_forma
values (130, 79, 20);
insert into pokemon_movimiento_forma
values (130, 16, 23);
insert into pokemon_movimiento_forma
values (130, 20, 24);
insert into pokemon_movimiento_forma
values (130, 21, 25);
insert into pokemon_movimiento_forma
values (130, 94, 31);
insert into pokemon_movimiento_forma
values (130, 72, 32);
insert into pokemon_movimiento_forma
values (130, 143, 33);
insert into pokemon_movimiento_forma
values (130, 118, 34);
insert into pokemon_movimiento_forma
values (130, 29, 38);
insert into pokemon_movimiento_forma
values (130, 58, 40);
insert into pokemon_movimiento_forma
values (130, 135, 44);
insert into pokemon_movimiento_forma
values (130, 114, 50);
insert into pokemon_movimiento_forma
values (130, 10, 53);
insert into pokemon_movimiento_forma
values (130, 78, 54);

insert into pokemon_movimiento_forma
values (131, 85, 56);
insert into pokemon_movimiento_forma
values (131, 7, 56);
insert into pokemon_movimiento_forma
values (131, 59, 87);
insert into pokemon_movimiento_forma
values (131, 31, 59);
insert into pokemon_movimiento_forma
values (131, 82, 92);
insert into pokemon_movimiento_forma
values (131, 24, 82);
insert into pokemon_movimiento_forma
values (131, 35, 66);
insert into pokemon_movimiento_forma
values (131, 5, 67);
insert into pokemon_movimiento_forma
values (131, 159, 6);
insert into pokemon_movimiento_forma
values (131, 97, 7);
insert into pokemon_movimiento_forma
values (131, 82, 8);
insert into pokemon_movimiento_forma
values (131, 66, 9);
insert into pokemon_movimiento_forma
values (131, 73, 10);
insert into pokemon_movimiento_forma
values (131, 8, 11);
insert into pokemon_movimiento_forma
values (131, 7, 12);
insert into pokemon_movimiento_forma
values (131, 35, 13);
insert into pokemon_movimiento_forma
values (131, 36, 14);
insert into pokemon_movimiento_forma
values (131, 88, 15);
insert into pokemon_movimiento_forma
values (131, 79, 20);
insert into pokemon_movimiento_forma
values (131, 128, 22);
insert into pokemon_movimiento_forma
values (131, 16, 23);
insert into pokemon_movimiento_forma
values (131, 20, 24);
insert into pokemon_movimiento_forma
values (131, 21, 25);
insert into pokemon_movimiento_forma
values (131, 142, 29);
insert into pokemon_movimiento_forma
values (131, 94, 31);
insert into pokemon_movimiento_forma
values (131, 72, 32);
insert into pokemon_movimiento_forma
values (131, 143, 33);
insert into pokemon_movimiento_forma
values (131, 118, 34);
insert into pokemon_movimiento_forma
values (131, 58, 40);
insert into pokemon_movimiento_forma
values (131, 135, 44);
insert into pokemon_movimiento_forma
values (131, 140, 46);
insert into pokemon_movimiento_forma
values (131, 114, 50);
insert into pokemon_movimiento_forma
values (131, 10, 53);
insert into pokemon_movimiento_forma
values (131, 78, 54);

insert into pokemon_movimiento_forma
values (132, 116, 56);

insert into pokemon_movimiento_forma
values (133, 1, 56);
insert into pokemon_movimiento_forma
values (133, 51, 56);
insert into pokemon_movimiento_forma
values (133, 53, 60);
insert into pokemon_movimiento_forma
values (133, 89, 82);
insert into pokemon_movimiento_forma
values (133, 95, 103);
insert into pokemon_movimiento_forma
values (133, 66, 107);
insert into pokemon_movimiento_forma
values (133, 159, 6);
insert into pokemon_movimiento_forma
values (133, 82, 8);
insert into pokemon_movimiento_forma
values (133, 66, 9);
insert into pokemon_movimiento_forma
values (133, 73, 10);
insert into pokemon_movimiento_forma
values (133, 79, 20);
insert into pokemon_movimiento_forma
values (133, 94, 31);
insert into pokemon_movimiento_forma
values (133, 72, 32);
insert into pokemon_movimiento_forma
values (133, 143, 33);
insert into pokemon_movimiento_forma
values (133, 118, 34);
insert into pokemon_movimiento_forma
values (133, 19, 39);
insert into pokemon_movimiento_forma
values (133, 58, 40);
insert into pokemon_movimiento_forma
values (133, 135, 44);
insert into pokemon_movimiento_forma
values (133, 114, 50);

insert into pokemon_movimiento_forma
values (134, 1, 56);
insert into pokemon_movimiento_forma
values (134, 53, 56);
insert into pokemon_movimiento_forma
values (134, 7, 56);
insert into pokemon_movimiento_forma
values (134, 51, 56);
insert into pokemon_movimiento_forma
values (134, 53, 60);
insert into pokemon_movimiento_forma
values (134, 7, 82);
insert into pokemon_movimiento_forma
values (134, 89, 103);
insert into pokemon_movimiento_forma
values (134, 95, 96);
insert into pokemon_movimiento_forma
values (134, 153, 76);
insert into pokemon_movimiento_forma
values (134, 32, 95);
insert into pokemon_movimiento_forma
values (134, 31, 63);
insert into pokemon_movimiento_forma
values (134, 5, 68);
insert into pokemon_movimiento_forma
values (134, 159, 6);
insert into pokemon_movimiento_forma
values (134, 82, 8);
insert into pokemon_movimiento_forma
values (134, 66, 9);
insert into pokemon_movimiento_forma
values (134, 73, 10);
insert into pokemon_movimiento_forma
values (134, 8, 11);
insert into pokemon_movimiento_forma
values (134, 7, 12);
insert into pokemon_movimiento_forma
values (134, 35, 13);
insert into pokemon_movimiento_forma
values (134, 36, 14);
insert into pokemon_movimiento_forma
values (134, 88, 15);
insert into pokemon_movimiento_forma
values (134, 79, 20);
insert into pokemon_movimiento_forma
values (134, 94, 31);
insert into pokemon_movimiento_forma
values (134, 72, 32);
insert into pokemon_movimiento_forma
values (134, 143, 33);
insert into pokemon_movimiento_forma
values (134, 118, 34);
insert into pokemon_movimiento_forma
values (134, 19, 39);
insert into pokemon_movimiento_forma
values (134, 58, 40);
insert into pokemon_movimiento_forma
values (134, 135, 44);
insert into pokemon_movimiento_forma
values (134, 114, 50);
insert into pokemon_movimiento_forma
values (134, 10, 53);

insert into pokemon_movimiento_forma
values (135, 1, 56);
insert into pokemon_movimiento_forma
values (135, 53, 56);
insert into pokemon_movimiento_forma
values (135, 17, 56);
insert into pokemon_movimiento_forma
values (135, 51, 56);
insert into pokemon_movimiento_forma
values (135, 53, 60);
insert into pokemon_movimiento_forma
values (135, 17, 82);
insert into pokemon_movimiento_forma
values (135, 89, 103);
insert into pokemon_movimiento_forma
values (135, 18, 96);
insert into pokemon_movimiento_forma
values (135, 38, 76);
insert into pokemon_movimiento_forma
values (135, 130, 95);
insert into pokemon_movimiento_forma
values (135, 15, 63);
insert into pokemon_movimiento_forma
values (135, 21, 68);
insert into pokemon_movimiento_forma
values (135, 159, 6);
insert into pokemon_movimiento_forma
values (135, 82, 8);
insert into pokemon_movimiento_forma
values (135, 66, 9);
insert into pokemon_movimiento_forma
values (135, 73, 10);
insert into pokemon_movimiento_forma
values (135, 88, 15);
insert into pokemon_movimiento_forma
values (135, 79, 20);
insert into pokemon_movimiento_forma
values (135, 20, 24);
insert into pokemon_movimiento_forma
values (135, 21, 25);
insert into pokemon_movimiento_forma
values (135, 94, 31);
insert into pokemon_movimiento_forma
values (135, 72, 32);
insert into pokemon_movimiento_forma
values (135, 143, 33);
insert into pokemon_movimiento_forma
values (135, 118, 34);
insert into pokemon_movimiento_forma
values (135, 19, 39);
insert into pokemon_movimiento_forma
values (135, 58, 40);
insert into pokemon_movimiento_forma
values (135, 135, 44);
insert into pokemon_movimiento_forma
values (135, 18, 45);
insert into pokemon_movimiento_forma
values (135, 114, 50);
insert into pokemon_movimiento_forma
values (135, 69, 55);

insert into pokemon_movimiento_forma
values (136, 1, 56);
insert into pokemon_movimiento_forma
values (136, 53, 56);
insert into pokemon_movimiento_forma
values (136, 26, 56);
insert into pokemon_movimiento_forma
values (136, 51, 56);
insert into pokemon_movimiento_forma
values (136, 53, 60);
insert into pokemon_movimiento_forma
values (136, 26, 82);
insert into pokemon_movimiento_forma
values (136, 89, 103);
insert into pokemon_movimiento_forma
values (136, 95, 96);
insert into pokemon_movimiento_forma
values (136, 90, 76);
insert into pokemon_movimiento_forma
values (136, 27, 95);
insert into pokemon_movimiento_forma
values (136, 79, 63);
insert into pokemon_movimiento_forma
values (136, 28, 68);
insert into pokemon_movimiento_forma
values (136, 159, 6);
insert into pokemon_movimiento_forma
values (136, 82, 8);
insert into pokemon_movimiento_forma
values (136, 66, 9);
insert into pokemon_movimiento_forma
values (136, 73, 10);
insert into pokemon_movimiento_forma
values (136, 88, 15);
insert into pokemon_movimiento_forma
values (136, 79, 20);
insert into pokemon_movimiento_forma
values (136, 94, 31);
insert into pokemon_movimiento_forma
values (136, 72, 32);
insert into pokemon_movimiento_forma
values (136, 143, 33);
insert into pokemon_movimiento_forma
values (136, 118, 34);
insert into pokemon_movimiento_forma
values (136, 29, 38);
insert into pokemon_movimiento_forma
values (136, 19, 39);
insert into pokemon_movimiento_forma
values (136, 58, 40);
insert into pokemon_movimiento_forma
values (136, 135, 44);
insert into pokemon_movimiento_forma
values (136, 114, 50);

insert into pokemon_movimiento_forma
values (137, 1, 56);
insert into pokemon_movimiento_forma
values (137, 62, 56);
insert into pokemon_movimiento_forma
values (137, 45, 56);
insert into pokemon_movimiento_forma
values (137, 141, 99);
insert into pokemon_movimiento_forma
values (137, 104, 80);
insert into pokemon_movimiento_forma
values (137, 130, 81);
insert into pokemon_movimiento_forma
values (137, 117, 76);
insert into pokemon_movimiento_forma
values (137, 159, 6);
insert into pokemon_movimiento_forma
values (137, 66, 9);
insert into pokemon_movimiento_forma
values (137, 73, 10);
insert into pokemon_movimiento_forma
values (137, 35, 13);
insert into pokemon_movimiento_forma
values (137, 36, 14);
insert into pokemon_movimiento_forma
values (137, 88, 15);
insert into pokemon_movimiento_forma
values (137, 79, 20);
insert into pokemon_movimiento_forma
values (137, 20, 24);
insert into pokemon_movimiento_forma
values (137, 21, 25);
insert into pokemon_movimiento_forma
values (137, 142, 29);
insert into pokemon_movimiento_forma
values (137, 144, 30);
insert into pokemon_movimiento_forma
values (137, 94, 31);
insert into pokemon_movimiento_forma
values (137, 72, 32);
insert into pokemon_movimiento_forma
values (137, 143, 33);
insert into pokemon_movimiento_forma
values (137, 118, 34);
insert into pokemon_movimiento_forma
values (137, 19, 39);
insert into pokemon_movimiento_forma
values (137, 58, 40);
insert into pokemon_movimiento_forma
values (137, 135, 44);
insert into pokemon_movimiento_forma
values (137, 18, 45);
insert into pokemon_movimiento_forma
values (137, 140, 46);
insert into pokemon_movimiento_forma
values (137, 117, 49);
insert into pokemon_movimiento_forma
values (137, 114, 50);
insert into pokemon_movimiento_forma
values (137, 69, 55);

insert into pokemon_movimiento_forma
values (138, 7, 56);
insert into pokemon_movimiento_forma
values (138, 9, 56);
insert into pokemon_movimiento_forma
values (138, 63, 61);
insert into pokemon_movimiento_forma
values (138, 90, 83);
insert into pokemon_movimiento_forma
values (138, 61, 67);
insert into pokemon_movimiento_forma
values (138, 5, 109);
insert into pokemon_movimiento_forma
values (138, 159, 6);
insert into pokemon_movimiento_forma
values (138, 82, 8);
insert into pokemon_movimiento_forma
values (138, 66, 9);
insert into pokemon_movimiento_forma
values (138, 73, 10);
insert into pokemon_movimiento_forma
values (138, 8, 11);
insert into pokemon_movimiento_forma
values (138, 7, 12);
insert into pokemon_movimiento_forma
values (138, 35, 13);
insert into pokemon_movimiento_forma
values (138, 36, 14);
insert into pokemon_movimiento_forma
values (138, 79, 20);
insert into pokemon_movimiento_forma
values (138, 94, 31);
insert into pokemon_movimiento_forma
values (138, 72, 32);
insert into pokemon_movimiento_forma
values (138, 143, 33);
insert into pokemon_movimiento_forma
values (138, 118, 34);
insert into pokemon_movimiento_forma
values (138, 135, 44);
insert into pokemon_movimiento_forma
values (138, 114, 50);
insert into pokemon_movimiento_forma
values (138, 10, 53);

insert into pokemon_movimiento_forma
values (139, 7, 56);
insert into pokemon_movimiento_forma
values (139, 9, 56);
insert into pokemon_movimiento_forma
values (139, 63, 61);
insert into pokemon_movimiento_forma
values (139, 90, 83);
insert into pokemon_movimiento_forma
values (139, 61, 95);
insert into pokemon_movimiento_forma
values (139, 5, 97);
insert into pokemon_movimiento_forma
values (139, 159, 6);
insert into pokemon_movimiento_forma
values (139, 97, 7);
insert into pokemon_movimiento_forma
values (139, 82, 8);
insert into pokemon_movimiento_forma
values (139, 66, 9);
insert into pokemon_movimiento_forma
values (139, 73, 10);
insert into pokemon_movimiento_forma
values (139, 8, 11);
insert into pokemon_movimiento_forma
values (139, 7, 12);
insert into pokemon_movimiento_forma
values (139, 35, 13);
insert into pokemon_movimiento_forma
values (139, 36, 14);
insert into pokemon_movimiento_forma
values (139, 88, 15);
insert into pokemon_movimiento_forma
values (139, 44, 17);
insert into pokemon_movimiento_forma
values (139, 39, 19);
insert into pokemon_movimiento_forma
values (139, 79, 20);
insert into pokemon_movimiento_forma
values (139, 94, 31);
insert into pokemon_movimiento_forma
values (139, 72, 32);
insert into pokemon_movimiento_forma
values (139, 143, 33);
insert into pokemon_movimiento_forma
values (139, 118, 34);
insert into pokemon_movimiento_forma
values (139, 58, 40);
insert into pokemon_movimiento_forma
values (139, 135, 44);
insert into pokemon_movimiento_forma
values (139, 114, 50);
insert into pokemon_movimiento_forma
values (139, 10, 53);

insert into pokemon_movimiento_forma
values (140, 49, 56);
insert into pokemon_movimiento_forma
values (140, 77, 56);
insert into pokemon_movimiento_forma
values (140, 120, 61);
insert into pokemon_movimiento_forma
values (140, 65, 83);
insert into pokemon_movimiento_forma
values (140, 90, 95);
insert into pokemon_movimiento_forma
values (140, 5, 97);
insert into pokemon_movimiento_forma
values (140, 159, 6);
insert into pokemon_movimiento_forma
values (140, 82, 8);
insert into pokemon_movimiento_forma
values (140, 66, 9);
insert into pokemon_movimiento_forma
values (140, 73, 10);
insert into pokemon_movimiento_forma
values (140, 8, 11);
insert into pokemon_movimiento_forma
values (140, 7, 12);
insert into pokemon_movimiento_forma
values (140, 35, 13);
insert into pokemon_movimiento_forma
values (140, 36, 14);
insert into pokemon_movimiento_forma
values (140, 88, 15);
insert into pokemon_movimiento_forma
values (140, 44, 17);
insert into pokemon_movimiento_forma
values (140, 39, 19);
insert into pokemon_movimiento_forma
values (140, 79, 20);
insert into pokemon_movimiento_forma
values (140, 94, 31);
insert into pokemon_movimiento_forma
values (140, 72, 32);
insert into pokemon_movimiento_forma
values (140, 143, 33);
insert into pokemon_movimiento_forma
values (140, 118, 34);
insert into pokemon_movimiento_forma
values (140, 58, 40);
insert into pokemon_movimiento_forma
values (140, 135, 44);
insert into pokemon_movimiento_forma
values (140, 114, 50);
insert into pokemon_movimiento_forma
values (140, 10, 53);

insert into pokemon_movimiento_forma
values (141, 65, 56);
insert into pokemon_movimiento_forma
values (141, 49, 56);
insert into pokemon_movimiento_forma
values (141, 120, 56);
insert into pokemon_movimiento_forma
values (141, 77, 56);
insert into pokemon_movimiento_forma
values (141, 90, 67);
insert into pokemon_movimiento_forma
values (141, 5, 109);
insert into pokemon_movimiento_forma
values (141, 119, 2);
insert into pokemon_movimiento_forma
values (141, 2, 3);
insert into pokemon_movimiento_forma
values (141, 91, 5);
insert into pokemon_movimiento_forma
values (141, 159, 6);
insert into pokemon_movimiento_forma
values (141, 82, 8);
insert into pokemon_movimiento_forma
values (141, 66, 9);
insert into pokemon_movimiento_forma
values (141, 73, 10);
insert into pokemon_movimiento_forma
values (141, 8, 11);
insert into pokemon_movimiento_forma
values (141, 7, 12);
insert into pokemon_movimiento_forma
values (141, 35, 13);
insert into pokemon_movimiento_forma
values (141, 36, 14);
insert into pokemon_movimiento_forma
values (141, 88, 15);
insert into pokemon_movimiento_forma
values (141, 44, 17);
insert into pokemon_movimiento_forma
values (141, 39, 19);
insert into pokemon_movimiento_forma
values (141, 79, 20);
insert into pokemon_movimiento_forma
values (141, 94, 31);
insert into pokemon_movimiento_forma
values (141, 72, 32);
insert into pokemon_movimiento_forma
values (141, 143, 33);
insert into pokemon_movimiento_forma
values (141, 118, 34);
insert into pokemon_movimiento_forma
values (141, 58, 40);
insert into pokemon_movimiento_forma
values (141, 135, 44);
insert into pokemon_movimiento_forma
values (141, 114, 50);
insert into pokemon_movimiento_forma
values (141, 64, 51);
insert into pokemon_movimiento_forma
values (141, 10, 53);

insert into pokemon_movimiento_forma
values (142, 161, 56);
insert into pokemon_movimiento_forma
values (142, 130, 56);
insert into pokemon_movimiento_forma
values (142, 113, 75);
insert into pokemon_movimiento_forma
values (142, 95, 66);
insert into pokemon_movimiento_forma
values (142, 66, 107);
insert into pokemon_movimiento_forma
values (142, 88, 68);
insert into pokemon_movimiento_forma
values (142, 119, 2);
insert into pokemon_movimiento_forma
values (142, 106, 4);
insert into pokemon_movimiento_forma
values (142, 159, 6);
insert into pokemon_movimiento_forma
values (142, 66, 9);
insert into pokemon_movimiento_forma
values (142, 73, 10);
insert into pokemon_movimiento_forma
values (142, 88, 15);
insert into pokemon_movimiento_forma
values (142, 79, 20);
insert into pokemon_movimiento_forma
values (142, 16, 23);
insert into pokemon_movimiento_forma
values (142, 94, 31);
insert into pokemon_movimiento_forma
values (142, 72, 32);
insert into pokemon_movimiento_forma
values (142, 143, 33);
insert into pokemon_movimiento_forma
values (142, 118, 34);
insert into pokemon_movimiento_forma
values (142, 29, 38);
insert into pokemon_movimiento_forma
values (142, 19, 39);
insert into pokemon_movimiento_forma
values (142, 160, 43);
insert into pokemon_movimiento_forma
values (142, 135, 44);
insert into pokemon_movimiento_forma
values (142, 114, 50);
insert into pokemon_movimiento_forma
values (142, 166, 52);

insert into pokemon_movimiento_forma
values (143, 1, 56);
insert into pokemon_movimiento_forma
values (143, 131, 56);
insert into pokemon_movimiento_forma
values (143, 135, 56);
insert into pokemon_movimiento_forma
values (143, 82, 81);
insert into pokemon_movimiento_forma
values (143, 77, 62);
insert into pokemon_movimiento_forma
values (143, 73, 63);
insert into pokemon_movimiento_forma
values (143, 88, 77);
insert into pokemon_movimiento_forma
values (143, 92, 1);
insert into pokemon_movimiento_forma
values (143, 91, 5);
insert into pokemon_movimiento_forma
values (143, 159, 6);
insert into pokemon_movimiento_forma
values (143, 82, 8);
insert into pokemon_movimiento_forma
values (143, 66, 9);
insert into pokemon_movimiento_forma
values (143, 73, 10);
insert into pokemon_movimiento_forma
values (143, 8, 11);
insert into pokemon_movimiento_forma
values (143, 7, 12);
insert into pokemon_movimiento_forma
values (143, 35, 13);
insert into pokemon_movimiento_forma
values (143, 36, 14);
insert into pokemon_movimiento_forma
values (143, 88, 15);
insert into pokemon_movimiento_forma
values (143, 71, 16);
insert into pokemon_movimiento_forma
values (143, 44, 17);
insert into pokemon_movimiento_forma
values (143, 37, 18);
insert into pokemon_movimiento_forma
values (143, 39, 19);
insert into pokemon_movimiento_forma
values (143, 79, 20);
insert into pokemon_movimiento_forma
values (143, 128, 22);
insert into pokemon_movimiento_forma
values (143, 20, 24);
insert into pokemon_movimiento_forma
values (143, 21, 25);
insert into pokemon_movimiento_forma
values (143, 151, 26);
insert into pokemon_movimiento_forma
values (143, 148, 27);
insert into pokemon_movimiento_forma
values (143, 142, 29);
insert into pokemon_movimiento_forma
values (143, 94, 31);
insert into pokemon_movimiento_forma
values (143, 72, 32);
insert into pokemon_movimiento_forma
values (143, 143, 33);
insert into pokemon_movimiento_forma
values (143, 118, 34);
insert into pokemon_movimiento_forma
values (143, 93, 35);
insert into pokemon_movimiento_forma
values (143, 54, 36);
insert into pokemon_movimiento_forma
values (143, 29, 38);
insert into pokemon_movimiento_forma
values (143, 58, 40);
insert into pokemon_movimiento_forma
values (143, 135, 44);
insert into pokemon_movimiento_forma
values (143, 140, 46);
insert into pokemon_movimiento_forma
values (143, 145, 48);
insert into pokemon_movimiento_forma
values (143, 114, 50);
insert into pokemon_movimiento_forma
values (143, 10, 53);
insert into pokemon_movimiento_forma
values (143, 78, 54);

insert into pokemon_movimiento_forma
values (144, 165, 56);
insert into pokemon_movimiento_forma
values (144, 35, 56);
insert into pokemon_movimiento_forma
values (144, 36, 104);
insert into pokemon_movimiento_forma
values (144, 130, 70);
insert into pokemon_movimiento_forma
values (144, 31, 110);
insert into pokemon_movimiento_forma
values (144, 119, 2);
insert into pokemon_movimiento_forma
values (144, 106, 4);
insert into pokemon_movimiento_forma
values (144, 159, 6);
insert into pokemon_movimiento_forma
values (144, 66, 9);
insert into pokemon_movimiento_forma
values (144, 73, 10);
insert into pokemon_movimiento_forma
values (144, 8, 11);
insert into pokemon_movimiento_forma
values (144, 7, 12);
insert into pokemon_movimiento_forma
values (144, 35, 13);
insert into pokemon_movimiento_forma
values (144, 36, 14);
insert into pokemon_movimiento_forma
values (144, 88, 15);
insert into pokemon_movimiento_forma
values (144, 79, 20);
insert into pokemon_movimiento_forma
values (144, 94, 31);
insert into pokemon_movimiento_forma
values (144, 72, 32);
insert into pokemon_movimiento_forma
values (144, 143, 33);
insert into pokemon_movimiento_forma
values (144, 118, 34);
insert into pokemon_movimiento_forma
values (144, 19, 39);
insert into pokemon_movimiento_forma
values (144, 160, 43);
insert into pokemon_movimiento_forma
values (144, 135, 44);
insert into pokemon_movimiento_forma
values (144, 114, 50);
insert into pokemon_movimiento_forma
values (144, 166, 52);

insert into pokemon_movimiento_forma
values (145, 164, 56);
insert into pokemon_movimiento_forma
values (145, 17, 56);
insert into pokemon_movimiento_forma
values (145, 21, 104);
insert into pokemon_movimiento_forma
values (145, 130, 70);
insert into pokemon_movimiento_forma
values (145, 139, 110);
insert into pokemon_movimiento_forma
values (145, 119, 2);
insert into pokemon_movimiento_forma
values (145, 106, 4);
insert into pokemon_movimiento_forma
values (145, 159, 6);
insert into pokemon_movimiento_forma
values (145, 66, 9);
insert into pokemon_movimiento_forma
values (145, 73, 10);
insert into pokemon_movimiento_forma
values (145, 88, 15);
insert into pokemon_movimiento_forma
values (145, 79, 20);
insert into pokemon_movimiento_forma
values (145, 20, 24);
insert into pokemon_movimiento_forma
values (145, 21, 25);
insert into pokemon_movimiento_forma
values (145, 94, 31);
insert into pokemon_movimiento_forma
values (145, 72, 32);
insert into pokemon_movimiento_forma
values (145, 143, 33);
insert into pokemon_movimiento_forma
values (145, 118, 34);
insert into pokemon_movimiento_forma
values (145, 19, 39);
insert into pokemon_movimiento_forma
values (145, 160, 43);
insert into pokemon_movimiento_forma
values (145, 135, 44);
insert into pokemon_movimiento_forma
values (145, 18, 45);
insert into pokemon_movimiento_forma
values (145, 114, 50);
insert into pokemon_movimiento_forma
values (145, 166, 52);
insert into pokemon_movimiento_forma
values (145, 69, 55);

insert into pokemon_movimiento_forma
values (146, 165, 56);
insert into pokemon_movimiento_forma
values (146, 27, 56);
insert into pokemon_movimiento_forma
values (146, 90, 104);
insert into pokemon_movimiento_forma
values (146, 160, 110);
insert into pokemon_movimiento_forma
values (146, 29, 38);
insert into pokemon_movimiento_forma
values (146, 166, 52);

insert into pokemon_movimiento_forma
values (147, 107, 56);
insert into pokemon_movimiento_forma
values (147, 90, 56);
insert into pokemon_movimiento_forma
values (147, 18, 101);
insert into pokemon_movimiento_forma
values (147, 130, 59);
insert into pokemon_movimiento_forma
values (147, 100, 65);
insert into pokemon_movimiento_forma
values (147, 16, 96);
insert into pokemon_movimiento_forma
values (147, 88, 102);
insert into pokemon_movimiento_forma
values (147, 159, 6);
insert into pokemon_movimiento_forma
values (147, 82, 8);
insert into pokemon_movimiento_forma
values (147, 66, 9);
insert into pokemon_movimiento_forma
values (147, 73, 10);
insert into pokemon_movimiento_forma
values (147, 8, 11);
insert into pokemon_movimiento_forma
values (147, 7, 12);
insert into pokemon_movimiento_forma
values (147, 35, 13);
insert into pokemon_movimiento_forma
values (147, 36, 14);
insert into pokemon_movimiento_forma
values (147, 79, 20);
insert into pokemon_movimiento_forma
values (147, 16, 23);
insert into pokemon_movimiento_forma
values (147, 20, 24);
insert into pokemon_movimiento_forma
values (147, 21, 25);
insert into pokemon_movimiento_forma
values (147, 94, 31);
insert into pokemon_movimiento_forma
values (147, 72, 32);
insert into pokemon_movimiento_forma
values (147, 143, 33);
insert into pokemon_movimiento_forma
values (147, 118, 34);
insert into pokemon_movimiento_forma
values (147, 29, 38);
insert into pokemon_movimiento_forma
values (147, 19, 39);
insert into pokemon_movimiento_forma
values (147, 58, 40);
insert into pokemon_movimiento_forma
values (147, 135, 44);
insert into pokemon_movimiento_forma
values (147, 18, 45);
insert into pokemon_movimiento_forma
values (147, 114, 50);
insert into pokemon_movimiento_forma
values (147, 10, 53);

insert into pokemon_movimiento_forma
values (148, 107, 56);
insert into pokemon_movimiento_forma
values (148, 90, 56);
insert into pokemon_movimiento_forma
values (148, 18, 101);
insert into pokemon_movimiento_forma
values (148, 18, 56);
insert into pokemon_movimiento_forma
values (148, 130, 59);
insert into pokemon_movimiento_forma
values (148, 100, 81);
insert into pokemon_movimiento_forma
values (148, 16, 107);
insert into pokemon_movimiento_forma
values (148, 88, 70);
insert into pokemon_movimiento_forma
values (148, 159, 6);
insert into pokemon_movimiento_forma
values (148, 97, 7);
insert into pokemon_movimiento_forma
values (148, 82, 8);
insert into pokemon_movimiento_forma
values (148, 66, 9);
insert into pokemon_movimiento_forma
values (148, 73, 10);
insert into pokemon_movimiento_forma
values (148, 8, 11);
insert into pokemon_movimiento_forma
values (148, 7, 12);
insert into pokemon_movimiento_forma
values (148, 35, 13);
insert into pokemon_movimiento_forma
values (148, 36, 14);
insert into pokemon_movimiento_forma
values (148, 79, 20);
insert into pokemon_movimiento_forma
values (148, 16, 23);
insert into pokemon_movimiento_forma
values (148, 20, 24);
insert into pokemon_movimiento_forma
values (148, 21, 25);
insert into pokemon_movimiento_forma
values (148, 94, 31);
insert into pokemon_movimiento_forma
values (148, 72, 32);
insert into pokemon_movimiento_forma
values (148, 143, 33);
insert into pokemon_movimiento_forma
values (148, 118, 34);
insert into pokemon_movimiento_forma
values (148, 29, 38);
insert into pokemon_movimiento_forma
values (148, 19, 39);
insert into pokemon_movimiento_forma
values (148, 58, 40);
insert into pokemon_movimiento_forma
values (148, 135, 44);
insert into pokemon_movimiento_forma
values (148, 18, 45);
insert into pokemon_movimiento_forma
values (148, 114, 50);
insert into pokemon_movimiento_forma
values (148, 10, 53);

insert into pokemon_movimiento_forma
values (149, 107, 56);
insert into pokemon_movimiento_forma
values (149, 90, 56);
insert into pokemon_movimiento_forma
values (149, 18, 56);
insert into pokemon_movimiento_forma
values (149, 18, 101);
insert into pokemon_movimiento_forma
values (149, 130, 56);
insert into pokemon_movimiento_forma
values (149, 130, 59);
insert into pokemon_movimiento_forma
values (149, 100, 81);
insert into pokemon_movimiento_forma
values (149, 16, 107);
insert into pokemon_movimiento_forma
values (149, 88, 110);
insert into pokemon_movimiento_forma
values (149, 119, 2);
insert into pokemon_movimiento_forma
values (149, 159, 6);
insert into pokemon_movimiento_forma
values (149, 97, 7);
insert into pokemon_movimiento_forma
values (149, 82, 8);
insert into pokemon_movimiento_forma
values (149, 66, 9);
insert into pokemon_movimiento_forma
values (149, 73, 10);
insert into pokemon_movimiento_forma
values (149, 8, 11);
insert into pokemon_movimiento_forma
values (149, 7, 12);
insert into pokemon_movimiento_forma
values (149, 35, 13);
insert into pokemon_movimiento_forma
values (149, 36, 14);
insert into pokemon_movimiento_forma
values (149, 88, 15);
insert into pokemon_movimiento_forma
values (149, 79, 20);
insert into pokemon_movimiento_forma
values (149, 16, 23);
insert into pokemon_movimiento_forma
values (149, 20, 24);
insert into pokemon_movimiento_forma
values (149, 21, 25);
insert into pokemon_movimiento_forma
values (149, 94, 31);
insert into pokemon_movimiento_forma
values (149, 72, 32);
insert into pokemon_movimiento_forma
values (149, 143, 33);
insert into pokemon_movimiento_forma
values (149, 118, 34);
insert into pokemon_movimiento_forma
values (149, 29, 38);
insert into pokemon_movimiento_forma
values (149, 19, 39);
insert into pokemon_movimiento_forma
values (149, 58, 40);
insert into pokemon_movimiento_forma
values (149, 135, 44);
insert into pokemon_movimiento_forma
values (149, 18, 45);
insert into pokemon_movimiento_forma
values (149, 114, 50);
insert into pokemon_movimiento_forma
values (149, 10, 53);
insert into pokemon_movimiento_forma
values (149, 78, 54);

insert into pokemon_movimiento_forma
values (150, 134, 56);
insert into pokemon_movimiento_forma
values (150, 48, 56);
insert into pokemon_movimiento_forma
values (150, 142, 56);
insert into pokemon_movimiento_forma
values (150, 103, 56);
insert into pokemon_movimiento_forma
values (150, 132, 113);
insert into pokemon_movimiento_forma
values (150, 142, 114);
insert into pokemon_movimiento_forma
values (150, 104, 115);
insert into pokemon_movimiento_forma
values (150, 31, 116);
insert into pokemon_movimiento_forma
values (150, 131, 117);
insert into pokemon_movimiento_forma
values (150, 92, 1);
insert into pokemon_movimiento_forma
values (150, 91, 5);
insert into pokemon_movimiento_forma
values (150, 159, 6);
insert into pokemon_movimiento_forma
values (150, 82, 8);
insert into pokemon_movimiento_forma
values (150, 66, 9);
insert into pokemon_movimiento_forma
values (150, 73, 10);
insert into pokemon_movimiento_forma
values (150, 8, 11);
insert into pokemon_movimiento_forma
values (150, 7, 12);
insert into pokemon_movimiento_forma
values (150, 35, 13);
insert into pokemon_movimiento_forma
values (150, 36, 14);
insert into pokemon_movimiento_forma
values (150, 88, 15);
insert into pokemon_movimiento_forma
values (150, 71, 16);
insert into pokemon_movimiento_forma
values (150, 44, 17);
insert into pokemon_movimiento_forma
values (150, 37, 18);
insert into pokemon_movimiento_forma
values (150, 39, 19);
insert into pokemon_movimiento_forma
values (150, 79, 20);
insert into pokemon_movimiento_forma
values (150, 128, 22);
insert into pokemon_movimiento_forma
values (150, 20, 24);
insert into pokemon_movimiento_forma
values (150, 21, 25);
insert into pokemon_movimiento_forma
values (150, 142, 29);
insert into pokemon_movimiento_forma
values (150, 144, 30);
insert into pokemon_movimiento_forma
values (150, 94, 31);
insert into pokemon_movimiento_forma
values (150, 72, 32);
insert into pokemon_movimiento_forma
values (150, 143, 33);
insert into pokemon_movimiento_forma
values (150, 118, 34);
insert into pokemon_movimiento_forma
values (150, 93, 35);
insert into pokemon_movimiento_forma
values (150, 54, 36);
insert into pokemon_movimiento_forma
values (150, 29, 38);
insert into pokemon_movimiento_forma
values (150, 58, 40);
insert into pokemon_movimiento_forma
values (150, 135, 44);
insert into pokemon_movimiento_forma
values (150, 18, 45);
insert into pokemon_movimiento_forma
values (150, 140, 46);
insert into pokemon_movimiento_forma
values (150, 117, 49);
insert into pokemon_movimiento_forma
values (150, 114, 50);
insert into pokemon_movimiento_forma
values (150, 78, 54);
insert into pokemon_movimiento_forma
values (150, 69, 55);

insert into pokemon_movimiento_forma
values (151, 70, 56);
insert into pokemon_movimiento_forma
values (151, 116, 101);
insert into pokemon_movimiento_forma
values (151, 92, 59);
insert into pokemon_movimiento_forma
values (151, 93, 65);
insert into pokemon_movimiento_forma
values (151, 142, 96);
insert into pokemon_movimiento_forma
values (151, 92, 1);
insert into pokemon_movimiento_forma
values (151, 119, 2);
insert into pokemon_movimiento_forma
values (151, 2, 3);
insert into pokemon_movimiento_forma
values (151, 106, 4);
insert into pokemon_movimiento_forma
values (151, 91, 5);
insert into pokemon_movimiento_forma
values (151, 159, 6);
insert into pokemon_movimiento_forma
values (151, 97, 7);
insert into pokemon_movimiento_forma
values (151, 82, 8);
insert into pokemon_movimiento_forma
values (151, 66, 9);
insert into pokemon_movimiento_forma
values (151, 73, 10);
insert into pokemon_movimiento_forma
values (151, 8, 11);
insert into pokemon_movimiento_forma
values (151, 7, 12);
insert into pokemon_movimiento_forma
values (151, 35, 13);
insert into pokemon_movimiento_forma
values (151, 36, 14);
insert into pokemon_movimiento_forma
values (151, 88, 15);
insert into pokemon_movimiento_forma
values (151, 71, 16);
insert into pokemon_movimiento_forma
values (151, 44, 17);
insert into pokemon_movimiento_forma
values (151, 37, 18);
insert into pokemon_movimiento_forma
values (151, 39, 19);
insert into pokemon_movimiento_forma
values (151, 79, 20);
insert into pokemon_movimiento_forma
values (151, 126, 21);
insert into pokemon_movimiento_forma
values (151, 128, 22);
insert into pokemon_movimiento_forma
values (151, 16, 23);
insert into pokemon_movimiento_forma
values (151, 20, 24);
insert into pokemon_movimiento_forma
values (151, 21, 25);
insert into pokemon_movimiento_forma
values (151, 151, 26);
insert into pokemon_movimiento_forma
values (151, 148, 27);
insert into pokemon_movimiento_forma
values (151, 147, 28);
insert into pokemon_movimiento_forma
values (151, 142, 29);
insert into pokemon_movimiento_forma
values (151, 144, 30);
insert into pokemon_movimiento_forma
values (151, 94, 31);
insert into pokemon_movimiento_forma
values (151, 72, 32);
insert into pokemon_movimiento_forma
values (151, 143, 33);
insert into pokemon_movimiento_forma
values (151, 118, 34);
insert into pokemon_movimiento_forma
values (151, 93, 35);
insert into pokemon_movimiento_forma
values (151, 54, 36);
insert into pokemon_movimiento_forma
values (151, 56, 37);
insert into pokemon_movimiento_forma
values (151, 29, 38);
insert into pokemon_movimiento_forma
values (151, 19, 39);
insert into pokemon_movimiento_forma
values (151, 58, 40);
insert into pokemon_movimiento_forma
values (151, 47, 41);
insert into pokemon_movimiento_forma
values (151, 133, 42);
insert into pokemon_movimiento_forma
values (151, 160, 43);
insert into pokemon_movimiento_forma
values (151, 135, 44);
insert into pokemon_movimiento_forma
values (151, 18, 45);
insert into pokemon_movimiento_forma
values (151, 140, 46);
insert into pokemon_movimiento_forma
values (151, 75, 47);
insert into pokemon_movimiento_forma
values (151, 145, 48);
insert into pokemon_movimiento_forma
values (151, 117, 49);
insert into pokemon_movimiento_forma
values (151, 114, 50);
insert into pokemon_movimiento_forma
values (151, 64, 51);
insert into pokemon_movimiento_forma
values (151, 166, 52);
insert into pokemon_movimiento_forma
values (151, 10, 53);
insert into pokemon_movimiento_forma
values (151, 78, 54);
insert into pokemon_movimiento_forma
values (151, 69, 55);

-- Vistas

create or replace view pokemon_evolucion_piedra as
select distinct p.numero_pokedex, p.nombre
from pokemon p,
     pokemon_forma_evolucion pfe,
     forma_evolucion fe,
     tipo_evolucion te
where p.numero_pokedex = pfe.numero_pokedex
  and pfe.id_forma_evolucion = fe.id_forma_evolucion
  and fe.tipo_evolucion = te.id_tipo_evolucion
  and lower(te.tipo_evolucion) = 'piedra';

create or replace view pokemon_no_evolucionan as
select p.numero_pokedex, p.nombre
from pokemon p,
     evoluciona_de ev
where p.numero_pokedex = ev.pokemon_evolucionado
  and not exists (select pokemon_origen from evoluciona_de where pokemon_origen = p.numero_pokedex)
union
select p.numero_pokedex, p.nombre
from pokemon p
where not exists (select *
                  from evoluciona_de
                  where pokemon_origen = p.numero_pokedex
                     or pokemon_evolucionado = p.numero_pokedex);

create or replace view cantidad_tipo_pokemon as
select t.nombre as tipo, count(*) as cantidad
from pokemon p,
     pokemon_tipo pt,
     tipo t
where p.numero_pokedex = pt.numero_pokedex
  and pt.id_tipo = t.id_tipo
group by t.nombre;

-- Procedimientos y funciones

drop procedure if exists muestraPokemonByTipo;
drop procedure if exists muestraPokemonByTipos;

delimiter $$

create procedure muestraPokemonByTipo(p_tipo varchar(10))
begin

    select p.nombre
    from pokemon p,
         pokemon_tipo pt,
         tipo t
    where p.numero_pokedex = pt.numero_pokedex
      and pt.id_tipo = t.id_tipo
      and lower(t.nombre) = trim(lower(p_tipo));

end$$

create procedure muestraPokemonByTipos(p_tipo1 varchar(10), p_tipo2 varchar(10))
begin

    select nombre
    from pokemon
    where numero_pokedex in (select numero_pokedex
                             from pokemon_tipo pt,
                                  tipo t
                             where pt.id_tipo = t.id_tipo
                               and lower(t.nombre) = lower(trim(p_tipo1)))
      and numero_pokedex in (select numero_pokedex
                             from pokemon_tipo pt,
                                  tipo t
                             where pt.id_tipo = t.id_tipo
                               and lower(t.nombre) = lower(trim(p_tipo2)));

end$$

delimiter ;
