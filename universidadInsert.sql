INSERT INTO facultades (nombre)
VALUES
('Ingeniería'),
('Ciencias'),
('Derecho');

INSERT INTO estudiantes
(nombre, apellido1, apellido2, genero, fecha_matriculacion, total_asignaturas, facultad_id)
VALUES
('Juan', 'García', 'López', 'HOMBRE', '2026-09-01', 5, 1),
('María', 'Pérez', 'Sánchez', 'MUJER', '2026-09-01', 6, 2),
('Alex', 'Martín', 'Ruiz', 'OTRO', '2026-09-02', 4, 3);

INSERT INTO telefonos (numero, estudiante_id)
VALUES
('600111222', 1),
('600333444', 2),
('600555666', 3);

INSERT INTO correos (email, estudiante_id)
VALUES
('juan@gmail.com', 1),
('maria@gmail.com', 2),
('alex@gmail.com', 3);


--Comprobando errores
INSERT INTO estudiantes
(nombre, apellido1, apellido2, genero, fecha_matriculacion, total_asignaturas, facultad_id)
VALUES

SELECT 
    e.nombre,
    e.apellido1,
    f.nombre AS facultad,
    t.numero AS telefono,
    c.email AS correo
FROM estudiantes e
JOIN facultades f ON e.facultad_id = f.id
LEFT JOIN telefonos t ON t.estudiante_id = e.id
LEFT JOIN correos c ON c.estudiante_id = e.id;
('Pedro', 'Gómez', 'Díaz', 'HOMBRE', '2026-09-03', 5, 999);
