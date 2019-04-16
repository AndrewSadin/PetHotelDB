CREATE TABLE clients
(
    clients_id numeric NOT NULL,
    phone character varying(200) COLLATE pg_catalog."default",
    name character varying(200) COLLATE pg_catalog."default",
    email character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT clients_pkey PRIMARY KEY (clients_id)
);

CREATE TABLE pet_kinds
(
    pet_kinds_id numeric NOT NULL,
    kind character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT pet_kinds_pk PRIMARY KEY (pet_kinds_id)
);

CREATE TABLE pet
(
    pet_id numeric NOT NULL,
    name character varying(200) COLLATE pg_catalog."default",
    kind numeric(200,0),
    CONSTRAINT pet_pkey PRIMARY KEY (pet_id),
    CONSTRAINT fk_155506324782623 FOREIGN KEY (kind)
        REFERENCES pet_kinds (pet_kinds_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        DEFERRABLE INITIALLY DEFERRED
)

CREATE TABLE clients_pets
(
    clients_pets_id numeric NOT NULL,
    client numeric(200,0),
    pet numeric(200,0),
    CONSTRAINT clients_pets_pk PRIMARY KEY (clients_pets_id),
    CONSTRAINT fk_155506315912630 FOREIGN KEY (pet)
        REFERENCES pet (pet_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT fk_155506316068944 FOREIGN KEY (client)
        REFERENCES clients (clients_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        DEFERRABLE INITIALLY DEFERRED
);