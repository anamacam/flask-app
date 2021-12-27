

CREATE TABLE IF NOT EXISTS cuentas(
     code INT NOT NULL,
     name CHAR(50),
     dni FLOAT,
     numero_cuetal FLOAT
     PRIMARY KEY('code')
);

CREATE TABLE IF NOT EXISTS proceso_cuentas(
)