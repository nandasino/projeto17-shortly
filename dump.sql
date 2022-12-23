--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: sesions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sesions (
    id integer NOT NULL,
    token text NOT NULL,
    valid boolean DEFAULT true NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: sesions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sesions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sesions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sesions_id_seq OWNED BY public.sesions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visits (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    opened integer DEFAULT 0 NOT NULL
);


--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.visits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.visits_id_seq OWNED BY public.visits.id;


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: sesions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesions ALTER COLUMN id SET DEFAULT nextval('public.sesions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits ALTER COLUMN id SET DEFAULT nextval('public.visits_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (3, '9nG5n3ZFbOSikhOUQ_WGH', 'https://www.youtube.com/premium', 2, '2022-12-23 11:02:53.320208');
INSERT INTO public.links VALUES (5, 'IZ0gTr-N1pTtcAObUlyKh', 'https://canaltech.com.br/internet/conheca-sites-divertidos-para-passar-tempo-na-internet/', 3, '2022-12-23 14:13:22.158275');
INSERT INTO public.links VALUES (6, '3mTjdnHEDoIXD10lJ78NH', 'https://thisissand.com/', 3, '2022-12-23 14:13:41.292028');
INSERT INTO public.links VALUES (7, 'CtEJ5MABniApBod7pgevj', 'https://garticphone.com/pt', 3, '2022-12-23 14:15:22.363874');
INSERT INTO public.links VALUES (8, '3iS6_3kAiVd8VvGsAL4DY', 'https://shop.mattel.com/pt-br/collections/barbie', 3, '2022-12-23 15:02:36.90318');


--
-- Data for Name: sesions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sesions VALUES (1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY3MTc1MTU2MH0._DVeG06W7PY7DOVcwZ0xGM461m3v3yQCuJZcB6aCpEw', true, 1);
INSERT INTO public.sesions VALUES (2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY3MTc5ODk3N30.ChBXdyBw8V52ii4eL5WhO20HD-GY7v2dHavQUYJVDOw', true, 2);
INSERT INTO public.sesions VALUES (3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY3MTgwOTkzNX0.MO6S9dIPNtOFA_6fJY9emua1Zp-I_D_WvAUplvxJYTE', true, 3);
INSERT INTO public.sesions VALUES (4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY3MTgxODY1M30.M9O84nwRH1g3lUG9r-Qcsr42KDEKKxN9aVNfEcPqsCE', true, 3);
INSERT INTO public.sesions VALUES (5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY3MTgxODc2NH0.jngDyNkLoQaZyk4REaa5NwEkmmzgUni8z62GKZ-RyMI', true, 3);
INSERT INTO public.sesions VALUES (6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY3MTgxODc2OH0.tYy7nlt3r4b8fmIwtYYmm-yrUaxux-D7cFCmTdYlGl8', true, 3);
INSERT INTO public.sesions VALUES (7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY3MTgxODc5M30.50eKeiPcA9PB2mIcg9TP-lhbA-1a1YMLnu-peZVPlq8', true, 3);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Amora', 'amora@driven.com.br', '$2b$12$e70VoJZzH7X/1q5s8WSTbepDzQXkwp.FdGjmFZwfvvA6vd/ajzA7K', '2022-12-22 20:23:32.268271');
INSERT INTO public.users VALUES (2, 'Lili', 'lili@driven.com.br', '$2b$12$9kSo5h/PrVRr9pElC0yM.uuqW.SV9stxxrSCYJmsMJXAfpydWMmIi', '2022-12-23 09:36:01.386557');
INSERT INTO public.users VALUES (3, 'Leo', 'leo@driven.com.br', '$2b$12$465ghmXoeMD9PRRQgp1jH.ylVMf0Ka6GJu3kEjnUNgzJW9YJoHKiy', '2022-12-23 12:38:47.494988');
INSERT INTO public.users VALUES (4, 'Lila', 'lila@driven.com.br', '$2b$12$FlKPiuL5BptQRqIgg69M1u0J/0rljzNX3RsCEyXPG3qsFiloizFjC', '2022-12-23 15:07:15.022568');


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.visits VALUES (1, 3, 0);
INSERT INTO public.visits VALUES (2, 6, 0);
INSERT INTO public.visits VALUES (3, 6, 0);
INSERT INTO public.visits VALUES (4, 6, 0);
INSERT INTO public.visits VALUES (5, 7, 0);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 8, true);


--
-- Name: sesions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sesions_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.visits_id_seq', 5, true);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: sesions sesions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesions
    ADD CONSTRAINT sesions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: links links_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sesions sesions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesions
    ADD CONSTRAINT "sesions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: visits visits_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT "visits_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.links(id);


--
-- PostgreSQL database dump complete
--

