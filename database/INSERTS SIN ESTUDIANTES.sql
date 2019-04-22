INSERT INTO institutos(id,nombre) VALUES(1,'INSTITUTO TECNOLÓGICO SUPERIOR BENITO JUÁREZ');
INSERT INTO institutos(id,nombre) VALUES(2,'INSTITUTO TECNOLÓGICO SUPERIOR 24 DE MAYO');
INSERT INTO institutos(id,nombre) VALUES(3,'INSTITUTO TECNOLÓGICO SUPERIOR GRAN COLOMBIA');
INSERT INTO institutos(id,nombre) VALUES(4,'INSTITUTO TECNOLÓGICO SUPERIOR DE TURISMO Y PATRIMONIO YAVIRAC');

INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(1,'1','TECNOLOGÍA SUPERIOR EN DESARROLLO DE SOFTWARE','DESARROLLO DE SOFTWARE MALLA ACTUAL','SEMIPRESENCIAL','TECNÓLOGO SUPERIOR EN DESARROLLO DE SOFTWARE','DS','Tecnología');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(2,'2','TECNOLOGÍA SUPERIOR EN MARKETING','MARKETING MALLA ANTIGUA','PRESENCIAL','TECNÓLOGO SUPERIOR EN MARKETING','MK','Tecnología');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(3,'3','DISEÑO DE MODAS CON NIVEL EQUIVALENTE A TECNOLOGÍA SUPERIOR','DISEÑO DE MODAS MALLA ACTUAL','PRESENCIAL','DISEÑADOR DE MODAS CON NIVEL EQUIVALENTE A TECNÓLOGO SUPERIOR','DM','Tecnología');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(4,'4','TÉCNICO SUPERIOR EN GUIANZA TURÍSTICA CON MENCIÓN EN PATRIMONIO CULTURAL O AVITURISMO','GUIANZA TURÍSTICA MALLA ACTUAL','SEMIPRESENCIAL','TÉCNICO SUPERIOR EN GUIANZA TURÍSTICA CON MENCIÓN EN PATRIMONIO CULTURAL O AVITURISMO','GT','Tecnicatura');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(5,'4','TÉCNICO SUPERIOR EN ARTE CULINARIO ECUATORIANO','ARTE CULINARIO MALLA ACTUAL','SEMIPRESENCIAL','TECNÓLOGO SUPERIOR EN ARTE CULINARIO ECUATORIANO','AC','Tecnicatura');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(6,'4','TECNOLOGÍA SUPERIOR EN MARKETING','MARKETING MALLA ACTUAL','PRESENCIAL','TECNÓLOGO SUPERIOR EN MARKETING','MKT','Tecnología');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(7,'4','TECNOLOGÍA SUPERIOR EN ANÁLISIS DE SISTEMAS','ANÁLISIS DE SISTEMAS MALLA ACTUAL','PRESENCIAL','TECNÓLOGO SUPERIOR EN ANÁLISIS DE SISTEMAS','AS','Tecnología');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(8,'4','TECNOLOGÍA SUPERIOR EN ELECTRICIDAD','ELECTRICIDAD MALLA ACTUAL','PRESENCIAL','TECNÓLOGO SUPERIOR EN ELECTRICIDAD','ELC','Tecnología');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(9,'4','TECNOLOGÍA SUPERIOR EN ELECTRÓNICA','ELECTRÓNICA MALLA ACTUAL','PRESENCIAL','TECNÓLOGO SUPERIOR EN ELECTRÓNICA','ELT','Tecnología');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(10,'1','TECNOLOGÍA SUPERIOR EN DESARROLLO DE SOFTWARE','DESARROLLO DE SOFTWARE MALLA ANTIGUA','SEMIPRESENCIAL','TECNÓLOGO SUPERIOR EN DESARROLLO DE SOFTWARE','DS','Tecnología');
INSERT INTO carreras(id,instituto_id, nombre, descripcion, modalidad, titulo_otorga, siglas, tipo_carrera)
VALUES(11,'4','GUÍA NACIONAL DE TURISMO CON NIVEL EQUIVALENTE A TECNOLOGÍA SUPERIOR','GUÍA NACIONAL MALLA ACTUAL','SEMIPRESENCIAL','GUÍA NACIONAL DE TURISMO CON NIVEL EQUIVALENTE A TECNÓLOGO SUPERIOR','GN','Tecnología');

INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(2,1,'2017-03-01');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(3,2,'2015-02-02');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(4,3,'2015-02-02');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(5,4,'2015-02-02');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(6,5,'2015-02-02');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(7,6,'2017-09-01');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(8,7,'2017-09-01');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(9,8,'2017-09-01');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(10,9,'2017-09-01');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(11,3,'2015-02-02');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(12,10,'2017-09-01');
INSERT INTO mallas(id,carrera_id,fecha_aprobacion) VALUES(13,11,'2017-09-01');

INSERT INTO periodo_academicos(id,  nombre) VALUES (1, 'PRIMERO');
INSERT INTO periodo_academicos(id,  nombre) VALUES (2, 'SEGUNDO');
INSERT INTO periodo_academicos(id,  nombre) VALUES (3, 'TERCERO');
INSERT INTO periodo_academicos(id,  nombre) VALUES (4, 'CUARTO');
INSERT INTO periodo_academicos(id,  nombre) VALUES (5, 'QUINTO');
INSERT INTO periodo_academicos(id,  nombre) VALUES (6, 'SEXTO');

INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(1,2,1,'1DS1FT0402','MATEMÁTICA  DISCRETA',0,48,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(2,2,1,'2DS1FT0502','INTRODUCCIÓN AL DESARROLLO DE SOFTWARE',12,60,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(3,2,1,'5DS1FT0302','DESARROLLO DEL PENSAMIENTO',0,36,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(4,2,1,'3DS1AI0602','FUNDAMENTOS DE PROGRAMACIÓN',24,72,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(5,2,1,'4DS1AI0502','ANÁLISIS Y DISEÑO DE SISTEMAS',0,60,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(6,2,1,'6DS1CL0402','INGLÉS  A1',0,48,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(31,3,1,'5MK1BS0301','CONTABILIDAD GENERAL I',11,3,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(32,3,1,'7MK1PR0301','FUNDAMENTOS DE MARKETING',12,3,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(33,3,1,'4MK1BS0301','INGLÉS I',13,3,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(34,3,1,'8MK1PR0301','DERECHO SOCIETARIO Y MERCANTIL',14,3,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(35,4,1,'1DM1BA0202','HISTORIA DE LA MODA Y TEXTILES',0,36,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(36,4,1,'4DM1BA0202','METODOLOGÍA DE LA INVESTIGACIÓN',0,36,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(37,4,1,'2DM1BA0502','ILUSTRACIÓN BÁSICA DE MODA',72,90,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(38,4,1,'5DM1BA0602','PATRONAJE Y CONFECCIÓN FEMENINA',72,108,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(39,4,1,'3DM1BA0202','EXPRESIÓN ORAL Y ESCRITA',0,36,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(40,5,1,'1GT1CH01','LENGUAJE ORAL Y ESCRITO',20,2,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(41,5,1,'2GT1CD02','HISTORIA DEL ECUADOR',21,4,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(42,5,1,'3GT1CD02','GEOGRAFÍA TURÍSTICA ECUATORIANA',22,4,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(43,5,1,'4GT1CD02','ECOLOGÍA DEL ECUADOR',23,4,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(44,5,1,'5GT1CH01','REALIDAD NACIONAL EN EL SISTEMA TURÍSTICO ECUATORIANO',24,2,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(45,5,1,'6GT1CH01','ÉTICA PROFESIONAL EN EL TURISMO',25,2,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(46,5,1,'7GT1PR03','SISTEMA TURÍSTICO',26,10,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(47,5,1,'8GT1PR02','INTRODUCCIÓN AL TURISMO Y HOTELERÍA',27,4,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(48,5,1,'9GT1PR01','LEGISLACIÓN TURÍSTICA',28,2,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(49,5,1,'11GT1CI02','IDENTIFICACIÓN DESCRIPTIVA DESTINOS TURÍSTICOS ACTUALES',29,2,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(50,5,1,'10GT1PR05','FUNCIONAMIENTO Y DINÁMICA DEL TURISMO',30,6,4,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(51,6,1,'1AC1FT0502','FUNDAMENTOS DE LA COCINA CLÁSICA',16,54,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(52,6,1,'2AC1FT0402','SEGURIDAD Y PRIMEROS AUXILIOS',16,44,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(53,6,1,'3AC1AI0602','TÉCNICAS DE COCINA CLÁSICA',36,74,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(54,6,1,'4AC1AI0402','BASES DE PRODUCCIÓN PYP',16,44,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(55,6,1,'5AC1AI0402','SEGURIDAD E HIGIENE DE ALIMENTOS',16,44,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(56,6,1,'6AC1IS0502','CULTURA GASTRONÓMICA ECUATORIANA',24,56,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(57,7,1,'1MK1FT0302','MATEMÁTICAS',54,54,27,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(58,7,1,'2MK1FT0502','CONTABILIDAD GENERAL',83,83,42,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(59,7,1,'3MK1FT0402','FUNDAMENTOS DE MARKETING',72,72,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(60,7,1,'4MK1CL0302','TICS I',54,54,27,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(61,7,1,'5MK1CL0302','EXPRESIÓN ORAL Y ESCRITA',61,61,30,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(62,7,1,'6MK1IS0202','ENTORNO EMPRESARIAL',36,36,18,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(63,8,1,'1AS1FG0201','COMUNICACIÓN ORAL Y ESCRITA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(64,8,1,'2AS1FG0201','REALIDAD NACIONAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(65,8,1,'3AS1FG0301','MATEMÁTICA GENERAL',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(66,8,1,'4AS1FGO201','INGLÉS I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(67,8,1,'5AS1GT0301','CONTABILIDAD GENERAL I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(68,8,1,'6AS1PR0301','OFIMÁTICA I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(69,8,1,'7AS1PR0301','PROGRAMACIÓN ESTRUCTURADA I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(70,8,1,'8AS1PR0301','PROGRAMACIÓN I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(71,8,1,'9AS1PR0301','SISTEMAS DIGITALES',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(72,8,1,'10AS1OPO101','OPTATIVA I',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(120,9,1,'1EL1FG0201','COMUNICACIÓN ORAL Y ESCRITA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(121,9,1,'2EL1FG0201','REALIDAD NACIONAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(122,9,1,'3EL1FG0201','INGLÉS I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(123,9,1,'4EL1FG0201','MATEMÁTICA I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(124,9,1,'5EL1FG0201','FÍSICA I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(125,9,1,'6EL1FG0201','DIBUJO I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(126,9,1,'7EL1PR0401','ELECTROTECNIA I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(127,9,1,'8EL1PR0401','INSTALACIONES ELÉCTRICAS I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(128,9,1,'9EL1PR0201','MEDIDAS ELÉCTRICAS',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(129,9,1,'10EL1FG0201','COMPUTACIÓN',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(130,9,1,'11EL1OP0101','OPTATIVA I',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(248,10,1,'9ET1OP0101','OPTATIVA I',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(247,10,1,'8ET1PR0801','ELECTRÓNICA I',0,8,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(246,10,1,'7ET1PR0401','ELECTROTÉCNIA I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(245,10,1,'6ET1FG0201','FÍSICA I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(244,10,1,'5ET1FG0201','INGLÉS I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(243,10,1,'4ET1FG0201','MATEMÁTICA I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(242,10,1,'3ET1FG0201','DIBUJO I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(241,10,1,'2ET1FG0201','REALIDAD NACIONAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(240,10,1,'1ET1FG0201','COMUNICACIÓN ORAL Y ESCRITA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(287,5,1,'1GT1CH0101','LENGUAJE ORAL Y ESCRITO',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(288,5,1,'2GT1CD0201','HISTORIA DEL ECUADOR',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(289,5,1,'3GT1CD0201','GEOGRAFÍA TURÍSTICA ECUATORIANA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(290,5,1,'4GT1CD0201','ECOLOGÍA DEL ECUADOR',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(291,5,1,'5GT1CH0101','REALIDAD NACIONAL EN EL SISTEMA TURÍSTICO ECUATORIANO',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(292,5,1,'6GT1CH0101','ÉTICA PROFESIONAL EN EL TURISMO',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(293,5,1,'7GT1PR0301','SISTEMA TURÍSTICO',6,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(294,5,1,'8GT1PR0201','INTRODUCCIÓN AL TURISMO Y HOTELERÍA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(295,5,1,'9GT1PR0101','LEGISLACIÓN TURÍSTICA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(296,5,1,'10GT1PR0501','FUNCIONAMIENTO Y DINÁMICA DEL TURISMO',125,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(297,5,1,'11GT1CI0201','IDENTIFICACIÓN Y DESCRIPCIÓN DE LOS DESTINOS TURÍSTICOS ACTUALES',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(298,5,1,'12GT1PR0501','INGLÉS',0,10,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(427,11,1,'6DM1FP0301','SASTRERÍA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(426,11,1,'5DM1FB0201','OFIMÁTICA I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(425,11,1,'4DM1FB0201','INGLÉS I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(424,11,1,'3DM1FB0101','LENGUAJE Y COMUNICACIÓN',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(423,11,1,'2DM1FH0201','PROYECTO JÓVENES EMPRENDEDORES I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(422,11,1,'1DM1FH0201','LEGISLACIÓN I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(415,4,1,'6DM1BA0302','INVESTIGACIÓN DEL MERCADO DE MODA',36,54,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(428,11,1,'7DM1FP0301','PATRONAJE SPORT WEAR',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(429,11,1,'8DM1FP0201','CONFECCIÓN SPORT WEAR',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(430,11,1,'9DM1FP0401','ACCESORIOS SPORT WEAR',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(431,11,1,'10DM1FP0401','DISEÑO SPORT WEAR',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(432,11,1,'11DM1FP0301','TÉCNICAS DE ILUSTRACIÓN',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(519,2,1,'7DS1AI1102','PRÁCTICAS DE FORMACIÓN DUAL',320,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(560,3,1,'1MK1HU0301','TÉCNICAS DE EXPRESIÓN ORAL Y ESCRITA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(561,3,1,'2MK1BS0301','INFORMÁTICA BÁSICA DE NEGOCIOS I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(562,3,1,'3MK1BS0401','MATEMÁTICA BÁSICA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(563,3,1,'6MK1PR0301','FUNDAMENTOS DE ADMINISTRACIÓN',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(648,6,1,'7AC1AI1102','PRÁCTICAS DE FORMACIÓN DUAL',324,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(694,13,1,'1GN1FT0502','Historia del Ecuador',15,55,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(695,13,1,'2GN1FT0502','Ecología del Ecuador',15,55,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(696,13,1,'3GN1FT0502','Geografía Turística del Ecuador',15,55,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(697,13,1,'4GN1AI0602','PATRIMONIO TURÍSTICO',33,70,33,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(698,13,1,'5GN1AI0502','Sistema Turístico',33,55,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(699,13,1,'6GN1CL0402','Inglés para principiantes',30,50,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(700,13,1,'7GN1AI1002','Prácticas en formación dual',290,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(739,11,1,'1DM1FT0202','HISTORIA DE LA MODA Y TEXTILES',0,36,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(740,11,1,'2DM1AI0502','ILUSTRACIÓN BÁSICA DE MODA',72,90,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(741,11,1,'3DM1CL0202','EXPRESIÓN ORAL Y ESCRITA',0,36,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(742,11,1,'4DM1FT0202','METODOLOGÍA DE INVESTIGACIÓN',0,36,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(743,11,1,'5DM1AI0602','PATRONAJE Y CONFECCIÓN FEMENINA',72,108,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(744,11,1,'6DM1AI0302','INVESTIGACIÓN DEL MERCADO DE MODA',36,54,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(7,2,2,'1DS2FT0402','ÁLGEBRA Y TRIGONOMETRÍA',0,48,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(8,2,2,'2DS2AI0502','BASE DE DATOS',24,60,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(9,2,2,'3DS2AI0602','PROGRAMACIÓN ORIENTADA A OBJETOS',24,72,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(10,2,2,'4DS2AI0502','METODOLOGÍAS DE DESARROLLO DE SOFTWARE',12,60,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(11,2,2,'5DS2CL0302','LENGUAJE Y COMUNICACIÓN',0,36,35,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(12,2,2,'6DS2CL0402','INGLÉS A2',0,48,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(73,8,2,'1AS2GT0201','METODOLOGÍA DE INVESTIGACIÓN I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(74,8,2,'2AS2FG0501','MATEMÁTICA I',0,5,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(75,8,2,'3AS2FG0201','INGLÉS II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(76,8,2,'4AS2GT0301','CONTABILIDAD DE COSTOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(77,8,2,'5AS2PR0301','OFIMÁTICA II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(78,8,2,'6AS2PR0301','PROGRAMACIÓN ESTRUCTURADA II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(79,8,2,'7AS2PR0301','PROGRAMACIÓN II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(80,8,2,'8AS2PR0301','DISEÑO ELECTRÓNICO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(81,8,2,'9AS2OPO101','OPTATIVA II',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(131,9,2,'1EL2GT0201','METODOLOGÍA DE INVESTIGACIÓN I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(132,9,2,'2EL2FG0201','ESTADÍSTICA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(133,9,2,'3EL2FG0201','INGLÉS II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(134,9,2,'4EL2FG0201','MATEMÁTICA II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(135,9,2,'5EL2FG0201','FÍSICA II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(136,9,2,'6EL2FG0201','DIBUJO II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(137,9,2,'7EL2PR0401','ELECTROTECNIA II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(138,9,2,'8EL2PR0401','INSTALACIONES ELÉCTRICAS II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(139,9,2,'9EL2PR0201','ELECTROMECÁNICA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(140,9,2,'10EL2PR0201','SIMULADORES ELÉCTRICOS',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(141,9,2,'11EL2OP0101','OPTATIVA II',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(256,10,2,'8ET2OP0101','OPTATIVA II',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(255,10,2,'7ET2PR0501','ELECTRÓNICA DIGITAL I',0,5,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(254,10,2,'6ET2PR0501','ELECTRÓNICA II',0,5,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(253,10,2,'5ET2PR0401','ELECTROTÉCNIA II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(252,10,2,'4ET2FG0301','FÍSICA II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(251,10,2,'3ET2FG0201','INGLÉS II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(250,10,2,'2ET2FG0301','MATEMÁTICA II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(249,10,2,'1ET2FG0201','DIBUJO II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(299,5,2,'1GT2CH0101','FUNDAMENTOS DE LA PNL EN LA COMUNICACIÓN ORAL Y ESCRITA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(300,5,2,'2GT2CH0101','RELACIONES HUMANAS',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(301,5,2,'3GT2CD0101','CARTOGRAFÍA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(302,5,2,'4GT2CD0201','EDUCACIÓN E INTERPRETACIÓN AMBIENTAL',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(303,5,2,'5GT2CH0201','LIDERAZGO Y MANEJO DE CONFLICTOS EN LA GUIANZA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(304,5,2,'6GT2PR0201','DISEÑO DE GUIONES TURÍSTICOS',2,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(305,5,2,'7GT2PR0301','MANEJO Y ASIGNACIÓN DE GRUPOS',4,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(306,5,2,'8GT2PR0201','PRIMEROS AUXILIOS',2,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(307,5,2,'9GT2PR0201','PROTOCOLO Y HOSPITALIDAD EN LA GUIANZA',2,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(308,5,2,'10GT2PR0501','TÉCNICAS DE GUIANZA',125,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(309,5,2,'11GT2CI0201','DETERMINACIÓN Y RESOLUCIÓN DE LOS PROBLEMAS EN LA GUIANZA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(310,5,2,'12GT2CH0101','METODOLOGÍA DE INVESTIGACIÓN I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(311,5,2,'13GT2PR0501','INGLÉS',0,10,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(750,11,2,'6DM2IS0202','CULTURA TEXTIL ANCESTRAL ECUATORIANA',0,36,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(420,4,2,'5DM2PR0202','NTIC',0,36,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(419,4,2,'4DM2PR0502','PATRONAJE Y CONFECCIÓN INFANTIL',72,90,55,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(418,4,2,'3DM2PR0502','DISEÑO CREATIVO',36,90,55,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(417,4,2,'2DM2PR0402','ILUSTRACIÓN APLICADA DE MODA',54,72,55,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(416,4,2,'1DM2PR0202','MATEMÁTICA FINANCIERA',0,36,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(433,11,2,'1DM2FH0201','LEGISLACIÓN II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(434,11,2,'2DM2FH0201','DESARROLLO DE EMPRENDEDORES II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(435,11,2,'3DM2FB0101','MATEMÁTICA I',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(436,11,2,'4DM2FB0201','INGLES II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(437,11,2,'5DM2FB0201','OFIMÁTICA II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(438,11,2,'6DM2FP0301','ALTA MODA I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(439,11,2,'7DM2FP0201','PATRONAJE JEANS WEAR',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(440,11,2,'8DM2FP0201','CONFECCIÓN CASUAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(441,11,2,'9DM2FP0101','ACCESORIOS JEANS WEAR',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(442,11,2,'10DM2FP0101','HISTORIA DEL TRAJE',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(443,11,2,'11DM2FP0401','DISEÑO JEANS WEAR',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(444,11,2,'12DM2FP0301','ILUSTRACIÓN APLICADA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(518,2,2,'7DS2AI0902','PRÁCTICAS DE FORMACIÓN DUAL',270,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(520,3,2,'1MK2HU0301','COMPORTAMIENTO DEL CONSUMIDOR',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(521,3,2,'2MK2BS0401','INFORMÁTICA BÁSICA DE NEGOCIOS II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(522,3,2,'3MK2BS0301','INGLÉS II',0,8,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(523,3,2,'4MK2BS0401','MÉTODOS Y TÉCNICAS DE INVESTIGACIÓN I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(524,3,2,'5MK2BS0301','CONTABILIDAD GENERAL II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(525,3,2,'6MK2PR0401','ESTADÍSTICA DESCRIPTIVA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(526,3,2,'7MK2PR0401','MARKETING II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(649,6,2,'1AC2FT0502','FUNDAMENTOS DE LA COCINA TRADICIONAL',16,54,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(650,6,2,'2AC2AI0502','TÉCNICAS DE COCINA EN ALTO VOLUMEN',26,54,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(651,6,2,'3AC2AI0402','PRODUCCIÓN DE COCINA CALIENTE',21,49,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(652,6,2,'4AC2AI0502','TÉCNICAS DE COCINA TRADICIONAL',36,64,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(653,6,2,'5AC2AI0202','PRODUCCIÓN DE COCINA FRÍA',25,25,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(654,6,2,'6AC2IS0402','CULTURA GASTRONÓMICA ECUATORIANA II',26,44,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(655,6,2,'7AC2AI1202','PRÁCTICAS DE FORMACIÓN DUAL',350,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(671,7,2,'1MK2FT0202','MATEMÁTICA FINANCIERA',20,27,7,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(672,7,2,'2MK2FT0402','COMPORTAMIENTO Y PSICOLOGÍA DEL CONSUMIDOR',72,72,35,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(673,7,2,'3MK2FT0302','ADMINISTRACIÓN E INNOVACIÓN DE DISEÑO DE NEGOCIOS',54,54,28,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(674,7,2,'4MK2FT0302','PRESUPUESTOS',54,54,28,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(675,7,2,'5MK2AI0402','PROYECTOS DE MARKETING / PPP',72,72,35,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(676,7,2,'6MK2CL0302','TICS II',54,54,28,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(701,13,2,'1GN2FT0402','Arte Ecuatoriano',15,44,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(702,13,2,'2GN2FT0502','Cartografía y Georreferenciación',15,55,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(703,13,2,'3GN2AI0602','DISEÑO DE RUTAS Y GUIONES TURÍSTICOS',33,70,30,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(704,13,2,'4GN2AI0502','Áreas Protegidas del Ecuador',11,55,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(705,13,2,'5GN2CL0402','Inglés pre básico',30,50,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(706,13,2,'6GN2IS0402','Antropología sociocultural del Ecuador',10,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(707,13,2,'7GN2AI1002','Prácticas en formación dual',290,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(745,11,2,'1DM2FT0202','MATEMÁTICA FINANCIERA',0,36,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(746,11,2,'2DM2AI0402','ILUSTRACIÓN APLICADA DE MODA',54,72,55,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(747,11,2,'3DM2AI0502','DISEÑO CREATIVO',36,90,55,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(748,11,2,'4DM2AI0502','PATRONAJE Y CONFECCIÓN INFANTIL',72,90,55,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(749,11,2,'5DM2CL0202','NTIC',18,36,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(421,4,2,'6DM2IS0202','CULTURA TEXTIL ANCESTRAL ECUATORIANA',0,36,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(13,2,3,'1DS3FT0402','CÁLCULO DIFERENCIAL E INTEGRAL',0,48,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(14,2,3,'4DS3FT0402','BASE DE DATOS AVANZADA',24,48,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(15,2,3,'2DS3FT0202','FUNDAMENTOS DE ADMINISTRACIÓN',0,24,35,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(16,2,3,'3DS3AI0502','PROGRAMACIÓN VISUAL',36,60,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(17,2,3,'5DS3AI0502','DISEÑO DE INTERFAZ',36,60,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(18,2,3,'6DS3CL0402','INGLÉS B1.1',0,48,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(82,8,3,'1AS3GT0201','METODOLOGÍA DE INVESTIGACIÓN II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(83,8,3,'2AS3FG0501','MATEMÁTICA II',0,5,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(84,8,3,'3AS3FG0201','INGLÉS III',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(85,8,3,'4AS3GT0301','ANÁLISIS FINANCIERO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(86,8,3,'5AS3PR0301','PROGRAMAS WEB',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(87,8,3,'6AS3PR0301','PROGRAMACIÓN ESTRUCTURADA III',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(88,8,3,'7AS3PR0301','PROGRAMACIÓN ORIENTADA A OBJETOS I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(89,8,3,'8AS3PR0301','ARQUITECTURA I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(90,8,3,'9AS3OPO101','OPTATIVA III',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(142,9,3,'1EL3GT0201','METODOLOGÍA DE INVESTIGACIÓN II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(143,9,3,'2EL3GT0201','SEGURIDAD INDUSTRIAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(144,9,3,'3EL3FG0201','INGLÉS III',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(145,9,3,'4EL3PR0201','AUTOCAD',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(146,9,3,'5EL3PR0401','MÁQUINAS ELÉCTRICAS I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(147,9,3,'6EL3PR0301','CONTROL INDUSTRIAL I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(148,9,3,'7EL3PR0401','MÁQUINAS Y HERRAMIENTAS I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(149,9,3,'8EL3PR0301','SISTEMAS DE TRANSMISIÓN I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(150,9,3,'9EL3PR0201','LENGUAJES DE PROGRAMACIÓN ELÉCTRICO',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(151,9,3,'10EL3OP0101','OPTATIVA III',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(264,10,3,'8ET3OP0101','OPTATIVA III',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(263,10,3,'7ET3GT0201','SEGURIDAD INDUSTRIAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(262,10,3,'6ET3PR0501','ELECTRÓNICA DIGITAL II',0,5,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(261,10,3,'5ET3PR0401','LÍNEAS DE TRANSMISIÓN',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(260,10,3,'4ET3PR0501','ELECTRÓNICA III',0,5,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(259,10,3,'3ET3PR0401','MÁQUINAS ELÉCTRICAS I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(258,10,3,'2ET3FG0201','INGLÉS III',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(257,10,3,'1ET3GT0201','METODOLOGÍA DE INVESTIGACIÓN I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(312,5,3,'1GT3CD0201','ORNITOLOGÍA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(313,5,3,'2GT3CD0201','AVIFAUNA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(314,5,3,'3GT3CD0201','ARTE ECUATORIANO',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(315,5,3,'4GT3CD0101','ARQUEOLOGÍA ECUATORIANA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(316,5,3,'5GT3CD0101','ANTROPOLOGÍA ECUATORIANA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(317,5,3,'6GT3PR0201','PLANIFICACIÓN Y PROMOCIÓN DE VIAJES',4,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(318,5,3,'7GT3PR0201','TÉCNICAS MANEJO Y GESTIÓN DE EQUIPOS Y HERRAMIENTAS',2,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(319,5,3,'8GT3PR0201','SUPERVIVENCIA Y RESCATE APLICADO A LA ESPECIALIDAD',2,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(320,5,3,'9GT3PR0501','PLANIFICACIÓN Y GESTIÓN DE TOURS',125,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(321,5,3,'10GT3PR0301','DISEÑO DE RUTAS TURÍSTICAS',4,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(322,5,3,'11GT3CI0201','ANÁLISIS Y DETERMINACIÓN DE NUEVAS RUTAS Y CIRCUITOS',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(323,5,3,'12GT3CH0101','PNL APLICADO A LA GUIANZA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(324,5,3,'13GT3PR0501','INGLÉS',0,10,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(325,5,3,'14GT3CH0101','METODOLOGÍA DE INVESTIGACIÓN II',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(445,11,3,'1DM3FH0201','LEGISLACIÓN  III',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(446,11,3,'2DM3FH0201','INCUBADORA DE EMPRESAS I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(447,11,3,'3DM3FB0101','MATEMÁTICA II',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(448,11,3,'4DM3FB0201','INGLÉS TÉCNICO I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(449,11,3,'5DM3FB0201','ADOBE ILUSTRADOR I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(450,11,3,'6DM3FP0201','ALTA MODA II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(451,11,3,'7DM3FP0201','PATRONAJE KIDS DESING',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(452,11,3,'8DM3FP0201','CONFECCIÓN KIDS DESING',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(453,11,3,'9DM3FP0101','ACCESORIOS KIDS DESING',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(454,11,3,'10DM3FP0101','TEXTILES I',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(455,11,3,'11DM3FP0401','DISEÑO MODA MASCULINA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(456,11,3,'12DM3FP0201','GERBER I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(457,11,3,'13DM3FP0201','TALLER DE ESTILO I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(494,12,3,'1DS3FT1001','CÁLCULO DIFERENCIAL',20,80,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(495,12,3,'2DS3FT0201','FUNDAMENTOS DE PROYECTOS',9,16,9,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(496,12,3,'3DS3FT1001','PROGRAMACIÓN III',65,80,50,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(497,12,3,'5DS3FT0201','INGLÉS III',0,48,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(498,12,3,'4DS3FT4301','PROGRAMACIÓN CON ALGORITMOS COMPLEJOS (FASE PRÁCTICA)',390,0,30,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(527,3,3,'1MK3HU0301','DESARROLLO DEL TALENTO HUMANO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(528,3,3,'2MK3BS0301','DESARROLLO DE EMPRENDEDORES  ',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(529,3,3,'3MK3BS0301','INGLÉS III',0,8,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(530,3,3,'4MK3BS0301','CONTABILIDAD DE COSTOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(531,3,3,'5MK3PR0401','ESTADÍSTICA INFERENCIAL',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(532,3,3,'6MK3PR0301','MARKETING OPERATIVO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(533,3,3,'7MK3PR0301','PUBLICIDAD',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(534,3,3,'8MK3PR0301','MARKETING DE SERVICIOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(630,4,3,'1DM3FT0302','CONTABILIDAD GENERAL',0,54,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(631,4,3,'2DM3AI0402','ILUSTRACIÓN DIGITAL DE MODA',54,72,45,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(632,4,3,'3DM3AI0302','DISEÑO PRONTISTA Y PRE-A-PORTER',36,54,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(633,4,3,'4DM3AI0402','SASTRERIA BÁSICA',54,72,45,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(634,4,3,'5DM3AI0402','ESCALADO',36,72,45,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(635,4,3,'6DM3IS0202','REALIDAD NACIONAL',0,36,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(656,6,3,'1AC3FT0402','COSTOS DE PRODUCCIÓN',5,50,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(657,6,3,'2AC3FT0402','ORGANIZACIÓN Y AMBIENTE LABORAL',20,50,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(658,6,3,'3AC3AI0502','ARTE CULINARIO I: RECETAS',40,55,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(659,6,3,'4AC3AI0402','PANADERÍA',40,50,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(660,6,3,'5AC3AI0302','MONTAJE Y EMPLATADO',30,40,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(661,6,3,'6AC3CL0302','FRANCÉS TÉCNICO',20,40,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(662,6,3,'7AC3AI1202','PRÁCTICAS DE FORMACIÓN DUAL',355,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(669,2,3,'7DS3AI0902','PRÁCTICAS DE FORMACIÓN DUAL',270,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(677,7,3,'1MK3FT0302','EMPRENDIMIENTO',20,54,27,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(678,7,3,'2MK3AI0402','IMAGEN CORPORATIVA Y CREATIVA',72,72,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(679,7,3,'3MK3AI0402','PROYECTOS DE MARKETING II / PPP',72,72,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(680,7,3,'4MK3AI0402','METODOLOGÍA DE LA INVESTIGACIÓN',72,72,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(681,7,3,'5MK3CL0302','PUBLICIDAD, COMUNICACIÓN DE MEDIOS Y RELACIONES PÚBLICAS',44,54,27,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(682,7,3,'6MK3IS0202','DERECHO MERCANTIL',0,36,18,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(708,13,3,'1GN3FT0402','Psicológía de  grupos turísticos',11,44,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(709,13,3,'2GN3AI0502','TÉCNICAS DE GUIANZA',33,60,33,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(710,13,3,'3GN3AI0502','Tecnologías y Equipos Aplicados a la Guianza',22,55,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(711,13,3,'4GN3AI0402','Educación e Interpretación Ambiental',11,44,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(712,13,3,'5GN3CL0502','Comunicación Social',22,55,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(713,13,3,'6GN3CL0402','Inglés básico',33,50,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(714,13,3,'7GN4IS0402','Liderazgo, Manejo y Animación de Grupos',11,44,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(715,13,3,'8GN4AI1002','Prácticas en formación dual',290,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(19,2,4,'1DS4FT0402','ESTADÍSTICA DESCRIPTIVA',0,48,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(20,2,4,'2DS4FT0402','LEGISLACIÓN INFORMÁTICA',0,48,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(21,2,4,'3DS4AI0502','PROGRAMACIÓN DE APLICACIONES WEB',24,60,38,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(22,2,4,'4DS4AI0602','DESARROLLO DE APLICACIONES MÓVILES',24,72,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(23,2,4,'5DS4CL0402','INGLÉS B1.2',0,48,37,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(24,2,4,'6DS4IS0302','DIVERSIDAD Y CULTURA',0,36,36,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(91,8,4,'1AS4FG0201','ÉTICA PROFESIONAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(92,8,4,'2AS4FG0201','PROBABILIDAD Y ESTADÍSTICA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(93,8,4,'3AS4FG0201','INGLÉS IV',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(94,8,4,'4AS4GT0301','PRINCIPIOS DE ADMINISTRACIÓN EMPRESAS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(95,8,4,'5AS4PR0301','PAQUETES',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(96,8,4,'6AS4PR0301','PROGRAMACIÓN ESTRUCTURADA IV',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(97,8,4,'7AS4PR0301','PROGRAMACIÓN ORIENTADA A OBJETOS II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(98,8,4,'8AS4PR0301','ARQUITECTURA II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(99,8,4,'9AS4PR0301','COMERCIO ELECTRÓNICO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(100,8,4,'10AS4OPO101','OPTATIVA IV',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(152,9,4,'1EL4FG0201','ÉTICA PROFESIONAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(153,9,4,'2EL4FG0201','INGLÉS IV',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(154,9,4,'3EL4PR0301','ELECTRÓNICA ANÁLOGA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(155,9,4,'4EL4PR0401','MÁQUINAS ELÉCTRICAS II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(156,9,4,'5EL4PR0301','CONTROL INDUSTRIAL II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(157,9,4,'6EL4PR0401','MÁQUINAS Y HERRAMIENTAS II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(158,9,4,'7EL4PR0401','SISTEMAS DE TRANSMISIÓN II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(159,9,4,'8EL4PR0201','HARDWARE DE PC',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(160,9,4,'9EL4OP0101','OPTATIVA IV',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(271,10,4,'7ET4OP0101','OPTATIVA IV',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(270,10,4,'6ET4PR0201','HARDWARE DE PC',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(269,10,4,'5ET4PR0601','COMUNICACIONES I',0,6,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(268,10,4,'4ET4PR0401','MICROPROCESADORES',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(267,10,4,'3ET4PR0801','MÁQUINAS ELÉCTRICAS II',0,8,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(266,10,4,'2ET4FG0201','INGLÉS IV',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(265,10,4,'1ET4GT0201','METODOLOGÍA DE INVESTIGACIÓN II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(326,5,4,'1GT4CH0101','DESEMPEÑO ACTITUDINAL EN LA GUIANZA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(327,5,4,'2GT4CH0101','RESPONSABILIDAD SOCIAL Y AMBIENTAL EN ACTIVIDADES DE GUIANZA',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(328,5,4,'3GT4CD0201','SISTEMA DE GESTIÓN Y EVALUACION DE PROYECTOS TURISTICOS',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(329,5,4,'4GT4PR0301','METODOLOGÍA PARA EVALUACIÓN DE IMPACTOS',4,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(330,5,4,'5GT4PR0301','BUENAS PRÁCTICAS EN LA GUIANZA',4,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(331,5,4,'6GT4PR0201','HERRAMIENTAS TICS PARA EVALUACIÓN DE IMPACTOS',4,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(332,5,4,'7GT4PR0501','EVALUACIÓN DE IMPACTOS EN LA GUIANZA',150,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(333,5,4,'8GT4CI0301','VALORACIÓN DE IMPACTOS TURÍSTICOS EN LA GESTIÓN DE LA GUIANZA TURÍSTICA EN DESTINOS Y RUTAS',0,6,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(334,5,4,'9GT4PR2501','INGLÉS',0,10,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(335,5,4,'10GT4PR0301','DESARROLLO DEL PLAN DE TITULACIÓN',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(458,11,4,'1DM4FH0201','LEGISLACIÓN IV',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(459,11,4,'2DM4FH0201','INCUBADORA DE EMPRESAS II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(460,11,4,'3DM4FB0101','MATEMÁTICA III',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(461,11,4,'4DM4FB0201','INGLÉS TÉCNICO II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(462,11,4,'5DM4FB0201','ADOBE ILUSTRADOR II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(463,11,4,'6DM4FP0301','ALTA COSTURA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(464,11,4,'7DM4FP0101','ESCALADO I',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(465,11,4,'8DM4FP0201','CONFECCIÓN I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(466,11,4,'9DM4FP0101','BISUTERÍA',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(467,11,4,'10DM4FP0101','TEXTILES II',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(468,11,4,'11DM4FP0301','MANEJO DE TEXTILES',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(469,11,4,'12DM4FP0301','GERBER II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(470,11,4,'13DM4FP0201','TALLER DE ESTILO II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(499,12,4,'1DS4FT1001','ANÁLISIS ESTADISTICO',12,80,29,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(500,12,4,'2DS4FT0301','LEGISLACIÓN INFORMÁTICA',0,32,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(501,12,4,'3DS4FT0901','BASE DE DATOS',40,64,50,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(502,12,4,'5DS4FT0201','INGLÉS IV',0,48,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(503,12,4,'6DS4FT0301','COMUNICACIÓN EFECTIVA',0,32,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(504,12,4,'4DS4FT0401','MODELACIÓN E IMPLEMENTACIÓN DE BASE DE DATOS (FASE PRÁCTICA)',390,0,30,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(535,3,4,'1MK4HU0301','ÉTICA EMPRESARIAL Y HERRAMIENTAS GERENCIALES',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(536,3,4,'2MK4BS0301','PRESUPUESTO DE VENTAS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(537,3,4,'3MK4BS0401','MATEMÁTICA FINANCIERA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(538,3,4,'4MK4BS0301','INGLÉS IV',0,8,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(539,3,4,'5MK4BS0301','MICROECONOMÍA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(540,3,4,'6MK4PR0301','ADMINISTRACIÓN DE VENTAS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(541,3,4,'7MK4PR0401','MARKETING DIRECTO',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(542,3,4,'8MK4PR0301','CLÍNICA DE VENTAS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(636,4,4,'1DM4FT0402','COSTOS INDUSTRIALES',0,72,45,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(637,4,4,'2DM4FT0202','MARKETING DE MODA',0,36,25,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(638,4,4,'3DM4AI0502','SASTRERIA AVANZADA',72,90,45,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(639,4,4,'4DM4AI0402','ALTA COSTURA BÁSICA',54,72,45,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(640,4,4,'5DM4AI0202','ACCESORIOS Y COMPLEMENTOS',18,36,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(641,4,4,'6DM4AI0302','PROCESOS',36,54,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(663,6,4,'1AC4FT0302','COMPRAS Y BODEGA',10,30,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(664,6,4,'2AC4AI0502','ARTE CULINARIO II: RECETAS',24,56,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(665,6,4,'3AC4AI0302','PASTELERÍA',15,30,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(666,6,4,'4AC4AI0302','PRODUCCIÓN CULINARIA ALTO VOLUMEN',15,30,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(667,6,4,'5AC5CL0302','SOFTWARE PARA EL MANEJO DE ALIMENTOS Y BEBIDAS',20,30,20,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(668,6,4,'6AC5AI0902','PRÁCTICAS DE FORMACIÓN DUAL',284,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(670,2,4,'7DS4AI0902','PRÁCTICAS DE FORMACIÓN DUAL',260,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(683,7,4,'1MK4FT0302','MÉTODOS ESTADÍSTICOS PARA LA TOMA DE DECISIONES',32,54,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(684,7,4,'2MK4FT0402','INVESTIGACIÓN DE MERCADOS',59,72,49,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(685,7,4,'3MK4AI0302','NEUROMARKETING',32,54,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(686,7,4,'4MK4AI0402','DISEÑO PUBLICITARIO',59,72,35,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(687,7,4,'5MK4AI0302','GERENCIA DE SERVICIOS Y VENTAS',33,54,23,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(688,7,4,'6MK4IS0302','DESARROLLO DE MARCAS Y NUEVOS PRODUCTOS / PPP',61,54,33,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(716,13,4,'1GN4FT0502','Flora  del Ecuador',15,55,10,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(717,13,4,'2GN4FT0502','Fauna del Ecuador',15,55,10,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(718,13,4,'3GN4AI0602','PROTOCOLOS DE GUIANZA TURÍSTICA (TOURIST GUIDANCE PROTOCOLS)',31,70,30,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(719,13,4,'4GN5CL0402','Inglés pre intermedio',33,50,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(720,13,4,'5GN4AI0402','Sociología del Turismo',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(721,13,4,'5.1GN4AI0402','Turismo en Patrimonio Cultural del Ecuador',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(722,13,4,'5.2GN4AI0402','Turismo en Patrimonio Natural del Ecuador',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(723,13,4,'5.3GN4AI0402','Operaciones Turísticas de aventura',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(724,13,4,'6GN4IAI402','Sistema de gestión y evaluación de proyectos turísticos',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(725,13,4,'6.1GN4AI0402','Museos y centros históricos',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(726,13,4,'6.2GN4AI0402','Identificación de Especies Faunísticas',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(727,13,4,'6.3GN4AI0402','Manejo de equipos y herramientas en turismo de aventura',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(728,13,4,'7GN4AI1002','Prácticas en formación dual',290,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(25,2,5,'1DS5FT0502','CALIDAD DE SOFTWARE',24,60,6,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(26,2,5,'2DS5FT0302','EMPRENDIMIENTO',0,36,5,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(27,2,5,'6DS5AI1102','PRÁCTICAS DE FORMACIÓN DUAL',320,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(28,2,5,'4DS5IAI502','TENDENCIAS ACTUALES DE PROGRAMACIÓN',24,60,6,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(29,2,5,'3DS5AI0502','FUNDAMENTOS DE REDES Y CONECTIVIDAD',12,60,6,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(30,2,5,'5DS5IS0302','ÉTICA PROFESIONAL',0,36,5,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(101,8,5,'1AS5FG0201','LEGISLACIÓN LABORAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(102,8,5,'2AS5PR0301','BASE DE DATOS I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(103,8,5,'3AS5GT0201','MARKETING',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(104,8,5,'4AS5FG0201','INGLÉS V',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(105,8,5,'5AS5GT0301','MICROECONOMÍA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(106,8,5,'6AS5PR0301','ANÁLISIS DE SISTEMAS I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(107,8,5,'7AS5GT0301','PROYECTOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(108,8,5,'8AS5PR0301','REDES I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(109,8,5,'9AS5PR0301','CONTROL DE CALIDAD DE SOFTWARE',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(110,8,5,'10AS5OPO101','OPTATIVA V',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(161,9,5,'1EL5FG0201','LEGISLACIÓN LABORAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(162,9,5,'2EL5FG0201','INGLÉS V',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(163,9,5,'3EL5PR0301','ELECTRÓNICA DIGITAL',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(164,9,5,'4EL5PR0301','CENTRALES ELÉCTRICAS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(165,9,5,'6EL5PR0301','CONTROL DE PROCESOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(166,9,5,'7EL5PR0301','SISTEMAS DE DISTRIBUCIÓN I',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(167,9,5,'8EL5PR0201','CLIMATIZACIÓN',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(168,9,5,'9EL5GT0301','PROYECTOS',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(169,9,5,'10EL5OP0101','OPTATIVA V',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(170,9,5,'5EL5PR0301','PLC',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(279,10,5,'8ET5OP0101','OPTATIVA V',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(278,10,5,'7ET5PR0201','REDES DE PC',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(277,10,5,'6ET5PR0301','COMUNICACIONES II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(276,10,5,'5ET5GT0501','CONTROL DE PROCESOS',0,5,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(275,10,5,'4ET5PR0701','MANTENIMIENTO ELECTRÓNICO',0,7,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(274,10,5,'3ET5FG0201','INGLÉS V',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(273,10,5,'2ET5GT0301','PROYECTOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(272,10,5,'1ET5FG0201','ÉTICA PROFESIONAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(471,11,5,'1DM5FH0201','LEGISLACIÓN  V',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(472,11,5,'2DM5FH0201','PLAN DE PROYECTO EMPRESARIAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(473,11,5,'3DM5FB0101','MATEMÁTICA FINANCIERA I',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(474,11,5,'4DM5FB0201','INGLÉS TÉCNICO III',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(475,11,5,'5DM5FB0201','FASHION ESTUDY I',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(476,11,5,'6DM5FP0201','ESTUDIO DE TIEMPOS Y MOVIMIENTOS',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(477,11,5,'7DM5FP0101','ESCALADO II',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(478,11,5,'8DM5FP0301','CONFECCIÓN II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(479,11,5,'9DM5FP0101','EMBALAJE',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(480,11,5,'10DM5FP0101','SOCIOLOGÍA DE LA MODA',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(481,11,5,'11DM5FP0401','PROGRAMACIÓN DE COLECCIONES I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(482,11,5,'12DM5FP0401','GERBER III',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(505,12,5,'1DS5FT0901','CÁLCULO INTEGRAL',0,80,40,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(506,12,5,'2DS5FT0201','FUNDAMENTOS DE PROYECTO DE TESIS',0,16,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(507,12,5,'3DS5FT0701','PROGRAMACIÓN IV',36,48,23,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(508,12,5,'4DS5FT0501','REDES',0,32,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(509,12,5,'6DS5FT0201','INGLÉS V',0,48,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(510,12,5,'7DS5CE0201','DESARROLLO PERSONAL',0,16,18,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(511,12,5,'5DS5FT4301','APLICACIÓN DE PROCESOS PARALELOS Y PROGRAMACIÓN EN REDES (FASE PRÁCTICA)',0,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(543,3,5,'1MK5HU0201','COMPORTAMIENTO PROFESIONAL Y DEL MEDIO AMBIENTE',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(544,3,5,'2MK5BS0301','INVESTIGACIÓN DE MERCADOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(545,3,5,'3MK5BS0301','ANÁLISIS FINANCIERO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(546,3,5,'4MK5BS0301','MÉTODOS Y TÉCNICAS DE INVESTIGACIÓN II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(547,3,5,'5MK5BS0301','MACROECONOMÍA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(548,3,5,'6MK5PR0201','COMERCIO EXTERIOR',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(549,3,5,'7MK5PR0401','DISEÑO Y ELABORACIÓN DE PROYECTOS I',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(550,3,5,'8MK5PR0201','CALIDAD TOTAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(551,3,5,'9MK5PR0301','DISEÑO GRÁFICO APLICADO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(642,4,5,'1DM5FT0202','GESTIÓN DE LA CALIDAD',18,36,10,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(643,4,5,'2DM5AI0302','INDUSTRIALIZACIÓN DE MODA',36,54,14,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(644,4,5,'3DM5AI0302','ALTA COSTURA AVANZADA',54,54,14,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(645,4,5,'4DM5AI0302','PATRONAJE DIGITAL',54,54,14,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(646,4,5,'5DM5AI0202','EVENTOS DE MODA',18,36,10,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(647,4,5,'6DM5IS0302','EMPRENDIMIENTO',0,54,10,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(689,7,5,'1MK5FT0502','TÉCNICAS DE NEGOCIO Y COMERCIO INTERNACIONAL',14,86,14,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(690,7,5,'2MK5AI0402','COMERCIO DIGITAL',17,68,12,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(691,7,5,'3MK5AI0402','EVALUACIÓN Y FORMACIÓN DE PROYECTOS DE INVERSIÓN',20,68,10,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(692,7,5,'4MK5AI0402','MARKETING ESTRATÉGICO / VINC.',17,70,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(693,7,5,'5MK5IS0402','COMPORTAMIENTO PROFESIONAL Y AMBIENTAL',13,68,12,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(729,13,5,'1GN5FT0302','Primeros Auxilios',20,33,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(730,13,5,'2GN5AI0502','INNOVACIÓN Y BUENAS PRACTICAS EN EL TURISMO SOSTENIBLE',30,55,33,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(731,13,5,'3GN5CL0402','Inglés intermedio',33,50,22,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(732,13,5,'4GN5IS0402','Legislación Turística y Ambiental',10,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(733,13,5,'5GN5AI0402','Impacto socio ambiental en el turismo',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(734,13,5,'5.1GN5AI0402','Arqueología ecuatoriana',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(735,13,5,'5.2GN5AI0402','Identificación de especies Florísticas',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(736,13,5,'5.3GN5AI0402','Deportes de aventura',22,44,11,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(737,13,5,'6GN5AI0902','Prácticas en formación dual',280,0,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(111,8,6,'1AS6PR0301','SISTEMAS OPERATIVOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(112,8,6,'2AS6PR0301','BASE DE DATOS II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(113,8,6,'3AS6PR0301','APLICACIONES WEB',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(114,8,6,'4AS6FG0201','INGLÉS VI',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(115,8,6,'5AS6PR0301','ANÁLISIS DE SISTEMAS II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(116,8,6,'6AS6GT0401','DESARROLLO Y ADMINISTRACIÓN DE PROYECTOS INFORMÁTICOS',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(117,8,6,'7AS6PR0301','REDES II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(118,8,6,'8AS6PR0401','AUDITORÍA INFORMÁTICA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(119,8,6,'9AS6GTO201','PROYECTO DE TITULACIÓN',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(171,9,6,'1EL6FG0201','INGLÉS VI',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(172,9,6,'2EL6PR0401','ELECTRÓNICA INDUSTRIAL',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(173,9,6,'3EL6PR0301','INSTRUMENTACIÓN ELÉCTRICA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(174,9,6,'4EL6PR0401','NEUMÁTICA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(175,9,6,'5EL6PR0301','MANTENIMIENTO INDUSTRIAL',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(176,9,6,'6EL6PR0401','SISTEMAS DE DISTRIBUCIÓN II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(177,9,6,'7EL6PR0201','SISTEMAS DE CONTROL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(178,9,6,'8EL6PR0301','CENTRALES DE GENERACIÓN',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(179,9,6,'9EL6GT0201','PROYECTO DE TITULACIÓN',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(286,10,6,'7ET6GTO201','PROYECTO DE TITULACIÓN',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(285,10,6,'6ET6PR0401','TELEFONÍA',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(284,10,6,'5ET6PR0201','ANTENAS',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(283,10,6,'4ET6PR0401','TELEVISIÓN',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(282,10,6,'3ET6PR0801','INSTRUMENTACIÓN  ',0,8,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(281,10,6,'2ET6FG0201','INGLÉS VI',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(280,10,6,'1ET6GT0301','PRINCIPIOS DE ADMINISTRACIÓN EMPRESAS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(483,11,6,'1DM6FH0201','LEGISLACIÓN VI',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(484,11,6,'2DM6FH0201','DESARROLLO ORGANIZACIONAL',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(485,11,6,'3DM6FB0101','MATEMÁTICA FINANCIERA II',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(486,11,6,'4DM6FB0201','INGLÉS TÉCNICO IV',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(487,11,6,'5DM6FB0201','FASHION ESTUDY II',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(488,11,6,'6DM6FP0301','PRODUCCIÓN INDUSTRIAL',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(489,11,6,'7DM6FP0301','CONFECCIÓN III',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(490,11,6,'8DM6FP0201','MANEJO DE IMAGEN',0,2,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(491,11,6,'9DM6FP0401','PROGRAMACIÓN DE COLECCIONES II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(492,11,6,'10DM6FP0301','PROYECTOS DE PRODUCCIÓN',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(493,11,6,'11DM6FP0101','DIRECCIÓN DE TESIS',0,1,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(512,12,6,'1DS6CE0201','TEMAS ESPECIALES',0,16,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(513,12,6,'4DS6CE0601','TENDENCIAS ACTUALES DE PROGRAMACIÓN',41,48,32,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(514,12,6,'2DS6CE0501','PROCESOS DE DESARROLLO DE SOFTWARE',0,48,60,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(515,12,6,'3DS6CE0901','FUNDAMENTOS DE SOFTWARE ENGINEERING',9,64,32,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(516,12,6,'6DS6CE0201','INGLÉS APLICADO',0,48,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(517,12,6,'5DS6CE4301','PROYECTO DE TESIS (FASE PRÁCTICA)',390,0,30,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(552,3,6,'1MK6HU0301','ANÁLISIS GEOPOLÍTICO Y SOCIO - ECONÓMICO DEL ENTORNO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(553,3,6,'2MK6BS0301','NEGOCIACIÓN Y LIDERAZGO',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(554,3,6,'3MK6BS0301','GESTIÓN DE PROCESOS',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(555,3,6,'4MK6BS0301','PLANIFICACIÓN ESTRATÉGICA',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(556,3,6,'5MK6PR0301','MARKETING INTERNACIONAL',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(557,3,6,'6MK6PR0401','DISEÑO Y ELABORACIÓN DE PROYECTOS II',0,4,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(558,3,6,'7MK6PR0301','MARKETING ESTRATÉGICO II',0,3,0,'ASIGNATURA');
INSERT INTO asignaturas(id,malla_id, periodo_academico_id,codigo, nombre, horas_practica, horas_docente, horas_autonoma, tipo) VALUES(559,3,6,'8MK6PR0301','GERENCIA DE VENTAS',0,3,0,'ASIGNATURA');

INSERT INTO periodo_lectivos (id, nombre,
fecha_inicio_periodo, fecha_fin_periodo,
fecha_inicio_cupo, fecha_fin_cupo,
fecha_inicio_ordinaria, fecha_fin_ordinaria,
fecha_inicio_extraordinaria, fecha_fin_extraordinaria,
fecha_inicio_especial, fecha_fin_especial,
codigo, estado)
    VALUES
    (1, 'MAYO 2017 - OCTUBRE 2017',
    '2017-05-01','2018-10-31',
    '2017-05-01','2018-10-31',
    '2017-05-01','2018-10-31',
    '2017-05-01','2018-10-31',
    '2017-05-01','2018-10-31',
    '2017-1','ACTIVO'),
    (2, 'NOVIEMBRE 2017 - ABRIL 2018',
    '2017-11-01','2018-04-30',
    '2017-11-01','2018-04-30',
    '2017-11-01','2018-04-30',
    '2017-11-01','2018-04-30',
    '2017-11-01','2018-04-30',
    '2017-2','ACTIVO'),
    (3, 'MAYO 2018 - OCTUBRE 2018',
    '2018-05-01','2018-10-30',
    '2018-05-01','2018-10-30',
    '2018-05-01','2018-10-30',
    '2018-05-01','2018-10-30',
    '2018-05-01','2018-10-30',
    '2018-1','ACTIVO'),
    (4, 'NOVIEMBRE 2018 - ABRIL 2019',
    '2018-11-06','2019-04-15',
    '2018-11-06','2019-04-15',
    '2018-11-06','2019-04-15',
    '2018-11-06','2019-04-15',
    '2018-11-06','2019-04-15',
    '2018-2','ACTUAL');

INSERT INTO tipo_matriculas (id, nombre, estado)
    VALUES
    (1,'ORDINARIA','ACTIVO'),
    (2,'EXTRAORDINARIA','ACTIVO'),
    (3,'ESPECIAL','ACTIVO'),
    (4,'CUPO','ACTIVO'),
    (5,'NA','ACTIVO');

    INSERT INTO ubicaciones
    (id,created_at,updated_at, codigo_padre_id, codigo, nombre, tipo, estado)
VALUES
    (0,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'0','','PAIS','ELIMINADO'),
    (1,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'56','ECUADOR','PAIS','ACTIVO'),
    (2,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'01','AZUAY','PROVINCIA','ACTIVO'),
    (3,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'02','BOLIVAR','PROVINCIA','ACTIVO'),
    (4,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'03','CAÑAR','PROVINCIA','ACTIVO'),
    (5,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'04','CARCHI','PROVINCIA','ACTIVO'),
    (6,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'05','COTOPAXI','PROVINCIA','ACTIVO'),
    (7,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'06','CHIMBORAZO','PROVINCIA','ACTIVO'),
    (8,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'07','EL ORO','PROVINCIA','ACTIVO'),
    (9,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'08','ESMERALDAS','PROVINCIA','ACTIVO'),
    (10,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'09','GUAYAS','PROVINCIA','ACTIVO'),
    (11,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'10','IMBABURA','PROVINCIA','ACTIVO'),
    (12,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'11','LOJA','PROVINCIA','ACTIVO'),
    (13,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'12','LOS RIOS','PROVINCIA','ACTIVO'),
    (14,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'13','MANABI','PROVINCIA','ACTIVO'),
    (15,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'14','MORONA SANTIAGO','PROVINCIA','ACTIVO'),
    (16,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'15','NAPO','PROVINCIA','ACTIVO'),
    (17,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'16','PASTAZA','PROVINCIA','ACTIVO'),
    (18,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'17','PICHINCHA','PROVINCIA','ACTIVO'),
    (19,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'18','TUNGURAHUA','PROVINCIA','ACTIVO'),
    (20,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'19','ZAMORA CHINCHIPE','PROVINCIA','ACTIVO'),
    (21,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'20','GALAPAGOS','PROVINCIA','ACTIVO'),
    (22,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'21','SUCUMBIOS','PROVINCIA','ACTIVO'),
    (23,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'22','ORELLANA','PROVINCIA','ACTIVO'),
    (24,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'23','SANTO DOMINGO DE LOS TSACHILAS','PROVINCIA','ACTIVO'),
    (25,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'24','SANTA ELENA','PROVINCIA','ACTIVO'),
    (26,'2019-03-04 00:00:00', '2019-03-04 00:00:00',1,'90','ZONAS NO DELIMITADAS','PROVINCIA','ACTIVO'),
    (27,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0101','CUENCA','CANTON','ACTIVO'),
    (28,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0102','GIRÓN','CANTON','ACTIVO'),
    (29,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0103','GUALACEO','CANTON','ACTIVO'),
    (30,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0104','NABÓN','CANTON','ACTIVO'),
    (31,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0105','PAUTE','CANTON','ACTIVO'),
    (32,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0106','PUCARA','CANTON','ACTIVO'),
    (33,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0107','SAN FERNANDO','CANTON','ACTIVO'),
    (34,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0108','SANTA ISABEL','CANTON','ACTIVO'),
    (35,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0109','SIGSIG','CANTON','ACTIVO'),
    (36,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0110','OÑA','CANTON','ACTIVO'),
    (37,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0111','CHORDELEG','CANTON','ACTIVO'),
    (38,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0112','EL PAN','CANTON','ACTIVO'),
    (39,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0113','SEVILLA DE ORO','CANTON','ACTIVO'),
    (40,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0114','GUACHAPALA','CANTON','ACTIVO'),
    (41,'2019-03-04 00:00:00', '2019-03-04 00:00:00',2,'0115','CAMILO PONCE ENRÍQUEZ','CANTON','ACTIVO'),
    (42,'2019-03-04 00:00:00', '2019-03-04 00:00:00',3,'0201','GUARANDA','CANTON','ACTIVO'),
    (43,'2019-03-04 00:00:00', '2019-03-04 00:00:00',3,'0202','CHILLANES','CANTON','ACTIVO'),
    (44,'2019-03-04 00:00:00', '2019-03-04 00:00:00',3,'0203','CHIMBO','CANTON','ACTIVO'),
    (45,'2019-03-04 00:00:00', '2019-03-04 00:00:00',3,'0204','ECHEANDÍA','CANTON','ACTIVO'),
    (46,'2019-03-04 00:00:00', '2019-03-04 00:00:00',3,'0205','SAN MIGUEL','CANTON','ACTIVO'),
    (47,'2019-03-04 00:00:00', '2019-03-04 00:00:00',3,'0206','CALUMA','CANTON','ACTIVO'),
    (48,'2019-03-04 00:00:00', '2019-03-04 00:00:00',3,'0207','LAS NAVES','CANTON','ACTIVO'),
    (49,'2019-03-04 00:00:00', '2019-03-04 00:00:00',4,'0301','AZOGUES','CANTON','ACTIVO'),
    (50,'2019-03-04 00:00:00', '2019-03-04 00:00:00',4,'0302','BIBLIÁN','CANTON','ACTIVO'),
    (51,'2019-03-04 00:00:00', '2019-03-04 00:00:00',4,'0303','CAÑAR','CANTON','ACTIVO'),
    (52,'2019-03-04 00:00:00', '2019-03-04 00:00:00',4,'0304','LA TRONCAL','CANTON','ACTIVO'),
    (53,'2019-03-04 00:00:00', '2019-03-04 00:00:00',4,'0305','EL TAMBO','CANTON','ACTIVO'),
    (54,'2019-03-04 00:00:00', '2019-03-04 00:00:00',4,'0306','DÉLEG','CANTON','ACTIVO'),
    (55,'2019-03-04 00:00:00', '2019-03-04 00:00:00',4,'0307','SUSCAL','CANTON','ACTIVO'),
    (56,'2019-03-04 00:00:00', '2019-03-04 00:00:00',5,'0401','TULCÁN','CANTON','ACTIVO'),
    (57,'2019-03-04 00:00:00', '2019-03-04 00:00:00',5,'0402','BOLÍVAR','CANTON','ACTIVO'),
    (58,'2019-03-04 00:00:00', '2019-03-04 00:00:00',5,'0403','ESPEJO','CANTON','ACTIVO'),
    (59,'2019-03-04 00:00:00', '2019-03-04 00:00:00',5,'0404','MIRA','CANTON','ACTIVO'),
    (60,'2019-03-04 00:00:00', '2019-03-04 00:00:00',5,'0405','MONTÚFAR','CANTON','ACTIVO'),
    (61,'2019-03-04 00:00:00', '2019-03-04 00:00:00',5,'0406','SAN PEDRO DE HUACA','CANTON','ACTIVO'),
    (62,'2019-03-04 00:00:00', '2019-03-04 00:00:00',6,'0501','LATACUNGA','CANTON','ACTIVO'),
    (63,'2019-03-04 00:00:00', '2019-03-04 00:00:00',6,'0502','LA MANÁ','CANTON','ACTIVO'),
    (64,'2019-03-04 00:00:00', '2019-03-04 00:00:00',6,'0503','PANGUA','CANTON','ACTIVO'),
    (65,'2019-03-04 00:00:00', '2019-03-04 00:00:00',6,'0504','PUJILI','CANTON','ACTIVO'),
    (66,'2019-03-04 00:00:00', '2019-03-04 00:00:00',6,'0505','SALCEDO','CANTON','ACTIVO'),
    (67,'2019-03-04 00:00:00', '2019-03-04 00:00:00',6,'0506','SAQUISILÍ','CANTON','ACTIVO'),
    (68,'2019-03-04 00:00:00', '2019-03-04 00:00:00',6,'0507','SIGCHOS','CANTON','ACTIVO'),
    (69,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0601','RIOBAMBA','CANTON','ACTIVO'),
    (70,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0602','ALAUSI','CANTON','ACTIVO'),
    (71,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0603','COLTA','CANTON','ACTIVO'),
    (72,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0604','CHAMBO','CANTON','ACTIVO'),
    (73,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0605','CHUNCHI','CANTON','ACTIVO'),
    (74,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0606','GUAMOTE','CANTON','ACTIVO'),
    (75,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0607','GUANO','CANTON','ACTIVO'),
    (76,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0608','PALLATANGA','CANTON','ACTIVO'),
    (77,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0609','PENIPE','CANTON','ACTIVO'),
    (78,'2019-03-04 00:00:00', '2019-03-04 00:00:00',7,'0610','CUMANDÁ','CANTON','ACTIVO'),
    (79,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0701','MACHALA','CANTON','ACTIVO'),
    (80,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0702','ARENILLAS','CANTON','ACTIVO'),
    (81,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0703','ATAHUALPA','CANTON','ACTIVO'),
    (82,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0704','BALSAS','CANTON','ACTIVO'),
    (83,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0705','CHILLA','CANTON','ACTIVO'),
    (84,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0706','EL GUABO','CANTON','ACTIVO'),
    (85,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0707','HUAQUILLAS','CANTON','ACTIVO'),
    (86,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0708','MARCABELÍ','CANTON','ACTIVO'),
    (87,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0709','PASAJE','CANTON','ACTIVO'),
    (88,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0710','PIÑAS','CANTON','ACTIVO'),
    (89,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0711','PORTOVELO','CANTON','ACTIVO'),
    (90,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0712','SANTA ROSA','CANTON','ACTIVO'),
    (91,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0713','ZARUMA','CANTON','ACTIVO'),
    (92,'2019-03-04 00:00:00', '2019-03-04 00:00:00',8,'0714','LAS LAJAS','CANTON','ACTIVO'),
    (93,'2019-03-04 00:00:00', '2019-03-04 00:00:00',9,'0801','ESMERALDAS','CANTON','ACTIVO'),
    (94,'2019-03-04 00:00:00', '2019-03-04 00:00:00',9,'0802','ELOY ALFARO','CANTON','ACTIVO'),
    (95,'2019-03-04 00:00:00', '2019-03-04 00:00:00',9,'0803','MUISNE','CANTON','ACTIVO'),
    (96,'2019-03-04 00:00:00', '2019-03-04 00:00:00',9,'0804','QUININDÉ','CANTON','ACTIVO'),
    (97,'2019-03-04 00:00:00', '2019-03-04 00:00:00',9,'0805','SAN LORENZO','CANTON','ACTIVO'),
    (98,'2019-03-04 00:00:00', '2019-03-04 00:00:00',9,'0806','ATACAMES','CANTON','ACTIVO'),
    (99,'2019-03-04 00:00:00', '2019-03-04 00:00:00',9,'0807','RIOVERDE','CANTON','ACTIVO'),
    (100,'2019-03-04 00:00:00', '2019-03-04 00:00:00',9,'0808','LA CONCORDIA','CANTON','ACTIVO'),
    (101,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0901','GUAYAQUIL','CANTON','ACTIVO'),
    (102,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0902','EDO BAQUERIZO MORENO (JU','CANTON','ACTIVO'),
    (103,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0903','BALAO','CANTON','ACTIVO'),
    (104,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0904','BALZAR','CANTON','ACTIVO'),
    (105,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0905','COLIMES','CANTON','ACTIVO'),
    (106,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0906','DAULE','CANTON','ACTIVO'),
    (107,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0907','DURÁN','CANTON','ACTIVO'),
    (108,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0908','EL EMPALME','CANTON','ACTIVO'),
    (109,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0909','EL TRIUNFO','CANTON','ACTIVO'),
    (110,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'9010','MILAGRO','CANTON','ACTIVO'),
    (111,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0911','NARANJAL','CANTON','ACTIVO'),
    (112,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0912','NARANJITO','CANTON','ACTIVO'),
    (113,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0913','PALESTINA','CANTON','ACTIVO'),
    (114,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0914','PEDRO CARBO','CANTON','ACTIVO'),
    (115,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0915','SAMBORONDÓN','CANTON','ACTIVO'),
    (116,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0916','SANTA LUCÍA','CANTON','ACTIVO'),
    (117,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0917','SALITRE (URBINA JADO)','CANTON','ACTIVO'),
    (118,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0918','SAN JACINTO DE YAGUACHI','CANTON','ACTIVO'),
    (119,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0919','PLAYAS','CANTON','ACTIVO'),
    (120,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0920','SIMÓN BOLÍVAR','CANTON','ACTIVO'),
    (121,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0921','RONEL MARCELINO MARIDUE','CANTON','ACTIVO'),
    (122,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0922','LOMAS DE SARGENTILLO','CANTON','ACTIVO'),
    (123,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0923','NOBOL','CANTON','ACTIVO'),
    (124,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0924','GENERAL ANTONIO ELIZALDE','CANTON','ACTIVO'),
    (125,'2019-03-04 00:00:00', '2019-03-04 00:00:00',10,'0925','ISIDRO AYORA','CANTON','ACTIVO'),
    (126,'2019-03-04 00:00:00', '2019-03-04 00:00:00',11,'1001','IBARRA','CANTON','ACTIVO'),
    (127,'2019-03-04 00:00:00', '2019-03-04 00:00:00',11,'1002','ANTONIO ANTE','CANTON','ACTIVO'),
    (128,'2019-03-04 00:00:00', '2019-03-04 00:00:00',11,'1003','COTACACHI','CANTON','ACTIVO'),
    (129,'2019-03-04 00:00:00', '2019-03-04 00:00:00',11,'1004','OTAVALO','CANTON','ACTIVO'),
    (130,'2019-03-04 00:00:00', '2019-03-04 00:00:00',11,'1005','PIMAMPIRO','CANTON','ACTIVO'),
    (131,'2019-03-04 00:00:00', '2019-03-04 00:00:00',11,'1006','SAN MIGUEL DE URCUQUÍ','CANTON','ACTIVO'),
    (132,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1107','LOJA','CANTON','ACTIVO'),
    (133,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1108','CALVAS','CANTON','ACTIVO'),
    (134,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1109','CATAMAYO','CANTON','ACTIVO'),
    (135,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1110','CELICA','CANTON','ACTIVO'),
    (136,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1111','CHAGUARPAMBA','CANTON','ACTIVO'),
    (137,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1112','ESPÍNDOLA','CANTON','ACTIVO'),
    (138,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1113','GONZANAMÁ','CANTON','ACTIVO'),
    (139,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1114','MACARÁ','CANTON','ACTIVO'),
    (140,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1115','PALTAS','CANTON','ACTIVO'),
    (141,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1116','PUYANGO','CANTON','ACTIVO'),
    (142,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1117','SARAGURO','CANTON','ACTIVO'),
    (143,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1118','SOZORANGA','CANTON','ACTIVO'),
    (144,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1119','ZAPOTILLO','CANTON','ACTIVO'),
    (145,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1120','PINDAL','CANTON','ACTIVO'),
    (146,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1121','QUILANGA','CANTON','ACTIVO'),
    (147,'2019-03-04 00:00:00', '2019-03-04 00:00:00',12,'1122','OLMEDO','CANTON','ACTIVO'),
    (148,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1201','BABAHOYO','CANTON','ACTIVO'),
    (149,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1202','BABA','CANTON','ACTIVO'),
    (150,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1203','MONTALVO','CANTON','ACTIVO'),
    (151,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1204','PUEBLOVIEJO','CANTON','ACTIVO'),
    (152,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1205','QUEVEDO','CANTON','ACTIVO'),
    (153,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1206','URDANETA','CANTON','ACTIVO'),
    (154,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1207','VENTANAS','CANTON','ACTIVO'),
    (155,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1208','VÍNCES','CANTON','ACTIVO'),
    (156,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1209','PALENQUE','CANTON','ACTIVO'),
    (157,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1210','BUENA FÉ','CANTON','ACTIVO'),
    (158,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1211','VALENCIA','CANTON','ACTIVO'),
    (159,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1212','MOCACHE','CANTON','ACTIVO'),
    (160,'2019-03-04 00:00:00', '2019-03-04 00:00:00',13,'1213','QUINSALOMA','CANTON','ACTIVO'),
    (161,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1301','PORTOVIEJO','CANTON','ACTIVO'),
    (162,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1302','BOLÍVAR','CANTON','ACTIVO'),
    (163,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1303','CHONE','CANTON','ACTIVO'),
    (164,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1304','EL CARMEN','CANTON','ACTIVO'),
    (165,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1305','FLAVIO ALFARO','CANTON','ACTIVO'),
    (166,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1306','JIPIJAPA','CANTON','ACTIVO'),
    (167,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1307','JUNÍN','CANTON','ACTIVO'),
    (168,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1308','MANTA','CANTON','ACTIVO'),
    (169,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1309','MONTECRISTI','CANTON','ACTIVO'),
    (170,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1310','PAJÁN','CANTON','ACTIVO'),
    (171,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1311','PICHINCHA','CANTON','ACTIVO'),
    (172,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1312','ROCAFUERTE','CANTON','ACTIVO'),
    (173,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1313','SANTA ANA','CANTON','ACTIVO'),
    (174,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1314','SUCRE','CANTON','ACTIVO'),
    (175,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1315','TOSAGUA','CANTON','ACTIVO'),
    (176,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1316','24 DE MAYO','CANTON','ACTIVO'),
    (177,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1317','PEDERNALES','CANTON','ACTIVO'),
    (178,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1318','OLMEDO','CANTON','ACTIVO'),
    (179,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1319','PUERTO LÓPEZ','CANTON','ACTIVO'),
    (180,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1320','JAMA','CANTON','ACTIVO'),
    (181,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1321','JARAMIJÓ','CANTON','ACTIVO'),
    (182,'2019-03-04 00:00:00', '2019-03-04 00:00:00',14,'1322','SAN VICENTE','CANTON','ACTIVO'),
    (183,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1401','MORONA','CANTON','ACTIVO'),
    (184,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1402','GUALAQUIZA','CANTON','ACTIVO'),
    (185,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1403','LIMÓN INDANZA','CANTON','ACTIVO'),
    (186,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1404','PALORA','CANTON','ACTIVO'),
    (187,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1405','SANTIAGO','CANTON','ACTIVO'),
    (188,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1406','SUCÚA','CANTON','ACTIVO'),
    (189,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1407','HUAMBOYA','CANTON','ACTIVO'),
    (190,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1408','SAN JUAN BOSCO','CANTON','ACTIVO'),
    (191,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1409','TAISHA','CANTON','ACTIVO'),
    (192,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1410','LOGROÑO','CANTON','ACTIVO'),
    (193,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1411','PABLO SEXTO','CANTON','ACTIVO'),
    (194,'2019-03-04 00:00:00', '2019-03-04 00:00:00',15,'1412','TIWINTZA','CANTON','ACTIVO'),
    (195,'2019-03-04 00:00:00', '2019-03-04 00:00:00',16,'1501','TENA','CANTON','ACTIVO'),
    (196,'2019-03-04 00:00:00', '2019-03-04 00:00:00',16,'1502','ARCHIDONA','CANTON','ACTIVO'),
    (197,'2019-03-04 00:00:00', '2019-03-04 00:00:00',16,'1503','EL CHACO','CANTON','ACTIVO'),
    (198,'2019-03-04 00:00:00', '2019-03-04 00:00:00',16,'1504','QUIJOS','CANTON','ACTIVO'),
    (199,'2019-03-04 00:00:00', '2019-03-04 00:00:00',16,'1505','ARLOS JULIO AROSEMENA TOL','CANTON','ACTIVO'),
    (200,'2019-03-04 00:00:00', '2019-03-04 00:00:00',17,'1601','PASTAZA','CANTON','ACTIVO'),
    (201,'2019-03-04 00:00:00', '2019-03-04 00:00:00',17,'1602','MERA','CANTON','ACTIVO'),
    (202,'2019-03-04 00:00:00', '2019-03-04 00:00:00',17,'1603','SANTA CLARA','CANTON','ACTIVO'),
    (203,'2019-03-04 00:00:00', '2019-03-04 00:00:00',17,'1604','ARAJUNO','CANTON','ACTIVO'),
    (204,'2019-03-04 00:00:00', '2019-03-04 00:00:00',18,'1701','QUITO','CANTON','ACTIVO'),
    (205,'2019-03-04 00:00:00', '2019-03-04 00:00:00',18,'1702','CAYAMBE','CANTON','ACTIVO'),
    (206,'2019-03-04 00:00:00', '2019-03-04 00:00:00',18,'1703','MEJIA','CANTON','ACTIVO'),
    (207,'2019-03-04 00:00:00', '2019-03-04 00:00:00',18,'1704','PEDRO MONCAYO','CANTON','ACTIVO'),
    (208,'2019-03-04 00:00:00', '2019-03-04 00:00:00',18,'1705','RUMIÑAHUI','CANTON','ACTIVO'),
    (209,'2019-03-04 00:00:00', '2019-03-04 00:00:00',18,'1706','SAN MIGUEL DE LOS BANCOS','CANTON','ACTIVO'),
    (210,'2019-03-04 00:00:00', '2019-03-04 00:00:00',18,'1707','PEDRO VICENTE MALDONADO','CANTON','ACTIVO'),
    (211,'2019-03-04 00:00:00', '2019-03-04 00:00:00',18,'1708','PUERTO QUITO','CANTON','ACTIVO'),
    (212,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1801','AMBATO','CANTON','ACTIVO'),
    (213,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1802','BAÑOS DE AGUA SANTA','CANTON','ACTIVO'),
    (214,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1803','CEVALLOS','CANTON','ACTIVO'),
    (215,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1804','MOCHA','CANTON','ACTIVO'),
    (216,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1805','PATATE','CANTON','ACTIVO'),
    (217,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1806','QUERO','CANTON','ACTIVO'),
    (218,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1807','SAN PEDRO DE PELILEO','CANTON','ACTIVO'),
    (219,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1808','SANTIAGO DE PÍLLARO','CANTON','ACTIVO'),
    (220,'2019-03-04 00:00:00', '2019-03-04 00:00:00',19,'1809','TISALEO','CANTON','ACTIVO'),
    (221,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1901','ZAMORA','CANTON','ACTIVO'),
    (222,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1902','CHINCHIPE','CANTON','ACTIVO'),
    (223,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1903','NANGARITZA','CANTON','ACTIVO'),
    (224,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1904','YACUAMBI','CANTON','ACTIVO'),
    (225,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1905','YANTZAZA (YANZATZA)','CANTON','ACTIVO'),
    (226,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1906','EL PANGUI','CANTON','ACTIVO'),
    (227,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1907','CENTINELA DEL CÓNDOR','CANTON','ACTIVO'),
    (228,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1908','PALANDA','CANTON','ACTIVO'),
    (229,'2019-03-04 00:00:00', '2019-03-04 00:00:00',20,'1909','PAQUISHA','CANTON','ACTIVO'),
    (230,'2019-03-04 00:00:00', '2019-03-04 00:00:00',21,'2001','SAN CRISTÓBAL','CANTON','ACTIVO'),
    (231,'2019-03-04 00:00:00', '2019-03-04 00:00:00',21,'2002','ISABELA','CANTON','ACTIVO'),
    (232,'2019-03-04 00:00:00', '2019-03-04 00:00:00',21,'2003','SANTA CRUZ','CANTON','ACTIVO'),
    (233,'2019-03-04 00:00:00', '2019-03-04 00:00:00',22,'2101','LAGO AGRIO','CANTON','ACTIVO'),
    (234,'2019-03-04 00:00:00', '2019-03-04 00:00:00',22,'2102','GONZALO PIZARRO','CANTON','ACTIVO'),
    (235,'2019-03-04 00:00:00', '2019-03-04 00:00:00',22,'2103','PUTUMAYO','CANTON','ACTIVO'),
    (236,'2019-03-04 00:00:00', '2019-03-04 00:00:00',22,'2104','SHUSHUFINDI','CANTON','ACTIVO'),
    (237,'2019-03-04 00:00:00', '2019-03-04 00:00:00',22,'2105','SUCUMBÍOS','CANTON','ACTIVO'),
    (238,'2019-03-04 00:00:00', '2019-03-04 00:00:00',22,'2106','CASCALES','CANTON','ACTIVO'),
    (239,'2019-03-04 00:00:00', '2019-03-04 00:00:00',22,'2107','CUYABENO','CANTON','ACTIVO'),
    (240,'2019-03-04 00:00:00', '2019-03-04 00:00:00',23,'2201','ORELLANA','CANTON','ACTIVO'),
    (241,'2019-03-04 00:00:00', '2019-03-04 00:00:00',23,'2202','AGUARICO','CANTON','ACTIVO'),
    (242,'2019-03-04 00:00:00', '2019-03-04 00:00:00',23,'2203','LA JOYA DE LOS SACHAS','CANTON','ACTIVO'),
    (243,'2019-03-04 00:00:00', '2019-03-04 00:00:00',23,'2204','LORETO','CANTON','ACTIVO'),
    (244,'2019-03-04 00:00:00', '2019-03-04 00:00:00',24,'2301','SANTO DOMINGO','CANTON','ACTIVO'),
    (245,'2019-03-04 00:00:00', '2019-03-04 00:00:00',25,'2401','SANTA ELENA','CANTON','ACTIVO'),
    (246,'2019-03-04 00:00:00', '2019-03-04 00:00:00',25,'2402','LA LIBERTAD','CANTON','ACTIVO'),
    (247,'2019-03-04 00:00:00', '2019-03-04 00:00:00',25,'2403','SALINAS','CANTON','ACTIVO'),
    (248,'2019-03-04 00:00:00', '2019-03-04 00:00:00',26,'9001','LAS GOLONDRINAS','CANTON','ACTIVO'),
    (249,'2019-03-04 00:00:00', '2019-03-04 00:00:00',27,'9002','MANGA DEL CURA','CANTON','ACTIVO'),
    (250,'2019-03-04 00:00:00', '2019-03-04 00:00:00',28,'9003','EL PIEDRERO','CANTON','ACTIVO'),
    (251,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'1','AFGANISTÁN','PAIS','ACTIVO'),
(252,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'2','ALBANIA','PAIS','ACTIVO'),
(253,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'3','ALEMANIA','PAIS','ACTIVO'),
(254,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'4','ANDORRA','PAIS','ACTIVO'),
(255,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'5','ANGOLA','PAIS','ACTIVO'),
(256,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'6','ANGUILA','PAIS','ACTIVO'),
(257,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'7','ANTIGUA Y BARBUDA','PAIS','ACTIVO'),
(258,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'8','ARABIA SAUDITA','PAIS','ACTIVO'),
(259,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'9','ARGELIA','PAIS','ACTIVO'),
(260,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'10','ARGENTINA','PAIS','ACTIVO'),
(261,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'11','ARMENIA','PAIS','ACTIVO'),
(262,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'12','ARUBA','PAIS','ACTIVO'),
(263,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'13','AUSTRALIA','PAIS','ACTIVO'),
(264,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'14','AUSTRIA','PAIS','ACTIVO'),
(265,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'15','AZERBAIYÁN','PAIS','ACTIVO'),
(266,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'16','BAHAMAS','PAIS','ACTIVO'),
(267,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'17','BAHREIN','PAIS','ACTIVO'),
(268,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'18','BANGLADESH','PAIS','ACTIVO'),
(269,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'19','BARBADOS','PAIS','ACTIVO'),
(270,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'20','BÉLGICA','PAIS','ACTIVO'),
(271,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'21','BELICE','PAIS','ACTIVO'),
(272,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'22','BENIN','PAIS','ACTIVO'),
(273,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'23','BERMUDAS','PAIS','ACTIVO'),
(274,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'24','BIELORRUSIA','PAIS','ACTIVO'),
(275,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'25','BOLIVIA','PAIS','ACTIVO'),
(276,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'26','BONAIRE, SAN EUSTAQUIO Y SABA','PAIS','ACTIVO'),
(277,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'27','BOSNIA Y HERZEGOVINA','PAIS','ACTIVO'),
(278,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'28','BOTSWANA','PAIS','ACTIVO'),
(279,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'29','BRASIL','PAIS','ACTIVO'),
(280,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'30','BRUNEI DARUSSALAM','PAIS','ACTIVO'),
(281,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'31','BULGARIA','PAIS','ACTIVO'),
(282,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'32','BURKINA FASO','PAIS','ACTIVO'),
(283,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'33','BURUNDI','PAIS','ACTIVO'),
(284,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'34','BUTÁN','PAIS','ACTIVO'),
(285,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'35','CABO VERDE','PAIS','ACTIVO'),
(286,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'36','CAMBOYA','PAIS','ACTIVO'),
(287,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'37','CAMERÚN','PAIS','ACTIVO'),
(288,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'38','CANADA','PAIS','ACTIVO'),
(289,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'39','CHAD','PAIS','ACTIVO'),
(290,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'40','CHILE','PAIS','ACTIVO'),
(291,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'41','CHINA','PAIS','ACTIVO'),
(292,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'42','CHIPRE','PAIS','ACTIVO'),
(293,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'43','COLOMBIA','PAIS','ACTIVO'),
(294,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'44','COMORAS','PAIS','ACTIVO'),
(295,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'45','CONGO','PAIS','ACTIVO'),
(296,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'46','COREA DEL NORTE','PAIS','ACTIVO'),
(297,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'47','COREA DEL SUR','PAIS','ACTIVO'),
(298,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'48','COSTA DE MARﬁL','PAIS','ACTIVO'),
(299,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'49','COSTA RICA','PAIS','ACTIVO'),
(300,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'50','CROACIA','PAIS','ACTIVO'),
(301,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'51','CUBA','PAIS','ACTIVO'),
(302,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'52','CURAÇAO','PAIS','ACTIVO'),
(303,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'53','DINAMARCA','PAIS','ACTIVO'),
(304,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'54','DJIBOUTI','PAIS','ACTIVO'),
(305,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'55','DOMINICA','PAIS','ACTIVO'),
(306,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'57','EGIPTO','PAIS','ACTIVO'),
(307,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'58','EL SALVADOR','PAIS','ACTIVO'),
(308,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'59','EL VATICANO','PAIS','ACTIVO'),
(309,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'60','EMIRATOS ÁRABES UNIDOS','PAIS','ACTIVO'),
(310,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'61','ERITREA','PAIS','ACTIVO'),
(311,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'62','ESLOVAQUIA','PAIS','ACTIVO'),
(312,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'63','ESLOVENIA','PAIS','ACTIVO'),
(313,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'64','ESPAÑA','PAIS','ACTIVO'),
(314,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'65','ESTADO DE PALESTINA','PAIS','ACTIVO'),
(315,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'66','ESTADOS UNIDOS DE AMÉRICA','PAIS','ACTIVO'),
(316,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'67','ESTONIA','PAIS','ACTIVO'),
(317,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'68','ETIOPÍA','PAIS','ACTIVO'),
(318,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'69','FIYI','PAIS','ACTIVO'),
(319,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'70','FILIPINAS','PAIS','ACTIVO'),
(320,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'71','FINLANDIA','PAIS','ACTIVO'),
(321,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'72','FRANCIA','PAIS','ACTIVO'),
(322,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'73','GABÓN','PAIS','ACTIVO'),
(323,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'74','GAMBIA','PAIS','ACTIVO'),
(324,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'75','GEORGIA','PAIS','ACTIVO'),
(325,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'76','GHANA','PAIS','ACTIVO'),
(326,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'77','GIBRALTAR','PAIS','ACTIVO'),
(327,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'78','GRANADA','PAIS','ACTIVO'),
(328,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'79','GRECIA','PAIS','ACTIVO'),
(329,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'80','GROENLANDIA','PAIS','ACTIVO'),
(330,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'81','GUADALUPE','PAIS','ACTIVO'),
(331,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'82','GUAM','PAIS','ACTIVO'),
(332,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'83','GUATEMALA','PAIS','ACTIVO'),
(333,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'84','GUAYANA FRANCESA','PAIS','ACTIVO'),
(334,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'85','GUERNSEY','PAIS','ACTIVO'),
(335,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'86','GUINEA','PAIS','ACTIVO'),
(336,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'87','GUINEA ECUATORIAL','PAIS','ACTIVO'),
(337,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'88','GUINEA-BISSAU','PAIS','ACTIVO'),
(338,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'89','GUYANA','PAIS','ACTIVO'),
(339,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'90','HAITÍ','PAIS','ACTIVO'),
(340,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'91','HONDURAS','PAIS','ACTIVO'),
(341,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'92','HONG KONG','PAIS','ACTIVO'),
(342,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'93','HUNGRÍA','PAIS','ACTIVO'),
(343,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'94','INDIA','PAIS','ACTIVO'),
(344,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'95','INDONESIA','PAIS','ACTIVO'),
(345,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'96','IRAK','PAIS','ACTIVO'),
(346,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'97','IRÁN','PAIS','ACTIVO'),
(347,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'98','IRLANDA','PAIS','ACTIVO'),
(348,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'99','ISLA DE MAN','PAIS','ACTIVO'),
(349,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'100','ISLA NORFOLK','PAIS','ACTIVO'),
(350,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'101','ISLANDIA','PAIS','ACTIVO'),
(351,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'102','ISLAS ÅLAND','PAIS','ACTIVO'),
(352,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'103','ISLAS CAIMÁN','PAIS','ACTIVO'),
(353,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'104','ISLAS COOK','PAIS','ACTIVO'),
(354,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'106','ISLAS FEROE','PAIS','ACTIVO'),
(355,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'107','ISLAS MALVINAS (FALKLAND)','PAIS','ACTIVO'),
(356,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'108','ISLAS MARIANAS DEL NORTE','PAIS','ACTIVO'),
(357,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'109','ISLAS MARSHALL','PAIS','ACTIVO'),
(358,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'110','ISLAS SALOMÓN','PAIS','ACTIVO'),
(359,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'111','ISLAS TURCAS Y CAICOS','PAIS','ACTIVO'),
(360,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'112','ISLAS VÍRGENES AMERICANAS','PAIS','ACTIVO'),
(361,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'113','ISLAS VÍRGENES BRITÁNICAS','PAIS','ACTIVO'),
(362,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'114','ISLAS WALLIS Y FUTUNA','PAIS','ACTIVO'),
(363,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'115','ISRAEL','PAIS','ACTIVO'),
(364,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'116','ITALIA','PAIS','ACTIVO'),
(365,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'117','JAMAICA','PAIS','ACTIVO'),
(366,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'118','JAPÓN','PAIS','ACTIVO'),
(367,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'119','JERSEY','PAIS','ACTIVO'),
(368,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'120','JORDANIA','PAIS','ACTIVO'),
(369,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'121','KAZAJSTÁN','PAIS','ACTIVO'),
(370,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'122','KENYA','PAIS','ACTIVO'),
(371,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'123','KIRGUISTÁN','PAIS','ACTIVO'),
(372,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'124','KIRIBATI','PAIS','ACTIVO'),
(373,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'125','KUWAIT','PAIS','ACTIVO'),
(374,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'126','LA EX REPÚBLICA YUGOSLAVA DE MACEDONIA','PAIS','ACTIVO'),
(375,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'127','LESOTO','PAIS','ACTIVO'),
(376,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'128','LETONIA','PAIS','ACTIVO'),
(377,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'129','LÍBANO','PAIS','ACTIVO'),
(378,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'130','LIBERIA','PAIS','ACTIVO'),
(379,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'131','LIBIA','PAIS','ACTIVO'),
(380,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'132','LIECHTENSTEIN','PAIS','ACTIVO'),
(381,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'133','LITUANIA','PAIS','ACTIVO'),
(382,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'134','LUXEMBURGO','PAIS','ACTIVO'),
(383,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'135','MACAO','PAIS','ACTIVO'),
(384,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'136','MADAGASCAR','PAIS','ACTIVO'),
(385,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'137','MALASIA','PAIS','ACTIVO'),
(386,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'138','MALAUI','PAIS','ACTIVO'),
(387,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'139','MALDIVAS','PAIS','ACTIVO'),
(388,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'140','MALÍ','PAIS','ACTIVO'),
(389,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'141','MALTA','PAIS','ACTIVO'),
(390,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'142','MARRUECOS','PAIS','ACTIVO'),
(391,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'143','MARTINICA','PAIS','ACTIVO'),
(392,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'144','MAURICIO','PAIS','ACTIVO'),
(393,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'145','MAURITANIA','PAIS','ACTIVO'),
(394,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'146','MAYOTTE','PAIS','ACTIVO'),
(395,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'147','MÉXICO','PAIS','ACTIVO'),
(396,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'148','MICRONESIA','PAIS','ACTIVO'),
(397,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'149','MÓNACO','PAIS','ACTIVO'),
(398,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'150','MONGOLIA','PAIS','ACTIVO'),
(399,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'151','MONTENEGRO','PAIS','ACTIVO'),
(400,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'152','MONTSERRAT','PAIS','ACTIVO'),
(401,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'153','MOZAMBIQUE','PAIS','ACTIVO'),
(402,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'154','MYANMAR','PAIS','ACTIVO'),
(403,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'155','NAMIBIA','PAIS','ACTIVO'),
(404,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'156','NAURU','PAIS','ACTIVO'),
(405,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'157','NEPAL','PAIS','ACTIVO'),
(406,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'158','NICARAGUA','PAIS','ACTIVO'),
(407,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'159','NÍGER','PAIS','ACTIVO'),
(408,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'160','NIGERIA','PAIS','ACTIVO'),
(409,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'161','NIUE','PAIS','ACTIVO'),
(410,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'162','NORUEGA','PAIS','ACTIVO'),
(411,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'163','NUEVA CALEDONIA','PAIS','ACTIVO'),
(412,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'164','NUEVA ZELANDA','PAIS','ACTIVO'),
(413,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'165','OMÁN','PAIS','ACTIVO'),
(414,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'166','PAÍSES BAJOS','PAIS','ACTIVO'),
(415,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'167','PAKISTÁN','PAIS','ACTIVO'),
(416,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'168','PALAU','PAIS','ACTIVO'),
(417,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'169','PANAMÁ','PAIS','ACTIVO'),
(418,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'170','PAPÚA NUEVA GUINEA','PAIS','ACTIVO'),
(419,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'171','PARAGUAY','PAIS','ACTIVO'),
(420,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'172','PERÚ','PAIS','ACTIVO'),
(421,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'173','PITCAIRN','PAIS','ACTIVO'),
(422,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'174','POLINESIA FRANCÉS','PAIS','ACTIVO'),
(423,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'175','POLONIA','PAIS','ACTIVO'),
(424,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'176','PORTUGAL','PAIS','ACTIVO'),
(425,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'177','PUERTO RICO','PAIS','ACTIVO'),
(426,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'178','QATAR','PAIS','ACTIVO'),
(427,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'179','REINO UNIDO DE GRAN BRETAÑA E IRLANDA DEL NORTE','PAIS','ACTIVO'),
(428,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'180','REPÚBLICA ÁRABE SIRIA','PAIS','ACTIVO'),
(429,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'181','REPÚBLICA CENTROAFRICANA','PAIS','ACTIVO'),
(430,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'182','REPÚBLICA CHECA','PAIS','ACTIVO'),
(431,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'183','REPÚBLICA DE MOLDAVIA','PAIS','ACTIVO'),
(432,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'184','REPÚBLICA DEMOCRÁTICA DEL CONGO','PAIS','ACTIVO'),
(433,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'185','REPÚBLICA DEMOCRÁTICA POPULAR LAO','PAIS','ACTIVO'),
(434,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'186','REPÚBLICA DOMINICANA','PAIS','ACTIVO'),
(435,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'187','REPÚBLICA UNIDA DE TANZANIA','PAIS','ACTIVO'),
(436,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'188','RÉUNION','PAIS','ACTIVO'),
(437,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'189','RUMANIA','PAIS','ACTIVO'),
(438,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'190','RUSIA','PAIS','ACTIVO'),
(439,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'191','RWANDA','PAIS','ACTIVO'),
(440,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'192','SÁHARA OCCIDENTAL','PAIS','ACTIVO'),
(441,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'193','SAINT-BARTHÉLEMY','PAIS','ACTIVO'),
(442,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'194','SAINT-MARTIN','PAIS','ACTIVO'),
(443,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'195','SAMOA','PAIS','ACTIVO'),
(444,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'196','SAMOA AMERICANA','PAIS','ACTIVO'),
(445,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'197','SAN CRISTÓBAL Y NIEVES','PAIS','ACTIVO'),
(446,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'198','SAN MARINO','PAIS','ACTIVO'),
(447,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'199','SAN PEDRO Y MIQUELÓN','PAIS','ACTIVO'),
(448,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'200','SAN VICENTE Y LAS GRANADINAS','PAIS','ACTIVO'),
(449,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'201','SANTA ELENA','PAIS','ACTIVO'),
(450,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'202','SANTA LUCÍA','PAIS','ACTIVO'),
(451,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'203','SANTO TOMÉ Y PRÍNCIPE','PAIS','ACTIVO'),
(452,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'205','SENEGAL','PAIS','ACTIVO'),
(453,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'206','SERBIA','PAIS','ACTIVO'),
(454,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'207','SEYCHELLES','PAIS','ACTIVO'),
(455,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'208','SIERRA LEONA','PAIS','ACTIVO'),
(456,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'209','SINGAPUR','PAIS','ACTIVO'),
(457,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'210','SINT MAARTEN','PAIS','ACTIVO'),
(458,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'211','SOMALIA','PAIS','ACTIVO'),
(459,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'212','SRI LANKA','PAIS','ACTIVO'),
(460,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'213','SUDÁFRICA','PAIS','ACTIVO'),
(461,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'214','SUDÁN','PAIS','ACTIVO'),
(462,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'215','SUDÁN DEL SUR','PAIS','ACTIVO'),
(463,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'216','SUECIA','PAIS','ACTIVO'),
(464,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'217','SUIZA','PAIS','ACTIVO'),
(465,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'218','SURINAME','PAIS','ACTIVO'),
(466,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'219','SVALBARD Y JAN MAYEN','PAIS','ACTIVO'),
(467,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'220','SWAZILANDIA','PAIS','ACTIVO'),
(468,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'221','TAILANDIA','PAIS','ACTIVO'),
(469,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'222','TAYIKISTÁN','PAIS','ACTIVO'),
(470,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'223','TIMOR-LESTE','PAIS','ACTIVO'),
(471,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'224','TOGO','PAIS','ACTIVO'),
(472,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'225','TOKELAU','PAIS','ACTIVO'),
(473,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'226','TONGA','PAIS','ACTIVO'),
(474,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'227','TRINIDAD Y TOBAGO','PAIS','ACTIVO'),
(475,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'228','TÚNEZ','PAIS','ACTIVO'),
(476,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'229','TURKMENISTÁN','PAIS','ACTIVO'),
(477,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'230','TURQUÍA','PAIS','ACTIVO'),
(478,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'231','TUVALU','PAIS','ACTIVO'),
(479,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'232','UCRANIA','PAIS','ACTIVO'),
(480,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'233','UGANDA','PAIS','ACTIVO'),
(481,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'234','URUGUAY','PAIS','ACTIVO'),
(482,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'235','UZBEKISTÁN','PAIS','ACTIVO'),
(483,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'236','VANUATU','PAIS','ACTIVO'),
(484,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'237','VENEZUELA','PAIS','ACTIVO'),
(485,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'238','VIET NAM','PAIS','ACTIVO'),
(486,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'239','YEMEN','PAIS','ACTIVO'),
(487,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'240','ZAMBIA','PAIS','ACTIVO'),
(488,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'241','ZIMBABWE','PAIS','ACTIVO'),
(489,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'242','ANTÁRTIDA','PAIS','ACTIVO'),
(490,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'243','ISLA BOUVET','PAIS','ACTIVO'),
(491,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'244','TERRITORIO BRITÁNICO DE LA OCÉANO ÍNDICO','PAIS','ACTIVO'),
(492,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'245','TAIWÁN','PAIS','ACTIVO'),
(493,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'246','ISLA DE NAVIDAD','PAIS','ACTIVO'),
(494,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'247','ISLAS COCOS','PAIS','ACTIVO'),
(495,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'248','GEORGIA DEL SUR Y LAS ISLAS SANDWICH DEL SUR','PAIS','ACTIVO'),
(496,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'249','TERRITORIOS AUSTRALES FRANCESES','PAIS','ACTIVO'),
(497,'2019-03-04 00:00:00', '2019-03-04 00:00:00',null,'999','NO REGISTRA','PAIS','ACTIVO');

INSERT INTO notificacion_correos(nombre, apellido, correo, tipo, estado) VALUES ('Mauricio','Tamayo','ctamayo@yavirac.edu.ec','MATRICULAS','ACTIVO');

INSERT INTO roles(descripcion, rol)
	VALUES ('COORDINADOR',1),('ESTUDIANTE',2),('SECRETARIA',3),('VICERRECTOR',4);

	INSERT INTO users(role_id, name, user_name, email, password)
	VALUES
	(4,'AREVALO HECTOR','1716346802','harevalo@yavirac.edu.ec','$2y$10$LU2KIo88ami4hkCg41gWbumLvPle0q3Uu/7jdki8KxNB0mpNfyr22'),
	(4,'CARVAJAL ANDRES','1716201098','acarvajal@yavirac.edu.ec','$2y$10$2TdClMuMTyd6cl1qlKnlCej9iiPNXFsJGWvfaRl99p1fBhwzdRsYC'),
	(1,'CHILIG	FREDDY','1723171482','fchilig@yavirac.edu.ec','$2y$10$talsR33YBzolUA8o.JsjtO4Row54fVknIqOh5oAoTiO/sYF8iM/Q.'),
	(1,'GUACHO MARIA','1715622534','mguacho@yavirac.edu.ec','$2y$10$OPZv8I1of.lashd2TXjUmeuPWlWfWbNrsQGEUMeO7TRTeJc8/5uHO'),
	(1,'SAENZ PABLO','1716848443','psaenz@yavirac.edu.ec','$2y$10$7vE28gXWiVxUT0U.b.j5Iuh2EdeaF8NmuHJKGTf5hsaBSINlEP4g2'),
	(1,'RUIZ OLIVIA','1715883813','oruiz@yavirac.edu.ec','$2y$10$kvYXglipBqjQlqGpr3/VzOyGemwTkmNeypfmjEMagxpNxsVVE5BK6'),
	(1,'HUERTA	EDGAR','1705559555','ehuerta@yavirac.edu.ec','$2y$10$w/E/9PjQGPFwn.TI98dELeSkLo/rueBY3oDq69OHqjuAB5VD5PJAy'),
	(3,'GORDON ALEXANDRA','1711077410','agordon@yavirac.edu.ec','$2y$10$rNFaY5TkNK0ykUr.Nmy6xeg.8GF4izZSyaakRk7YHLQBCZ3rXchYe'),;


	INSERT INTO carrera_user(user_id, carrera_id)
	VALUES
	(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),
	(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),
	(3,7),(3,8),(3,9),
	(4,4),(4,11),
	(5,5),
	(6,1),(4,10),
	(7,2),(4,6),
	(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11);