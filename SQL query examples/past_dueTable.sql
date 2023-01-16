--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-16 14:50:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 16569)
-- Name: past_due; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.past_due (
    id integer NOT NULL,
    cust_id integer NOT NULL,
    balance numeric(6,2) NOT NULL
);


ALTER TABLE public.past_due OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16568)
-- Name: past_due_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.past_due_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.past_due_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 229
-- Name: past_due_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.past_due_id_seq OWNED BY public.past_due.id;


--
-- TOC entry 3231 (class 2604 OID 16572)
-- Name: past_due id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.past_due ALTER COLUMN id SET DEFAULT nextval('public.past_due_id_seq'::regclass);


--
-- TOC entry 3378 (class 0 OID 16569)
-- Dependencies: 230
-- Data for Name: past_due; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.past_due (id, cust_id, balance) FROM stdin;
1	1	123.45
2	2	324.50
\.


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 229
-- Name: past_due_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.past_due_id_seq', 2, true);


--
-- TOC entry 3233 (class 2606 OID 16574)
-- Name: past_due past_due_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.past_due
    ADD CONSTRAINT past_due_pkey PRIMARY KEY (id);


-- Completed on 2023-01-16 14:50:23

--
-- PostgreSQL database dump complete
--

