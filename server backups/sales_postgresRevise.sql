--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-11 11:54:44

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

--
-- TOC entry 853 (class 1247 OID 16409)
-- Name: sex_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sex_type AS ENUM (
    'M',
    'F'
);


ALTER TYPE public.sex_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    company character varying(255) NOT NULL,
    street character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character(2) NOT NULL,
    zip smallint NOT NULL,
    phone character varying(20) NOT NULL,
    birth_date date,
    sex public.sex_type NOT NULL,
    date_entered timestamp without time zone NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 214
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 223 (class 1259 OID 16449)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    product_id integer,
    size integer NOT NULL,
    color character varying(30) NOT NULL,
    picture character varying(256) NOT NULL,
    price numeric(6,2) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16448)
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_id_seq OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 222
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;


--
-- TOC entry 221 (class 1259 OID 16435)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    type_id integer,
    name character varying(30) NOT NULL,
    supplier character varying(30) NOT NULL,
    description text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16434)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 219 (class 1259 OID 16428)
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    name character varying(30) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16427)
-- Name: product_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_type_id_seq OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_type_id_seq OWNED BY public.product_type.id;


--
-- TOC entry 227 (class 1259 OID 16478)
-- Name: sales_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_item (
    item_id integer,
    sales_order_id integer,
    quantity integer NOT NULL,
    discount numeric(3,2) DEFAULT 0,
    taxable boolean DEFAULT false NOT NULL,
    sales_tax_rate numeric(5,2) DEFAULT 0 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.sales_item OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16477)
-- Name: sales_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_item_id_seq OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 226
-- Name: sales_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_item_id_seq OWNED BY public.sales_item.id;


--
-- TOC entry 225 (class 1259 OID 16461)
-- Name: sales_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_order (
    cust_id integer,
    sales_person_id integer,
    time_order_taken timestamp without time zone NOT NULL,
    purchase_order_number integer NOT NULL,
    credit_card_number character varying(16) NOT NULL,
    credit_card_exper_month smallint NOT NULL,
    credit_card_exper_day smallint NOT NULL,
    credit_card_secret_code smallint NOT NULL,
    name_on_card character varying(100) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.sales_order OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16460)
-- Name: sales_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_order_id_seq OWNER TO postgres;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 224
-- Name: sales_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_order_id_seq OWNED BY public.sales_order.id;


--
-- TOC entry 217 (class 1259 OID 16420)
-- Name: sales_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_person (
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(60) NOT NULL,
    street character varying(50) NOT NULL,
    city character varying(40) NOT NULL,
    state character(2) DEFAULT 'PA'::bpchar NOT NULL,
    zip smallint NOT NULL,
    phone character varying(20) NOT NULL,
    birth_date date,
    sex public.sex_type NOT NULL,
    date_hired timestamp without time zone NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.sales_person OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16419)
-- Name: sales_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_person_id_seq OWNER TO postgres;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 216
-- Name: sales_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_person_id_seq OWNED BY public.sales_person.id;


--
-- TOC entry 3206 (class 2604 OID 16403)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 16452)
-- Name: item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 16438)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 16431)
-- Name: product_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type ALTER COLUMN id SET DEFAULT nextval('public.product_type_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 16484)
-- Name: sales_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_item ALTER COLUMN id SET DEFAULT nextval('public.sales_item_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 16464)
-- Name: sales_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order ALTER COLUMN id SET DEFAULT nextval('public.sales_order_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 16424)
-- Name: sales_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_person ALTER COLUMN id SET DEFAULT nextval('public.sales_person_id_seq'::regclass);


--
-- TOC entry 3380 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (first_name, last_name, email, company, street, city, state, zip, phone, birth_date, sex, date_entered, id) FROM stdin;
Christopher	Jones	christopherjones@bp.com	BP	347 Cedar St	Lawrenceville	GA	30044	348-848-8291	1938-09-11	M	2023-01-11 10:46:58.46957	1
\.


--
-- TOC entry 3388 (class 0 OID 16449)
-- Dependencies: 223
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (product_id, size, color, picture, price, id) FROM stdin;
\.


--
-- TOC entry 3386 (class 0 OID 16435)
-- Dependencies: 221
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (type_id, name, supplier, description, id) FROM stdin;
\.


--
-- TOC entry 3384 (class 0 OID 16428)
-- Dependencies: 219
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type (name, id) FROM stdin;
\.


--
-- TOC entry 3392 (class 0 OID 16478)
-- Dependencies: 227
-- Data for Name: sales_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_item (item_id, sales_order_id, quantity, discount, taxable, sales_tax_rate, id) FROM stdin;
\.


--
-- TOC entry 3390 (class 0 OID 16461)
-- Dependencies: 225
-- Data for Name: sales_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_order (cust_id, sales_person_id, time_order_taken, purchase_order_number, credit_card_number, credit_card_exper_month, credit_card_exper_day, credit_card_secret_code, name_on_card, id) FROM stdin;
\.


--
-- TOC entry 3382 (class 0 OID 16420)
-- Dependencies: 217
-- Data for Name: sales_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_person (first_name, last_name, email, street, city, state, zip, phone, birth_date, sex, date_hired, id) FROM stdin;
\.


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 214
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 222
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_id_seq', 1, false);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_type_id_seq', 1, false);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 226
-- Name: sales_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_item_id_seq', 1, false);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 224
-- Name: sales_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_order_id_seq', 1, false);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 216
-- Name: sales_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_person_id_seq', 1, false);


--
-- TOC entry 3218 (class 2606 OID 16407)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 16454)
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16442)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 16433)
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 16486)
-- Name: sales_item sales_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_item
    ADD CONSTRAINT sales_item_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 16466)
-- Name: sales_order sales_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 16426)
-- Name: sales_person sales_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_person
    ADD CONSTRAINT sales_person_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 16455)
-- Name: item item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3231 (class 2606 OID 16443)
-- Name: product product_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.product_type(id);


--
-- TOC entry 3235 (class 2606 OID 16487)
-- Name: sales_item sales_item_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_item
    ADD CONSTRAINT sales_item_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);


--
-- TOC entry 3236 (class 2606 OID 16492)
-- Name: sales_item sales_item_sales_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_item
    ADD CONSTRAINT sales_item_sales_order_id_fkey FOREIGN KEY (sales_order_id) REFERENCES public.sales_order(id);


--
-- TOC entry 3233 (class 2606 OID 16467)
-- Name: sales_order sales_order_cust_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_cust_id_fkey FOREIGN KEY (cust_id) REFERENCES public.customer(id);


--
-- TOC entry 3234 (class 2606 OID 16472)
-- Name: sales_order sales_order_sales_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_sales_person_id_fkey FOREIGN KEY (sales_person_id) REFERENCES public.sales_person(id);


-- Completed on 2023-01-11 11:54:44

--
-- PostgreSQL database dump complete
--

