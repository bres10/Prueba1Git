-- Creación de la tabla Plataforma primero porque otras tablas dependen de ella.
CREATE TABLE Plataforma1 (
    ID_plataforma INT PRIMARY KEY,
    descripcion_plataforma VARCHAR(50)
);

-- Creación de la tabla Compania.
CREATE TABLE Compania1 (
    ID_compania INT PRIMARY KEY,
    nombre_compania VARCHAR(100),
    direccion VARCHAR(200),
    tipo_negocio VARCHAR(50)
);

-- Creación de la tabla Interes.
CREATE TABLE Interes1 (
    ID_interes INT PRIMARY KEY,
    descripcion_interes VARCHAR(50)
);

-- Creación de la tabla Miembro que depende de Compania y Plataforma.
CREATE TABLE Miembro1 (
    ID_miembro INT PRIMARY KEY,
    nombre VARCHAR(100),
    titulo VARCHAR(50),
    direccion_correo VARCHAR(100),
    telefono_oficina VARCHAR(20),
    tipo_miembro VARCHAR(20),
    al_dia_en_cuotas VARCHAR(200),
    ID_compania INT,
    ID_plataforma INT,
    FOREIGN KEY (ID_compania) REFERENCES Compania1(ID_compania),
    FOREIGN KEY (ID_plataforma) REFERENCES Plataforma1 (ID_plataforma)
);

-- Creación de la tabla Evento.
CREATE TABLE Evento1 (
    ID_evento INT PRIMARY KEY,
    fecha DATE,
    descripcion VARCHAR(200),
    num_participantes INT,
    localizacion VARCHAR(100),
    costo DECIMAL(10, 2),
    comentarios VARCHAR(200)
);

-- Creación de la tabla Comentario que depende de Evento.
CREATE TABLE Comentario1 (
    ID_comentario INT PRIMARY KEY,
    ID_evento INT,
    texto VARCHAR(200),
    FOREIGN KEY (ID_evento) REFERENCES Evento1(ID_evento)
);

-- Creación de la tabla Asistencia que depende de Miembro y Evento.
CREATE TABLE Asistencia1 (
    ID_asistencia INT PRIMARY KEY,
    ID_miembro INT,
    ID_evento INT,
    FOREIGN KEY (ID_miembro) REFERENCES Miembro1(ID_miembro),
    FOREIGN KEY (ID_evento) REFERENCES Evento1(ID_evento)
);

-- Creación de la tabla Interes_Miembro que depende de Miembro y Interes.
CREATE TABLE Interes_Miembro1 (
    ID_miembro INT,
    ID_interes INT,
    PRIMARY KEY (ID_miembro, ID_interes),
    FOREIGN KEY (ID_miembro) REFERENCES Miembro1(ID_miembro),
    FOREIGN KEY (ID_interes) REFERENCES Interes1(ID_interes)
);

ALTER TABLE Miembro1
ADD nacionalidad VARCHAR(100);

-------------------------------------------------------------------------------------------
-- Insertar datos en la tabla Plataforma1
INSERT INTO Plataforma1 (ID_plataforma, descripcion_plataforma) VALUES (1, 'IBM/MVS');
INSERT INTO Plataforma1 (ID_plataforma, descripcion_plataforma) VALUES (2, 'IBM/VM');
INSERT INTO Plataforma1 (ID_plataforma, descripcion_plataforma) VALUES (3, 'VAX/VMS');
INSERT INTO Plataforma1 (ID_plataforma, descripcion_plataforma) VALUES (4, 'Cloud/AWS');

-- Insertar datos en la tabla Compania1
INSERT INTO Compania1 (ID_compania, nombre_compania, direccion, tipo_negocio) VALUES (1, 'Coors', '123 Main St, Denver, CO', 'Bebidas');
INSERT INTO Compania1 (ID_compania, nombre_compania, direccion, tipo_negocio) VALUES (2, 'StorageTech', '456 Oak St, Boulder, CO', 'Tecnología');
INSERT INTO Compania1 (ID_compania, nombre_compania, direccion, tipo_negocio) VALUES (3, 'Nabisco', '789 Pine St, Aurora, CO', 'Alimentos');

-- Insertar datos en la tabla Interes1
INSERT INTO Interes1 (ID_interes, descripcion_interes) VALUES (1, 'Contabilidad');
INSERT INTO Interes1 (ID_interes, descripcion_interes) VALUES (2, 'RRHH');
INSERT INTO Interes1 (ID_interes, descripcion_interes) VALUES (3, 'Hidrocarburos');

-- Insertar datos en la tabla Miembro1
INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (1, 'Juan Perez', 'Ingeniero', 'juan.perez@example.com', '555-1234', 'Individual', 'Sí', 1, 1);
INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (2, 'Ana Gomez', 'Gerente', 'ana.gomez@example.com', '555-5678', 'Corporativo', 'Sí', 2, 2);
INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (3, 'Carlos Ruiz', 'Analista', 'carlos.ruiz@example.com', '555-8765', 'Individual', 'No', 3, 4);

-- Insertar datos en la tabla Evento1
INSERT INTO Evento1 (ID_evento, fecha, descripcion, num_participantes, localizacion, costo, comentarios) 
VALUES (1, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'Reunión de Septiembre', 500, 'Centro de Convenciones', 1500.00, 'Evento exitoso');
INSERT INTO Evento1 (ID_evento, fecha, descripcion, num_participantes, localizacion, costo, comentarios) 
VALUES (2, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 'Reunión de Noviembre', 800, 'Hotel Central', 2000.00, 'Gran participación');
INSERT INTO Evento1 (ID_evento, fecha, descripcion, num_participantes, localizacion, costo, comentarios) 
VALUES (3, TO_DATE('2023-01-20', 'YYYY-MM-DD'), 'Día del Entretenimiento', 1200, 'Parque de la Ciudad', 2500.00, 'Mayor asistencia hasta ahora');

-- Insertar datos en la tabla Comentario1
INSERT INTO Comentario1 (ID_comentario, ID_evento, texto) 
VALUES (1, 1, 'Muy bien organizado');
INSERT INTO Comentario1 (ID_comentario, ID_evento, texto) 
VALUES (2, 2, 'Buena comida');
INSERT INTO Comentario1 (ID_comentario, ID_evento, texto) 
VALUES (3, 3, 'Excelente presentación');

-- Insertar datos en la tabla Asistencia1
INSERT INTO Asistencia1 (ID_asistencia, ID_miembro, ID_evento) 
VALUES (1, 1, 1);
INSERT INTO Asistencia1 (ID_asistencia, ID_miembro, ID_evento) 
VALUES (2, 2, 2);
INSERT INTO Asistencia1 (ID_asistencia, ID_miembro, ID_evento) 
VALUES (3, 3, 3);

-- Insertar datos en la tabla Interes_Miembro1
INSERT INTO Interes_Miembro1 (ID_miembro, ID_interes) 
VALUES (1, 1);
INSERT INTO Interes_Miembro1 (ID_miembro, ID_interes) 
VALUES (2, 2);
INSERT INTO Interes_Miembro1 (ID_miembro, ID_interes) 
VALUES (3, 3);
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER almacenar_nacionalidad
BEFORE INSERT OR UPDATE ON Miembro1
FOR EACH ROW
DECLARE
    v_plataforma_nube_count INT;
BEGIN
    -- Verifica si la plataforma es una de las especificadas
    SELECT COUNT(*)
    INTO v_plataforma_nube_count
    FROM Plataforma1
    WHERE ID_plataforma = :NEW.ID_plataforma
      AND (descripcion_plataforma LIKE 'Cloud/AWS' 
           OR descripcion_plataforma LIKE 'IBM/MVS'
           OR descripcion_plataforma LIKE 'IBM/VM'
           OR descripcion_plataforma LIKE 'VAX/VMS');

    -- Si la plataforma es una de las especificadas, actualiza la nacionalidad
    IF v_plataforma_nube_count > 0 THEN
        :NEW.nacionalidad := 'Nativo en la Nube'; -- Ajusta el valor según sea necesario
    END IF;
END;
/


-- Crear la función para verificar si un evento tiene más de 1000 asistentes
CREATE OR REPLACE FUNCTION evento_mas_de_mil_asistentes (p_ID_evento INT) RETURN BOOLEAN IS
    v_num_participantes INT;
BEGIN
    SELECT num_participantes INTO v_num_participantes
    FROM Evento1
    WHERE ID_evento = p_ID_evento;

    RETURN v_num_participantes > 1000;
END evento_mas_de_mil_asistentes;
/

SELECT * FROM Miembro1;

INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (8, 'Bryant Lui', 'Programador', 'bryant.lui@example.com', '687-7456', 'Individual', 'No', 3, 1);

INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (5, 'Andres Morales', 'Programador', 'andres.mora@example.com', '687-5412', 'Individual', 'No', 3, 2);

INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (6, 'Omar Gonzalez ', 'QA', 'omar.gon@example.com', '687-9874', 'Individual', 'No', 3, 4);

INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (7, 'Julia Robert ', 'QA', 'julia.rob@example.com', '741-9632', 'Individual', 'Si', 3, 4);

INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (8, 'Julia Mendez ', 'Analista', 'julia.men@example.com', '741-5233', 'Individual', 'Si', 3, 4);

INSERT INTO Miembro1 (ID_miembro, nombre, titulo, direccion_correo, telefono_oficina, tipo_miembro, al_dia_en_cuotas, ID_compania, ID_plataforma) 
VALUES (5, 'Andres Morales', 'Programador', 'andres.mora@example.com', '687-5412', 'Individual', 'No', 3, 2);


DELETE FROM Miembro1
WHERE ID_miembro = 9;
