-- Creación de la tabla Compañía
CREATE TABLE Company (
    Company_ID NUMBER PRIMARY KEY,
    Company_Name VARCHAR2(100) NOT NULL,
    Address VARCHAR2(200) NOT NULL,
    Business_Type VARCHAR2(50) NOT NULL
);

-- Creación de la tabla Plataforma
CREATE TABLE Platform (
    Platform_ID NUMBER PRIMARY KEY,
    Description VARCHAR2(50) NOT NULL
);

-- Creación de la tabla Área de Aplicación
CREATE TABLE Application_Area (
    Area_ID NUMBER PRIMARY KEY,
    Description VARCHAR2(100) NOT NULL
);

-- Creación de la tabla Miembro
CREATE TABLE Member (
    Member_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Title VARCHAR2(50),
    Email VARCHAR2(100) NOT NULL,
    Office_Phone VARCHAR2(15),
    Member_Type VARCHAR2(20) CHECK (Member_Type IN ('Individual', 'Corporativo')),
    Fees_Up_To_Date CHAR(1) CHECK (Fees_Up_To_Date IN ('Y', 'N')),
    Company_ID NUMBER,
    Platform_ID NUMBER,
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID),
    FOREIGN KEY (Platform_ID) REFERENCES Platform(Platform_ID)
);

-- Creación de la tabla Evento
CREATE TABLE Event (
    Event_ID NUMBER PRIMARY KEY,
    fecha DATE NOT NULL,
    descripcion VARCHAR2(200) NOT NULL,
    Participants NUMBER,
    location VARCHAR2(100) NOT NULL,
    Expenses NUMBER(10, 2),
    Comments VARCHAR2(2000)
);

-- Creación de la tabla Comentario
CREATE TABLE Comentario (
    Comment_ID INT PRIMARY KEY,
    Event_ID INT,
    Comment_Text VARCHAR2(100),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

-- Creación de la tabla Asistencia
CREATE TABLE Attendance (
    Attendance_ID NUMBER PRIMARY KEY,
    Member_ID NUMBER,
    Event_ID NUMBER,
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

-- Creación de la tabla Interés
CREATE TABLE Interest (
    Interest_ID NUMBER PRIMARY KEY,
    Member_ID NUMBER,
    Area_ID NUMBER,
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Area_ID) REFERENCES Application_Area(Area_ID)
);


-- Insertar datos de ejemplo en la tabla Company
INSERT INTO Company (Company_ID, Company_Name, Address, Business_Type) VALUES
(1, 'Acme Corporation', '123 Main Street, Anytown', 'Manufactura');
INSERT INTO Company (Company_ID, Company_Name, Address, Business_Type) VALUES
(2, 'Tech Innovations Ltd.', '456 Oak Avenue, Othertown', 'Tecnología');
INSERT INTO Company (Company_ID, Company_Name, Address, Business_Type) VALUES
(3, 'Global Pharmaceuticals Inc.', '789 Elm Road, Another Town', 'Farmacéutica');

-- Insertar datos de ejemplo en la tabla Platform
INSERT INTO Platform (Platform_ID, Description) VALUES
(1, 'Windows');
INSERT INTO Platform (Platform_ID, Description) VALUES
(2, 'Linux');
INSERT INTO Platform (Platform_ID, Description) VALUES
(3, 'macOS');


-- Insertar datos de ejemplo en la tabla Application_Area
INSERT INTO Application_Area (Area_ID, Description) VALUES
(1, 'Gestión de Proyectos');
INSERT INTO Application_Area (Area_ID, Description) VALUES
(2, 'Desarrollo de Software');
INSERT INTO Application_Area (Area_ID, Description) VALUES
(3, 'Recursos Humanos');

-- Insertar datos de ejemplo en la tabla Member
INSERT INTO Member (Member_ID, Name, Title, Email, Office_Phone, Member_Type, Fees_Up_To_Date, Company_ID, Platform_ID) VALUES
(1, 'Juan Pérez', 'Analista de Sistemas', 'juan@example.com', '123-456-7890', 'Individual', 'Y', 1, 1);
INSERT INTO Member (Member_ID, Name, Title, Email, Office_Phone, Member_Type, Fees_Up_To_Date, Company_ID, Platform_ID) VALUES
(2, 'María González', 'Gerente de Ventas', 'maria@example.com', '987-654-3210', 'Corporativo', 'N', 2, 2);
INSERT INTO Member (Member_ID, Name, Title, Email, Office_Phone, Member_Type, Fees_Up_To_Date, Company_ID, Platform_ID) VALUES
(3, 'Carlos Rodríguez', 'Desarrollador Senior', 'carlos@example.com', '555-555-5555', 'Individual', 'Y', 3, 3);




