PGDMP                         {            sprint_1_db    15.1    15.1     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16740    sprint_1_db    DATABASE     m   CREATE DATABASE sprint_1_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE sprint_1_db;
                postgres    false            ?            1259    16741    aircraft    TABLE     ?   CREATE TABLE public.aircraft (
    aircraft_id bigint NOT NULL,
    aircraft_type character varying(255) NOT NULL,
    airline_name character varying(255) NOT NULL,
    num_passengers bigint NOT NULL,
    passenger_id bigint
);
    DROP TABLE public.aircraft;
       public         heap    postgres    false            ?            1259    16746    airport_aircraft    TABLE     a   CREATE TABLE public.airport_aircraft (
    aircraft_id bigint NOT NULL,
    airport_id bigint
);
 $   DROP TABLE public.airport_aircraft;
       public         heap    postgres    false            ?            1259    16751    airport_city    TABLE     b   CREATE TABLE public.airport_city (
    city_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
     DROP TABLE public.airport_city;
       public         heap    postgres    false            ?            1259    16754    airports    TABLE     ?   CREATE TABLE public.airports (
    airport_id bigint NOT NULL,
    airport_name character varying(255) NOT NULL,
    airport_code character varying(255) NOT NULL
);
    DROP TABLE public.airports;
       public         heap    postgres    false            ?            1259    16759    cities    TABLE     ?   CREATE TABLE public.cities (
    city_id bigint NOT NULL,
    city_name character varying(255) NOT NULL,
    city_state character varying(255) NOT NULL,
    city_population bigint
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    16764 
   passengers    TABLE     ?   CREATE TABLE public.passengers (
    pass_id bigint NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    phone_num bigint NOT NULL,
    home_city_id bigint
);
    DROP TABLE public.passengers;
       public         heap    postgres    false                       0    16741    aircraft 
   TABLE DATA           j   COPY public.aircraft (aircraft_id, aircraft_type, airline_name, num_passengers, passenger_id) FROM stdin;
    public          postgres    false    214   ?       !          0    16746    airport_aircraft 
   TABLE DATA           C   COPY public.airport_aircraft (aircraft_id, airport_id) FROM stdin;
    public          postgres    false    215   ?       "          0    16751    airport_city 
   TABLE DATA           ;   COPY public.airport_city (city_id, airport_id) FROM stdin;
    public          postgres    false    216   C        #          0    16754    airports 
   TABLE DATA           J   COPY public.airports (airport_id, airport_name, airport_code) FROM stdin;
    public          postgres    false    217   ?        $          0    16759    cities 
   TABLE DATA           Q   COPY public.cities (city_id, city_name, city_state, city_population) FROM stdin;
    public          postgres    false    218   +!       %          0    16764 
   passengers 
   TABLE DATA           ]   COPY public.passengers (pass_id, first_name, last_name, phone_num, home_city_id) FROM stdin;
    public          postgres    false    219   ?!       ?           2606    16770    aircraft aircraft_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (aircraft_id);
 @   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT aircraft_pkey;
       public            postgres    false    214            ?           2606    16772    airports airports_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (airport_id);
 @   ALTER TABLE ONLY public.airports DROP CONSTRAINT airports_pkey;
       public            postgres    false    217            ?           2606    16774    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    218            ?           2606    16776    passengers city_id 
   CONSTRAINT     l   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT city_id UNIQUE (home_city_id) INCLUDE (home_city_id);
 <   ALTER TABLE ONLY public.passengers DROP CONSTRAINT city_id;
       public            postgres    false    219            ?           2606    16778    passengers passengers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (pass_id);
 D   ALTER TABLE ONLY public.passengers DROP CONSTRAINT passengers_pkey;
       public            postgres    false    219            ?           2606    16803    airport_aircraft aircraft_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.airport_aircraft
    ADD CONSTRAINT "aircraft_FK" FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(aircraft_id) NOT VALID;
 H   ALTER TABLE ONLY public.airport_aircraft DROP CONSTRAINT "aircraft_FK";
       public          postgres    false    215    214    3459            ?           2606    16779    airport_city airport_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.airport_city
    ADD CONSTRAINT "airport_FK" FOREIGN KEY (airport_id) REFERENCES public.airports(airport_id);
 C   ALTER TABLE ONLY public.airport_city DROP CONSTRAINT "airport_FK";
       public          postgres    false    217    3461    216            ?           2606    16810    airport_aircraft airport_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.airport_aircraft
    ADD CONSTRAINT "airport_FK" FOREIGN KEY (airport_id) REFERENCES public.airports(airport_id) NOT VALID;
 G   ALTER TABLE ONLY public.airport_aircraft DROP CONSTRAINT "airport_FK";
       public          postgres    false    3461    217    215            ?           2606    16784    cities city_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT "city_FK" FOREIGN KEY (city_id) REFERENCES public.airports(airport_id) NOT VALID;
 :   ALTER TABLE ONLY public.cities DROP CONSTRAINT "city_FK";
       public          postgres    false    218    217    3461            ?           2606    16789    airport_city city_FK    FK CONSTRAINT     {   ALTER TABLE ONLY public.airport_city
    ADD CONSTRAINT "city_FK" FOREIGN KEY (city_id) REFERENCES public.cities(city_id);
 @   ALTER TABLE ONLY public.airport_city DROP CONSTRAINT "city_FK";
       public          postgres    false    3463    216    218            ?           2606    16794    aircraft passenger_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT "passenger_FK" FOREIGN KEY (passenger_id) REFERENCES public.passengers(pass_id) NOT VALID;
 A   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT "passenger_FK";
       public          postgres    false    214    3467    219                ?   x?U??
?@E??W?Xf?y.G???B??LQD(
??W[*d??ssc??/S?<?TS??0??{?l?k??S????Ǻ?LZ:?&?_???>ADw?((??/?S?YDS??9?n?-?-&#\??c?:????"-[???y?eQmS???A??	?+?J?      !   A   x?%???0CѳTL?x	???_G???? ????t??b&}rOom???M?h?:??x.?/?	      "   /   x??I   ?????(??:H???'?Ų(7???r? ??????      #   ?   x?U???0G??O?ͭX?;wP,"?	.g?Pr?j??qi????~?????J??*?`/???$M6|w?gw?Z?V?J?#[????	?4?Sȩ??o?@(?`??????a'Bo??4.`?؋5I^I?7??E?[??J??N?7???"????K?      $   ?   x?%?=?0????+?????2h?B????UIH?Ԣ??m??伹;??;}??`Id/?ћp?WO?~?9X?'ؒ?	???VR??V?(???b????n??d????QG?sZc?Cn[U???,?bXգY?qdi??rk?MYQ?&?p&9??m?5??w/a?@4`      %   ?   x?]ϻ?@?z?ǘ}?ݻ?;[@?MpIx???B?b}2??c??	?|?'??LP6c?&??;%??5?J!8m,#?A?uq???d?(?j/^?@+r?Cw?yay?]l???%?b<	??I??׌???ֶ*?4?iks??ue?6Y?X?
??????"? ??C&     