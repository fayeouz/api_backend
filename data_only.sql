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

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, name, email, avatar, email_verified_at, password, role, remember_token, created_at, updated_at) VALUES (1, 'Admin User', 'admin@example.com', NULL, '2025-10-27 21:29:11', '$2y$12$1sd9DmXO0KRB4xOOVQLIqujBLnQoxFOc41fy39SwHPtr/yPd3.sUG', 'admin', NULL, '2025-10-27 21:29:12', '2025-10-27 21:29:12');
INSERT INTO public.users (id, name, email, avatar, email_verified_at, password, role, remember_token, created_at, updated_at) VALUES (2, 'Project Manager', 'pm@example.com', NULL, '2025-10-27 21:29:12', '$2y$12$EWQr93egfhwASdP4U7Z4e.KtWGvWGWOz4kkSdLu.vcekansRQvWMi', 'projectManager', NULL, '2025-10-27 21:29:12', '2025-10-27 21:29:12');
INSERT INTO public.users (id, name, email, avatar, email_verified_at, password, role, remember_token, created_at, updated_at) VALUES (3, 'Product Owner', 'po@example.com', NULL, '2025-10-27 21:29:12', '$2y$12$nHUaU6VdF42Y3qL8VMQMf.uMkXpJ7i2t9h4kUJHh8ROY03bBuKGH.', 'productOwner', NULL, '2025-10-27 21:29:13', '2025-10-27 21:29:13');
INSERT INTO public.users (id, name, email, avatar, email_verified_at, password, role, remember_token, created_at, updated_at) VALUES (4, 'Scrum Master', 'sm@example.com', NULL, '2025-10-27 21:29:13', '$2y$12$0GvmxfWDXvu3sacs8qKd8Ov.6uApkwo2WgYGTpA2JvaeoeizHsbWO', 'scrumMaster', NULL, '2025-10-27 21:29:13', '2025-10-27 21:29:13');
INSERT INTO public.users (id, name, email, avatar, email_verified_at, password, role, remember_token, created_at, updated_at) VALUES (5, 'Team Member 1', 'team1@example.com', NULL, '2025-10-27 21:29:13', '$2y$12$6jMsR8twWRf3sMMBr77q.ufPXqdcwDrydkYBZPZhWxKhNzqTq0pf.', 'teamMember', NULL, '2025-10-27 21:29:13', '2025-10-27 21:29:13');
INSERT INTO public.users (id, name, email, avatar, email_verified_at, password, role, remember_token, created_at, updated_at) VALUES (6, 'Team Member 2', 'team2@example.com', NULL, '2025-10-27 21:29:13', '$2y$12$7c5rrApBa4QyTieY7SuAWuD58drbvFltRfhsxPVn5oLhjbq0hjbSu', 'teamMember', NULL, '2025-10-27 21:29:14', '2025-10-27 21:29:14');


ALTER TABLE public.users ENABLE TRIGGER ALL;

--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.projects DISABLE TRIGGER ALL;

INSERT INTO public.projects (id, name, description, start_date, deadline, status, created_at, updated_at, project_manager_id) VALUES (1, 'Application E-commerce', 'Développement d''une plateforme e-commerce complète', '2025-01-15', '2025-06-15', 'active', '2025-10-27 21:29:14', '2025-10-27 21:29:14', 2);
INSERT INTO public.projects (id, name, description, start_date, deadline, status, created_at, updated_at, project_manager_id) VALUES (2, 'Système de Gestion de Contenu', 'CMS pour la gestion de contenu d''entreprise', '2025-02-01', '2025-05-01', 'pending', '2025-10-27 21:29:14', '2025-10-27 21:29:14', 2);
INSERT INTO public.projects (id, name, description, start_date, deadline, status, created_at, updated_at, project_manager_id) VALUES (3, 'Gestion Projet Etat Sénégal', 'Pour une transparence total, permettant aux citoyens de connaitre tous les projets entretenu par l''état, leur avancement , blocages...', '2025-11-08', '2026-01-30', 'pending', '2025-10-28 20:12:51', '2025-10-28 20:12:51', 2);


ALTER TABLE public.projects ENABLE TRIGGER ALL;

--
-- Data for Name: chat_projects; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.chat_projects DISABLE TRIGGER ALL;

INSERT INTO public.chat_projects (id, project_id, created_at, updated_at) VALUES (1, 1, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.chat_projects (id, project_id, created_at, updated_at) VALUES (2, 2, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.chat_projects (id, project_id, created_at, updated_at) VALUES (3, 3, '2025-10-28 20:12:51', '2025-10-28 20:12:51');


ALTER TABLE public.chat_projects ENABLE TRIGGER ALL;

--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.failed_jobs DISABLE TRIGGER ALL;



ALTER TABLE public.failed_jobs ENABLE TRIGGER ALL;

--
-- Data for Name: product_backlogs; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.product_backlogs DISABLE TRIGGER ALL;

INSERT INTO public.product_backlogs (id, project_id, created_at, updated_at) VALUES (1, 1, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.product_backlogs (id, project_id, created_at, updated_at) VALUES (2, 2, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.product_backlogs (id, project_id, created_at, updated_at) VALUES (3, 3, '2025-10-28 20:12:51', '2025-10-28 20:12:51');


ALTER TABLE public.product_backlogs ENABLE TRIGGER ALL;

--
-- Data for Name: sprints; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.sprints DISABLE TRIGGER ALL;

INSERT INTO public.sprints (id, number, start_date, deadline, objective, project_id, created_at, updated_at) VALUES (1, 1, '2025-01-15', '2025-01-29', 'Mise en place de l''architecture et authentification', 1, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.sprints (id, number, start_date, deadline, objective, project_id, created_at, updated_at) VALUES (2, 2, '2025-01-30', '2025-02-13', 'Développement du catalogue produits', 1, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.sprints (id, number, start_date, deadline, objective, project_id, created_at, updated_at) VALUES (3, 1, '2025-02-01', '2025-02-15', 'Interface administrateur et gestion des utilisateurs', 2, '2025-10-27 21:29:14', '2025-10-27 21:29:14');


ALTER TABLE public.sprints ENABLE TRIGGER ALL;

--
-- Data for Name: user_stories; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.user_stories DISABLE TRIGGER ALL;

INSERT INTO public.user_stories (id, title, description, sprint_id, product_backlog_id, status, created_at, updated_at, created_by) VALUES (1, 'Authentification utilisateur', 'En tant qu''utilisateur, je veux pouvoir me connecter pour accéder à mon compte', 1, 1, 'completed', '2025-10-27 21:29:14', '2025-10-27 21:29:14', 3);
INSERT INTO public.user_stories (id, title, description, sprint_id, product_backlog_id, status, created_at, updated_at, created_by) VALUES (2, 'Création de compte', 'En tant que visiteur, je veux pouvoir créer un compte pour devenir client', 1, 1, 'completed', '2025-10-27 21:29:14', '2025-10-27 21:29:14', 3);
INSERT INTO public.user_stories (id, title, description, sprint_id, product_backlog_id, status, created_at, updated_at, created_by) VALUES (3, 'Gestion du profil', 'En tant qu''utilisateur, je veux modifier mon profil pour mettre à jour mes informations', 1, 1, 'active', '2025-10-27 21:29:14', '2025-10-27 21:29:14', 3);
INSERT INTO public.user_stories (id, title, description, sprint_id, product_backlog_id, status, created_at, updated_at, created_by) VALUES (4, 'Recherche de produits', 'En tant que client, je veux rechercher des produits pour trouver rapidement ce que je cherche', 2, 1, 'pending', '2025-10-27 21:29:14', '2025-10-27 21:29:14', 3);
INSERT INTO public.user_stories (id, title, description, sprint_id, product_backlog_id, status, created_at, updated_at, created_by) VALUES (6, 'Création de maquette high fi', 'Création de maquette high fi Création de maquette high fi Création de maquette high fi Création de maquette high fi Création de maquette high fi', NULL, 1, 'pending', '2025-10-28 22:42:13', '2025-10-28 22:42:13', NULL);
INSERT INTO public.user_stories (id, title, description, sprint_id, product_backlog_id, status, created_at, updated_at, created_by) VALUES (5, 'Crée la page de connexion', 'Une page de connexion avec JWT auth et tailwind css pour le design avec les directives', 1, 1, 'pending', '2025-10-28 22:34:21', '2025-10-28 22:48:26', NULL);


ALTER TABLE public.user_stories ENABLE TRIGGER ALL;

--
-- Data for Name: increments; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.increments DISABLE TRIGGER ALL;

INSERT INTO public.increments (id, name, user_story_id, image, file, link, created_at, updated_at) VALUES (1, 'Sprint 1 - Authentification', 1, NULL, 'documentation_sprint1.pdf', 'https://github.com/project/releases/v1.0', '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.increments (id, name, user_story_id, image, file, link, created_at, updated_at) VALUES (2, 'Maquettes interface', 2, 'maquette_inscription.png', NULL, NULL, '2025-10-27 21:29:14', '2025-10-27 21:29:14');


ALTER TABLE public.increments ENABLE TRIGGER ALL;

--
-- Data for Name: meetings; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.meetings DISABLE TRIGGER ALL;

INSERT INTO public.meetings (id, title, description, type, duration, user_id, project_id, created_at, updated_at) VALUES (1, 'Daily Standup', 'Reuinion demain pour voir les avancement du projets', 'daily_standup', 15, 4, 1, '2025-11-10 16:16:48', '2025-11-10 16:16:48');


ALTER TABLE public.meetings ENABLE TRIGGER ALL;

--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.messages DISABLE TRIGGER ALL;

INSERT INTO public.messages (id, content, chat_project_id, user_id, created_at, updated_at) VALUES (1, 'Bonjour tout le monde ! Bienvenue sur le projet Application E-commerce.', 1, 2, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.messages (id, content, chat_project_id, user_id, created_at, updated_at) VALUES (2, 'Quelqu''un a commencé à travailler sur l''authentification ?', 1, 4, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.messages (id, content, chat_project_id, user_id, created_at, updated_at) VALUES (3, 'Oui, je m''en occupe. Je devrais finir demain.', 1, 5, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.messages (id, content, chat_project_id, user_id, created_at, updated_at) VALUES (4, 'Bonjour', 1, 4, '2025-10-28 20:02:33', '2025-10-28 20:02:33');
INSERT INTO public.messages (id, content, chat_project_id, user_id, created_at, updated_at) VALUES (5, 'bonsoir vous allez bien', 1, 3, '2025-10-28 23:06:45', '2025-10-28 23:06:45');
INSERT INTO public.messages (id, content, chat_project_id, user_id, created_at, updated_at) VALUES (6, 'Bonsoir', 1, 2, '2025-11-10 19:17:19', '2025-11-10 19:17:19');


ALTER TABLE public.messages ENABLE TRIGGER ALL;

--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.migrations DISABLE TRIGGER ALL;

INSERT INTO public.migrations (id, migration, batch) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (5, '2025_10_03_001448_create_projects_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (6, '2025_10_03_005804_create_project_user_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (7, '2025_10_03_005838_create_sprints_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (8, '2025_10_03_010001_create_product_backlogs_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (9, '2025_10_03_010059_create_user_stories_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (10, '2025_10_03_011613_create_tasks_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (11, '2025_10_03_011929_create_increments_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (12, '2025_10_03_012656_create_chat_projects_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (13, '2025_10_03_012726_create_messages_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (14, '2025_10_03_014503_create_notifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (15, '2025_10_09_133631_create_projects_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (16, '2025_10_09_222540_create_tasks_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (17, '2025_10_12_140825_create_notifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (18, '2025_10_17_193540_create_user_stories_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (19, '2025_11_08_140551_create_meetings_table', 2);


ALTER TABLE public.migrations ENABLE TRIGGER ALL;

--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.notifications DISABLE TRIGGER ALL;

INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (1, 'Nouvelle tâche assignée', 'La tâche "Créer la page de login" vous a été assignée', 5, '2025-10-27 21:29:14', '2025-10-27 21:29:14', false);
INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (2, 'Tâche terminée', 'La tâche "Implémenter l''authentification" a été marquée comme terminée', 2, '2025-10-27 21:29:14', '2025-10-27 21:29:14', true);
INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (3, 'Nouveau message', 'Nouveau message dans le chat du projet Application E-commerce', 3, '2025-10-27 21:29:14', '2025-10-27 21:29:14', false);
INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (4, 'Added to Project', 'You have been added to the project ''Gestion Projet Etat Sénégal'' by Project Manager', 4, '2025-10-28 22:20:33', '2025-10-28 22:20:33', false);
INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (5, 'New Task Assigned', 'You have been assigned a new task ''implementation jwt'' by Scrum Master', 5, '2025-10-28 23:12:28', '2025-10-28 23:12:28', false);
INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (6, 'New Meeting Scheduled', 'A new Daily Standup meeting titled ''Daily Standup'' has been scheduled for project ''Application E-commerce'' by Scrum Master. Duration: 15 minutes.', 2, '2025-11-10 16:16:49', '2025-11-10 16:16:49', false);
INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (7, 'New Meeting Scheduled', 'A new Daily Standup meeting titled ''Daily Standup'' has been scheduled for project ''Application E-commerce'' by Scrum Master. Duration: 15 minutes.', 3, '2025-11-10 16:16:49', '2025-11-10 16:16:49', false);
INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (8, 'New Meeting Scheduled', 'A new Daily Standup meeting titled ''Daily Standup'' has been scheduled for project ''Application E-commerce'' by Scrum Master. Duration: 15 minutes.', 5, '2025-11-10 16:16:49', '2025-11-10 16:16:49', false);
INSERT INTO public.notifications (id, object, message, user_id, created_at, updated_at, is_read) VALUES (9, 'New Meeting Scheduled', 'A new Daily Standup meeting titled ''Daily Standup'' has been scheduled for project ''Application E-commerce'' by Scrum Master. Duration: 15 minutes.', 6, '2025-11-10 16:16:49', '2025-11-10 16:16:49', false);


ALTER TABLE public.notifications ENABLE TRIGGER ALL;

--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.password_reset_tokens DISABLE TRIGGER ALL;



ALTER TABLE public.password_reset_tokens ENABLE TRIGGER ALL;

--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.personal_access_tokens DISABLE TRIGGER ALL;



ALTER TABLE public.personal_access_tokens ENABLE TRIGGER ALL;

--
-- Data for Name: project_user; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.project_user DISABLE TRIGGER ALL;

INSERT INTO public.project_user (id, project_id, user_id, created_at, updated_at) VALUES (1, 1, 2, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.project_user (id, project_id, user_id, created_at, updated_at) VALUES (2, 1, 3, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.project_user (id, project_id, user_id, created_at, updated_at) VALUES (3, 1, 4, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.project_user (id, project_id, user_id, created_at, updated_at) VALUES (4, 1, 5, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.project_user (id, project_id, user_id, created_at, updated_at) VALUES (5, 1, 6, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.project_user (id, project_id, user_id, created_at, updated_at) VALUES (6, 2, 2, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.project_user (id, project_id, user_id, created_at, updated_at) VALUES (7, 2, 5, '2025-10-27 21:29:14', '2025-10-27 21:29:14');
INSERT INTO public.project_user (id, project_id, user_id, created_at, updated_at) VALUES (8, 3, 4, '2025-10-28 22:20:33', '2025-10-28 22:20:33');


ALTER TABLE public.project_user ENABLE TRIGGER ALL;

--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.tasks DISABLE TRIGGER ALL;

INSERT INTO public.tasks (id, title, description, user_story_id, assigned_to, created_at, updated_at, status) VALUES (1, 'Créer la page de login', 'Développer l''interface de connexion avec validation', 1, 5, '2025-10-27 21:29:14', '2025-10-27 21:29:14', 'completed');
INSERT INTO public.tasks (id, title, description, user_story_id, assigned_to, created_at, updated_at, status) VALUES (2, 'Implémenter l''authentification', 'Développer le système d''authentification avec Laravel Sanctum', 1, 6, '2025-10-27 21:29:14', '2025-10-27 21:29:14', 'completed');
INSERT INTO public.tasks (id, title, description, user_story_id, assigned_to, created_at, updated_at, status) VALUES (3, 'Créer le formulaire d''inscription', 'Développer l''interface d''inscription avec validation des données', 2, 5, '2025-10-27 21:29:14', '2025-10-27 21:29:14', 'active');
INSERT INTO public.tasks (id, title, description, user_story_id, assigned_to, created_at, updated_at, status) VALUES (4, 'Page de modification du profil', 'Créer l''interface pour modifier les informations du profil', 3, 6, '2025-10-27 21:29:14', '2025-10-27 21:29:14', 'pending');
INSERT INTO public.tasks (id, title, description, user_story_id, assigned_to, created_at, updated_at, status) VALUES (5, 'implementation jwt', 'Gérer la partie backend de l''authentification register et login avec JWT', 5, 5, '2025-10-28 23:12:28', '2025-11-10 22:06:45', 'active');


ALTER TABLE public.tasks ENABLE TRIGGER ALL;

--
-- Name: chat_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chat_projects_id_seq', 3, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: increments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.increments_id_seq', 2, true);


--
-- Name: meetings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meetings_id_seq', 1, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 6, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 19, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_id_seq', 9, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: product_backlogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_backlogs_id_seq', 3, true);


--
-- Name: project_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.project_user_id_seq', 8, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- Name: sprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sprints_id_seq', 3, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tasks_id_seq', 5, true);


--
-- Name: user_stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_stories_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

