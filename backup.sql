--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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
-- Name: chat_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_projects (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.chat_projects OWNER TO postgres;

--
-- Name: chat_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_projects_id_seq OWNER TO postgres;

--
-- Name: chat_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_projects_id_seq OWNED BY public.chat_projects.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: increments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.increments (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    user_story_id bigint NOT NULL,
    image character varying(255),
    file character varying(255),
    link character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.increments OWNER TO postgres;

--
-- Name: increments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.increments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.increments_id_seq OWNER TO postgres;

--
-- Name: increments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.increments_id_seq OWNED BY public.increments.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    content text NOT NULL,
    chat_project_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    object character varying(255) NOT NULL,
    message text NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_read boolean DEFAULT false NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: product_backlogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_backlogs (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_backlogs OWNER TO postgres;

--
-- Name: product_backlogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_backlogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_backlogs_id_seq OWNER TO postgres;

--
-- Name: product_backlogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_backlogs_id_seq OWNED BY public.product_backlogs.id;


--
-- Name: project_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_user (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.project_user OWNER TO postgres;

--
-- Name: project_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_user_id_seq OWNER TO postgres;

--
-- Name: project_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_user_id_seq OWNED BY public.project_user.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    start_date date NOT NULL,
    deadline date NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    project_manager_id bigint NOT NULL,
    CONSTRAINT projects_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'active'::character varying, 'completed'::character varying])::text[])))
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: sprints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprints (
    id bigint NOT NULL,
    number integer NOT NULL,
    start_date date NOT NULL,
    deadline date NOT NULL,
    objective character varying(255) NOT NULL,
    project_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sprints OWNER TO postgres;

--
-- Name: sprints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sprints_id_seq OWNER TO postgres;

--
-- Name: sprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprints_id_seq OWNED BY public.sprints.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    user_story_id bigint NOT NULL,
    assigned_to bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    CONSTRAINT tasks_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'active'::character varying, 'completed'::character varying])::text[])))
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_id_seq OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: user_stories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_stories (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    sprint_id bigint,
    product_backlog_id bigint NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    created_by bigint,
    CONSTRAINT user_stories_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'active'::character varying, 'completed'::character varying])::text[])))
);


ALTER TABLE public.user_stories OWNER TO postgres;

--
-- Name: user_stories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_stories_id_seq OWNER TO postgres;

--
-- Name: user_stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_stories_id_seq OWNED BY public.user_stories.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    avatar text,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'projectManager'::character varying, 'productOwner'::character varying, 'scrumMaster'::character varying, 'teamMember'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: chat_projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_projects ALTER COLUMN id SET DEFAULT nextval('public.chat_projects_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: increments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.increments ALTER COLUMN id SET DEFAULT nextval('public.increments_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: product_backlogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_backlogs ALTER COLUMN id SET DEFAULT nextval('public.product_backlogs_id_seq'::regclass);


--
-- Name: project_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_user ALTER COLUMN id SET DEFAULT nextval('public.project_user_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: sprints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints ALTER COLUMN id SET DEFAULT nextval('public.sprints_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: user_stories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_stories ALTER COLUMN id SET DEFAULT nextval('public.user_stories_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: chat_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_projects (id, project_id, created_at, updated_at) FROM stdin;
1	1	2025-10-27 21:29:14	2025-10-27 21:29:14
2	2	2025-10-27 21:29:14	2025-10-27 21:29:14
3	3	2025-10-28 20:12:51	2025-10-28 20:12:51
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: increments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.increments (id, name, user_story_id, image, file, link, created_at, updated_at) FROM stdin;
1	Sprint 1 - Authentification	1	\N	documentation_sprint1.pdf	https://github.com/project/releases/v1.0	2025-10-27 21:29:14	2025-10-27 21:29:14
2	Maquettes interface	2	maquette_inscription.png	\N	\N	2025-10-27 21:29:14	2025-10-27 21:29:14
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, content, chat_project_id, user_id, created_at, updated_at) FROM stdin;
1	Bonjour tout le monde ! Bienvenue sur le projet Application E-commerce.	1	2	2025-10-27 21:29:14	2025-10-27 21:29:14
2	Quelqu'un a commencé à travailler sur l'authentification ?	1	4	2025-10-27 21:29:14	2025-10-27 21:29:14
3	Oui, je m'en occupe. Je devrais finir demain.	1	5	2025-10-27 21:29:14	2025-10-27 21:29:14
4	Bonjour	1	4	2025-10-28 20:02:33	2025-10-28 20:02:33
5	bonsoir vous allez bien	1	3	2025-10-28 23:06:45	2025-10-28 23:06:45
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2025_10_03_001448_create_projects_table	1
6	2025_10_03_005804_create_project_user_table	1
7	2025_10_03_005838_create_sprints_table	1
8	2025_10_03_010001_create_product_backlogs_table	1
9	2025_10_03_010059_create_user_stories_table	1
10	2025_10_03_011613_create_tasks_table	1
11	2025_10_03_011929_create_increments_table	1
12	2025_10_03_012656_create_chat_projects_table	1
13	2025_10_03_012726_create_messages_table	1
14	2025_10_03_014503_create_notifications_table	1
15	2025_10_09_133631_create_projects_table	1
16	2025_10_09_222540_create_tasks_table	1
17	2025_10_12_140825_create_notifications_table	1
18	2025_10_17_193540_create_user_stories_table	1
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, object, message, user_id, created_at, updated_at, is_read) FROM stdin;
1	Nouvelle tâche assignée	La tâche "Créer la page de login" vous a été assignée	5	2025-10-27 21:29:14	2025-10-27 21:29:14	f
2	Tâche terminée	La tâche "Implémenter l'authentification" a été marquée comme terminée	2	2025-10-27 21:29:14	2025-10-27 21:29:14	t
3	Nouveau message	Nouveau message dans le chat du projet Application E-commerce	3	2025-10-27 21:29:14	2025-10-27 21:29:14	f
4	Added to Project	You have been added to the project 'Gestion Projet Etat Sénégal' by Project Manager	4	2025-10-28 22:20:33	2025-10-28 22:20:33	f
5	New Task Assigned	You have been assigned a new task 'implementation jwt' by Scrum Master	5	2025-10-28 23:12:28	2025-10-28 23:12:28	f
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_backlogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_backlogs (id, project_id, created_at, updated_at) FROM stdin;
1	1	2025-10-27 21:29:14	2025-10-27 21:29:14
2	2	2025-10-27 21:29:14	2025-10-27 21:29:14
3	3	2025-10-28 20:12:51	2025-10-28 20:12:51
\.


--
-- Data for Name: project_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_user (id, project_id, user_id, created_at, updated_at) FROM stdin;
1	1	2	2025-10-27 21:29:14	2025-10-27 21:29:14
2	1	3	2025-10-27 21:29:14	2025-10-27 21:29:14
3	1	4	2025-10-27 21:29:14	2025-10-27 21:29:14
4	1	5	2025-10-27 21:29:14	2025-10-27 21:29:14
5	1	6	2025-10-27 21:29:14	2025-10-27 21:29:14
6	2	2	2025-10-27 21:29:14	2025-10-27 21:29:14
7	2	5	2025-10-27 21:29:14	2025-10-27 21:29:14
8	3	4	2025-10-28 22:20:33	2025-10-28 22:20:33
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, description, start_date, deadline, status, created_at, updated_at, project_manager_id) FROM stdin;
1	Application E-commerce	Développement d'une plateforme e-commerce complète	2025-01-15	2025-06-15	active	2025-10-27 21:29:14	2025-10-27 21:29:14	2
2	Système de Gestion de Contenu	CMS pour la gestion de contenu d'entreprise	2025-02-01	2025-05-01	pending	2025-10-27 21:29:14	2025-10-27 21:29:14	2
3	Gestion Projet Etat Sénégal	Pour une transparence total, permettant aux citoyens de connaitre tous les projets entretenu par l'état, leur avancement , blocages...	2025-11-08	2026-01-30	pending	2025-10-28 20:12:51	2025-10-28 20:12:51	2
\.


--
-- Data for Name: sprints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprints (id, number, start_date, deadline, objective, project_id, created_at, updated_at) FROM stdin;
1	1	2025-01-15	2025-01-29	Mise en place de l'architecture et authentification	1	2025-10-27 21:29:14	2025-10-27 21:29:14
2	2	2025-01-30	2025-02-13	Développement du catalogue produits	1	2025-10-27 21:29:14	2025-10-27 21:29:14
3	1	2025-02-01	2025-02-15	Interface administrateur et gestion des utilisateurs	2	2025-10-27 21:29:14	2025-10-27 21:29:14
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, title, description, user_story_id, assigned_to, created_at, updated_at, status) FROM stdin;
1	Créer la page de login	Développer l'interface de connexion avec validation	1	5	2025-10-27 21:29:14	2025-10-27 21:29:14	completed
2	Implémenter l'authentification	Développer le système d'authentification avec Laravel Sanctum	1	6	2025-10-27 21:29:14	2025-10-27 21:29:14	completed
3	Créer le formulaire d'inscription	Développer l'interface d'inscription avec validation des données	2	5	2025-10-27 21:29:14	2025-10-27 21:29:14	active
4	Page de modification du profil	Créer l'interface pour modifier les informations du profil	3	6	2025-10-27 21:29:14	2025-10-27 21:29:14	pending
5	implementation jwt	Gérer la partie backend de l'authentification register et login avec JWT	5	5	2025-10-28 23:12:28	2025-10-28 23:12:28	pending
\.


--
-- Data for Name: user_stories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_stories (id, title, description, sprint_id, product_backlog_id, status, created_at, updated_at, created_by) FROM stdin;
1	Authentification utilisateur	En tant qu'utilisateur, je veux pouvoir me connecter pour accéder à mon compte	1	1	completed	2025-10-27 21:29:14	2025-10-27 21:29:14	3
2	Création de compte	En tant que visiteur, je veux pouvoir créer un compte pour devenir client	1	1	completed	2025-10-27 21:29:14	2025-10-27 21:29:14	3
3	Gestion du profil	En tant qu'utilisateur, je veux modifier mon profil pour mettre à jour mes informations	1	1	active	2025-10-27 21:29:14	2025-10-27 21:29:14	3
4	Recherche de produits	En tant que client, je veux rechercher des produits pour trouver rapidement ce que je cherche	2	1	pending	2025-10-27 21:29:14	2025-10-27 21:29:14	3
6	Création de maquette high fi	Création de maquette high fi Création de maquette high fi Création de maquette high fi Création de maquette high fi Création de maquette high fi	\N	1	pending	2025-10-28 22:42:13	2025-10-28 22:42:13	\N
5	Crée la page de connexion	Une page de connexion avec JWT auth et tailwind css pour le design avec les directives	1	1	pending	2025-10-28 22:34:21	2025-10-28 22:48:26	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, avatar, email_verified_at, password, role, remember_token, created_at, updated_at) FROM stdin;
1	Admin User	admin@example.com	\N	2025-10-27 21:29:11	$2y$12$1sd9DmXO0KRB4xOOVQLIqujBLnQoxFOc41fy39SwHPtr/yPd3.sUG	admin	\N	2025-10-27 21:29:12	2025-10-27 21:29:12
2	Project Manager	pm@example.com	\N	2025-10-27 21:29:12	$2y$12$EWQr93egfhwASdP4U7Z4e.KtWGvWGWOz4kkSdLu.vcekansRQvWMi	projectManager	\N	2025-10-27 21:29:12	2025-10-27 21:29:12
3	Product Owner	po@example.com	\N	2025-10-27 21:29:12	$2y$12$nHUaU6VdF42Y3qL8VMQMf.uMkXpJ7i2t9h4kUJHh8ROY03bBuKGH.	productOwner	\N	2025-10-27 21:29:13	2025-10-27 21:29:13
4	Scrum Master	sm@example.com	\N	2025-10-27 21:29:13	$2y$12$0GvmxfWDXvu3sacs8qKd8Ov.6uApkwo2WgYGTpA2JvaeoeizHsbWO	scrumMaster	\N	2025-10-27 21:29:13	2025-10-27 21:29:13
5	Team Member 1	team1@example.com	\N	2025-10-27 21:29:13	$2y$12$6jMsR8twWRf3sMMBr77q.ufPXqdcwDrydkYBZPZhWxKhNzqTq0pf.	teamMember	\N	2025-10-27 21:29:13	2025-10-27 21:29:13
6	Team Member 2	team2@example.com	\N	2025-10-27 21:29:13	$2y$12$7c5rrApBa4QyTieY7SuAWuD58drbvFltRfhsxPVn5oLhjbq0hjbSu	teamMember	\N	2025-10-27 21:29:14	2025-10-27 21:29:14
\.


--
-- Name: chat_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_projects_id_seq', 3, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: increments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.increments_id_seq', 2, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 5, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 18, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 5, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: product_backlogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_backlogs_id_seq', 3, true);


--
-- Name: project_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_user_id_seq', 8, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- Name: sprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprints_id_seq', 3, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 5, true);


--
-- Name: user_stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_stories_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: chat_projects chat_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_projects
    ADD CONSTRAINT chat_projects_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: increments increments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.increments
    ADD CONSTRAINT increments_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: product_backlogs product_backlogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_backlogs
    ADD CONSTRAINT product_backlogs_pkey PRIMARY KEY (id);


--
-- Name: project_user project_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: sprints sprints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints
    ADD CONSTRAINT sprints_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: user_stories user_stories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_stories
    ADD CONSTRAINT user_stories_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: chat_projects chat_projects_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_projects
    ADD CONSTRAINT chat_projects_project_id_foreign FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: increments increments_user_story_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.increments
    ADD CONSTRAINT increments_user_story_id_foreign FOREIGN KEY (user_story_id) REFERENCES public.user_stories(id) ON DELETE CASCADE;


--
-- Name: messages messages_chat_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_chat_project_id_foreign FOREIGN KEY (chat_project_id) REFERENCES public.chat_projects(id) ON DELETE CASCADE;


--
-- Name: messages messages_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: notifications notifications_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: product_backlogs product_backlogs_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_backlogs
    ADD CONSTRAINT product_backlogs_project_id_foreign FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_user project_user_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_project_id_foreign FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_user project_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: projects projects_project_manager_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_project_manager_id_foreign FOREIGN KEY (project_manager_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: sprints sprints_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints
    ADD CONSTRAINT sprints_project_id_foreign FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: tasks tasks_assigned_to_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_assigned_to_foreign FOREIGN KEY (assigned_to) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tasks tasks_user_story_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_user_story_id_foreign FOREIGN KEY (user_story_id) REFERENCES public.user_stories(id) ON DELETE CASCADE;


--
-- Name: user_stories user_stories_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_stories
    ADD CONSTRAINT user_stories_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: user_stories user_stories_product_backlog_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_stories
    ADD CONSTRAINT user_stories_product_backlog_id_foreign FOREIGN KEY (product_backlog_id) REFERENCES public.product_backlogs(id) ON DELETE CASCADE;


--
-- Name: user_stories user_stories_sprint_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_stories
    ADD CONSTRAINT user_stories_sprint_id_foreign FOREIGN KEY (sprint_id) REFERENCES public.sprints(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

