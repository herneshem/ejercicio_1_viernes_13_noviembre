CREATE TABLE facultades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    genero VARCHAR(10) NOT NULL
        CHECK (genero IN ('HOMBRE', 'MUJER', 'OTRO')),
    fecha_matriculacion DATE NOT NULL,
    total_asignaturas INTEGER NOT NULL DEFAULT 0,
    facultad_id INTEGER NOT NULL,

    CONSTRAINT fk_estudiante_facultad
        FOREIGN KEY (facultad_id)
        REFERENCES facultades(id)
);

CREATE TABLE correos (
    id SERIAL PRIMARY KEY,
    email VARCHAR(150) NOT NULL,
    estudiante_id INTEGER NOT NULL,

    CONSTRAINT fk_correo_estudiante
        FOREIGN KEY (estudiante_id)
        REFERENCES estudiantes(id)
        ON DELETE CASCADE
);

CREATE TABLE telefonos (
    id SERIAL PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    estudiante_id INTEGER NOT NULL,

    CONSTRAINT fk_telefono_estudiante
        FOREIGN KEY (estudiante_id)
        REFERENCES estudiantes(id)
        ON DELETE CASCADE
);


--Relaciones
ALTER TABLE estudiantes
ADD COLUMN facultad_id INTEGER;

ALTER TABLE telefonos
ADD COLUMN estudiante_id INTEGER;

ALTER TABLE correos
ADD COLUMN estudiante_id INTEGER;

--Claves foraneas
ALTER TABLE estudiantes
ADD CONSTRAINT fk_estudiante_facultad
FOREIGN KEY (facultad_id)
REFERENCES facultades(id);

ALTER TABLE telefonos
ADD CONSTRAINT fk_telefono_estudiante
FOREIGN KEY (estudiante_id)
REFERENCES estudiantes(id);

ALTER TABLE correos
ADD CONSTRAINT fk_correo_estudiante
FOREIGN KEY (estudiante_id)
REFERENCES estudiantes(id);


ALTER TABLE estudiantes
ALTER COLUMN facultad_id SET NOT NULL;

ALTER TABLE telefonos
ALTER COLUMN estudiante_id SET NOT NULL;

ALTER TABLE correos
ALTER COLUMN estudiante_id SET NOT NULL;
