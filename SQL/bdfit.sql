--
-- PostgreSQL database dump
--

\restrict HJhRKrG2ZfWbbLyZgfuSYtuL9CMr3Vom15SPKfUnZrA84ujqwqtamjLWU11bEui

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-07-20 00:32:13

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
-- TOC entry 220 (class 1259 OID 16672)
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    id_aluno integer NOT NULL,
    nome character varying(100) NOT NULL,
    data_nascimento date NOT NULL,
    email character varying(100) NOT NULL,
    cpf character varying(14) NOT NULL,
    numero character varying(10),
    cep character varying(9),
    bairro character varying(60),
    rua character varying(100)
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16671)
-- Name: aluno_id_aluno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aluno_id_aluno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aluno_id_aluno_seq OWNER TO postgres;

--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 219
-- Name: aluno_id_aluno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluno_id_aluno_seq OWNED BY public.aluno.id_aluno;


--
-- TOC entry 232 (class 1259 OID 16753)
-- Name: equipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamento (
    id_equipamento integer NOT NULL,
    idmodalidade integer,
    nome character varying(80) NOT NULL,
    estado_conservacao character varying(30),
    data_de_aquisicao date
);


ALTER TABLE public.equipamento OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16752)
-- Name: equipamento_id_equipamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipamento_id_equipamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipamento_id_equipamento_seq OWNER TO postgres;

--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 231
-- Name: equipamento_id_equipamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipamento_id_equipamento_seq OWNED BY public.equipamento.id_equipamento;


--
-- TOC entry 224 (class 1259 OID 16698)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    id_funcionario integer NOT NULL,
    nome character varying(100) NOT NULL,
    cargo character varying(50) NOT NULL,
    salario numeric(10,2) NOT NULL
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16697)
-- Name: funcionario_id_funcionario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.funcionario_id_funcionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.funcionario_id_funcionario_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 223
-- Name: funcionario_id_funcionario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funcionario_id_funcionario_seq OWNED BY public.funcionario.id_funcionario;


--
-- TOC entry 230 (class 1259 OID 16732)
-- Name: matricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matricula (
    id_matricula integer NOT NULL,
    idaluno integer,
    idplano integer,
    data_inicio date NOT NULL,
    data_fim date,
    status boolean DEFAULT true NOT NULL
);


ALTER TABLE public.matricula OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16731)
-- Name: matricula_id_matricula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matricula_id_matricula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matricula_id_matricula_seq OWNER TO postgres;

--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 229
-- Name: matricula_id_matricula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matricula_id_matricula_seq OWNED BY public.matricula.id_matricula;


--
-- TOC entry 226 (class 1259 OID 16709)
-- Name: modalidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modalidade (
    id_modalidade integer NOT NULL,
    nome character varying(60) NOT NULL,
    descricao character varying(200)
);


ALTER TABLE public.modalidade OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16708)
-- Name: modalidade_id_modalidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modalidade_id_modalidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modalidade_id_modalidade_seq OWNER TO postgres;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 225
-- Name: modalidade_id_modalidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modalidade_id_modalidade_seq OWNED BY public.modalidade.id_modalidade;


--
-- TOC entry 234 (class 1259 OID 16767)
-- Name: pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagamento (
    id_pagamento integer NOT NULL,
    idmatricula integer,
    idfuncionario integer,
    data_vencimento date NOT NULL,
    data_pagamento date,
    valor numeric(8,2) NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE public.pagamento OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16766)
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagamento_id_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagamento_id_pagamento_seq OWNER TO postgres;

--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 233
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagamento_id_pagamento_seq OWNED BY public.pagamento.id_pagamento;


--
-- TOC entry 222 (class 1259 OID 16688)
-- Name: plano; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plano (
    id_plano integer NOT NULL,
    nome character varying(60) NOT NULL,
    descricao character varying(200),
    valor_mensal numeric(8,2) NOT NULL,
    duracao integer
);


ALTER TABLE public.plano OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16687)
-- Name: plano_id_plano_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plano_id_plano_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plano_id_plano_seq OWNER TO postgres;

--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 221
-- Name: plano_id_plano_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plano_id_plano_seq OWNED BY public.plano.id_plano;


--
-- TOC entry 235 (class 1259 OID 16788)
-- Name: pratica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pratica (
    id_aluno integer NOT NULL,
    id_modalidade integer NOT NULL
);


ALTER TABLE public.pratica OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16718)
-- Name: telefone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefone (
    id_telefone integer NOT NULL,
    id_aluno integer,
    telefone character varying(20) NOT NULL
);


ALTER TABLE public.telefone OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16717)
-- Name: telefone_id_telefone_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.telefone_id_telefone_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.telefone_id_telefone_seq OWNER TO postgres;

--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 227
-- Name: telefone_id_telefone_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.telefone_id_telefone_seq OWNED BY public.telefone.id_telefone;


--
-- TOC entry 4895 (class 2604 OID 16675)
-- Name: aluno id_aluno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno ALTER COLUMN id_aluno SET DEFAULT nextval('public.aluno_id_aluno_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 16756)
-- Name: equipamento id_equipamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento ALTER COLUMN id_equipamento SET DEFAULT nextval('public.equipamento_id_equipamento_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 16701)
-- Name: funcionario id_funcionario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario ALTER COLUMN id_funcionario SET DEFAULT nextval('public.funcionario_id_funcionario_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 16735)
-- Name: matricula id_matricula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula ALTER COLUMN id_matricula SET DEFAULT nextval('public.matricula_id_matricula_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 16712)
-- Name: modalidade id_modalidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modalidade ALTER COLUMN id_modalidade SET DEFAULT nextval('public.modalidade_id_modalidade_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 16770)
-- Name: pagamento id_pagamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento ALTER COLUMN id_pagamento SET DEFAULT nextval('public.pagamento_id_pagamento_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 16691)
-- Name: plano id_plano; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plano ALTER COLUMN id_plano SET DEFAULT nextval('public.plano_id_plano_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 16721)
-- Name: telefone id_telefone; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone ALTER COLUMN id_telefone SET DEFAULT nextval('public.telefone_id_telefone_seq'::regclass);


--
-- TOC entry 5083 (class 0 OID 16672)
-- Dependencies: 220
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aluno (id_aluno, nome, data_nascimento, email, cpf, numero, cep, bairro, rua) FROM stdin;
\.


--
-- TOC entry 5095 (class 0 OID 16753)
-- Dependencies: 232
-- Data for Name: equipamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamento (id_equipamento, idmodalidade, nome, estado_conservacao, data_de_aquisicao) FROM stdin;
\.


--
-- TOC entry 5087 (class 0 OID 16698)
-- Dependencies: 224
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcionario (id_funcionario, nome, cargo, salario) FROM stdin;
\.


--
-- TOC entry 5093 (class 0 OID 16732)
-- Dependencies: 230
-- Data for Name: matricula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matricula (id_matricula, idaluno, idplano, data_inicio, data_fim, status) FROM stdin;
\.


--
-- TOC entry 5089 (class 0 OID 16709)
-- Dependencies: 226
-- Data for Name: modalidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modalidade (id_modalidade, nome, descricao) FROM stdin;
\.


--
-- TOC entry 5097 (class 0 OID 16767)
-- Dependencies: 234
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagamento (id_pagamento, idmatricula, idfuncionario, data_vencimento, data_pagamento, valor, status) FROM stdin;
\.


--
-- TOC entry 5085 (class 0 OID 16688)
-- Dependencies: 222
-- Data for Name: plano; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plano (id_plano, nome, descricao, valor_mensal, duracao) FROM stdin;
\.


--
-- TOC entry 5098 (class 0 OID 16788)
-- Dependencies: 235
-- Data for Name: pratica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pratica (id_aluno, id_modalidade) FROM stdin;
\.


--
-- TOC entry 5091 (class 0 OID 16718)
-- Dependencies: 228
-- Data for Name: telefone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telefone (id_telefone, id_aluno, telefone) FROM stdin;
\.


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 219
-- Name: aluno_id_aluno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aluno_id_aluno_seq', 1, false);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 231
-- Name: equipamento_id_equipamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipamento_id_equipamento_seq', 1, false);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 223
-- Name: funcionario_id_funcionario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcionario_id_funcionario_seq', 1, false);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 229
-- Name: matricula_id_matricula_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matricula_id_matricula_seq', 1, false);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 225
-- Name: modalidade_id_modalidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modalidade_id_modalidade_seq', 1, false);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 233
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagamento_id_pagamento_seq', 1, false);


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 221
-- Name: plano_id_plano_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plano_id_plano_seq', 1, false);


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 227
-- Name: telefone_id_telefone_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.telefone_id_telefone_seq', 1, false);


--
-- TOC entry 4906 (class 2606 OID 16686)
-- Name: aluno aluno_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_cpf_key UNIQUE (cpf);


--
-- TOC entry 4908 (class 2606 OID 16684)
-- Name: aluno aluno_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_email_key UNIQUE (email);


--
-- TOC entry 4910 (class 2606 OID 16682)
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id_aluno);


--
-- TOC entry 4922 (class 2606 OID 16760)
-- Name: equipamento equipamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT equipamento_pkey PRIMARY KEY (id_equipamento);


--
-- TOC entry 4914 (class 2606 OID 16707)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionario);


--
-- TOC entry 4920 (class 2606 OID 16741)
-- Name: matricula matricula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_pkey PRIMARY KEY (id_matricula);


--
-- TOC entry 4916 (class 2606 OID 16716)
-- Name: modalidade modalidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modalidade
    ADD CONSTRAINT modalidade_pkey PRIMARY KEY (id_modalidade);


--
-- TOC entry 4924 (class 2606 OID 16777)
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id_pagamento);


--
-- TOC entry 4912 (class 2606 OID 16696)
-- Name: plano plano_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plano
    ADD CONSTRAINT plano_pkey PRIMARY KEY (id_plano);


--
-- TOC entry 4926 (class 2606 OID 16794)
-- Name: pratica pratica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pratica
    ADD CONSTRAINT pratica_pkey PRIMARY KEY (id_aluno, id_modalidade);


--
-- TOC entry 4918 (class 2606 OID 16725)
-- Name: telefone telefone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone
    ADD CONSTRAINT telefone_pkey PRIMARY KEY (id_telefone);


--
-- TOC entry 4930 (class 2606 OID 16761)
-- Name: equipamento equipamento_idmodalidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT equipamento_idmodalidade_fkey FOREIGN KEY (idmodalidade) REFERENCES public.modalidade(id_modalidade);


--
-- TOC entry 4928 (class 2606 OID 16742)
-- Name: matricula matricula_idaluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_idaluno_fkey FOREIGN KEY (idaluno) REFERENCES public.aluno(id_aluno);


--
-- TOC entry 4929 (class 2606 OID 16747)
-- Name: matricula matricula_idplano_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_idplano_fkey FOREIGN KEY (idplano) REFERENCES public.plano(id_plano);


--
-- TOC entry 4931 (class 2606 OID 16783)
-- Name: pagamento pagamento_idfuncionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_idfuncionario_fkey FOREIGN KEY (idfuncionario) REFERENCES public.funcionario(id_funcionario);


--
-- TOC entry 4932 (class 2606 OID 16778)
-- Name: pagamento pagamento_idmatricula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_idmatricula_fkey FOREIGN KEY (idmatricula) REFERENCES public.matricula(id_matricula);


--
-- TOC entry 4933 (class 2606 OID 16795)
-- Name: pratica pratica_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pratica
    ADD CONSTRAINT pratica_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.aluno(id_aluno);


--
-- TOC entry 4934 (class 2606 OID 16800)
-- Name: pratica pratica_id_modalidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pratica
    ADD CONSTRAINT pratica_id_modalidade_fkey FOREIGN KEY (id_modalidade) REFERENCES public.modalidade(id_modalidade);


--
-- TOC entry 4927 (class 2606 OID 16726)
-- Name: telefone telefone_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefone
    ADD CONSTRAINT telefone_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.aluno(id_aluno);


-- Completed on 2026-07-20 00:32:13

--
-- PostgreSQL database dump complete
--

\unrestrict HJhRKrG2ZfWbbLyZgfuSYtuL9CMr3Vom15SPKfUnZrA84ujqwqtamjLWU11bEui

