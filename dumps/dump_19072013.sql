--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: komunumo; Tablespace: 
--

CREATE TABLE activity (
    id bigint NOT NULL,
    version bigint NOT NULL,
    activity_date timestamp without time zone NOT NULL,
    activity_type_id bigint NOT NULL,
    address character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    entity_id bigint NOT NULL,
    latitude real,
    longitude real,
    name character varying(255) NOT NULL,
    neighbourhood_id bigint NOT NULL,
    place character varying(255)
);


ALTER TABLE public.activity OWNER TO komunumo;

--
-- Name: activity_type; Type: TABLE; Schema: public; Owner: komunumo; Tablespace: 
--

CREATE TABLE activity_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.activity_type OWNER TO komunumo;

--
-- Name: city; Type: TABLE; Schema: public; Owner: komunumo; Tablespace: 
--

CREATE TABLE city (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.city OWNER TO komunumo;

--
-- Name: entity; Type: TABLE; Schema: public; Owner: komunumo; Tablespace: 
--

CREATE TABLE entity (
    id bigint NOT NULL,
    version bigint NOT NULL,
    address character varying(255),
    description character varying(255),
    entity_type character varying(255),
    latitude real,
    longitude real,
    name character varying(255) NOT NULL,
    telephone character varying(255),
    web character varying(255),
    zone character varying(255)
);


ALTER TABLE public.entity OWNER TO komunumo;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: komunumo
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO komunumo;

--
-- Name: neighbourhood; Type: TABLE; Schema: public; Owner: komunumo; Tablespace: 
--

CREATE TABLE neighbourhood (
    id bigint NOT NULL,
    version bigint NOT NULL,
    city_id bigint NOT NULL,
    latitude real,
    longitude real,
    name character varying(255) NOT NULL
);


ALTER TABLE public.neighbourhood OWNER TO komunumo;

--
-- Name: role; Type: TABLE; Schema: public; Owner: komunumo; Tablespace: 
--

CREATE TABLE role (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.role OWNER TO komunumo;

--
-- Name: user_role; Type: TABLE; Schema: public; Owner: komunumo; Tablespace: 
--

CREATE TABLE user_role (
    role_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_role OWNER TO komunumo;

--
-- Name: users; Type: TABLE; Schema: public; Owner: komunumo; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    version bigint NOT NULL,
    account_expired boolean NOT NULL,
    account_locked boolean NOT NULL,
    enabled boolean NOT NULL,
    password character varying(255) NOT NULL,
    password_expired boolean NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO komunumo;

--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: komunumo
--

COPY activity (id, version, activity_date, activity_type_id, address, description, entity_id, latitude, longitude, name, neighbourhood_id, place) FROM stdin;
147	0	2013-08-01 00:00:00	125		Constitución de tres grupos de trabajo: local, global y comunicación, que con el tiempo han desaparecido. Actualmente nos reunimos en Asamblea General todos los sábados a las 12:30 horas.	140	40.4230003	-3.69799995	Asamblea	25	Plaza del encuentro
141	2	2013-08-20 00:00:00	121	C/ Esquilache, 2 28003 Madrid (Madrid)	Te enseñamos a montar tu propio huerto ecológico. Aprenderás a cultivar por temporadas y a comer de manera saludable.	137	40525280	-3704945	Monta tu propio huerto	7	Centro Eco
142	1	2013-08-10 00:00:00	122	C/ Esquilache, 2 28003 Madrid (Madrid)	Daremos un paseo por la sierra de Madrid y te enseñaremos a identificar rastros de animales, huellas, etc...	137	40525280	-3704945	Huella animal	7	Centro Eco
143	1	2013-07-16 00:00:00	124	Av de Carabanchel Alto, 64‎ 28044 Madrid	Malabares, payasos, canciones... Trae a los pequeños de tu casa a jugar con nosotros!	134	40369880	-3753275	Juegos de niños	15	La casa del barrio
144	1	2013-07-20 00:00:00	125	C/ Gaztambide 50 28015 Madrid (Madrid)	Para una banca ética, cooperativa y ciudadana es muy importante continuar ampliando el número de personas y organizaciones que formen parte de nuestra base social.	138	40436968	-3715267	Campaña de Capital Social	108	En nuestra oficina
145	1	2013-07-25 00:00:00	123	c/ Argumosa, 10 28012 Madrid (Madrid)	Porque estamos hartos que la gente no tenga para comer. Ven a comer con familiares y amigos y por cada menú que consumas estarás donando un 50% del precio del menú al banco de alimentos de Madrid.	139	40408148	-3699285	Comida solidaria "Anti crisis"	38	El Granero de Lavapiés
148	1	2013-07-22 00:00:00	120	Av de Carabanchel Alto, 64‎ 28044 Madrid	Partido de fútbol para jubilados! Anímate!	134	40369880	-3753275	Partido de futbol senior	15	Campos de futbol de Carabanchel
149	1	2013-08-28 00:00:00	119	Calle de Eugenia de Montijo, 105, 28044 Madrid	Exposición de fotografía de Antonio Fernandez Loras.	134	40374208	-3751028	Exposición "La vida pasa"	93	Centro cultural García Lorca
\.


--
-- Data for Name: activity_type; Type: TABLE DATA; Schema: public; Owner: komunumo
--

COPY activity_type (id, version, name) FROM stdin;
119	0	Arte y cultura
120	0	Deporte y aventura
121	0	Formación
122	0	Excursiones
123	0	Gastronomía
124	0	Infantil
125	0	Social
126	0	Actividad múltiple
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: komunumo
--

COPY city (id, version, name) FROM stdin;
1	0	Madrid
\.


--
-- Data for Name: entity; Type: TABLE DATA; Schema: public; Owner: komunumo
--

COPY entity (id, version, address, description, entity_type, latitude, longitude, name, telephone, web, zone) FROM stdin;
139	1	c/ Argumosa, 10 28012 Madrid (Madrid)	Restaurante semiecológico y laboralmente justo	Otros	40.4080009	-3.69899988	El Granero de Lavapiés	914677611	\N	\N
137	1	C/ Esquilache, 2 28003 Madrid (Madrid) 	Ecocentro es un multiespacio creado en 1993, dedicado íntegramente a la vida alternativa y natural, al cuidado del ser humano y del planeta, siendo un establecimiento pionero de estas características en nuestro país.	Empresa/autónomo	40525280	-3704945	Ecocentro	915535502	http://www.ecocentro.es/	Local
134	4	Av de Carabanchel Alto, 64‎ 28044 Madrid	Erase una vez una panda de locos y locas que soñaban con tener un lugar mágico donde encontrarse con los suyos que eran tantos que ya no cabían en el salón de su casa.  	Asociación de vecinos	40369880	-3753275	La casa del barrio	914253658	http://www.casadelbarriocarabanchel.es	Vallecas
138	2	C/ Gaztambide 50 28015 Madrid (Madrid)	Fiare es una herramienta de intermediación financiera que pone los ahorros de personas y organizaciones responsables al servicio de proyectos con vocación de transformación social.	Cooperativa	40436968	-3715267	Fiare (Fiare- Bana Popolare Etica)	679847922	http://www.proyectofiare.com/	Zona centro y sur del país
140	2	Varias direcciones	Asamblea popular del #15m	Asamblea popular	40.4230003	-3.69799995	Asamblea Popular de Chueca	\N	http://chueca.tomalosbarrios.net/	Barrio Chueca
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: komunumo
--

SELECT pg_catalog.setval('hibernate_sequence', 149, true);


--
-- Data for Name: neighbourhood; Type: TABLE DATA; Schema: public; Owner: komunumo
--

COPY neighbourhood (id, version, city_id, latitude, longitude, name) FROM stdin;
3	0	1	\N	\N	Adelfas
4	0	1	\N	\N	Alameda de Osuna
5	0	1	\N	\N	Almenara (Tetuán)
6	0	1	\N	\N	Aluche
2	1	1	\N	\N	Abrantes
7	1	1	\N	\N	Arapiles
8	0	1	\N	\N	Aravaca
9	0	1	\N	\N	Argüelles
10	0	1	\N	\N	Arrabal de San Ginés
11	0	1	\N	\N	Arrabal de San Martín
12	0	1	\N	\N	Atocha (Arganzuela)
13	0	1	\N	\N	Bajos de Argüelles
14	0	1	\N	\N	San Isidro
15	0	1	\N	\N	Buenavista
16	0	1	\N	\N	PAU de Carabanchel
17	0	1	\N	\N	Butarque
18	0	1	\N	\N	Campamento
19	0	1	\N	\N	Canal del Manzanares
20	0	1	\N	\N	Canillejas
21	0	1	\N	\N	Cantoblanco
23	0	1	\N	\N	Castilla
24	0	1	\N	\N	Centralidad del Este
25	0	1	\N	\N	Chueca
26	0	1	\N	\N	Ciudad Jardín
27	0	1	\N	\N	Ciudad Pegaso
28	0	1	\N	\N	Comillas
29	0	1	\N	\N	Cortes
30	0	1	\N	\N	Covibar
31	0	1	\N	\N	Cuartel de Monteleón
32	0	1	\N	\N	El Cañaveral
33	0	1	\N	\N	El Cruce de Villaverde
34	0	1	\N	\N	El Espinillo
35	0	1	\N	\N	El Plantío
36	0	1	\N	\N	El Pozo del Tío Raimundo
37	0	1	\N	\N	El Zofío
38	0	1	\N	\N	Embajadores (Centro)
39	0	1	\N	\N	Ensanche de Vallecas
40	0	1	\N	\N	Entrevías
41	0	1	\N	\N	Estrella
42	0	1	\N	\N	Fuencarral
43	0	1	\N	\N	Fuente del Berro
45	0	1	\N	\N	Hispanoamérica
46	0	1	\N	\N	Imperial
47	0	1	\N	\N	Justicia (Centro)
48	0	1	\N	\N	La Celsa
49	0	1	\N	\N	La Chopera
50	0	1	\N	\N	La Elipa
51	0	1	\N	\N	La Florida
52	0	1	\N	\N	La Guindalera
53	0	1	\N	\N	La Paz
54	0	1	\N	\N	La Piovera
55	0	1	\N	\N	La Rosilla
56	0	1	\N	\N	Las Acacias
57	0	1	\N	\N	Las Águilas
58	0	1	\N	\N	Las Barranquillas
59	0	1	\N	\N	Las Delicias
60	0	1	\N	\N	Las Tablas
62	0	1	\N	\N	Lavapiés
63	0	1	\N	\N	Legazpi
64	0	1	\N	\N	Barrio de las Letras
65	0	1	\N	\N	Lista
66	0	1	\N	\N	Los Ahijones
67	0	1	\N	\N	Los Berrocales
68	0	1	\N	\N	Los Cerros
69	0	1	\N	\N	Los Focos
70	0	1	\N	\N	Los Ángeles
71	0	1	\N	\N	Lucero
72	0	1	\N	\N	Manoteras
73	0	1	\N	\N	Mingorrubio
74	0	1	\N	\N	Mirasierra
75	0	1	\N	\N	Montecarmelo
76	0	1	\N	\N	Niño Jesús
77	0	1	\N	\N	Opañel
78	0	1	\N	\N	Orcasitas
79	0	1	\N	\N	Oroquieta
80	0	1	\N	\N	Pacífico
81	0	1	\N	\N	Palacio (Centro)
82	0	1	\N	\N	Palomas
83	0	1	\N	\N	Palos de Moguer
84	0	1	\N	\N	Pan Bendito
85	0	1	\N	\N	Pavones
86	0	1	\N	\N	Peñagrande
87	0	1	\N	\N	El Pilar
88	0	1	\N	\N	Pinar de Chamartín
89	0	1	\N	\N	Plata y Castañar
90	0	1	\N	\N	Pozas
91	0	1	\N	\N	Prosperidad
92	0	1	\N	\N	Pueblo Nuevo
95	0	1	\N	\N	Quintana
96	0	1	\N	\N	Recoletos
97	0	1	\N	\N	San Cristóbal de los Ángeles
98	0	1	\N	\N	San Fermín
99	0	1	\N	\N	San Juan Bautista
100	0	1	\N	\N	San Nicolás
101	0	1	\N	\N	San Pascual
102	0	1	\N	\N	Sanchinarro
103	0	1	\N	\N	Arrabal de Santa Cruz
104	0	1	\N	\N	Santa Eugenia
105	0	1	\N	\N	Sol
106	0	1	\N	\N	Suanzes
107	0	1	\N	\N	Tres Olivos
108	0	1	\N	\N	Universidad
109	0	1	\N	\N	Valdebebas
110	0	1	\N	\N	Valdecarros
111	0	1	\N	\N	Valdemingómez
112	0	1	\N	\N	Vallecas
113	0	1	\N	\N	Valverde
114	0	1	\N	\N	Ventas
115	0	1	\N	\N	Villaverde Alto
116	0	1	\N	\N	Villaverde Bajo
117	0	1	\N	\N	Virgen del Cortijo
118	0	1	\N	\N	Vista Alegre
22	1	1	\N	\N	Castellana
44	1	1	\N	\N	Goya
61	1	1	\N	\N	La Latina
93	1	1	\N	\N	Puerta Bonita
94	1	1	\N	\N	Puerta del Ángel
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: komunumo
--

COPY role (id, version, authority) FROM stdin;
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: komunumo
--

COPY user_role (role_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: komunumo
--

COPY users (id, version, account_expired, account_locked, enabled, password, password_expired, username) FROM stdin;
127	1	f	f	t	8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	f	admin
\.


--
-- Name: activity_name_key; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY activity
    ADD CONSTRAINT activity_name_key UNIQUE (name);


--
-- Name: activity_pkey; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: activity_type_name_key; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY activity_type
    ADD CONSTRAINT activity_type_name_key UNIQUE (name);


--
-- Name: activity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY activity_type
    ADD CONSTRAINT activity_type_pkey PRIMARY KEY (id);


--
-- Name: city_name_key; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_name_key UNIQUE (name);


--
-- Name: city_pkey; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: entity_name_key; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_name_key UNIQUE (name);


--
-- Name: entity_pkey; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (id);


--
-- Name: neighbourhood_name_key; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY neighbourhood
    ADD CONSTRAINT neighbourhood_name_key UNIQUE (name);


--
-- Name: neighbourhood_pkey; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY neighbourhood
    ADD CONSTRAINT neighbourhood_pkey PRIMARY KEY (id);


--
-- Name: role_authority_key; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_authority_key UNIQUE (authority);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (role_id, user_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: komunumo; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: fk143bf46a7e691e93; Type: FK CONSTRAINT; Schema: public; Owner: komunumo
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fk143bf46a7e691e93 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk143bf46ad93e5ab3; Type: FK CONSTRAINT; Schema: public; Owner: komunumo
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fk143bf46ad93e5ab3 FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: fk9d4bf30f2cb2bd53; Type: FK CONSTRAINT; Schema: public; Owner: komunumo
--

ALTER TABLE ONLY activity
    ADD CONSTRAINT fk9d4bf30f2cb2bd53 FOREIGN KEY (entity_id) REFERENCES entity(id);


--
-- Name: fk9d4bf30f55fe4681; Type: FK CONSTRAINT; Schema: public; Owner: komunumo
--

ALTER TABLE ONLY activity
    ADD CONSTRAINT fk9d4bf30f55fe4681 FOREIGN KEY (neighbourhood_id) REFERENCES neighbourhood(id);


--
-- Name: fk9d4bf30f755f4db2; Type: FK CONSTRAINT; Schema: public; Owner: komunumo
--

ALTER TABLE ONLY activity
    ADD CONSTRAINT fk9d4bf30f755f4db2 FOREIGN KEY (activity_type_id) REFERENCES activity_type(id);


--
-- Name: fk9eaf42b9b5f6ba93; Type: FK CONSTRAINT; Schema: public; Owner: komunumo
--

ALTER TABLE ONLY neighbourhood
    ADD CONSTRAINT fk9eaf42b9b5f6ba93 FOREIGN KEY (city_id) REFERENCES city(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

