--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    email character varying(254),
    phone character varying(20),
    address1 character varying(50),
    address2 character varying(50),
    city character varying(50),
    postal_code character varying(50),
    province character varying(50),
    country character varying(50),
    active boolean NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.employee OWNER TO rester;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.schedule (
    id integer NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    pay_rate numeric(20,2) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed boolean NOT NULL,
    employee_id integer NOT NULL,
    location_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.schedule OWNER TO rester;

--
-- Name: site; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.site (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    email character varying(254),
    phone character varying(20),
    address1 character varying(50),
    address2 character varying(50),
    city character varying(50),
    postal_code character varying(50),
    province character varying(50),
    country character varying(50),
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.site OWNER TO rester;

--
-- Name: attendance; Type: VIEW; Schema: public; Owner: eodonnell
--

CREATE VIEW public.attendance AS
 SELECT row_number() OVER () AS id,
    si.id AS site_id,
    e.id AS employee_id,
    e.name AS employee,
    date_part('month'::text, s.start) AS class_month,
    date_part('year'::text, s.start) AS class_year,
    sum(
        CASE
            WHEN (s.completed = true) THEN 1
            ELSE 0
        END) AS showed_up,
    sum(
        CASE
            WHEN (s.completed = false) THEN 1
            ELSE 0
        END) AS no_show,
    ((sum(
        CASE
            WHEN (s.completed = true) THEN 1
            ELSE 0
        END))::numeric * s.pay_rate) AS monthly_pay
   FROM ((public.schedule s
     JOIN public.employee e ON ((s.employee_id = e.id)))
     JOIN public.site si ON ((e.site_id = si.id)))
  GROUP BY si.id, e.id, e.name, (date_part('month'::text, s.start)), (date_part('year'::text, s.start)), s.pay_rate
  ORDER BY (date_part('year'::text, s.start)), (date_part('month'::text, s.start)), e.name;


ALTER TABLE public.attendance OWNER TO eodonnell;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO rester;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO rester;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO rester;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO rester;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO rester;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO rester;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    site_id integer
);


ALTER TABLE public.auth_user OWNER TO rester;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO rester;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO rester;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO rester;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO rester;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO rester;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO rester;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO rester;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO rester;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO rester;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO rester;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO rester;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO rester;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO rester;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: rester
--

CREATE TABLE public.location (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(20) NOT NULL,
    address1 character varying(50) NOT NULL,
    address2 character varying(50),
    city character varying(50),
    postal_code character varying(50),
    province character varying(50),
    country character varying(50),
    latitude numeric(9,4),
    longitude numeric(9,4),
    description text,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.location OWNER TO rester;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO rester;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_id_seq OWNER TO rester;

--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.schedule_id_seq OWNED BY public.schedule.id;


--
-- Name: site_id_seq; Type: SEQUENCE; Schema: public; Owner: rester
--

CREATE SEQUENCE public.site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_id_seq OWNER TO rester;

--
-- Name: site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rester
--

ALTER SEQUENCE public.site_id_seq OWNED BY public.site.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: location id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- Name: schedule id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.schedule ALTER COLUMN id SET DEFAULT nextval('public.schedule_id_seq'::regclass);


--
-- Name: site id; Type: DEFAULT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.site ALTER COLUMN id SET DEFAULT nextval('public.site_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add Employee	4	add_employee
14	Can change Employee	4	change_employee
15	Can delete Employee	4	delete_employee
16	Can view Employee	4	view_employee
17	Can add Location	5	add_location
18	Can change Location	5	change_location
19	Can delete Location	5	delete_location
20	Can view Location	5	view_location
21	Can add User	6	add_user
22	Can change User	6	change_user
23	Can delete User	6	delete_user
24	Can view User	6	view_user
25	Can add Site	7	add_site
26	Can change Site	7	change_site
27	Can delete Site	7	delete_site
28	Can view Site	7	view_site
29	Can add Attendance	8	add_attendance
30	Can change Attendance	8	change_attendance
31	Can delete Attendance	8	delete_attendance
32	Can view Attendance	8	view_attendance
33	Can add Schedule	9	add_schedule
34	Can change Schedule	9	change_schedule
35	Can delete Schedule	9	delete_schedule
36	Can view Schedule	9	view_schedule
37	Can add log entry	10	add_logentry
38	Can change log entry	10	change_logentry
39	Can delete log entry	10	delete_logentry
40	Can view log entry	10	view_logentry
41	Can add session	11	add_session
42	Can change session	11	change_session
43	Can delete session	11	delete_session
44	Can view session	11	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, site_id) FROM stdin;
1	pbkdf2_sha256$120000$FFAPPPNHFRoh$TI3zsjGMCXLF6XMDlE+Uymu6oHZe0IS3EYs5iVY//D0=	\N	t	jason			jasonodonnell@yahoo.com	t	t	2018-12-18 10:22:06.199009-08	1
6	pbkdf2_sha256$120000$WQd0LYDNDbY8$Nbc7kfAWwJlnk8JtOeawT9lISfnWWJP/wRS8B6Dbu0o=	\N	f	eddyod	Edward	ODonnell	eddyod@yahoo.com	t	t	2018-12-18 15:40:02.062714-08	8
7	pbkdf2_sha256$120000$MNcdAAp5i6ne$gd7fysMnhTtykx7ZRJ03Dok1VLJaW/85vpu/Vpj+Qm8=	\N	f	joe	Joe	Blow	joe@blow.tuesday.com	t	t	2018-12-18 15:41:14.204273-08	9
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	employees	employee
5	locations	location
6	users	user
7	sites	site
8	schedules	attendance
9	schedules	schedule
10	admin	logentry
11	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
2	contenttypes	0001_initial	2018-12-18 10:19:02.583834-08
3	contenttypes	0002_remove_content_type_name	2018-12-18 10:19:02.598052-08
4	auth	0001_initial	2018-12-18 10:19:02.693904-08
5	auth	0002_alter_permission_name_max_length	2018-12-18 10:19:02.719704-08
6	auth	0003_alter_user_email_max_length	2018-12-18 10:19:02.736121-08
7	auth	0004_alter_user_username_opts	2018-12-18 10:19:02.744771-08
8	auth	0005_alter_user_last_login_null	2018-12-18 10:19:02.751842-08
9	auth	0006_require_contenttypes_0002	2018-12-18 10:19:02.755433-08
10	auth	0007_alter_validators_add_error_messages	2018-12-18 10:19:02.766566-08
11	auth	0008_alter_user_username_max_length	2018-12-18 10:19:02.775119-08
12	auth	0009_alter_user_last_name_max_length	2018-12-18 10:19:02.782083-08
13	users	0001_initial	2018-12-18 10:19:02.897919-08
14	sites	0001_initial	2018-12-18 10:19:59.389801-08
15	employees	0001_initial	2018-12-18 10:20:15.35081-08
16	locations	0001_initial	2018-12-18 10:20:24.396315-08
17	schedules	0001_initial	2018-12-18 10:20:31.850829-08
18	schedules	0002_schedule	2018-12-18 10:20:31.902112-08
19	admin	0001_initial	2018-12-18 10:21:17.770212-08
20	admin	0002_logentry_remove_auto_add	2018-12-18 10:21:17.780179-08
21	admin	0003_logentry_add_action_flag_choices	2018-12-18 10:21:17.789833-08
22	sessions	0001_initial	2018-12-18 10:21:29.323851-08
23	users	0002_auto_20181218_1141	2018-12-18 11:41:43.678056-08
24	sites	0002_auto_20181218_1141	2018-12-18 11:41:48.119098-08
25	users	0003_auto_20181218_1225	2018-12-18 12:25:31.899248-08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.employee (id, name, email, phone, address1, address2, city, postal_code, province, country, active, site_id, user_id) FROM stdin;
1	Edward ODonnell	eddyod@yahoo.com	215-555-1212	4057 Brant St	\N	\N	\N	\N	\N	t	3	\N
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.location (id, name, email, phone, address1, address2, city, postal_code, province, country, latitude, longitude, description, created, active, site_id) FROM stdin;
1	School X	school@school.com	555-1212	4057 Brant St	\N	\N	\N	\N	\N	\N	\N	\N	2018-12-18 12:40:43.846235-08	t	3
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.schedule (id, start, "end", pay_rate, created, completed, employee_id, location_id, site_id) FROM stdin;
1	2018-12-24 09:00:00-08	2018-12-18 10:00:00-08	10.00	2018-12-18 12:42:04.732795-08	t	1	1	3
2	2018-12-18 12:00:00-08	2018-12-18 13:00:00-08	10.00	2018-12-18 12:43:14.397584-08	t	1	1	3
3	2018-12-25 12:00:00-08	2018-12-25 13:00:00-08	10.00	2018-12-18 12:43:14.399869-08	t	1	1	3
4	2018-12-19 12:00:00-08	2018-12-19 13:00:00-08	10.00	2018-12-18 12:43:14.400547-08	t	1	1	3
5	2018-12-24 12:00:00-08	2018-12-24 13:00:00-08	10.00	2018-12-18 12:43:14.408933-08	t	1	1	3
6	2018-12-26 12:00:00-08	2018-12-26 13:00:00-08	10.00	2018-12-18 12:43:14.430549-08	t	1	1	3
7	2018-12-31 12:00:00-08	2018-12-31 13:00:00-08	10.00	2018-12-18 12:43:14.432209-08	t	1	1	3
8	2019-01-01 12:00:00-08	2019-01-01 13:00:00-08	10.00	2018-12-18 12:43:14.478732-08	t	1	1	3
9	2019-01-14 12:00:00-08	2019-01-14 13:00:00-08	10.00	2018-12-18 12:43:14.482591-08	t	1	1	3
10	2019-01-08 12:00:00-08	2019-01-08 13:00:00-08	10.00	2018-12-18 12:43:14.487377-08	t	1	1	3
11	2019-01-15 12:00:00-08	2019-01-15 13:00:00-08	10.00	2018-12-18 12:43:14.502625-08	t	1	1	3
12	2019-01-07 12:00:00-08	2019-01-07 13:00:00-08	10.00	2018-12-18 12:43:14.506363-08	t	1	1	3
13	2019-01-09 12:00:00-08	2019-01-09 13:00:00-08	10.00	2018-12-18 12:43:14.523965-08	t	1	1	3
14	2019-01-02 12:00:00-08	2019-01-02 13:00:00-08	10.00	2018-12-18 12:43:14.525414-08	t	1	1	3
15	2019-01-16 12:00:00-08	2019-01-16 13:00:00-08	10.00	2018-12-18 12:43:14.538464-08	t	1	1	3
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: rester
--

COPY public.site (id, name, email, phone, address1, address2, city, postal_code, province, country, created, active, owner_id) FROM stdin;
1	Company 1 for user 1	\N	\N	\N	\N	\N	\N	\N	\N	2018-12-18 10:33:23.250369-08	t	1
2	Company 1 for user 1	\N	\N	\N	\N	\N	\N	\N	\N	2018-12-18 10:35:07.319606-08	t	1
3	Company 1 for user 1	\N	\N	\N	\N	\N	\N	\N	\N	2018-12-18 10:35:49.590151-08	t	1
8	Joes Death and Destruction	\N	\N	666 Hades Way	\N	\N	\N	\N	\N	2018-12-18 15:40:16.35985-08	t	6
9	Bloomsburg College	\N	\N	Bloomsburg PA	\N	\N	\N	\N	\N	2018-12-18 15:41:19.680939-08	t	7
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.employee_id_seq', 1, true);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.location_id_seq', 1, true);


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.schedule_id_seq', 15, true);


--
-- Name: site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rester
--

SELECT pg_catalog.setval('public.site_id_seq', 9, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: employee employee_user_id_key; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_user_id_key UNIQUE (user_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_company_id_3d0da8e0; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_user_company_id_3d0da8e0 ON public.auth_user USING btree (site_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: employee_site_id_f419377a; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX employee_site_id_f419377a ON public.employee USING btree (site_id);


--
-- Name: location_site_id_b0ff19a8; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX location_site_id_b0ff19a8 ON public.location USING btree (site_id);


--
-- Name: schedule_employee_id_c24e966a; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX schedule_employee_id_c24e966a ON public.schedule USING btree (employee_id);


--
-- Name: schedule_location_id_d296afa1; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX schedule_location_id_d296afa1 ON public.schedule USING btree (location_id);


--
-- Name: schedule_site_id_074f37d3; Type: INDEX; Schema: public; Owner: rester
--

CREATE INDEX schedule_site_id_074f37d3 ON public.schedule USING btree (site_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user auth_user_site_id_9dd37fc4_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_site_id_9dd37fc4_fk_site_id FOREIGN KEY (site_id) REFERENCES public.site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employee employee_site_id_f419377a_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_site_id_f419377a_fk_site_id FOREIGN KEY (site_id) REFERENCES public.site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employee employee_user_id_cc4f5a1c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_user_id_cc4f5a1c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location location_site_id_b0ff19a8_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_site_id_b0ff19a8_fk_site_id FOREIGN KEY (site_id) REFERENCES public.site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule schedule_employee_id_c24e966a_fk_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_employee_id_c24e966a_fk_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule schedule_location_id_d296afa1_fk_location_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_location_id_d296afa1_fk_location_id FOREIGN KEY (location_id) REFERENCES public.location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schedule schedule_site_id_074f37d3_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: rester
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_site_id_074f37d3_fk_site_id FOREIGN KEY (site_id) REFERENCES public.site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TABLE attendance; Type: ACL; Schema: public; Owner: eodonnell
--

GRANT ALL ON TABLE public.attendance TO rester;


--
-- PostgreSQL database dump complete
--

