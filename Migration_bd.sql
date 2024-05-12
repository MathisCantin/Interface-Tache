PGDMP  !                    |           tache    16.2 (Debian 16.2-1.pgdg120+2)    16.3      7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16389    tache    DATABASE     p   CREATE DATABASE tache WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';
    DROP DATABASE tache;
             
   tache_user    false            ;           0    0    tache    DATABASE PROPERTIES     .   ALTER DATABASE tache SET "TimeZone" TO 'utc';
                  
   tache_user    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             
   tache_user    false            <           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                
   tache_user    false    5            �            1259    16424    sous_taches    TABLE     �   CREATE TABLE public.sous_taches (
    id integer NOT NULL,
    tache_id integer,
    titre character varying(100),
    complete boolean
);
    DROP TABLE public.sous_taches;
       public         heap 
   tache_user    false    5            �            1259    16423    sous_taches_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sous_taches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sous_taches_id_seq;
       public       
   tache_user    false    5    220            =           0    0    sous_taches_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.sous_taches_id_seq OWNED BY public.sous_taches.id;
          public       
   tache_user    false    219            �            1259    16410    taches    TABLE     �   CREATE TABLE public.taches (
    id integer NOT NULL,
    utilisateur_id integer,
    titre character varying(100),
    description character varying(500),
    date_debut date,
    date_echeance date,
    complete boolean
);
    DROP TABLE public.taches;
       public         heap 
   tache_user    false    5            �            1259    16409    taches_id_seq    SEQUENCE     �   CREATE SEQUENCE public.taches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.taches_id_seq;
       public       
   tache_user    false    5    218            >           0    0    taches_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.taches_id_seq OWNED BY public.taches.id;
          public       
   tache_user    false    217            �            1259    16399    utilisateur    TABLE     �   CREATE TABLE public.utilisateur (
    id integer NOT NULL,
    nom character varying(30),
    prenom character varying(30),
    courriel character varying(255),
    cle_api character varying(30),
    password character varying(100)
);
    DROP TABLE public.utilisateur;
       public         heap 
   tache_user    false    5            �            1259    16398    utilisateur_id_seq    SEQUENCE     �   CREATE SEQUENCE public.utilisateur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.utilisateur_id_seq;
       public       
   tache_user    false    5    216            ?           0    0    utilisateur_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;
          public       
   tache_user    false    215            �           2604    16427    sous_taches id    DEFAULT     p   ALTER TABLE ONLY public.sous_taches ALTER COLUMN id SET DEFAULT nextval('public.sous_taches_id_seq'::regclass);
 =   ALTER TABLE public.sous_taches ALTER COLUMN id DROP DEFAULT;
       public       
   tache_user    false    220    219    220            �           2604    16413 	   taches id    DEFAULT     f   ALTER TABLE ONLY public.taches ALTER COLUMN id SET DEFAULT nextval('public.taches_id_seq'::regclass);
 8   ALTER TABLE public.taches ALTER COLUMN id DROP DEFAULT;
       public       
   tache_user    false    217    218    218            �           2604    16402    utilisateur id    DEFAULT     p   ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);
 =   ALTER TABLE public.utilisateur ALTER COLUMN id DROP DEFAULT;
       public       
   tache_user    false    215    216    216            4          0    16424    sous_taches 
   TABLE DATA           D   COPY public.sous_taches (id, tache_id, titre, complete) FROM stdin;
    public       
   tache_user    false    220   �"       2          0    16410    taches 
   TABLE DATA           m   COPY public.taches (id, utilisateur_id, titre, description, date_debut, date_echeance, complete) FROM stdin;
    public       
   tache_user    false    218   #       0          0    16399    utilisateur 
   TABLE DATA           S   COPY public.utilisateur (id, nom, prenom, courriel, cle_api, password) FROM stdin;
    public       
   tache_user    false    216   �#       @           0    0    sous_taches_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.sous_taches_id_seq', 5, true);
          public       
   tache_user    false    219            A           0    0    taches_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.taches_id_seq', 14, true);
          public       
   tache_user    false    217            B           0    0    utilisateur_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.utilisateur_id_seq', 4, true);
          public       
   tache_user    false    215            �           2606    16429    sous_taches sous_taches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.sous_taches
    ADD CONSTRAINT sous_taches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.sous_taches DROP CONSTRAINT sous_taches_pkey;
       public         
   tache_user    false    220            �           2606    16417    taches taches_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.taches
    ADD CONSTRAINT taches_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.taches DROP CONSTRAINT taches_pkey;
       public         
   tache_user    false    218            �           2606    16408 #   utilisateur utilisateur_cle_api_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_cle_api_key UNIQUE (cle_api);
 M   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_cle_api_key;
       public         
   tache_user    false    216            �           2606    16406 $   utilisateur utilisateur_courriel_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_courriel_key UNIQUE (courriel);
 N   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_courriel_key;
       public         
   tache_user    false    216            �           2606    16404    utilisateur utilisateur_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pkey;
       public         
   tache_user    false    216            �           2606    16430 %   sous_taches sous_taches_tache_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sous_taches
    ADD CONSTRAINT sous_taches_tache_id_fkey FOREIGN KEY (tache_id) REFERENCES public.taches(id);
 O   ALTER TABLE ONLY public.sous_taches DROP CONSTRAINT sous_taches_tache_id_fkey;
       public       
   tache_user    false    218    3227    220            �           2606    16418 !   taches taches_utilisateur_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taches
    ADD CONSTRAINT taches_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);
 K   ALTER TABLE ONLY public.taches DROP CONSTRAINT taches_utilisateur_id_fkey;
       public       
   tache_user    false    218    3225    216            4   !   x�3��tK�,JUHN�L�2r��t� ]q�      2   }   x�3�4�tK�,JUH������4202�50�52@0M9K�L�T��eTY�Z\�Pc�k`��L��A5(ag���p!� FD�dhL�"���<��̒�TN�A`s4VYU��qqq uE1      0   Z  x�]��n�0 Eѵ���-�aה&U���dP���Ɏ�q!��m�F��yw�?e-f�-m+,�iZOo�S�x�FɄ�vޭɆ�G���<��������
��jw��+l�����Ex<�}�VD|�/�{R��xA�@�W����}Q�AH�:Ԑ�r{PVƯ��ڊ,��X�h�0d�tl�H��:�<�G�����;E�� ��!�.5)��ߍ���i�\2��2���r�nf�{�s�j��,^V�fˏ�bb��k䜼.,}����C���o����-�3rn�¥�Ĺ��7v�j��%2Aη�[�FuM�4I�I����<F�U��E��l��     