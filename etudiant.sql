PGDMP         -                |            etudiant    9.6.24    9.6.24      j           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            k           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            l           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            m           1262    16488    etudiant    DATABASE     �   CREATE DATABASE etudiant WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE etudiant;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            n           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            o           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16642    classe    TABLE     p   CREATE TABLE public.classe (
    id_classe integer NOT NULL,
    designation character varying(255) NOT NULL
);
    DROP TABLE public.classe;
       public         postgres    false    3            �            1259    16640    classe_id_classe_seq    SEQUENCE     }   CREATE SEQUENCE public.classe_id_classe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.classe_id_classe_seq;
       public       postgres    false    3    188            p           0    0    classe_id_classe_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.classe_id_classe_seq OWNED BY public.classe.id_classe;
            public       postgres    false    187            �            1259    16651    eleve    TABLE       CREATE TABLE public.eleve (
    id_eleve integer NOT NULL,
    matricule character varying(255) NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    age integer NOT NULL,
    designation character varying(255) NOT NULL
);
    DROP TABLE public.eleve;
       public         postgres    false    3            �            1259    16649    eleve_id_eleve_seq    SEQUENCE     {   CREATE SEQUENCE public.eleve_id_eleve_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.eleve_id_eleve_seq;
       public       postgres    false    3    190            q           0    0    eleve_id_eleve_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.eleve_id_eleve_seq OWNED BY public.eleve.id_eleve;
            public       postgres    false    189            �            1259    16567    login    TABLE     �   CREATE TABLE public.login (
    id integer NOT NULL,
    utilisateur character varying(250) NOT NULL,
    motdepasse character varying(250) NOT NULL
);
    DROP TABLE public.login;
       public         postgres    false    3            �            1259    16565    login_id_seq    SEQUENCE     u   CREATE SEQUENCE public.login_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.login_id_seq;
       public       postgres    false    186    3            r           0    0    login_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;
            public       postgres    false    185            �           2604    16645    classe id_classe    DEFAULT     t   ALTER TABLE ONLY public.classe ALTER COLUMN id_classe SET DEFAULT nextval('public.classe_id_classe_seq'::regclass);
 ?   ALTER TABLE public.classe ALTER COLUMN id_classe DROP DEFAULT;
       public       postgres    false    187    188    188            �           2604    16654    eleve id_eleve    DEFAULT     p   ALTER TABLE ONLY public.eleve ALTER COLUMN id_eleve SET DEFAULT nextval('public.eleve_id_eleve_seq'::regclass);
 =   ALTER TABLE public.eleve ALTER COLUMN id_eleve DROP DEFAULT;
       public       postgres    false    190    189    190            �           2604    16570    login id    DEFAULT     d   ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);
 7   ALTER TABLE public.login ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    186    186            e          0    16642    classe 
   TABLE DATA               8   COPY public.classe (id_classe, designation) FROM stdin;
    public       postgres    false    188   .        s           0    0    classe_id_classe_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.classe_id_classe_seq', 10, true);
            public       postgres    false    187            g          0    16651    eleve 
   TABLE DATA               S   COPY public.eleve (id_eleve, matricule, nom, prenom, age, designation) FROM stdin;
    public       postgres    false    190   d        t           0    0    eleve_id_eleve_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.eleve_id_eleve_seq', 9, true);
            public       postgres    false    189            c          0    16567    login 
   TABLE DATA               <   COPY public.login (id, utilisateur, motdepasse) FROM stdin;
    public       postgres    false    186   �        u           0    0    login_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.login_id_seq', 1, true);
            public       postgres    false    185            �           2606    16647    classe classe_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_pkey PRIMARY KEY (designation);
 <   ALTER TABLE ONLY public.classe DROP CONSTRAINT classe_pkey;
       public         postgres    false    188    188            �           2606    16661    eleve eleve_matricule_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT eleve_matricule_key UNIQUE (matricule);
 C   ALTER TABLE ONLY public.eleve DROP CONSTRAINT eleve_matricule_key;
       public         postgres    false    190    190            �           2606    16659    eleve eleve_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT eleve_pkey PRIMARY KEY (id_eleve);
 :   ALTER TABLE ONLY public.eleve DROP CONSTRAINT eleve_pkey;
       public         postgres    false    190    190            �           2606    16575    login login_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.login DROP CONSTRAINT login_pkey;
       public         postgres    false    186    186            �           2606    16577    login login_utilisateur_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_utilisateur_key UNIQUE (utilisateur);
 E   ALTER TABLE ONLY public.login DROP CONSTRAINT login_utilisateur_key;
       public         postgres    false    186    186            �           2606    16662    eleve eleve_designation_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT eleve_designation_fkey FOREIGN KEY (designation) REFERENCES public.classe(designation);
 F   ALTER TABLE ONLY public.eleve DROP CONSTRAINT eleve_designation_fkey;
       public       postgres    false    188    2023    190            e   &   x�3�4N�M�2�4Qf�f ʜ�DYp���=... �[	0      g   t   x�%���@��Fo��\
s&V6[\"P���E2�L& ����_�-��թ�RP��-��4u�Eܓ;R�$�y�̥�s�����W$�����@/�w�t�߃����3�      c      x�3�LL����4426����� *��     