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

INSERT INTO flores (nombre, categoria, significado, descripcion, precio, imagen_url, stock) VALUES
('Rosa Roja', 'Exterior', 'Amor', 'Clásica flor roja símbolo de romance.', 10.00, 'rosa_roja.jpg', 60),
('Rosa Blanca', 'Exterior', 'Pureza', 'Flor elegante de color blanco.', 10.50, 'rosa_blanca.jpg', 55),
('Tulipán Amarillo', 'Exterior', 'Alegría', 'Flor vibrante de primavera.', 9.00, 'tulipan_amarillo.jpg', 40),
('Tulipán Rojo', 'Exterior', 'Amor eterno', 'Tulipán intenso y llamativo.', 9.50, 'tulipan_rojo.jpg', 35),
('Margarita', 'Exterior', 'Inocencia', 'Flor blanca con centro amarillo.', 6.00, 'margarita.jpg', 70),
('Begonia', 'Interior', 'Cuidado', 'Planta ornamental de colores vivos.', 11.00, 'begonia.jpg', 25),
('Geranio', 'Exterior', 'Amistad', 'Planta resistente con flores rojas.', 8.00, 'geranio.jpg', 45),
('Petunia', 'Exterior', 'Calma', 'Flor colorida de jardín.', 7.50, 'petunia.jpg', 50),
('Dalia', 'Exterior', 'Elegancia', 'Flor de múltiples pétalos.', 13.00, 'dalia.jpg', 20),
('Camelia', 'Exterior', 'Admiración', 'Flor delicada tipo rosa.', 14.00, 'camelia.jpg', 15),

('Azucena', 'Exterior', 'Pureza', 'Flor blanca aromática.', 12.00, 'azucena.jpg', 30),
('Clavel Rojo', 'Exterior', 'Amor profundo', 'Flor clásica decorativa.', 7.00, 'clavel_rojo.jpg', 60),
('Clavel Blanco', 'Exterior', 'Suerte', 'Flor resistente y elegante.', 7.20, 'clavel_blanco.jpg', 50),
('Gardenia', 'Exterior', 'Amor secreto', 'Flor blanca muy aromática.', 15.00, 'gardenia.jpg', 18),
('Jazmín', 'Exterior', 'Amabilidad', 'Flor blanca perfumada.', 9.00, 'jazmin.jpg', 40),
('Peonía', 'Exterior', 'Prosperidad', 'Flor grande y vistosa.', 18.00, 'peonia.jpg', 12),
('Violeta', 'Interior', 'Modestia', 'Pequeña flor morada.', 6.50, 'violeta.jpg', 35),
('Crisantemo', 'Exterior', 'Longevidad', 'Flor ornamental popular.', 8.50, 'crisantemo.jpg', 28),
('Amapola', 'Exterior', 'Recuerdo', 'Flor roja silvestre.', 5.00, 'amapola.jpg', 80),
('Loto', 'Acuática', 'Iluminación', 'Flor espiritual acuática.', 20.00, 'loto.jpg', 10),

('Flor de Cerezo', 'Exterior', 'Belleza efímera', 'Flor rosada japonesa.', 16.00, 'cerezo.jpg', 14),
('Heliconia', 'Exterior', 'Exotismo', 'Flor tropical colorida.', 22.00, 'heliconia.jpg', 9),
('Buganvilla', 'Exterior', 'Pasión', 'Enredadera con flores vibrantes.', 11.00, 'buganvilla.jpg', 25),
('Alcatraz', 'Exterior', 'Elegancia', 'Flor blanca elegante.', 13.50, 'alcatraz.jpg', 20),
('Ranúnculo', 'Exterior', 'Encanto', 'Flor compacta de pétalos.', 10.00, 'ranunculo.jpg', 30),
('Verbena', 'Exterior', 'Creatividad', 'Flor pequeña en racimos.', 7.00, 'verbena.jpg', 40),
('Zinnia', 'Exterior', 'Durabilidad', 'Flor resistente y colorida.', 6.80, 'zinnia.jpg', 50),
('Cosmos', 'Exterior', 'Armonía', 'Flor ligera y delicada.', 6.20, 'cosmos.jpg', 45),
('Anémona', 'Exterior', 'Esperanza', 'Flor ornamental delicada.', 9.80, 'anemona.jpg', 25),
('Caléndula', 'Exterior', 'Salud', 'Flor medicinal naranja.', 5.90, 'calendula.jpg', 60),

('Freesia', 'Exterior', 'Confianza', 'Flor aromática de colores.', 11.50, 'freesia.jpg', 22),
('Gladiolo', 'Exterior', 'Fuerza', 'Flor alta en espiga.', 12.80, 'gladiolo.jpg', 18),
('Hibisco', 'Exterior', 'Belleza exótica', 'Flor tropical grande.', 14.50, 'hibisco.jpg', 20),
('Impatiens', 'Exterior', 'Paciencia', 'Flor de sombra colorida.', 6.70, 'impatiens.jpg', 35),
('Lantana', 'Exterior', 'Cambio', 'Flor multicolor.', 7.30, 'lantana.jpg', 40),
('Malva', 'Exterior', 'Protección', 'Flor silvestre suave.', 6.90, 'malva.jpg', 38),
('Narciso', 'Exterior', 'Renacimiento', 'Flor amarilla primaveral.', 9.20, 'narciso.jpg', 27),
('Pensamiento', 'Exterior', 'Reflexión', 'Flor de colores combinados.', 5.80, 'pensamiento.jpg', 55),
('Primavera', 'Exterior', 'Juventud', 'Flor colorida estacional.', 6.40, 'primavera.jpg', 50),
('Salvia', 'Exterior', 'Sabiduría', 'Flor aromática morada.', 7.10, 'salvia.jpg', 42),

('Tigridia', 'Exterior', 'Excentricidad', 'Flor exótica moteada.', 13.20, 'tigridia.jpg', 15),
('Verbascum', 'Exterior', 'Protección', 'Flor alta amarilla.', 8.90, 'verbascum.jpg', 18),
('Watsonia', 'Exterior', 'Belleza', 'Flor ornamental elegante.', 12.60, 'watsonia.jpg', 16),
('Xerochrysum', 'Exterior', 'Eternidad', 'Flor seca decorativa.', 9.70, 'xerochrysum.jpg', 20),
('Yucca Flor', 'Exterior', 'Resistencia', 'Flor de planta desértica.', 11.30, 'yucca.jpg', 22),
('Zantedeschia', 'Exterior', 'Pureza', 'Similar al alcatraz.', 13.90, 'zantedeschia.jpg', 17),
('Flor de Azahar', 'Exterior', 'Felicidad', 'Flor del naranjo.', 10.80, 'azahar.jpg', 30),
('Flor de Lino', 'Exterior', 'Simplicidad', 'Flor azul delicada.', 6.10, 'lino.jpg', 44),
('Flor de Mostaza', 'Exterior', 'Energía', 'Flor amarilla pequeña.', 5.50, 'mostaza.jpg', 60),
('Flor de Trébol', 'Exterior', 'Suerte', 'Flor pequeña simbólica.', 5.20, 'trebol.jpg', 65);

INSERT INTO cuidados 
(id_flor, luz_solar, frecuencia_riego, humedad_ideal, tipo_suelo, temperatura_min, temperatura_max, dificultad, toxicidad, poda, estacion) 
VALUES

-- Rosas
(11,'Sol pleno','3 veces por semana','Media','Fértil y bien drenado','10°C','30°C','Intermedio',1,'Poda en invierno','Primavera'),
(12,'Sol pleno','3 veces por semana','Media','Fértil y bien drenado','10°C','30°C','Intermedio',1,'Poda en invierno','Primavera'),

-- Tulipanes
(13,'Sol parcial','2 veces por semana','Media','Ligero y drenado','5°C','25°C','Principiante',0,'Después de floración','Primavera'),
(14,'Sol parcial','2 veces por semana','Media','Ligero y drenado','5°C','25°C','Principiante',0,'Después de floración','Primavera'),

-- Margarita
(15,'Sol pleno','Moderado','Media','Normal','5°C','28°C','Principiante',0,'No requiere','Primavera/Verano'),

-- Begonia
(16,'Sombra parcial','2-3 veces por semana','Alta','Rico en materia orgánica','15°C','25°C','Intermedio',1,'Quitar hojas secas','Todo el año'),

-- Geranio
(17,'Sol pleno','2 veces por semana','Media','Bien drenado','10°C','30°C','Principiante',0,'Poda ligera','Primavera'),

-- Petunia
(18,'Sol pleno','Frecuente','Media','Fértil','10°C','30°C','Principiante',0,'Eliminar flores marchitas','Primavera/Verano'),

-- Dalia
(19,'Sol pleno','3 veces por semana','Media','Rico y drenado','12°C','28°C','Intermedio',1,'Poda tras floración','Verano'),

-- Camelia
(20,'Sombra parcial','2 veces por semana','Alta','Ácido','10°C','25°C','Intermedio',1,'Ligera poda','Invierno'),

-- Azucena
(21,'Sol parcial','Moderado','Media','Bien drenado','8°C','28°C','Principiante',1,'Después de floración','Primavera'),

-- Claveles
(22,'Sol pleno','Moderado','Media','Ligero','10°C','30°C','Principiante',0,'Poda ligera','Primavera'),
(23,'Sol pleno','Moderado','Media','Ligero','10°C','30°C','Principiante',0,'Poda ligera','Primavera'),

-- Gardenia
(24,'Sombra parcial','Frecuente','Alta','Ácido','15°C','28°C','Experto',1,'Poda ligera','Primavera'),

-- Jazmín
(25,'Sol parcial','Moderado','Media','Fértil','10°C','30°C','Principiante',0,'Control de crecimiento','Primavera'),

-- Peonía
(26,'Sol pleno','Moderado','Media','Fértil','5°C','25°C','Intermedio',1,'Poda en otoño','Primavera'),

-- Violeta
(27,'Luz indirecta','Moderado','Alta','Ligero','15°C','25°C','Principiante',0,'Quitar hojas secas','Todo el año'),

-- Crisantemo
(28,'Sol pleno','Moderado','Media','Fértil','10°C','30°C','Principiante',1,'Poda regular','Otoño'),

-- Amapola
(29,'Sol pleno','Escaso','Baja','Seco','5°C','30°C','Principiante',0,'No requiere','Primavera'),

-- Loto
(30,'Sol pleno','Constante (agua)','Alta','Acuático','15°C','35°C','Intermedio',0,'Retirar hojas muertas','Verano'),

-- Flor de cerezo
(31,'Sol pleno','Moderado','Media','Fértil','5°C','25°C','Intermedio',0,'Poda anual','Primavera'),

-- Heliconia
(32,'Sol parcial','Frecuente','Alta','Rico','18°C','35°C','Intermedio',0,'Poda de hojas','Verano'),

-- Buganvilla
(33,'Sol pleno','Escaso','Baja','Seco','10°C','35°C','Principiante',0,'Poda fuerte','Primavera'),

-- Alcatraz
(34,'Sombra parcial','Frecuente','Alta','Húmedo','12°C','25°C','Intermedio',1,'Poda ligera','Primavera'),

-- Ranúnculo
(35,'Sol parcial','Moderado','Media','Ligero','8°C','25°C','Intermedio',1,'Después de floración','Primavera'),

-- Verbena
(36,'Sol pleno','Moderado','Media','Ligero','10°C','30°C','Principiante',0,'Poda ligera','Verano'),

-- Zinnia
(37,'Sol pleno','Moderado','Media','Normal','10°C','32°C','Principiante',0,'Eliminar flores','Verano'),

-- Cosmos
(38,'Sol pleno','Escaso','Baja','Ligero','10°C','30°C','Principiante',0,'No requiere','Verano'),

-- Anémona
(39,'Sol parcial','Moderado','Media','Fértil','10°C','25°C','Intermedio',1,'Después de floración','Primavera'),

-- Caléndula
(40,'Sol pleno','Moderado','Media','Normal','5°C','30°C','Principiante',0,'Eliminar flores','Todo el año'),

-- Freesia
(41,'Sol parcial','Moderado','Media','Ligero','8°C','25°C','Intermedio',0,'Después de floración','Primavera'),

-- Gladiolo
(42,'Sol pleno','Moderado','Media','Fértil','10°C','30°C','Intermedio',1,'Corte de tallos','Verano'),

-- Hibisco
(43,'Sol pleno','Frecuente','Alta','Rico','15°C','35°C','Intermedio',1,'Poda regular','Verano'),

-- Impatiens
(44,'Sombra','Frecuente','Alta','Rico','15°C','28°C','Principiante',1,'Quitar flores','Todo el año'),

-- Lantana
(45,'Sol pleno','Escaso','Baja','Seco','10°C','35°C','Principiante',1,'Poda de control','Verano'),

-- Malva
(46,'Sol pleno','Moderado','Media','Ligero','8°C','30°C','Principiante',0,'Poda ligera','Primavera'),

-- Narciso
(47,'Sol parcial','Moderado','Media','Ligero','5°C','25°C','Principiante',1,'Después de floración','Primavera'),

-- Pensamiento
(48,'Sol parcial','Frecuente','Media','Fértil','5°C','20°C','Principiante',0,'Eliminar flores','Invierno'),

-- Primavera
(49,'Sol parcial','Frecuente','Alta','Rico','8°C','22°C','Principiante',0,'Quitar hojas','Primavera'),

-- Salvia
(50,'Sol pleno','Escaso','Baja','Seco','10°C','35°C','Principiante',0,'Poda ligera','Verano'),

-- Tigridia
(51,'Sol pleno','Moderado','Media','Ligero','10°C','30°C','Intermedio',0,'Después de floración','Verano'),

-- Verbascum
(52,'Sol pleno','Escaso','Baja','Seco','5°C','30°C','Principiante',0,'No requiere','Verano'),

-- Watsonia
(53,'Sol pleno','Moderado','Media','Ligero','10°C','28°C','Intermedio',0,'Después de floración','Primavera'),

-- Xerochrysum
(54,'Sol pleno','Escaso','Baja','Seco','10°C','35°C','Principiante',0,'No requiere','Verano'),

-- Yucca flor
(55,'Sol pleno','Mínimo','Muy baja','Arenoso','5°C','40°C','Principiante',0,'No requiere','Todo el año'),

-- Zantedeschia
(56,'Sombra parcial','Frecuente','Alta','Húmedo','12°C','25°C','Intermedio',1,'Poda ligera','Primavera'),

-- Azahar
(57,'Sol pleno','Moderado','Media','Fértil','10°C','30°C','Principiante',0,'Poda anual','Primavera'),

-- Lino
(58,'Sol pleno','Escaso','Baja','Ligero','10°C','30°C','Principiante',0,'No requiere','Primavera'),

-- Mostaza
(59,'Sol pleno','Moderado','Media','Normal','8°C','30°C','Principiante',0,'No requiere','Primavera'),

-- Trébol
(60,'Sol parcial','Moderado','Media','Ligero','5°C','25°C','Principiante',0,'Corte regular','Primavera');