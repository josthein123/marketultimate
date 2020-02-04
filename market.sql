/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : market

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-02-03 19:55:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acercades
-- ----------------------------
DROP TABLE IF EXISTS `acercades`;
CREATE TABLE `acercades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nosotros` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mision` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vision` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of acercades
-- ----------------------------
INSERT INTO `acercades` VALUES ('2', 'empresa fundada en el 2011, con mas de 6 años ofreciendo servicios de consultoría y asesoramiento legal a diversas empresas del rubro, en el especial al rubro construcción.\r\n\r\nParconsil es una empresa especializada en sistemas de gestión con lineamientos de responsabilidad social empresarial, cuyo objetivo central es disminuir los riesgos dentro de las empresas ya sea por contingencias legales internas como las contingencias generadas por su relación comercial con proveedores y contratistas. No solo lo asesoramos, sino que lo acompañamos en el manejo de sus operaciones tanto en el ámbito legal como logístico, nos encargamos de evitar las contingencias legales y laborales, tanto dentro de su empresa como en la de sus contratistas.', 'La misión es lo que la organización desea lograr en un periodo específico de tiempo. Si el propósito es el Por qué haces las cosas, la misión se trata del Qué cosas haces. Una buena misión debe de describir que es lo que hace la empresa y lo que no. Tanto el presente como en el futuro, debe de proveer un enfoque a la dirección y sus colaboradores.', 'La visión de una empresa describe sus planes, el mundo, sus clientes y si misma. Es decir, indica cómo le gustaría que el mundo fuese en algunos años. Esto incluye una idea de que cambios quieren ver en el mundo. También como se imaginan que la vida de sus clientes mejora. Y por último describir que tipo de organización les gustaría ser, aunque esto es lo menos importante de la visión.', '2019-10-29 03:31:26', '2019-10-30 17:06:45');

-- ----------------------------
-- Table structure for carritos
-- ----------------------------
DROP TABLE IF EXISTS `carritos`;
CREATE TABLE `carritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carritos_id_user_foreign` (`id_user`),
  KEY `carritos_id_prod_foreign` (`id_prod`),
  CONSTRAINT `carritos_id_prod_foreign` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`),
  CONSTRAINT `carritos_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of carritos
-- ----------------------------
INSERT INTO `carritos` VALUES ('1', '1', '1', null, '1', null, null);

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('1', 'Hombres', null, '1', '2019-10-30 16:28:40');
INSERT INTO `categorias` VALUES ('2', 'Mujeres', null, '1', '2019-10-29 18:45:31');

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pais` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_departamento` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES ('1', '51', '01', 'AMAZONAS', '1');
INSERT INTO `departamentos` VALUES ('2', '51', '02', 'ANCASH', '1');
INSERT INTO `departamentos` VALUES ('3', '51', '03', 'APURIMAC', '1');
INSERT INTO `departamentos` VALUES ('4', '51', '04', 'AREQUIPA', '1');
INSERT INTO `departamentos` VALUES ('5', '51', '05', 'AYACUCHO', '1');
INSERT INTO `departamentos` VALUES ('6', '51', '06', 'CAJAMARCA', '1');
INSERT INTO `departamentos` VALUES ('7', '51', '07', 'CALLAO', '1');
INSERT INTO `departamentos` VALUES ('8', '51', '08', 'CUSCO', '1');
INSERT INTO `departamentos` VALUES ('9', '51', '09', 'HUANCAVELICA', '1');
INSERT INTO `departamentos` VALUES ('10', '51', '10', 'HUANUCO', '1');
INSERT INTO `departamentos` VALUES ('11', '51', '11', 'ICA', '1');
INSERT INTO `departamentos` VALUES ('12', '51', '12', 'JUNIN', '1');
INSERT INTO `departamentos` VALUES ('13', '51', '13', 'LA LIBERTAD', '1');
INSERT INTO `departamentos` VALUES ('14', '51', '14', 'LAMBAYEQUE', '1');
INSERT INTO `departamentos` VALUES ('15', '51', '15', 'LIMA', '1');
INSERT INTO `departamentos` VALUES ('16', '51', '16', 'LORETO', '1');
INSERT INTO `departamentos` VALUES ('17', '51', '17', 'MADRE DE DIOS', '1');
INSERT INTO `departamentos` VALUES ('18', '51', '18', 'MOQUEGUA', '1');
INSERT INTO `departamentos` VALUES ('19', '51', '19', 'PASCO', '1');
INSERT INTO `departamentos` VALUES ('20', '51', '20', 'PIURA', '1');
INSERT INTO `departamentos` VALUES ('21', '51', '21', 'PUNO', '1');
INSERT INTO `departamentos` VALUES ('22', '51', '22', 'SAN MARTIN', '1');
INSERT INTO `departamentos` VALUES ('23', '51', '23', 'TACNA', '1');
INSERT INTO `departamentos` VALUES ('24', '51', '24', 'TUMBES', '1');
INSERT INTO `departamentos` VALUES ('25', '51', '25', 'UCAYALI', '1');

-- ----------------------------
-- Table structure for distritos
-- ----------------------------
DROP TABLE IF EXISTS `distritos`;
CREATE TABLE `distritos` (
  `id_distrito` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pais` int(11) NOT NULL,
  `cod_departamento` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `cod_provincia` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `cod_distrito` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `distrito` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_distrito`),
  UNIQUE KEY `cod_distrito` (`cod_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=1823 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distritos
-- ----------------------------
INSERT INTO `distritos` VALUES ('1', '51', '01', '0101', '010101', 'CHACHAPOYAS', '1');
INSERT INTO `distritos` VALUES ('2', '51', '01', '0101', '010102', 'ASUNCION', '1');
INSERT INTO `distritos` VALUES ('3', '51', '01', '0101', '010103', 'BALSAS', '1');
INSERT INTO `distritos` VALUES ('4', '51', '01', '0101', '010104', 'CHETO', '1');
INSERT INTO `distritos` VALUES ('5', '51', '01', '0101', '010105', 'CHILIQUIN', '1');
INSERT INTO `distritos` VALUES ('6', '51', '01', '0101', '010106', 'CHUQUIBAMBA', '1');
INSERT INTO `distritos` VALUES ('7', '51', '01', '0101', '010107', 'GRANADA', '1');
INSERT INTO `distritos` VALUES ('8', '51', '01', '0101', '010108', 'HUANCAS', '1');
INSERT INTO `distritos` VALUES ('9', '51', '01', '0101', '010109', 'LA JALCA', '1');
INSERT INTO `distritos` VALUES ('10', '51', '01', '0101', '010110', 'LEIMEBAMBA', '1');
INSERT INTO `distritos` VALUES ('11', '51', '01', '0101', '010111', 'LEVANTO', '1');
INSERT INTO `distritos` VALUES ('12', '51', '01', '0101', '010112', 'MAGDALENA', '1');
INSERT INTO `distritos` VALUES ('13', '51', '01', '0101', '010113', 'MARISCAL CASTILLA', '1');
INSERT INTO `distritos` VALUES ('14', '51', '01', '0101', '010114', 'MOLINOPAMPA', '1');
INSERT INTO `distritos` VALUES ('15', '51', '01', '0101', '010115', 'MONTEVIDEO', '1');
INSERT INTO `distritos` VALUES ('16', '51', '01', '0101', '010116', 'OLLEROS', '1');
INSERT INTO `distritos` VALUES ('17', '51', '01', '0101', '010117', 'QUINJALCA', '1');
INSERT INTO `distritos` VALUES ('18', '51', '01', '0101', '010118', 'SAN FRANCISCO DE DAGUAS', '1');
INSERT INTO `distritos` VALUES ('19', '51', '01', '0101', '010119', 'SAN ISIDRO DE MAINO', '1');
INSERT INTO `distritos` VALUES ('20', '51', '01', '0101', '010120', 'SOLOCO', '1');
INSERT INTO `distritos` VALUES ('21', '51', '01', '0101', '010121', 'SONCHE', '1');
INSERT INTO `distritos` VALUES ('22', '51', '01', '0102', '010201', 'BAGUA', '1');
INSERT INTO `distritos` VALUES ('23', '51', '01', '0102', '010202', 'LA PECA', '1');
INSERT INTO `distritos` VALUES ('24', '51', '01', '0102', '010203', 'ARAMANGO', '1');
INSERT INTO `distritos` VALUES ('25', '51', '01', '0102', '010204', 'COPALLIN', '1');
INSERT INTO `distritos` VALUES ('26', '51', '01', '0102', '010205', 'EL PARCO', '1');
INSERT INTO `distritos` VALUES ('27', '51', '01', '0102', '010206', 'IMAZA', '1');
INSERT INTO `distritos` VALUES ('28', '51', '01', '0103', '010301', 'JUMBILLA', '1');
INSERT INTO `distritos` VALUES ('29', '51', '01', '0103', '010302', 'CHISQUILLA', '1');
INSERT INTO `distritos` VALUES ('30', '51', '01', '0103', '010303', 'CHURUJA', '1');
INSERT INTO `distritos` VALUES ('31', '51', '01', '0103', '010304', 'COROSHA', '1');
INSERT INTO `distritos` VALUES ('32', '51', '01', '0103', '010305', 'CUISPES', '1');
INSERT INTO `distritos` VALUES ('33', '51', '01', '0103', '010306', 'FLORIDA', '1');
INSERT INTO `distritos` VALUES ('34', '51', '01', '0103', '010307', 'JAZAN', '1');
INSERT INTO `distritos` VALUES ('35', '51', '01', '0103', '010308', 'RECTA', '1');
INSERT INTO `distritos` VALUES ('36', '51', '01', '0103', '010309', 'SAN CARLOS', '1');
INSERT INTO `distritos` VALUES ('37', '51', '01', '0103', '010310', 'SHIPASBAMBA', '1');
INSERT INTO `distritos` VALUES ('38', '51', '01', '0103', '010311', 'VALERA', '1');
INSERT INTO `distritos` VALUES ('39', '51', '01', '0103', '010312', 'YAMBRASBAMBA', '1');
INSERT INTO `distritos` VALUES ('40', '51', '01', '0104', '010401', 'NIEVA', '1');
INSERT INTO `distritos` VALUES ('41', '51', '01', '0104', '010402', 'EL CENEPA', '1');
INSERT INTO `distritos` VALUES ('42', '51', '01', '0104', '010403', 'RIO SANTIAGO', '1');
INSERT INTO `distritos` VALUES ('43', '51', '01', '0105', '010501', 'LAMUD', '1');
INSERT INTO `distritos` VALUES ('44', '51', '01', '0105', '010502', 'CAMPORREDONDO', '1');
INSERT INTO `distritos` VALUES ('45', '51', '01', '0105', '010503', 'COCABAMBA', '1');
INSERT INTO `distritos` VALUES ('46', '51', '01', '0105', '010504', 'COLCAMAR', '1');
INSERT INTO `distritos` VALUES ('47', '51', '01', '0105', '010505', 'CONILA', '1');
INSERT INTO `distritos` VALUES ('48', '51', '01', '0105', '010506', 'INGUILPATA', '1');
INSERT INTO `distritos` VALUES ('49', '51', '01', '0105', '010507', 'LONGUITA', '1');
INSERT INTO `distritos` VALUES ('50', '51', '01', '0105', '010508', 'LONYA CHICO', '1');
INSERT INTO `distritos` VALUES ('51', '51', '01', '0105', '010509', 'LUYA', '1');
INSERT INTO `distritos` VALUES ('52', '51', '01', '0105', '010510', 'LUYA VIEJO', '1');
INSERT INTO `distritos` VALUES ('53', '51', '01', '0105', '010511', 'MARIA', '1');
INSERT INTO `distritos` VALUES ('54', '51', '01', '0105', '010512', 'OCALLI', '1');
INSERT INTO `distritos` VALUES ('55', '51', '01', '0105', '010513', 'OCUMAL', '1');
INSERT INTO `distritos` VALUES ('56', '51', '01', '0105', '010514', 'PISUQUIA', '1');
INSERT INTO `distritos` VALUES ('57', '51', '01', '0105', '010515', 'PROVIDENCIA', '1');
INSERT INTO `distritos` VALUES ('58', '51', '01', '0105', '010516', 'SAN CRISTOBAL', '1');
INSERT INTO `distritos` VALUES ('59', '51', '01', '0105', '010517', 'SAN FRANCISCO DEL YESO', '1');
INSERT INTO `distritos` VALUES ('60', '51', '01', '0105', '010518', 'SAN JERONIMO', '1');
INSERT INTO `distritos` VALUES ('61', '51', '01', '0105', '010519', 'SAN JUAN DE LOPECANCHA', '1');
INSERT INTO `distritos` VALUES ('62', '51', '01', '0105', '010520', 'SANTA CATALINA', '1');
INSERT INTO `distritos` VALUES ('63', '51', '01', '0105', '010521', 'SANTO TOMAS', '1');
INSERT INTO `distritos` VALUES ('64', '51', '01', '0105', '010522', 'TINGO', '1');
INSERT INTO `distritos` VALUES ('65', '51', '01', '0105', '010523', 'TRITA', '1');
INSERT INTO `distritos` VALUES ('66', '51', '01', '0106', '010601', 'SAN NICOLAS', '1');
INSERT INTO `distritos` VALUES ('67', '51', '01', '0106', '010602', 'CHIRIMOTO', '1');
INSERT INTO `distritos` VALUES ('68', '51', '01', '0106', '010603', 'COCHAMAL', '1');
INSERT INTO `distritos` VALUES ('69', '51', '01', '0106', '010604', 'HUAMBO', '1');
INSERT INTO `distritos` VALUES ('70', '51', '01', '0106', '010605', 'LIMABAMBA', '1');
INSERT INTO `distritos` VALUES ('71', '51', '01', '0106', '010606', 'LONGAR', '1');
INSERT INTO `distritos` VALUES ('72', '51', '01', '0106', '010607', 'MARISCAL BENAVIDES', '1');
INSERT INTO `distritos` VALUES ('73', '51', '01', '0106', '010608', 'MILPUC', '1');
INSERT INTO `distritos` VALUES ('74', '51', '01', '0106', '010609', 'OMIA', '1');
INSERT INTO `distritos` VALUES ('75', '51', '01', '0106', '010610', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('76', '51', '01', '0106', '010611', 'TOTORA', '1');
INSERT INTO `distritos` VALUES ('77', '51', '01', '0106', '010612', 'VISTA ALEGRE', '1');
INSERT INTO `distritos` VALUES ('78', '51', '01', '0107', '010701', 'BAGUA GRANDE', '1');
INSERT INTO `distritos` VALUES ('79', '51', '01', '0107', '010702', 'CAJARURO', '1');
INSERT INTO `distritos` VALUES ('80', '51', '01', '0107', '010703', 'CUMBA', '1');
INSERT INTO `distritos` VALUES ('81', '51', '01', '0107', '010704', 'EL MILAGRO', '1');
INSERT INTO `distritos` VALUES ('82', '51', '01', '0107', '010705', 'JAMALCA', '1');
INSERT INTO `distritos` VALUES ('83', '51', '01', '0107', '010706', 'LONYA GRANDE', '1');
INSERT INTO `distritos` VALUES ('84', '51', '01', '0107', '010707', 'YAMON', '1');
INSERT INTO `distritos` VALUES ('85', '51', '02', '0201', '020101', 'HUARAZ', '1');
INSERT INTO `distritos` VALUES ('86', '51', '02', '0201', '020102', 'COCHABAMBA', '1');
INSERT INTO `distritos` VALUES ('87', '51', '02', '0201', '020103', 'COLCABAMBA', '1');
INSERT INTO `distritos` VALUES ('88', '51', '02', '0201', '020104', 'HUANCHAY', '1');
INSERT INTO `distritos` VALUES ('89', '51', '02', '0201', '020105', 'INDEPENDENCIA', '1');
INSERT INTO `distritos` VALUES ('90', '51', '02', '0201', '020106', 'JANGAS', '1');
INSERT INTO `distritos` VALUES ('91', '51', '02', '0201', '020107', 'LA LIBERTAD', '1');
INSERT INTO `distritos` VALUES ('92', '51', '02', '0201', '020108', 'OLLEROS', '1');
INSERT INTO `distritos` VALUES ('93', '51', '02', '0201', '020109', 'PAMPAS GRANDE', '1');
INSERT INTO `distritos` VALUES ('94', '51', '02', '0201', '020110', 'PARIACOTO', '1');
INSERT INTO `distritos` VALUES ('95', '51', '02', '0201', '020111', 'PIRA', '1');
INSERT INTO `distritos` VALUES ('96', '51', '02', '0201', '020112', 'TARICA', '1');
INSERT INTO `distritos` VALUES ('97', '51', '02', '0202', '020201', 'AIJA', '1');
INSERT INTO `distritos` VALUES ('98', '51', '02', '0202', '020202', 'CORIS', '1');
INSERT INTO `distritos` VALUES ('99', '51', '02', '0202', '020203', 'HUACLLAN', '1');
INSERT INTO `distritos` VALUES ('100', '51', '02', '0202', '020204', 'LA MERCED', '1');
INSERT INTO `distritos` VALUES ('101', '51', '02', '0202', '020205', 'SUCCHA', '1');
INSERT INTO `distritos` VALUES ('102', '51', '02', '0203', '020301', 'LLAMELLIN', '1');
INSERT INTO `distritos` VALUES ('103', '51', '02', '0203', '020302', 'ACZO', '1');
INSERT INTO `distritos` VALUES ('104', '51', '02', '0203', '020303', 'CHACCHO', '1');
INSERT INTO `distritos` VALUES ('105', '51', '02', '0203', '020304', 'CHINGAS', '1');
INSERT INTO `distritos` VALUES ('106', '51', '02', '0203', '020305', 'MIRGAS', '1');
INSERT INTO `distritos` VALUES ('107', '51', '02', '0203', '020306', 'SAN JUAN DE RONTOY', '1');
INSERT INTO `distritos` VALUES ('108', '51', '02', '0204', '020401', 'CHACAS', '1');
INSERT INTO `distritos` VALUES ('109', '51', '02', '0204', '020402', 'ACOCHACA', '1');
INSERT INTO `distritos` VALUES ('110', '51', '02', '0205', '020501', 'ABELARDO PARDO', '1');
INSERT INTO `distritos` VALUES ('111', '51', '02', '0205', '020502', 'ANTONIO RAYMONDI', '1');
INSERT INTO `distritos` VALUES ('112', '51', '02', '0205', '020503', 'AQUIA', '1');
INSERT INTO `distritos` VALUES ('113', '51', '02', '0205', '020504', 'CAJACAY', '1');
INSERT INTO `distritos` VALUES ('114', '51', '02', '0205', '020505', 'CANIS', '1');
INSERT INTO `distritos` VALUES ('115', '51', '02', '0205', '020506', 'CHIQUIAN', '1');
INSERT INTO `distritos` VALUES ('116', '51', '02', '0205', '020507', 'COLQUIOC', '1');
INSERT INTO `distritos` VALUES ('117', '51', '02', '0205', '020508', 'HUALLANCA', '1');
INSERT INTO `distritos` VALUES ('118', '51', '02', '0205', '020509', 'HUASTA', '1');
INSERT INTO `distritos` VALUES ('119', '51', '02', '0205', '020510', 'HUAYLLACAYAN', '1');
INSERT INTO `distritos` VALUES ('120', '51', '02', '0205', '020511', 'LA PRIMAVERA', '1');
INSERT INTO `distritos` VALUES ('121', '51', '02', '0205', '020512', 'MANGAS', '1');
INSERT INTO `distritos` VALUES ('122', '51', '02', '0205', '020513', 'PACLLON', '1');
INSERT INTO `distritos` VALUES ('123', '51', '02', '0205', '020514', 'SAN MIGUEL', '1');
INSERT INTO `distritos` VALUES ('124', '51', '02', '0205', '020515', 'TICLLOS', '1');
INSERT INTO `distritos` VALUES ('125', '51', '02', '0206', '020601', 'CARHUAZ', '1');
INSERT INTO `distritos` VALUES ('126', '51', '02', '0206', '020602', 'ACOPAMPA', '1');
INSERT INTO `distritos` VALUES ('127', '51', '02', '0206', '020603', 'AMASHCA', '1');
INSERT INTO `distritos` VALUES ('128', '51', '02', '0206', '020604', 'ANTA', '1');
INSERT INTO `distritos` VALUES ('129', '51', '02', '0206', '020605', 'ATAQUERO', '1');
INSERT INTO `distritos` VALUES ('130', '51', '02', '0206', '020606', 'MARCARA', '1');
INSERT INTO `distritos` VALUES ('131', '51', '02', '0206', '020607', 'PARIAHUANCA', '1');
INSERT INTO `distritos` VALUES ('132', '51', '02', '0206', '020608', 'SAN MIGUEL DE ACO', '1');
INSERT INTO `distritos` VALUES ('133', '51', '02', '0206', '020609', 'SHILLA', '1');
INSERT INTO `distritos` VALUES ('134', '51', '02', '0206', '020610', 'TINCO', '1');
INSERT INTO `distritos` VALUES ('135', '51', '02', '0206', '020611', 'YUNGAR', '1');
INSERT INTO `distritos` VALUES ('136', '51', '02', '0207', '020701', 'SAN LUIS', '1');
INSERT INTO `distritos` VALUES ('137', '51', '02', '0207', '020702', 'SAN NICOLAS', '1');
INSERT INTO `distritos` VALUES ('138', '51', '02', '0207', '020703', 'YAUYA', '1');
INSERT INTO `distritos` VALUES ('139', '51', '02', '0208', '020801', 'CASMA', '1');
INSERT INTO `distritos` VALUES ('140', '51', '02', '0208', '020802', 'BUENA VISTA ALTA', '1');
INSERT INTO `distritos` VALUES ('141', '51', '02', '0208', '020803', 'COMANDANTE NOEL', '1');
INSERT INTO `distritos` VALUES ('142', '51', '02', '0208', '020804', 'YAUTAN', '1');
INSERT INTO `distritos` VALUES ('143', '51', '02', '0209', '020901', 'CORONGO', '1');
INSERT INTO `distritos` VALUES ('144', '51', '02', '0209', '020902', 'ACO', '1');
INSERT INTO `distritos` VALUES ('145', '51', '02', '0209', '020903', 'BAMBAS', '1');
INSERT INTO `distritos` VALUES ('146', '51', '02', '0209', '020904', 'CUSCA', '1');
INSERT INTO `distritos` VALUES ('147', '51', '02', '0209', '020905', 'LA PAMPA', '1');
INSERT INTO `distritos` VALUES ('148', '51', '02', '0209', '020906', 'YANAC', '1');
INSERT INTO `distritos` VALUES ('149', '51', '02', '0209', '020907', 'YUPAN', '1');
INSERT INTO `distritos` VALUES ('150', '51', '02', '0210', '021001', 'HUARI', '1');
INSERT INTO `distritos` VALUES ('151', '51', '02', '0210', '021002', 'ANRA', '1');
INSERT INTO `distritos` VALUES ('152', '51', '02', '0210', '021003', 'CAJAY', '1');
INSERT INTO `distritos` VALUES ('153', '51', '02', '0210', '021004', 'CHAVIN DE HUANTAR', '1');
INSERT INTO `distritos` VALUES ('154', '51', '02', '0210', '021005', 'HUACACHI', '1');
INSERT INTO `distritos` VALUES ('155', '51', '02', '0210', '021006', 'HUACCHIS', '1');
INSERT INTO `distritos` VALUES ('156', '51', '02', '0210', '021007', 'HUACHIS', '1');
INSERT INTO `distritos` VALUES ('157', '51', '02', '0210', '021008', 'HUANTAR', '1');
INSERT INTO `distritos` VALUES ('158', '51', '02', '0210', '021009', 'MASIN', '1');
INSERT INTO `distritos` VALUES ('159', '51', '02', '0210', '021010', 'PAUCAS', '1');
INSERT INTO `distritos` VALUES ('160', '51', '02', '0210', '021011', 'PONTO', '1');
INSERT INTO `distritos` VALUES ('161', '51', '02', '0210', '021012', 'RAHUAPAMPA', '1');
INSERT INTO `distritos` VALUES ('162', '51', '02', '0210', '021013', 'RAPAYAN', '1');
INSERT INTO `distritos` VALUES ('163', '51', '02', '0210', '021014', 'SAN MARCOS', '1');
INSERT INTO `distritos` VALUES ('164', '51', '02', '0210', '021015', 'SAN PEDRO DE CHANA', '1');
INSERT INTO `distritos` VALUES ('165', '51', '02', '0210', '021016', 'UCO', '1');
INSERT INTO `distritos` VALUES ('166', '51', '02', '0211', '021101', 'HUARMEY', '1');
INSERT INTO `distritos` VALUES ('167', '51', '02', '0211', '021102', 'COCHAPETI', '1');
INSERT INTO `distritos` VALUES ('168', '51', '02', '0211', '021103', 'CULEBRAS', '1');
INSERT INTO `distritos` VALUES ('169', '51', '02', '0211', '021104', 'HUAYAN', '1');
INSERT INTO `distritos` VALUES ('170', '51', '02', '0211', '021105', 'MALVAS', '1');
INSERT INTO `distritos` VALUES ('171', '51', '02', '0212', '021201', 'CARAZ', '1');
INSERT INTO `distritos` VALUES ('172', '51', '02', '0212', '021202', 'HUALLANCA', '1');
INSERT INTO `distritos` VALUES ('173', '51', '02', '0212', '021203', 'HUATA', '1');
INSERT INTO `distritos` VALUES ('174', '51', '02', '0212', '021204', 'HUAYLAS', '1');
INSERT INTO `distritos` VALUES ('175', '51', '02', '0212', '021205', 'MATO', '1');
INSERT INTO `distritos` VALUES ('176', '51', '02', '0212', '021206', 'PAMPAROMAS', '1');
INSERT INTO `distritos` VALUES ('177', '51', '02', '0212', '021207', 'PUEBLO LIBRE', '1');
INSERT INTO `distritos` VALUES ('178', '51', '02', '0212', '021208', 'SANTA CRUZ', '1');
INSERT INTO `distritos` VALUES ('179', '51', '02', '0212', '021209', 'SANTO TORIBIO', '1');
INSERT INTO `distritos` VALUES ('180', '51', '02', '0212', '021210', 'YURACMARCA', '1');
INSERT INTO `distritos` VALUES ('181', '51', '02', '0213', '021301', 'PISCOBAMBA', '1');
INSERT INTO `distritos` VALUES ('182', '51', '02', '0213', '021302', 'CASCA', '1');
INSERT INTO `distritos` VALUES ('183', '51', '02', '0213', '021303', 'ELEAZAR GUZMAN BARRON', '1');
INSERT INTO `distritos` VALUES ('184', '51', '02', '0213', '021304', 'FIDEL OIIVAS ESCUDERO', '1');
INSERT INTO `distritos` VALUES ('185', '51', '02', '0213', '021305', 'LLAMA', '1');
INSERT INTO `distritos` VALUES ('186', '51', '02', '0213', '021306', 'LLUMPA', '1');
INSERT INTO `distritos` VALUES ('187', '51', '02', '0213', '021307', 'MUSGA', '1');
INSERT INTO `distritos` VALUES ('188', '51', '02', '0213', '021308', 'LUCMA', '1');
INSERT INTO `distritos` VALUES ('189', '51', '02', '0214', '021401', 'OCROS', '1');
INSERT INTO `distritos` VALUES ('190', '51', '02', '0214', '021402', 'ACAS', '1');
INSERT INTO `distritos` VALUES ('191', '51', '02', '0214', '021403', 'CAJAMARQUILLA', '1');
INSERT INTO `distritos` VALUES ('192', '51', '02', '0214', '021404', 'CARHUAPAMPA', '1');
INSERT INTO `distritos` VALUES ('193', '51', '02', '0214', '021405', 'COCHAS', '1');
INSERT INTO `distritos` VALUES ('194', '51', '02', '0214', '021406', 'CONGAS', '1');
INSERT INTO `distritos` VALUES ('195', '51', '02', '0214', '021407', 'LLIPA', '1');
INSERT INTO `distritos` VALUES ('196', '51', '02', '0214', '021408', 'SAN CRISTOBAL DE RAJAN', '1');
INSERT INTO `distritos` VALUES ('197', '51', '02', '0214', '021409', 'SAN PEDRO', '1');
INSERT INTO `distritos` VALUES ('198', '51', '02', '0214', '021410', 'SANTIAGO DE CHILCAS', '1');
INSERT INTO `distritos` VALUES ('199', '51', '02', '0215', '021501', 'CABANA', '1');
INSERT INTO `distritos` VALUES ('200', '51', '02', '0215', '021502', 'BOLOGNESI', '1');
INSERT INTO `distritos` VALUES ('201', '51', '02', '0215', '021503', 'CONCHUCOS', '1');
INSERT INTO `distritos` VALUES ('202', '51', '02', '0215', '021504', 'HUACASCHUQUE', '1');
INSERT INTO `distritos` VALUES ('203', '51', '02', '0215', '021505', 'HUANDOVAL', '1');
INSERT INTO `distritos` VALUES ('204', '51', '02', '0215', '021506', 'LACABAMBA', '1');
INSERT INTO `distritos` VALUES ('205', '51', '02', '0215', '021507', 'LLAPO', '1');
INSERT INTO `distritos` VALUES ('206', '51', '02', '0215', '021508', 'PALLASCA', '1');
INSERT INTO `distritos` VALUES ('207', '51', '02', '0215', '021509', 'PAMPAS', '1');
INSERT INTO `distritos` VALUES ('208', '51', '02', '0215', '021510', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('209', '51', '02', '0215', '021511', 'TAUCA', '1');
INSERT INTO `distritos` VALUES ('210', '51', '02', '0216', '021601', 'POMABAMBA', '1');
INSERT INTO `distritos` VALUES ('211', '51', '02', '0216', '021602', 'HUAYLLAN', '1');
INSERT INTO `distritos` VALUES ('212', '51', '02', '0216', '021603', 'PAROBAMBA', '1');
INSERT INTO `distritos` VALUES ('213', '51', '02', '0216', '021604', 'QUINUABAMBA', '1');
INSERT INTO `distritos` VALUES ('214', '51', '02', '0217', '021701', 'RECUAY', '1');
INSERT INTO `distritos` VALUES ('215', '51', '02', '0217', '021702', 'CATAC', '1');
INSERT INTO `distritos` VALUES ('216', '51', '02', '0217', '021703', 'COTAPARACO', '1');
INSERT INTO `distritos` VALUES ('217', '51', '02', '0217', '021704', 'HUAYLLAPAMPA', '1');
INSERT INTO `distritos` VALUES ('218', '51', '02', '0217', '021705', 'LLACLLIN', '1');
INSERT INTO `distritos` VALUES ('219', '51', '02', '0217', '021706', 'MARCA', '1');
INSERT INTO `distritos` VALUES ('220', '51', '02', '0217', '021707', 'PAMPAS CHICO', '1');
INSERT INTO `distritos` VALUES ('221', '51', '02', '0217', '021708', 'PARARIN', '1');
INSERT INTO `distritos` VALUES ('222', '51', '02', '0217', '021709', 'TAPACOCHA', '1');
INSERT INTO `distritos` VALUES ('223', '51', '02', '0217', '021710', 'TICAPAMPA', '1');
INSERT INTO `distritos` VALUES ('224', '51', '02', '0218', '021801', 'CHIMBOTE', '1');
INSERT INTO `distritos` VALUES ('225', '51', '02', '0218', '021802', 'CACERES DEL PERU', '1');
INSERT INTO `distritos` VALUES ('226', '51', '02', '0218', '021803', 'COISHCO', '1');
INSERT INTO `distritos` VALUES ('227', '51', '02', '0218', '021804', 'MACATE', '1');
INSERT INTO `distritos` VALUES ('228', '51', '02', '0218', '021805', 'MORO', '1');
INSERT INTO `distritos` VALUES ('229', '51', '02', '0218', '021806', 'NEPENA', '1');
INSERT INTO `distritos` VALUES ('230', '51', '02', '0218', '021807', 'NUEVO CHIMBOTE', '1');
INSERT INTO `distritos` VALUES ('231', '51', '02', '0218', '021808', 'SAMANCO', '1');
INSERT INTO `distritos` VALUES ('232', '51', '02', '0218', '021809', 'SANTA', '1');
INSERT INTO `distritos` VALUES ('233', '51', '02', '0219', '021901', 'SIHUAS', '1');
INSERT INTO `distritos` VALUES ('234', '51', '02', '0219', '021902', 'ACOBAMBA', '1');
INSERT INTO `distritos` VALUES ('235', '51', '02', '0219', '021903', 'ALFONSO UGARTE', '1');
INSERT INTO `distritos` VALUES ('236', '51', '02', '0219', '021904', 'CASHAPAMPA', '1');
INSERT INTO `distritos` VALUES ('237', '51', '02', '0219', '021905', 'CHINGALPO', '1');
INSERT INTO `distritos` VALUES ('238', '51', '02', '0219', '021906', 'HUAYLLABAMBA', '1');
INSERT INTO `distritos` VALUES ('239', '51', '02', '0219', '021907', 'QUICHES', '1');
INSERT INTO `distritos` VALUES ('240', '51', '02', '0219', '021908', 'RAGASH', '1');
INSERT INTO `distritos` VALUES ('241', '51', '02', '0219', '021909', 'SAN JUAN', '1');
INSERT INTO `distritos` VALUES ('242', '51', '02', '0219', '021910', 'SICSIBAMBA', '1');
INSERT INTO `distritos` VALUES ('243', '51', '02', '0220', '022001', 'YUNGAY', '1');
INSERT INTO `distritos` VALUES ('244', '51', '02', '0220', '022002', 'CASCAPARA', '1');
INSERT INTO `distritos` VALUES ('245', '51', '02', '0220', '022003', 'MANCOS', '1');
INSERT INTO `distritos` VALUES ('246', '51', '02', '0220', '022004', 'MATACOTO', '1');
INSERT INTO `distritos` VALUES ('247', '51', '02', '0220', '022005', 'QUILLO', '1');
INSERT INTO `distritos` VALUES ('248', '51', '02', '0220', '022006', 'RANRAHIRCA', '1');
INSERT INTO `distritos` VALUES ('249', '51', '02', '0220', '022007', 'SHUPLUY', '1');
INSERT INTO `distritos` VALUES ('250', '51', '02', '0220', '022008', 'YANAMA', '1');
INSERT INTO `distritos` VALUES ('251', '51', '03', '0301', '030101', 'ABANCAY', '1');
INSERT INTO `distritos` VALUES ('252', '51', '03', '0301', '030102', 'CHACOCHE', '1');
INSERT INTO `distritos` VALUES ('253', '51', '03', '0301', '030103', 'CIRCA', '1');
INSERT INTO `distritos` VALUES ('254', '51', '03', '0301', '030104', 'CURAHUASI', '1');
INSERT INTO `distritos` VALUES ('255', '51', '03', '0301', '030105', 'HUANIPACA', '1');
INSERT INTO `distritos` VALUES ('256', '51', '03', '0301', '030106', 'LAMBRAMA', '1');
INSERT INTO `distritos` VALUES ('257', '51', '03', '0301', '030107', 'PICHIRHUA', '1');
INSERT INTO `distritos` VALUES ('258', '51', '03', '0301', '030108', 'SAN PEDRO DE CACHORA', '1');
INSERT INTO `distritos` VALUES ('259', '51', '03', '0301', '030109', 'TAMBURCO', '1');
INSERT INTO `distritos` VALUES ('260', '51', '03', '0302', '030201', 'ANDAHUAYLAS', '1');
INSERT INTO `distritos` VALUES ('261', '51', '03', '0302', '030202', 'ANDARAPA', '1');
INSERT INTO `distritos` VALUES ('262', '51', '03', '0302', '030203', 'CHIARA', '1');
INSERT INTO `distritos` VALUES ('263', '51', '03', '0302', '030204', 'HUANCARAMA', '1');
INSERT INTO `distritos` VALUES ('264', '51', '03', '0302', '030205', 'HUANCARAY', '1');
INSERT INTO `distritos` VALUES ('265', '51', '03', '0302', '030206', 'HUAYANA', '1');
INSERT INTO `distritos` VALUES ('266', '51', '03', '0302', '030207', 'JOSE MARIA ARGUEDAS', '1');
INSERT INTO `distritos` VALUES ('267', '51', '03', '0302', '030208', 'KAQUIABAMBA', '1');
INSERT INTO `distritos` VALUES ('268', '51', '03', '0302', '030209', 'KISHUARA', '1');
INSERT INTO `distritos` VALUES ('269', '51', '03', '0302', '030210', 'PACOBAMBA', '1');
INSERT INTO `distritos` VALUES ('270', '51', '03', '0302', '030211', 'PACUCHA', '1');
INSERT INTO `distritos` VALUES ('271', '51', '03', '0302', '030212', 'PAMPACHIRI', '1');
INSERT INTO `distritos` VALUES ('272', '51', '03', '0302', '030213', 'POMACOCHA', '1');
INSERT INTO `distritos` VALUES ('273', '51', '03', '0302', '030214', 'SAN ANTONIO DE CACHI', '1');
INSERT INTO `distritos` VALUES ('274', '51', '03', '0302', '030215', 'SAN JERONIMO', '1');
INSERT INTO `distritos` VALUES ('275', '51', '03', '0302', '030216', 'SAN MIGUEL DE CHACCRAPAMPA', '1');
INSERT INTO `distritos` VALUES ('276', '51', '03', '0302', '030217', 'SANTA MARIA DE CHICMO', '1');
INSERT INTO `distritos` VALUES ('277', '51', '03', '0302', '030218', 'TALAVERA DE LA REYNA', '1');
INSERT INTO `distritos` VALUES ('278', '51', '03', '0302', '030219', 'TUMAY HUARACA', '1');
INSERT INTO `distritos` VALUES ('279', '51', '03', '0302', '030220', 'TURPO', '1');
INSERT INTO `distritos` VALUES ('280', '51', '03', '0303', '030301', 'ANTABAMBA', '1');
INSERT INTO `distritos` VALUES ('281', '51', '03', '0303', '030302', 'EL ORO', '1');
INSERT INTO `distritos` VALUES ('282', '51', '03', '0303', '030303', 'HUAQUIRCA', '1');
INSERT INTO `distritos` VALUES ('283', '51', '03', '0303', '030304', 'JUAN ESPINOZA MEDRANO', '1');
INSERT INTO `distritos` VALUES ('284', '51', '03', '0303', '030305', 'OROPESA', '1');
INSERT INTO `distritos` VALUES ('285', '51', '03', '0303', '030306', 'PACHACONAS', '1');
INSERT INTO `distritos` VALUES ('286', '51', '03', '0303', '030307', 'SABAINO', '1');
INSERT INTO `distritos` VALUES ('287', '51', '03', '0304', '030401', 'CHALHUANCA', '1');
INSERT INTO `distritos` VALUES ('288', '51', '03', '0304', '030402', 'CAPAYA', '1');
INSERT INTO `distritos` VALUES ('289', '51', '03', '0304', '030403', 'CARAYBAMBA', '1');
INSERT INTO `distritos` VALUES ('290', '51', '03', '0304', '030404', 'CHAPIMARCA', '1');
INSERT INTO `distritos` VALUES ('291', '51', '03', '0304', '030405', 'COLCABAMBA', '1');
INSERT INTO `distritos` VALUES ('292', '51', '03', '0304', '030406', 'COTARUSE', '1');
INSERT INTO `distritos` VALUES ('293', '51', '03', '0304', '030407', 'IHUAYLLO', '1');
INSERT INTO `distritos` VALUES ('294', '51', '03', '0304', '030408', 'JUSTO APU SAHUARAURA', '1');
INSERT INTO `distritos` VALUES ('295', '51', '03', '0304', '030409', 'LUCRE', '1');
INSERT INTO `distritos` VALUES ('296', '51', '03', '0304', '030410', 'POCOHUANCA', '1');
INSERT INTO `distritos` VALUES ('297', '51', '03', '0304', '030411', 'SAN JUAN DE CHACNA', '1');
INSERT INTO `distritos` VALUES ('298', '51', '03', '0304', '030412', 'SANAYCA', '1');
INSERT INTO `distritos` VALUES ('299', '51', '03', '0304', '030413', 'SORAYA', '1');
INSERT INTO `distritos` VALUES ('300', '51', '03', '0304', '030414', 'TAPAIRIHUA', '1');
INSERT INTO `distritos` VALUES ('301', '51', '03', '0304', '030415', 'TINTAY', '1');
INSERT INTO `distritos` VALUES ('302', '51', '03', '0304', '030416', 'TORAYA', '1');
INSERT INTO `distritos` VALUES ('303', '51', '03', '0304', '030417', 'YANACA', '1');
INSERT INTO `distritos` VALUES ('304', '51', '03', '0305', '030501', 'TAMBOBAMBA', '1');
INSERT INTO `distritos` VALUES ('305', '51', '03', '0305', '030502', 'COTABAMBAS', '1');
INSERT INTO `distritos` VALUES ('306', '51', '03', '0305', '030503', 'COYLLURQUI', '1');
INSERT INTO `distritos` VALUES ('307', '51', '03', '0305', '030504', 'HAQUIRA', '1');
INSERT INTO `distritos` VALUES ('308', '51', '03', '0305', '030505', 'MARA', '1');
INSERT INTO `distritos` VALUES ('309', '51', '03', '0305', '030506', 'CHALHUAHUACHOS', '1');
INSERT INTO `distritos` VALUES ('310', '51', '03', '0306', '030601', 'CHINCHEROS', '1');
INSERT INTO `distritos` VALUES ('311', '51', '03', '0306', '030602', 'ANCCOHUAYLLO', '1');
INSERT INTO `distritos` VALUES ('312', '51', '03', '0306', '030603', 'COCHARCAS', '1');
INSERT INTO `distritos` VALUES ('313', '51', '03', '0306', '030604', 'HUACCANA', '1');
INSERT INTO `distritos` VALUES ('314', '51', '03', '0306', '030605', 'OCOBAMBA', '1');
INSERT INTO `distritos` VALUES ('315', '51', '03', '0306', '030606', 'ONGOY', '1');
INSERT INTO `distritos` VALUES ('316', '51', '03', '0306', '030607', 'URANMARCA', '1');
INSERT INTO `distritos` VALUES ('317', '51', '03', '0306', '030608', 'RANRACANCHA', '1');
INSERT INTO `distritos` VALUES ('318', '51', '03', '0306', '030609', 'ROCCHAC', '1');
INSERT INTO `distritos` VALUES ('319', '51', '03', '0306', '030610', 'EL PORVENIR', '1');
INSERT INTO `distritos` VALUES ('320', '51', '03', '0306', '030611', 'LOS CHANKAS', '1');
INSERT INTO `distritos` VALUES ('321', '51', '03', '0307', '030701', 'CHUQUIBAMBILLA', '1');
INSERT INTO `distritos` VALUES ('322', '51', '03', '0307', '030702', 'CURPAHUASI', '1');
INSERT INTO `distritos` VALUES ('323', '51', '03', '0307', '030703', 'HUAYLLATI', '1');
INSERT INTO `distritos` VALUES ('324', '51', '03', '0307', '030704', 'MAMARA', '1');
INSERT INTO `distritos` VALUES ('325', '51', '03', '0307', '030705', 'MARISCAL GAMARRA', '1');
INSERT INTO `distritos` VALUES ('326', '51', '03', '0307', '030706', 'MICAELA BASTIDAS', '1');
INSERT INTO `distritos` VALUES ('327', '51', '03', '0307', '030707', 'PATAYPAMPA', '1');
INSERT INTO `distritos` VALUES ('328', '51', '03', '0307', '030708', 'PROGRESO', '1');
INSERT INTO `distritos` VALUES ('329', '51', '03', '0307', '030709', 'SAN ANTONIO', '1');
INSERT INTO `distritos` VALUES ('330', '51', '03', '0307', '030710', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('331', '51', '03', '0307', '030711', 'TURPAY', '1');
INSERT INTO `distritos` VALUES ('332', '51', '03', '0307', '030712', 'VILCABAMBA', '1');
INSERT INTO `distritos` VALUES ('333', '51', '03', '0307', '030713', 'VIRUNDO', '1');
INSERT INTO `distritos` VALUES ('334', '51', '03', '0307', '030714', 'CURASCO', '1');
INSERT INTO `distritos` VALUES ('335', '51', '04', '0401', '040101', 'ALTO SELVA ALEGRE', '1');
INSERT INTO `distritos` VALUES ('336', '51', '04', '0401', '040102', 'AREQUIPA', '1');
INSERT INTO `distritos` VALUES ('337', '51', '04', '0401', '040103', 'CAYMA', '1');
INSERT INTO `distritos` VALUES ('338', '51', '04', '0401', '040104', 'CERRO COLORADO', '1');
INSERT INTO `distritos` VALUES ('339', '51', '04', '0401', '040105', 'CHARACATO', '1');
INSERT INTO `distritos` VALUES ('340', '51', '04', '0401', '040106', 'CHIGUATA', '1');
INSERT INTO `distritos` VALUES ('341', '51', '04', '0401', '040107', 'JACOBO HUNTER', '1');
INSERT INTO `distritos` VALUES ('342', '51', '04', '0401', '040108', 'JOSE LUIS BUSTAMANTE Y RIVERO', '1');
INSERT INTO `distritos` VALUES ('343', '51', '04', '0401', '040109', 'LA JOYA', '1');
INSERT INTO `distritos` VALUES ('344', '51', '04', '0401', '040110', 'MARIANO MELGAR', '1');
INSERT INTO `distritos` VALUES ('345', '51', '04', '0401', '040111', 'MIRAFLORES', '1');
INSERT INTO `distritos` VALUES ('346', '51', '04', '0401', '040112', 'MOLLEBAYA', '1');
INSERT INTO `distritos` VALUES ('347', '51', '04', '0401', '040113', 'PAUCARPATA', '1');
INSERT INTO `distritos` VALUES ('348', '51', '04', '0401', '040114', 'POCSI', '1');
INSERT INTO `distritos` VALUES ('349', '51', '04', '0401', '040115', 'POLOBAYA', '1');
INSERT INTO `distritos` VALUES ('350', '51', '04', '0401', '040116', 'QUEQUENA', '1');
INSERT INTO `distritos` VALUES ('351', '51', '04', '0401', '040117', 'SABANDIA', '1');
INSERT INTO `distritos` VALUES ('352', '51', '04', '0401', '040118', 'SACHACA', '1');
INSERT INTO `distritos` VALUES ('353', '51', '04', '0401', '040119', 'SAN JUAN DE SIGUAS', '1');
INSERT INTO `distritos` VALUES ('354', '51', '04', '0401', '040120', 'SAN JUAN DE TARUCANI', '1');
INSERT INTO `distritos` VALUES ('355', '51', '04', '0401', '040121', 'SANTA ISABEL DE SIGUAS', '1');
INSERT INTO `distritos` VALUES ('356', '51', '04', '0401', '040122', 'SANTA RITA DE SIGUAS', '1');
INSERT INTO `distritos` VALUES ('357', '51', '04', '0401', '040123', 'SOCABAYA', '1');
INSERT INTO `distritos` VALUES ('358', '51', '04', '0401', '040124', 'TIABAYA', '1');
INSERT INTO `distritos` VALUES ('359', '51', '04', '0401', '040125', 'UCHUMAYO', '1');
INSERT INTO `distritos` VALUES ('360', '51', '04', '0401', '040126', 'VITOR', '1');
INSERT INTO `distritos` VALUES ('361', '51', '04', '0401', '040127', 'YANAHUARA', '1');
INSERT INTO `distritos` VALUES ('362', '51', '04', '0401', '040128', 'YARABAMBA', '1');
INSERT INTO `distritos` VALUES ('363', '51', '04', '0401', '040129', 'YURA', '1');
INSERT INTO `distritos` VALUES ('364', '51', '15', '1501', '150101', 'ANCON', '1');
INSERT INTO `distritos` VALUES ('365', '51', '15', '1501', '150102', 'ATE', '1');
INSERT INTO `distritos` VALUES ('366', '51', '15', '1501', '150103', 'BARRANCO', '1');
INSERT INTO `distritos` VALUES ('367', '51', '15', '1501', '150104', 'BRENA', '1');
INSERT INTO `distritos` VALUES ('368', '51', '15', '1501', '150105', 'CARABAYLLO', '1');
INSERT INTO `distritos` VALUES ('369', '51', '15', '1501', '150106', 'CHACLACAYO', '1');
INSERT INTO `distritos` VALUES ('370', '51', '15', '1501', '150107', 'CHORRILLOS', '1');
INSERT INTO `distritos` VALUES ('371', '51', '15', '1501', '150108', 'CIENEGUILLA', '1');
INSERT INTO `distritos` VALUES ('372', '51', '15', '1501', '150109', 'COMAS', '1');
INSERT INTO `distritos` VALUES ('373', '51', '15', '1501', '150110', 'EL AGUSTINO', '1');
INSERT INTO `distritos` VALUES ('374', '51', '15', '1501', '150111', 'INDEPENDENCIA', '1');
INSERT INTO `distritos` VALUES ('375', '51', '15', '1501', '150112', 'JESUS MARIA', '1');
INSERT INTO `distritos` VALUES ('376', '51', '15', '1501', '150113', 'LA MOLINA', '1');
INSERT INTO `distritos` VALUES ('377', '51', '15', '1501', '150114', 'LA VICTORIA', '1');
INSERT INTO `distritos` VALUES ('378', '51', '15', '1501', '150115', 'LIMA', '1');
INSERT INTO `distritos` VALUES ('379', '51', '15', '1501', '150116', 'LINCE', '1');
INSERT INTO `distritos` VALUES ('380', '51', '15', '1501', '150117', 'LOS OLIVOS', '1');
INSERT INTO `distritos` VALUES ('381', '51', '15', '1501', '150118', 'LURIGANCHO-CHOSICA', '1');
INSERT INTO `distritos` VALUES ('382', '51', '15', '1501', '150119', 'LURIN', '1');
INSERT INTO `distritos` VALUES ('383', '51', '15', '1501', '150120', 'MAGDALENA DEL MAR', '1');
INSERT INTO `distritos` VALUES ('384', '51', '15', '1501', '150121', 'MIRAFLORES', '1');
INSERT INTO `distritos` VALUES ('385', '51', '15', '1501', '150122', 'PUEBLO LIBRE', '1');
INSERT INTO `distritos` VALUES ('386', '51', '15', '1501', '150123', 'PACHACAMAC', '1');
INSERT INTO `distritos` VALUES ('387', '51', '15', '1501', '150124', 'PUCUSANA', '1');
INSERT INTO `distritos` VALUES ('388', '51', '15', '1501', '150125', 'PUENTE PIEDRA', '1');
INSERT INTO `distritos` VALUES ('389', '51', '15', '1501', '150126', 'PUNTA HERMOSA', '1');
INSERT INTO `distritos` VALUES ('390', '51', '15', '1501', '150127', 'PUNTA NEGRA', '1');
INSERT INTO `distritos` VALUES ('391', '51', '15', '1501', '150128', 'RIMAC', '1');
INSERT INTO `distritos` VALUES ('392', '51', '15', '1501', '150129', 'SAN BARTOLO', '1');
INSERT INTO `distritos` VALUES ('393', '51', '15', '1501', '150130', 'SAN BORJA', '1');
INSERT INTO `distritos` VALUES ('394', '51', '15', '1501', '150131', 'SAN ISIDRO', '1');
INSERT INTO `distritos` VALUES ('395', '51', '15', '1501', '150132', 'SAN JUAN DE LURIGANCHO', '1');
INSERT INTO `distritos` VALUES ('396', '51', '15', '1501', '150133', 'SAN JUAN DE MIRAFLORES', '1');
INSERT INTO `distritos` VALUES ('397', '51', '15', '1501', '150134', 'SAN LUIS', '1');
INSERT INTO `distritos` VALUES ('398', '51', '15', '1501', '150135', 'SAN MARTIN DE PORRES', '1');
INSERT INTO `distritos` VALUES ('399', '51', '15', '1501', '150136', 'SAN MIGUEL', '1');
INSERT INTO `distritos` VALUES ('400', '51', '15', '1501', '150137', 'SANTA ANITA', '1');
INSERT INTO `distritos` VALUES ('401', '51', '15', '1501', '150138', 'SANTA MARIA DEL MAR', '1');
INSERT INTO `distritos` VALUES ('402', '51', '15', '1501', '150139', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('403', '51', '15', '1501', '150140', 'SANTIAGO DE SURCO', '1');
INSERT INTO `distritos` VALUES ('404', '51', '15', '1501', '150141', 'SURQUILLO', '1');
INSERT INTO `distritos` VALUES ('405', '51', '15', '1501', '150142', 'VILLA EL SALVADOR', '1');
INSERT INTO `distritos` VALUES ('406', '51', '15', '1501', '150143', 'VILLA MARIA DEL TRIUNFO', '1');
INSERT INTO `distritos` VALUES ('407', '51', '15', '1502', '150201', 'BARRANCA', '1');
INSERT INTO `distritos` VALUES ('408', '51', '15', '1502', '150202', 'PARAMONGA', '1');
INSERT INTO `distritos` VALUES ('409', '51', '15', '1502', '150203', 'PATIVILCA', '1');
INSERT INTO `distritos` VALUES ('410', '51', '15', '1502', '150204', 'SUPE', '1');
INSERT INTO `distritos` VALUES ('411', '51', '15', '1502', '150205', 'SUPE PUERTO', '1');
INSERT INTO `distritos` VALUES ('412', '51', '15', '1503', '150301', 'MANAS', '1');
INSERT INTO `distritos` VALUES ('413', '51', '15', '1503', '150302', 'GORGOR', '1');
INSERT INTO `distritos` VALUES ('414', '51', '15', '1503', '150303', 'HUANCAPON', '1');
INSERT INTO `distritos` VALUES ('415', '51', '15', '1503', '150304', 'CAJATAMBO', '1');
INSERT INTO `distritos` VALUES ('416', '51', '15', '1503', '150305', 'COPA', '1');
INSERT INTO `distritos` VALUES ('417', '51', '15', '1504', '150401', 'CANTA', '1');
INSERT INTO `distritos` VALUES ('418', '51', '15', '1504', '150402', 'ARAHUAY', '1');
INSERT INTO `distritos` VALUES ('419', '51', '15', '1504', '150403', 'HUAMANTANGA', '1');
INSERT INTO `distritos` VALUES ('420', '51', '15', '1504', '150404', 'HUAROS', '1');
INSERT INTO `distritos` VALUES ('421', '51', '15', '1504', '150405', 'LACHAQUI', '1');
INSERT INTO `distritos` VALUES ('422', '51', '15', '1504', '150406', 'SAN BUENAVENTURA', '1');
INSERT INTO `distritos` VALUES ('423', '51', '15', '1504', '150407', 'SANTA ROSA DE QUIVES', '1');
INSERT INTO `distritos` VALUES ('424', '51', '15', '1505', '150501', 'ASIA', '1');
INSERT INTO `distritos` VALUES ('425', '51', '15', '1505', '150502', 'CALANGO', '1');
INSERT INTO `distritos` VALUES ('426', '51', '15', '1505', '150503', 'CERRO AZUL', '1');
INSERT INTO `distritos` VALUES ('427', '51', '15', '1505', '150504', 'CHILCA', '1');
INSERT INTO `distritos` VALUES ('428', '51', '15', '1505', '150505', 'COAYLLO', '1');
INSERT INTO `distritos` VALUES ('429', '51', '15', '1505', '150506', 'IMPERIAL', '1');
INSERT INTO `distritos` VALUES ('430', '51', '15', '1505', '150507', 'LUNAHUANA', '1');
INSERT INTO `distritos` VALUES ('431', '51', '15', '1505', '150508', 'MALA', '1');
INSERT INTO `distritos` VALUES ('432', '51', '15', '1505', '150509', 'NUEVO IMPERIAL', '1');
INSERT INTO `distritos` VALUES ('433', '51', '15', '1505', '150510', 'PACARAN', '1');
INSERT INTO `distritos` VALUES ('434', '51', '15', '1505', '150511', 'QUILMANA', '1');
INSERT INTO `distritos` VALUES ('435', '51', '15', '1505', '150512', 'SAN ANTONIO', '1');
INSERT INTO `distritos` VALUES ('436', '51', '15', '1505', '150513', 'SAN LUIS', '1');
INSERT INTO `distritos` VALUES ('437', '51', '15', '1505', '150514', 'SAN VICENTE DE CANETE', '1');
INSERT INTO `distritos` VALUES ('438', '51', '15', '1505', '150515', 'SANTA CRUZ DE FLORES', '1');
INSERT INTO `distritos` VALUES ('439', '51', '15', '1505', '150516', 'ZUNIGA', '1');
INSERT INTO `distritos` VALUES ('440', '51', '15', '1506', '150601', 'VEINTISIETE DE NOVIEMBRE', '1');
INSERT INTO `distritos` VALUES ('441', '51', '15', '1506', '150602', 'ATAVILLOS ALTO', '1');
INSERT INTO `distritos` VALUES ('442', '51', '15', '1506', '150603', 'ATAVILLOS BAJO', '1');
INSERT INTO `distritos` VALUES ('443', '51', '15', '1506', '150604', 'AUCALLAMA', '1');
INSERT INTO `distritos` VALUES ('444', '51', '15', '1506', '150605', 'CHANCAY', '1');
INSERT INTO `distritos` VALUES ('445', '51', '15', '1506', '150606', 'HUARAL', '1');
INSERT INTO `distritos` VALUES ('446', '51', '15', '1506', '150607', 'IHUARI', '1');
INSERT INTO `distritos` VALUES ('447', '51', '15', '1506', '150608', 'LAMPIAN', '1');
INSERT INTO `distritos` VALUES ('448', '51', '15', '1506', '150609', 'PACARAOS', '1');
INSERT INTO `distritos` VALUES ('449', '51', '15', '1506', '150610', 'SANTA CRUZ DE ANDAMARCA', '1');
INSERT INTO `distritos` VALUES ('450', '51', '15', '1506', '150611', 'SUMBILCA', '1');
INSERT INTO `distritos` VALUES ('451', '51', '15', '1506', '150612', 'SAN MIGUEL DE ACOS', '1');
INSERT INTO `distritos` VALUES ('453', '51', '15', '1510', '151001', 'Yauyos', '1');
INSERT INTO `distritos` VALUES ('454', '51', '15', '1510', '151002', 'Alis', '1');
INSERT INTO `distritos` VALUES ('455', '51', '15', '1510', '151003', 'Ayauca', '1');
INSERT INTO `distritos` VALUES ('456', '51', '15', '1510', '151004', 'Ayaviri', '1');
INSERT INTO `distritos` VALUES ('457', '51', '15', '1510', '151005', 'Azangaro', '1');
INSERT INTO `distritos` VALUES ('458', '51', '15', '1510', '151006', 'Cacra', '1');
INSERT INTO `distritos` VALUES ('459', '51', '15', '1510', '151007', 'Carania', '1');
INSERT INTO `distritos` VALUES ('460', '51', '15', '1510', '151008', 'Catahuasi', '1');
INSERT INTO `distritos` VALUES ('461', '51', '15', '1510', '151009', 'Chocos', '1');
INSERT INTO `distritos` VALUES ('462', '51', '15', '1510', '151010', 'Cochas', '1');
INSERT INTO `distritos` VALUES ('463', '51', '15', '1510', '151011', 'Colonia', '1');
INSERT INTO `distritos` VALUES ('464', '51', '15', '1510', '151012', 'Hongos', '1');
INSERT INTO `distritos` VALUES ('465', '51', '15', '1510', '151013', 'Huampara', '1');
INSERT INTO `distritos` VALUES ('466', '51', '15', '1510', '151014', 'Huancaya', '1');
INSERT INTO `distritos` VALUES ('467', '51', '15', '1510', '151015', 'Huangascar', '1');
INSERT INTO `distritos` VALUES ('468', '51', '15', '1510', '151016', 'Huantan', '1');
INSERT INTO `distritos` VALUES ('469', '51', '15', '1510', '151017', 'Huanec', '1');
INSERT INTO `distritos` VALUES ('470', '51', '15', '1510', '151018', 'Laraos', '1');
INSERT INTO `distritos` VALUES ('471', '51', '15', '1510', '151019', 'Lincha', '1');
INSERT INTO `distritos` VALUES ('472', '51', '15', '1510', '151020', 'Madean', '1');
INSERT INTO `distritos` VALUES ('473', '51', '15', '1510', '151021', 'Miraflores', '1');
INSERT INTO `distritos` VALUES ('474', '51', '15', '1510', '151022', 'Omas', '1');
INSERT INTO `distritos` VALUES ('475', '51', '15', '1510', '151023', 'Quinches', '1');
INSERT INTO `distritos` VALUES ('476', '51', '15', '1510', '151024', 'Quinocay', '1');
INSERT INTO `distritos` VALUES ('477', '51', '15', '1510', '151025', 'San Lorenzo de Putinza', '1');
INSERT INTO `distritos` VALUES ('478', '51', '15', '1510', '151026', 'San Joaquin', '1');
INSERT INTO `distritos` VALUES ('479', '51', '15', '1510', '151027', 'San Pedro de Pilas', '1');
INSERT INTO `distritos` VALUES ('480', '51', '15', '1510', '151028', 'Tanta', '1');
INSERT INTO `distritos` VALUES ('481', '51', '15', '1510', '151029', 'Tauripampa', '1');
INSERT INTO `distritos` VALUES ('482', '51', '15', '1510', '151030', 'Tomas', '1');
INSERT INTO `distritos` VALUES ('483', '51', '15', '1510', '151031', 'Tupe', '1');
INSERT INTO `distritos` VALUES ('484', '51', '15', '1510', '151032', 'Vinac', '1');
INSERT INTO `distritos` VALUES ('485', '51', '15', '1510', '151033', 'Vitis', '1');
INSERT INTO `distritos` VALUES ('486', '51', '15', '1509', '150901', 'Oyon', '1');
INSERT INTO `distritos` VALUES ('487', '51', '15', '1509', '150902', 'Andajes', '1');
INSERT INTO `distritos` VALUES ('488', '51', '15', '1509', '150903', 'Caujul', '1');
INSERT INTO `distritos` VALUES ('489', '51', '15', '1509', '150904', 'Cochamarca', '1');
INSERT INTO `distritos` VALUES ('490', '51', '15', '1509', '150905', 'Navan', '1');
INSERT INTO `distritos` VALUES ('491', '51', '15', '1509', '150906', 'Pachangara', '1');
INSERT INTO `distritos` VALUES ('492', '51', '15', '1508', '150801', 'Huacho ', '1');
INSERT INTO `distritos` VALUES ('493', '51', '15', '1508', '150802', 'Hualmay ', '1');
INSERT INTO `distritos` VALUES ('494', '51', '15', '1508', '150803', 'Santa Maria', '1');
INSERT INTO `distritos` VALUES ('495', '51', '15', '1508', '150804', 'Caleta de Carquin', '1');
INSERT INTO `distritos` VALUES ('496', '51', '15', '1508', '150805', 'Huaura', '1');
INSERT INTO `distritos` VALUES ('497', '51', '15', '1508', '150806', 'Vegueta ', '1');
INSERT INTO `distritos` VALUES ('498', '51', '15', '1508', '150807', 'Ambar', '1');
INSERT INTO `distritos` VALUES ('499', '51', '15', '1508', '150808', 'Checras', '1');
INSERT INTO `distritos` VALUES ('500', '51', '15', '1508', '150809', 'Paccho ', '1');
INSERT INTO `distritos` VALUES ('501', '51', '15', '1508', '150810', 'Leoncio Prado', '1');
INSERT INTO `distritos` VALUES ('502', '51', '15', '1508', '150811', 'Sayan', '1');
INSERT INTO `distritos` VALUES ('503', '51', '15', '1508', '150812', 'Santa Leonor', '1');
INSERT INTO `distritos` VALUES ('504', '51', '15', '1507', '150701', 'MATUCANA', '1');
INSERT INTO `distritos` VALUES ('505', '51', '15', '1507', '150702', 'ANTIOQUIA', '1');
INSERT INTO `distritos` VALUES ('506', '51', '15', '1507', '150703', 'CALLAHUANCA', '1');
INSERT INTO `distritos` VALUES ('507', '51', '15', '1507', '150704', 'CARAMPOMA', '1');
INSERT INTO `distritos` VALUES ('508', '51', '15', '1507', '150705', 'CHICLA', '1');
INSERT INTO `distritos` VALUES ('509', '51', '15', '1507', '150706', 'CUENCA', '1');
INSERT INTO `distritos` VALUES ('510', '51', '15', '1507', '150707', 'HUACHUPAMPA', '1');
INSERT INTO `distritos` VALUES ('511', '51', '15', '1507', '150708', 'HUANZA', '1');
INSERT INTO `distritos` VALUES ('512', '51', '15', '1507', '150709', 'HUAROCHIRI', '1');
INSERT INTO `distritos` VALUES ('513', '51', '15', '1507', '150710', 'LAHUAYTAMBO', '1');
INSERT INTO `distritos` VALUES ('514', '51', '15', '1507', '150711', 'LANGA', '1');
INSERT INTO `distritos` VALUES ('515', '51', '15', '1507', '150712', 'LARAOS (SAN PEDRO DE LARAOS)', '1');
INSERT INTO `distritos` VALUES ('516', '51', '15', '1507', '150713', 'MARIATANA', '1');
INSERT INTO `distritos` VALUES ('517', '51', '15', '1507', '150714', 'RICARDO PALMA', '1');
INSERT INTO `distritos` VALUES ('518', '51', '15', '1507', '150715', 'SAN ANDRES DE TUPICOCHA', '1');
INSERT INTO `distritos` VALUES ('519', '51', '15', '1507', '150716', 'SAN ANTONIO (DE CHACLLA)', '1');
INSERT INTO `distritos` VALUES ('520', '51', '15', '1507', '150717', 'SAN BARTOLOME', '1');
INSERT INTO `distritos` VALUES ('521', '51', '15', '1507', '150718', 'SAN DAMIAN', '1');
INSERT INTO `distritos` VALUES ('522', '51', '15', '1507', '150719', 'SAN JUAN DE IRIS', '1');
INSERT INTO `distritos` VALUES ('523', '51', '15', '1507', '150720', 'SAN JUAN DE TANTARANCHE', '1');
INSERT INTO `distritos` VALUES ('524', '51', '15', '1507', '150721', 'SAN LORENZO DE QUINTI', '1');
INSERT INTO `distritos` VALUES ('525', '51', '15', '1507', '150722', 'SAN MATEO', '1');
INSERT INTO `distritos` VALUES ('526', '51', '15', '1507', '150723', 'SAN MATEO DE OTAO', '1');
INSERT INTO `distritos` VALUES ('527', '51', '15', '1507', '150724', 'SAN PEDRO DE CASTA', '1');
INSERT INTO `distritos` VALUES ('528', '51', '15', '1507', '150725', 'SAN PEDRO DE HUANCAYRE', '1');
INSERT INTO `distritos` VALUES ('529', '51', '15', '1507', '150726', 'SANGALLAYA', '1');
INSERT INTO `distritos` VALUES ('530', '51', '15', '1507', '150727', 'SANTA CRUZ DE COCACHACRA', '1');
INSERT INTO `distritos` VALUES ('531', '51', '15', '1507', '150728', 'SANTA EULALIA', '1');
INSERT INTO `distritos` VALUES ('532', '51', '15', '1507', '150729', 'SANTIAGO DE ANCHUCAYA', '1');
INSERT INTO `distritos` VALUES ('533', '51', '15', '1507', '150730', 'SANTIAGO DE TUNA', '1');
INSERT INTO `distritos` VALUES ('534', '51', '15', '1507', '150731', 'SANTO DOMINGO DE LOS OLLEROS', '1');
INSERT INTO `distritos` VALUES ('535', '51', '15', '1507', '150732', 'SAN JERONIMO DE SURCO', '1');
INSERT INTO `distritos` VALUES ('536', '51', '05', '0501', '050101', 'ACOCRO', '1');
INSERT INTO `distritos` VALUES ('537', '51', '05', '0501', '050102', 'ACOS VINCHOS', '1');
INSERT INTO `distritos` VALUES ('538', '51', '05', '0501', '050103', 'ANDRES AVELINO CACERES DORREGARAY', '1');
INSERT INTO `distritos` VALUES ('539', '51', '05', '0501', '050104', 'AYACUCHO', '1');
INSERT INTO `distritos` VALUES ('540', '51', '05', '0501', '050105', 'CARMEN ALTO', '1');
INSERT INTO `distritos` VALUES ('541', '51', '05', '0501', '050106', 'CHIARA', '1');
INSERT INTO `distritos` VALUES ('542', '51', '05', '0501', '050107', 'JESUS NAZARENO', '1');
INSERT INTO `distritos` VALUES ('543', '51', '05', '0501', '050108', 'OCROS', '1');
INSERT INTO `distritos` VALUES ('544', '51', '05', '0501', '050109', 'PACAYCASA', '1');
INSERT INTO `distritos` VALUES ('545', '51', '05', '0501', '050110', 'QUINUA', '1');
INSERT INTO `distritos` VALUES ('546', '51', '05', '0501', '050111', 'SAN JOSE DE TICLLAS', '1');
INSERT INTO `distritos` VALUES ('547', '51', '05', '0501', '050112', 'SAN JUAN BAUTISTA', '1');
INSERT INTO `distritos` VALUES ('549', '51', '04', '0402', '040201', 'CAMANA ', '1');
INSERT INTO `distritos` VALUES ('558', '51', '04', '0402', '040202', 'JOSE MARIA QUIMPER', '1');
INSERT INTO `distritos` VALUES ('559', '51', '04', '0402', '040203', 'MARIANO NICOLAS VALCARCEL ', '1');
INSERT INTO `distritos` VALUES ('560', '51', '04', '0402', '040204', 'MARISCAL CACERES ', '1');
INSERT INTO `distritos` VALUES ('561', '51', '04', '0402', '040205', 'NICOLAS DE PIEROLA ', '1');
INSERT INTO `distritos` VALUES ('562', '51', '04', '0402', '040206', 'OCONA ', '1');
INSERT INTO `distritos` VALUES ('563', '51', '04', '0402', '040207', 'QUILCA ', '1');
INSERT INTO `distritos` VALUES ('564', '51', '04', '0402', '040208', 'SAMUEL PASTOR', '1');
INSERT INTO `distritos` VALUES ('565', '51', '05', '0501', '050113', 'SANTIAGO DE PISCHA', '1');
INSERT INTO `distritos` VALUES ('566', '51', '05', '0501', '050114', 'SOCOS', '1');
INSERT INTO `distritos` VALUES ('567', '51', '05', '0501', '050115', 'TAMBILLO', '1');
INSERT INTO `distritos` VALUES ('568', '51', '05', '0501', '050116', 'VINCHOS', '1');
INSERT INTO `distritos` VALUES ('569', '51', '04', '0403', '040301', 'CARAVELI ', '1');
INSERT INTO `distritos` VALUES ('570', '51', '04', '0403', '040302', 'ACARI', '1');
INSERT INTO `distritos` VALUES ('571', '51', '04', '0403', '040303', 'ATICO ', '1');
INSERT INTO `distritos` VALUES ('572', '51', '04', '0403', '040304', 'ATIQUIPA ', '1');
INSERT INTO `distritos` VALUES ('573', '51', '04', '0403', '040305', 'BELLA UNION ', '1');
INSERT INTO `distritos` VALUES ('574', '51', '04', '0403', '040306', 'CAHUACHO ', '1');
INSERT INTO `distritos` VALUES ('575', '51', '04', '0403', '040307', 'CHALA ', '1');
INSERT INTO `distritos` VALUES ('576', '51', '04', '0403', '040308', 'CHAPARRA ', '1');
INSERT INTO `distritos` VALUES ('577', '51', '04', '0403', '040309', 'HUANUHUANU ', '1');
INSERT INTO `distritos` VALUES ('578', '51', '04', '0403', '040310', 'JAQUI ', '1');
INSERT INTO `distritos` VALUES ('579', '51', '04', '0403', '040311', 'LOMAS ', '1');
INSERT INTO `distritos` VALUES ('580', '51', '04', '0403', '040312', 'QUICACHA', '1');
INSERT INTO `distritos` VALUES ('581', '51', '04', '0403', '040313', 'YAUCA ', '1');
INSERT INTO `distritos` VALUES ('582', '51', '05', '0502', '050201', 'CANGALLO', '1');
INSERT INTO `distritos` VALUES ('583', '51', '05', '0502', '050202', 'CHUSCHI', '1');
INSERT INTO `distritos` VALUES ('585', '51', '05', '0502', '050203', 'LOS MOROCHUCOS', '1');
INSERT INTO `distritos` VALUES ('586', '51', '05', '0502', '050204', 'MARIA PARADO DE BELLIDO', '1');
INSERT INTO `distritos` VALUES ('587', '51', '05', '0502', '050205', 'PARAS', '1');
INSERT INTO `distritos` VALUES ('588', '51', '05', '0502', '050206', 'TOTOS', '1');
INSERT INTO `distritos` VALUES ('589', '51', '04', '0404', '040401', 'APLAO ', '1');
INSERT INTO `distritos` VALUES ('590', '51', '04', '0404', '040402', 'ANDAHUA ', '1');
INSERT INTO `distritos` VALUES ('591', '51', '04', '0404', '040403', 'AYO ', '1');
INSERT INTO `distritos` VALUES ('592', '51', '04', '0404', '040404', 'CHACHAS ', '1');
INSERT INTO `distritos` VALUES ('593', '51', '04', '0404', '040405', 'CHILCAYMARCA', '1');
INSERT INTO `distritos` VALUES ('594', '51', '04', '0404', '040406', 'CHOCO ', '1');
INSERT INTO `distritos` VALUES ('595', '51', '04', '0404', '040407', 'HUANCARQUI ', '1');
INSERT INTO `distritos` VALUES ('596', '51', '04', '0404', '040408', 'MACHAGUAY ', '1');
INSERT INTO `distritos` VALUES ('597', '51', '04', '0404', '040409', 'ORCOPAMPA ', '1');
INSERT INTO `distritos` VALUES ('598', '51', '04', '0404', '040410', 'PAMPACOLCA ', '1');
INSERT INTO `distritos` VALUES ('599', '51', '04', '0404', '040411', 'TIPAN ', '1');
INSERT INTO `distritos` VALUES ('600', '51', '04', '0404', '040412', 'UNON ', '1');
INSERT INTO `distritos` VALUES ('601', '51', '04', '0404', '040413', 'URACA ', '1');
INSERT INTO `distritos` VALUES ('602', '51', '04', '0404', '040414', 'VIRACO ', '1');
INSERT INTO `distritos` VALUES ('603', '51', '04', '0405', '040501', 'ACHOMA ', '1');
INSERT INTO `distritos` VALUES ('604', '51', '04', '0405', '040502', 'CABANACONDE ', '1');
INSERT INTO `distritos` VALUES ('605', '51', '04', '0405', '040503', 'CALLALLI ', '1');
INSERT INTO `distritos` VALUES ('606', '51', '04', '0405', '040504', 'CAYLLOMA', '1');
INSERT INTO `distritos` VALUES ('607', '51', '04', '0405', '040505', 'CHIVAY', '1');
INSERT INTO `distritos` VALUES ('608', '51', '04', '0405', '040506', 'COPORAQUE ', '1');
INSERT INTO `distritos` VALUES ('609', '51', '04', '0405', '040507', 'HUAMBO ', '1');
INSERT INTO `distritos` VALUES ('610', '51', '04', '0405', '040508', 'HUANCA ', '1');
INSERT INTO `distritos` VALUES ('611', '51', '04', '0405', '040509', 'ICHUPAMPA ', '1');
INSERT INTO `distritos` VALUES ('612', '51', '04', '0405', '040510', 'LARI ', '1');
INSERT INTO `distritos` VALUES ('613', '51', '04', '0405', '040511', 'LLUTA', '1');
INSERT INTO `distritos` VALUES ('614', '51', '04', '0405', '040512', 'MACA', '1');
INSERT INTO `distritos` VALUES ('615', '51', '04', '0405', '040513', 'MADRIGAL', '1');
INSERT INTO `distritos` VALUES ('616', '51', '04', '0405', '040514', 'MAJES', '1');
INSERT INTO `distritos` VALUES ('617', '51', '04', '0405', '040515', 'SAN ANTONIO DE CHUCA ', '1');
INSERT INTO `distritos` VALUES ('618', '51', '04', '0405', '040516', 'SIBAYO ', '1');
INSERT INTO `distritos` VALUES ('619', '51', '04', '0405', '040517', 'TAPAY ', '1');
INSERT INTO `distritos` VALUES ('620', '51', '04', '0405', '040518', 'TISCO ', '1');
INSERT INTO `distritos` VALUES ('621', '51', '04', '0405', '040519', 'TUTI ', '1');
INSERT INTO `distritos` VALUES ('622', '51', '04', '0405', '040520', 'YANQUE ', '1');
INSERT INTO `distritos` VALUES ('623', '51', '05', '0504', '050401', 'HUANTA', '1');
INSERT INTO `distritos` VALUES ('624', '51', '05', '0504', '050402', 'AYAHUANCO', '1');
INSERT INTO `distritos` VALUES ('625', '51', '05', '0504', '050403', 'HUAMANGUILLA', '1');
INSERT INTO `distritos` VALUES ('626', '51', '05', '0504', '050404', 'IGUAIN', '1');
INSERT INTO `distritos` VALUES ('627', '51', '05', '0504', '050405', 'LLOCHEGUA', '1');
INSERT INTO `distritos` VALUES ('628', '51', '05', '0504', '050406', 'LURICOCHA', '1');
INSERT INTO `distritos` VALUES ('629', '51', '05', '0504', '050407', 'SANTILLANA ', '1');
INSERT INTO `distritos` VALUES ('630', '51', '05', '0504', '050408', 'SIVIA', '1');
INSERT INTO `distritos` VALUES ('631', '51', '05', '0504', '050409', 'CANAYRE', '1');
INSERT INTO `distritos` VALUES ('632', '51', '05', '0504', '050410', 'UCHURACCAY', '1');
INSERT INTO `distritos` VALUES ('633', '51', '05', '0504', '050411', 'PUCACOLPA', '1');
INSERT INTO `distritos` VALUES ('634', '51', '05', '0504', '0504012', 'CHACA', '1');
INSERT INTO `distritos` VALUES ('635', '51', '04', '0406', '040601', 'CHUQUIBAMBA', '1');
INSERT INTO `distritos` VALUES ('636', '51', '04', '0406', '040602', 'ANDARAY ', '1');
INSERT INTO `distritos` VALUES ('637', '51', '04', '0406', '040603', 'CAYARANI ', '1');
INSERT INTO `distritos` VALUES ('638', '51', '04', '0406', '040604', 'CHICHAS ', '1');
INSERT INTO `distritos` VALUES ('639', '51', '04', '0406', '040605', 'IRAY ', '1');
INSERT INTO `distritos` VALUES ('640', '51', '04', '0406', '040606', 'RIO GRANDE ', '1');
INSERT INTO `distritos` VALUES ('641', '51', '04', '0406', '040607', 'SALAMANCA', '1');
INSERT INTO `distritos` VALUES ('642', '51', '04', '0406', '040608', 'YANAQUIHUA', '1');
INSERT INTO `distritos` VALUES ('643', '51', '04', '0407', '040701', 'MOLLENDO', '1');
INSERT INTO `distritos` VALUES ('644', '51', '04', '0407', '040702', 'COCACHACRA', '1');
INSERT INTO `distritos` VALUES ('645', '51', '04', '0407', '040703', 'DEAN VALDIVIA', '1');
INSERT INTO `distritos` VALUES ('646', '51', '04', '0407', '040704', 'ISLAY', '1');
INSERT INTO `distritos` VALUES ('647', '51', '04', '0407', '040705', 'MEJIA', '1');
INSERT INTO `distritos` VALUES ('648', '51', '04', '0407', '040706', 'PUNTA DE BOMBON', '1');
INSERT INTO `distritos` VALUES ('649', '51', '04', '0408', '040801', 'ALCA', '1');
INSERT INTO `distritos` VALUES ('650', '51', '04', '0408', '040802', 'CHARCANA', '1');
INSERT INTO `distritos` VALUES ('651', '51', '04', '0408', '040803', 'COTAHUASI', '1');
INSERT INTO `distritos` VALUES ('652', '51', '04', '0408', '040804', 'HUAYNACOTAS', '1');
INSERT INTO `distritos` VALUES ('653', '51', '04', '0408', '040805', 'PAMPAMARCA', '1');
INSERT INTO `distritos` VALUES ('654', '51', '04', '0408', '040806', 'PUYCA', '1');
INSERT INTO `distritos` VALUES ('655', '51', '04', '0408', '040807', 'QUECHUALLA', '1');
INSERT INTO `distritos` VALUES ('656', '51', '04', '0408', '040808', 'SAYLA', '1');
INSERT INTO `distritos` VALUES ('657', '51', '04', '0408', '040809', 'TAURIA', '1');
INSERT INTO `distritos` VALUES ('658', '51', '04', '0408', '040810', 'TOMEPAMPA', '1');
INSERT INTO `distritos` VALUES ('659', '51', '04', '0408', '040811', 'TORO', '1');
INSERT INTO `distritos` VALUES ('660', '51', '05', '0505', '050501', 'SAN MIGUEL', '1');
INSERT INTO `distritos` VALUES ('661', '51', '05', '0505', '050502', 'ANCO', '1');
INSERT INTO `distritos` VALUES ('662', '51', '05', '0505', '050503', 'AYNA', '1');
INSERT INTO `distritos` VALUES ('663', '51', '05', '0505', '050504', 'CHILCAS', '1');
INSERT INTO `distritos` VALUES ('664', '51', '05', '0505', '050505', 'CHUNGUI', '1');
INSERT INTO `distritos` VALUES ('665', '51', '05', '0505', '050506', 'LUIS CARRANZA', '1');
INSERT INTO `distritos` VALUES ('666', '51', '05', '0505', '050507', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('667', '51', '05', '0505', '050508', 'TAMBO', '1');
INSERT INTO `distritos` VALUES ('668', '51', '05', '0505', '050509', 'SAMUGARI', '1');
INSERT INTO `distritos` VALUES ('669', '51', '05', '0505', '050510', 'ANCHIHUAY', '1');
INSERT INTO `distritos` VALUES ('670', '51', '05', '0505', '050511', 'ORONCCOY', '1');
INSERT INTO `distritos` VALUES ('671', '51', '06', '0601', '060101', 'CAJAMARCA', '1');
INSERT INTO `distritos` VALUES ('672', '51', '06', '0601', '060102', 'ASUNCION', '1');
INSERT INTO `distritos` VALUES ('673', '51', '06', '0601', '060103', 'CHETILLA', '1');
INSERT INTO `distritos` VALUES ('674', '51', '06', '0601', '060104', 'COSPAN', '1');
INSERT INTO `distritos` VALUES ('675', '51', '06', '0601', '060105', 'JESUS', '1');
INSERT INTO `distritos` VALUES ('676', '51', '06', '0601', '060106', 'LLACANORA', '1');
INSERT INTO `distritos` VALUES ('677', '51', '06', '0601', '060107', 'LA ENCANADA', '1');
INSERT INTO `distritos` VALUES ('678', '51', '06', '0601', '060108', 'LOS BANOS DEL INCA', '1');
INSERT INTO `distritos` VALUES ('679', '51', '06', '0601', '060109', 'MAGDALENA', '1');
INSERT INTO `distritos` VALUES ('680', '51', '06', '0601', '060110', 'MATARA', '1');
INSERT INTO `distritos` VALUES ('681', '51', '06', '0601', '060111', 'NAMORA', '1');
INSERT INTO `distritos` VALUES ('682', '51', '06', '0601', '060112', 'SAN JUAN', '1');
INSERT INTO `distritos` VALUES ('683', '51', '06', '0602', '060201', 'CAJABAMBA', '1');
INSERT INTO `distritos` VALUES ('684', '51', '06', '0602', '060202', 'CACHACHI', '1');
INSERT INTO `distritos` VALUES ('685', '51', '06', '0602', '060203', 'CONDEBAMBA', '1');
INSERT INTO `distritos` VALUES ('686', '51', '06', '0602', '060204', 'SITACOCHA', '1');
INSERT INTO `distritos` VALUES ('687', '51', '06', '0603', '060301', 'CELENDIN', '1');
INSERT INTO `distritos` VALUES ('688', '51', '06', '0603', '060302', 'CHUMUCH', '1');
INSERT INTO `distritos` VALUES ('689', '51', '06', '0603', '060303', 'CORTEGANA', '1');
INSERT INTO `distritos` VALUES ('690', '51', '06', '0603', '060304', 'HUASMIN', '1');
INSERT INTO `distritos` VALUES ('691', '51', '06', '0603', '060305', 'JORGE CHAVEZ', '1');
INSERT INTO `distritos` VALUES ('692', '51', '06', '0603', '060306', 'JOSE GALVEZ', '1');
INSERT INTO `distritos` VALUES ('693', '51', '06', '0603', '060307', 'LA LIBERTAD DE PALLAN', '1');
INSERT INTO `distritos` VALUES ('694', '51', '06', '0603', '060308', 'MIGUEL IGLESIAS', '1');
INSERT INTO `distritos` VALUES ('695', '51', '06', '0603', '060309', 'OXAMARCA', '1');
INSERT INTO `distritos` VALUES ('696', '51', '06', '0603', '060310', 'SOROCHUCO', '1');
INSERT INTO `distritos` VALUES ('697', '51', '06', '0603', '060311', 'SUCRE', '1');
INSERT INTO `distritos` VALUES ('698', '51', '06', '0603', '060312', 'UTCO', '1');
INSERT INTO `distritos` VALUES ('699', '51', '06', '0604', '060401', 'CHOTA', '1');
INSERT INTO `distritos` VALUES ('700', '51', '06', '0604', '060402', 'ANGUIA', '1');
INSERT INTO `distritos` VALUES ('701', '51', '06', '0604', '060403', 'CHADIN', '1');
INSERT INTO `distritos` VALUES ('702', '51', '06', '0604', '060404', 'CHALAMARCA', '1');
INSERT INTO `distritos` VALUES ('703', '51', '06', '0604', '060405', 'CHIGUIRIP', '1');
INSERT INTO `distritos` VALUES ('704', '51', '06', '0604', '060406', 'CHIMBAN', '1');
INSERT INTO `distritos` VALUES ('705', '51', '06', '0604', '060407', 'CHOROPAMPA', '1');
INSERT INTO `distritos` VALUES ('706', '51', '06', '0604', '060408', 'COCHABAMBA', '1');
INSERT INTO `distritos` VALUES ('707', '51', '06', '0604', '060409', 'CONCHAN', '1');
INSERT INTO `distritos` VALUES ('708', '51', '06', '0604', '060410', 'HUAMBOS', '1');
INSERT INTO `distritos` VALUES ('709', '51', '06', '0604', '060411', 'LAJAS', '1');
INSERT INTO `distritos` VALUES ('710', '51', '06', '0604', '060412', 'LLAMA', '1');
INSERT INTO `distritos` VALUES ('711', '51', '06', '0604', '060413', 'MIRACOSTA', '1');
INSERT INTO `distritos` VALUES ('712', '51', '06', '0604', '060414', 'PACCHA', '1');
INSERT INTO `distritos` VALUES ('713', '51', '06', '0604', '060415', 'PION', '1');
INSERT INTO `distritos` VALUES ('714', '51', '06', '0604', '060416', 'QUEROCOTO', '1');
INSERT INTO `distritos` VALUES ('715', '51', '06', '0604', '060417', 'SAN JUAN DE LICUPIS', '1');
INSERT INTO `distritos` VALUES ('716', '51', '06', '0604', '060418', 'TACABAMBA', '1');
INSERT INTO `distritos` VALUES ('717', '51', '06', '0604', '060419', 'TOCMOCHE', '1');
INSERT INTO `distritos` VALUES ('718', '51', '05', '0506', '050601', 'PUQUIO', '1');
INSERT INTO `distritos` VALUES ('719', '51', '05', '0506', '050602', 'AUCARA', '1');
INSERT INTO `distritos` VALUES ('720', '51', '05', '0506', '050603', 'CABANA SUR', '1');
INSERT INTO `distritos` VALUES ('721', '51', '05', '0506', '050604', 'CARMEN SALCEDO', '1');
INSERT INTO `distritos` VALUES ('722', '51', '05', '0506', '050605', 'CHAVINA', '1');
INSERT INTO `distritos` VALUES ('723', '51', '05', '0506', '050606', 'CHIPAO', '1');
INSERT INTO `distritos` VALUES ('724', '51', '05', '0506', '050607', 'HUACUAS', '1');
INSERT INTO `distritos` VALUES ('725', '51', '05', '0506', '050608', 'LARAMATE', '1');
INSERT INTO `distritos` VALUES ('726', '51', '05', '0506', '050609', 'LEONCIO PRADO', '1');
INSERT INTO `distritos` VALUES ('727', '51', '05', '0506', '050610', 'LLAUTA', '1');
INSERT INTO `distritos` VALUES ('728', '51', '05', '0506', '050611', 'LUCANAS', '1');
INSERT INTO `distritos` VALUES ('729', '51', '05', '0506', '050612', 'OCANA', '1');
INSERT INTO `distritos` VALUES ('730', '51', '05', '0506', '050613', 'OTOCA', '1');
INSERT INTO `distritos` VALUES ('731', '51', '05', '0506', '050614', 'SAISA', '1');
INSERT INTO `distritos` VALUES ('732', '51', '05', '0506', '050615', 'SAN CRISTOBAL', '1');
INSERT INTO `distritos` VALUES ('733', '51', '05', '0506', '050616', 'SAN JUAN', '1');
INSERT INTO `distritos` VALUES ('734', '51', '05', '0506', '050617', 'SAN PEDRO', '1');
INSERT INTO `distritos` VALUES ('735', '51', '05', '0506', '050618', 'SAN PEDRO DE PALCO', '1');
INSERT INTO `distritos` VALUES ('736', '51', '05', '0506', '050619', 'SANCOS', '1');
INSERT INTO `distritos` VALUES ('737', '51', '05', '0506', '050620', 'SANTA ANA DE HUAYCAHUACHO', '1');
INSERT INTO `distritos` VALUES ('738', '51', '05', '0506', '050621', 'SANTA LUCIA', '1');
INSERT INTO `distritos` VALUES ('739', '51', '06', '0605', '060501', 'CONTUMAZA', '1');
INSERT INTO `distritos` VALUES ('740', '51', '06', '0605', '060502', 'CHILETE', '1');
INSERT INTO `distritos` VALUES ('741', '51', '06', '0605', '060503', 'CUPISNIQUE', '1');
INSERT INTO `distritos` VALUES ('742', '51', '06', '0605', '060504', 'GUZMANGO', '1');
INSERT INTO `distritos` VALUES ('743', '51', '06', '0605', '060505', 'SAN BENITO', '1');
INSERT INTO `distritos` VALUES ('744', '51', '06', '0605', '060506', 'SANTA CRUZ DE TOLEDO', '1');
INSERT INTO `distritos` VALUES ('745', '51', '06', '0605', '060507', 'TANTARICA', '1');
INSERT INTO `distritos` VALUES ('746', '51', '06', '0605', '060508', 'YONAN', '1');
INSERT INTO `distritos` VALUES ('747', '51', '06', '0606', '060601', 'CUTERVO', '1');
INSERT INTO `distritos` VALUES ('748', '51', '06', '0606', '060602', 'CALLAYUC', '1');
INSERT INTO `distritos` VALUES ('749', '51', '06', '0606', '060603', 'CHOROS', '1');
INSERT INTO `distritos` VALUES ('750', '51', '06', '0606', '060604', 'CUJILLO', '1');
INSERT INTO `distritos` VALUES ('751', '51', '06', '0606', '060605', 'LA RAMADA', '1');
INSERT INTO `distritos` VALUES ('752', '51', '06', '0606', '060606', 'PIMPINGOS', '1');
INSERT INTO `distritos` VALUES ('753', '51', '06', '0606', '060607', 'QUEROCOTILLO', '1');
INSERT INTO `distritos` VALUES ('754', '51', '06', '0606', '060608', 'SAN ANDRES DE CUTERVO', '1');
INSERT INTO `distritos` VALUES ('755', '51', '06', '0606', '060609', 'SAN JUAN DE CUTERVO', '1');
INSERT INTO `distritos` VALUES ('756', '51', '06', '0606', '060610', 'SAN LUIS DE LUCMA', '1');
INSERT INTO `distritos` VALUES ('757', '51', '06', '0606', '060611', 'SANTA CRUZ', '1');
INSERT INTO `distritos` VALUES ('758', '51', '06', '0606', '060612', 'SANTO DOMINGO DE LA CAPILLA', '1');
INSERT INTO `distritos` VALUES ('759', '51', '06', '0606', '060613', 'SANTO TOMAS', '1');
INSERT INTO `distritos` VALUES ('760', '51', '06', '0606', '060614', 'SOCOTA', '1');
INSERT INTO `distritos` VALUES ('761', '51', '06', '0606', '060615', 'TORIBIO CASANOVA', '1');
INSERT INTO `distritos` VALUES ('762', '51', '05', '0507', '050701', 'CORACORA', '1');
INSERT INTO `distritos` VALUES ('763', '51', '05', '0507', '050702', 'CHUMPI', '1');
INSERT INTO `distritos` VALUES ('764', '51', '05', '0507', '050703', 'CORONEL CASTANEDA', '1');
INSERT INTO `distritos` VALUES ('765', '51', '05', '0507', '050704', 'PACAPAUSA', '1');
INSERT INTO `distritos` VALUES ('766', '51', '05', '0507', '050705', 'PULLO', '1');
INSERT INTO `distritos` VALUES ('767', '51', '05', '0507', '050706', 'PUYUSCA', '1');
INSERT INTO `distritos` VALUES ('768', '51', '05', '0507', '050707', 'SAN FRANCISCO DE RAVACAYCO', '1');
INSERT INTO `distritos` VALUES ('769', '51', '05', '0507', '050708', 'UPAHUACHO', '1');
INSERT INTO `distritos` VALUES ('770', '51', '06', '0607', '060701', 'BAMBAMARCA', '1');
INSERT INTO `distritos` VALUES ('771', '51', '06', '0607', '060702', 'CHUGUR', '1');
INSERT INTO `distritos` VALUES ('772', '51', '06', '0607', '060703', 'HUALGAYOC', '1');
INSERT INTO `distritos` VALUES ('773', '51', '06', '0608', '060801', 'JAEN', '1');
INSERT INTO `distritos` VALUES ('774', '51', '06', '0608', '060802', 'BELLAVISTA', '1');
INSERT INTO `distritos` VALUES ('775', '51', '06', '0608', '060803', 'CHONTALI', '1');
INSERT INTO `distritos` VALUES ('776', '51', '06', '0608', '060804', 'COLASAY', '1');
INSERT INTO `distritos` VALUES ('777', '51', '06', '0608', '060805', 'HUABAL', '1');
INSERT INTO `distritos` VALUES ('778', '51', '06', '0608', '060806', 'LAS PIRIAS', '1');
INSERT INTO `distritos` VALUES ('779', '51', '06', '0608', '060807', 'POMAHUACA', '1');
INSERT INTO `distritos` VALUES ('780', '51', '06', '0608', '060808', 'PUCARA', '1');
INSERT INTO `distritos` VALUES ('781', '51', '06', '0608', '060809', 'SALLIQUE', '1');
INSERT INTO `distritos` VALUES ('782', '51', '06', '0608', '060810', 'SAN FELIPE', '1');
INSERT INTO `distritos` VALUES ('783', '51', '06', '0608', '060811', 'SAN JOSE DEL ALTO', '1');
INSERT INTO `distritos` VALUES ('784', '51', '06', '0608', '060812', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('785', '51', '06', '0609', '060901', 'SAN IGNACIO', '1');
INSERT INTO `distritos` VALUES ('786', '51', '06', '0609', '060902', 'CHIRINOS', '1');
INSERT INTO `distritos` VALUES ('787', '51', '06', '0609', '060903', 'HUARANGO', '1');
INSERT INTO `distritos` VALUES ('788', '51', '06', '0609', '060904', 'LA COIPA', '1');
INSERT INTO `distritos` VALUES ('789', '51', '06', '0609', '060905', 'NAMBALLE', '1');
INSERT INTO `distritos` VALUES ('790', '51', '06', '0609', '060906', 'SAN JOSE DE LOURDES', '1');
INSERT INTO `distritos` VALUES ('791', '51', '06', '0609', '060907', 'TABACONAS', '1');
INSERT INTO `distritos` VALUES ('792', '51', '05', '0508', '050801', 'PAUZA', '1');
INSERT INTO `distritos` VALUES ('794', '51', '05', '0508', '050802', 'COLTA', '1');
INSERT INTO `distritos` VALUES ('795', '51', '05', '0508', '050803', 'CORCULLA', '1');
INSERT INTO `distritos` VALUES ('796', '51', '05', '0508', '050804', 'LAMPA', '1');
INSERT INTO `distritos` VALUES ('797', '51', '05', '0508', '050805', 'MARCABAMBA', '1');
INSERT INTO `distritos` VALUES ('798', '51', '05', '0508', '050806', 'OYOLO', '1');
INSERT INTO `distritos` VALUES ('799', '51', '05', '0508', '050807', 'PARARCA', '1');
INSERT INTO `distritos` VALUES ('800', '51', '05', '0508', '050808', 'SAN JAVIER DE ALPABAMBA', '1');
INSERT INTO `distritos` VALUES ('801', '51', '05', '0508', '050809', 'SAN JOSE DE USHUA', '1');
INSERT INTO `distritos` VALUES ('802', '51', '05', '0508', '050810', 'SARA SARA', '1');
INSERT INTO `distritos` VALUES ('803', '51', '06', '0610', '061001', 'PEDRO GALVEZ', '1');
INSERT INTO `distritos` VALUES ('804', '51', '06', '0610', '061002', 'CHANCAY', '1');
INSERT INTO `distritos` VALUES ('805', '51', '06', '0610', '061003', 'EDUARDO VILLANUEVA', '1');
INSERT INTO `distritos` VALUES ('806', '51', '06', '0610', '061004', 'GREGORIO PITA', '1');
INSERT INTO `distritos` VALUES ('807', '51', '06', '0610', '061005', 'ICHOCAN', '1');
INSERT INTO `distritos` VALUES ('808', '51', '06', '0610', '061006', 'JOSE MANUEL QUIROZ', '1');
INSERT INTO `distritos` VALUES ('809', '51', '06', '0610', '061007', 'JOSE SABOGAL', '1');
INSERT INTO `distritos` VALUES ('810', '51', '06', '0611', '061101', 'SAN MIGUEL', '1');
INSERT INTO `distritos` VALUES ('811', '51', '06', '0611', '061102', 'BOLIVAR', '1');
INSERT INTO `distritos` VALUES ('812', '51', '06', '0611', '061103', 'CALQUIS', '1');
INSERT INTO `distritos` VALUES ('813', '51', '06', '0611', '061104', 'CATILLUC', '1');
INSERT INTO `distritos` VALUES ('814', '51', '06', '0611', '061105', 'EL PRADO', '1');
INSERT INTO `distritos` VALUES ('815', '51', '06', '0611', '061106', 'LA FLORIDA', '1');
INSERT INTO `distritos` VALUES ('816', '51', '06', '0611', '061107', 'LLAPA', '1');
INSERT INTO `distritos` VALUES ('817', '51', '06', '0611', '061108', 'NANCHOC', '1');
INSERT INTO `distritos` VALUES ('818', '51', '06', '0611', '061109', 'NIEPOS', '1');
INSERT INTO `distritos` VALUES ('819', '51', '06', '0611', '061110', 'SAN GREGORIO', '1');
INSERT INTO `distritos` VALUES ('820', '51', '06', '0611', '061111', 'SAN SILVESTRE DE CONCHAN', '1');
INSERT INTO `distritos` VALUES ('821', '51', '06', '0611', '061112', 'TONGOD', '1');
INSERT INTO `distritos` VALUES ('822', '51', '06', '0611', '061113', 'UNION AGUA BLANCA', '1');
INSERT INTO `distritos` VALUES ('823', '51', '06', '0612', '061201', 'SAN PABLO', '1');
INSERT INTO `distritos` VALUES ('824', '51', '06', '0612', '061202', 'SAN BERNARDINO', '1');
INSERT INTO `distritos` VALUES ('825', '51', '06', '0612', '061203', 'SAN LUIS', '1');
INSERT INTO `distritos` VALUES ('826', '51', '06', '0612', '061204', 'TUMBADEN', '1');
INSERT INTO `distritos` VALUES ('827', '51', '05', '0509', '050901', 'QUEROBAMBA', '1');
INSERT INTO `distritos` VALUES ('828', '51', '05', '0509', '050902', 'BELEN', '1');
INSERT INTO `distritos` VALUES ('829', '51', '05', '0509', '050903', 'CHALCOS', '1');
INSERT INTO `distritos` VALUES ('830', '51', '05', '0509', '050904', 'CHILCAYOC', '1');
INSERT INTO `distritos` VALUES ('831', '51', '05', '0509', '050905', 'HUACANA', '1');
INSERT INTO `distritos` VALUES ('832', '51', '05', '0509', '050906', 'MORCOLLA', '1');
INSERT INTO `distritos` VALUES ('833', '51', '05', '0509', '050907', 'PAICO', '1');
INSERT INTO `distritos` VALUES ('834', '51', '05', '0509', '050908', 'SAN PEDRO DE LARCAY', '1');
INSERT INTO `distritos` VALUES ('835', '51', '05', '0509', '050909', 'SAN SALVADOR DE QUIJE', '1');
INSERT INTO `distritos` VALUES ('836', '51', '05', '0509', '050910', 'SANTIAGO DE PAUCARAY', '1');
INSERT INTO `distritos` VALUES ('837', '51', '05', '0509', '050911', 'SORAS', '1');
INSERT INTO `distritos` VALUES ('838', '51', '06', '0613', '061301', ' SANTA CRUZ ', '1');
INSERT INTO `distritos` VALUES ('839', '51', '06', '0613', '061302', ' ANDABAMBA', '1');
INSERT INTO `distritos` VALUES ('840', '51', '06', '0613', '061303', 'CATACHE ', '1');
INSERT INTO `distritos` VALUES ('841', '51', '06', '0613', '061304', 'CHANCAYBANOS', '1');
INSERT INTO `distritos` VALUES ('842', '51', '06', '0613', '061305', ' LA ESPERANZA ', '1');
INSERT INTO `distritos` VALUES ('843', '51', '06', '0613', '061306', 'NINABAMBA ', '1');
INSERT INTO `distritos` VALUES ('844', '51', '06', '0613', '061307', 'PULAN', '1');
INSERT INTO `distritos` VALUES ('845', '51', '06', '0613', '061308', 'SAUCEPAMPA', '1');
INSERT INTO `distritos` VALUES ('846', '51', '06', '0613', '061309', 'SEXI', '1');
INSERT INTO `distritos` VALUES ('847', '51', '06', '0613', '061310', ' UTICYACU ', '1');
INSERT INTO `distritos` VALUES ('848', '51', '06', '0613', '061311', 'YAUYUCAN ', '1');
INSERT INTO `distritos` VALUES ('849', '51', '07', '0701', '070101', ' CALLAO ', '1');
INSERT INTO `distritos` VALUES ('850', '51', '07', '0701', '070102', 'BELLAVISTA ', '1');
INSERT INTO `distritos` VALUES ('851', '51', '07', '0701', '070103', ' CARMEN DE LA LEGUA ', '1');
INSERT INTO `distritos` VALUES ('852', '51', '07', '0701', '070104', ' LA PERLA ', '1');
INSERT INTO `distritos` VALUES ('853', '51', '07', '0701', '070105', ' LA PUNTA ', '1');
INSERT INTO `distritos` VALUES ('854', '51', '07', '0701', '070106', ' VENTANILLA ', '1');
INSERT INTO `distritos` VALUES ('855', '51', '07', '0701', '070107', ' MI PERU ', '1');
INSERT INTO `distritos` VALUES ('856', '51', '05', '0510', '051001', 'HUANCAPI', '1');
INSERT INTO `distritos` VALUES ('857', '51', '05', '0510', '051002', 'ALCAMENCA', '1');
INSERT INTO `distritos` VALUES ('858', '51', '05', '0510', '051003', 'APONGO', '1');
INSERT INTO `distritos` VALUES ('859', '51', '05', '0510', '051004', 'ASQUIPATA', '1');
INSERT INTO `distritos` VALUES ('860', '51', '05', '0510', '051005', 'CANARIA', '1');
INSERT INTO `distritos` VALUES ('861', '51', '05', '0510', '051006', 'CAYARA', '1');
INSERT INTO `distritos` VALUES ('862', '51', '05', '0510', '051007', 'COLCA', '1');
INSERT INTO `distritos` VALUES ('863', '51', '05', '0510', '051008', 'HUAMANQUIQUIA', '1');
INSERT INTO `distritos` VALUES ('864', '51', '05', '0510', '051009', 'HUANCARAYLLA', '1');
INSERT INTO `distritos` VALUES ('865', '51', '05', '0510', '051010', 'HUAYA', '1');
INSERT INTO `distritos` VALUES ('866', '51', '05', '0510', '051011', 'SARHUA', '1');
INSERT INTO `distritos` VALUES ('867', '51', '05', '0510', '051012', 'VILCANCHOS', '1');
INSERT INTO `distritos` VALUES ('868', '51', '08', '0801', '080101', ' CUZCO ', '1');
INSERT INTO `distritos` VALUES ('869', '51', '08', '0801', '080102', 'CCORCA ', '1');
INSERT INTO `distritos` VALUES ('870', '51', '08', '0801', '080103', ' POROY ', '1');
INSERT INTO `distritos` VALUES ('871', '51', '08', '0801', '080104', ' SAN JERONIMO ', '1');
INSERT INTO `distritos` VALUES ('872', '51', '08', '0801', '080105', ' SAN SEBASTIAN ', '1');
INSERT INTO `distritos` VALUES ('873', '51', '08', '0801', '080106', ' SANTIAGO ', '1');
INSERT INTO `distritos` VALUES ('874', '51', '08', '0801', '080107', 'SAYLLA ', '1');
INSERT INTO `distritos` VALUES ('875', '51', '08', '0801', '080108', ' WANCHAQ ', '1');
INSERT INTO `distritos` VALUES ('876', '51', '08', '0802', '080201', ' ACOMAYO ', '1');
INSERT INTO `distritos` VALUES ('877', '51', '08', '0802', '080202', ' ACOPIA ', '1');
INSERT INTO `distritos` VALUES ('878', '51', '08', '0802', '080203', ' ACOS ', '1');
INSERT INTO `distritos` VALUES ('879', '51', '08', '0802', '080204', ' MOSOC LLACTA ', '1');
INSERT INTO `distritos` VALUES ('880', '51', '08', '0802', '080205', ' POMACANCHI ', '1');
INSERT INTO `distritos` VALUES ('881', '51', '08', '0802', '080206', ' RONDOCAN', '1');
INSERT INTO `distritos` VALUES ('882', '51', '08', '0802', '080207', ' SANGARARA ', '1');
INSERT INTO `distritos` VALUES ('883', '51', '05', '0511', '051101', 'VILCASHUAMAN', '1');
INSERT INTO `distritos` VALUES ('886', '51', '05', '0511', '051102', 'ACCOMARCA', '1');
INSERT INTO `distritos` VALUES ('887', '51', '05', '0511', '051103', 'CARHUANCA', '1');
INSERT INTO `distritos` VALUES ('888', '51', '05', '0511', '051104', 'CONCEPCION', '1');
INSERT INTO `distritos` VALUES ('889', '51', '05', '0511', '051105', 'HUAMBALPA', '1');
INSERT INTO `distritos` VALUES ('890', '51', '05', '0511', '051106', 'INDEPENDENCIA', '1');
INSERT INTO `distritos` VALUES ('891', '51', '05', '0511', '051107', 'SAURAMA', '1');
INSERT INTO `distritos` VALUES ('892', '51', '05', '0511', '051108', 'VISCHONGO', '1');
INSERT INTO `distritos` VALUES ('893', '51', '08', '0803', '080301', ' ANTA', '1');
INSERT INTO `distritos` VALUES ('894', '51', '08', '0803', '080302', ' ANCAHUASI ', '1');
INSERT INTO `distritos` VALUES ('895', '51', '08', '0803', '080303', ' CACHIMAYO ', '1');
INSERT INTO `distritos` VALUES ('896', '51', '08', '0803', '080304', ' CHINCHAYPUJIO ', '1');
INSERT INTO `distritos` VALUES ('897', '51', '08', '0803', '080305', ' HUAROCONDO ', '1');
INSERT INTO `distritos` VALUES ('898', '51', '08', '0803', '080306', ' LIMATAMBO ', '1');
INSERT INTO `distritos` VALUES ('899', '51', '08', '0803', '080307', ' MOLLEPATA ', '1');
INSERT INTO `distritos` VALUES ('900', '51', '08', '0803', '080308', ' PUCYURA ', '1');
INSERT INTO `distritos` VALUES ('901', '51', '08', '0803', '080309', ' ZURITE ', '1');
INSERT INTO `distritos` VALUES ('902', '51', '08', '0804', '080401', 'CALCA', '1');
INSERT INTO `distritos` VALUES ('903', '51', '08', '0804', '080402', 'COYA', '1');
INSERT INTO `distritos` VALUES ('904', '51', '08', '0804', '080403', ' LAMAY', '1');
INSERT INTO `distritos` VALUES ('905', '51', '08', '0804', '080404', 'LARES', '1');
INSERT INTO `distritos` VALUES ('906', '51', '08', '0804', '080405', 'PISAC', '1');
INSERT INTO `distritos` VALUES ('907', '51', '08', '0804', '080406', ' SAN SALVADOR', '1');
INSERT INTO `distritos` VALUES ('908', '51', '08', '0804', '080407', 'TARAY', '1');
INSERT INTO `distritos` VALUES ('909', '51', '08', '0804', '080408', 'YANATILE', '1');
INSERT INTO `distritos` VALUES ('910', '51', '08', '0805', '080501', 'YANAOCA', '1');
INSERT INTO `distritos` VALUES ('911', '51', '08', '0805', '080502', 'CHECCA', '1');
INSERT INTO `distritos` VALUES ('912', '51', '08', '0805', '080503', 'KUNTURKANKI', '1');
INSERT INTO `distritos` VALUES ('913', '51', '08', '0805', '080504', 'LANGUI', '1');
INSERT INTO `distritos` VALUES ('914', '51', '08', '0805', '080505', 'LAYO', '1');
INSERT INTO `distritos` VALUES ('915', '51', '08', '0805', '080506', 'PAMPAMARCA', '1');
INSERT INTO `distritos` VALUES ('916', '51', '08', '0805', '080507', 'QUEHUE', '1');
INSERT INTO `distritos` VALUES ('917', '51', '08', '0805', '080508', 'TUPAC AMARU', '1');
INSERT INTO `distritos` VALUES ('918', '51', '08', '0806', '080601', 'SICUANI', '1');
INSERT INTO `distritos` VALUES ('919', '51', '08', '0806', '080602', 'CHECACUPE', '1');
INSERT INTO `distritos` VALUES ('920', '51', '08', '0806', '080603', 'COMBAPATA', '1');
INSERT INTO `distritos` VALUES ('921', '51', '08', '0806', '080604', 'MARANGANI', '1');
INSERT INTO `distritos` VALUES ('922', '51', '08', '0806', '080605', 'PITUMARCA', '1');
INSERT INTO `distritos` VALUES ('923', '51', '08', '0806', '080606', 'SAN PABLO', '1');
INSERT INTO `distritos` VALUES ('924', '51', '08', '0806', '080607', 'SAN PEDRO', '1');
INSERT INTO `distritos` VALUES ('925', '51', '08', '0806', '080608', 'TINTA', '1');
INSERT INTO `distritos` VALUES ('926', '51', '08', '0807', '080701', 'SANTO TOMAS', '1');
INSERT INTO `distritos` VALUES ('927', '51', '08', '0807', '080702', 'CCAPACMARCA', '1');
INSERT INTO `distritos` VALUES ('928', '51', '08', '0807', '080703', 'CHAMACA', '1');
INSERT INTO `distritos` VALUES ('929', '51', '08', '0807', '080704', 'COLQUEMARCA', '1');
INSERT INTO `distritos` VALUES ('930', '51', '08', '0807', '080705', 'LIVITACA', '1');
INSERT INTO `distritos` VALUES ('931', '51', '08', '0807', '080706', 'LLUSCO', '1');
INSERT INTO `distritos` VALUES ('932', '51', '08', '0807', '080707', 'QUINOTA', '1');
INSERT INTO `distritos` VALUES ('933', '51', '08', '0807', '080708', 'VELILLE', '1');
INSERT INTO `distritos` VALUES ('934', '51', '09', '0901', '090101', 'ACOBAMBILLA', '1');
INSERT INTO `distritos` VALUES ('935', '51', '09', '0901', '090102', 'ACORIA', '1');
INSERT INTO `distritos` VALUES ('936', '51', '09', '0901', '090103', 'ASCENSION', '1');
INSERT INTO `distritos` VALUES ('937', '51', '09', '0901', '090104', 'CONAYCA', '1');
INSERT INTO `distritos` VALUES ('938', '51', '09', '0901', '090105', 'CUENCA', '1');
INSERT INTO `distritos` VALUES ('939', '51', '09', '0901', '090106', 'HUACHOCOLPA', '1');
INSERT INTO `distritos` VALUES ('940', '51', '09', '0901', '090107', 'HUANDO', '1');
INSERT INTO `distritos` VALUES ('941', '51', '09', '0901', '090108', 'HUANCAVELICA', '1');
INSERT INTO `distritos` VALUES ('942', '51', '09', '0901', '090109', 'HUAYLLAHUARA', '1');
INSERT INTO `distritos` VALUES ('943', '51', '09', '0901', '090110', 'IZCUCHACA', '1');
INSERT INTO `distritos` VALUES ('944', '51', '09', '0901', '090111', 'LARIA', '1');
INSERT INTO `distritos` VALUES ('945', '51', '09', '0901', '090112', 'MANTA', '1');
INSERT INTO `distritos` VALUES ('946', '51', '09', '0901', '090113', 'MARISCAL CACERES', '1');
INSERT INTO `distritos` VALUES ('947', '51', '09', '0901', '090114', 'MOYA', '1');
INSERT INTO `distritos` VALUES ('948', '51', '09', '0901', '090115', 'NUEVO OCCORO', '1');
INSERT INTO `distritos` VALUES ('949', '51', '09', '0901', '090116', 'PALCA', '1');
INSERT INTO `distritos` VALUES ('950', '51', '09', '0901', '090117', 'PILCHACA', '1');
INSERT INTO `distritos` VALUES ('951', '51', '09', '0901', '090118', 'VILCA', '1');
INSERT INTO `distritos` VALUES ('952', '51', '09', '0901', '090119', 'YAULI', '1');
INSERT INTO `distritos` VALUES ('953', '51', '08', '0808', '080801', 'YAURI', '1');
INSERT INTO `distritos` VALUES ('954', '51', '08', '0808', '080802', 'CONDOROMA', '1');
INSERT INTO `distritos` VALUES ('955', '51', '08', '0808', '080803', 'COPORAQUE', '1');
INSERT INTO `distritos` VALUES ('956', '51', '08', '0808', '080804', 'OCORURO', '1');
INSERT INTO `distritos` VALUES ('957', '51', '08', '0808', '080805', 'PALLPATA', '1');
INSERT INTO `distritos` VALUES ('958', '51', '08', '0808', '080806', 'PICHIGUA', '1');
INSERT INTO `distritos` VALUES ('959', '51', '08', '0808', '080807', 'SUYCKUTAMBO', '1');
INSERT INTO `distritos` VALUES ('960', '51', '08', '0808', '080808', 'ALTO PICHIGUA', '1');
INSERT INTO `distritos` VALUES ('961', '51', '08', '0809', '080901', 'SANTA ANA', '1');
INSERT INTO `distritos` VALUES ('962', '51', '08', '0809', '080902', 'ECHARATI', '1');
INSERT INTO `distritos` VALUES ('963', '51', '08', '0809', '080903', 'HUAYAPATA', '1');
INSERT INTO `distritos` VALUES ('964', '51', '08', '0809', '080904', 'MARANURA', '1');
INSERT INTO `distritos` VALUES ('965', '51', '08', '0809', '080905', 'OCOBAMBA', '1');
INSERT INTO `distritos` VALUES ('966', '51', '08', '0809', '080906', 'QUELLOUNO', '1');
INSERT INTO `distritos` VALUES ('967', '51', '08', '0809', '080907', 'KIMBIRI', '1');
INSERT INTO `distritos` VALUES ('968', '51', '08', '0809', '080908', 'SANTA TERESA', '1');
INSERT INTO `distritos` VALUES ('969', '51', '08', '0809', '080909', 'VILCABAMBA', '1');
INSERT INTO `distritos` VALUES ('970', '51', '08', '0809', '080910', 'PICHARI', '1');
INSERT INTO `distritos` VALUES ('971', '51', '08', '0809', '080911', 'INKAWASI', '1');
INSERT INTO `distritos` VALUES ('972', '51', '08', '0809', '080912', 'VILLA VIRGEN', '1');
INSERT INTO `distritos` VALUES ('973', '51', '08', '0809', '080913', 'VILLA KINTIARINA', '1');
INSERT INTO `distritos` VALUES ('974', '51', '08', '0809', '080914', 'MEGANTONI', '1');
INSERT INTO `distritos` VALUES ('975', '51', '09', '0902', '090201', 'ACOBAMBA', '1');
INSERT INTO `distritos` VALUES ('977', '51', '09', '0902', '090202', 'ANDABAMBA', '1');
INSERT INTO `distritos` VALUES ('979', '51', '09', '0902', '090203', 'ANTA', '1');
INSERT INTO `distritos` VALUES ('980', '51', '09', '0902', '090204', 'CAJA', '1');
INSERT INTO `distritos` VALUES ('981', '51', '09', '0902', '090205', 'MARCAS', '1');
INSERT INTO `distritos` VALUES ('982', '51', '09', '0902', '090206', 'PAUCARA', '1');
INSERT INTO `distritos` VALUES ('983', '51', '09', '0902', '090207', 'POMACOCHA', '1');
INSERT INTO `distritos` VALUES ('984', '51', '09', '0902', '090208', 'ROSARIO', '1');
INSERT INTO `distritos` VALUES ('985', '51', '08', '0810', '081001', 'PARURO', '1');
INSERT INTO `distritos` VALUES ('986', '51', '08', '0810', '081002', 'ACCHA', '1');
INSERT INTO `distritos` VALUES ('987', '51', '08', '0810', '081003', 'CCAPI', '1');
INSERT INTO `distritos` VALUES ('988', '51', '08', '0810', '081004', 'COLCHA', '1');
INSERT INTO `distritos` VALUES ('989', '51', '08', '0810', '081005', 'HUANOQUITE', '1');
INSERT INTO `distritos` VALUES ('990', '51', '08', '0810', '081006', 'OMACHA', '1');
INSERT INTO `distritos` VALUES ('991', '51', '08', '0810', '081007', 'PACCARITAMBO', '1');
INSERT INTO `distritos` VALUES ('992', '51', '08', '0810', '081008', 'PILLPINTO', '1');
INSERT INTO `distritos` VALUES ('993', '51', '08', '0810', '081009', 'YAURISQUE', '1');
INSERT INTO `distritos` VALUES ('994', '51', '08', '0811', '081101', 'PAUCARTAMBO', '1');
INSERT INTO `distritos` VALUES ('995', '51', '08', '0811', '081102', 'CAICAY', '1');
INSERT INTO `distritos` VALUES ('996', '51', '08', '0811', '081103', 'CHALLABAMBA', '1');
INSERT INTO `distritos` VALUES ('997', '51', '08', '0811', '081104', 'COLQUEPATA', '1');
INSERT INTO `distritos` VALUES ('998', '51', '08', '0811', '081105', 'KOSNIPATA', '1');
INSERT INTO `distritos` VALUES ('999', '51', '08', '0811', '081106', 'HUANCARANI', '1');
INSERT INTO `distritos` VALUES ('1000', '51', '09', '0903', '090301', 'LIRCAY', '1');
INSERT INTO `distritos` VALUES ('1001', '51', '09', '0903', '090302', 'ANCHONGA', '1');
INSERT INTO `distritos` VALUES ('1002', '51', '09', '0903', '090303', 'CALLANMARCA', '1');
INSERT INTO `distritos` VALUES ('1003', '51', '09', '0903', '090304', 'CCOCHACCASA', '1');
INSERT INTO `distritos` VALUES ('1004', '51', '09', '0903', '090305', 'CHINCHO', '1');
INSERT INTO `distritos` VALUES ('1005', '51', '09', '0903', '090306', 'CONGALLA', '1');
INSERT INTO `distritos` VALUES ('1006', '51', '09', '0903', '090307', 'HUANCA HUANCA', '1');
INSERT INTO `distritos` VALUES ('1007', '51', '09', '0903', '090308', 'HUAYLLAY GRANDE', '1');
INSERT INTO `distritos` VALUES ('1008', '51', '09', '0903', '090309', 'JULCAMARCA', '1');
INSERT INTO `distritos` VALUES ('1009', '51', '09', '0903', '090310', 'SAN ANTONIO DE ANTAPARCO', '1');
INSERT INTO `distritos` VALUES ('1010', '51', '09', '0903', '090311', 'SANTO TOMAS DE PATA', '1');
INSERT INTO `distritos` VALUES ('1011', '51', '09', '0903', '090312', 'SECLLA', '1');
INSERT INTO `distritos` VALUES ('1012', '51', '08', '0812', '081201', 'ANDAHUAYLILLAS', '1');
INSERT INTO `distritos` VALUES ('1013', '51', '08', '0812', '081202', 'CAMANTI', '1');
INSERT INTO `distritos` VALUES ('1014', '51', '08', '0812', '081203', 'CCARHUAYO', '1');
INSERT INTO `distritos` VALUES ('1015', '51', '08', '0812', '081204', 'CCATCA', '1');
INSERT INTO `distritos` VALUES ('1016', '51', '08', '0812', '081205', 'CUSIPATA', '1');
INSERT INTO `distritos` VALUES ('1017', '51', '08', '0812', '081206', 'LUCRE', '1');
INSERT INTO `distritos` VALUES ('1018', '51', '08', '0812', '081207', 'MARCAPATA', '1');
INSERT INTO `distritos` VALUES ('1019', '51', '08', '0812', '081208', 'OCONGATE', '1');
INSERT INTO `distritos` VALUES ('1020', '51', '08', '0812', '081209', 'OROPESA', '1');
INSERT INTO `distritos` VALUES ('1021', '51', '08', '0812', '081210', 'QUIQUIJANA', '1');
INSERT INTO `distritos` VALUES ('1022', '51', '08', '0812', '081211', 'URCOS', '1');
INSERT INTO `distritos` VALUES ('1023', '51', '08', '0813', '081301', ' URUBAMBA', '1');
INSERT INTO `distritos` VALUES ('1024', '51', '08', '0813', '081302', 'CHINCHERO', '1');
INSERT INTO `distritos` VALUES ('1025', '51', '08', '0813', '081303', 'HUAYLLABAMBA', '1');
INSERT INTO `distritos` VALUES ('1026', '51', '08', '0813', '081304', 'MACHUPICCHU', '1');
INSERT INTO `distritos` VALUES ('1027', '51', '08', '0813', '081305', 'MARAS', '1');
INSERT INTO `distritos` VALUES ('1028', '51', '08', '0813', '081306', 'OLLANTAYTAMBO', '1');
INSERT INTO `distritos` VALUES ('1029', '51', '08', '0813', '081307', 'YUCAY', '1');
INSERT INTO `distritos` VALUES ('1030', '51', '09', '0904', '090401', 'CASTROVIRREYNA', '1');
INSERT INTO `distritos` VALUES ('1031', '51', '09', '0904', '090402', 'ARMA', '1');
INSERT INTO `distritos` VALUES ('1032', '51', '09', '0904', '090403', 'AURAHUA', '1');
INSERT INTO `distritos` VALUES ('1033', '51', '09', '0904', '090404', 'CAPILLAS', '1');
INSERT INTO `distritos` VALUES ('1034', '51', '09', '0904', '090405', 'CHUPAMARCA', '1');
INSERT INTO `distritos` VALUES ('1035', '51', '09', '0904', '090406', 'COCAS', '1');
INSERT INTO `distritos` VALUES ('1036', '51', '09', '0904', '090407', 'HUACHOS', '1');
INSERT INTO `distritos` VALUES ('1037', '51', '09', '0904', '090408', 'HUAMATAMBO', '1');
INSERT INTO `distritos` VALUES ('1038', '51', '09', '0904', '090409', 'MOLLEPAMPA', '1');
INSERT INTO `distritos` VALUES ('1039', '51', '09', '0904', '090410', 'SAN JUAN', '1');
INSERT INTO `distritos` VALUES ('1040', '51', '09', '0904', '090411', 'SANTA ANA', '1');
INSERT INTO `distritos` VALUES ('1041', '51', '09', '0904', '090412', 'TANTARA', '1');
INSERT INTO `distritos` VALUES ('1042', '51', '09', '0904', '090413', 'TICRAPO', '1');
INSERT INTO `distritos` VALUES ('1043', '51', '10', '1001', '100101', ' HUANUCO', '1');
INSERT INTO `distritos` VALUES ('1044', '51', '10', '1001', '100102', ' AMARILIS', '1');
INSERT INTO `distritos` VALUES ('1045', '51', '10', '1001', '100103', 'CHINCHAO', '1');
INSERT INTO `distritos` VALUES ('1046', '51', '10', '1001', '100104', 'CHURUMBAMBA', '1');
INSERT INTO `distritos` VALUES ('1047', '51', '10', '1001', '100105', 'MARGOS', '1');
INSERT INTO `distritos` VALUES ('1048', '51', '10', '1001', '100106', ' PILLCO MARCA', '1');
INSERT INTO `distritos` VALUES ('1049', '51', '10', '1001', '100107', 'QUISQUI (KICHKI)', '1');
INSERT INTO `distritos` VALUES ('1050', '51', '10', '1001', '100108', 'SAN FRANCISCO DE CAYRAN', '1');
INSERT INTO `distritos` VALUES ('1051', '51', '10', '1001', '100109', 'SAN PEDRO DE CHAULAN', '1');
INSERT INTO `distritos` VALUES ('1052', '51', '10', '1001', '100110', 'SANTA MARIA DEL VALLE', '1');
INSERT INTO `distritos` VALUES ('1053', '51', '10', '1001', '100111', 'YARUMAYO', '1');
INSERT INTO `distritos` VALUES ('1054', '51', '10', '1001', '100112', 'YACUS', '1');
INSERT INTO `distritos` VALUES ('1055', '51', '10', '1001', '100113', 'SAN PABLO DE PILLAO', '1');
INSERT INTO `distritos` VALUES ('1056', '51', '10', '1002', '100201', ' AMBO', '1');
INSERT INTO `distritos` VALUES ('1057', '51', '10', '1002', '100202', ' CAYNA', '1');
INSERT INTO `distritos` VALUES ('1058', '51', '10', '1002', '100203', 'COLPAS', '1');
INSERT INTO `distritos` VALUES ('1059', '51', '10', '1002', '100204', 'CONCHAMARCA', '1');
INSERT INTO `distritos` VALUES ('1060', '51', '10', '1002', '100205', 'HUACAR', '1');
INSERT INTO `distritos` VALUES ('1061', '51', '10', '1002', '100206', ' SAN FRANCISCO', '1');
INSERT INTO `distritos` VALUES ('1062', '51', '10', '1002', '100207', 'SAN RAFAEL', '1');
INSERT INTO `distritos` VALUES ('1063', '51', '10', '1002', '100208', 'TOMAY KICHWA', '1');
INSERT INTO `distritos` VALUES ('1064', '51', '09', '0905', '090501', 'CHURCAMPA', '1');
INSERT INTO `distritos` VALUES ('1065', '51', '09', '0905', '090502', 'ANCO', '1');
INSERT INTO `distritos` VALUES ('1066', '51', '09', '0905', '090503', 'CHINCHIHUASI', '1');
INSERT INTO `distritos` VALUES ('1067', '51', '09', '0905', '090504', 'COSME2', '1');
INSERT INTO `distritos` VALUES ('1068', '51', '09', '0905', '090505', 'EL CARMEN', '1');
INSERT INTO `distritos` VALUES ('1069', '51', '09', '0905', '090506', 'LA MERCED', '1');
INSERT INTO `distritos` VALUES ('1070', '51', '09', '0905', '090507', 'LOCROJA', '1');
INSERT INTO `distritos` VALUES ('1071', '51', '09', '0905', '090508', 'PACHAMARCA', '1');
INSERT INTO `distritos` VALUES ('1072', '51', '09', '0905', '090509', 'PAUCARBAMBA', '1');
INSERT INTO `distritos` VALUES ('1073', '51', '09', '0905', '090510', 'SAN MIGUEL DE MAYOCC', '1');
INSERT INTO `distritos` VALUES ('1074', '51', '09', '0905', '090511', 'SAN PEDRO DE CORIS', '1');
INSERT INTO `distritos` VALUES ('1075', '51', '10', '1003', '100301', ' LA UNION', '1');
INSERT INTO `distritos` VALUES ('1076', '51', '10', '1003', '100302', ' CHUQUIS', '1');
INSERT INTO `distritos` VALUES ('1077', '51', '10', '1003', '100303', 'MARIAS', '1');
INSERT INTO `distritos` VALUES ('1078', '51', '10', '1003', '100304', 'PACHAS', '1');
INSERT INTO `distritos` VALUES ('1079', '51', '10', '1003', '100305', 'QUIVILLA', '1');
INSERT INTO `distritos` VALUES ('1080', '51', '10', '1003', '100306', 'RIPAN', '1');
INSERT INTO `distritos` VALUES ('1081', '51', '10', '1003', '100307', 'SHUNQUI', '1');
INSERT INTO `distritos` VALUES ('1082', '51', '10', '1003', '100308', 'SILLAPATA', '1');
INSERT INTO `distritos` VALUES ('1083', '51', '10', '1003', '100309', 'YANAS', '1');
INSERT INTO `distritos` VALUES ('1084', '51', '10', '1004', '100401', ' HUACAYBAMBA', '1');
INSERT INTO `distritos` VALUES ('1085', '51', '10', '1004', '100402', ' CANCHABAMBA', '1');
INSERT INTO `distritos` VALUES ('1086', '51', '10', '1004', '100403', 'COCHABAMBA', '1');
INSERT INTO `distritos` VALUES ('1087', '51', '10', '1004', '100404', 'PINRA', '1');
INSERT INTO `distritos` VALUES ('1088', '51', '10', '1005', '100501', ' LLATA', '1');
INSERT INTO `distritos` VALUES ('1089', '51', '10', '1005', '100502', ' ARANCAY', '1');
INSERT INTO `distritos` VALUES ('1090', '51', '10', '1005', '100503', 'CHAVIN DE PARIARCA', '1');
INSERT INTO `distritos` VALUES ('1091', '51', '10', '1005', '100504', 'JACAS GRANDE', '1');
INSERT INTO `distritos` VALUES ('1092', '51', '10', '1005', '100505', 'JIRCAN', '1');
INSERT INTO `distritos` VALUES ('1093', '51', '10', '1005', '100506', 'MIRAFLORES', '1');
INSERT INTO `distritos` VALUES ('1094', '51', '10', '1005', '100507', 'MONZON', '1');
INSERT INTO `distritos` VALUES ('1095', '51', '10', '1005', '100508', 'PUNCHAO', '1');
INSERT INTO `distritos` VALUES ('1096', '51', '10', '1005', '100509', 'PUNOS', '1');
INSERT INTO `distritos` VALUES ('1097', '51', '10', '1005', '100510', 'SINGA', '1');
INSERT INTO `distritos` VALUES ('1098', '51', '10', '1005', '100511', 'TANTAMAYO', '1');
INSERT INTO `distritos` VALUES ('1099', '51', '10', '1006', '100601', ' TINGO MARIA', '1');
INSERT INTO `distritos` VALUES ('1100', '51', '10', '1006', '100602', 'DANIEL ALOMIA ROBLES', '1');
INSERT INTO `distritos` VALUES ('1101', '51', '10', '1006', '100603', 'HERMILIO VALDIZAN', '1');
INSERT INTO `distritos` VALUES ('1102', '51', '10', '1006', '100604', 'JOSE CRESPO Y CASTILLO', '1');
INSERT INTO `distritos` VALUES ('1103', '51', '10', '1006', '100605', 'LUYANDO', '1');
INSERT INTO `distritos` VALUES ('1104', '51', '10', '1006', '100606', 'MARIANO DAMASO BERAUN', '1');
INSERT INTO `distritos` VALUES ('1105', '51', '10', '1006', '100607', 'PUCAYACU', '1');
INSERT INTO `distritos` VALUES ('1106', '51', '10', '1006', '100608', 'CASTILLO GRANDE', '1');
INSERT INTO `distritos` VALUES ('1107', '51', '10', '1006', '100609', 'PUEBLO NUEVO', '1');
INSERT INTO `distritos` VALUES ('1108', '51', '10', '1006', '100610', 'SANTO DOMINGO DE ANDA', '1');
INSERT INTO `distritos` VALUES ('1109', '51', '09', '0906', '090601', 'HUAYTARA', '1');
INSERT INTO `distritos` VALUES ('1111', '51', '09', '0906', '090602', 'AYAVI', '1');
INSERT INTO `distritos` VALUES ('1113', '51', '09', '0906', '090603', 'CORDOVA', '1');
INSERT INTO `distritos` VALUES ('1114', '51', '09', '0906', '090604', 'HUAYACUNDO ARMA', '1');
INSERT INTO `distritos` VALUES ('1115', '51', '09', '0906', '090605', 'LARAMARCA', '1');
INSERT INTO `distritos` VALUES ('1116', '51', '09', '0906', '090606', 'OCOYO', '1');
INSERT INTO `distritos` VALUES ('1117', '51', '09', '0906', '090607', 'PILPICHACA', '1');
INSERT INTO `distritos` VALUES ('1118', '51', '09', '0906', '090608', 'QUERCO', '1');
INSERT INTO `distritos` VALUES ('1119', '51', '09', '0906', '090609', 'QUITO-ARMA', '1');
INSERT INTO `distritos` VALUES ('1120', '51', '09', '0906', '090610', 'SAN ANTONIO DE CUSICANCHA', '1');
INSERT INTO `distritos` VALUES ('1121', '51', '09', '0906', '090611', 'SAN FRANCISCO DE SANGAYAICO', '1');
INSERT INTO `distritos` VALUES ('1122', '51', '09', '0906', '090612', 'SAN ISIDRO', '1');
INSERT INTO `distritos` VALUES ('1123', '51', '09', '0906', '090613', 'SANTIAGO DE CHOCORVOS', '1');
INSERT INTO `distritos` VALUES ('1124', '51', '09', '0906', '090614', 'SANTIAGO DE QUIRAHUARA', '1');
INSERT INTO `distritos` VALUES ('1125', '51', '09', '0906', '090615', 'SANTO DOMINGO DE CAPILLAS', '1');
INSERT INTO `distritos` VALUES ('1126', '51', '09', '0906', '090616', 'TAMBO', '1');
INSERT INTO `distritos` VALUES ('1127', '51', '10', '1007', '100701', ' HUACRACHUCO', '1');
INSERT INTO `distritos` VALUES ('1128', '51', '10', '1007', '100702', 'CHOLON', '1');
INSERT INTO `distritos` VALUES ('1129', '51', '10', '1007', '100703', 'LA MORADA', '1');
INSERT INTO `distritos` VALUES ('1130', '51', '10', '1007', '100704', 'SAN BUENAVENTURA', '1');
INSERT INTO `distritos` VALUES ('1131', '51', '10', '1007', '100705', 'SANTA ROSA DE ALTO YANAJANCA', '1');
INSERT INTO `distritos` VALUES ('1132', '51', '10', '1008', '100801', ' PANAO', '1');
INSERT INTO `distritos` VALUES ('1133', '51', '10', '1008', '100802', 'CHAGLLA', '1');
INSERT INTO `distritos` VALUES ('1134', '51', '10', '1008', '100803', 'MOLINO', '1');
INSERT INTO `distritos` VALUES ('1135', '51', '10', '1008', '100804', 'UMARI', '1');
INSERT INTO `distritos` VALUES ('1136', '51', '10', '1009', '100901', 'PUERTO INCA', '1');
INSERT INTO `distritos` VALUES ('1137', '51', '10', '1009', '100902', 'CODO DEL POZUZO', '1');
INSERT INTO `distritos` VALUES ('1138', '51', '10', '1009', '100903', 'HONORIA', '1');
INSERT INTO `distritos` VALUES ('1139', '51', '10', '1009', '100904', 'TOURNAVISTA', '1');
INSERT INTO `distritos` VALUES ('1140', '51', '10', '1009', '100905', 'YUYAPICHIS', '1');
INSERT INTO `distritos` VALUES ('1141', '51', '10', '1010', '101001', 'JESUS', '1');
INSERT INTO `distritos` VALUES ('1142', '51', '10', '1010', '101002', 'BANOS', '1');
INSERT INTO `distritos` VALUES ('1143', '51', '10', '1010', '101003', 'JIVIA', '1');
INSERT INTO `distritos` VALUES ('1144', '51', '10', '1010', '101004', 'QUEROPALCA', '1');
INSERT INTO `distritos` VALUES ('1145', '51', '10', '1010', '101005', 'RONDOS', '1');
INSERT INTO `distritos` VALUES ('1146', '51', '10', '1010', '101006', 'SAN FRANCISCO DE ASIS', '1');
INSERT INTO `distritos` VALUES ('1147', '51', '10', '1010', '101007', 'SAN MIGUEL DE CAURI', '1');
INSERT INTO `distritos` VALUES ('1148', '51', '10', '1011', '101101', 'CHAVINILLO', '1');
INSERT INTO `distritos` VALUES ('1149', '51', '10', '1011', '101102', 'CAHUAC', '1');
INSERT INTO `distritos` VALUES ('1150', '51', '10', '1011', '101103', 'CHACABAMBA', '1');
INSERT INTO `distritos` VALUES ('1151', '51', '10', '1011', '101104', 'APARICIO POMARES', '1');
INSERT INTO `distritos` VALUES ('1152', '51', '10', '1011', '101105', 'JACAS CHICO', '1');
INSERT INTO `distritos` VALUES ('1153', '51', '10', '1011', '101106', 'OBAS', '1');
INSERT INTO `distritos` VALUES ('1154', '51', '10', '1011', '101107', 'PAMPAMARCA', '1');
INSERT INTO `distritos` VALUES ('1155', '51', '10', '1011', '101108', 'CHORAS', '1');
INSERT INTO `distritos` VALUES ('1156', '51', '09', '0907', '090701', 'PAMPAS', '1');
INSERT INTO `distritos` VALUES ('1157', '51', '09', '0907', '090702', 'ACOSTAMBO', '1');
INSERT INTO `distritos` VALUES ('1158', '51', '09', '0907', '090703', 'ACRAQUIA', '1');
INSERT INTO `distritos` VALUES ('1159', '51', '09', '0907', '090704', 'AHUAYCHA', '1');
INSERT INTO `distritos` VALUES ('1160', '51', '09', '0907', '090705', 'ANDAYMARCA', '1');
INSERT INTO `distritos` VALUES ('1161', '51', '09', '0907', '090706', 'COLCABAMBA', '1');
INSERT INTO `distritos` VALUES ('1162', '51', '09', '0907', '090707', 'DANIEL HERNANDEZ', '1');
INSERT INTO `distritos` VALUES ('1163', '51', '09', '0907', '090708', 'HUACHOCOLPA', '1');
INSERT INTO `distritos` VALUES ('1164', '51', '09', '0907', '090709', 'HUARIBAMBA', '1');
INSERT INTO `distritos` VALUES ('1165', '51', '09', '0907', '090710', 'NAHUIMPUQUIO', '1');
INSERT INTO `distritos` VALUES ('1166', '51', '09', '0907', '090711', 'PAZOS', '1');
INSERT INTO `distritos` VALUES ('1167', '51', '09', '0907', '090712', 'PICHOS', '1');
INSERT INTO `distritos` VALUES ('1168', '51', '09', '0907', '090713', 'ROBLE', '1');
INSERT INTO `distritos` VALUES ('1169', '51', '09', '0907', '090714', 'QUICHUAS', '1');
INSERT INTO `distritos` VALUES ('1170', '51', '09', '0907', '090715', 'QUISHUAR', '1');
INSERT INTO `distritos` VALUES ('1171', '51', '09', '0907', '090716', 'SALCABAMBA', '1');
INSERT INTO `distritos` VALUES ('1172', '51', '09', '0907', '090717', 'SALCAHUASI', '1');
INSERT INTO `distritos` VALUES ('1173', '51', '09', '0907', '090718', 'SAN MARCOS DE ROCCHAC', '1');
INSERT INTO `distritos` VALUES ('1174', '51', '09', '0907', '090719', 'SANTIAGO DE TUCUMA', '1');
INSERT INTO `distritos` VALUES ('1175', '51', '09', '0907', '090720', 'SURCUBAMBA', '1');
INSERT INTO `distritos` VALUES ('1176', '51', '09', '0907', '090721', 'TINTAY PUNCU', '1');
INSERT INTO `distritos` VALUES ('1177', '51', '12', '1201', '120101', 'HUANCAYO', '1');
INSERT INTO `distritos` VALUES ('1178', '51', '12', '1201', '120102', 'CARHUACALLANGA', '1');
INSERT INTO `distritos` VALUES ('1179', '51', '12', '1201', '120103', 'CHACAPAMPA', '1');
INSERT INTO `distritos` VALUES ('1180', '51', '12', '1201', '120104', 'CHICCHE', '1');
INSERT INTO `distritos` VALUES ('1181', '51', '12', '1201', '120105', 'CHILCA', '1');
INSERT INTO `distritos` VALUES ('1182', '51', '12', '1201', '120106', 'CHONGOS ALTO', '1');
INSERT INTO `distritos` VALUES ('1183', '51', '12', '1201', '120107', 'CHUPURO', '1');
INSERT INTO `distritos` VALUES ('1184', '51', '12', '1201', '120108', 'COLCA', '1');
INSERT INTO `distritos` VALUES ('1185', '51', '12', '1201', '120109', 'CULLHUAS', '1');
INSERT INTO `distritos` VALUES ('1186', '51', '12', '1201', '120110', 'EL TAMBO', '1');
INSERT INTO `distritos` VALUES ('1187', '51', '12', '1201', '120111', 'HUACRAPUQUIO', '1');
INSERT INTO `distritos` VALUES ('1188', '51', '12', '1201', '120112', 'HUALHUAS', '1');
INSERT INTO `distritos` VALUES ('1189', '51', '12', '1201', '120113', 'HUANCAN', '1');
INSERT INTO `distritos` VALUES ('1190', '51', '12', '1201', '120114', 'HUASICANCHA', '1');
INSERT INTO `distritos` VALUES ('1191', '51', '12', '1201', '120115', 'HUAYUCACHI', '1');
INSERT INTO `distritos` VALUES ('1192', '51', '12', '1201', '120116', 'INGENIO', '1');
INSERT INTO `distritos` VALUES ('1193', '51', '12', '1201', '120117', 'PARIAHUANCA', '1');
INSERT INTO `distritos` VALUES ('1194', '51', '12', '1201', '120118', 'PILCOMAYO', '1');
INSERT INTO `distritos` VALUES ('1195', '51', '12', '1201', '120119', 'PUCARA', '1');
INSERT INTO `distritos` VALUES ('1196', '51', '12', '1201', '120120', 'QUICHUAY', '1');
INSERT INTO `distritos` VALUES ('1197', '51', '12', '1201', '120121', 'QUILCAS', '1');
INSERT INTO `distritos` VALUES ('1198', '51', '12', '1201', '120122', 'SAN AGUSTIN DE CAJAS', '1');
INSERT INTO `distritos` VALUES ('1199', '51', '12', '1201', '120123', 'SAN JERONIMO DE TUNAN', '1');
INSERT INTO `distritos` VALUES ('1200', '51', '12', '1201', '120124', 'SAN PEDRO DE SANO', '1');
INSERT INTO `distritos` VALUES ('1201', '51', '12', '1201', '120125', 'SANTO DOMINGO DE ACOBAMBA', '1');
INSERT INTO `distritos` VALUES ('1202', '51', '12', '1201', '120126', 'SAPALLANGA', '1');
INSERT INTO `distritos` VALUES ('1203', '51', '12', '1201', '120127', 'SICAYA', '1');
INSERT INTO `distritos` VALUES ('1204', '51', '12', '1201', '120128', 'VIQUES', '1');
INSERT INTO `distritos` VALUES ('1205', '51', '12', '1202', '120201', 'CONCEPCION', '1');
INSERT INTO `distritos` VALUES ('1206', '51', '12', '1202', '120202', 'ACO', '1');
INSERT INTO `distritos` VALUES ('1207', '51', '12', '1202', '120203', 'ANDAMARCA', '1');
INSERT INTO `distritos` VALUES ('1208', '51', '12', '1202', '120204', 'CHAMBARA', '1');
INSERT INTO `distritos` VALUES ('1209', '51', '12', '1202', '120205', 'COCHAS', '1');
INSERT INTO `distritos` VALUES ('1210', '51', '12', '1202', '120206', 'COMAS', '1');
INSERT INTO `distritos` VALUES ('1211', '51', '12', '1202', '120207', 'HEROINAS TOLEDO', '1');
INSERT INTO `distritos` VALUES ('1212', '51', '12', '1202', '120208', 'MANZANARES', '1');
INSERT INTO `distritos` VALUES ('1213', '51', '12', '1202', '120209', 'MARISCAL CASTILLA', '1');
INSERT INTO `distritos` VALUES ('1214', '51', '12', '1202', '120210', 'MATAHUASI', '1');
INSERT INTO `distritos` VALUES ('1215', '51', '12', '1202', '120211', 'MITO', '1');
INSERT INTO `distritos` VALUES ('1216', '51', '12', '1202', '120212', 'NUEVE DE JULIO', '1');
INSERT INTO `distritos` VALUES ('1217', '51', '12', '1202', '120213', 'ORCOTUNA', '1');
INSERT INTO `distritos` VALUES ('1218', '51', '12', '1202', '120214', 'SAN JOSE DE QUERO', '1');
INSERT INTO `distritos` VALUES ('1219', '51', '12', '1202', '120215', 'SANTA ROSA DE OCOPA', '1');
INSERT INTO `distritos` VALUES ('1220', '51', '12', '1203', '120301', 'LA MERCED', '1');
INSERT INTO `distritos` VALUES ('1221', '51', '12', '1203', '120302', 'SAN LUIS', '1');
INSERT INTO `distritos` VALUES ('1222', '51', '12', '1203', '120303', 'PERENE', '1');
INSERT INTO `distritos` VALUES ('1223', '51', '12', '1203', '120304', 'PICHANAQUI', '1');
INSERT INTO `distritos` VALUES ('1224', '51', '12', '1203', '120305', 'SAN RAMON', '1');
INSERT INTO `distritos` VALUES ('1225', '51', '12', '1203', '120306', 'VITOC', '1');
INSERT INTO `distritos` VALUES ('1226', '51', '11', '1101', '110101', 'ICA', '1');
INSERT INTO `distritos` VALUES ('1227', '51', '11', '1101', '110102', 'LA TINGUINA', '1');
INSERT INTO `distritos` VALUES ('1228', '51', '11', '1101', '110103', 'LOS AQUIJES', '1');
INSERT INTO `distritos` VALUES ('1229', '51', '11', '1101', '110104', 'OCUCAJE', '1');
INSERT INTO `distritos` VALUES ('1230', '51', '11', '1101', '110105', 'PACHACUTEC', '1');
INSERT INTO `distritos` VALUES ('1231', '51', '11', '1101', '110106', 'PARCONA', '1');
INSERT INTO `distritos` VALUES ('1232', '51', '11', '1101', '110107', 'PUEBLO NUEVO', '1');
INSERT INTO `distritos` VALUES ('1233', '51', '11', '1101', '110108', 'SALAS', '1');
INSERT INTO `distritos` VALUES ('1234', '51', '11', '1101', '110109', 'SAN JOSE DE LOS MOLINOS', '1');
INSERT INTO `distritos` VALUES ('1235', '51', '11', '1101', '110110', 'SAN JUAN BAUTISTA', '1');
INSERT INTO `distritos` VALUES ('1236', '51', '11', '1101', '110111', 'SANTIAGO', '1');
INSERT INTO `distritos` VALUES ('1237', '51', '11', '1101', '110112', 'SUBTANJALLA', '1');
INSERT INTO `distritos` VALUES ('1238', '51', '11', '1101', '110113', 'TATE', '1');
INSERT INTO `distritos` VALUES ('1239', '51', '11', '1101', '110114', 'YAUCA DEL ROSARIO', '1');
INSERT INTO `distritos` VALUES ('1240', '51', '12', '1204', '120401', 'JAUJA', '1');
INSERT INTO `distritos` VALUES ('1241', '51', '12', '1204', '120402', 'ACOLLA', '1');
INSERT INTO `distritos` VALUES ('1242', '51', '12', '1204', '120403', 'APATA ', '1');
INSERT INTO `distritos` VALUES ('1243', '51', '12', '1204', '120404', 'ATAURA', '1');
INSERT INTO `distritos` VALUES ('1244', '51', '12', '1204', '120405', 'CANCHAYLLO', '1');
INSERT INTO `distritos` VALUES ('1245', '51', '12', '1204', '120406', 'CURICACA', '1');
INSERT INTO `distritos` VALUES ('1246', '51', '12', '1204', '120407', 'EL MANTARO', '1');
INSERT INTO `distritos` VALUES ('1247', '51', '12', '1204', '120408', 'HUAMALI', '1');
INSERT INTO `distritos` VALUES ('1248', '51', '12', '1204', '120409', 'HUARIPAMPA', '1');
INSERT INTO `distritos` VALUES ('1249', '51', '12', '1204', '120410', 'HUERTAS', '1');
INSERT INTO `distritos` VALUES ('1250', '51', '12', '1204', '120411', 'JANJAILLO', '1');
INSERT INTO `distritos` VALUES ('1251', '51', '12', '1204', '120412', 'JULCAN', '1');
INSERT INTO `distritos` VALUES ('1252', '51', '12', '1204', '120413', 'LEONOR ORDONEZ', '1');
INSERT INTO `distritos` VALUES ('1253', '51', '12', '1204', '120414', 'LLOCLLAPAMPA', '1');
INSERT INTO `distritos` VALUES ('1254', '51', '12', '1204', '120415', 'MARCO', '1');
INSERT INTO `distritos` VALUES ('1255', '51', '12', '1204', '120416', 'MASMA', '1');
INSERT INTO `distritos` VALUES ('1256', '51', '12', '1204', '120417', 'MASMA CHICCHE', '1');
INSERT INTO `distritos` VALUES ('1257', '51', '12', '1204', '120418', 'MOLINOS', '1');
INSERT INTO `distritos` VALUES ('1258', '51', '12', '1204', '120419', 'MONOBAMBA', '1');
INSERT INTO `distritos` VALUES ('1259', '51', '12', '1204', '120420', 'MUQUI', '1');
INSERT INTO `distritos` VALUES ('1260', '51', '12', '1204', '120421', 'MUQUIYAUYO', '1');
INSERT INTO `distritos` VALUES ('1261', '51', '12', '1204', '120422', 'PACA', '1');
INSERT INTO `distritos` VALUES ('1262', '51', '12', '1204', '120423', 'PACCHA', '1');
INSERT INTO `distritos` VALUES ('1263', '51', '12', '1204', '120424', 'PANCAN', '1');
INSERT INTO `distritos` VALUES ('1264', '51', '12', '1204', '120425', 'PARCO', '1');
INSERT INTO `distritos` VALUES ('1265', '51', '12', '1204', '120426', 'POMACANCHA', '1');
INSERT INTO `distritos` VALUES ('1266', '51', '12', '1204', '120427', 'RICRAN', '1');
INSERT INTO `distritos` VALUES ('1267', '51', '12', '1204', '120428', 'SAN LORENZO', '1');
INSERT INTO `distritos` VALUES ('1268', '51', '12', '1204', '120429', 'SAN PEDRO DE CHUNAN', '1');
INSERT INTO `distritos` VALUES ('1269', '51', '12', '1204', '120430', 'SAUSA', '1');
INSERT INTO `distritos` VALUES ('1270', '51', '12', '1204', '120431', 'SINCOS', '1');
INSERT INTO `distritos` VALUES ('1271', '51', '12', '1205', '120501', 'JUNIN', '1');
INSERT INTO `distritos` VALUES ('1272', '51', '12', '1205', '120502', 'CARHUAMAYO ', '1');
INSERT INTO `distritos` VALUES ('1273', '51', '12', '1205', '120503', 'ONDORES ', '1');
INSERT INTO `distritos` VALUES ('1274', '51', '12', '1205', '120504', 'ULCUMAYO', '1');
INSERT INTO `distritos` VALUES ('1275', '51', '12', '1206', '120601', 'SATIPO', '1');
INSERT INTO `distritos` VALUES ('1276', '51', '12', '1206', '120602', 'COVIRIALI ', '1');
INSERT INTO `distritos` VALUES ('1277', '51', '12', '1206', '120603', 'LLAYLLA ', '1');
INSERT INTO `distritos` VALUES ('1278', '51', '12', '1206', '120604', 'MAZAMARI', '1');
INSERT INTO `distritos` VALUES ('1279', '51', '12', '1206', '120605', 'PAMPA HERMOSA', '1');
INSERT INTO `distritos` VALUES ('1280', '51', '12', '1206', '120606', 'PANGOA', '1');
INSERT INTO `distritos` VALUES ('1281', '51', '12', '1206', '120607', 'RIO NEGRO', '1');
INSERT INTO `distritos` VALUES ('1282', '51', '12', '1206', '120608', 'RIO TAMBO', '1');
INSERT INTO `distritos` VALUES ('1283', '51', '12', '1206', '120609', 'VIZCATAN DEL ENE', '1');
INSERT INTO `distritos` VALUES ('1284', '51', '11', '1102', '110201', 'CHINCHA ALTA', '1');
INSERT INTO `distritos` VALUES ('1285', '51', '11', '1102', '110202', 'ALTO LARAN', '1');
INSERT INTO `distritos` VALUES ('1286', '51', '11', '1102', '110203', 'CHAVIN', '1');
INSERT INTO `distritos` VALUES ('1287', '51', '11', '1102', '110204', 'CHINCHA BAJA', '1');
INSERT INTO `distritos` VALUES ('1288', '51', '11', '1102', '110205', 'EL CARMEN', '1');
INSERT INTO `distritos` VALUES ('1289', '51', '11', '1102', '110206', 'GROCIO PRADO', '1');
INSERT INTO `distritos` VALUES ('1290', '51', '11', '1102', '110207', 'PUEBLO NUEVO', '1');
INSERT INTO `distritos` VALUES ('1291', '51', '11', '1102', '110208', 'SAN JUAN DE YANAC', '1');
INSERT INTO `distritos` VALUES ('1292', '51', '11', '1102', '110209', 'SAN PEDRO DE HUACARPANA', '1');
INSERT INTO `distritos` VALUES ('1293', '51', '11', '1102', '110210', 'SUNAMPE', '1');
INSERT INTO `distritos` VALUES ('1294', '51', '11', '1102', '110211', 'TAMBO DE MORA', '1');
INSERT INTO `distritos` VALUES ('1295', '51', '12', '1207', '120701', 'TARMA', '1');
INSERT INTO `distritos` VALUES ('1296', '51', '12', '1207', '120702', 'ACOBAMBA ', '1');
INSERT INTO `distritos` VALUES ('1297', '51', '12', '1207', '120703', 'HUARICOLCA ', '1');
INSERT INTO `distritos` VALUES ('1298', '51', '12', '1207', '120704', 'HUASAHUASI', '1');
INSERT INTO `distritos` VALUES ('1299', '51', '12', '1207', '120705', 'LA UNION', '1');
INSERT INTO `distritos` VALUES ('1300', '51', '12', '1207', '120706', 'PALCA', '1');
INSERT INTO `distritos` VALUES ('1301', '51', '12', '1207', '120707', 'PALCAMAYO', '1');
INSERT INTO `distritos` VALUES ('1302', '51', '12', '1207', '120708', 'SAN PEDRO DE CAJAS', '1');
INSERT INTO `distritos` VALUES ('1303', '51', '12', '1207', '120709', 'TAPO', '1');
INSERT INTO `distritos` VALUES ('1304', '51', '12', '1208', '120801', 'LA OROYA', '1');
INSERT INTO `distritos` VALUES ('1305', '51', '12', '1208', '120802', 'CHACAPALPA ', '1');
INSERT INTO `distritos` VALUES ('1306', '51', '12', '1208', '120803', 'HUAYHUAY ', '1');
INSERT INTO `distritos` VALUES ('1307', '51', '12', '1208', '120804', 'MARCAPOMACOCHA', '1');
INSERT INTO `distritos` VALUES ('1308', '51', '12', '1208', '120805', 'MOROCOCHA', '1');
INSERT INTO `distritos` VALUES ('1309', '51', '12', '1208', '120806', 'PACCHA', '1');
INSERT INTO `distritos` VALUES ('1310', '51', '12', '1208', '120807', 'SANTA BARBARA DE CARHUACAYAN', '1');
INSERT INTO `distritos` VALUES ('1311', '51', '12', '1208', '120808', 'SANTA ROSA DE SACCO', '1');
INSERT INTO `distritos` VALUES ('1312', '51', '12', '1208', '120809', 'SUITUCANCHA', '1');
INSERT INTO `distritos` VALUES ('1313', '51', '12', '1208', '120810', 'YAULI', '1');
INSERT INTO `distritos` VALUES ('1314', '51', '11', '1103', '110301', 'NAZCA', '1');
INSERT INTO `distritos` VALUES ('1315', '51', '11', '1103', '110302', 'CHANGUILLO', '1');
INSERT INTO `distritos` VALUES ('1316', '51', '11', '1103', '110303', 'EL INGENIO', '1');
INSERT INTO `distritos` VALUES ('1317', '51', '11', '1103', '110304', 'MARCONA', '1');
INSERT INTO `distritos` VALUES ('1318', '51', '11', '1103', '110305', 'VISTA ALEGRE', '1');
INSERT INTO `distritos` VALUES ('1319', '51', '12', '1209', '120901', 'CHUPACA', '1');
INSERT INTO `distritos` VALUES ('1320', '51', '12', '1209', '120902', 'AHUAC ', '1');
INSERT INTO `distritos` VALUES ('1321', '51', '12', '1209', '120903', 'CHONGOS BAJO ', '1');
INSERT INTO `distritos` VALUES ('1322', '51', '12', '1209', '120904', 'HUACHAC', '1');
INSERT INTO `distritos` VALUES ('1323', '51', '12', '1209', '120905', 'HUAMANCACA CHICO', '1');
INSERT INTO `distritos` VALUES ('1324', '51', '12', '1209', '120906', 'SAN JUAN DE YSCOS', '1');
INSERT INTO `distritos` VALUES ('1325', '51', '12', '1209', '120907', 'SAN JUAN DE JARPA', '1');
INSERT INTO `distritos` VALUES ('1326', '51', '12', '1209', '120908', 'TRES DE DICIEMBRE', '1');
INSERT INTO `distritos` VALUES ('1327', '51', '12', '1209', '120909', 'YANACANCHA', '1');
INSERT INTO `distritos` VALUES ('1328', '51', '11', '1104', '110401', 'PALPA', '1');
INSERT INTO `distritos` VALUES ('1329', '51', '11', '1104', '110402', 'LLIPATA', '1');
INSERT INTO `distritos` VALUES ('1330', '51', '11', '1104', '110403', 'RIO GRANDE', '1');
INSERT INTO `distritos` VALUES ('1331', '51', '11', '1104', '110404', 'SANTA CRUZ', '1');
INSERT INTO `distritos` VALUES ('1332', '51', '11', '1104', '110405', 'TIBILLO', '1');
INSERT INTO `distritos` VALUES ('1333', '51', '14', '1401', '140101', 'CHICLAYO', '1');
INSERT INTO `distritos` VALUES ('1334', '51', '14', '1401', '140102', 'CAYALTI', '1');
INSERT INTO `distritos` VALUES ('1335', '51', '14', '1401', '140103', 'CHONGOYAPE', '1');
INSERT INTO `distritos` VALUES ('1336', '51', '14', '1401', '140104', 'ETEN', '1');
INSERT INTO `distritos` VALUES ('1337', '51', '14', '1401', '140105', 'PUERTO ETEN', '1');
INSERT INTO `distritos` VALUES ('1338', '51', '14', '1401', '140106', 'JOSE LEONARDO ORTIZ', '1');
INSERT INTO `distritos` VALUES ('1339', '51', '14', '1401', '140107', 'LA VICTORIA', '1');
INSERT INTO `distritos` VALUES ('1340', '51', '14', '1401', '140108', 'LAGUNAS', '1');
INSERT INTO `distritos` VALUES ('1341', '51', '14', '1401', '140109', 'MONSEFU', '1');
INSERT INTO `distritos` VALUES ('1342', '51', '14', '1401', '140110', 'NUEVA ARICA', '1');
INSERT INTO `distritos` VALUES ('1343', '51', '14', '1401', '140111', 'OYOTUN', '1');
INSERT INTO `distritos` VALUES ('1344', '51', '14', '1401', '140112', 'PATAPO', '1');
INSERT INTO `distritos` VALUES ('1345', '51', '14', '1401', '140113', 'PICSI', '1');
INSERT INTO `distritos` VALUES ('1346', '51', '14', '1401', '140114', 'PIMENTEL', '1');
INSERT INTO `distritos` VALUES ('1347', '51', '14', '1401', '140115', 'POMALCA', '1');
INSERT INTO `distritos` VALUES ('1348', '51', '14', '1401', '140116', 'PUCALA', '1');
INSERT INTO `distritos` VALUES ('1349', '51', '14', '1401', '140117', 'REQUE', '1');
INSERT INTO `distritos` VALUES ('1350', '51', '14', '1401', '140118', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('1351', '51', '14', '1401', '140119', 'TUMAN', '1');
INSERT INTO `distritos` VALUES ('1352', '51', '14', '1401', '140120', 'ZANA', '1');
INSERT INTO `distritos` VALUES ('1353', '51', '14', '1402', '140201', 'FERRENAFE', '1');
INSERT INTO `distritos` VALUES ('1354', '51', '14', '1402', '140202', 'CANARIS', '1');
INSERT INTO `distritos` VALUES ('1355', '51', '14', '1402', '140203', 'INCAHUASI', '1');
INSERT INTO `distritos` VALUES ('1356', '51', '14', '1402', '140204', 'MANUEL ANTONIO MESONES MURO', '1');
INSERT INTO `distritos` VALUES ('1357', '51', '14', '1402', '140205', 'PITIPO', '1');
INSERT INTO `distritos` VALUES ('1358', '51', '14', '1402', '140206', 'PUEBLO NUEVO', '1');
INSERT INTO `distritos` VALUES ('1359', '51', '11', '1105', '110501', 'PISCO', '1');
INSERT INTO `distritos` VALUES ('1360', '51', '11', '1105', '110502', 'HUANCANO', '1');
INSERT INTO `distritos` VALUES ('1361', '51', '11', '1105', '110503', 'HUMAY', '1');
INSERT INTO `distritos` VALUES ('1362', '51', '11', '1105', '110504', 'INDEPENDENCIA', '1');
INSERT INTO `distritos` VALUES ('1363', '51', '11', '1105', '110505', 'PARACAS', '1');
INSERT INTO `distritos` VALUES ('1364', '51', '11', '1105', '110506', 'SAN ANDRES', '1');
INSERT INTO `distritos` VALUES ('1365', '51', '11', '1105', '110507', 'SAN CLEMENTE', '1');
INSERT INTO `distritos` VALUES ('1366', '51', '11', '1105', '110508', 'TUPAC AMARU INCA', '1');
INSERT INTO `distritos` VALUES ('1367', '51', '14', '1403', '140301', 'LAMBAYEQUE', '1');
INSERT INTO `distritos` VALUES ('1368', '51', '14', '1403', '140302', 'CHOCHOPE', '1');
INSERT INTO `distritos` VALUES ('1369', '51', '14', '1403', '140303', 'ILLIMO', '1');
INSERT INTO `distritos` VALUES ('1370', '51', '14', '1403', '140304', 'JAYANCA', '1');
INSERT INTO `distritos` VALUES ('1371', '51', '14', '1403', '140305', 'MOCHUMI', '1');
INSERT INTO `distritos` VALUES ('1372', '51', '14', '1403', '140306', 'MORROPE', '1');
INSERT INTO `distritos` VALUES ('1373', '51', '14', '1403', '140307', 'MOTUPE', '1');
INSERT INTO `distritos` VALUES ('1374', '51', '14', '1403', '140308', 'OLMOS', '1');
INSERT INTO `distritos` VALUES ('1375', '51', '14', '1403', '140309', 'PACORA', '1');
INSERT INTO `distritos` VALUES ('1376', '51', '14', '1403', '140310', 'SALAS', '1');
INSERT INTO `distritos` VALUES ('1377', '51', '14', '1403', '140311', 'SAN JOSE', '1');
INSERT INTO `distritos` VALUES ('1378', '51', '14', '1403', '140312', 'TUCUME', '1');
INSERT INTO `distritos` VALUES ('1379', '51', '16', '1601', '160101', 'IQUITOS', '1');
INSERT INTO `distritos` VALUES ('1380', '51', '16', '1601', '160102', 'ALTO NANAY', '1');
INSERT INTO `distritos` VALUES ('1381', '51', '16', '1601', '160103', 'FERNANDO LORES', '1');
INSERT INTO `distritos` VALUES ('1382', '51', '16', '1601', '160104', 'INDIANA', '1');
INSERT INTO `distritos` VALUES ('1383', '51', '16', '1601', '160105', 'LAS AMAZONAS', '1');
INSERT INTO `distritos` VALUES ('1384', '51', '16', '1601', '160106', 'MAZAN', '1');
INSERT INTO `distritos` VALUES ('1385', '51', '16', '1601', '160107', 'NAPO', '1');
INSERT INTO `distritos` VALUES ('1386', '51', '16', '1601', '160108', 'PUNCHANA', '1');
INSERT INTO `distritos` VALUES ('1387', '51', '16', '1601', '160109', 'TORRES CAUSANA', '1');
INSERT INTO `distritos` VALUES ('1388', '51', '16', '1601', '160110', 'BELEN', '1');
INSERT INTO `distritos` VALUES ('1389', '51', '16', '1601', '160111', 'SAN JUAN BAUTISTA', '1');
INSERT INTO `distritos` VALUES ('1390', '51', '16', '1602', '160201', 'YURIMAGUAS', '1');
INSERT INTO `distritos` VALUES ('1391', '51', '16', '1602', '160202', 'BALSAPUERTO', '1');
INSERT INTO `distritos` VALUES ('1392', '51', '16', '1602', '160203', 'JEBEROS', '1');
INSERT INTO `distritos` VALUES ('1393', '51', '16', '1602', '160204', 'LAGUNAS', '1');
INSERT INTO `distritos` VALUES ('1394', '51', '16', '1602', '160205', 'SANTA CRUZ', '1');
INSERT INTO `distritos` VALUES ('1395', '51', '16', '1602', '160206', 'TENIENTE CESAR LOPEZ ROJAS', '1');
INSERT INTO `distritos` VALUES ('1396', '51', '13', '1301', '130101', 'TRUJILLO', '1');
INSERT INTO `distritos` VALUES ('1397', '51', '13', '1301', '130102', 'EL PORVENIR', '1');
INSERT INTO `distritos` VALUES ('1398', '51', '13', '1301', '130103', 'FLORENCIA DE MORA', '1');
INSERT INTO `distritos` VALUES ('1399', '51', '13', '1301', '130104', 'HUANCHACO', '1');
INSERT INTO `distritos` VALUES ('1400', '51', '13', '1301', '130105', 'LA ESPERANZA', '1');
INSERT INTO `distritos` VALUES ('1401', '51', '13', '1301', '130106', 'LAREDO', '1');
INSERT INTO `distritos` VALUES ('1402', '51', '13', '1301', '130107', 'MOCHE', '1');
INSERT INTO `distritos` VALUES ('1403', '51', '13', '1301', '130108', 'POROTO', '1');
INSERT INTO `distritos` VALUES ('1404', '51', '13', '1301', '130109', 'SALAVERRY', '1');
INSERT INTO `distritos` VALUES ('1405', '51', '13', '1301', '130110', 'SIMBAL', '1');
INSERT INTO `distritos` VALUES ('1406', '51', '13', '1301', '130111', 'VICTOR LARCO HERRERA', '1');
INSERT INTO `distritos` VALUES ('1407', '51', '13', '1302', '130201', 'ASCOPE', '1');
INSERT INTO `distritos` VALUES ('1408', '51', '13', '1302', '130202', 'CHICAMA', '1');
INSERT INTO `distritos` VALUES ('1409', '51', '13', '1302', '130203', 'CHOCOPE', '1');
INSERT INTO `distritos` VALUES ('1410', '51', '13', '1302', '130204', 'MAGDALENA DE CAO', '1');
INSERT INTO `distritos` VALUES ('1411', '51', '13', '1302', '130205', 'PAIJAN', '1');
INSERT INTO `distritos` VALUES ('1412', '51', '13', '1302', '130206', 'RAZURI', '1');
INSERT INTO `distritos` VALUES ('1413', '51', '13', '1302', '130207', 'SANTIAGO DE CAO', '1');
INSERT INTO `distritos` VALUES ('1414', '51', '13', '1302', '130208', 'CASA GRANDE', '1');
INSERT INTO `distritos` VALUES ('1415', '51', '16', '1603', '160301', 'NAUTA', '1');
INSERT INTO `distritos` VALUES ('1416', '51', '16', '1603', '160302', 'PARINARI', '1');
INSERT INTO `distritos` VALUES ('1417', '51', '16', '1603', '160303', 'TIGRE', '1');
INSERT INTO `distritos` VALUES ('1418', '51', '16', '1603', '160304', 'TROMPETEROS', '1');
INSERT INTO `distritos` VALUES ('1419', '51', '16', '1603', '160305', 'URARINAS', '1');
INSERT INTO `distritos` VALUES ('1420', '51', '16', '1604', '160401', 'RAMON CASTILLA', '1');
INSERT INTO `distritos` VALUES ('1421', '51', '16', '1604', '160402', 'PEBAS', '1');
INSERT INTO `distritos` VALUES ('1422', '51', '16', '1604', '160403', 'SAN PABLO', '1');
INSERT INTO `distritos` VALUES ('1423', '51', '16', '1604', '160404', 'YAVARI', '1');
INSERT INTO `distritos` VALUES ('1424', '51', '16', '1605', '160501', 'REQUENA', '1');
INSERT INTO `distritos` VALUES ('1425', '51', '16', '1605', '160502', 'ALTO TAPICHE', '1');
INSERT INTO `distritos` VALUES ('1426', '51', '16', '1605', '160503', 'CAPELO', '1');
INSERT INTO `distritos` VALUES ('1427', '51', '16', '1605', '160504', 'EMILIO SAN MARTIN', '1');
INSERT INTO `distritos` VALUES ('1428', '51', '16', '1605', '160505', 'MAQUIA', '1');
INSERT INTO `distritos` VALUES ('1429', '51', '16', '1605', '160506', 'PUINAHUA', '1');
INSERT INTO `distritos` VALUES ('1430', '51', '16', '1605', '160507', 'SAQUENA', '1');
INSERT INTO `distritos` VALUES ('1431', '51', '16', '1605', '160508', 'SOPLIN', '1');
INSERT INTO `distritos` VALUES ('1432', '51', '16', '1605', '160509', 'TAPICHE', '1');
INSERT INTO `distritos` VALUES ('1433', '51', '16', '1605', '160510', 'JENARO HERRERA', '1');
INSERT INTO `distritos` VALUES ('1434', '51', '16', '1605', '160511', 'YAQUERANA', '1');
INSERT INTO `distritos` VALUES ('1435', '51', '13', '1303', '130301', 'BOLIVAR', '1');
INSERT INTO `distritos` VALUES ('1436', '51', '13', '1303', '130302', 'BAMBAMARCA', '1');
INSERT INTO `distritos` VALUES ('1437', '51', '13', '1303', '130303', 'CONDORMARCA', '1');
INSERT INTO `distritos` VALUES ('1438', '51', '13', '1303', '130304', 'LONGOTEA', '1');
INSERT INTO `distritos` VALUES ('1439', '51', '13', '1303', '130305', 'UCHUMARCA', '1');
INSERT INTO `distritos` VALUES ('1440', '51', '13', '1303', '130306', 'UCUNCHA', '1');
INSERT INTO `distritos` VALUES ('1441', '51', '16', '1606', '160601', 'CONTAMANA', '1');
INSERT INTO `distritos` VALUES ('1442', '51', '16', '1606', '160602', 'INAHUAYA', '1');
INSERT INTO `distritos` VALUES ('1443', '51', '16', '1606', '160603', 'PADRE MARQUEZ', '1');
INSERT INTO `distritos` VALUES ('1444', '51', '16', '1606', '160604', 'PAMPA HERMOSA', '1');
INSERT INTO `distritos` VALUES ('1445', '51', '16', '1606', '160605', 'SARAYACU', '1');
INSERT INTO `distritos` VALUES ('1446', '51', '16', '1606', '160606', 'ALFREDO VARGAS GUERRA', '1');
INSERT INTO `distritos` VALUES ('1447', '51', '16', '1607', '160701', 'BARRANCA', '1');
INSERT INTO `distritos` VALUES ('1448', '51', '16', '1607', '160702', 'CAHUAPANAS', '1');
INSERT INTO `distritos` VALUES ('1449', '51', '16', '1607', '160703', 'MANSERICHE', '1');
INSERT INTO `distritos` VALUES ('1450', '51', '16', '1607', '160704', 'MORONA', '1');
INSERT INTO `distritos` VALUES ('1451', '51', '16', '1607', '160705', 'PASTAZA', '1');
INSERT INTO `distritos` VALUES ('1452', '51', '16', '1607', '160706', 'ANDOAS', '1');
INSERT INTO `distritos` VALUES ('1453', '51', '13', '1304', '130401', 'CHEPEN', '1');
INSERT INTO `distritos` VALUES ('1454', '51', '13', '1304', '130402', 'PACANGA', '1');
INSERT INTO `distritos` VALUES ('1455', '51', '13', '1304', '130403', 'PUEBLO NUEVO', '1');
INSERT INTO `distritos` VALUES ('1456', '51', '16', '1608', '160801', 'PUTUMAYO', '1');
INSERT INTO `distritos` VALUES ('1457', '51', '16', '1608', '160802', 'ROSA PANDURO', '1');
INSERT INTO `distritos` VALUES ('1458', '51', '16', '1608', '160803', 'YAGUAS', '1');
INSERT INTO `distritos` VALUES ('1459', '51', '16', '1608', '160804', 'TENIENTE MANUEL CLAVERO', '1');
INSERT INTO `distritos` VALUES ('1460', '51', '13', '1305', '130501', 'JULCAN', '1');
INSERT INTO `distritos` VALUES ('1461', '51', '13', '1305', '130502', 'CALAMARCA', '1');
INSERT INTO `distritos` VALUES ('1462', '51', '13', '1305', '130503', 'CARABAMBA', '1');
INSERT INTO `distritos` VALUES ('1463', '51', '13', '1305', '130504', 'HUASO', '1');
INSERT INTO `distritos` VALUES ('1464', '51', '17', '1701', '170101', 'TAMBOPATA', '1');
INSERT INTO `distritos` VALUES ('1465', '51', '17', '1701', '170102', 'INAMBARI', '1');
INSERT INTO `distritos` VALUES ('1466', '51', '17', '1701', '170103', 'LAS PIEDRAS', '1');
INSERT INTO `distritos` VALUES ('1467', '51', '17', '1701', '170104', 'LABERINTO', '1');
INSERT INTO `distritos` VALUES ('1468', '51', '13', '1306', '130601', 'OTUZCO', '1');
INSERT INTO `distritos` VALUES ('1469', '51', '13', '1306', '130602', 'AGALLPAMPA', '1');
INSERT INTO `distritos` VALUES ('1470', '51', '13', '1306', '130603', 'CHARAT', '1');
INSERT INTO `distritos` VALUES ('1471', '51', '13', '1306', '130604', 'HUARANCHAL', '1');
INSERT INTO `distritos` VALUES ('1472', '51', '13', '1306', '130605', 'LA CUESTA', '1');
INSERT INTO `distritos` VALUES ('1473', '51', '13', '1306', '130606', 'MACHE', '1');
INSERT INTO `distritos` VALUES ('1474', '51', '13', '1306', '130607', 'PARANDAY', '1');
INSERT INTO `distritos` VALUES ('1475', '51', '13', '1306', '130608', 'SALPO', '1');
INSERT INTO `distritos` VALUES ('1476', '51', '13', '1306', '130609', 'SINSICAP', '1');
INSERT INTO `distritos` VALUES ('1477', '51', '13', '1306', '130610', 'USQUIL', '1');
INSERT INTO `distritos` VALUES ('1478', '51', '17', '1702', '170201', 'MANU', '1');
INSERT INTO `distritos` VALUES ('1479', '51', '17', '1702', '170202', 'FITZCARRALD', '1');
INSERT INTO `distritos` VALUES ('1480', '51', '17', '1702', '170203', 'MADRE DE DIOS', '1');
INSERT INTO `distritos` VALUES ('1481', '51', '17', '1702', '170204', 'HUEPETUHE', '1');
INSERT INTO `distritos` VALUES ('1482', '51', '17', '1703', '170301', 'INAPARI', '1');
INSERT INTO `distritos` VALUES ('1483', '51', '17', '1703', '170302', 'IBERIA', '1');
INSERT INTO `distritos` VALUES ('1484', '51', '17', '1703', '170303', 'TAHUAMANU', '1');
INSERT INTO `distritos` VALUES ('1485', '51', '18', '1801', '180101', 'MOQUEGUA', '1');
INSERT INTO `distritos` VALUES ('1486', '51', '18', '1801', '180102', 'CARUMAS', '1');
INSERT INTO `distritos` VALUES ('1487', '51', '18', '1801', '180103', 'CUCHUMBAYA', '1');
INSERT INTO `distritos` VALUES ('1488', '51', '18', '1801', '180104', 'SAMEGUA', '1');
INSERT INTO `distritos` VALUES ('1489', '51', '18', '1801', '180105', 'SAN CRISTOBAL DE CALACOA', '1');
INSERT INTO `distritos` VALUES ('1490', '51', '18', '1801', '180106', 'TORATA', '1');
INSERT INTO `distritos` VALUES ('1491', '51', '18', '1802', '180201', 'OMATE', '1');
INSERT INTO `distritos` VALUES ('1492', '51', '18', '1802', '180202', 'CHOJATA', '1');
INSERT INTO `distritos` VALUES ('1493', '51', '18', '1802', '180203', 'COALAQUE', '1');
INSERT INTO `distritos` VALUES ('1494', '51', '18', '1802', '180204', 'ICHUNA', '1');
INSERT INTO `distritos` VALUES ('1495', '51', '18', '1802', '180205', 'LA CAPILLA', '1');
INSERT INTO `distritos` VALUES ('1496', '51', '18', '1802', '180206', 'LLOQUE', '1');
INSERT INTO `distritos` VALUES ('1497', '51', '18', '1802', '180207', 'MATALAQUE', '1');
INSERT INTO `distritos` VALUES ('1498', '51', '18', '1802', '180208', 'PUQUINA', '1');
INSERT INTO `distritos` VALUES ('1499', '51', '18', '1802', '180209', 'QUINISTAQUILLAS', '1');
INSERT INTO `distritos` VALUES ('1500', '51', '18', '1802', '180210', 'UBINAS', '1');
INSERT INTO `distritos` VALUES ('1501', '51', '18', '1802', '180211', 'YUNGA', '1');
INSERT INTO `distritos` VALUES ('1502', '51', '18', '1803', '180301', 'ILO', '1');
INSERT INTO `distritos` VALUES ('1503', '51', '18', '1803', '180302', 'EL ALGARROBAL', '1');
INSERT INTO `distritos` VALUES ('1504', '51', '18', '1803', '180303', 'PACOCHA', '1');
INSERT INTO `distritos` VALUES ('1505', '51', '19', '1901', '190101', 'CHAUPIMARCA', '1');
INSERT INTO `distritos` VALUES ('1506', '51', '19', '1901', '190102', 'HUACHON', '1');
INSERT INTO `distritos` VALUES ('1507', '51', '19', '1901', '190103', 'HUARIACA', '1');
INSERT INTO `distritos` VALUES ('1508', '51', '19', '1901', '190104', 'HUAYLLAY', '1');
INSERT INTO `distritos` VALUES ('1509', '51', '19', '1901', '190105', 'NINACACA', '1');
INSERT INTO `distritos` VALUES ('1510', '51', '19', '1901', '190106', 'PALLANCHACRA', '1');
INSERT INTO `distritos` VALUES ('1511', '51', '19', '1901', '190107', 'PAUCARTAMBO', '1');
INSERT INTO `distritos` VALUES ('1512', '51', '19', '1901', '190108', 'SAN FRANCISCO DE ASIS DE YARUSYACAN', '1');
INSERT INTO `distritos` VALUES ('1513', '51', '19', '1901', '190109', 'SIMON BOLIVAR', '1');
INSERT INTO `distritos` VALUES ('1514', '51', '19', '1901', '190110', 'TICLACAYAN', '1');
INSERT INTO `distritos` VALUES ('1515', '51', '19', '1901', '190111', 'TINYAHUARCO', '1');
INSERT INTO `distritos` VALUES ('1516', '51', '19', '1901', '190112', 'VICCO', '1');
INSERT INTO `distritos` VALUES ('1517', '51', '19', '1901', '190113', 'YANACANCHA', '1');
INSERT INTO `distritos` VALUES ('1518', '51', '19', '1902', '190201', 'YANAHUANCA', '1');
INSERT INTO `distritos` VALUES ('1519', '51', '19', '1902', '190202', 'CHACAYAN', '1');
INSERT INTO `distritos` VALUES ('1520', '51', '19', '1902', '190203', 'GOYLLARISQUIZGA', '1');
INSERT INTO `distritos` VALUES ('1521', '51', '19', '1902', '190204', 'PAUCAR', '1');
INSERT INTO `distritos` VALUES ('1522', '51', '19', '1902', '190205', 'SAN PEDRO DE PILLAO', '1');
INSERT INTO `distritos` VALUES ('1523', '51', '19', '1902', '190206', 'SANTA ANA DE TUSI', '1');
INSERT INTO `distritos` VALUES ('1524', '51', '19', '1902', '190207', 'TAPUC', '1');
INSERT INTO `distritos` VALUES ('1525', '51', '19', '1902', '190208', 'VILCABAMBA', '1');
INSERT INTO `distritos` VALUES ('1526', '51', '19', '1903', '190301', 'OXAPAMPA', '1');
INSERT INTO `distritos` VALUES ('1527', '51', '19', '1903', '190302', 'CHONTABAMBA', '1');
INSERT INTO `distritos` VALUES ('1528', '51', '19', '1903', '190303', 'CONSTITUCION', '1');
INSERT INTO `distritos` VALUES ('1529', '51', '19', '1903', '190304', 'HUANCABAMBA', '1');
INSERT INTO `distritos` VALUES ('1530', '51', '19', '1903', '190305', 'PALCAZU', '1');
INSERT INTO `distritos` VALUES ('1531', '51', '19', '1903', '190306', 'POZUZO', '1');
INSERT INTO `distritos` VALUES ('1532', '51', '19', '1903', '190307', 'PUERTO BERMUDEZ', '1');
INSERT INTO `distritos` VALUES ('1533', '51', '19', '1903', '190308', 'VILLA RICA', '1');
INSERT INTO `distritos` VALUES ('1534', '51', '20', '2001', '200101', 'CASTILLA', '1');
INSERT INTO `distritos` VALUES ('1535', '51', '20', '2001', '200102', 'CATACAOS', '1');
INSERT INTO `distritos` VALUES ('1536', '51', '20', '2001', '200103', 'CURA MORI', '1');
INSERT INTO `distritos` VALUES ('1537', '51', '20', '2001', '200104', 'EL TALLAN', '1');
INSERT INTO `distritos` VALUES ('1538', '51', '20', '2001', '200105', 'LA ARENA', '1');
INSERT INTO `distritos` VALUES ('1539', '51', '20', '2001', '200106', 'LA UNION', '1');
INSERT INTO `distritos` VALUES ('1540', '51', '20', '2001', '200107', 'LAS LOMAS', '1');
INSERT INTO `distritos` VALUES ('1541', '51', '20', '2001', '200108', 'PIURA', '1');
INSERT INTO `distritos` VALUES ('1542', '51', '20', '2001', '200109', 'TAMBOGRANDE', '1');
INSERT INTO `distritos` VALUES ('1543', '51', '20', '2001', '200110', 'VEINTISEIS DE OCTUBRE', '1');
INSERT INTO `distritos` VALUES ('1544', '51', '20', '2002', '200201', 'AYABACA', '1');
INSERT INTO `distritos` VALUES ('1545', '51', '20', '2002', '200202', 'FRIAS', '1');
INSERT INTO `distritos` VALUES ('1546', '51', '20', '2002', '200203', 'JILILI', '1');
INSERT INTO `distritos` VALUES ('1547', '51', '20', '2002', '200204', 'LAGUNAS', '1');
INSERT INTO `distritos` VALUES ('1548', '51', '20', '2002', '200205', 'MONTERO', '1');
INSERT INTO `distritos` VALUES ('1549', '51', '20', '2002', '200206', 'PACAIPAMPA', '1');
INSERT INTO `distritos` VALUES ('1550', '51', '20', '2002', '200207', 'PAIMAS', '1');
INSERT INTO `distritos` VALUES ('1551', '51', '20', '2002', '200208', 'SAPILLICA', '1');
INSERT INTO `distritos` VALUES ('1552', '51', '20', '2002', '200209', 'SICCHEZ', '1');
INSERT INTO `distritos` VALUES ('1553', '51', '20', '2002', '200210', 'SUYO', '1');
INSERT INTO `distritos` VALUES ('1554', '51', '20', '2003', '200301', 'HUANCABAMBA', '1');
INSERT INTO `distritos` VALUES ('1555', '51', '20', '2003', '200302', 'CANCHAQUE', '1');
INSERT INTO `distritos` VALUES ('1556', '51', '20', '2003', '200303', 'EL CARMEN DE LA FRONTERA', '1');
INSERT INTO `distritos` VALUES ('1557', '51', '20', '2003', '200304', 'HUARMACA', '1');
INSERT INTO `distritos` VALUES ('1558', '51', '20', '2003', '200305', 'LALAQUIZ', '1');
INSERT INTO `distritos` VALUES ('1559', '51', '20', '2003', '200306', 'SAN MIGUEL DE EL FAIQUE', '1');
INSERT INTO `distritos` VALUES ('1560', '51', '20', '2003', '200307', 'SONDOR', '1');
INSERT INTO `distritos` VALUES ('1561', '51', '20', '2003', '200308', 'SONDORILLO', '1');
INSERT INTO `distritos` VALUES ('1562', '51', '20', '2004', '200401', 'CHULUCANAS', '1');
INSERT INTO `distritos` VALUES ('1563', '51', '20', '2004', '200402', 'BUENOS AIRES', '1');
INSERT INTO `distritos` VALUES ('1564', '51', '20', '2004', '200403', 'CHALACO', '1');
INSERT INTO `distritos` VALUES ('1565', '51', '20', '2004', '200404', 'LA MATANZA', '1');
INSERT INTO `distritos` VALUES ('1566', '51', '20', '2004', '200405', 'MORROPON', '1');
INSERT INTO `distritos` VALUES ('1567', '51', '20', '2004', '200406', 'SALITRAL', '1');
INSERT INTO `distritos` VALUES ('1568', '51', '20', '2004', '200407', 'SAN JUAN DE BIGOTE', '1');
INSERT INTO `distritos` VALUES ('1569', '51', '20', '2004', '200408', 'SANTA CATALINA DE MOSSA', '1');
INSERT INTO `distritos` VALUES ('1570', '51', '20', '2004', '200409', 'SANTO DOMINGO', '1');
INSERT INTO `distritos` VALUES ('1571', '51', '20', '2004', '200410', 'YAMANGO', '1');
INSERT INTO `distritos` VALUES ('1572', '51', '20', '2005', '200501', 'PAITA', '1');
INSERT INTO `distritos` VALUES ('1573', '51', '20', '2005', '200502', 'AMOTAPE', '1');
INSERT INTO `distritos` VALUES ('1574', '51', '20', '2005', '200503', 'COLAN', '1');
INSERT INTO `distritos` VALUES ('1575', '51', '20', '2005', '200504', 'EL ARENAL', '1');
INSERT INTO `distritos` VALUES ('1576', '51', '20', '2005', '200505', 'LA HUACA', '1');
INSERT INTO `distritos` VALUES ('1577', '51', '20', '2005', '200506', 'TAMARINDO', '1');
INSERT INTO `distritos` VALUES ('1578', '51', '20', '2005', '200507', 'VICHAYAL', '1');
INSERT INTO `distritos` VALUES ('1579', '51', '20', '2006', '200601', 'SULLANA', '1');
INSERT INTO `distritos` VALUES ('1580', '51', '20', '2006', '200602', 'BELLAVISTA', '1');
INSERT INTO `distritos` VALUES ('1581', '51', '20', '2006', '200603', 'MARCAVELICA', '1');
INSERT INTO `distritos` VALUES ('1582', '51', '20', '2006', '200604', 'SALITRAL', '1');
INSERT INTO `distritos` VALUES ('1583', '51', '20', '2006', '200605', 'QUERECOTILLO', '1');
INSERT INTO `distritos` VALUES ('1584', '51', '20', '2006', '200606', 'LANCONES', '1');
INSERT INTO `distritos` VALUES ('1585', '51', '20', '2006', '200607', 'IGNACIO ESCUDERO', '1');
INSERT INTO `distritos` VALUES ('1586', '51', '20', '2006', '200608', 'MIGUEL CHECA', '1');
INSERT INTO `distritos` VALUES ('1587', '51', '20', '2007', '200701', 'PARINAS', '1');
INSERT INTO `distritos` VALUES ('1588', '51', '20', '2007', '200702', 'EL ALTO', '1');
INSERT INTO `distritos` VALUES ('1589', '51', '20', '2007', '200703', 'LA BREA', '1');
INSERT INTO `distritos` VALUES ('1590', '51', '20', '2007', '200704', 'LOBITOS', '1');
INSERT INTO `distritos` VALUES ('1591', '51', '20', '2007', '200705', 'LOS ORGANOS', '1');
INSERT INTO `distritos` VALUES ('1592', '51', '20', '2007', '200706', 'MANCORA', '1');
INSERT INTO `distritos` VALUES ('1593', '51', '20', '2008', '200801', 'SECHURA', '1');
INSERT INTO `distritos` VALUES ('1594', '51', '20', '2008', '200802', 'BELLAVISTA DE LA UNION', '1');
INSERT INTO `distritos` VALUES ('1595', '51', '20', '2008', '200803', 'BERNAL', '1');
INSERT INTO `distritos` VALUES ('1596', '51', '20', '2008', '200804', 'CRISTO NOS VALGA', '1');
INSERT INTO `distritos` VALUES ('1597', '51', '20', '2008', '200805', 'RINCONADA-LLICUAR', '1');
INSERT INTO `distritos` VALUES ('1598', '51', '20', '2008', '200806', 'VICE', '1');
INSERT INTO `distritos` VALUES ('1599', '51', '21', '2101', '210101', 'ACORA', '1');
INSERT INTO `distritos` VALUES ('1600', '51', '21', '2101', '210102', 'AMANTANI', '1');
INSERT INTO `distritos` VALUES ('1601', '51', '21', '2101', '210103', 'ATUNCOLLA', '1');
INSERT INTO `distritos` VALUES ('1602', '51', '21', '2101', '210104', 'CAPACHICA', '1');
INSERT INTO `distritos` VALUES ('1603', '51', '21', '2101', '210105', 'CHUCUITO', '1');
INSERT INTO `distritos` VALUES ('1604', '51', '21', '2101', '210106', 'COATA', '1');
INSERT INTO `distritos` VALUES ('1605', '51', '21', '2101', '210107', 'HUATA', '1');
INSERT INTO `distritos` VALUES ('1606', '51', '21', '2101', '210108', 'MANAZO', '1');
INSERT INTO `distritos` VALUES ('1607', '51', '21', '2101', '210109', 'PAUCARCOLLA', '1');
INSERT INTO `distritos` VALUES ('1608', '51', '21', '2101', '210110', 'PICHACANI', '1');
INSERT INTO `distritos` VALUES ('1609', '51', '21', '2101', '210111', 'PLATERIA', '1');
INSERT INTO `distritos` VALUES ('1610', '51', '21', '2101', '210112', 'PUNO', '1');
INSERT INTO `distritos` VALUES ('1611', '51', '21', '2101', '210113', 'SAN ANTONIO', '1');
INSERT INTO `distritos` VALUES ('1612', '51', '21', '2101', '210114', 'TIQUILLACA', '1');
INSERT INTO `distritos` VALUES ('1613', '51', '21', '2101', '210115', 'VILQUE', '1');
INSERT INTO `distritos` VALUES ('1614', '51', '21', '2111', '211101', 'CABANA', '1');
INSERT INTO `distritos` VALUES ('1615', '51', '21', '2111', '211102', 'CABANILLAS', '1');
INSERT INTO `distritos` VALUES ('1616', '51', '21', '2111', '211103', 'CARACOTO', '1');
INSERT INTO `distritos` VALUES ('1617', '51', '21', '2111', '211104', 'JULIACA', '1');
INSERT INTO `distritos` VALUES ('1618', '51', '21', '2111', '211105', 'SAN MIGUEL', '1');
INSERT INTO `distritos` VALUES ('1619', '51', '21', '2102', '210201', 'AZANGARO', '1');
INSERT INTO `distritos` VALUES ('1620', '51', '21', '2102', '210202', 'ACHAYA', '1');
INSERT INTO `distritos` VALUES ('1621', '51', '21', '2102', '210203', 'ARAPA', '1');
INSERT INTO `distritos` VALUES ('1622', '51', '21', '2102', '210204', 'ASILLO', '1');
INSERT INTO `distritos` VALUES ('1623', '51', '21', '2102', '210205', 'CAMINACA', '1');
INSERT INTO `distritos` VALUES ('1624', '51', '21', '2102', '210206', 'CHUPA', '1');
INSERT INTO `distritos` VALUES ('1625', '51', '21', '2102', '210207', 'JOSE DOMINGO CHOQUEHUANCA', '1');
INSERT INTO `distritos` VALUES ('1626', '51', '21', '2102', '210208', 'MUNANI', '1');
INSERT INTO `distritos` VALUES ('1627', '51', '21', '2102', '210209', 'POTONI', '1');
INSERT INTO `distritos` VALUES ('1628', '51', '21', '2102', '210210', 'SAMAN', '1');
INSERT INTO `distritos` VALUES ('1629', '51', '21', '2102', '210211', 'SAN ANTON', '1');
INSERT INTO `distritos` VALUES ('1630', '51', '21', '2102', '210212', 'SAN JOSE', '1');
INSERT INTO `distritos` VALUES ('1631', '51', '21', '2102', '210213', 'SAN JUAN DE SALINAS', '1');
INSERT INTO `distritos` VALUES ('1632', '51', '21', '2102', '210214', 'SANTIAGO DE PUPUJA', '1');
INSERT INTO `distritos` VALUES ('1633', '51', '21', '2102', '210215', 'TIRAPATA', '1');
INSERT INTO `distritos` VALUES ('1634', '51', '21', '2104', '210401', 'JULI', '1');
INSERT INTO `distritos` VALUES ('1635', '51', '21', '2104', '210402', 'DESAGUADERO', '1');
INSERT INTO `distritos` VALUES ('1636', '51', '21', '2104', '210403', 'HUACULLANI', '1');
INSERT INTO `distritos` VALUES ('1637', '51', '21', '2104', '210404', 'KELLUYO', '1');
INSERT INTO `distritos` VALUES ('1638', '51', '21', '2104', '210405', 'PISACOMA', '1');
INSERT INTO `distritos` VALUES ('1639', '51', '21', '2104', '210406', 'POMATA', '1');
INSERT INTO `distritos` VALUES ('1640', '51', '21', '2104', '210407', 'ZEPITA', '1');
INSERT INTO `distritos` VALUES ('1641', '51', '21', '2105', '210501', 'CAPASO', '1');
INSERT INTO `distritos` VALUES ('1642', '51', '21', '2105', '210502', 'CONDURIRI', '1');
INSERT INTO `distritos` VALUES ('1643', '51', '21', '2105', '210503', 'ILAVE', '1');
INSERT INTO `distritos` VALUES ('1644', '51', '21', '2105', '210504', 'PILCUYO', '1');
INSERT INTO `distritos` VALUES ('1645', '51', '21', '2105', '210505', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('1646', '51', '21', '2108', '210801', 'ANTAUTA', '1');
INSERT INTO `distritos` VALUES ('1647', '51', '21', '2108', '210802', 'AYAVIRI', '1');
INSERT INTO `distritos` VALUES ('1648', '51', '21', '2108', '210803', 'CUPI', '1');
INSERT INTO `distritos` VALUES ('1649', '51', '21', '2108', '210804', 'LLALLI', '1');
INSERT INTO `distritos` VALUES ('1650', '51', '21', '2108', '210805', 'MACARI', '1');
INSERT INTO `distritos` VALUES ('1651', '51', '21', '2108', '210806', 'NUNOA', '1');
INSERT INTO `distritos` VALUES ('1652', '51', '21', '2108', '210807', 'ORURILLO', '1');
INSERT INTO `distritos` VALUES ('1653', '51', '21', '2108', '210808', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('1654', '51', '21', '2108', '210809', 'UMACHIRI', '1');
INSERT INTO `distritos` VALUES ('1655', '51', '21', '2103', '210301', 'AJOYANI', '1');
INSERT INTO `distritos` VALUES ('1656', '51', '21', '2103', '210302', 'AYAPATA', '1');
INSERT INTO `distritos` VALUES ('1657', '51', '21', '2103', '210303', 'COASA', '1');
INSERT INTO `distritos` VALUES ('1658', '51', '21', '2103', '210304', 'CORANI', '1');
INSERT INTO `distritos` VALUES ('1659', '51', '21', '2103', '210305', 'CRUCERO', '1');
INSERT INTO `distritos` VALUES ('1660', '51', '21', '2103', '210306', 'ITUATA', '1');
INSERT INTO `distritos` VALUES ('1661', '51', '21', '2103', '210307', 'MACUSANI', '1');
INSERT INTO `distritos` VALUES ('1662', '51', '21', '2103', '210308', 'OLLACHEA', '1');
INSERT INTO `distritos` VALUES ('1663', '51', '21', '2103', '210309', 'SAN GABAN', '1');
INSERT INTO `distritos` VALUES ('1664', '51', '21', '2103', '210310', 'USICAYOS', '1');
INSERT INTO `distritos` VALUES ('1665', '51', '21', '2106', '210601', 'HUANCANE', '1');
INSERT INTO `distritos` VALUES ('1666', '51', '21', '2106', '210602', 'PUSI', '1');
INSERT INTO `distritos` VALUES ('1667', '51', '21', '2106', '210603', 'VILQUE CHICO', '1');
INSERT INTO `distritos` VALUES ('1668', '51', '21', '2106', '210604', 'TARACO', '1');
INSERT INTO `distritos` VALUES ('1669', '51', '21', '2106', '210605', 'HUATASANI', '1');
INSERT INTO `distritos` VALUES ('1670', '51', '21', '2112', '211201', 'ALTO INAMBARI', '1');
INSERT INTO `distritos` VALUES ('1671', '51', '21', '2112', '211202', 'CUYOCUYO', '1');
INSERT INTO `distritos` VALUES ('1672', '51', '21', '2112', '211203', 'LIMBANI', '1');
INSERT INTO `distritos` VALUES ('1673', '51', '21', '2112', '211204', 'PATAMBUCO', '1');
INSERT INTO `distritos` VALUES ('1674', '51', '21', '2112', '211205', 'QUIACA', '1');
INSERT INTO `distritos` VALUES ('1675', '51', '21', '2112', '211206', 'SAN JUAN DEL ORO', '1');
INSERT INTO `distritos` VALUES ('1676', '51', '21', '2112', '211207', 'SAN PEDRO DE PUTINAPUNCO', '1');
INSERT INTO `distritos` VALUES ('1677', '51', '21', '2112', '211208', 'SANDIA', '1');
INSERT INTO `distritos` VALUES ('1678', '51', '21', '2112', '211209', 'YANAHUAYA', '1');
INSERT INTO `distritos` VALUES ('1679', '51', '21', '2112', '211210', 'PHARA', '1');
INSERT INTO `distritos` VALUES ('1680', '51', '21', '2110', '211001', 'ANANEA', '1');
INSERT INTO `distritos` VALUES ('1681', '51', '21', '2110', '211002', 'PEDRO VILCA APAZA', '1');
INSERT INTO `distritos` VALUES ('1682', '51', '21', '2110', '211003', 'PUTINA', '1');
INSERT INTO `distritos` VALUES ('1683', '51', '21', '2110', '211004', 'QUILCAPUNCU', '1');
INSERT INTO `distritos` VALUES ('1684', '51', '21', '2110', '211005', 'SINA', '1');
INSERT INTO `distritos` VALUES ('1685', '51', '21', '2107', '210701', 'CABANILLA', '1');
INSERT INTO `distritos` VALUES ('1686', '51', '21', '2107', '210702', 'CALAPUJA', '1');
INSERT INTO `distritos` VALUES ('1687', '51', '21', '2107', '210703', 'LAMPA', '1');
INSERT INTO `distritos` VALUES ('1688', '51', '21', '2107', '210704', 'NICASIO', '1');
INSERT INTO `distritos` VALUES ('1689', '51', '21', '2107', '210705', 'OCUVIRI', '1');
INSERT INTO `distritos` VALUES ('1690', '51', '21', '2107', '210706', 'PALCA', '1');
INSERT INTO `distritos` VALUES ('1691', '51', '21', '2107', '210707', 'PARATIA', '1');
INSERT INTO `distritos` VALUES ('1692', '51', '21', '2107', '210708', 'PUCARA', '1');
INSERT INTO `distritos` VALUES ('1693', '51', '21', '2107', '210709', 'SANTA LUCIA', '1');
INSERT INTO `distritos` VALUES ('1694', '51', '21', '2107', '210710', 'VILAVILA', '1');
INSERT INTO `distritos` VALUES ('1695', '51', '21', '2113', '211301', 'YUNGUYO', '1');
INSERT INTO `distritos` VALUES ('1696', '51', '21', '2113', '211302', 'ANAPIA', '1');
INSERT INTO `distritos` VALUES ('1697', '51', '21', '2113', '211303', 'COPANI', '1');
INSERT INTO `distritos` VALUES ('1698', '51', '21', '2113', '211304', 'CUTURAPI', '1');
INSERT INTO `distritos` VALUES ('1699', '51', '21', '2113', '211305', 'OLLARAYA', '1');
INSERT INTO `distritos` VALUES ('1700', '51', '21', '2113', '211306', 'TINICACHI', '1');
INSERT INTO `distritos` VALUES ('1701', '51', '21', '2113', '211307', 'UNICACHI', '1');
INSERT INTO `distritos` VALUES ('1702', '51', '21', '2109', '210901', 'CONIMA', '1');
INSERT INTO `distritos` VALUES ('1703', '51', '21', '2109', '210902', 'HUAYRAPATA', '1');
INSERT INTO `distritos` VALUES ('1704', '51', '21', '2109', '210903', 'MOHO', '1');
INSERT INTO `distritos` VALUES ('1705', '51', '21', '2109', '210904', 'TILALI', '1');
INSERT INTO `distritos` VALUES ('1706', '51', '22', '2201', '220101', 'MOYOBAMBA', '1');
INSERT INTO `distritos` VALUES ('1707', '51', '22', '2201', '220102', 'CALZADA', '1');
INSERT INTO `distritos` VALUES ('1708', '51', '22', '2201', '220103', 'HABANA', '1');
INSERT INTO `distritos` VALUES ('1709', '51', '22', '2201', '220104', 'JEPELACIO', '1');
INSERT INTO `distritos` VALUES ('1710', '51', '22', '2201', '220105', 'SORITOR', '1');
INSERT INTO `distritos` VALUES ('1711', '51', '22', '2201', '220106', 'YANTALO', '1');
INSERT INTO `distritos` VALUES ('1712', '51', '22', '2202', '220201', 'BELLAVISTA', '1');
INSERT INTO `distritos` VALUES ('1713', '51', '22', '2202', '220202', 'ALTO BIAVO', '1');
INSERT INTO `distritos` VALUES ('1714', '51', '22', '2202', '220203', 'BAJO BIAVO', '1');
INSERT INTO `distritos` VALUES ('1715', '51', '22', '2202', '220204', 'HUALLAGA', '1');
INSERT INTO `distritos` VALUES ('1716', '51', '22', '2202', '220205', 'SAN PABLO', '1');
INSERT INTO `distritos` VALUES ('1717', '51', '22', '2202', '220206', 'SAN RAFAEL', '1');
INSERT INTO `distritos` VALUES ('1718', '51', '22', '2203', '220301', 'SAN JOSEDE SISA', '1');
INSERT INTO `distritos` VALUES ('1719', '51', '22', '2203', '220302', 'AGUA BLANCA', '1');
INSERT INTO `distritos` VALUES ('1720', '51', '22', '2203', '220303', 'SAN MARTIN', '1');
INSERT INTO `distritos` VALUES ('1721', '51', '22', '2203', '220304', 'SANTA ROSA', '1');
INSERT INTO `distritos` VALUES ('1722', '51', '22', '2203', '220305', 'SHATOJA', '1');
INSERT INTO `distritos` VALUES ('1723', '51', '22', '2204', '220401', 'SAPOSOA', '1');
INSERT INTO `distritos` VALUES ('1724', '51', '22', '2204', '220402', 'ALTO SAPOSOA', '1');
INSERT INTO `distritos` VALUES ('1725', '51', '22', '2204', '220403', 'EL ESLABON', '1');
INSERT INTO `distritos` VALUES ('1726', '51', '22', '2204', '220404', 'PISCOYACU', '1');
INSERT INTO `distritos` VALUES ('1727', '51', '22', '2204', '220405', 'SACANCHE', '1');
INSERT INTO `distritos` VALUES ('1728', '51', '22', '2204', '220406', 'TINGO DE SAPOSOA', '1');
INSERT INTO `distritos` VALUES ('1729', '51', '22', '2205', '220501', 'LAMAS', '1');
INSERT INTO `distritos` VALUES ('1730', '51', '22', '2205', '220502', 'ALONSO DE ALVARADO', '1');
INSERT INTO `distritos` VALUES ('1731', '51', '22', '2205', '220503', 'BARRANQUITA', '1');
INSERT INTO `distritos` VALUES ('1732', '51', '22', '2205', '220504', 'CAYNARACHI', '1');
INSERT INTO `distritos` VALUES ('1733', '51', '22', '2205', '220505', 'CUNUNBUQUI', '1');
INSERT INTO `distritos` VALUES ('1734', '51', '22', '2205', '220506', 'PINTO RECODO', '1');
INSERT INTO `distritos` VALUES ('1735', '51', '22', '2205', '220507', 'RUMISAPA', '1');
INSERT INTO `distritos` VALUES ('1736', '51', '22', '2205', '220508', 'SAN ROQUE DE CUMBAZA', '1');
INSERT INTO `distritos` VALUES ('1737', '51', '22', '2205', '220509', 'SHANAO', '1');
INSERT INTO `distritos` VALUES ('1738', '51', '22', '2205', '220510', 'TABALOSOS', '1');
INSERT INTO `distritos` VALUES ('1739', '51', '22', '2205', '220511', 'ZAPATERO', '1');
INSERT INTO `distritos` VALUES ('1740', '51', '22', '2206', '220601', 'JUANJUI', '1');
INSERT INTO `distritos` VALUES ('1741', '51', '22', '2206', '220602', 'CAMPANILLA', '1');
INSERT INTO `distritos` VALUES ('1742', '51', '22', '2206', '220603', 'HUICUNGO', '1');
INSERT INTO `distritos` VALUES ('1743', '51', '22', '2206', '220604', 'PACHIZA', '1');
INSERT INTO `distritos` VALUES ('1744', '51', '22', '2206', '220605', 'PAJARILLO', '1');
INSERT INTO `distritos` VALUES ('1745', '51', '22', '2207', '220701', 'PICOTA', '1');
INSERT INTO `distritos` VALUES ('1746', '51', '22', '2207', '220702', 'LEONCIO PRADO', '1');
INSERT INTO `distritos` VALUES ('1747', '51', '22', '2207', '220703', 'NUEVA AMERICA', '1');
INSERT INTO `distritos` VALUES ('1748', '51', '22', '2207', '220704', 'SAN ANTONIO', '1');
INSERT INTO `distritos` VALUES ('1749', '51', '22', '2207', '220705', 'VILLANUEVA', '1');
INSERT INTO `distritos` VALUES ('1750', '51', '22', '2207', '220706', 'BUENOS AIRES', '1');
INSERT INTO `distritos` VALUES ('1751', '51', '22', '2207', '220707', 'CASPIZAPA', '1');
INSERT INTO `distritos` VALUES ('1752', '51', '22', '2207', '220708', 'PORVENIR', '1');
INSERT INTO `distritos` VALUES ('1753', '51', '22', '2208', '220801', 'RIOJA', '1');
INSERT INTO `distritos` VALUES ('1754', '51', '22', '2208', '220802', 'AWAJUN', '1');
INSERT INTO `distritos` VALUES ('1755', '51', '22', '2208', '220803', 'ELIAS SOPLIN VARGAS', '1');
INSERT INTO `distritos` VALUES ('1756', '51', '22', '2208', '220804', 'NUEVA CAJAMARCA', '1');
INSERT INTO `distritos` VALUES ('1757', '51', '22', '2208', '220805', 'PARDO MIGUEL', '1');
INSERT INTO `distritos` VALUES ('1758', '51', '22', '2208', '220806', 'POSIC', '1');
INSERT INTO `distritos` VALUES ('1759', '51', '22', '2208', '220807', 'SAN FERNANDO', '1');
INSERT INTO `distritos` VALUES ('1760', '51', '22', '2208', '220808', 'YORONGOS', '1');
INSERT INTO `distritos` VALUES ('1761', '51', '22', '2208', '220809', 'YURACYACU', '1');
INSERT INTO `distritos` VALUES ('1762', '51', '22', '2209', '220901', 'TARAPOTO', '1');
INSERT INTO `distritos` VALUES ('1763', '51', '22', '2209', '220902', 'ALBERTO LEVEAU', '1');
INSERT INTO `distritos` VALUES ('1764', '51', '22', '2209', '220903', 'CACATACHI', '1');
INSERT INTO `distritos` VALUES ('1765', '51', '22', '2209', '220904', 'CHAZUTA', '1');
INSERT INTO `distritos` VALUES ('1766', '51', '22', '2209', '220905', 'CHIPURANA', '1');
INSERT INTO `distritos` VALUES ('1767', '51', '22', '2209', '220906', 'EL PORVENIR', '1');
INSERT INTO `distritos` VALUES ('1768', '51', '22', '2209', '220907', 'HUIMBAYOC', '1');
INSERT INTO `distritos` VALUES ('1769', '51', '22', '2209', '220908', 'JUAN GUERRA', '1');
INSERT INTO `distritos` VALUES ('1770', '51', '22', '2209', '220909', 'LA BANDA DE SHILCAYO', '1');
INSERT INTO `distritos` VALUES ('1771', '51', '22', '2209', '220910', 'MORALES', '1');
INSERT INTO `distritos` VALUES ('1772', '51', '22', '2209', '220911', 'PAPAPLAYA', '1');
INSERT INTO `distritos` VALUES ('1773', '51', '22', '2209', '220912', 'SAN ANTONIO', '1');
INSERT INTO `distritos` VALUES ('1774', '51', '22', '2209', '220913', 'SAUCE', '1');
INSERT INTO `distritos` VALUES ('1775', '51', '22', '2209', '220914', 'SHAPAJA', '1');
INSERT INTO `distritos` VALUES ('1776', '51', '22', '2210', '221001', 'TOCACHE', '1');
INSERT INTO `distritos` VALUES ('1777', '51', '22', '2210', '221002', 'NUEVO PROGRESO', '1');
INSERT INTO `distritos` VALUES ('1778', '51', '22', '2210', '221003', 'POLVORA', '1');
INSERT INTO `distritos` VALUES ('1779', '51', '22', '2210', '221004', 'SHUNTE', '1');
INSERT INTO `distritos` VALUES ('1780', '51', '22', '2210', '221005', 'UCHIZA', '1');
INSERT INTO `distritos` VALUES ('1781', '51', '23', '2302', '230201', 'CANDARAVE', '1');
INSERT INTO `distritos` VALUES ('1782', '51', '23', '2302', '230202', 'CAIRANI', '1');
INSERT INTO `distritos` VALUES ('1783', '51', '23', '2302', '230203', 'CAMILACA', '1');
INSERT INTO `distritos` VALUES ('1784', '51', '23', '2302', '230204', 'CURIBAYA', '1');
INSERT INTO `distritos` VALUES ('1785', '51', '23', '2302', '230205', 'HUANUARA', '1');
INSERT INTO `distritos` VALUES ('1786', '51', '23', '2302', '230206', 'QUILAHUANI', '1');
INSERT INTO `distritos` VALUES ('1787', '51', '23', '2303', '230301', 'ILABAYA', '1');
INSERT INTO `distritos` VALUES ('1788', '51', '23', '2303', '230302', 'ITE', '1');
INSERT INTO `distritos` VALUES ('1789', '51', '23', '2303', '230303', 'LOCUMBA', '1');
INSERT INTO `distritos` VALUES ('1790', '51', '23', '2301', '230101', 'TACNA', '1');
INSERT INTO `distritos` VALUES ('1791', '51', '23', '2301', '230102', 'ALTO DE LA ALIANZA', '1');
INSERT INTO `distritos` VALUES ('1792', '51', '23', '2301', '230103', 'PALCA', '1');
INSERT INTO `distritos` VALUES ('1793', '51', '23', '2301', '230104', 'CALANA', '1');
INSERT INTO `distritos` VALUES ('1794', '51', '23', '2301', '230105', 'CIUDAD NUEVA', '1');
INSERT INTO `distritos` VALUES ('1795', '51', '23', '2301', '230106', 'CORONEL GREGORIO ALBARRACIN LANCHIPA', '1');
INSERT INTO `distritos` VALUES ('1796', '51', '23', '2301', '230107', 'INCLAN', '1');
INSERT INTO `distritos` VALUES ('1797', '51', '23', '2301', '230108', 'LA YARADA-LOS PALOS', '1');
INSERT INTO `distritos` VALUES ('1798', '51', '23', '2301', '230109', 'PACHIA', '1');
INSERT INTO `distritos` VALUES ('1799', '51', '23', '2301', '230110', 'POCOLLAY', '1');
INSERT INTO `distritos` VALUES ('1800', '51', '23', '2301', '230111', 'POCOLLAY', '1');
INSERT INTO `distritos` VALUES ('1801', '51', '23', '2304', '230401', 'TARATA', '1');
INSERT INTO `distritos` VALUES ('1802', '51', '23', '2304', '230402', 'ESTIQUE', '1');
INSERT INTO `distritos` VALUES ('1803', '51', '23', '2304', '230403', 'ESTIQUE PAMPA', '1');
INSERT INTO `distritos` VALUES ('1804', '51', '23', '2304', '230404', 'HEROES ALBARRACIN ', '1');
INSERT INTO `distritos` VALUES ('1805', '51', '23', '2304', '230405', 'SITAJARA', '1');
INSERT INTO `distritos` VALUES ('1806', '51', '23', '2304', '230406', 'SUSAPAYA', '1');
INSERT INTO `distritos` VALUES ('1807', '51', '23', '2304', '230407', 'TARUCACHI', '1');
INSERT INTO `distritos` VALUES ('1808', '51', '23', '2304', '230408', 'TICACO', '1');
INSERT INTO `distritos` VALUES ('1809', '51', '24', '2401', '240101', 'TUMBES', '1');
INSERT INTO `distritos` VALUES ('1810', '51', '24', '2401', '240102', 'CORRALES', '1');
INSERT INTO `distritos` VALUES ('1811', '51', '24', '2401', '240103', 'LA CRUZ', '1');
INSERT INTO `distritos` VALUES ('1812', '51', '24', '2401', '240104', 'PAMPAS DE HOSPITAL', '1');
INSERT INTO `distritos` VALUES ('1813', '51', '24', '2401', '240105', 'SAN JACINTO', '1');
INSERT INTO `distritos` VALUES ('1814', '51', '24', '2401', '240106', 'SAN JUAN DE LA VIRGEN', '1');
INSERT INTO `distritos` VALUES ('1815', '51', '24', '2403', '240301', 'ZARUMILLA', '1');
INSERT INTO `distritos` VALUES ('1816', '51', '24', '2403', '240302', 'AGUAS VERDES', '1');
INSERT INTO `distritos` VALUES ('1817', '51', '24', '2403', '240303', 'PAPAYAL', '1');
INSERT INTO `distritos` VALUES ('1818', '51', '24', '2403', '240304', 'MATAPALO', '1');
INSERT INTO `distritos` VALUES ('1819', '51', '24', '2402', '240201', 'CANOAS DE PUNTA SAL', '1');
INSERT INTO `distritos` VALUES ('1820', '51', '24', '2402', '240202', 'CASITAS', '1');
INSERT INTO `distritos` VALUES ('1821', '51', '24', '2402', '240203', 'ZORRITOS', '1');
INSERT INTO `distritos` VALUES ('1822', '51', '13', '1307', '130701', 'GUADALUPE', '1');

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipdoc` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruc` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agno_fiscal` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distrito` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_sunat` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `empresas_ruc_unique` (`ruc`) USING BTREE,
  KEY `option` (`id_tipdoc`),
  CONSTRAINT `option` FOREIGN KEY (`id_tipdoc`) REFERENCES `tipo_docs` (`id_tipdoc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES ('4', '1', 'BRYAN', '10704012964', '2019', 'PUENTE PIEDRA', '', 'LIMA', 'LIMA', 'LIMA', '', 'market.com', '', '1', null, null);
INSERT INTO `empresas` VALUES ('6', '1', 'JOSTHEIN', '10704012965', '2019', 'SANTA ROSA', '', 'APURIMAC', 'AYMARAES', 'CHAPIMARCA', '', 'santa.com', '', '1', null, null);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subt` decimal(10,2) NOT NULL,
  `igv` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `items_id_venta_foreign` (`id_venta`),
  CONSTRAINT `items_id_venta_foreign` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of items
-- ----------------------------

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of marcas
-- ----------------------------
INSERT INTO `marcas` VALUES ('1', 'Todas', null, '1', null, '2019-10-29 18:47:00');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_menu` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_09_23_132438_create_marcas_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_09_27_171050_create_menus_table', '1');
INSERT INTO `migrations` VALUES ('5', '2019_09_28_160511_create_empresas_table', '1');
INSERT INTO `migrations` VALUES ('6', '2019_09_28_160512_create_tipo_docs_table', '1');
INSERT INTO `migrations` VALUES ('7', '2019_10_01_185830_create_departamentos_table', '1');
INSERT INTO `migrations` VALUES ('8', '2019_10_01_200107_create_provincias_table', '1');
INSERT INTO `migrations` VALUES ('9', '2019_10_01_201840_create_distritos_table', '1');
INSERT INTO `migrations` VALUES ('10', '2019_10_10_175623_create_sucursals_table', '1');
INSERT INTO `migrations` VALUES ('11', '2019_10_12_185416_create_categorias_table', '1');
INSERT INTO `migrations` VALUES ('12', '2019_10_12_185443_create_subcategorias_table', '1');
INSERT INTO `migrations` VALUES ('13', '2019_10_12_205409_create_productos_table', '1');
INSERT INTO `migrations` VALUES ('14', '2019_10_12_230044_create_producto_galerias_table', '1');
INSERT INTO `migrations` VALUES ('15', '2019_10_14_140203_create_slider_principals_table', '1');
INSERT INTO `migrations` VALUES ('16', '2019_10_14_144237_create_slider_ofertas_table', '1');
INSERT INTO `migrations` VALUES ('17', '2019_10_14_144258_create_slider_categorias_table', '1');
INSERT INTO `migrations` VALUES ('18', '2019_10_14_155617_create_producto_caracteristicas_table', '1');
INSERT INTO `migrations` VALUES ('19', '2019_10_16_174317_create_carritos_table', '1');
INSERT INTO `migrations` VALUES ('20', '2019_10_17_221745_create_permission_tables', '1');
INSERT INTO `migrations` VALUES ('21', '2019_10_22_164851_create_tasas_table', '2');
INSERT INTO `migrations` VALUES ('22', '2019_10_22_215450_create_ventas_table', '3');
INSERT INTO `migrations` VALUES ('24', '2019_10_23_174709_create_items_table', '4');
INSERT INTO `migrations` VALUES ('25', '2019_10_29_141523_create_acerca_de_table', '5');
INSERT INTO `migrations` VALUES ('26', '2019_10_29_150849_create_acercades_table', '6');

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id_prod` int(11) NOT NULL AUTO_INCREMENT,
  `id_subcat` int(11) NOT NULL,
  `cod_producto` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_prod`),
  UNIQUE KEY `productos_cod_producto_unique` (`cod_producto`),
  KEY `productos_id_subcat_foreign` (`id_subcat`),
  KEY `productos_id_marca_foreign` (`id_marca`),
  CONSTRAINT `productos_id_marca_foreign` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  CONSTRAINT `productos_id_subcat_foreign` FOREIGN KEY (`id_subcat`) REFERENCES `subcategorias` (`id_subcat`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('1', '1', 'PIJ3', '1', 'Pijama manga larga en rayada', 'uploads/teu20EvT9HI1aRPkWGd4WVyFNvs3plk7eVj6cIyU.png', '0.00', '25.00', '9', '1', '2019-10-18 01:20:39', '2019-10-29 19:17:42');
INSERT INTO `productos` VALUES ('3', '2', 'CAL1', '1', 'Boxer plomo', 'uploads/sn1LetNWvqIouCnNvRR2juJrbIuYXdBMaToO61FE.png', '0.00', '5.50', '5', '1', '2019-10-18 01:21:48', '2019-10-29 19:18:48');
INSERT INTO `productos` VALUES ('4', '1', 'PIJ2', '1', 'Pijama manga larga azul noche', 'uploads/anxcwQyqDBYjBz6Kr6uQIs8GdDy81sAiOYAeqyS5.png', '0.00', '40.00', '10', '1', '2019-10-18 01:23:03', '2019-10-29 19:11:31');
INSERT INTO `productos` VALUES ('5', '5', 'CA2', '1', 'Casaca Clara', 'uploads/NcdRZ1ni6wAkjSvGrLvkWOHJ9ETzifTL5nIZpvq5.png', '0.00', '70.00', '10', '1', '2019-10-18 01:25:07', '2019-10-29 19:08:36');
INSERT INTO `productos` VALUES ('6', '6', 'RE2', '1', 'Reloj para dama oscuro', 'uploads/QSNt7CSsQSOrsPzlbhpE4qahpF8vOTxpedhxQNMC.png', '0.00', '32.00', '10', '1', '2019-10-18 01:25:58', '2019-10-29 19:09:59');
INSERT INTO `productos` VALUES ('7', '6', 'RE1', '1', 'Reloj para dama rosado', 'uploads/yqLN5Ek2PIHLMpValdBk3gBXQPA4KUGwKe7hZVNg.png', '0.00', '15.00', '5', '1', '2019-10-18 01:26:57', '2019-10-29 19:09:21');
INSERT INTO `productos` VALUES ('13', '5', 'CA1', '1', 'Casaca Oscura', 'uploads/Zh0VvmpW1zMQsUo1KAMDHUmkBGwIDnCCr7EyrwL6.png', '0.00', '59.60', '10', '1', '2019-10-21 04:41:00', '2019-10-29 19:08:12');
INSERT INTO `productos` VALUES ('14', '1', 'PIJ1', '1', 'Pijama manga larga', 'uploads/a7MOY2WC9vRHdrm2YGFMNplkSRroQil6EFXSYhg5.png', '0.00', '45.50', '10', '1', '2019-10-22 12:12:07', '2019-10-29 19:11:07');
INSERT INTO `productos` VALUES ('15', '2', 'CAL2', '1', 'Boxer azul marino', 'uploads/ybFJFBlUHvj9t6BQBqFptQdogKwLznAKem2zATXS.png', '0.00', '6.00', '10', '1', '2019-10-29 07:19:21', null);

-- ----------------------------
-- Table structure for producto_caracteristicas
-- ----------------------------
DROP TABLE IF EXISTS `producto_caracteristicas`;
CREATE TABLE `producto_caracteristicas` (
  `id_caracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `id_prod` int(11) NOT NULL,
  `caracteristica` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica`),
  KEY `producto_caracteristicas_id_prod_foreign` (`id_prod`),
  CONSTRAINT `producto_caracteristicas_id_prod_foreign` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of producto_caracteristicas
-- ----------------------------
INSERT INTO `producto_caracteristicas` VALUES ('2', '1', '2 meses de vida(ya comen solos)', '2019-10-18 02:30:42', null);

-- ----------------------------
-- Table structure for producto_galerias
-- ----------------------------
DROP TABLE IF EXISTS `producto_galerias`;
CREATE TABLE `producto_galerias` (
  `id_galeria` int(11) NOT NULL AUTO_INCREMENT,
  `id_prod` int(11) NOT NULL,
  `imagen` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_galeria`),
  KEY `producto_galerias_id_prod_foreign` (`id_prod`),
  CONSTRAINT `producto_galerias_id_prod_foreign` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of producto_galerias
-- ----------------------------
INSERT INTO `producto_galerias` VALUES ('1', '1', 'uploads/V8rYgnPQysmhmjUsKhxPxnGIqEMeKDZiEu3Ps5pX.png', '2019-11-04 06:19:14', null);

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pais` int(11) NOT NULL,
  `cod_departamento` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `cod_provincia` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `provincia` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_provincia`),
  UNIQUE KEY `cod_provincia` (`cod_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of provincias
-- ----------------------------
INSERT INTO `provincias` VALUES ('1', '51', '01', '0101', 'CHACHAPOYAS', '1');
INSERT INTO `provincias` VALUES ('2', '51', '01', '0102', 'BAGUA', '1');
INSERT INTO `provincias` VALUES ('3', '51', '01', '0103', 'BONGARA', '1');
INSERT INTO `provincias` VALUES ('4', '51', '01', '0104', 'CONDORCANQUI', '1');
INSERT INTO `provincias` VALUES ('5', '51', '01', '0105', 'LUYA', '1');
INSERT INTO `provincias` VALUES ('6', '51', '01', '0106', 'RODRIGUEZ DE MENDOZA', '1');
INSERT INTO `provincias` VALUES ('7', '51', '01', '0107', 'UTCUBAMBA', '1');
INSERT INTO `provincias` VALUES ('8', '51', '02', '0201', 'HUARAZ', '1');
INSERT INTO `provincias` VALUES ('9', '51', '02', '0202', 'AIJA', '1');
INSERT INTO `provincias` VALUES ('10', '51', '02', '0203', 'ANTONIO RAIMONDI', '1');
INSERT INTO `provincias` VALUES ('11', '51', '02', '0204', 'ASUNCION', '1');
INSERT INTO `provincias` VALUES ('12', '51', '02', '0205', 'BOLOGNESI', '1');
INSERT INTO `provincias` VALUES ('13', '51', '02', '0206', 'CARHUAZ', '1');
INSERT INTO `provincias` VALUES ('14', '51', '02', '0207', 'CARLOS FERMIN FITZCARRALD', '1');
INSERT INTO `provincias` VALUES ('15', '51', '02', '0208', 'CASMA', '1');
INSERT INTO `provincias` VALUES ('16', '51', '02', '0209', 'CORONGO', '1');
INSERT INTO `provincias` VALUES ('17', '51', '02', '0210', 'HUARI', '1');
INSERT INTO `provincias` VALUES ('18', '51', '02', '0211', 'HUARMEY', '1');
INSERT INTO `provincias` VALUES ('19', '51', '02', '0212', 'HUAYLAS', '1');
INSERT INTO `provincias` VALUES ('20', '51', '02', '0213', 'MARISCAL LUZURIAGA', '1');
INSERT INTO `provincias` VALUES ('21', '51', '02', '0214', 'OCROS', '1');
INSERT INTO `provincias` VALUES ('22', '51', '02', '0215', 'PALLASCA', '1');
INSERT INTO `provincias` VALUES ('23', '51', '02', '0216', 'POMABAMBA', '1');
INSERT INTO `provincias` VALUES ('24', '51', '02', '0217', 'RECUAY', '1');
INSERT INTO `provincias` VALUES ('25', '51', '02', '0218', 'SANTA', '1');
INSERT INTO `provincias` VALUES ('26', '51', '02', '0219', 'SIHUAS', '1');
INSERT INTO `provincias` VALUES ('27', '51', '02', '0220', 'YUNGAY', '1');
INSERT INTO `provincias` VALUES ('28', '51', '03', '0301', 'ABANCAY', '1');
INSERT INTO `provincias` VALUES ('29', '51', '03', '0302', 'ANDAHUAYLAS', '1');
INSERT INTO `provincias` VALUES ('30', '51', '03', '0303', 'ANTABAMBA', '1');
INSERT INTO `provincias` VALUES ('31', '51', '03', '0304', 'AYMARAES', '1');
INSERT INTO `provincias` VALUES ('32', '51', '03', '0305', 'COTABAMBAS', '1');
INSERT INTO `provincias` VALUES ('33', '51', '03', '0306', 'CHINCHEROS', '1');
INSERT INTO `provincias` VALUES ('34', '51', '03', '0307', 'GRAU', '1');
INSERT INTO `provincias` VALUES ('35', '51', '04', '0401', 'AREQUIPA', '1');
INSERT INTO `provincias` VALUES ('36', '51', '04', '0402', 'CAMANA', '1');
INSERT INTO `provincias` VALUES ('37', '51', '04', '0403', 'CARAVELI', '1');
INSERT INTO `provincias` VALUES ('38', '51', '04', '0404', 'CASTILLA', '1');
INSERT INTO `provincias` VALUES ('39', '51', '04', '0405', 'CAYLLOMA', '1');
INSERT INTO `provincias` VALUES ('40', '51', '04', '0406', 'CONDESUYOS', '1');
INSERT INTO `provincias` VALUES ('41', '51', '04', '0407', 'ISLAY', '1');
INSERT INTO `provincias` VALUES ('42', '51', '04', '0408', 'LA UNION', '1');
INSERT INTO `provincias` VALUES ('43', '51', '05', '0501', 'HUAMANGA', '1');
INSERT INTO `provincias` VALUES ('44', '51', '05', '0502', 'CANGALLO', '1');
INSERT INTO `provincias` VALUES ('45', '51', '05', '0503', 'HUANCASANCOS', '1');
INSERT INTO `provincias` VALUES ('46', '51', '05', '0504', 'HUANTA', '1');
INSERT INTO `provincias` VALUES ('47', '51', '05', '0505', 'LA MAR', '1');
INSERT INTO `provincias` VALUES ('48', '51', '05', '0506', 'LUCANAS', '1');
INSERT INTO `provincias` VALUES ('49', '51', '05', '0507', 'PARINACOCHAS', '1');
INSERT INTO `provincias` VALUES ('50', '51', '05', '0508', 'PAUCAR DEL SARA SARA', '1');
INSERT INTO `provincias` VALUES ('51', '51', '05', '0509', 'SUCRE', '1');
INSERT INTO `provincias` VALUES ('52', '51', '05', '0511', 'VILCASHUAMAN', '1');
INSERT INTO `provincias` VALUES ('53', '51', '06', '0601', 'CAJAMARCA', '1');
INSERT INTO `provincias` VALUES ('54', '51', '06', '0602', 'CAJABAMBA', '1');
INSERT INTO `provincias` VALUES ('55', '51', '06', '0603', 'CELENDIN', '1');
INSERT INTO `provincias` VALUES ('56', '51', '06', '0604', 'CHOTA', '1');
INSERT INTO `provincias` VALUES ('57', '51', '06', '0605', 'CONTUMAZA', '1');
INSERT INTO `provincias` VALUES ('58', '51', '06', '0606', 'CUTERVO', '1');
INSERT INTO `provincias` VALUES ('59', '51', '06', '0607', 'HUALGAYOC', '1');
INSERT INTO `provincias` VALUES ('60', '51', '06', '0608', 'JAEN', '1');
INSERT INTO `provincias` VALUES ('61', '51', '06', '0609', 'SAN IGNACIO', '1');
INSERT INTO `provincias` VALUES ('62', '51', '06', '0610', 'SAN MARCOS', '1');
INSERT INTO `provincias` VALUES ('63', '51', '06', '0611', 'SAN MIGUEL', '1');
INSERT INTO `provincias` VALUES ('64', '51', '06', '0612', 'SAN PABLO', '1');
INSERT INTO `provincias` VALUES ('65', '51', '06', '0613', 'SANTA CRUZ', '1');
INSERT INTO `provincias` VALUES ('66', '51', '07', '0701', 'CALLAO', '1');
INSERT INTO `provincias` VALUES ('67', '51', '08', '0801', 'CUSCO', '1');
INSERT INTO `provincias` VALUES ('68', '51', '08', '0802', 'ACOMAYO', '1');
INSERT INTO `provincias` VALUES ('69', '51', '08', '0803', 'ANTA', '1');
INSERT INTO `provincias` VALUES ('70', '51', '08', '0804', 'CALCA', '1');
INSERT INTO `provincias` VALUES ('71', '51', '08', '0805', 'CANAS', '1');
INSERT INTO `provincias` VALUES ('72', '51', '08', '0806', 'CANCHIS', '1');
INSERT INTO `provincias` VALUES ('73', '51', '08', '0807', 'CHUMBIVILCAS', '1');
INSERT INTO `provincias` VALUES ('74', '51', '08', '0808', 'ESPINAR', '1');
INSERT INTO `provincias` VALUES ('75', '51', '08', '0809', 'LA CONVENCION', '1');
INSERT INTO `provincias` VALUES ('76', '51', '08', '0810', 'PARURO', '1');
INSERT INTO `provincias` VALUES ('77', '51', '08', '0811', 'PAUCARTAMBO', '1');
INSERT INTO `provincias` VALUES ('78', '51', '08', '0812', 'QUISPICANCHI', '1');
INSERT INTO `provincias` VALUES ('79', '51', '08', '0813', 'URUBAMBA', '1');
INSERT INTO `provincias` VALUES ('80', '51', '09', '0901', 'HUANCAVELICA', '1');
INSERT INTO `provincias` VALUES ('81', '51', '09', '0902', 'ACOBAMBA', '1');
INSERT INTO `provincias` VALUES ('82', '51', '09', '0903', 'ANGARAES', '1');
INSERT INTO `provincias` VALUES ('83', '51', '09', '0904', 'CASTROVIRREYNA', '1');
INSERT INTO `provincias` VALUES ('84', '51', '09', '0905', 'CHURCAMPA', '1');
INSERT INTO `provincias` VALUES ('85', '51', '09', '0906', 'HUAYTARA', '1');
INSERT INTO `provincias` VALUES ('86', '51', '09', '0907', 'TAYACAJA', '1');
INSERT INTO `provincias` VALUES ('87', '51', '10', '1001', 'HUANUCO', '1');
INSERT INTO `provincias` VALUES ('88', '51', '10', '1002', 'AMBO', '1');
INSERT INTO `provincias` VALUES ('89', '51', '10', '1003', 'DOS DE MAYO', '1');
INSERT INTO `provincias` VALUES ('90', '51', '10', '1004', 'HUACAYBAMBA', '1');
INSERT INTO `provincias` VALUES ('91', '51', '10', '1005', 'HUAMALIES', '1');
INSERT INTO `provincias` VALUES ('92', '51', '10', '1006', 'LEONCIO PRADO', '1');
INSERT INTO `provincias` VALUES ('93', '51', '10', '1007', 'MARANON', '1');
INSERT INTO `provincias` VALUES ('94', '51', '10', '1008', 'PACHITEA', '1');
INSERT INTO `provincias` VALUES ('95', '51', '10', '1009', 'PUERTO INCA', '1');
INSERT INTO `provincias` VALUES ('96', '51', '10', '1010', 'LAURICOCHA', '1');
INSERT INTO `provincias` VALUES ('97', '51', '10', '1011', 'YAROWILCA', '1');
INSERT INTO `provincias` VALUES ('98', '51', '11', '1101', 'ICA', '1');
INSERT INTO `provincias` VALUES ('99', '51', '11', '1102', 'CHINCHA', '1');
INSERT INTO `provincias` VALUES ('100', '51', '11', '1103', 'NAZCA', '1');
INSERT INTO `provincias` VALUES ('101', '51', '11', '1104', 'PALPA', '1');
INSERT INTO `provincias` VALUES ('102', '51', '11', '1105', 'PISCO', '1');
INSERT INTO `provincias` VALUES ('103', '51', '12', '1201', 'HUANCAYO', '1');
INSERT INTO `provincias` VALUES ('104', '51', '12', '1202', 'CONCEPCION', '1');
INSERT INTO `provincias` VALUES ('105', '51', '12', '1203', 'CHANCHAMAYO', '1');
INSERT INTO `provincias` VALUES ('106', '51', '12', '1204', 'JAUJA', '1');
INSERT INTO `provincias` VALUES ('107', '51', '12', '1205', 'JUNIN', '1');
INSERT INTO `provincias` VALUES ('108', '51', '12', '1206', 'SATIPO', '1');
INSERT INTO `provincias` VALUES ('109', '51', '12', '1207', 'TARMA', '1');
INSERT INTO `provincias` VALUES ('110', '51', '12', '1208', 'YAULI', '1');
INSERT INTO `provincias` VALUES ('111', '51', '12', '1209', 'CHUPACA', '1');
INSERT INTO `provincias` VALUES ('112', '51', '13', '1301', 'TRUJILLO', '1');
INSERT INTO `provincias` VALUES ('113', '51', '13', '1302', 'ASCOPE', '1');
INSERT INTO `provincias` VALUES ('114', '51', '13', '1303', 'BOLIVAR', '1');
INSERT INTO `provincias` VALUES ('115', '51', '13', '1304', 'CHEPEN', '1');
INSERT INTO `provincias` VALUES ('116', '51', '13', '1305', 'JULCAN', '1');
INSERT INTO `provincias` VALUES ('117', '51', '13', '1306', 'OTUZCO', '1');
INSERT INTO `provincias` VALUES ('118', '51', '13', '1307', 'PACASMAYO', '1');
INSERT INTO `provincias` VALUES ('119', '51', '13', '1308', 'PATAZ', '1');
INSERT INTO `provincias` VALUES ('120', '51', '13', '1309', 'SANCHEZ CARRION', '1');
INSERT INTO `provincias` VALUES ('121', '51', '13', '1310', 'SANTIAGO DE CHUCO', '1');
INSERT INTO `provincias` VALUES ('122', '51', '13', '1311', 'GRAN CHIMU', '1');
INSERT INTO `provincias` VALUES ('123', '51', '13', '1312', 'VIRU', '1');
INSERT INTO `provincias` VALUES ('124', '51', '14', '1401', 'CHICLAYO', '1');
INSERT INTO `provincias` VALUES ('125', '51', '14', '1402', 'FERRENAFE', '1');
INSERT INTO `provincias` VALUES ('126', '51', '14', '1403', 'LAMBAYEQUE', '1');
INSERT INTO `provincias` VALUES ('127', '51', '15', '1501', 'LIMA', '1');
INSERT INTO `provincias` VALUES ('128', '51', '15', '1502', 'BARRANCA', '1');
INSERT INTO `provincias` VALUES ('129', '51', '15', '1503', 'CAJATAMBO', '1');
INSERT INTO `provincias` VALUES ('130', '51', '15', '1504', 'CANTA', '1');
INSERT INTO `provincias` VALUES ('131', '51', '15', '1505', 'CANETE', '1');
INSERT INTO `provincias` VALUES ('132', '51', '15', '1506', 'HUARAL', '1');
INSERT INTO `provincias` VALUES ('133', '51', '15', '1507', 'HUAROCHIRI', '1');
INSERT INTO `provincias` VALUES ('134', '51', '15', '1508', 'HUAURA', '1');
INSERT INTO `provincias` VALUES ('135', '51', '15', '1509', 'OYON', '1');
INSERT INTO `provincias` VALUES ('136', '51', '15', '1510', 'YAUYOS', '1');
INSERT INTO `provincias` VALUES ('137', '51', '16', '1601', 'MAYNAS', '1');
INSERT INTO `provincias` VALUES ('138', '51', '16', '1602', 'ALTO AMAZONAS', '1');
INSERT INTO `provincias` VALUES ('139', '51', '16', '1603', 'LORETO', '1');
INSERT INTO `provincias` VALUES ('140', '51', '16', '1604', 'MARISCAL RAMON CASTILLA', '1');
INSERT INTO `provincias` VALUES ('141', '51', '16', '1605', 'REQUENA', '1');
INSERT INTO `provincias` VALUES ('142', '51', '16', '1606', 'UCAYALI', '1');
INSERT INTO `provincias` VALUES ('143', '51', '16', '1607', 'DATEM DEL MARANON', '1');
INSERT INTO `provincias` VALUES ('144', '51', '16', '1608', 'PUTUMAYO', '1');
INSERT INTO `provincias` VALUES ('145', '51', '17', '1701', 'TAMBOPATA', '1');
INSERT INTO `provincias` VALUES ('146', '51', '17', '1702', 'MANU', '1');
INSERT INTO `provincias` VALUES ('147', '51', '17', '1703', 'TAHUAMANU', '1');
INSERT INTO `provincias` VALUES ('148', '51', '18', '1801', 'MARISCAL NIETO', '1');
INSERT INTO `provincias` VALUES ('149', '51', '18', '1802', 'GENERAL SANCHEZ CERRO', '1');
INSERT INTO `provincias` VALUES ('150', '51', '18', '1803', 'ILO', '1');
INSERT INTO `provincias` VALUES ('151', '51', '19', '1901', 'PASCO', '1');
INSERT INTO `provincias` VALUES ('152', '51', '19', '1902', 'DANIEL ALCIDES CARRION', '1');
INSERT INTO `provincias` VALUES ('153', '51', '19', '1903', 'OXAPAMPA', '1');
INSERT INTO `provincias` VALUES ('154', '51', '20', '2001', 'PIURA', '1');
INSERT INTO `provincias` VALUES ('155', '51', '20', '2002', 'AYABACA', '1');
INSERT INTO `provincias` VALUES ('156', '51', '20', '2003', 'HUANCABAMBA', '1');
INSERT INTO `provincias` VALUES ('157', '51', '20', '2004', 'MORROPON', '1');
INSERT INTO `provincias` VALUES ('158', '51', '20', '2005', 'PAITA', '1');
INSERT INTO `provincias` VALUES ('159', '51', '20', '2006', 'SULLANA', '1');
INSERT INTO `provincias` VALUES ('160', '51', '20', '2007', 'TALARA', '1');
INSERT INTO `provincias` VALUES ('161', '51', '20', '2008', 'SECHURA', '1');
INSERT INTO `provincias` VALUES ('162', '51', '21', '2101', 'PUNO', '1');
INSERT INTO `provincias` VALUES ('163', '51', '21', '2102', 'AZANGARO', '1');
INSERT INTO `provincias` VALUES ('164', '51', '21', '2103', 'CARABAYA', '1');
INSERT INTO `provincias` VALUES ('165', '51', '21', '2104', 'CHUCUITO', '1');
INSERT INTO `provincias` VALUES ('166', '51', '21', '2105', 'EL COLLAO', '1');
INSERT INTO `provincias` VALUES ('167', '51', '21', '2106', 'HUANCANE', '1');
INSERT INTO `provincias` VALUES ('168', '51', '21', '2107', 'LAMPA', '1');
INSERT INTO `provincias` VALUES ('169', '51', '21', '2108', 'MELGAR', '1');
INSERT INTO `provincias` VALUES ('170', '51', '21', '2109', 'MOHO', '1');
INSERT INTO `provincias` VALUES ('171', '51', '21', '2110', 'SAN ANTONIO DE PUTINA', '1');
INSERT INTO `provincias` VALUES ('172', '51', '21', '2111', 'SAN ROMAN', '1');
INSERT INTO `provincias` VALUES ('173', '51', '21', '2112', 'SANDIA', '1');
INSERT INTO `provincias` VALUES ('174', '51', '21', '2113', 'YUNGUYO', '1');
INSERT INTO `provincias` VALUES ('175', '51', '22', '2201', 'MOYOBAMBA', '1');
INSERT INTO `provincias` VALUES ('176', '51', '22', '2202', 'BELLAVISTA', '1');
INSERT INTO `provincias` VALUES ('177', '51', '22', '2203', 'EL DORADO', '1');
INSERT INTO `provincias` VALUES ('178', '51', '22', '2204', 'HUALLAGA', '1');
INSERT INTO `provincias` VALUES ('179', '51', '22', '2205', 'LAMAS', '1');
INSERT INTO `provincias` VALUES ('180', '51', '22', '2206', 'MARISCAL CACERES', '1');
INSERT INTO `provincias` VALUES ('181', '51', '22', '2207', 'PICOTA', '1');
INSERT INTO `provincias` VALUES ('182', '51', '22', '2208', 'RIOJA', '1');
INSERT INTO `provincias` VALUES ('183', '51', '22', '2209', 'SAN MARTIN', '1');
INSERT INTO `provincias` VALUES ('184', '51', '22', '2210', 'TOCACHE', '1');
INSERT INTO `provincias` VALUES ('185', '51', '23', '2301', 'TACNA', '1');
INSERT INTO `provincias` VALUES ('186', '51', '23', '2302', 'CANDARAVE', '1');
INSERT INTO `provincias` VALUES ('187', '51', '23', '2303', 'JORGE BASADRE', '1');
INSERT INTO `provincias` VALUES ('188', '51', '23', '2304', 'TARATA', '1');
INSERT INTO `provincias` VALUES ('189', '51', '24', '2401', 'TUMBES', '1');
INSERT INTO `provincias` VALUES ('190', '51', '24', '2402', 'CONTRALMIRANTE VILLAR', '1');
INSERT INTO `provincias` VALUES ('191', '51', '24', '2403', 'ZARUMILLA', '1');
INSERT INTO `provincias` VALUES ('192', '51', '25', '2501', 'CORONEL PORTILLO', '1');
INSERT INTO `provincias` VALUES ('193', '51', '25', '2502', 'ATALAYA', '1');
INSERT INTO `provincias` VALUES ('194', '51', '25', '2503', 'PADRE ABAD', '1');
INSERT INTO `provincias` VALUES ('195', '51', '25', '2504', 'PURUS', '1');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for slider_categorias
-- ----------------------------
DROP TABLE IF EXISTS `slider_categorias`;
CREATE TABLE `slider_categorias` (
  `id_sc` int(11) NOT NULL AUTO_INCREMENT,
  `id_prod` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sc`),
  KEY `slider_categorias_id_prod_foreign` (`id_prod`),
  CONSTRAINT `slider_categorias_id_prod_foreign` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of slider_categorias
-- ----------------------------
INSERT INTO `slider_categorias` VALUES ('12', '1', '2019-10-30 04:50:42', null);
INSERT INTO `slider_categorias` VALUES ('13', '4', '2019-10-30 04:50:47', null);
INSERT INTO `slider_categorias` VALUES ('19', '14', '2019-10-30 04:51:20', null);
INSERT INTO `slider_categorias` VALUES ('20', '3', '2019-10-30 05:04:04', null);

-- ----------------------------
-- Table structure for slider_ofertas
-- ----------------------------
DROP TABLE IF EXISTS `slider_ofertas`;
CREATE TABLE `slider_ofertas` (
  `id_so` int(11) NOT NULL AUTO_INCREMENT,
  `id_prod` int(11) NOT NULL,
  `etiqueta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_so`),
  KEY `slider_ofertas_id_prod_foreign` (`id_prod`),
  CONSTRAINT `slider_ofertas_id_prod_foreign` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of slider_ofertas
-- ----------------------------
INSERT INTO `slider_ofertas` VALUES ('1', '7', 'OFERTA', '2019-10-18 01:30:36', null);
INSERT INTO `slider_ofertas` VALUES ('2', '1', 'OFERTA', '2019-10-18 01:30:40', null);
INSERT INTO `slider_ofertas` VALUES ('3', '3', 'RECIENTE', '2019-10-18 01:30:42', null);
INSERT INTO `slider_ofertas` VALUES ('4', '4', 'RECIENTE', '2019-10-18 01:30:44', null);
INSERT INTO `slider_ofertas` VALUES ('5', '5', 'RECIENTE', '2019-10-18 01:30:46', null);
INSERT INTO `slider_ofertas` VALUES ('6', '6', 'MAS VENDIDO', '2019-10-18 01:30:48', null);
INSERT INTO `slider_ofertas` VALUES ('7', '13', 'OFERTA', '2019-10-29 07:29:58', null);
INSERT INTO `slider_ofertas` VALUES ('8', '14', 'OFERTA', '2019-10-29 07:30:02', null);
INSERT INTO `slider_ofertas` VALUES ('9', '15', 'OFERTA', '2019-10-29 07:30:04', null);

-- ----------------------------
-- Table structure for slider_principals
-- ----------------------------
DROP TABLE IF EXISTS `slider_principals`;
CREATE TABLE `slider_principals` (
  `id_sp` int(11) NOT NULL AUTO_INCREMENT,
  `id_prod` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sp`),
  KEY `slider_principals_id_prod_foreign` (`id_prod`),
  CONSTRAINT `slider_principals_id_prod_foreign` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of slider_principals
-- ----------------------------
INSERT INTO `slider_principals` VALUES ('1', '3', '2019-10-18 01:29:47', null);
INSERT INTO `slider_principals` VALUES ('2', '4', '2019-10-18 01:29:50', null);
INSERT INTO `slider_principals` VALUES ('3', '1', '2019-10-18 01:29:51', null);
INSERT INTO `slider_principals` VALUES ('4', '5', '2019-10-18 01:29:52', null);
INSERT INTO `slider_principals` VALUES ('5', '6', '2019-10-18 01:29:53', null);
INSERT INTO `slider_principals` VALUES ('6', '7', '2019-10-18 01:29:54', null);
INSERT INTO `slider_principals` VALUES ('7', '13', '2019-10-30 02:29:35', null);
INSERT INTO `slider_principals` VALUES ('8', '14', '2019-10-30 02:29:37', null);
INSERT INTO `slider_principals` VALUES ('9', '15', '2019-10-30 02:29:38', null);

-- ----------------------------
-- Table structure for subcategorias
-- ----------------------------
DROP TABLE IF EXISTS `subcategorias`;
CREATE TABLE `subcategorias` (
  `id_subcat` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_subcat`),
  KEY `subcategorias_id_cat_foreign` (`id_cat`),
  CONSTRAINT `subcategorias_id_cat_foreign` FOREIGN KEY (`id_cat`) REFERENCES `categorias` (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of subcategorias
-- ----------------------------
INSERT INTO `subcategorias` VALUES ('1', '1', 'pillamas', null, '1', null, '2019-10-29 19:07:06');
INSERT INTO `subcategorias` VALUES ('2', '1', 'ropa interior', null, '1', null, '2019-10-29 19:07:14');
INSERT INTO `subcategorias` VALUES ('5', '2', 'casacas', null, '1', null, '2019-10-30 16:30:29');
INSERT INTO `subcategorias` VALUES ('6', '2', 'accesorios', null, '1', null, '2019-10-30 16:29:02');

-- ----------------------------
-- Table structure for sucursals
-- ----------------------------
DROP TABLE IF EXISTS `sucursals`;
CREATE TABLE `sucursals` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_tipdoc` int(11) DEFAULT NULL,
  `nombre` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruc` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distrito` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` text COLLATE utf8mb4_unicode_ci,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `sucursals_id_tipdoc_foreign` (`id_tipdoc`),
  KEY `sucursals_id_empresa_foreign` (`id_empresa`),
  CONSTRAINT `sucursals_id_empresa_foreign` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`),
  CONSTRAINT `sucursals_id_tipdoc_foreign` FOREIGN KEY (`id_tipdoc`) REFERENCES `tipo_docs` (`id_tipdoc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sucursals
-- ----------------------------
INSERT INTO `sucursals` VALUES ('2', '6', '1', 'JOSTHEIN SAN JUAN DE LURIGANCHO', '10704012964', 'CRUCE XD A LADO DE SENATI AGG TMR', '5775014', 'LIMA', 'LIMA', 'SAN JUAN DE LURIGANCHO', 'jostinvip97@gmail.com', '', '1', null, null);
INSERT INTO `sucursals` VALUES ('3', '4', '1', 'BRYAN POLO EN SAN MIGUEL', '10704012964', 'AV SAN MIGUEL CRUCE CASA BLANCA', '', 'LIMA', 'LIMA', 'SAN MIGUEL', '', '', '1', null, null);

-- ----------------------------
-- Table structure for tasas
-- ----------------------------
DROP TABLE IF EXISTS `tasas`;
CREATE TABLE `tasas` (
  `id_tasas` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tasa` decimal(10,3) NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tasas`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tasas
-- ----------------------------
INSERT INTO `tasas` VALUES ('1', '3.400', null, '2019-10-21 13:57:32', null);
INSERT INTO `tasas` VALUES ('2', '3.350', null, '2019-10-22 16:57:55', null);
INSERT INTO `tasas` VALUES ('3', '3.333', null, '2019-10-23 18:49:34', null);
INSERT INTO `tasas` VALUES ('6', '3.550', null, '2019-10-29 01:02:59', null);

-- ----------------------------
-- Table structure for tipo_docs
-- ----------------------------
DROP TABLE IF EXISTS `tipo_docs`;
CREATE TABLE `tipo_docs` (
  `id_tipdoc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipdoc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_docs
-- ----------------------------
INSERT INTO `tipo_docs` VALUES ('1', 'RUC', '1', null, null);
INSERT INTO `tipo_docs` VALUES ('2', 'DNI', '1', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_usuario` int(11) DEFAULT NULL,
  `cant_compras` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'jostin', 'jostinvip97@gmail.com', null, '$2y$10$XR.XNjBfDizZpwPOFwFJ/OdbOhiqGZQjS6d39YFUE5gagBWJ4XOCC', '1', null, null, '2019-10-17 23:58:12', '2019-10-17 23:58:12');
INSERT INTO `users` VALUES ('2', 'Pamela Mazgo de la Torre', 'pamelamazgo04@gmail.com', null, '$2y$10$D4kx2s4hSlMLKKAz/VOcr.yaobRTAmRczB2UUJEkYafS1abzl9MLm', null, null, null, '2019-10-19 15:47:07', '2019-10-19 15:47:07');
INSERT INTO `users` VALUES ('3', 'admin2019', 'admin@gmail.com', null, '$2y$10$ErRnUAjJWUQ3slScWCnqgeYnHxNNStL1cJ137KXMLvS88yFw1E48y', '1', null, null, '2019-10-29 17:27:19', '2019-10-29 17:27:19');

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_entrega` int(11) NOT NULL,
  `direccion` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `recepcion` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `tasa_ac` decimal(10,3) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `total_descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_dolar` decimal(10,2) NOT NULL,
  `costo_envio` decimal(10,2) DEFAULT NULL,
  `code_pago` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_datos` text COLLATE utf8mb4_unicode_ci,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  `estado_recepcion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `ventas_id_user_foreign` (`id_user`),
  CONSTRAINT `ventas_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of ventas
-- ----------------------------
