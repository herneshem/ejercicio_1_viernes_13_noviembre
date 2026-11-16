--
-- PostgreSQL database dump
--

\restrict SNhcVKeaz1zSYK3tBca0BCJL5V1zk5aG4DvKCneqRJrHnXht0igd2d1Ymm3RTLO

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.7 (Ubuntu 18.7-1.pgdg24.04+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: correos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.correos (
    id integer NOT NULL,
    email character varying(150) NOT NULL,
    estudiante_id integer NOT NULL
);


ALTER TABLE public.correos OWNER TO postgres;

--
-- Name: correos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.correos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.correos_id_seq OWNER TO postgres;

--
-- Name: correos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.correos_id_seq OWNED BY public.correos.id;


--
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    genero character varying(10) NOT NULL,
    fecha_matriculacion date NOT NULL,
    total_asignaturas integer DEFAULT 0 NOT NULL,
    facultad_id integer NOT NULL,
    CONSTRAINT estudiantes_genero_check CHECK (((genero)::text = ANY ((ARRAY['HOMBRE'::character varying, 'MUJER'::character varying, 'OTRO'::character varying])::text[])))
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- Name: estudiantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_id_seq OWNER TO postgres;

--
-- Name: estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_id_seq OWNED BY public.estudiantes.id;


--
-- Name: facultades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultades (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.facultades OWNER TO postgres;

--
-- Name: facultades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facultades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facultades_id_seq OWNER TO postgres;

--
-- Name: facultades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facultades_id_seq OWNED BY public.facultades.id;


--
-- Name: telefonos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefonos (
    id integer NOT NULL,
    numero character varying(20) NOT NULL,
    estudiante_id integer NOT NULL
);


ALTER TABLE public.telefonos OWNER TO postgres;

--
-- Name: telefonos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.telefonos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.telefonos_id_seq OWNER TO postgres;

--
-- Name: telefonos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.telefonos_id_seq OWNED BY public.telefonos.id;


--
-- Name: correos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correos ALTER COLUMN id SET DEFAULT nextval('public.correos_id_seq'::regclass);


--
-- Name: estudiantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_id_seq'::regclass);


--
-- Name: facultades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultades ALTER COLUMN id SET DEFAULT nextval('public.facultades_id_seq'::regclass);


--
-- Name: telefonos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefonos ALTER COLUMN id SET DEFAULT nextval('public.telefonos_id_seq'::regclass);


--
-- Data for Name: correos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.correos (id, email, estudiante_id) FROM stdin;
1	juan@gmail.com	1
2	maria@gmail.com	2
3	alex@gmail.com	3
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (id, nombre, apellido1, apellido2, genero, fecha_matriculacion, total_asignaturas, facultad_id) FROM stdin;
1	Juan	García	López	HOMBRE	2026-09-01	5	1
2	María	Pérez	Sánchez	MUJER	2026-09-01	6	2
3	Alex	Martín	Ruiz	OTRO	2026-09-02	4	3
\.


--
-- Data for Name: facultades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facultades (id, nombre) FROM stdin;
1	Ingeniería
2	Ciencias
3	Derecho
\.


--
-- Data for Name: telefonos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telefonos (id, numero, estudiante_id) FROM stdin;
1	600111222	1
2	600333444	2
3	600555666	3
\.


--
-- Name: correos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.correos_id_seq', 3, true);


--
-- Name: estudiantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_id_seq', 4, true);


--
-- Name: facultades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facultades_id_seq', 3, true);


--
-- Name: telefonos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.telefonos_id_seq', 3, true);


--
-- Name: correos correos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correos
    ADD CONSTRAINT correos_pkey PRIMARY KEY (id);


--
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id);


--
-- Name: facultades facultades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultades
    ADD CONSTRAINT facultades_pkey PRIMARY KEY (id);


--
-- Name: telefonos telefonos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefonos
    ADD CONSTRAINT telefonos_pkey PRIMARY KEY (id);


--
-- Name: correos fk_correo_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correos
    ADD CONSTRAINT fk_correo_estudiante FOREIGN KEY (estudiante_id) REFERENCES public.estudiantes(id) ON DELETE CASCADE;


--
-- Name: estudiantes fk_estudiante_facultad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT fk_estudiante_facultad FOREIGN KEY (facultad_id) REFERENCES public.facultades(id);


--
-- Name: telefonos fk_telefono_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefonos
    ADD CONSTRAINT fk_telefono_estudiante FOREIGN KEY (estudiante_id) REFERENCES public.estudiantes(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict SNhcVKeaz1zSYK3tBca0BCJL5V1zk5aG4DvKCneqRJrHnXht0igd2d1Ymm3RTLO

