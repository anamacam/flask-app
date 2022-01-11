

CREATE TABLE IF NOT EXISTS personas(
    id = Column(Integer, primary_key=True),
    nombre = Column(String(100), nullable=False),
    fecha_nacimiento = Column(DateTime, nullable=False),
    dni = Column(String(8), nullable=False),
    ciudad = Column(String(100), nullable=False),
    monto = Column(Integer, primary_key=True),
    id_cuentas dni NULL
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS cuentas(
)
    dni = Column(String(8), nullable=False)
    depositos = Column(String(100), nullable=False)
    gastos = Column(DateTime, nullable=False)
    transferencias = Column(String(8), nullable=False)
    monto = Column(Integer, primary_key=True)
    PRIMARY KEY(dni)
);

ALTER TABLE personas ADD FOREIGN KEY(id_cuentas) REFERENCES cuentas(dni);