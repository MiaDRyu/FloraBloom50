CREATE TABLE flores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50), 
    significado VARCHAR(255),
    descripcion TEXT, 
    precio DOUBLE NOT NULL,
    imagen_url VARCHAR(255), 
    stock INT DEFAULT 0 
);

CREATE TABLE cuidados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_flor INT,
    luz_solar VARCHAR(255),
    frecuencia_riego VARCHAR(255),
    humedad_ideal VARCHAR(255),
    tipo_suelo VARCHAR(255),
    temperatura_min VARCHAR(50),
    temperatura_max VARCHAR(50),
    dificultad ENUM('Principiante', 'Intermedio', 'Experto'),
    toxicidad BOOLEAN DEFAULT FALSE,
    poda VARCHAR(255),
    estacion VARCHAR(255),
    FOREIGN KEY (id_flor) REFERENCES flores(id) ON DELETE CASCADE
);

INSERT INTO flores (id, nombre, categoria, significado, descripcion, precio, imagen_url, stock) VALUES
(1, 'Lirio de la Paz', 'Interior', 'Pureza y paz', 'Planta de sombra con flores blancas elegantes.', 15.50, 'lirio_paz.jpg', 20),
(2, 'Echeveria Elegans', 'Suculentas', 'Resistencia', 'Roseta suculenta de color verde azulado.', 8.00, 'echeveria.jpg', 50),
(3, 'Monstera Deliciosa', 'Interior', 'Longevidat', 'Famosa por sus hojas con agujeros, estilo tropical.', 35.00, 'monstera.jpg', 10),
(4, 'Lavanda', 'Exterior', 'Devoción y calma', 'Arbusto aromático de flores moradas.', 12.00, 'lavanda.jpg', 30),
(5, 'Girasol', 'Exterior', 'Adoración y energía', 'Flor grande amarilla que sigue al sol.', 5.50, 'girasol.jpg', 100),
(6, 'Orquídea Phalaenopsis', 'Interior', 'Belleza y refinamiento', 'Flor exótica de larga duración.', 45.00, 'orquidea.jpg', 15),
(7, 'Cactus Asiento de Suegra', 'Suculentas', 'Protección', 'Cactus globoso con espinas amarillas.', 22.00, 'cactus_asiento.jpg', 12),
(8, 'Anturio Rojo', 'Interior', 'Hospitalidad', 'Hojas brillantes y flores rojas en forma de corazón.', 28.00, 'anturio.jpg', 18),
(9, 'Romero', 'Huerto', 'Recuerdo y fidelidad', 'Hierba aromática para cocina y jardín.', 7.00, 'romero.jpg', 40),
(10, 'Hortensia', 'Exterior', 'Gratitud y abundancia', 'Grandes pompones de flores azules o rosas.', 25.00, 'hortensia.jpg', 8);

INSERT INTO cuidados (id_flor, luz_solar, frecuencia_riego, humedad_ideal, tipo_suelo, temperatura_min, temperatura_max, dificultad, toxicidad, poda, estacion) VALUES
(1, 'Sombra parcial', '2 veces por semana', 'Alta', 'Sustrato universal', '15°C', '25°C', 'Principiante', 1, 'Quitar hojas secas', 'Todo el año'),
(2, 'Sol directo', 'Cada 15 días', 'Baja', 'Sustrato para cactus', '5°C', '35°C', 'Principiante', 0, 'No requiere', 'Primavera'),
(3, 'Luz indirecta', 'Semanal', 'Media-Alta', 'Rico en materia orgánica', '18°C', '30°C', 'Intermedio', 1, 'Limpiar hojas', 'Todo el año'),
(4, 'Sol pleno', 'Baja', 'Baja', 'Arenoso y bien drenado', '-5°C', '30°C', 'Principiante', 0, 'Tras la floración', 'Verano'),
(5, 'Sol pleno', 'Frecuente', 'Media', 'Cualquiera bien abonado', '10°C', '35°C', 'Principiante', 0, 'No requiere', 'Verano'),
(6, 'Luz tamizada', 'Inmersión semanal', 'Alta', 'Corteza de pino', '16°C', '28°C', 'Experto', 0, 'Cortar vara tras secarse', 'Invierno/Primavera'),
(7, 'Sol directo', 'Mínimo', 'Muy baja', 'Mineral/Poroso', '0°C', '40°C', 'Principiante', 0, 'No requiere', 'Todo el año'),
(8, 'Luz indirecta brillante', 'Moderado', 'Alta', 'Sustrato aireado', '18°C', '25°C', 'Intermedio', 1, 'Quitar flores marchitas', 'Todo el año'),
(9, 'Sol pleno', 'Escaso', 'Baja', 'Pobre y calizo', '-10°C', '35°C', 'Principiante', 0, 'Poda de formación', 'Primavera'),
(10, 'Sombra/Semicubierto', 'Abundante', 'Media', 'Ácido (pH bajo)', '5°C', '22°C', 'Intermedio', 1, 'Final de invierno', 'Primavera/Verano');