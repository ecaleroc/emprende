/*
 Navicat Premium Data Transfer

 Source Server         : mysql3
 Source Server Type    : MySQL
 Source Server Version : 80042
 Source Host           : localhost:3308
 Source Schema         : sentinel

 Target Server Type    : MySQL
 Target Server Version : 80042
 File Encoding         : 65001

 Date: 28/06/2025 10:40:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ACCESO
-- ----------------------------
DROP TABLE IF EXISTS `ACCESO`;
CREATE TABLE `ACCESO`  (
  `IDROL` int(0) NOT NULL,
  `IDOBJACCESO` int(0) NOT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'A:ACTIVO/I:INACTIVO/P:PENDIENTE/',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`IDROL`, `IDOBJACCESO`) USING BTREE,
  INDEX `fk_ROL_has_OBJACCESO_OBJACCESO1_idx`(`IDOBJACCESO`) USING BTREE,
  INDEX `fk_ROL_has_OBJACCESO_ROL1_idx`(`IDROL`) USING BTREE,
  CONSTRAINT `fk_ROL_has_OBJACCESO_OBJACCESO1` FOREIGN KEY (`IDOBJACCESO`) REFERENCES `OBJACCESO` (`IDOBJACCESO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ROL_has_OBJACCESO_ROL1` FOREIGN KEY (`IDROL`) REFERENCES `ROL` (`IDROL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACCESO
-- ----------------------------
INSERT INTO `ACCESO` VALUES (1, 1, 19, '2020-09-14 20:17:49', '2023-09-15 23:09:28');
INSERT INTO `ACCESO` VALUES (1, 2, 19, '2024-11-07 18:36:59', NULL);
INSERT INTO `ACCESO` VALUES (1, 3, 19, '2020-09-14 20:17:49', '2023-09-15 23:10:03');
INSERT INTO `ACCESO` VALUES (1, 4, 19, '2020-09-14 20:17:49', '2023-09-15 23:10:03');
INSERT INTO `ACCESO` VALUES (1, 5, 19, '2020-09-14 20:17:49', '2023-09-15 23:09:00');
INSERT INTO `ACCESO` VALUES (1, 6, 19, '2020-09-14 20:17:49', '2023-09-15 23:08:15');
INSERT INTO `ACCESO` VALUES (1, 8, 19, '2020-09-14 20:17:49', '2023-09-15 23:07:55');
INSERT INTO `ACCESO` VALUES (1, 9, 19, '2020-09-14 20:17:49', '2020-09-15 00:30:41');
INSERT INTO `ACCESO` VALUES (1, 10, 19, '2020-09-14 20:17:49', '2020-09-15 00:30:41');
INSERT INTO `ACCESO` VALUES (1, 11, 19, '2020-09-14 20:17:49', '2020-09-15 00:30:41');
INSERT INTO `ACCESO` VALUES (1, 12, 19, '2020-09-14 20:17:49', '2020-09-15 00:30:41');
INSERT INTO `ACCESO` VALUES (1, 13, 19, '2020-10-13 18:01:10', NULL);
INSERT INTO `ACCESO` VALUES (1, 14, 19, '2020-10-16 09:35:30', NULL);
INSERT INTO `ACCESO` VALUES (1, 15, 19, '2021-08-15 13:20:09', NULL);
INSERT INTO `ACCESO` VALUES (1, 16, 19, '2021-08-15 17:32:22', '2021-08-15 17:32:58');
INSERT INTO `ACCESO` VALUES (1, 17, 19, '2021-08-15 19:05:58', '2021-08-15 19:06:30');
INSERT INTO `ACCESO` VALUES (1, 18, 19, '2021-08-15 19:29:40', NULL);
INSERT INTO `ACCESO` VALUES (1, 19, 19, '2023-09-15 22:48:57', NULL);
INSERT INTO `ACCESO` VALUES (1, 20, 19, '2023-09-15 22:49:09', NULL);
INSERT INTO `ACCESO` VALUES (1, 21, 19, '2023-09-15 22:49:18', NULL);
INSERT INTO `ACCESO` VALUES (1, 22, 19, '2023-09-15 22:49:27', NULL);
INSERT INTO `ACCESO` VALUES (1, 23, 19, '2023-09-15 22:49:50', NULL);
INSERT INTO `ACCESO` VALUES (1, 24, 19, '2023-09-16 00:20:38', NULL);
INSERT INTO `ACCESO` VALUES (1, 25, 19, '2024-06-07 08:38:08', NULL);
INSERT INTO `ACCESO` VALUES (1, 26, 19, '2024-06-07 08:38:19', NULL);
INSERT INTO `ACCESO` VALUES (1, 27, 19, '2024-11-04 09:58:05', NULL);
INSERT INTO `ACCESO` VALUES (1, 29, 19, '2025-02-27 10:55:02', NULL);
INSERT INTO `ACCESO` VALUES (2, 2, 19, '2024-11-07 18:37:41', NULL);
INSERT INTO `ACCESO` VALUES (2, 3, 19, '2024-11-08 17:06:23', NULL);
INSERT INTO `ACCESO` VALUES (2, 4, 19, '2024-11-07 18:37:44', NULL);
INSERT INTO `ACCESO` VALUES (2, 11, 19, '2024-11-07 18:37:45', NULL);
INSERT INTO `ACCESO` VALUES (2, 26, 19, '2024-11-08 09:16:30', NULL);

-- ----------------------------
-- Table structure for ARCHIVO
-- ----------------------------
DROP TABLE IF EXISTS `ARCHIVO`;
CREATE TABLE `ARCHIVO`  (
  `IDARCHIVO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PESO` double NULL DEFAULT NULL,
  `UNIDAD` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `FORMATO` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DIRECTORIO` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NOMBRE_ENCRIPTADO` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `USUARIO_CREACION` int(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `archivable_id` int(0) NULL DEFAULT NULL,
  `archivable_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IDDIRECTORIO` int(0) NOT NULL,
  `FIRMA` longblob NULL,
  `CLAVE_PUBLICA` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `DESCRIPCION` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT 'aqui agregamos el tipo de documento para mostrar como descripcion del archivo',
  `REQUIERE_FIRMA_DIGITAL` int(0) NULL DEFAULT NULL COMMENT 'IDTABLA DE TAB_TABLAS HEREDADO DE CATALOGO_TABLAS',
  PRIMARY KEY (`IDARCHIVO`) USING BTREE,
  INDEX `fk_ARCHIVO_DIRECTORIO1_idx`(`IDDIRECTORIO`) USING BTREE,
  CONSTRAINT `fk_ARCHIVO_DIRECTORIO1` FOREIGN KEY (`IDDIRECTORIO`) REFERENCES `DIRECTORIO` (`IDDIRECTORIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 312 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ARCHIVO
-- ----------------------------
INSERT INTO `ARCHIVO` VALUES (1, '1e6d8f72132a7a92.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '1e6d8f72132a7a92.jpeg', NULL, '2021-09-27 18:12:09', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (2, 'a236dd820984a3eb.png', 27234, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'a236dd820984a3eb.png', NULL, '2021-09-27 18:18:31', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (3, '7e05fc8dcd0b4203.png', 94610, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '7e05fc8dcd0b4203.png', 1, '2021-09-27 19:12:53', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (4, '28ffe1b80945a7bc.png', 94610, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '28ffe1b80945a7bc.png', 1, '2021-09-27 19:19:07', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (5, 'f178eab082fadf4c.png', 94610, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'f178eab082fadf4c.png', 1, '2021-09-27 19:19:49', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (6, '8d447385e7015a39.png', 94610, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '8d447385e7015a39.png', 1, '2021-09-27 19:24:25', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (7, 'fbd05ce068a9fbc1.png', 94610, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'fbd05ce068a9fbc1.png', 1, '2021-09-27 19:25:16', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (8, '17fe89b44d7096da.png', 94610, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '17fe89b44d7096da.png', 1, '2021-09-27 19:26:16', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (9, '9482b65e434ff259.png', 94610, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '9482b65e434ff259.png', 1, '2021-09-27 19:28:20', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (10, '2b10be03c789a277.png', 611080, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '2b10be03c789a277.png', 1, '2021-09-27 19:33:05', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (11, '1719425afbe44fda.png', 611080, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '1719425afbe44fda.png', 1, '2021-09-27 19:33:38', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (12, '8b92ec338e0e7ad6.png', 611080, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '8b92ec338e0e7ad6.png', 1, '2021-09-27 19:42:31', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (13, '7514c48e5044316d.png', 611080, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '7514c48e5044316d.png', 1, '2021-09-27 19:43:56', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (14, 'a78c2809ab8d6e17.png', 611080, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'a78c2809ab8d6e17.png', 1, '2021-09-27 19:45:09', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (15, 'bb443f25c500b669.png', 43648, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'bb443f25c500b669.png', 1, '2021-09-27 19:46:17', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (16, 'd71acc1ef1c01f46.png', 43648, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'd71acc1ef1c01f46.png', 1, '2021-09-27 19:46:58', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (17, 'd71472be97f72a48.png', 47295, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'd71472be97f72a48.png', 1, '2021-09-27 19:48:31', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (18, '8e028f0d65f2d241.jpg', 318980, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '8e028f0d65f2d241.jpg', 1, '2021-09-27 19:55:13', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (19, '6a7a56f85fcfe2f1.pdf', 702222, 'KB', 'application/pdf', 'uploads\\Contenidos\\Documentos\\2021-09-29', '6a7a56f85fcfe2f1.pdf', NULL, '2021-09-29 16:39:42', '2025-02-09 02:56:38', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (20, 'db55624d5f4dea0c.pdf', 702222, 'KB', 'application/pdf', 'uploads\\Contenidos\\Documentos\\2021-09-29', 'db55624d5f4dea0c.pdf', 1, '2021-09-29 16:40:14', '2025-02-09 02:56:38', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (21, 'a7223d0d510e95e3.pdf', 702222, 'KB', 'application/pdf', 'uploads\\Contenidos\\Documentos\\2021-09-29', 'a7223d0d510e95e3.pdf', 1, '2021-09-29 16:41:37', '2025-02-09 02:56:38', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (22, '84f5d6ffdcb3a3b6.pdf', 702222, 'KB', 'application/pdf', 'uploads\\Contenidos\\Documentos\\2021-09-29', '84f5d6ffdcb3a3b6.pdf', 1, '2021-09-29 16:42:18', '2025-02-09 02:56:38', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (23, 'a4cf387b0a3d7105.jpg', 318980, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-29', 'a4cf387b0a3d7105.jpg', 1, '2021-09-29 17:48:20', '2025-02-09 02:56:38', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (24, '3bed99915a92164e.png', 1331222, 'MB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-29', '3bed99915a92164e.png', 1, '2021-09-29 17:49:04', '2025-02-09 02:56:38', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (25, 'abeee4f32288d238.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2023-10-26', 'abeee4f32288d238.jpg', 1, '2023-10-26 23:29:39', '2025-02-09 02:56:38', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (26, '532685054f0a60ca.png', 60441, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2023-10-27', '532685054f0a60ca.png', 1, '2023-10-27 00:05:56', '2025-02-09 02:56:38', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (27, '312e08e120fe8e74.pdf', 217342, 'KB', 'application/pdf', 'uploads\\Contenidos\\Documentos\\2023-10-27', '312e08e120fe8e74.pdf', 1, '2023-10-27 00:07:58', '2025-02-09 02:56:38', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (28, '8700c82dba832bca.png', 60441, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2023-10-27', '8700c82dba832bca.png', 1, '2023-10-27 00:08:56', '2025-02-09 02:56:38', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (29, 'f9c65164d5981c96.jpg', 17541, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2023-10-27', 'f9c65164d5981c96.jpg', 1, '2023-10-27 20:37:12', '2025-02-09 02:56:38', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (30, '56c92b73cb0f2512.jpg', 17541, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2023-10-27', '56c92b73cb0f2512.jpg', 1, '2023-10-27 20:39:22', '2025-02-09 02:56:38', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (31, 'ba35ffe575408668.png', 60441, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2023-10-27', 'ba35ffe575408668.png', 1, '2023-10-27 23:18:39', '2025-02-09 02:56:38', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (32, '47f03b28d8dbd2f5.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2023-10-27', '47f03b28d8dbd2f5.jpg', 1, '2023-10-27 23:23:56', '2025-02-09 02:56:38', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (33, '9def512148cea2df.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2023-10-31', '9def512148cea2df.jpg', 1, '2023-10-31 19:16:13', '2025-02-09 02:56:38', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (34, '6f7d1f4cfb6d7fb4.png', 105148, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2023-10-31', '6f7d1f4cfb6d7fb4.png', 1, '2023-10-31 23:43:24', '2025-02-09 02:56:38', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (35, 'cc05df905f3f6059.jpg', 242257, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2023-11-07', 'cc05df905f3f6059.jpg', 1, '2023-11-07 20:51:04', '2025-02-09 02:56:38', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (36, 'ab6cdcb2d831d8e9.png', 3061, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2023-11-07', 'ab6cdcb2d831d8e9.png', 1, '2023-11-07 23:17:06', '2025-02-09 02:56:38', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (37, 'a96b1a2411122174.jpg', 249949, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2023-11-07', 'a96b1a2411122174.jpg', 1, '2023-11-07 23:17:56', '2025-02-09 02:56:38', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (38, '9549b25c09c7a6d9.jpg', 77957, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2023-11-07', '9549b25c09c7a6d9.jpg', 1, '2023-11-07 23:18:46', '2025-02-09 02:56:38', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (39, 'c95e9f2e44795c6f.png', 73820, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2023-12-06', 'c95e9f2e44795c6f.png', 1, '2023-12-06 16:40:16', '2025-02-09 02:56:39', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (40, 'a23a16e93a8f3b9b.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2023-12-07', 'a23a16e93a8f3b9b.png', 1, '2023-12-07 11:33:07', '2025-02-09 02:56:39', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (41, 'a092fc899cbe5e05.jpg', 161619, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-03-03', 'a092fc899cbe5e05.jpg', 1, '2024-03-03 18:27:46', '2025-02-09 02:56:39', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (42, '4b38478128face16.jpg', 63257, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-03-03', '4b38478128face16.jpg', 1, '2024-03-03 18:32:00', '2025-02-09 02:56:39', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (43, 'b3398097d9b0436a.jpg', 97097, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-03-03', 'b3398097d9b0436a.jpg', 1, '2024-03-03 18:36:07', '2025-02-09 02:56:39', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (44, '75a54f132c868c15.jpg', 234938, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-03-03', '75a54f132c868c15.jpg', 1, '2024-03-03 18:43:30', '2025-02-09 02:56:39', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (45, '609a4a06fd32129f.jpg', 161619, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-03-03', '609a4a06fd32129f.jpg', 1, '2024-03-03 18:44:42', '2025-02-09 02:56:39', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (46, '61a5437403402c83.jpg', 185052, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-03-09', '61a5437403402c83.jpg', 1, '2024-03-09 07:25:21', '2025-02-09 02:56:39', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (47, '31ebd72b37ca0a72.jpg', 185052, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-03-09', '31ebd72b37ca0a72.jpg', 1, '2024-03-09 18:24:48', '2025-02-09 02:56:39', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (48, '03ea8a91586cc225.jpg', 99820, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-03-09', '03ea8a91586cc225.jpg', 1, '2024-03-09 18:33:41', '2025-02-09 02:56:39', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (92, '4ef858cce5c5843e.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '4ef858cce5c5843e.png', 1, '2024-10-13 07:45:29', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (93, '78f80f3d7054fc45.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '78f80f3d7054fc45.png', 1, '2024-10-13 08:46:10', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (94, 'ba36e3ae8a248fc5.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', 'ba36e3ae8a248fc5.png', 1, '2024-10-13 18:31:51', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (95, '7c4b8b721caa8040.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '7c4b8b721caa8040.png', 1, '2024-10-13 19:37:29', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (96, 'ffce078c5276506b.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', 'ffce078c5276506b.png', 1, '2024-10-13 19:39:48', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (97, '8df00672ba5273bb.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '8df00672ba5273bb.png', 1, '2024-10-13 19:44:30', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (98, '3225ac9add9c96b2.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '3225ac9add9c96b2.png', 1, '2024-10-13 19:45:15', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (99, '661ddce0ff1f5ffb.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '661ddce0ff1f5ffb.png', 1, '2024-10-13 19:50:51', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (100, 'ff37913f7fe97f58.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', 'ff37913f7fe97f58.png', 1, '2024-10-13 19:53:39', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (101, 'ab1f9aacd83dbbb0.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', 'ab1f9aacd83dbbb0.png', 1, '2024-10-13 19:58:27', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (102, 'ed71bdb2c7c4de4c.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', 'ed71bdb2c7c4de4c.png', 1, '2024-10-13 20:41:24', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (103, '874af220ab7313fe.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '874af220ab7313fe.png', 1, '2024-10-13 20:41:55', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (104, '2497aee74657dce4.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '2497aee74657dce4.png', 1, '2024-10-13 20:45:01', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (105, 'fee4dc6afa2e7d1b.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', 'fee4dc6afa2e7d1b.png', 1, '2024-10-13 20:45:23', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (106, '73e0c910012ae041.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '73e0c910012ae041.png', 1, '2024-10-13 20:45:23', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (107, '6d9dc35c76ab13aa.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '6d9dc35c76ab13aa.png', 1, '2024-10-13 20:45:24', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (108, 'a32bcfea47f57104.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', 'a32bcfea47f57104.png', 1, '2024-10-13 20:45:25', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (109, '6988190c040b17aa.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '6988190c040b17aa.png', 1, '2024-10-13 20:45:39', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (110, '9c751a99331baa38.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '9c751a99331baa38.png', 1, '2024-10-13 20:45:40', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (111, '48e390d811043fe5.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-13', '48e390d811043fe5.png', 1, '2024-10-13 20:48:53', '2025-02-09 02:56:39', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (112, '2d406b41906f2481.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-15', '2d406b41906f2481.png', 1, '2024-10-15 19:24:53', '2025-02-09 02:56:39', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (115, 'c0912da312f4014c.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'c0912da312f4014c.png', 31, '2024-10-22 22:48:40', '2025-02-09 02:56:39', 628, 'App\\Domain\\Persona\\Persona', 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (116, '3db060fe7dabdd83.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', '3db060fe7dabdd83.png', 31, '2024-10-22 22:49:49', '2025-02-09 02:56:39', 629, 'App\\Domain\\Persona\\Persona', 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (117, '637228fb2564773b.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', '637228fb2564773b.png', 31, '2024-10-22 22:52:39', '2025-02-09 02:56:39', 630, 'App\\Domain\\Persona\\Persona', 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (118, '1656506514858ccf.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '1656506514858ccf.png', 31, '2024-10-23 19:38:24', '2025-02-09 02:56:39', 631, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (119, 'e9f7b7a7683f31f1.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', 'e9f7b7a7683f31f1.png', 31, '2024-10-23 19:41:20', '2025-02-09 02:56:39', 632, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (120, '7c1a8329e135639b.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '7c1a8329e135639b.png', 31, '2024-10-23 19:48:16', '2025-02-09 02:56:39', 636, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (121, '05aefd04ee44aa8c.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '05aefd04ee44aa8c.png', 31, '2024-10-23 19:50:50', '2025-02-09 02:56:39', 637, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (122, '34d400775dcadd38.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '34d400775dcadd38.png', 31, '2024-10-23 19:55:17', '2025-02-09 02:56:39', 638, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (123, '0467322b49d716a1.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '0467322b49d716a1.png', 31, '2024-10-23 19:56:02', '2025-02-09 02:56:39', 639, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (124, 'd9aeb1ac7f82f782.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', 'd9aeb1ac7f82f782.png', 31, '2024-10-23 19:57:33', '2025-02-09 02:56:39', 640, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (125, '935230a8f5c92894.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '935230a8f5c92894.png', 31, '2024-10-23 20:05:33', '2025-02-09 02:56:39', 644, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (126, 'f1701dbcb771e199.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', 'f1701dbcb771e199.png', 31, '2024-10-23 20:06:10', '2025-02-09 02:56:39', 645, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (127, '688206e6d1e4e42f.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '688206e6d1e4e42f.png', 31, '2024-10-24 01:13:47', '2025-02-09 02:56:39', 646, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (128, 'e030452c22674f8f.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', 'e030452c22674f8f.png', 31, '2024-10-24 01:16:40', '2025-02-09 02:56:39', 648, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (129, '33160ea91e41187a.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '33160ea91e41187a.png', 31, '2024-10-24 01:23:41', '2025-02-09 02:56:39', 649, 'App\\Domain\\Persona\\Persona', 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (130, '7fbabe056ad92ea3.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '7fbabe056ad92ea3.png', 31, '2024-10-24 16:02:55', '2025-02-09 02:56:39', 652, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (131, 'bd2620ac07a512ae.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', 'bd2620ac07a512ae.png', 31, '2024-10-24 17:20:00', '2025-02-09 02:56:39', 653, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (132, '28738ecce0dc7344.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '28738ecce0dc7344.png', 31, '2024-10-24 17:46:40', '2025-02-09 02:56:39', 656, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (133, '7c1ee312739f8b38.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '7c1ee312739f8b38.png', 31, '2024-10-24 17:47:53', '2025-02-09 02:56:39', 657, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (134, '2dafab1c1f86d940.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '2dafab1c1f86d940.png', 31, '2024-10-24 19:25:02', '2025-02-09 02:56:39', 657, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (135, '4f9e042205892dce.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '4f9e042205892dce.png', 31, '2024-10-24 19:25:59', '2025-02-09 02:56:39', 657, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (136, '0be63caa5aaef0ad.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '0be63caa5aaef0ad.png', 31, '2024-10-24 20:17:19', '2025-02-09 02:56:39', 657, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (137, '5dc0835a29376a3b.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '5dc0835a29376a3b.png', 31, '2024-10-24 20:17:41', '2025-02-09 02:56:39', 657, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (138, 'b4e54cd40c4511d8.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', 'b4e54cd40c4511d8.png', 31, '2024-10-25 01:44:01', '2025-02-09 02:56:39', 657, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (139, '6426a344eb88f810.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '6426a344eb88f810.png', 31, '2024-10-25 01:44:48', '2025-02-09 02:56:39', 657, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (140, '26fe2bf8abfaced4.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '26fe2bf8abfaced4.png', 31, '2024-10-25 01:54:06', '2025-02-09 02:56:39', 612, 'App\\Domain\\Persona\\Persona', 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (141, '8c4bfa0a025e1f3a.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '8c4bfa0a025e1f3a.png', 1, '2024-10-26 00:31:42', '2025-02-09 02:56:40', 1, 'App\\Domain\\Persona\\Persona', 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (143, '73d6a7f2c5486f99.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-26', '73d6a7f2c5486f99.png', 1, '2024-10-26 13:25:25', '2025-02-09 02:56:39', 687, 'App\\Domain\\Persona\\Persona', 25, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (144, '8f063722b3b4e729.png', 116294, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-26', '8f063722b3b4e729.png', 1, '2024-10-26 13:26:24', '2025-02-09 02:56:39', 687, 'App\\Domain\\Persona\\Persona', 25, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (145, '3c21468b0e0f8a64.png', 116294, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-26', '3c21468b0e0f8a64.png', 1, '2024-10-26 13:27:02', '2025-02-09 02:56:39', 687, 'App\\Domain\\Persona\\Persona', 25, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (146, '28a91e1dc8d224e3.png', 380921, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-26', '28a91e1dc8d224e3.png', 1, '2024-10-27 02:31:59', '2025-02-09 02:56:39', 688, 'App\\Domain\\Persona\\Persona', 25, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (165, '49d64b39e21aada0.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '49d64b39e21aada0.jpg', 1, '2024-11-08 20:31:14', '2025-02-09 02:56:39', 658, 'App\\Domain\\Persona\\Persona', 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (166, '25da6fe879476959.png', 77118, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '25da6fe879476959.png', 1, '2024-11-24 10:10:15', '2025-02-09 02:56:40', 1, 'App\\Domain\\Pagina\\Pagina', 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (167, 'c98bb37d3a32558b.png', 5329, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'c98bb37d3a32558b.png', 1, '2024-11-25 01:24:49', '2025-02-09 02:56:40', 1, 'App\\Domain\\Pagina\\Pagina', 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (168, '5ac5d3f01321d6a0.jpg', 24178, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-26', '5ac5d3f01321d6a0.jpg', 1, '2024-11-26 23:42:09', '2025-02-09 02:56:40', 1, 'App\\Domain\\Pagina\\Pagina', 30, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (169, '7d9177d30d9d107f.png', 74566, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-28', '7d9177d30d9d107f.png', 1, '2024-11-28 18:18:52', '2025-02-09 02:56:40', 1, 'App\\Domain\\Pagina\\Pagina', 33, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (170, '2278ee6b9092a6f5.jpg', 21001, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-28', '2278ee6b9092a6f5.jpg', 1, '2024-11-28 18:24:01', '2025-02-09 02:56:40', 1, 'App\\Domain\\Pagina\\Pagina', 33, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (171, 'ccae0def310008ac.pdf', 579388, 'KB', 'application/pdf', 'uploads\\Contenidos\\Documentos\\2024-09-21', 'ccae0def310008ac.pdf', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (172, 'e493d6e9779cac01.pdf', 3965, 'KB', 'application/pdf', 'uploads\\Contenidos\\Documentos\\2024-09-21', 'e493d6e9779cac01.pdf', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (173, '047bf1eb0f9c7d96.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '047bf1eb0f9c7d96.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (174, '1b6ff047ecfa4a46.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '1b6ff047ecfa4a46.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (175, '262d5d20c94269c1.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '262d5d20c94269c1.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (176, '4eaf4b3fc088f97b.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '4eaf4b3fc088f97b.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (177, '61602d7c0e108fbc.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '61602d7c0e108fbc.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (178, '6bc2f28de8546912.png', 27234, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '6bc2f28de8546912.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (179, '72aec196840fe38b.png', 27234, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '72aec196840fe38b.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (180, '824c17d69d0c9d29.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '824c17d69d0c9d29.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (181, '85031fd32406020b.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '85031fd32406020b.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (182, '879b781660ea168c.png', 27234, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '879b781660ea168c.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (183, '897173d648c3cb71.png', 27234, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '897173d648c3cb71.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (184, '91aa756a166aa949.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '91aa756a166aa949.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (185, '99bc980300082db4.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', '99bc980300082db4.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (186, 'c40fd3e927d3a799.jpeg', 118457, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'c40fd3e927d3a799.jpeg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (187, 'ea560579f449ffca.jpg', 91033, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2021-09-27', 'ea560579f449ffca.jpg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:38', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (188, 'fd40facd201f8f58.png', 380921, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-09-21', 'fd40facd201f8f58.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (189, '2fe67ca904e48acd.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', '2fe67ca904e48acd.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (190, '357454bb2266abe3.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', '357454bb2266abe3.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (191, '36d53bcb47940a7b.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', '36d53bcb47940a7b.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (192, '4c286a89b9f17c9f.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', '4c286a89b9f17c9f.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (193, '602c477ac81c6c46.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', '602c477ac81c6c46.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (194, '626aa3ce204d40a4.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', '626aa3ce204d40a4.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (195, 'a12a42cdd734f0f4.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'a12a42cdd734f0f4.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (196, 'ab78d44536649327.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'ab78d44536649327.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (197, 'c1ecd200fb9ca205.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'c1ecd200fb9ca205.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (198, 'cc0282c63694cf4e.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'cc0282c63694cf4e.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (199, 'ce81e2263cdd4b97.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'ce81e2263cdd4b97.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (200, 'd062fdc7b788389d.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'd062fdc7b788389d.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (201, 'd7a5098b19a638dd.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'd7a5098b19a638dd.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (202, 'ec6970715056f0cd.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-22', 'ec6970715056f0cd.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (203, '4e7235a1e562e27e.png', 70006, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '4e7235a1e562e27e.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (204, '66f720caf705943f.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-23', '66f720caf705943f.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (205, '594d55c95fbf6b65.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', '594d55c95fbf6b65.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (206, 'c523061f5e959116.png', 91315, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-24', 'c523061f5e959116.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (207, '53e73a9f51d713c4.png', 80002, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-25', '53e73a9f51d713c4.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (208, '61dd3f7e65835b3c.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-26', '61dd3f7e65835b3c.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (209, '8aa2aac1a68b116c.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-26', '8aa2aac1a68b116c.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (210, 'b25ec0edc06be076.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-10-26', 'b25ec0edc06be076.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (211, '03227966913bfc60.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '03227966913bfc60.jpg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (212, '0ffe01494397247a.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '0ffe01494397247a.jpg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (213, '13d9df5c2a8287e4.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '13d9df5c2a8287e4.jpg', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (214, '16062f0cf066c43e.png', 202312, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '16062f0cf066c43e.png', NULL, '2025-02-09 02:16:12', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (215, '1b06d76592f4d303.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '1b06d76592f4d303.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (216, '1d41d6c88dc79170.jpg', 17541, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '1d41d6c88dc79170.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (217, '23c99086785c5e26.jpg', 17541, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '23c99086785c5e26.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (218, '27dd3ef87e26aada.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '27dd3ef87e26aada.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (219, '3340cbf6f0fdb393.png', 202312, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '3340cbf6f0fdb393.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (220, '3e20824679ac481e.jpg', 17541, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '3e20824679ac481e.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (221, '3f9b9deee7d4e0df.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '3f9b9deee7d4e0df.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (222, '633d197515dcd9b5.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '633d197515dcd9b5.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (223, '6bf465eef0ebce28.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '6bf465eef0ebce28.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (224, '6d711fa08f8c06cc.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '6d711fa08f8c06cc.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (225, '79a36fd4c51f12b0.png', 202312, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '79a36fd4c51f12b0.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (226, '7b366176b9a6bf71.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '7b366176b9a6bf71.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (227, '7dd89d82453b0202.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '7dd89d82453b0202.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (228, '8522abda838bfab3.jpg', 17541, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '8522abda838bfab3.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (229, '86a51dc6b2b7c6f6.png', 202312, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '86a51dc6b2b7c6f6.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (230, '8dfb57771d2293ce.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '8dfb57771d2293ce.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (231, '9205d197b5cf42c4.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '9205d197b5cf42c4.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (232, '96895e3e9d2bc095.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '96895e3e9d2bc095.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:39', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (233, '97340a6dbf2f443f.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-08', '97340a6dbf2f443f.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (234, 'ae2ada5430f9531f.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'ae2ada5430f9531f.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (235, 'afd97d8299967a2f.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'afd97d8299967a2f.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (236, 'b801970ec3e5e72c.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'b801970ec3e5e72c.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (237, 'bbdbeab664ada9d6.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'bbdbeab664ada9d6.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (238, 'bd9de98a33deaf11.png', 851237, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'bd9de98a33deaf11.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (239, 'bfdaef00604d5f33.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'bfdaef00604d5f33.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (240, 'd81b324c67cd91f6.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'd81b324c67cd91f6.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (241, 'e548b18f268910e8.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'e548b18f268910e8.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (242, 'e8139660fe46605e.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'e8139660fe46605e.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (243, 'efd1f9ff42d0d256.jpg', 36195, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'efd1f9ff42d0d256.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (244, 'f37c3837efa80756.jpg', 17541, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'f37c3837efa80756.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (245, 'fb1eae276525e829.jpg', 17541, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-08', 'fb1eae276525e829.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (246, '87f4bd485b411a90.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-13', '87f4bd485b411a90.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (247, 'a7d035e23d1d1212.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-13', 'a7d035e23d1d1212.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (248, 'e20627070c4a1c43.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-13', 'e20627070c4a1c43.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (249, '97a509826f56160d.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-14', '97a509826f56160d.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (250, '9f2e02c8b453eb65.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-14', '9f2e02c8b453eb65.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (251, 'd23a35c1290936c1.jpg', 103558, 'KB', 'image/jpeg', 'uploads\\Contenidos\\Imagenes\\2024-11-14', 'd23a35c1290936c1.jpg', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (252, '1044fbf49f78cd50.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '1044fbf49f78cd50.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (253, '113eb9e4ba5b7a1b.png', 56490, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '113eb9e4ba5b7a1b.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (254, '1a4e615a9a1197ad.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '1a4e615a9a1197ad.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (255, '247ee5bf4ad3395b.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '247ee5bf4ad3395b.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (256, '26e0fd16f30d56f7.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '26e0fd16f30d56f7.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (257, '2927e6468bb8b577.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '2927e6468bb8b577.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (258, '29b3f395247feee3.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '29b3f395247feee3.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (259, '2ffb1e755d3f386c.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '2ffb1e755d3f386c.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (260, '3741fc5761d02212.png', 83976, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '3741fc5761d02212.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (261, '400d5c557fe196c1.png', 83976, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '400d5c557fe196c1.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (262, '46ece0d8480927d9.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '46ece0d8480927d9.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (263, '4f108c896c4b36ea.png', 56490, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '4f108c896c4b36ea.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (264, '55f909e9039f7dcf.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '55f909e9039f7dcf.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (265, '9433b8f5a7e40afa.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', '9433b8f5a7e40afa.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (266, 'a45c67b0d3b03bd0.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'a45c67b0d3b03bd0.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (267, 'aec2abae31cd8b09.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'aec2abae31cd8b09.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (268, 'bccef5e4e33be037.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'bccef5e4e33be037.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (269, 'c7e9614c2fee1530.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'c7e9614c2fee1530.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (270, 'd8672db847daf6ea.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'd8672db847daf6ea.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (271, 'd9e2d43992d9d6e2.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'd9e2d43992d9d6e2.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (272, 'e3f8a392e9f858ac.png', 1076949, 'MB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'e3f8a392e9f858ac.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (273, 'ee111cf06ff8f0de.png', 238784, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'ee111cf06ff8f0de.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (274, 'eec659b25fa1f13e.png', 77416, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-24', 'eec659b25fa1f13e.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (275, '35a87eb7f5a320d4.png', 74566, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-27', '35a87eb7f5a320d4.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (276, 'acca0a710134a50a.png', 74566, 'KB', 'image/png', 'uploads\\Contenidos\\Imagenes\\2024-11-27', 'acca0a710134a50a.png', NULL, '2025-02-09 02:16:13', '2025-02-09 02:56:40', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (277, 'CV-Luz 2021-salud.doc', 189440, 'KB', 'application/msword', 'uploads', 'CV-Luz 2021-salud.doc', NULL, '2025-02-09 02:36:05', '2025-02-09 02:55:18', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (286, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'DESCARGABLE.pdf', NULL, NULL, NULL, NULL, 'Usuario', 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (287, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'DESCARGABLE.pdf', NULL, NULL, NULL, NULL, 'Usuario', 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (288, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'DESCARGABLE.pdf', NULL, NULL, NULL, NULL, 'Usuario', 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (289, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'DESCARGABLE.pdf', NULL, '2025-06-13 23:51:10', '2025-06-13 23:51:10', NULL, 'Usuario', 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (290, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'DESCARGABLE.pdf', NULL, '2025-06-14 00:01:29', '2025-06-14 00:01:29', NULL, 'Usuario', 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (291, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'DESCARGABLE.pdf', NULL, '2025-06-14 00:02:23', '2025-06-14 00:02:23', NULL, 'Usuario', 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (292, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'DESCARGABLE.pdf', NULL, '2025-06-14 00:37:39', '2025-06-14 00:37:39', NULL, 'Usuario', 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (293, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', '356aa10f-b1da-47e0-b6df-cacaaa3ea17d.pdf', NULL, '2025-06-14 00:38:17', '2025-06-14 00:38:17', NULL, 'Usuario', 1, NULL, '', NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (294, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'ad91a925-95ad-47b4-813c-b92a6acf0f0f.pdf', NULL, '2025-06-14 00:46:50', '2025-06-14 01:17:18', NULL, 'Usuario', 1, NULL, '', NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (295, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', '29f2523c-c0f7-4f18-a411-cfbf1b2055a6.pdf', NULL, '2025-06-14 00:46:54', '2025-06-14 00:46:54', NULL, 'Usuario', 1, NULL, '', NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (296, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', 'e97b3d5e-e4de-49f0-95c4-51505aa57422.pdf', NULL, '2025-06-14 00:47:03', '2025-06-14 00:47:03', NULL, 'Usuario', 1, NULL, '', NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (297, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', '1865566f-b0c4-4ffc-8df9-c032ad9591ac.pdf', NULL, '2025-06-14 00:50:43', '2025-06-14 00:56:57', NULL, 'Usuario', 1, NULL, '', NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (298, 'DESCARGABLE.pdf', 2408.50390625, 'KB', 'application/pdf', 'uploads/', '60ffb512-36d8-4d4d-96d1-5a234140942f.pdf', NULL, '2025-06-14 01:07:49', '2025-06-14 01:24:47', NULL, 'Usuario', 1, 0x2870252BD253EDB105667CD3BFB91E4E259D773E24883946337C83526F1025049219BA772229FA6B752820A342150C5D284AE7B6C3CC6EE8F321B60F4F5E96B579EABE99A8B94B6ECA776E36BF0C54226E32FFA217A0DABEB5C39656654D34C205ECC48BAA7BE84B4B1D3D502AC51D83A57BCB03FA5ED9EE8FD6250CA9A0E90A58F4749113575B20FA292E87967176B01E314851AC352CB93DE60A74EBE296953D778D6073573C97036AB8392DB18A27A9CB96A2A83979A7C0AD7E5C33AEF9C12CEE6FBB063EC67CBE9E28AFC0D1610D17E3C1A3A877555288C34B408D3776CC9F923302B7BC24EF80E11183858B5306C2BCCAAD9941F2D97BB648F7B9DA52D8, '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuuvw7sa36/s2KXNH38RQ\nOb9iGQY0DEJael+LZsD+q0s7P1+0CCToR3UnyP0ss8uXoFIs+vgN4t6NfjoEEvQc\nILs/cWrO5lxOAirxQlaOhhbKUut2gfd8/wVC3JU4LTsU8TLf21BKbf187P7OAIkw\naww1U3Zxm+wzO2Ad0VgHQONc5FEHgYy3gH00QSJyUw8ebCDJ8mqTwxBn2+BUQorp\nuWEr1kxT8rocBEW+WUFbOZgkJPAO/HUeM99jVy7pOt6harzOuPRq9kt2AEBaf47P\ncuBdrOoVRXa3aKIJo8BMMepaIu/5gFmf4+Wuenz308Q5O+XclzGYWjZIYxToEBeT\n3QIDAQAB\n-----END PUBLIC KEY-----\n', NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (299, 'ARQUITECTURA.pdf', 126.1826171875, 'KB', 'application/pdf', 'uploads/', '3f7835ee-4e46-4bca-977f-870075303695.pdf', NULL, '2025-06-14 01:53:05', '2025-06-14 01:53:15', NULL, 'Usuario', 1, 0xAD48D49E6762FB9DDBB3A88A3D4705793E77AA7D2A31891DB1BA998DD26346DF9F6F21FDAB73D62E01FAB3A384D2E5B95855DFF40B39DDD8E4FD375BE0A04C8367684F63F293DE3B959B9CC246A883920F88D0F87DFB0FACD3CFB4750D217FACC7F89743A24F5D96BE55403E2653A5AC6258B6B88F6431E59A7198DBADA25DD9FCFD29EE5BE0BFD21CA652E7C990EE2BD19C0936E03E66E5378EFB8E72FBF213F319EB09A0106CEB38C152571FA86C1FE177C134C865088FA7810D19C1D948589A939E8D3C62A2B9176EBDF8AE3EE0F7248BD6C7E1E7222CE47B24804F0354A6996C187309C2F97A1A3CA7D693200D309ABE90EB491EFE5BE97326128EC2D18E, '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr2/kxP2+wh7g70YAaXKR\n4vgN2wCilH4sHRzEiIPbDim6WEMYzeRWhaVm/wIiLZV7a7s9eq4J8eCECbK9agN3\ncn5/5zRh3lERPwj258bvV430iQkow12b/3b6C7dUSwaXG2Pf8WTZmieZME8Cq4to\ni9pA1HgiF4xlImIH1NROvGVia22EH+Yx4ZWXFy1rCuTJxz0kMedtFh6DIBCcloVp\nfa7zIR57hbqAlp3UNfH5/a3eldWvBA0K4DU/q2Cwg0gVnMOidONkxcKAphvJGrZQ\na/9TGCpyS3i19UAtse3KHFoVu1vFE4/tPzXIfQTSH3ixSQ03vQjkrciaUiHajwAN\n6wIDAQAB\n-----END PUBLIC KEY-----\n', NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (300, 'pdf-zip.pdf', 1001.498046875, 'KB', 'application/pdf', 'uploads/', '57634870-0903-4402-9131-f57b8de55e17.pdf', NULL, '2025-06-14 02:50:35', '2025-06-14 02:50:48', NULL, 'Usuario', 1, 0xB82001F98F4E81D1EBC91432D8C0F1F510C35ED92267174FF7018D2E54914B892A39DDE5DC619C61387BF3A7D9157220283AE5B4E56BDEC05CEAFD6F640014533DC9F643D3390FAFA94C73F438833AA232A951CE54A7C42193F0D9B951AC5FD9CE174721332CDEAAAB96A0DDF51A0ECA0B4DC9DBD5CC8BFD9E8F8EBE01AE09E90E7EB60B9EC3C22A4F7C7D0741DA1C0CCA2F6D185BD66CF4684FCA1ADABBFA37974682B7B1D804A109B2A9025C5551224DCCEE8EB61032210E4CADCFEA9E96686008C866DCCA63CDC165B4B47C00C13B7752571BA509EC139006182F309C21F2E0A4BE8F7A9B717B22A9A7B92F7C0B22ACF3A22DE61C669E32CE51F9BEC6D75F, '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1vjiA2VyTvGCY9hqxhwl\nQc1CGTOEErCtcPtHRv/Pw933zaw2+Zy0P9PODP/438TFbr8kK1pHCs+u7E+eliya\nFPtjUhXDSZwrW2TK1B1FE6kScHWKySgdREcjEQIGdsILSImALTgKlThhM5A9BATf\nF8w0R/stMAn/cljocMGAPNfk1vMlSXiYZCa5yahFY/8FcUnJDVtYn65iRcDsg/ao\nuZ0R0hUncADcFQKW2y/ZmjxsGrd42ql7Ib073extlQdceejS/Q7IMOcx935zgA8r\nIVormXbw0VLq5qnGQJymqNpjJNb+Up4yUU0XYGz92bLcqteP+Bf5KH00IlxqEzsE\niwIDAQAB\n-----END PUBLIC KEY-----\n', NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (301, 'Untitled.pdf', 7453.142578125, 'KB', 'application/pdf', 'uploads/', '3dec497e-8fba-4d8e-a91f-9369c3efa153.pdf', NULL, '2025-06-14 03:02:53', '2025-06-14 03:02:53', NULL, 'Usuario', 1, NULL, NULL, NULL, NULL);
INSERT INTO `ARCHIVO` VALUES (311, 'SUNAT - Consulta RUC.pdf', 52.146484375, 'KB', 'application/pdf', 'uploads/', '4df91f6b-a0d1-48ba-8bcb-1e75baed4429.pdf', 1, '2025-06-27 20:26:17', NULL, 1, 'Empresa', 1, NULL, NULL, 'D:\\trabajos web\\python\\sentinel_api\\documentos\\uploads/SUNAT - Consulta RUC.pdf', NULL);
INSERT INTO `ARCHIVO` VALUES (312, 'formato-minuta-2025.pdf', 147.4677734375, 'KB', 'application/pdf', 'uploads/', '0b247577-f7e9-40d0-9fec-2095e98c1532.pdf', NULL, '2025-06-28 09:09:50', NULL, 2, 'Empresa', 1, NULL, NULL, 'D:\\trabajos web\\python\\sentinel_api\\documentos\\uploads/formato-minuta-2025.pdf', NULL);
INSERT INTO `ARCHIVO` VALUES (313, 'requisitos_para_el_cumplimiento.pdf', 127.2958984375, 'KB', 'application/pdf', 'uploads/', 'fb34e01a-19c9-4079-945c-33aadeffd6ab.pdf', NULL, '2025-06-28 09:12:50', NULL, 2, 'Empresa', 1, NULL, NULL, 'D:\\trabajos web\\python\\sentinel_api\\documentos\\uploads/requisitos_para_el_cumplimiento.pdf', NULL);

-- ----------------------------
-- Table structure for ARCHIVO_FIRMA
-- ----------------------------
DROP TABLE IF EXISTS `ARCHIVO_FIRMA`;
CREATE TABLE `ARCHIVO_FIRMA`  (
  `IDARCHIVO` int(0) NOT NULL,
  `IDPERSONA` int(0) NOT NULL,
  `FIRMA` longblob NULL,
  `CLAVE_PUBLICA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `FECHA_FIRMA` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDARCHIVO`, `IDPERSONA`) USING BTREE,
  INDEX `fk_ARCHIVO_FIRMA_ARCHIVO1_idx`(`IDARCHIVO`) USING BTREE,
  INDEX `fk_ARCHIVO_FIRMA_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_ARCHIVO_FIRMA_ARCHIVO1` FOREIGN KEY (`IDARCHIVO`) REFERENCES `ARCHIVO` (`IDARCHIVO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ARCHIVO_FIRMA_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ARCHIVO_FIRMA
-- ----------------------------
INSERT INTO `ARCHIVO_FIRMA` VALUES (311, 1, 0x15A426ED31DAFA8D45DC1F84DCFF42ACC759CC7A0FF5DA5E45D6EB750FA20D08B7DF62B4AFA177792F1B64152E73AB3C0A6E7E14A004002A72F36926F9D5E6CD6931975E9EEEF2A2AF527E6090133243C8F828CE45C0F7B11E6CFFEBF21CDD7BFE5699CE6BC80B7C9D705F9B7D55986AF7C26E24F38FBDE21AF3E56D0B3986BB0697E39D893FA4B5ADC06B9DD953A2637976129FC9AD05F2B08F93E71AA811531EB34CD3A6CADD7F3A98D33E9A4445D63CA2AF67050367EB5D1957D39CD935C6BCA5E2BF2C548ECA8B1AEBBFEC4638D484A11E2FB681DAC0F4D2C7DAE9BFC7EC45827CB21B57E4131FC3915F7B5F5813FE594717992825D2ED677C365F3087CF, '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5flabQF4bjVMx7g6Zu4g\nqKrUjUOLySS2BLpzZbXBlSeGqrdys6u3jIl7Tr9CwcLMXCzbB10no2aPzZLmkjyr\n1htwz2SvCn7uNfr+wINnqQ14r6xZDnupRK5cHBrO14IHEBCv/OCSE8EsKW/fHaE4\nqSd041GkK3BrxBmOkv8x6MLAFm1rxQWwDKSvocTI2/hREv4/3s7phJuoGyWGnSul\nOx9E4Xwhyruzi648UU8tOF5314zqZ9Vzm0pcxlqUE6zVkKedXXW8T2inESNvVWch\n0KO3DYKwDpzH48KaTAB5Qnx+vHiwAxjdM955pm0TU69hOJU4S5MFsum+zFAd7bte\nmwIDAQAB\n-----END PUBLIC KEY-----\n', 1, '2025-06-27 20:29:34');
INSERT INTO `ARCHIVO_FIRMA` VALUES (311, 412, 0x9C6DFA67476D03BBCEC5E8C1C0EB142EB1228A57A1E10E0EE131D5C61BE685B31083E7D3F5915774CBCD945A7A9997019F3971DA72FD75814A1DA167CA58A5155E758BCCD2825E844B46DCA5C32F0470FB11CFB6D6059A634F9C8DA4235DB6FC2B848B0EC55854B0BB1DC2F561820F987EF9DB345D4AC5E94DF5E327852D82FF2345A8180EB231F28956969334CC0931E2E6821B24BF173DB35004288982ADEBC38B67F91579A8E58F22619073C75E2BD2924FE74D07D5C8622D76408C9E5CB8861C0088A689D4B16671C4986FA4664E9E9A4899DAD8D7E2CFAC959CBEE021127E139478FA77110B65FD53AEE939DFA7B2047B638B03BBAB49BF79926E26ADC8, '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5flabQF4bjVMx7g6Zu4g\nqKrUjUOLySS2BLpzZbXBlSeGqrdys6u3jIl7Tr9CwcLMXCzbB10no2aPzZLmkjyr\n1htwz2SvCn7uNfr+wINnqQ14r6xZDnupRK5cHBrO14IHEBCv/OCSE8EsKW/fHaE4\nqSd041GkK3BrxBmOkv8x6MLAFm1rxQWwDKSvocTI2/hREv4/3s7phJuoGyWGnSul\nOx9E4Xwhyruzi648UU8tOF5314zqZ9Vzm0pcxlqUE6zVkKedXXW8T2inESNvVWch\n0KO3DYKwDpzH48KaTAB5Qnx+vHiwAxjdM955pm0TU69hOJU4S5MFsum+zFAd7bte\nmwIDAQAB\n-----END PUBLIC KEY-----\n', 1, '2025-06-27 20:31:58');
INSERT INTO `ARCHIVO_FIRMA` VALUES (312, 1, 0x010F2F0BEABA48B5EFF2F436E5A660A10EF3C97943EECC41A40074F0B1165E141111C8ADADEC90F30668930E2802C373B926DE54E9A2A3FF484DC9F8AC49A02CA8CC0F3B3C321D080083CAE9D84165C8F44B7A87F158A52DFC314CF8E2470BDD37BD9077368320BE8C087B6234D22877FC07C20E27CBA9AF9FEB75EF994E8880E319BE02B0D4A1068389B5D167D37E88E87143C0CC355CEA754F6E4CF75E2D6A0C5AC7C4A56E7C7E8B33A879ECEFF40C116C49D1BC62A1211454C13D35355E4AF6FBB0C1503ACD70424E3EEE334EDB097B8C4C4BB818FD8FDF5EF86EDAB22B37825C612843EBCFA1CF69F13ACC6507851F17B804B6E6213B63815DC5A3ABB848, '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5flabQF4bjVMx7g6Zu4g\nqKrUjUOLySS2BLpzZbXBlSeGqrdys6u3jIl7Tr9CwcLMXCzbB10no2aPzZLmkjyr\n1htwz2SvCn7uNfr+wINnqQ14r6xZDnupRK5cHBrO14IHEBCv/OCSE8EsKW/fHaE4\nqSd041GkK3BrxBmOkv8x6MLAFm1rxQWwDKSvocTI2/hREv4/3s7phJuoGyWGnSul\nOx9E4Xwhyruzi648UU8tOF5314zqZ9Vzm0pcxlqUE6zVkKedXXW8T2inESNvVWch\n0KO3DYKwDpzH48KaTAB5Qnx+vHiwAxjdM955pm0TU69hOJU4S5MFsum+zFAd7bte\nmwIDAQAB\n-----END PUBLIC KEY-----\n', 1, '2025-06-28 09:10:13');
INSERT INTO `ARCHIVO_FIRMA` VALUES (312, 658, 0x8FD0B931A0A70DCC4607C3E250141AB70A16DEE9159CFB32557F9B10E8EE70800D688842002181BF9D47A0AD0B10C00002AC43B85832E649B839E2A6598C4C00D243C1BBC740EF2B1BE85C168D3510E64E9BED8879B4FC0C1AAD9F5CD1F0F9EB89009BD02B13200D10C9E4BAEE604A9FA7F1699C6E8D9ED925FABBF1E386CCA7008CA61D4887D0CA33D14184ABEFE6B43F142D4A25CCBF49AA7F41F8A45C94989FA340F7C015B9DA9C1E50CCCCEE6CC9E8FABCF88295B7B6496553E4BB6616F2F65BF166A36995741C56E6840BA0E0640B8D05218296A0A9703F681205C06BB08FBD3AD4F79DE4B878376E14358B37C3AE45F6EECE506EBC31E47014F715A202, '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5flabQF4bjVMx7g6Zu4g\nqKrUjUOLySS2BLpzZbXBlSeGqrdys6u3jIl7Tr9CwcLMXCzbB10no2aPzZLmkjyr\n1htwz2SvCn7uNfr+wINnqQ14r6xZDnupRK5cHBrO14IHEBCv/OCSE8EsKW/fHaE4\nqSd041GkK3BrxBmOkv8x6MLAFm1rxQWwDKSvocTI2/hREv4/3s7phJuoGyWGnSul\nOx9E4Xwhyruzi648UU8tOF5314zqZ9Vzm0pcxlqUE6zVkKedXXW8T2inESNvVWch\n0KO3DYKwDpzH48KaTAB5Qnx+vHiwAxjdM955pm0TU69hOJU4S5MFsum+zFAd7bte\nmwIDAQAB\n-----END PUBLIC KEY-----\n', 1, '2025-06-28 09:10:27');

-- ----------------------------
-- Table structure for AREA_SERVICIO
-- ----------------------------
DROP TABLE IF EXISTS `AREA_SERVICIO`;
CREATE TABLE `AREA_SERVICIO`  (
  `IDAREASERVICIO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'A:ACTIVO/I:INACTIVO/P:PENDIENTE',
  `URL` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ICONO` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDAREASERVICIO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 321 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add acceso', 1, 'add_acceso');
INSERT INTO `auth_permission` VALUES (2, 'Can change acceso', 1, 'change_acceso');
INSERT INTO `auth_permission` VALUES (3, 'Can delete acceso', 1, 'delete_acceso');
INSERT INTO `auth_permission` VALUES (4, 'Can view acceso', 1, 'view_acceso');
INSERT INTO `auth_permission` VALUES (5, 'Can add archivo', 2, 'add_archivo');
INSERT INTO `auth_permission` VALUES (6, 'Can change archivo', 2, 'change_archivo');
INSERT INTO `auth_permission` VALUES (7, 'Can delete archivo', 2, 'delete_archivo');
INSERT INTO `auth_permission` VALUES (8, 'Can view archivo', 2, 'view_archivo');
INSERT INTO `auth_permission` VALUES (9, 'Can add area servicio', 3, 'add_areaservicio');
INSERT INTO `auth_permission` VALUES (10, 'Can change area servicio', 3, 'change_areaservicio');
INSERT INTO `auth_permission` VALUES (11, 'Can delete area servicio', 3, 'delete_areaservicio');
INSERT INTO `auth_permission` VALUES (12, 'Can view area servicio', 3, 'view_areaservicio');
INSERT INTO `auth_permission` VALUES (13, 'Can add catalogo plato', 4, 'add_catalogoplato');
INSERT INTO `auth_permission` VALUES (14, 'Can change catalogo plato', 4, 'change_catalogoplato');
INSERT INTO `auth_permission` VALUES (15, 'Can delete catalogo plato', 4, 'delete_catalogoplato');
INSERT INTO `auth_permission` VALUES (16, 'Can view catalogo plato', 4, 'view_catalogoplato');
INSERT INTO `auth_permission` VALUES (17, 'Can add catalogo tablas', 5, 'add_catalogotablas');
INSERT INTO `auth_permission` VALUES (18, 'Can change catalogo tablas', 5, 'change_catalogotablas');
INSERT INTO `auth_permission` VALUES (19, 'Can delete catalogo tablas', 5, 'delete_catalogotablas');
INSERT INTO `auth_permission` VALUES (20, 'Can view catalogo tablas', 5, 'view_catalogotablas');
INSERT INTO `auth_permission` VALUES (21, 'Can add cat servicio', 6, 'add_catservicio');
INSERT INTO `auth_permission` VALUES (22, 'Can change cat servicio', 6, 'change_catservicio');
INSERT INTO `auth_permission` VALUES (23, 'Can delete cat servicio', 6, 'delete_catservicio');
INSERT INTO `auth_permission` VALUES (24, 'Can view cat servicio', 6, 'view_catservicio');
INSERT INTO `auth_permission` VALUES (25, 'Can add cliente', 7, 'add_cliente');
INSERT INTO `auth_permission` VALUES (26, 'Can change cliente', 7, 'change_cliente');
INSERT INTO `auth_permission` VALUES (27, 'Can delete cliente', 7, 'delete_cliente');
INSERT INTO `auth_permission` VALUES (28, 'Can view cliente', 7, 'view_cliente');
INSERT INTO `auth_permission` VALUES (29, 'Can add componente', 8, 'add_componente');
INSERT INTO `auth_permission` VALUES (30, 'Can change componente', 8, 'change_componente');
INSERT INTO `auth_permission` VALUES (31, 'Can delete componente', 8, 'delete_componente');
INSERT INTO `auth_permission` VALUES (32, 'Can view componente', 8, 'view_componente');
INSERT INTO `auth_permission` VALUES (33, 'Can add conversacion', 9, 'add_conversacion');
INSERT INTO `auth_permission` VALUES (34, 'Can change conversacion', 9, 'change_conversacion');
INSERT INTO `auth_permission` VALUES (35, 'Can delete conversacion', 9, 'delete_conversacion');
INSERT INTO `auth_permission` VALUES (36, 'Can view conversacion', 9, 'view_conversacion');
INSERT INTO `auth_permission` VALUES (37, 'Can add cotizacion', 10, 'add_cotizacion');
INSERT INTO `auth_permission` VALUES (38, 'Can change cotizacion', 10, 'change_cotizacion');
INSERT INTO `auth_permission` VALUES (39, 'Can delete cotizacion', 10, 'delete_cotizacion');
INSERT INTO `auth_permission` VALUES (40, 'Can view cotizacion', 10, 'view_cotizacion');
INSERT INTO `auth_permission` VALUES (41, 'Can add departamento', 11, 'add_departamento');
INSERT INTO `auth_permission` VALUES (42, 'Can change departamento', 11, 'change_departamento');
INSERT INTO `auth_permission` VALUES (43, 'Can delete departamento', 11, 'delete_departamento');
INSERT INTO `auth_permission` VALUES (44, 'Can view departamento', 11, 'view_departamento');
INSERT INTO `auth_permission` VALUES (45, 'Can add detalle', 12, 'add_detalle');
INSERT INTO `auth_permission` VALUES (46, 'Can change detalle', 12, 'change_detalle');
INSERT INTO `auth_permission` VALUES (47, 'Can delete detalle', 12, 'delete_detalle');
INSERT INTO `auth_permission` VALUES (48, 'Can view detalle', 12, 'view_detalle');
INSERT INTO `auth_permission` VALUES (49, 'Can add direccion', 13, 'add_direccion');
INSERT INTO `auth_permission` VALUES (50, 'Can change direccion', 13, 'change_direccion');
INSERT INTO `auth_permission` VALUES (51, 'Can delete direccion', 13, 'delete_direccion');
INSERT INTO `auth_permission` VALUES (52, 'Can view direccion', 13, 'view_direccion');
INSERT INTO `auth_permission` VALUES (53, 'Can add directorio', 14, 'add_directorio');
INSERT INTO `auth_permission` VALUES (54, 'Can change directorio', 14, 'change_directorio');
INSERT INTO `auth_permission` VALUES (55, 'Can delete directorio', 14, 'delete_directorio');
INSERT INTO `auth_permission` VALUES (56, 'Can view directorio', 14, 'view_directorio');
INSERT INTO `auth_permission` VALUES (57, 'Can add distrito', 15, 'add_distrito');
INSERT INTO `auth_permission` VALUES (58, 'Can change distrito', 15, 'change_distrito');
INSERT INTO `auth_permission` VALUES (59, 'Can delete distrito', 15, 'delete_distrito');
INSERT INTO `auth_permission` VALUES (60, 'Can view distrito', 15, 'view_distrito');
INSERT INTO `auth_permission` VALUES (61, 'Can add docadjunto', 16, 'add_docadjunto');
INSERT INTO `auth_permission` VALUES (62, 'Can change docadjunto', 16, 'change_docadjunto');
INSERT INTO `auth_permission` VALUES (63, 'Can delete docadjunto', 16, 'delete_docadjunto');
INSERT INTO `auth_permission` VALUES (64, 'Can view docadjunto', 16, 'view_docadjunto');
INSERT INTO `auth_permission` VALUES (65, 'Can add empresa', 17, 'add_empresa');
INSERT INTO `auth_permission` VALUES (66, 'Can change empresa', 17, 'change_empresa');
INSERT INTO `auth_permission` VALUES (67, 'Can delete empresa', 17, 'delete_empresa');
INSERT INTO `auth_permission` VALUES (68, 'Can view empresa', 17, 'view_empresa');
INSERT INTO `auth_permission` VALUES (69, 'Can add estacion trabajo', 18, 'add_estaciontrabajo');
INSERT INTO `auth_permission` VALUES (70, 'Can change estacion trabajo', 18, 'change_estaciontrabajo');
INSERT INTO `auth_permission` VALUES (71, 'Can delete estacion trabajo', 18, 'delete_estaciontrabajo');
INSERT INTO `auth_permission` VALUES (72, 'Can view estacion trabajo', 18, 'view_estaciontrabajo');
INSERT INTO `auth_permission` VALUES (73, 'Can add hisclaves', 19, 'add_hisclaves');
INSERT INTO `auth_permission` VALUES (74, 'Can change hisclaves', 19, 'change_hisclaves');
INSERT INTO `auth_permission` VALUES (75, 'Can delete hisclaves', 19, 'delete_hisclaves');
INSERT INTO `auth_permission` VALUES (76, 'Can view hisclaves', 19, 'view_hisclaves');
INSERT INTO `auth_permission` VALUES (77, 'Can add historiaclinica', 20, 'add_historiaclinica');
INSERT INTO `auth_permission` VALUES (78, 'Can change historiaclinica', 20, 'change_historiaclinica');
INSERT INTO `auth_permission` VALUES (79, 'Can delete historiaclinica', 20, 'delete_historiaclinica');
INSERT INTO `auth_permission` VALUES (80, 'Can view historiaclinica', 20, 'view_historiaclinica');
INSERT INTO `auth_permission` VALUES (81, 'Can add insumo', 21, 'add_insumo');
INSERT INTO `auth_permission` VALUES (82, 'Can change insumo', 21, 'change_insumo');
INSERT INTO `auth_permission` VALUES (83, 'Can delete insumo', 21, 'delete_insumo');
INSERT INTO `auth_permission` VALUES (84, 'Can view insumo', 21, 'view_insumo');
INSERT INTO `auth_permission` VALUES (85, 'Can add local', 22, 'add_local');
INSERT INTO `auth_permission` VALUES (86, 'Can change local', 22, 'change_local');
INSERT INTO `auth_permission` VALUES (87, 'Can delete local', 22, 'delete_local');
INSERT INTO `auth_permission` VALUES (88, 'Can view local', 22, 'view_local');
INSERT INTO `auth_permission` VALUES (89, 'Can add login', 23, 'add_login');
INSERT INTO `auth_permission` VALUES (90, 'Can change login', 23, 'change_login');
INSERT INTO `auth_permission` VALUES (91, 'Can delete login', 23, 'delete_login');
INSERT INTO `auth_permission` VALUES (92, 'Can view login', 23, 'view_login');
INSERT INTO `auth_permission` VALUES (93, 'Can add log conexion', 24, 'add_logconexion');
INSERT INTO `auth_permission` VALUES (94, 'Can change log conexion', 24, 'change_logconexion');
INSERT INTO `auth_permission` VALUES (95, 'Can delete log conexion', 24, 'delete_logconexion');
INSERT INTO `auth_permission` VALUES (96, 'Can view log conexion', 24, 'view_logconexion');
INSERT INTO `auth_permission` VALUES (97, 'Can add medicamento', 25, 'add_medicamento');
INSERT INTO `auth_permission` VALUES (98, 'Can change medicamento', 25, 'change_medicamento');
INSERT INTO `auth_permission` VALUES (99, 'Can delete medicamento', 25, 'delete_medicamento');
INSERT INTO `auth_permission` VALUES (100, 'Can view medicamento', 25, 'view_medicamento');
INSERT INTO `auth_permission` VALUES (101, 'Can add menu', 26, 'add_menu');
INSERT INTO `auth_permission` VALUES (102, 'Can change menu', 26, 'change_menu');
INSERT INTO `auth_permission` VALUES (103, 'Can delete menu', 26, 'delete_menu');
INSERT INTO `auth_permission` VALUES (104, 'Can view menu', 26, 'view_menu');
INSERT INTO `auth_permission` VALUES (105, 'Can add modulos', 27, 'add_modulos');
INSERT INTO `auth_permission` VALUES (106, 'Can change modulos', 27, 'change_modulos');
INSERT INTO `auth_permission` VALUES (107, 'Can delete modulos', 27, 'delete_modulos');
INSERT INTO `auth_permission` VALUES (108, 'Can view modulos', 27, 'view_modulos');
INSERT INTO `auth_permission` VALUES (109, 'Can add objacceso', 28, 'add_objacceso');
INSERT INTO `auth_permission` VALUES (110, 'Can change objacceso', 28, 'change_objacceso');
INSERT INTO `auth_permission` VALUES (111, 'Can delete objacceso', 28, 'delete_objacceso');
INSERT INTO `auth_permission` VALUES (112, 'Can view objacceso', 28, 'view_objacceso');
INSERT INTO `auth_permission` VALUES (113, 'Can add opinion', 29, 'add_opinion');
INSERT INTO `auth_permission` VALUES (114, 'Can change opinion', 29, 'change_opinion');
INSERT INTO `auth_permission` VALUES (115, 'Can delete opinion', 29, 'delete_opinion');
INSERT INTO `auth_permission` VALUES (116, 'Can view opinion', 29, 'view_opinion');
INSERT INTO `auth_permission` VALUES (117, 'Can add pagina', 30, 'add_pagina');
INSERT INTO `auth_permission` VALUES (118, 'Can change pagina', 30, 'change_pagina');
INSERT INTO `auth_permission` VALUES (119, 'Can delete pagina', 30, 'delete_pagina');
INSERT INTO `auth_permission` VALUES (120, 'Can view pagina', 30, 'view_pagina');
INSERT INTO `auth_permission` VALUES (121, 'Can add pago', 31, 'add_pago');
INSERT INTO `auth_permission` VALUES (122, 'Can change pago', 31, 'change_pago');
INSERT INTO `auth_permission` VALUES (123, 'Can delete pago', 31, 'delete_pago');
INSERT INTO `auth_permission` VALUES (124, 'Can view pago', 31, 'view_pago');
INSERT INTO `auth_permission` VALUES (125, 'Can add pais', 32, 'add_pais');
INSERT INTO `auth_permission` VALUES (126, 'Can change pais', 32, 'change_pais');
INSERT INTO `auth_permission` VALUES (127, 'Can delete pais', 32, 'delete_pais');
INSERT INTO `auth_permission` VALUES (128, 'Can view pais', 32, 'view_pais');
INSERT INTO `auth_permission` VALUES (129, 'Can add pedido', 33, 'add_pedido');
INSERT INTO `auth_permission` VALUES (130, 'Can change pedido', 33, 'change_pedido');
INSERT INTO `auth_permission` VALUES (131, 'Can delete pedido', 33, 'delete_pedido');
INSERT INTO `auth_permission` VALUES (132, 'Can view pedido', 33, 'view_pedido');
INSERT INTO `auth_permission` VALUES (133, 'Can add permiso', 34, 'add_permiso');
INSERT INTO `auth_permission` VALUES (134, 'Can change permiso', 34, 'change_permiso');
INSERT INTO `auth_permission` VALUES (135, 'Can delete permiso', 34, 'delete_permiso');
INSERT INTO `auth_permission` VALUES (136, 'Can view permiso', 34, 'view_permiso');
INSERT INTO `auth_permission` VALUES (137, 'Can add persona', 35, 'add_persona');
INSERT INTO `auth_permission` VALUES (138, 'Can change persona', 35, 'change_persona');
INSERT INTO `auth_permission` VALUES (139, 'Can delete persona', 35, 'delete_persona');
INSERT INTO `auth_permission` VALUES (140, 'Can view persona', 35, 'view_persona');
INSERT INTO `auth_permission` VALUES (141, 'Can add personal', 36, 'add_personal');
INSERT INTO `auth_permission` VALUES (142, 'Can change personal', 36, 'change_personal');
INSERT INTO `auth_permission` VALUES (143, 'Can delete personal', 36, 'delete_personal');
INSERT INTO `auth_permission` VALUES (144, 'Can view personal', 36, 'view_personal');
INSERT INTO `auth_permission` VALUES (145, 'Can add persona contacto', 37, 'add_personacontacto');
INSERT INTO `auth_permission` VALUES (146, 'Can change persona contacto', 37, 'change_personacontacto');
INSERT INTO `auth_permission` VALUES (147, 'Can delete persona contacto', 37, 'delete_personacontacto');
INSERT INTO `auth_permission` VALUES (148, 'Can view persona contacto', 37, 'view_personacontacto');
INSERT INTO `auth_permission` VALUES (149, 'Can add persona direccion', 38, 'add_personadireccion');
INSERT INTO `auth_permission` VALUES (150, 'Can change persona direccion', 38, 'change_personadireccion');
INSERT INTO `auth_permission` VALUES (151, 'Can delete persona direccion', 38, 'delete_personadireccion');
INSERT INTO `auth_permission` VALUES (152, 'Can view persona direccion', 38, 'view_personadireccion');
INSERT INTO `auth_permission` VALUES (153, 'Can add plantilla componente', 39, 'add_plantillacomponente');
INSERT INTO `auth_permission` VALUES (154, 'Can change plantilla componente', 39, 'change_plantillacomponente');
INSERT INTO `auth_permission` VALUES (155, 'Can delete plantilla componente', 39, 'delete_plantillacomponente');
INSERT INTO `auth_permission` VALUES (156, 'Can view plantilla componente', 39, 'view_plantillacomponente');
INSERT INTO `auth_permission` VALUES (157, 'Can add plantilla web', 40, 'add_plantillaweb');
INSERT INTO `auth_permission` VALUES (158, 'Can change plantilla web', 40, 'change_plantillaweb');
INSERT INTO `auth_permission` VALUES (159, 'Can delete plantilla web', 40, 'delete_plantillaweb');
INSERT INTO `auth_permission` VALUES (160, 'Can view plantilla web', 40, 'view_plantillaweb');
INSERT INTO `auth_permission` VALUES (161, 'Can add plato', 41, 'add_plato');
INSERT INTO `auth_permission` VALUES (162, 'Can change plato', 41, 'change_plato');
INSERT INTO `auth_permission` VALUES (163, 'Can delete plato', 41, 'delete_plato');
INSERT INTO `auth_permission` VALUES (164, 'Can view plato', 41, 'view_plato');
INSERT INTO `auth_permission` VALUES (165, 'Can add proveedor', 42, 'add_proveedor');
INSERT INTO `auth_permission` VALUES (166, 'Can change proveedor', 42, 'change_proveedor');
INSERT INTO `auth_permission` VALUES (167, 'Can delete proveedor', 42, 'delete_proveedor');
INSERT INTO `auth_permission` VALUES (168, 'Can view proveedor', 42, 'view_proveedor');
INSERT INTO `auth_permission` VALUES (169, 'Can add provincia', 43, 'add_provincia');
INSERT INTO `auth_permission` VALUES (170, 'Can change provincia', 43, 'change_provincia');
INSERT INTO `auth_permission` VALUES (171, 'Can delete provincia', 43, 'delete_provincia');
INSERT INTO `auth_permission` VALUES (172, 'Can view provincia', 43, 'view_provincia');
INSERT INTO `auth_permission` VALUES (173, 'Can add rol', 44, 'add_rol');
INSERT INTO `auth_permission` VALUES (174, 'Can change rol', 44, 'change_rol');
INSERT INTO `auth_permission` VALUES (175, 'Can delete rol', 44, 'delete_rol');
INSERT INTO `auth_permission` VALUES (176, 'Can view rol', 44, 'view_rol');
INSERT INTO `auth_permission` VALUES (177, 'Can add sector', 45, 'add_sector');
INSERT INTO `auth_permission` VALUES (178, 'Can change sector', 45, 'change_sector');
INSERT INTO `auth_permission` VALUES (179, 'Can delete sector', 45, 'delete_sector');
INSERT INTO `auth_permission` VALUES (180, 'Can view sector', 45, 'view_sector');
INSERT INTO `auth_permission` VALUES (181, 'Can add seguro', 46, 'add_seguro');
INSERT INTO `auth_permission` VALUES (182, 'Can change seguro', 46, 'change_seguro');
INSERT INTO `auth_permission` VALUES (183, 'Can delete seguro', 46, 'delete_seguro');
INSERT INTO `auth_permission` VALUES (184, 'Can view seguro', 46, 'view_seguro');
INSERT INTO `auth_permission` VALUES (185, 'Can add servicio', 47, 'add_servicio');
INSERT INTO `auth_permission` VALUES (186, 'Can change servicio', 47, 'change_servicio');
INSERT INTO `auth_permission` VALUES (187, 'Can delete servicio', 47, 'delete_servicio');
INSERT INTO `auth_permission` VALUES (188, 'Can view servicio', 47, 'view_servicio');
INSERT INTO `auth_permission` VALUES (189, 'Can add servicio pago', 48, 'add_serviciopago');
INSERT INTO `auth_permission` VALUES (190, 'Can change servicio pago', 48, 'change_serviciopago');
INSERT INTO `auth_permission` VALUES (191, 'Can delete servicio pago', 48, 'delete_serviciopago');
INSERT INTO `auth_permission` VALUES (192, 'Can view servicio pago', 48, 'view_serviciopago');
INSERT INTO `auth_permission` VALUES (193, 'Can add sistema', 49, 'add_sistema');
INSERT INTO `auth_permission` VALUES (194, 'Can change sistema', 49, 'change_sistema');
INSERT INTO `auth_permission` VALUES (195, 'Can delete sistema', 49, 'delete_sistema');
INSERT INTO `auth_permission` VALUES (196, 'Can view sistema', 49, 'view_sistema');
INSERT INTO `auth_permission` VALUES (197, 'Can add sistema modulos', 50, 'add_sistemamodulos');
INSERT INTO `auth_permission` VALUES (198, 'Can change sistema modulos', 50, 'change_sistemamodulos');
INSERT INTO `auth_permission` VALUES (199, 'Can delete sistema modulos', 50, 'delete_sistemamodulos');
INSERT INTO `auth_permission` VALUES (200, 'Can view sistema modulos', 50, 'view_sistemamodulos');
INSERT INTO `auth_permission` VALUES (201, 'Can add tab tablas', 51, 'add_tabtablas');
INSERT INTO `auth_permission` VALUES (202, 'Can change tab tablas', 51, 'change_tabtablas');
INSERT INTO `auth_permission` VALUES (203, 'Can delete tab tablas', 51, 'delete_tabtablas');
INSERT INTO `auth_permission` VALUES (204, 'Can view tab tablas', 51, 'view_tabtablas');
INSERT INTO `auth_permission` VALUES (205, 'Can add ticket', 52, 'add_ticket');
INSERT INTO `auth_permission` VALUES (206, 'Can change ticket', 52, 'change_ticket');
INSERT INTO `auth_permission` VALUES (207, 'Can delete ticket', 52, 'delete_ticket');
INSERT INTO `auth_permission` VALUES (208, 'Can view ticket', 52, 'view_ticket');
INSERT INTO `auth_permission` VALUES (209, 'Can add tipo contacto', 53, 'add_tipocontacto');
INSERT INTO `auth_permission` VALUES (210, 'Can change tipo contacto', 53, 'change_tipocontacto');
INSERT INTO `auth_permission` VALUES (211, 'Can delete tipo contacto', 53, 'delete_tipocontacto');
INSERT INTO `auth_permission` VALUES (212, 'Can view tipo contacto', 53, 'view_tipocontacto');
INSERT INTO `auth_permission` VALUES (213, 'Can add unidad ejecutora', 54, 'add_unidadejecutora');
INSERT INTO `auth_permission` VALUES (214, 'Can change unidad ejecutora', 54, 'change_unidadejecutora');
INSERT INTO `auth_permission` VALUES (215, 'Can delete unidad ejecutora', 54, 'delete_unidadejecutora');
INSERT INTO `auth_permission` VALUES (216, 'Can view unidad ejecutora', 54, 'view_unidadejecutora');
INSERT INTO `auth_permission` VALUES (217, 'Can add unidad organica', 55, 'add_unidadorganica');
INSERT INTO `auth_permission` VALUES (218, 'Can change unidad organica', 55, 'change_unidadorganica');
INSERT INTO `auth_permission` VALUES (219, 'Can delete unidad organica', 55, 'delete_unidadorganica');
INSERT INTO `auth_permission` VALUES (220, 'Can view unidad organica', 55, 'view_unidadorganica');
INSERT INTO `auth_permission` VALUES (221, 'Can add unidad organica dependencia', 56, 'add_unidadorganicadependencia');
INSERT INTO `auth_permission` VALUES (222, 'Can change unidad organica dependencia', 56, 'change_unidadorganicadependencia');
INSERT INTO `auth_permission` VALUES (223, 'Can delete unidad organica dependencia', 56, 'delete_unidadorganicadependencia');
INSERT INTO `auth_permission` VALUES (224, 'Can view unidad organica dependencia', 56, 'view_unidadorganicadependencia');
INSERT INTO `auth_permission` VALUES (225, 'Can add usuario', 57, 'add_usuario');
INSERT INTO `auth_permission` VALUES (226, 'Can change usuario', 57, 'change_usuario');
INSERT INTO `auth_permission` VALUES (227, 'Can delete usuario', 57, 'delete_usuario');
INSERT INTO `auth_permission` VALUES (228, 'Can view usuario', 57, 'view_usuario');
INSERT INTO `auth_permission` VALUES (229, 'Can add usuario rol', 58, 'add_usuariorol');
INSERT INTO `auth_permission` VALUES (230, 'Can change usuario rol', 58, 'change_usuariorol');
INSERT INTO `auth_permission` VALUES (231, 'Can delete usuario rol', 58, 'delete_usuariorol');
INSERT INTO `auth_permission` VALUES (232, 'Can view usuario rol', 58, 'view_usuariorol');
INSERT INTO `auth_permission` VALUES (233, 'Can add log entry', 59, 'add_logentry');
INSERT INTO `auth_permission` VALUES (234, 'Can change log entry', 59, 'change_logentry');
INSERT INTO `auth_permission` VALUES (235, 'Can delete log entry', 59, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (236, 'Can view log entry', 59, 'view_logentry');
INSERT INTO `auth_permission` VALUES (237, 'Can add permission', 60, 'add_permission');
INSERT INTO `auth_permission` VALUES (238, 'Can change permission', 60, 'change_permission');
INSERT INTO `auth_permission` VALUES (239, 'Can delete permission', 60, 'delete_permission');
INSERT INTO `auth_permission` VALUES (240, 'Can view permission', 60, 'view_permission');
INSERT INTO `auth_permission` VALUES (241, 'Can add group', 61, 'add_group');
INSERT INTO `auth_permission` VALUES (242, 'Can change group', 61, 'change_group');
INSERT INTO `auth_permission` VALUES (243, 'Can delete group', 61, 'delete_group');
INSERT INTO `auth_permission` VALUES (244, 'Can view group', 61, 'view_group');
INSERT INTO `auth_permission` VALUES (245, 'Can add user', 62, 'add_user');
INSERT INTO `auth_permission` VALUES (246, 'Can change user', 62, 'change_user');
INSERT INTO `auth_permission` VALUES (247, 'Can delete user', 62, 'delete_user');
INSERT INTO `auth_permission` VALUES (248, 'Can view user', 62, 'view_user');
INSERT INTO `auth_permission` VALUES (249, 'Can add content type', 63, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (250, 'Can change content type', 63, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (251, 'Can delete content type', 63, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (252, 'Can view content type', 63, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (253, 'Can add session', 64, 'add_session');
INSERT INTO `auth_permission` VALUES (254, 'Can change session', 64, 'change_session');
INSERT INTO `auth_permission` VALUES (255, 'Can delete session', 64, 'delete_session');
INSERT INTO `auth_permission` VALUES (256, 'Can view session', 64, 'view_session');
INSERT INTO `auth_permission` VALUES (257, 'Can add auth group', 65, 'add_authgroup');
INSERT INTO `auth_permission` VALUES (258, 'Can change auth group', 65, 'change_authgroup');
INSERT INTO `auth_permission` VALUES (259, 'Can delete auth group', 65, 'delete_authgroup');
INSERT INTO `auth_permission` VALUES (260, 'Can view auth group', 65, 'view_authgroup');
INSERT INTO `auth_permission` VALUES (261, 'Can add auth group permissions', 66, 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (262, 'Can change auth group permissions', 66, 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (263, 'Can delete auth group permissions', 66, 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (264, 'Can view auth group permissions', 66, 'view_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (265, 'Can add auth permission', 67, 'add_authpermission');
INSERT INTO `auth_permission` VALUES (266, 'Can change auth permission', 67, 'change_authpermission');
INSERT INTO `auth_permission` VALUES (267, 'Can delete auth permission', 67, 'delete_authpermission');
INSERT INTO `auth_permission` VALUES (268, 'Can view auth permission', 67, 'view_authpermission');
INSERT INTO `auth_permission` VALUES (269, 'Can add auth user', 68, 'add_authuser');
INSERT INTO `auth_permission` VALUES (270, 'Can change auth user', 68, 'change_authuser');
INSERT INTO `auth_permission` VALUES (271, 'Can delete auth user', 68, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (272, 'Can view auth user', 68, 'view_authuser');
INSERT INTO `auth_permission` VALUES (273, 'Can add auth user groups', 69, 'add_authusergroups');
INSERT INTO `auth_permission` VALUES (274, 'Can change auth user groups', 69, 'change_authusergroups');
INSERT INTO `auth_permission` VALUES (275, 'Can delete auth user groups', 69, 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES (276, 'Can view auth user groups', 69, 'view_authusergroups');
INSERT INTO `auth_permission` VALUES (277, 'Can add auth user user permissions', 70, 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (278, 'Can change auth user user permissions', 70, 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (279, 'Can delete auth user user permissions', 70, 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (280, 'Can view auth user user permissions', 70, 'view_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (281, 'Can add django admin log', 71, 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES (282, 'Can change django admin log', 71, 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES (283, 'Can delete django admin log', 71, 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES (284, 'Can view django admin log', 71, 'view_djangoadminlog');
INSERT INTO `auth_permission` VALUES (285, 'Can add django content type', 72, 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES (286, 'Can change django content type', 72, 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES (287, 'Can delete django content type', 72, 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES (288, 'Can view django content type', 72, 'view_djangocontenttype');
INSERT INTO `auth_permission` VALUES (289, 'Can add django migrations', 73, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (290, 'Can change django migrations', 73, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (291, 'Can delete django migrations', 73, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (292, 'Can view django migrations', 73, 'view_djangomigrations');
INSERT INTO `auth_permission` VALUES (293, 'Can add django session', 74, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (294, 'Can change django session', 74, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (295, 'Can delete django session', 74, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (296, 'Can view django session', 74, 'view_djangosession');
INSERT INTO `auth_permission` VALUES (297, 'Can add archivo firma', 75, 'add_archivofirma');
INSERT INTO `auth_permission` VALUES (298, 'Can change archivo firma', 75, 'change_archivofirma');
INSERT INTO `auth_permission` VALUES (299, 'Can delete archivo firma', 75, 'delete_archivofirma');
INSERT INTO `auth_permission` VALUES (300, 'Can view archivo firma', 75, 'view_archivofirma');
INSERT INTO `auth_permission` VALUES (301, 'Can add empresa requisito cumplido', 76, 'add_empresarequisitocumplido');
INSERT INTO `auth_permission` VALUES (302, 'Can change empresa requisito cumplido', 76, 'change_empresarequisitocumplido');
INSERT INTO `auth_permission` VALUES (303, 'Can delete empresa requisito cumplido', 76, 'delete_empresarequisitocumplido');
INSERT INTO `auth_permission` VALUES (304, 'Can view empresa requisito cumplido', 76, 'view_empresarequisitocumplido');
INSERT INTO `auth_permission` VALUES (305, 'Can add empresa socio', 77, 'add_empresasocio');
INSERT INTO `auth_permission` VALUES (306, 'Can change empresa socio', 77, 'change_empresasocio');
INSERT INTO `auth_permission` VALUES (307, 'Can delete empresa socio', 77, 'delete_empresasocio');
INSERT INTO `auth_permission` VALUES (308, 'Can view empresa socio', 77, 'view_empresasocio');
INSERT INTO `auth_permission` VALUES (309, 'Can add proceso paso', 78, 'add_procesopaso');
INSERT INTO `auth_permission` VALUES (310, 'Can change proceso paso', 78, 'change_procesopaso');
INSERT INTO `auth_permission` VALUES (311, 'Can delete proceso paso', 78, 'delete_procesopaso');
INSERT INTO `auth_permission` VALUES (312, 'Can view proceso paso', 78, 'view_procesopaso');
INSERT INTO `auth_permission` VALUES (313, 'Can add requisito', 79, 'add_requisito');
INSERT INTO `auth_permission` VALUES (314, 'Can change requisito', 79, 'change_requisito');
INSERT INTO `auth_permission` VALUES (315, 'Can delete requisito', 79, 'delete_requisito');
INSERT INTO `auth_permission` VALUES (316, 'Can view requisito', 79, 'view_requisito');
INSERT INTO `auth_permission` VALUES (317, 'Can add unidad organica trabaja personal', 80, 'add_unidadorganicatrabajapersonal');
INSERT INTO `auth_permission` VALUES (318, 'Can change unidad organica trabaja personal', 80, 'change_unidadorganicatrabajapersonal');
INSERT INTO `auth_permission` VALUES (319, 'Can delete unidad organica trabaja personal', 80, 'delete_unidadorganicatrabajapersonal');
INSERT INTO `auth_permission` VALUES (320, 'Can view unidad organica trabaja personal', 80, 'view_unidadorganicatrabajapersonal');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'bcrypt_sha256$$2b$12$JfF5bN.HWpRWR2uzGZGR4uHXAtUUmZbxfpqwTJgNS/zW9kc2BO8iy', '2025-06-14 07:36:14.814672', 1, 'admin', '', '', 'admin@uni.pe', 1, 1, '2025-06-14 07:35:30.533044');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for CAT_SERVICIO
-- ----------------------------
DROP TABLE IF EXISTS `CAT_SERVICIO`;
CREATE TABLE `CAT_SERVICIO`  (
  `IDCATSERVICIO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDAREASERVICIO` int(0) NOT NULL,
  PRIMARY KEY (`IDCATSERVICIO`) USING BTREE,
  INDEX `fk_TIPO_SERVICIO_AREA_SERVICIO1_idx`(`IDAREASERVICIO`) USING BTREE,
  CONSTRAINT `fk_TIPO_SERVICIO_AREA_SERVICIO1` FOREIGN KEY (`IDAREASERVICIO`) REFERENCES `AREA_SERVICIO` (`IDAREASERVICIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for CATALOGO_PLATO
-- ----------------------------
DROP TABLE IF EXISTS `CATALOGO_PLATO`;
CREATE TABLE `CATALOGO_PLATO`  (
  `IDCATALOGO_PLATO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(145) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(345) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDEMPRESA` int(0) NOT NULL,
  PRIMARY KEY (`IDCATALOGO_PLATO`) USING BTREE,
  INDEX `fk_CATALOGO_PLATO_EMPRESA1_idx`(`IDEMPRESA`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for CATALOGO_TABLAS
-- ----------------------------
DROP TABLE IF EXISTS `CATALOGO_TABLAS`;
CREATE TABLE `CATALOGO_TABLAS`  (
  `IDCATALOGOTABLAS` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(245) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'A: Activo\nI: Inactivo',
  `FECHA_CREACION` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `ABREVIATURA` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDCATALOGOTABLAS`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CATALOGO_TABLAS
-- ----------------------------
INSERT INTO `CATALOGO_TABLAS` VALUES (1, 'TIPO DE DOCUMENTOS DE IDENTIDAD', 19, '2020-05-03 17:28:03', 'TD');
INSERT INTO `CATALOGO_TABLAS` VALUES (2, 'TIPO DE OPERADOR TELEFÓNICO', 19, '2020-05-03 17:31:14', 'TOT');
INSERT INTO `CATALOGO_TABLAS` VALUES (3, 'TIPO DE ESTADO CIVIL', 19, '2020-05-03 17:32:27', 'TEC');
INSERT INTO `CATALOGO_TABLAS` VALUES (4, 'TIPO DE GRADO DE INSTRUCCIÓN', 19, '2020-05-03 17:33:19', 'TGI');
INSERT INTO `CATALOGO_TABLAS` VALUES (5, 'ESTADO GENERAL', 19, '2020-05-05 10:17:29', 'EG');
INSERT INTO `CATALOGO_TABLAS` VALUES (6, 'Monitoreo Base', 19, '2020-08-01 22:15:10', 'MB');
INSERT INTO `CATALOGO_TABLAS` VALUES (7, 'Monitoreo Ruta', 19, '2020-08-01 22:18:29', 'MR');
INSERT INTO `CATALOGO_TABLAS` VALUES (8, 'TIPO DE PERSONA', 19, '2020-08-03 17:59:58', 'TIP PER');
INSERT INTO `CATALOGO_TABLAS` VALUES (9, 'TIPO DE PERSONAL', 19, '2020-08-24 14:22:50', 'TIPPERSL');
INSERT INTO `CATALOGO_TABLAS` VALUES (10, 'TIPO DE CONTENEDOR', 19, '2020-08-24 14:31:21', 'TIPCONT');
INSERT INTO `CATALOGO_TABLAS` VALUES (11, 'CONTENEDOR DE CARGA', 19, '2020-08-24 14:35:05', 'CONTCAR');
INSERT INTO `CATALOGO_TABLAS` VALUES (12, 'Inspección de EPP', 19, '2020-08-24 14:46:29', 'INSEPP');
INSERT INTO `CATALOGO_TABLAS` VALUES (13, 'Cumplimiento Estándar', 19, '2020-08-24 14:49:00', 'CUMEST');
INSERT INTO `CATALOGO_TABLAS` VALUES (14, 'Comunicaciones', 19, '2020-08-24 14:53:18', 'COM');
INSERT INTO `CATALOGO_TABLAS` VALUES (15, 'Equipamiento', 19, '2020-08-24 15:03:30', 'EQUI');
INSERT INTO `CATALOGO_TABLAS` VALUES (16, 'Señalización', 19, '2020-08-24 15:07:36', 'SENIA');
INSERT INTO `CATALOGO_TABLAS` VALUES (17, 'Tipo de Extintor', 19, '2020-08-24 15:09:46', 'EXTIN');
INSERT INTO `CATALOGO_TABLAS` VALUES (18, 'Sistema de Suspención', 19, '2020-08-24 15:12:11', 'SISSUS');
INSERT INTO `CATALOGO_TABLAS` VALUES (19, 'Sistema Eléctrico', 19, '2020-08-24 15:15:16', 'SISELE');
INSERT INTO `CATALOGO_TABLAS` VALUES (20, 'Motor', 19, '2020-08-24 15:16:50', 'MOT');
INSERT INTO `CATALOGO_TABLAS` VALUES (21, 'Revisión de Niveles', 19, '2020-08-24 15:18:35', 'REVNIV');
INSERT INTO `CATALOGO_TABLAS` VALUES (22, 'Sistemas de Frenos', 19, '2020-08-24 15:20:19', 'SISFRE');
INSERT INTO `CATALOGO_TABLAS` VALUES (23, 'Sistema de Dirección', 19, '2020-08-24 15:22:49', 'SISDIR');
INSERT INTO `CATALOGO_TABLAS` VALUES (24, 'Cabina', 19, '2020-08-24 15:25:35', 'CAB');
INSERT INTO `CATALOGO_TABLAS` VALUES (25, 'Accesorios de cisterna', 19, '2020-08-24 15:28:10', 'ACCCIS');
INSERT INTO `CATALOGO_TABLAS` VALUES (26, 'Acople Unidad', 19, '2020-08-24 15:29:22', 'ACOUNI');
INSERT INTO `CATALOGO_TABLAS` VALUES (27, 'Carrocería', 19, '2020-08-24 15:30:53', 'CARROC');
INSERT INTO `CATALOGO_TABLAS` VALUES (28, 'Aseguramiento de Carga', 19, '2020-08-24 15:32:12', 'ASECAR');
INSERT INTO `CATALOGO_TABLAS` VALUES (29, 'Sector Económico', 19, '2020-08-29 18:54:18', 'SECECO');
INSERT INTO `CATALOGO_TABLAS` VALUES (30, 'Rubro', 19, '2020-08-29 19:49:59', 'RUB');
INSERT INTO `CATALOGO_TABLAS` VALUES (31, 'Tipo de Comercio', 19, '2020-08-29 19:59:23', 'TIPCOM');
INSERT INTO `CATALOGO_TABLAS` VALUES (32, 'Tipo de vinculo empresarial', 19, '2020-08-29 20:10:52', 'TIPVIN');
INSERT INTO `CATALOGO_TABLAS` VALUES (33, 'Estado de acción orientación', 19, '2020-08-29 21:45:55', 'ACCSUB');
INSERT INTO `CATALOGO_TABLAS` VALUES (35, 'Cargo', 19, '2020-08-29 22:25:43', 'CRG');
INSERT INTO `CATALOGO_TABLAS` VALUES (36, 'Orden de llegada', 19, '2020-08-31 14:48:42', 'ORLL');
INSERT INTO `CATALOGO_TABLAS` VALUES (37, 'Estado del contenido', 19, '2020-08-31 14:55:12', 'ESTCON');
INSERT INTO `CATALOGO_TABLAS` VALUES (38, 'Objetos de inspección', 19, '2020-09-03 12:07:58', 'OBINS');
INSERT INTO `CATALOGO_TABLAS` VALUES (39, 'Tipo de vehículo por peso', 19, '2020-09-10 16:33:49', 'TIPVEHI');
INSERT INTO `CATALOGO_TABLAS` VALUES (40, 'Tipo de carreta', 19, '2020-09-10 16:36:01', 'TIPCARR');
INSERT INTO `CATALOGO_TABLAS` VALUES (41, 'Marca de vehículos', 19, '2020-09-10 16:55:01', 'MARVEHI');
INSERT INTO `CATALOGO_TABLAS` VALUES (42, 'Tipo de vehiculo por forma', 19, '2020-09-10 17:11:36', 'TIPVEHI');
INSERT INTO `CATALOGO_TABLAS` VALUES (43, 'Alternativas de inspección', 19, '2020-10-13 18:52:01', 'ALTINS');
INSERT INTO `CATALOGO_TABLAS` VALUES (44, 'Estado programación convoy', 19, '2020-10-30 16:00:54', 'ESPROG');
INSERT INTO `CATALOGO_TABLAS` VALUES (45, 'Estado de guardar registros', 19, '2020-10-30 16:12:40', 'ESREG');
INSERT INTO `CATALOGO_TABLAS` VALUES (46, 'GENERO', 19, '2020-10-16 15:11:17', 'GEN');
INSERT INTO `CATALOGO_TABLAS` VALUES (47, 'Tipo de Inspección', 19, '2020-11-17 14:50:53', 'TIPINS');
INSERT INTO `CATALOGO_TABLAS` VALUES (48, 'Estado de Componente', 19, '2021-09-04 21:32:47', 'ESTCOM');
INSERT INTO `CATALOGO_TABLAS` VALUES (49, 'Tipo de empresa', 19, '2025-06-13 10:30:36', 'TIPEMP');
INSERT INTO `CATALOGO_TABLAS` VALUES (50, 'Lugar de Firma de documentos', 19, '2025-06-13 11:00:41', 'LUGFIRDOC');
INSERT INTO `CATALOGO_TABLAS` VALUES (51, 'Estado de reserva nombre de empresa', 19, '2025-06-13 11:01:56', 'ESTRESEMP');
INSERT INTO `CATALOGO_TABLAS` VALUES (52, 'Tipo de aporte de dinero en la empresa', 19, '2025-06-13 11:03:51', 'TIPAPOR');

-- ----------------------------
-- Table structure for CLIENTE
-- ----------------------------
DROP TABLE IF EXISTS `CLIENTE`;
CREATE TABLE `CLIENTE`  (
  `IDCLIENTE` int(0) NOT NULL AUTO_INCREMENT,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TIPO_CLIENTE` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MONTO_ULTIMA_COMPRA` decimal(5, 0) NULL DEFAULT NULL,
  `CUENTA_BANCARIA` int(0) NULL DEFAULT NULL,
  `CALIFICACION` decimal(2, 0) NULL DEFAULT NULL,
  `FECHA_CREACION` datetime(0) NULL DEFAULT NULL,
  `FECHA_BAJA` datetime(0) NULL DEFAULT NULL,
  `FECHA_ACTIVACION` datetime(0) NULL DEFAULT NULL,
  `TOTAL_PEDIDOS` int(0) NULL DEFAULT NULL,
  `TOTAL_ATENDIDOS` int(0) NULL DEFAULT NULL,
  `IDPERSONA` int(0) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`) USING BTREE,
  INDEX `fk_CLIENTE_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_CLIENTE_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for COMPONENTE
-- ----------------------------
DROP TABLE IF EXISTS `COMPONENTE`;
CREATE TABLE `COMPONENTE`  (
  `IDCOMPONENTE` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'CABECERA/BANNER/CUERPO/PIE',
  `TITULO` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `RESUMEN` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `CONTENIDO` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `IDCOMPONENTEPADRE` int(0) NULL DEFAULT NULL,
  `FECHA_CREACION` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOCREACION` int(0) NULL DEFAULT NULL,
  `FECHA_ACTUALIZACION` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `IDUSUARIOACTUALIZACION` int(0) NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'PUBLICADO/VISTAPREVIA/NO PUBLICADO',
  PRIMARY KEY (`IDCOMPONENTE`) USING BTREE,
  INDEX `fk_COMPONENTE_COMPONENTE1_idx`(`IDCOMPONENTEPADRE`) USING BTREE,
  CONSTRAINT `fk_COMPONENTE_COMPONENTE1` FOREIGN KEY (`IDCOMPONENTEPADRE`) REFERENCES `COMPONENTE` (`IDCOMPONENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of COMPONENTE
-- ----------------------------
INSERT INTO `COMPONENTE` VALUES (16, 'cabecera', 'CabeceraComponent', '<p><strong>Cabecera Principal</strong> Porta&#241;l Web Nvo Chimbote</p>', '<header class=\"main-header clearfix\">\n<div class=\"main-header__logo\">\n<a href=\"index-2.html\">\n<img src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-12-06/c95e9f2e44795c6f.png\" alt=\"\">\n</a>\n</div>\n<div class=\"main-menu-wrapper\">\n<div class=\"main-menu-wrapper__top\">\n<div class=\"main-menu-wrapper__top-inner\">\n<div class=\"main-menu-wrapper__left\">\n<div class=\"main-menu-wrapper__left-content\">\n<div class=\"main-menu-wrapper__left-text\">\n<p>Welcome to the Charity & Donation Theme</p>\n</div>\n<div class=\"main-menu-wrapper__left-email-box\">\n<div class=\"icon\">\n<i class=\"fas fa-envelope\"></i>\n</div>\n<div class=\"email\">\n<a href=\"mailto:needhelp@company.com\">needhelp@company.com</a>\n</div>\n</div>\n</div>\n</div>\n<div class=\"main-menu-wrapper__right\">\n<div class=\"main-menu-wrapper__right-social\">\n<a href=\"#\"><i class=\"fab fa-twitter\"></i></a>\n<a href=\"#\"><i class=\"fab fa-facebook-square\"></i></a>\n<a href=\"#\"><i class=\"fab fa-dribbble\"></i></a>\n<a href=\"#\"><i class=\"fab fa-instagram\"></i></a>\n</div>\n</div>\n</div>\n</div>\n<div class=\"main-menu-wrapper__bottom\">\n<nav class=\"main-menu\">\n<div class=\"main-menu__inner\" *ngIf=\"menuCabecera\" >\n<a href=\"#\" class=\"mobile-nav__toggler\"><i class=\"fa fa-bars\"></i></a>\n<app-menu></app-menu>\n<div class=\"main-menu__right\">\n<a href=\"#\" class=\"main-menu__search search-toggler icon-magnifying-glass\"></a>\n<a href=\"#\" class=\"main-menu__cart icon-shopping-cart \"></a>\n<div class=\"main-menu__phone-contact\">\n<div class=\"main-menu__phone-icon\">\n<span class=\"icon-chat\"></span>\n</div>\n<div class=\"main-menu__phone-number\">\n<p>Call Anytime</p>\n<a href=\"tel:92 666 888 0000\">92 666 888 0000</a>\n</div>\n</div>\n<a href=\"causes-details.html\" class=\"main-menu__donate-btn\"><i class=\"fa fa-heart\"></i>Donate\n</a>\n</div>\n</div>\n</nav>\n</div>\n</div>\n\n</header>', NULL, NULL, 1, '2023-12-10 16:01:59', NULL, 318);
INSERT INTO `COMPONENTE` VALUES (17, 'pie', 'PieComponent', '<p><strong>Cabecera Principal</strong> Portañl Web Nvo Chimbote</p>', '<!--Site Footer One Start-->\n<footer class=\"site-footer\">\n<div class=\"site-footer-bg\" style=\"background-image: url(assets/images/backgrounds/footer-bg.jpg)\"></div>\n<div class=\"container\">\n<div class=\"site-footer__top\">\n<div class=\"row\">\n<div class=\"col-xl-3 col-lg-6 col-md-6 wow fadeInUp\" data-wow-delay=\"100ms\">\n<div class=\"footer-widget__column footer-widget__about\">\n<h3 class=\"footer-widget__title\">About</h3>\n<p class=\"footer-widget__text\">Lorem ipsum dolor sit ame consect etur pisicing elit sed\ndo eiusmod tempor incididunt ut labore.</p>\n<a href=\"#\" class=\"footer-widget__about-btn\"><i class=\"fa fa-heart\"></i>Donate </a>\n</div>\n</div>\n<div class=\"col-xl-3 col-lg-6 col-md-6 wow fadeInUp\" data-wow-delay=\"200ms\">\n<div class=\"footer-widget__column footer-widget__explore clearfix\">\n<h3 class=\"footer-widget__title\">Explore</h3>\n<ul class=\"footer-widget__explore-list list-unstyled\">\n<li><a href=\"#\">Donate</a></li>\n<li><a href=\"#\">Campaigns</a></li>\n<li><a href=\"#\">Fundraise</a></li>\n<li><a href=\"#\">Volunteers</a></li>\n<li><a href=\"#\">Sponsors</a></li>\n</ul>\n<ul class=\"footer-widget__explore-list footer-widget__explore-list-two list-unstyled\">\n<li><a href=\"#\">Fundraising</a></li>\n<li><a href=\"#\">Contact</a></li>\n<li><a href=\"#\">Help</a></li>\n<li><a href=\"#\">Faqs</a></li>\n</ul>\n</div>\n</div>\n<div class=\"col-xl-3 col-lg-6 col-md-6 wow fadeInUp\" data-wow-delay=\"300ms\">\n<div class=\"footer-widget__column footer-widget__contact\">\n<h3 class=\"footer-widget__title\">Contact</h3>\n<ul class=\"list-unstyled footer-widget__contact-list\">\n<li>\n<div class=\"icon\">\n<i class=\"icon-chat\"></i>\n</div>\n<div class=\"text\">\n<p>\n<span>Call Anytime</span>\n<a href=\"tel:92 666 888 0000\">92 666 888 0000</a>\n</p>\n</div>\n</li>\n<li>\n<div class=\"icon\">\n<i class=\"icon-message\"></i>\n</div>\n<div class=\"text\">\n<p>\n<span>Send Email</span>\n<a href=\"mailto:needhelp@company.com\">needhelp@company.com</a>\n</p>\n</div>\n</li>\n<li>\n<div class=\"icon\">\n<i class=\"icon-address\"></i>\n</div>\n<div class=\"text\">\n<p><span>Visit Office</span>80 broklyn golden street</p>\n</div>\n</li>\n</ul>\n</div>\n</div>\n<div class=\"col-xl-3 col-lg-6 col-md-6 wow fadeInUp\" data-wow-delay=\"400ms\">\n<div class=\"footer-widget__column footer-widget__newsletter\">\n<h3 class=\"footer-widget__title\">Newsletter</h3>\n<p class=\"footer-widget__newsletter-text\">Lorem ipsum dolor sit ame consect etur\npisicing elit sed do.</p>\n<form class=\"footer-widget__newsletter-form\">\n<input type=\"email\" placeholder=\"Email address\" name=\"email\">\n<button type=\"submit\" class=\"footer-widget__newsletter-btn\"><i\nclass=\"fas fa-arrow-circle-right\"></i>Send</button>\n</form>\n</div>\n</div>\n</div>\n</div>\n<div class=\"site-footer__bottom\">\n<div class=\"row\">\n<div class=\"col-xl-12\">\n<div class=\"site-footer__bottom-inner\">\n<div class=\"site-footer__bottom-logo-social\">\n<div class=\"site-footer__bottom-logo\">\n<a href=\"index-2.html\"><img src=\"assets/images/resources/footer-logo.jpg\"\nalt=\"\"></a>\n</div>\n<div class=\"site-footer__bottom-social\">\n<a href=\"#\"><i class=\"fab fa-twitter\"></i></a>\n<a href=\"#\"><i class=\"fab fa-facebook-square\"></i></a>\n<a href=\"#\"><i class=\"fab fa-dribbble\"></i></a>\n<a href=\"#\"><i class=\"fab fa-instagram\"></i></a>\n</div>\n</div>\n<div class=\"site-footer__bottom-copy-right\">\n<p>© Copyright 2021 by <a href=\"#\">Layerdrops.com</a></p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</footer>\n<!--Site Footer One End-->', NULL, NULL, 1, '2023-12-10 16:02:08', NULL, 318);
INSERT INTO `COMPONENTE` VALUES (18, 'banner-home', 'BannerHomeComponent', '<p><strong>Cabecera Principal</strong> Portañl Web Nvo Chimbote</p>', '<section class=\"main-slider\">\n<div class=\"swiper-container thm-swiper__slider\" data-swiper-options=\'{\"slidesPerView\": 1, \"loop\": true,\n\"effect\": \"fade\",\n\"pagination\": {\n\"el\": \"#main-slider-pagination\",\n\"type\": \"bullets\",\n\"clickable\": true\n},\n\"navigation\": {\n\"nextEl\": \"#main-slider__swiper-button-next\",\n\"prevEl\": \"#main-slider__swiper-button-prev\"\n},\n\"autoplay\": {\n\"delay\": 5000\n}}\'>\n<div class=\"swiper-wrapper\">\n<div class=\"swiper-slide\">\n<div class=\"image-layer\"\nstyle=\"background-image: url(http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-11-07/cc05df905f3f6059.jpg);\">\n</div>\n<div class=\"image-layer-overlay\"></div>\n<!-- /.image-layer -->\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-8\">\n<div class=\"main-slider__content\">\n<p>Helping Them Today</p>\n<h2>Help the Poor <br> in Need</h2>\n<a href=\"#\" class=\"thm-btn\"><i class=\"fas fa-arrow-circle-right\"></i>Learn\nMore</a>\n<div class=\"main-slider__shape-1 zoom-fade\">\n<img src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-11-07/ab6cdcb2d831d8e9.png\"\nalt=\"\">\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"swiper-slide\">\n<div class=\"image-layer\"\nstyle=\"background-image: url(http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-11-07/a96b1a2411122174.jpg);\">\n</div>\n<div class=\"image-layer-overlay\"></div>\n<!-- /.image-layer -->\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-8\">\n<div class=\"main-slider__content\">\n<p>Helping Them Today</p>\n<h2>Help the Poor <br> in Need</h2>\n<a href=\"#\" class=\"thm-btn\"><i class=\"fas fa-arrow-circle-right\"></i>Learn\nMore</a>\n<div class=\"main-slider__shape-1 zoom-fade\">\n<img src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-11-07/ab6cdcb2d831d8e9.png\"\nalt=\"\">\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"swiper-slide\">\n<div class=\"image-layer\"\nstyle=\"background-image: url(http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-11-07/9549b25c09c7a6d9.jpg);\">\n</div>\n<div class=\"image-layer-overlay\"></div>\n<!-- /.image-layer -->\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-8\">\n<div class=\"main-slider__content\">\n<p>Helping Them Today</p>\n<h2>Help the Poor <br> in Need</h2>\n<a href=\"#\" class=\"thm-btn\"><i class=\"fas fa-arrow-circle-right\"></i>Learn\nMore</a>\n<div class=\"main-slider__shape-1 zoom-fade\">\n<img src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-11-07/ab6cdcb2d831d8e9.png\"\nalt=\"\">\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"main-slider__counter\">\n<ul class=\"main-slider__counter-box list-unstyled\">\n<li>\n<h3 class=\"main-sldier__counter-digit\">4390</h3>\n<span class=\"main-slider__counter-text\">Volunteers are Available</span>\n</li>\n<li>\n<h3 class=\"main-sldier__counter-digit\">8900</h3>\n<span class=\"main-slider__counter-text\">Funds Raised by People</span>\n</li>\n</ul>\n</div>\n<!-- If we need navigation buttons -->\n<div class=\"swiper-pagination\" id=\"main-slider-pagination\"></div>\n<div class=\"main-slider__nav\">\n<div class=\"swiper-button-prev\" id=\"main-slider__swiper-button-next\"><i\nclass=\"icon-right-arrow icon-left-arrow\"></i>\n</div>\n<div class=\"swiper-button-next\" id=\"main-slider__swiper-button-prev\"><i class=\"icon-right-arrow\"></i>\n</div>\n</div>\n</div>\n</section>', NULL, NULL, 1, '2023-12-10 16:02:23', NULL, 318);
INSERT INTO `COMPONENTE` VALUES (19, 'bienvenida', 'BienvenidaHomeComponent', 'Esta secci&#243;n est&#225; orientado para dar un resumen de lo que hablar&#225; el portal web es su presentaci&#243;n', '<!--Welcome One Start-->\n<section class=\"welcome-one\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-xl-6 col-lg-6\">\n<div class=\"welcome-one__left\">\n<div class=\"welcome-one__img-box\">\n<img src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-12-07/a23a16e93a8f3b9b.png\" alt=\"\">\n<div class=\"welcome-one__img-box-2\">\n<img src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-12-07/a23a16e93a8f3b9b.png\" alt=\"\">\n</div>\n<h2 class=\"welcome-one__bottom-text\">Palabras del Alcalde</h2>\n<!-- <div class=\"welcome-one__heart-icon\">\n<img src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-12-06/c95e9f2e44795c6f.png\" alt=\"\">\n</div> -->\n</div>\n</div>\n</div>\n<div class=\"col-xl-6 col-lg-6\">\n<div class=\"welcome-one__right\">\n<div class=\"section-title text-left\">\n<span class=\"section-title__tagline\">Queridos Neochimbotanos.</span>\n<h2 class=\"section-title__title\">Un saludo para todos.</h2>\n</div>\n<p class=\"welcome-one__right-text\">Iniciamos una nueva etapa de cambios, sacando adelante nuestro distrito de Nuevo Chimbote para llevarla por la senda del progreso con la debida dedicación y trabajo, pensando en el interés supremo de ustedes, a quienes nos debemos.\n</p>\n<div class=\"welcome-one__our-mission-and-story\">\n<div class=\"welcome-one__mission-and-story-single\">\n<h3><i class=\"fas fa-arrow-circle-right\"></i>nuestra misión</h3>\n<p class=\"welcome-one__our-mission-and-story-text\">Somos una entidad pública, encargada de planificar, administrar, promover y conducir al desarrollo socio económico del Distrito de Nuevo Chimbote.</p>\n</div>\n<div class=\"welcome-one__mission-and-story-single\">\n<h3><i class=\"fas fa-arrow-circle-right\"></i>Nuestra historia</h3>\n<p class=\"welcome-one__our-mission-and-story-text\">El Distrito de Nuevo Chimbote cuenta en la actualidad con más de 200.000 habitantes, el crecimiento que ha experimentado se debe a numerosos factores.</p>\n</div>\n</div>\n<div class=\"welcome-one__progress\">\n<div class=\"welcome-one__progress-single\">\n<h4 class=\"welcome-one__progress-title\">Obras</h4>\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"83%\">\n<div class=\"count-text\">83%</div>\n</div>\n</div>\n</div>\n<div class=\"welcome-one__progress-single\">\n<h4 class=\"welcome-one__progress-title\">Programas Sociales</h4>\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"80%\">\n<div class=\"count-text\">80%</div>\n</div>\n</div>\n</div>\n</div>\n<a href=\"#\" class=\"welcome-one__btn thm-btn\"><i class=\"fas fa-arrow-circle-right\"></i>Leer más</a>\n</div>\n</div>\n</div>\n</div>\n</section>\n<!--Welcome One End-->', NULL, '2023-12-07 11:22:15', 1, '2023-12-10 16:02:53', NULL, 318);
INSERT INTO `COMPONENTE` VALUES (20, 'noticia-home', 'noticias', 'Resumen de &#250;ltimas noticias', '<!--Causes One Start-->\n<section class=\"causes-one\">\n<div class=\"container\">\n<div class=\"section-title text-center\">\n<span class=\"section-title__tagline\">Latest Causes</span>\n<h2 class=\"section-title__title\">Find the popular cause <br> and donate them</h2>\n</div>\n<div class=\"row\">\n<div class=\"col-xl-12\">\n<div class=\"causes-one__carousel owl-theme owl-carousel\">\n<div class=\"causes-one__single wow fadeInLeft\" data-wow-duration=\"1500ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-1.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">Raise Fund for Clean & Healthy Water</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-one__single wow fadeInUp\" data-wow-duration=\"1500ms\"\ndata-wow-delay=\"100ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-2.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">School Counseling for Children</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-one__single wow fadeInRight\" data-wow-duration=\"1500ms\"\ndata-wow-delay=\"200ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-3.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">Fundrising for Early Childhood Rise</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-one__single wow fadeInLeft\" data-wow-duration=\"1500ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-1.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">Promoting The Rights of Children</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-one__single wow fadeInUp\" data-wow-duration=\"1500ms\"\ndata-wow-delay=\"100ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-2.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">Education for Poor Children</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-one__single wow fadeInRight\" data-wow-duration=\"1500ms\"\ndata-wow-delay=\"200ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-3.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">Raise Fund for Clean & Healthy Water</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-one__single wow fadeInLeft\" data-wow-duration=\"1500ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-1.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">Raise Fund for Clean & Healthy Water</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-one__single wow fadeInUp\" data-wow-duration=\"1500ms\"\ndata-wow-delay=\"100ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-2.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">Raise Fund for Clean & Healthy Water</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-one__single fadeInRight\" data-wow-duration=\"1500ms\"\ndata-wow-delay=\"200ms\">\n<div class=\"causes-one__img\">\n<div class=\"causes-one__img-box\">\n<img src=\"assets/images/resources/causes-one-img-3.jpg\" alt=\"\">\n<a href=\"#\">\n<i class=\"fa fa-plus\"></i>\n</a>\n</div>\n<div class=\"causes-one__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-one__content\">\n<h3 class=\"causes-one__title\">\n<a href=\"causes-details.html\">Raise Fund for Clean & Healthy Water</a>\n</h3>\n<p class=\"causes-one__text\">There are not many of passages of lorem ipsum avail isn\nalteration donationa in form simply free.</p>\n</div>\n<div class=\"causes-one__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-one__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</section>\n<!--Causes One End-->', NULL, '2023-12-08 07:49:37', 1, NULL, NULL, 318);
INSERT INTO `COMPONENTE` VALUES (21, 'banner-interno', 'BannerInternoComponent', 'ninguno', '<div class=\"stricky-header stricked-menu main-menu\">\n<div class=\"sticky-header__content\"></div><!-- /.sticky-header__content -->\n</div><!-- /.stricky-header -->\n\n<!--Page Header Start-->\n<section class=\"page-header\">\n<div class=\"page-header__bg\" style=\"background-image: url(http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-03-09/31ebd72b37ca0a72.jpg);\"></div>\n<!-- /.page-header__bg -->\n<div class=\"container\">\n<h2>Causes</h2>\n<ul class=\"thm-breadcrumb list-unstyled\">\n<li><a href=\"index-2.html\">Home</a></li>\n<li class=\"color-thm-gray\">/</li>\n<li><span>Causes Details</span></li>\n</ul>\n</div>\n</section>\n<!--Page Header End-->', NULL, '2023-12-23 10:50:32', 1, NULL, NULL, NULL);
INSERT INTO `COMPONENTE` VALUES (22, 'edwin', 'edwin', 'edwin', 'edwin', NULL, '2024-02-27 23:34:52', 1, NULL, NULL, 318);
INSERT INTO `COMPONENTE` VALUES (23, 'cuerpo', 'cuerpo de todas las plantillas', 'cuerpo para imprimir pagina', '<app-cuerpo></cuerpo>', NULL, '2024-03-08 20:48:45', NULL, '2024-03-08 20:48:51', NULL, 318);

-- ----------------------------
-- Table structure for CONVERSACION
-- ----------------------------
DROP TABLE IF EXISTS `CONVERSACION`;
CREATE TABLE `CONVERSACION`  (
  `IDCONVERSACION` int(0) NOT NULL AUTO_INCREMENT,
  `MENSAJE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `RESPUESTA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FECHA` datetime(0) NULL DEFAULT NULL,
  `IDUSUARIO` int(0) NOT NULL,
  `ESTADO_LECTURA` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`IDCONVERSACION`) USING BTREE,
  INDEX `fk_CONVERSACION_USUARIO1_idx`(`IDUSUARIO`) USING BTREE,
  CONSTRAINT `fk_CONVERSACION_USUARIO1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `USUARIO` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CONVERSACION
-- ----------------------------
INSERT INTO `CONVERSACION` VALUES (1, 'Hola', 'Hola! Soy el asistente de Emprende con Interbank. ¿En qué puedo ayudarte?', '2025-06-14 04:34:48', 1, 1);
INSERT INTO `CONVERSACION` VALUES (2, NULL, 'interesante ', '2025-06-14 04:35:18', 1, 1);
INSERT INTO `CONVERSACION` VALUES (3, 'si se vio', '¿Podrías repetirlo, por favor?', '2025-06-14 04:35:46', 1, 1);
INSERT INTO `CONVERSACION` VALUES (4, '¿Qué incluye el servicio?', '¿Decías?', '2025-06-14 06:40:46', 36, 1);
INSERT INTO `CONVERSACION` VALUES (5, '¿Qué incluye el servicio?', '¿Disculpa?', '2025-06-14 06:40:54', 36, 1);
INSERT INTO `CONVERSACION` VALUES (6, 'buena idea', '¿Decías?', '2025-06-14 06:44:06', 36, 1);
INSERT INTO `CONVERSACION` VALUES (7, 'Quiero una SRL', '¿Podrías repetirlo, por favor?', '2025-06-14 07:00:04', 36, 1);
INSERT INTO `CONVERSACION` VALUES (8, 'Quiero una SRL', '¿Decías?', '2025-06-14 07:00:11', 36, 1);
INSERT INTO `CONVERSACION` VALUES (9, 'Hola', 'Hola! Soy el asistente de Emprende con Interbank. ¿En qué puedo ayudarte?', '2025-06-14 07:03:55', 49, 1);
INSERT INTO `CONVERSACION` VALUES (10, 'Crear empresa ahora', '¿Cómo?', '2025-06-14 07:04:17', 49, 1);
INSERT INTO `CONVERSACION` VALUES (11, 'Crear empresa ahora', '¿Podrías repetirlo, por favor?', '2025-06-14 07:04:25', 49, 1);
INSERT INTO `CONVERSACION` VALUES (12, 'Crear empresa ahora', '¿Disculpa?', '2025-06-14 07:04:29', 49, 1);
INSERT INTO `CONVERSACION` VALUES (13, 'Crear empresa', 'Ahora te ayudamos a crear tu empresa.', '2025-06-14 07:07:46', 49, 1);
INSERT INTO `CONVERSACION` VALUES (14, 'que se necesita', 'Ahora te ayudamos a crear tu empresa.', '2025-06-14 07:07:54', 49, 1);
INSERT INTO `CONVERSACION` VALUES (15, 'Quiero una SRL', '¿Cómo?', '2025-06-14 07:09:56', 49, 1);
INSERT INTO `CONVERSACION` VALUES (16, 'Quiero una SRL', '¿Cómo?', '2025-06-14 07:33:17', 49, 1);
INSERT INTO `CONVERSACION` VALUES (17, NULL, 'hola', '2025-06-14 10:07:04', 49, 1);
INSERT INTO `CONVERSACION` VALUES (18, 'hola', '¡Buenos días!', '2025-06-28 09:00:16', 50, 0);

-- ----------------------------
-- Table structure for COTIZACION
-- ----------------------------
DROP TABLE IF EXISTS `COTIZACION`;
CREATE TABLE `COTIZACION`  (
  `IDCOTIZACION` int(0) NOT NULL AUTO_INCREMENT,
  `MONTO` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(545) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDEMPRESA` int(0) NOT NULL,
  `IDINSUMO` int(0) NOT NULL,
  `ESTADO` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'COTIZADO\nPEDIDO\n',
  PRIMARY KEY (`IDCOTIZACION`) USING BTREE,
  INDEX `fk_COTIZACION_EMPRESA1_idx`(`IDEMPRESA`) USING BTREE,
  INDEX `fk_COTIZACION_INSUMO1_idx`(`IDINSUMO`) USING BTREE,
  CONSTRAINT `fk_COTIZACION_EMPRESA1` FOREIGN KEY (`IDEMPRESA`) REFERENCES `EMPRESA` (`IDEMPRESA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_COTIZACION_INSUMO1` FOREIGN KEY (`IDINSUMO`) REFERENCES `INSUMO` (`IDINSUMO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DEPARTAMENTO
-- ----------------------------
DROP TABLE IF EXISTS `DEPARTAMENTO`;
CREATE TABLE `DEPARTAMENTO`  (
  `IDDEPARTAMENTO` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NOMBRE` varchar(145) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `IDPAIS` int(0) NOT NULL,
  `CODIGO` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDDEPARTAMENTO`) USING BTREE,
  INDEX `fk_DEPARTAMENTO_PAIS1_idx`(`IDPAIS`) USING BTREE,
  CONSTRAINT `DEPARTAMENTO_ibfk_1` FOREIGN KEY (`IDPAIS`) REFERENCES `PAIS` (`IDPAIS`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DEPARTAMENTO
-- ----------------------------
INSERT INTO `DEPARTAMENTO` VALUES ('01', 'Amazonas', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('02', 'Áncash', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('03', 'Apurímac', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('04', 'Arequipa', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('05', 'Ayacucho', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('06', 'Cajamarca', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('07', 'Callao', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('08', 'Cusco', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('09', 'Huancavelica', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('10', 'Huánuco', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('11', 'Ica', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('12', 'Junín', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('13', 'La Libertad', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('14', 'Lambayeque', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('15', 'Lima', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('16', 'Loreto', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('17', 'Madre de Dios', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('18', 'Moquegua', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('19', 'Pasco', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('20', 'Piura', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('21', 'Puno', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('22', 'San Martín', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('23', 'Tacna', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('24', 'Tumbes', NULL, NULL, 173, NULL);
INSERT INTO `DEPARTAMENTO` VALUES ('25', 'Ucayali', NULL, NULL, 173, NULL);

-- ----------------------------
-- Table structure for DETALLE
-- ----------------------------
DROP TABLE IF EXISTS `DETALLE`;
CREATE TABLE `DETALLE`  (
  `IDPLATO` int(0) NOT NULL,
  `IDPEDIDO` int(0) NOT NULL,
  PRIMARY KEY (`IDPLATO`, `IDPEDIDO`) USING BTREE,
  INDEX `fk_PLATO_has_PEDIDO_PEDIDO1_idx`(`IDPEDIDO`) USING BTREE,
  INDEX `fk_PLATO_has_PEDIDO_PLATO1_idx`(`IDPLATO`) USING BTREE,
  CONSTRAINT `fk_PLATO_has_PEDIDO_PEDIDO1` FOREIGN KEY (`IDPEDIDO`) REFERENCES `PEDIDO` (`IDPEDIDO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_PLATO_has_PEDIDO_PLATO1` FOREIGN KEY (`IDPLATO`) REFERENCES `PLATO` (`IDPLATO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DIRECCION
-- ----------------------------
DROP TABLE IF EXISTS `DIRECCION`;
CREATE TABLE `DIRECCION`  (
  `IDDIRECCION` int(0) NOT NULL AUTO_INCREMENT,
  `TIPO` int(0) NULL DEFAULT NULL COMMENT 'DOMICILIO, TRABAJO, CASA-PLAYA, ETC',
  `TIPO_ZONA` int(0) NULL DEFAULT NULL COMMENT 'URBANIZACIÓN / CONJ. HABITACIONAL / ETC.\n',
  `NOMBRE_ZONA` varchar(245) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'LAS LOMAS / LAS VIÑAS / ETC.\n',
  `TIPO_VIA` varchar(245) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'AV / JIRON / PROLONGACIÓN / CALLE / ETC.',
  `NOMB_VIA` varchar(245) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TIPO_EXTERIOR` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'NRO, KM, MZ LT\n',
  `VALOR_EXTERIOR` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TIPO_INTERIOR` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'DPT., HABITACION, INTERIOR\n',
  `VALOR_INTERIOR` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PISO` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LATITUD` float NULL DEFAULT NULL,
  `LONGITUD` float NULL DEFAULT NULL,
  `IDDISTRITO` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`IDDIRECCION`) USING BTREE,
  INDEX `fk_DIRECCION_DISTRITO1_idx`(`IDDISTRITO`) USING BTREE,
  CONSTRAINT `fk_DIRECCION_DISTRITO1` FOREIGN KEY (`IDDISTRITO`) REFERENCES `DISTRITO` (`IDDISTRITO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DIRECCION
-- ----------------------------
INSERT INTO `DIRECCION` VALUES (1, 1, 22, 'comas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '010102');

-- ----------------------------
-- Table structure for DIRECTORIO
-- ----------------------------
DROP TABLE IF EXISTS `DIRECTORIO`;
CREATE TABLE `DIRECTORIO`  (
  `IDDIRECTORIO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PATH` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDDIRECTORIOPADRE` int(0) NULL DEFAULT NULL,
  `NIVEL` int(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDDIRECTORIO`) USING BTREE,
  INDEX `fk_DIRECTORIO_DIRECTORIO_idx`(`IDDIRECTORIOPADRE`) USING BTREE,
  CONSTRAINT `fk_DIRECTORIO_DIRECTORIO` FOREIGN KEY (`IDDIRECTORIOPADRE`) REFERENCES `DIRECTORIO` (`IDDIRECTORIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DIRECTORIO
-- ----------------------------
INSERT INTO `DIRECTORIO` VALUES (1, 'uploads', '', NULL, 0, NULL, '2025-02-08 01:21:18');
INSERT INTO `DIRECTORIO` VALUES (2, 'Contenidos', 'uploads', 1, 1, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (3, 'Documentos', 'uploads\\Contenidos', 2, 2, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (4, '2021-09-29', 'uploads\\Contenidos\\Documentos', 3, 3, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (5, '2023-10-27', 'uploads\\Contenidos\\Documentos', 3, 3, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (6, '2024-09-21', 'uploads\\Contenidos\\Documentos', 3, 3, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (7, 'Imagenes', 'uploads\\Contenidos', 2, 2, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (8, '2021-09-27', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (9, '2021-09-29', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (10, '2023-10-26', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (11, '2023-10-27', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:23', '2025-02-09 02:23:23');
INSERT INTO `DIRECTORIO` VALUES (12, '2023-10-31', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (13, '2023-11-07', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (14, '2023-12-06', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (15, '2023-12-07', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (16, '2024-03-03', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (17, '2024-03-09', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (18, '2024-09-21', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (19, '2024-10-13', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (20, '2024-10-15', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (21, '2024-10-22', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (22, '2024-10-23', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (23, '2024-10-24', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (24, '2024-10-25', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (25, '2024-10-26', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (26, '2024-11-08', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (27, '2024-11-13', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:24', '2025-02-09 02:23:24');
INSERT INTO `DIRECTORIO` VALUES (28, '2024-11-14', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:25', '2025-02-09 02:23:25');
INSERT INTO `DIRECTORIO` VALUES (29, '2024-11-24', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:25', '2025-02-09 02:23:25');
INSERT INTO `DIRECTORIO` VALUES (30, '2024-11-26', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:25', '2025-02-09 02:23:25');
INSERT INTO `DIRECTORIO` VALUES (31, 'nuevo', 'uploads\\Contenidos\\Imagenes\\2024-11-26', 30, 4, '2025-02-09 02:23:25', '2025-02-09 02:23:25');
INSERT INTO `DIRECTORIO` VALUES (32, '2024-11-27', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:25', '2025-02-09 02:23:25');
INSERT INTO `DIRECTORIO` VALUES (33, '2024-11-28', 'uploads\\Contenidos\\Imagenes', 7, 3, '2025-02-09 02:23:25', '2025-02-09 02:23:25');
INSERT INTO `DIRECTORIO` VALUES (34, 'beritlucero', 'uploads\\Contenidos', 2, 2, '2025-02-13 00:11:22', '2025-02-14 10:16:57');
INSERT INTO `DIRECTORIO` VALUES (35, 'edwincalero', 'uploads\\Contenidos', 2, 2, '2025-02-13 00:14:09', '2025-02-14 10:16:38');
INSERT INTO `DIRECTORIO` VALUES (37, 'thiago40', 'uploads\\Contenidos', 2, 2, '2025-02-13 00:42:54', '2025-02-15 00:54:30');
INSERT INTO `DIRECTORIO` VALUES (38, 'carlos2025', 'uploads\\Contenidos\\Documentos', 3, 3, '2025-02-14 10:21:37', '2025-02-14 10:22:02');
INSERT INTO `DIRECTORIO` VALUES (39, 'tabita', 'uploads\\Contenidos', 2, 2, '2025-02-15 00:28:47', '2025-02-15 00:50:27');

-- ----------------------------
-- Table structure for DISTRITO
-- ----------------------------
DROP TABLE IF EXISTS `DISTRITO`;
CREATE TABLE `DISTRITO`  (
  `IDDISTRITO` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NOMBRE` varchar(145) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDDEPARTAMENTO` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDPROVINCIA` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDDISTRITO`) USING BTREE,
  INDEX `fk_DISTRITO_PROVINCIA1_idx`(`IDPROVINCIA`) USING BTREE,
  CONSTRAINT `DISTRITO_ibfk_1` FOREIGN KEY (`IDPROVINCIA`) REFERENCES `PROVINCIA` (`IDPROVINCIA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DISTRITO
-- ----------------------------
INSERT INTO `DISTRITO` VALUES ('010101', 'Chachapoyas', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010102', 'Asunción', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010103', 'Balsas', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010104', 'Cheto', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010105', 'Chiliquin', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010106', 'Chuquibamba', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010107', 'Granada', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010108', 'Huancas', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010109', 'La Jalca', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010110', 'Leimebamba', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010111', 'Levanto', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010112', 'Magdalena', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010113', 'Mariscal Castilla', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010114', 'Molinopampa', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010115', 'Montevideo', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010116', 'Olleros', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010117', 'Quinjalca', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010118', 'San Francisco de Daguas', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010119', 'San Isidro de Maino', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010120', 'Soloco', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010121', 'Sonche', '01', '0101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010201', 'Bagua', '01', '0102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010202', 'Aramango', '01', '0102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010203', 'Copallin', '01', '0102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010204', 'El Parco', '01', '0102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010205', 'Imaza', '01', '0102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010206', 'La Peca', '01', '0102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010301', 'Jumbilla', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010302', 'Chisquilla', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010303', 'Churuja', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010304', 'Corosha', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010305', 'Cuispes', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010306', 'Florida', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010307', 'Jazan', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010308', 'Recta', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010309', 'San Carlos', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010310', 'Shipasbamba', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010311', 'Valera', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010312', 'Yambrasbamba', '01', '0103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010401', 'Nieva', '01', '0104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010402', 'El Cenepa', '01', '0104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010403', 'Río Santiago', '01', '0104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010501', 'Lamud', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010502', 'Camporredondo', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010503', 'Cocabamba', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010504', 'Colcamar', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010505', 'Conila', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010506', 'Inguilpata', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010507', 'Longuita', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010508', 'Lonya Chico', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010509', 'Luya', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010510', 'Luya Viejo', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010511', 'María', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010512', 'Ocalli', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010513', 'Ocumal', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010514', 'Pisuquia', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010515', 'Providencia', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010516', 'San Cristóbal', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010517', 'San Francisco de Yeso', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010518', 'San Jerónimo', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010519', 'San Juan de Lopecancha', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010520', 'Santa Catalina', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010521', 'Santo Tomas', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010522', 'Tingo', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010523', 'Trita', '01', '0105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010601', 'San Nicolás', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010602', 'Chirimoto', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010603', 'Cochamal', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010604', 'Huambo', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010605', 'Limabamba', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010606', 'Longar', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010607', 'Mariscal Benavides', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010608', 'Milpuc', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010609', 'Omia', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010610', 'Santa Rosa', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010611', 'Totora', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010612', 'Vista Alegre', '01', '0106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010701', 'Bagua Grande', '01', '0107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010702', 'Cajaruro', '01', '0107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010703', 'Cumba', '01', '0107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010704', 'El Milagro', '01', '0107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010705', 'Jamalca', '01', '0107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010706', 'Lonya Grande', '01', '0107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('010707', 'Yamon', '01', '0107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020101', 'Huaraz', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020102', 'Cochabamba', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020103', 'Colcabamba', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020104', 'Huanchay', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020105', 'Independencia', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020106', 'Jangas', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020107', 'La Libertad', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020108', 'Olleros', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020109', 'Pampas Grande', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020110', 'Pariacoto', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020111', 'Pira', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020112', 'Tarica', '02', '0201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020201', 'Aija', '02', '0202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020202', 'Coris', '02', '0202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020203', 'Huacllan', '02', '0202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020204', 'La Merced', '02', '0202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020205', 'Succha', '02', '0202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020301', 'Llamellin', '02', '0203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020302', 'Aczo', '02', '0203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020303', 'Chaccho', '02', '0203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020304', 'Chingas', '02', '0203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020305', 'Mirgas', '02', '0203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020306', 'San Juan de Rontoy', '02', '0203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020401', 'Chacas', '02', '0204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020402', 'Acochaca', '02', '0204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020501', 'Chiquian', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020502', 'Abelardo Pardo Lezameta', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020503', 'Antonio Raymondi', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020504', 'Aquia', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020505', 'Cajacay', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020506', 'Canis', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020507', 'Colquioc', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020508', 'Huallanca', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020509', 'Huasta', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020510', 'Huayllacayan', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020511', 'La Primavera', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020512', 'Mangas', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020513', 'Pacllon', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020514', 'San Miguel de Corpanqui', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020515', 'Ticllos', '02', '0205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020601', 'Carhuaz', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020602', 'Acopampa', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020603', 'Amashca', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020604', 'Anta', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020605', 'Ataquero', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020606', 'Marcara', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020607', 'Pariahuanca', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020608', 'San Miguel de Aco', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020609', 'Shilla', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020610', 'Tinco', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020611', 'Yungar', '02', '0206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020701', 'San Luis', '02', '0207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020702', 'San Nicolás', '02', '0207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020703', 'Yauya', '02', '0207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020801', 'Casma', '02', '0208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020802', 'Buena Vista Alta', '02', '0208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020803', 'Comandante Noel', '02', '0208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020804', 'Yautan', '02', '0208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020901', 'Corongo', '02', '0209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020902', 'Aco', '02', '0209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020903', 'Bambas', '02', '0209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020904', 'Cusca', '02', '0209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020905', 'La Pampa', '02', '0209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020906', 'Yanac', '02', '0209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('020907', 'Yupan', '02', '0209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021001', 'Huari', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021002', 'Anra', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021003', 'Cajay', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021004', 'Chavin de Huantar', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021005', 'Huacachi', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021006', 'Huacchis', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021007', 'Huachis', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021008', 'Huantar', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021009', 'Masin', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021010', 'Paucas', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021011', 'Ponto', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021012', 'Rahuapampa', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021013', 'Rapayan', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021014', 'San Marcos', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021015', 'San Pedro de Chana', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021016', 'Uco', '02', '0210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021101', 'Huarmey', '02', '0211', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021102', 'Cochapeti', '02', '0211', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021103', 'Culebras', '02', '0211', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021104', 'Huayan', '02', '0211', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021105', 'Malvas', '02', '0211', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021201', 'Caraz', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021202', 'Huallanca', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021203', 'Huata', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021204', 'Huaylas', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021205', 'Mato', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021206', 'Pamparomas', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021207', 'Pueblo Libre', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021208', 'Santa Cruz', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021209', 'Santo Toribio', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021210', 'Yuracmarca', '02', '0212', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021301', 'Piscobamba', '02', '0213', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021302', 'Casca', '02', '0213', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021303', 'Eleazar Guzmán Barron', '02', '0213', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021304', 'Fidel Olivas Escudero', '02', '0213', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021305', 'Llama', '02', '0213', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021306', 'Llumpa', '02', '0213', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021307', 'Lucma', '02', '0213', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021308', 'Musga', '02', '0213', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021401', 'Ocros', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021402', 'Acas', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021403', 'Cajamarquilla', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021404', 'Carhuapampa', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021405', 'Cochas', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021406', 'Congas', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021407', 'Llipa', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021408', 'San Cristóbal de Rajan', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021409', 'San Pedro', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021410', 'Santiago de Chilcas', '02', '0214', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021501', 'Cabana', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021502', 'Bolognesi', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021503', 'Conchucos', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021504', 'Huacaschuque', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021505', 'Huandoval', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021506', 'Lacabamba', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021507', 'Llapo', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021508', 'Pallasca', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021509', 'Pampas', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021510', 'Santa Rosa', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021511', 'Tauca', '02', '0215', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021601', 'Pomabamba', '02', '0216', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021602', 'Huayllan', '02', '0216', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021603', 'Parobamba', '02', '0216', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021604', 'Quinuabamba', '02', '0216', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021701', 'Recuay', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021702', 'Catac', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021703', 'Cotaparaco', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021704', 'Huayllapampa', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021705', 'Llacllin', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021706', 'Marca', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021707', 'Pampas Chico', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021708', 'Pararin', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021709', 'Tapacocha', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021710', 'Ticapampa', '02', '0217', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021801', 'Chimbote', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021802', 'Cáceres del Perú', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021803', 'Coishco', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021804', 'Macate', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021805', 'Moro', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021806', 'Nepeña', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021807', 'Samanco', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021808', 'Santa', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021809', 'Nuevo Chimbote', '02', '0218', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021901', 'Sihuas', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021902', 'Acobamba', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021903', 'Alfonso Ugarte', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021904', 'Cashapampa', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021905', 'Chingalpo', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021906', 'Huayllabamba', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021907', 'Quiches', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021908', 'Ragash', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021909', 'San Juan', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('021910', 'Sicsibamba', '02', '0219', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('022001', 'Yungay', '02', '0220', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('022002', 'Cascapara', '02', '0220', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('022003', 'Mancos', '02', '0220', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('022004', 'Matacoto', '02', '0220', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('022005', 'Quillo', '02', '0220', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('022006', 'Ranrahirca', '02', '0220', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('022007', 'Shupluy', '02', '0220', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('022008', 'Yanama', '02', '0220', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030101', 'Abancay', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030102', 'Chacoche', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030103', 'Circa', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030104', 'Curahuasi', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030105', 'Huanipaca', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030106', 'Lambrama', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030107', 'Pichirhua', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030108', 'San Pedro de Cachora', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030109', 'Tamburco', '03', '0301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030201', 'Andahuaylas', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030202', 'Andarapa', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030203', 'Chiara', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030204', 'Huancarama', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030205', 'Huancaray', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030206', 'Huayana', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030207', 'Kishuara', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030208', 'Pacobamba', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030209', 'Pacucha', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030210', 'Pampachiri', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030211', 'Pomacocha', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030212', 'San Antonio de Cachi', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030213', 'San Jerónimo', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030214', 'San Miguel de Chaccrampa', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030215', 'Santa María de Chicmo', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030216', 'Talavera', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030217', 'Tumay Huaraca', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030218', 'Turpo', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030219', 'Kaquiabamba', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030220', 'José María Arguedas', '03', '0302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030301', 'Antabamba', '03', '0303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030302', 'El Oro', '03', '0303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030303', 'Huaquirca', '03', '0303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030304', 'Juan Espinoza Medrano', '03', '0303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030305', 'Oropesa', '03', '0303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030306', 'Pachaconas', '03', '0303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030307', 'Sabaino', '03', '0303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030401', 'Chalhuanca', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030402', 'Capaya', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030403', 'Caraybamba', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030404', 'Chapimarca', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030405', 'Colcabamba', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030406', 'Cotaruse', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030407', 'Ihuayllo', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030408', 'Justo Apu Sahuaraura', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030409', 'Lucre', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030410', 'Pocohuanca', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030411', 'San Juan de Chacña', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030412', 'Sañayca', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030413', 'Soraya', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030414', 'Tapairihua', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030415', 'Tintay', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030416', 'Toraya', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030417', 'Yanaca', '03', '0304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030501', 'Tambobamba', '03', '0305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030502', 'Cotabambas', '03', '0305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030503', 'Coyllurqui', '03', '0305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030504', 'Haquira', '03', '0305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030505', 'Mara', '03', '0305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030506', 'Challhuahuacho', '03', '0305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030601', 'Chincheros', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030602', 'Anco_Huallo', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030603', 'Cocharcas', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030604', 'Huaccana', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030605', 'Ocobamba', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030606', 'Ongoy', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030607', 'Uranmarca', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030608', 'Ranracancha', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030609', 'Rocchacc', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030610', 'El Porvenir', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030611', 'Los Chankas', '03', '0306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030701', 'Chuquibambilla', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030702', 'Curpahuasi', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030703', 'Gamarra', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030704', 'Huayllati', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030705', 'Mamara', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030706', 'Micaela Bastidas', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030707', 'Pataypampa', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030708', 'Progreso', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030709', 'San Antonio', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030710', 'Santa Rosa', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030711', 'Turpay', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030712', 'Vilcabamba', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030713', 'Virundo', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('030714', 'Curasco', '03', '0307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040101', 'Arequipa', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040102', 'Alto Selva Alegre', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040103', 'Cayma', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040104', 'Cerro Colorado', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040105', 'Characato', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040106', 'Chiguata', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040107', 'Jacobo Hunter', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040108', 'La Joya', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040109', 'Mariano Melgar', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040110', 'Miraflores', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040111', 'Mollebaya', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040112', 'Paucarpata', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040113', 'Pocsi', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040114', 'Polobaya', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040115', 'Quequeña', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040116', 'Sabandia', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040117', 'Sachaca', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040118', 'San Juan de Siguas', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040119', 'San Juan de Tarucani', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040120', 'Santa Isabel de Siguas', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040121', 'Santa Rita de Siguas', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040122', 'Socabaya', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040123', 'Tiabaya', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040124', 'Uchumayo', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040125', 'Vitor', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040126', 'Yanahuara', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040127', 'Yarabamba', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040128', 'Yura', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040129', 'José Luis Bustamante Y Rivero', '04', '0401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040201', 'Camaná', '04', '0402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040202', 'José María Quimper', '04', '0402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040203', 'Mariano Nicolás Valcárcel', '04', '0402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040204', 'Mariscal Cáceres', '04', '0402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040205', 'Nicolás de Pierola', '04', '0402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040206', 'Ocoña', '04', '0402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040207', 'Quilca', '04', '0402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040208', 'Samuel Pastor', '04', '0402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040301', 'Caravelí', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040302', 'Acarí', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040303', 'Atico', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040304', 'Atiquipa', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040305', 'Bella Unión', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040306', 'Cahuacho', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040307', 'Chala', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040308', 'Chaparra', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040309', 'Huanuhuanu', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040310', 'Jaqui', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040311', 'Lomas', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040312', 'Quicacha', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040313', 'Yauca', '04', '0403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040401', 'Aplao', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040402', 'Andagua', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040403', 'Ayo', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040404', 'Chachas', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040405', 'Chilcaymarca', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040406', 'Choco', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040407', 'Huancarqui', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040408', 'Machaguay', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040409', 'Orcopampa', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040410', 'Pampacolca', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040411', 'Tipan', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040412', 'Uñon', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040413', 'Uraca', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040414', 'Viraco', '04', '0404', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040501', 'Chivay', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040502', 'Achoma', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040503', 'Cabanaconde', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040504', 'Callalli', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040505', 'Caylloma', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040506', 'Coporaque', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040507', 'Huambo', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040508', 'Huanca', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040509', 'Ichupampa', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040510', 'Lari', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040511', 'Lluta', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040512', 'Maca', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040513', 'Madrigal', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040514', 'San Antonio de Chuca', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040515', 'Sibayo', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040516', 'Tapay', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040517', 'Tisco', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040518', 'Tuti', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040519', 'Yanque', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040520', 'Majes', '04', '0405', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040601', 'Chuquibamba', '04', '0406', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040602', 'Andaray', '04', '0406', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040603', 'Cayarani', '04', '0406', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040604', 'Chichas', '04', '0406', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040605', 'Iray', '04', '0406', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040606', 'Río Grande', '04', '0406', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040607', 'Salamanca', '04', '0406', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040608', 'Yanaquihua', '04', '0406', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040701', 'Mollendo', '04', '0407', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040702', 'Cocachacra', '04', '0407', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040703', 'Dean Valdivia', '04', '0407', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040704', 'Islay', '04', '0407', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040705', 'Mejia', '04', '0407', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040706', 'Punta de Bombón', '04', '0407', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040801', 'Cotahuasi', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040802', 'Alca', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040803', 'Charcana', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040804', 'Huaynacotas', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040805', 'Pampamarca', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040806', 'Puyca', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040807', 'Quechualla', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040808', 'Sayla', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040809', 'Tauria', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040810', 'Tomepampa', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('040811', 'Toro', '04', '0408', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050101', 'Ayacucho', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050102', 'Acocro', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050103', 'Acos Vinchos', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050104', 'Carmen Alto', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050105', 'Chiara', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050106', 'Ocros', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050107', 'Pacaycasa', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050108', 'Quinua', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050109', 'San José de Ticllas', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050110', 'San Juan Bautista', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050111', 'Santiago de Pischa', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050112', 'Socos', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050113', 'Tambillo', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050114', 'Vinchos', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050115', 'Jesús Nazareno', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050116', 'Andrés Avelino Cáceres Dorregaray', '05', '0501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050201', 'Cangallo', '05', '0502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050202', 'Chuschi', '05', '0502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050203', 'Los Morochucos', '05', '0502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050204', 'María Parado de Bellido', '05', '0502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050205', 'Paras', '05', '0502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050206', 'Totos', '05', '0502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050301', 'Sancos', '05', '0503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050302', 'Carapo', '05', '0503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050303', 'Sacsamarca', '05', '0503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050304', 'Santiago de Lucanamarca', '05', '0503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050401', 'Huanta', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050402', 'Ayahuanco', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050403', 'Huamanguilla', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050404', 'Iguain', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050405', 'Luricocha', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050406', 'Santillana', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050407', 'Sivia', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050408', 'Llochegua', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050409', 'Canayre', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050410', 'Uchuraccay', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050411', 'Pucacolpa', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050412', 'Chaca', '05', '0504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050501', 'San Miguel', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050502', 'Anco', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050503', 'Ayna', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050504', 'Chilcas', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050505', 'Chungui', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050506', 'Luis Carranza', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050507', 'Santa Rosa', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050508', 'Tambo', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050509', 'Samugari', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050510', 'Anchihuay', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050511', 'Oronccoy', '05', '0505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050601', 'Puquio', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050602', 'Aucara', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050603', 'Cabana', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050604', 'Carmen Salcedo', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050605', 'Chaviña', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050606', 'Chipao', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050607', 'Huac-Huas', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050608', 'Laramate', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050609', 'Leoncio Prado', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050610', 'Llauta', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050611', 'Lucanas', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050612', 'Ocaña', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050613', 'Otoca', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050614', 'Saisa', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050615', 'San Cristóbal', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050616', 'San Juan', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050617', 'San Pedro', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050618', 'San Pedro de Palco', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050619', 'Sancos', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050620', 'Santa Ana de Huaycahuacho', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050621', 'Santa Lucia', '05', '0506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050701', 'Coracora', '05', '0507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050702', 'Chumpi', '05', '0507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050703', 'Coronel Castañeda', '05', '0507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050704', 'Pacapausa', '05', '0507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050705', 'Pullo', '05', '0507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050706', 'Puyusca', '05', '0507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050707', 'San Francisco de Ravacayco', '05', '0507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050708', 'Upahuacho', '05', '0507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050801', 'Pausa', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050802', 'Colta', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050803', 'Corculla', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050804', 'Lampa', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050805', 'Marcabamba', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050806', 'Oyolo', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050807', 'Pararca', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050808', 'San Javier de Alpabamba', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050809', 'San José de Ushua', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050810', 'Sara Sara', '05', '0508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050901', 'Querobamba', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050902', 'Belén', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050903', 'Chalcos', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050904', 'Chilcayoc', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050905', 'Huacaña', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050906', 'Morcolla', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050907', 'Paico', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050908', 'San Pedro de Larcay', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050909', 'San Salvador de Quije', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050910', 'Santiago de Paucaray', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('050911', 'Soras', '05', '0509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051001', 'Huancapi', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051002', 'Alcamenca', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051003', 'Apongo', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051004', 'Asquipata', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051005', 'Canaria', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051006', 'Cayara', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051007', 'Colca', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051008', 'Huamanquiquia', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051009', 'Huancaraylla', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051010', 'Hualla', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051011', 'Sarhua', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051012', 'Vilcanchos', '05', '0510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051101', 'Vilcas Huaman', '05', '0511', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051102', 'Accomarca', '05', '0511', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051103', 'Carhuanca', '05', '0511', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051104', 'Concepción', '05', '0511', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051105', 'Huambalpa', '05', '0511', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051106', 'Independencia', '05', '0511', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051107', 'Saurama', '05', '0511', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('051108', 'Vischongo', '05', '0511', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060101', 'Cajamarca', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060102', 'Asunción', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060103', 'Chetilla', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060104', 'Cospan', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060105', 'Encañada', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060106', 'Jesús', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060107', 'Llacanora', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060108', 'Los Baños del Inca', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060109', 'Magdalena', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060110', 'Matara', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060111', 'Namora', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060112', 'San Juan', '06', '0601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060201', 'Cajabamba', '06', '0602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060202', 'Cachachi', '06', '0602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060203', 'Condebamba', '06', '0602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060204', 'Sitacocha', '06', '0602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060301', 'Celendín', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060302', 'Chumuch', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060303', 'Cortegana', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060304', 'Huasmin', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060305', 'Jorge Chávez', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060306', 'José Gálvez', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060307', 'Miguel Iglesias', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060308', 'Oxamarca', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060309', 'Sorochuco', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060310', 'Sucre', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060311', 'Utco', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060312', 'La Libertad de Pallan', '06', '0603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060401', 'Chota', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060402', 'Anguia', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060403', 'Chadin', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060404', 'Chiguirip', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060405', 'Chimban', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060406', 'Choropampa', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060407', 'Cochabamba', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060408', 'Conchan', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060409', 'Huambos', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060410', 'Lajas', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060411', 'Llama', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060412', 'Miracosta', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060413', 'Paccha', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060414', 'Pion', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060415', 'Querocoto', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060416', 'San Juan de Licupis', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060417', 'Tacabamba', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060418', 'Tocmoche', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060419', 'Chalamarca', '06', '0604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060501', 'Contumaza', '06', '0605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060502', 'Chilete', '06', '0605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060503', 'Cupisnique', '06', '0605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060504', 'Guzmango', '06', '0605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060505', 'San Benito', '06', '0605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060506', 'Santa Cruz de Toledo', '06', '0605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060507', 'Tantarica', '06', '0605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060508', 'Yonan', '06', '0605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060601', 'Cutervo', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060602', 'Callayuc', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060603', 'Choros', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060604', 'Cujillo', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060605', 'La Ramada', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060606', 'Pimpingos', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060607', 'Querocotillo', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060608', 'San Andrés de Cutervo', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060609', 'San Juan de Cutervo', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060610', 'San Luis de Lucma', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060611', 'Santa Cruz', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060612', 'Santo Domingo de la Capilla', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060613', 'Santo Tomas', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060614', 'Socota', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060615', 'Toribio Casanova', '06', '0606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060701', 'Bambamarca', '06', '0607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060702', 'Chugur', '06', '0607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060703', 'Hualgayoc', '06', '0607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060801', 'Jaén', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060802', 'Bellavista', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060803', 'Chontali', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060804', 'Colasay', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060805', 'Huabal', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060806', 'Las Pirias', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060807', 'Pomahuaca', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060808', 'Pucara', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060809', 'Sallique', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060810', 'San Felipe', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060811', 'San José del Alto', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060812', 'Santa Rosa', '06', '0608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060901', 'San Ignacio', '06', '0609', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060902', 'Chirinos', '06', '0609', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060903', 'Huarango', '06', '0609', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060904', 'La Coipa', '06', '0609', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060905', 'Namballe', '06', '0609', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060906', 'San José de Lourdes', '06', '0609', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('060907', 'Tabaconas', '06', '0609', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061001', 'Pedro Gálvez', '06', '0610', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061002', 'Chancay', '06', '0610', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061003', 'Eduardo Villanueva', '06', '0610', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061004', 'Gregorio Pita', '06', '0610', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061005', 'Ichocan', '06', '0610', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061006', 'José Manuel Quiroz', '06', '0610', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061007', 'José Sabogal', '06', '0610', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061101', 'San Miguel', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061102', 'Bolívar', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061103', 'Calquis', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061104', 'Catilluc', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061105', 'El Prado', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061106', 'La Florida', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061107', 'Llapa', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061108', 'Nanchoc', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061109', 'Niepos', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061110', 'San Gregorio', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061111', 'San Silvestre de Cochan', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061112', 'Tongod', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061113', 'Unión Agua Blanca', '06', '0611', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061201', 'San Pablo', '06', '0612', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061202', 'San Bernardino', '06', '0612', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061203', 'San Luis', '06', '0612', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061204', 'Tumbaden', '06', '0612', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061301', 'Santa Cruz', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061302', 'Andabamba', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061303', 'Catache', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061304', 'Chancaybaños', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061305', 'La Esperanza', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061306', 'Ninabamba', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061307', 'Pulan', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061308', 'Saucepampa', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061309', 'Sexi', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061310', 'Uticyacu', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('061311', 'Yauyucan', '06', '0613', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('070101', 'Callao', '07', '0701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('070102', 'Bellavista', '07', '0701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('070103', 'Carmen de la Legua Reynoso', '07', '0701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('070104', 'La Perla', '07', '0701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('070105', 'La Punta', '07', '0701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('070106', 'Ventanilla', '07', '0701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('070107', 'Mi Perú', '07', '0701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080101', 'Cusco', '08', '0801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080102', 'Ccorca', '08', '0801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080103', 'Poroy', '08', '0801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080104', 'San Jerónimo', '08', '0801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080105', 'San Sebastian', '08', '0801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080106', 'Santiago', '08', '0801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080107', 'Saylla', '08', '0801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080108', 'Wanchaq', '08', '0801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080201', 'Acomayo', '08', '0802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080202', 'Acopia', '08', '0802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080203', 'Acos', '08', '0802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080204', 'Mosoc Llacta', '08', '0802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080205', 'Pomacanchi', '08', '0802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080206', 'Rondocan', '08', '0802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080207', 'Sangarara', '08', '0802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080301', 'Anta', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080302', 'Ancahuasi', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080303', 'Cachimayo', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080304', 'Chinchaypujio', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080305', 'Huarocondo', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080306', 'Limatambo', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080307', 'Mollepata', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080308', 'Pucyura', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080309', 'Zurite', '08', '0803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080401', 'Calca', '08', '0804', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080402', 'Coya', '08', '0804', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080403', 'Lamay', '08', '0804', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080404', 'Lares', '08', '0804', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080405', 'Pisac', '08', '0804', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080406', 'San Salvador', '08', '0804', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080407', 'Taray', '08', '0804', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080408', 'Yanatile', '08', '0804', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080501', 'Yanaoca', '08', '0805', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080502', 'Checca', '08', '0805', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080503', 'Kunturkanki', '08', '0805', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080504', 'Langui', '08', '0805', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080505', 'Layo', '08', '0805', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080506', 'Pampamarca', '08', '0805', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080507', 'Quehue', '08', '0805', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080508', 'Tupac Amaru', '08', '0805', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080601', 'Sicuani', '08', '0806', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080602', 'Checacupe', '08', '0806', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080603', 'Combapata', '08', '0806', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080604', 'Marangani', '08', '0806', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080605', 'Pitumarca', '08', '0806', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080606', 'San Pablo', '08', '0806', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080607', 'San Pedro', '08', '0806', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080608', 'Tinta', '08', '0806', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080701', 'Santo Tomas', '08', '0807', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080702', 'Capacmarca', '08', '0807', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080703', 'Chamaca', '08', '0807', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080704', 'Colquemarca', '08', '0807', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080705', 'Livitaca', '08', '0807', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080706', 'Llusco', '08', '0807', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080707', 'Quiñota', '08', '0807', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080708', 'Velille', '08', '0807', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080801', 'Espinar', '08', '0808', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080802', 'Condoroma', '08', '0808', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080803', 'Coporaque', '08', '0808', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080804', 'Ocoruro', '08', '0808', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080805', 'Pallpata', '08', '0808', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080806', 'Pichigua', '08', '0808', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080807', 'Suyckutambo', '08', '0808', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080808', 'Alto Pichigua', '08', '0808', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080901', 'Santa Ana', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080902', 'Echarate', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080903', 'Huayopata', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080904', 'Maranura', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080905', 'Ocobamba', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080906', 'Quellouno', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080907', 'Kimbiri', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080908', 'Santa Teresa', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080909', 'Vilcabamba', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080910', 'Pichari', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080911', 'Inkawasi', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080912', 'Villa Virgen', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080913', 'Villa Kintiarina', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('080914', 'Megantoni', '08', '0809', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081001', 'Paruro', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081002', 'Accha', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081003', 'Ccapi', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081004', 'Colcha', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081005', 'Huanoquite', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081006', 'Omachaç', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081007', 'Paccaritambo', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081008', 'Pillpinto', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081009', 'Yaurisque', '08', '0810', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081101', 'Paucartambo', '08', '0811', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081102', 'Caicay', '08', '0811', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081103', 'Challabamba', '08', '0811', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081104', 'Colquepata', '08', '0811', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081105', 'Huancarani', '08', '0811', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081106', 'Kosñipata', '08', '0811', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081201', 'Urcos', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081202', 'Andahuaylillas', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081203', 'Camanti', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081204', 'Ccarhuayo', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081205', 'Ccatca', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081206', 'Cusipata', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081207', 'Huaro', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081208', 'Lucre', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081209', 'Marcapata', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081210', 'Ocongate', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081211', 'Oropesa', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081212', 'Quiquijana', '08', '0812', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081301', 'Urubamba', '08', '0813', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081302', 'Chinchero', '08', '0813', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081303', 'Huayllabamba', '08', '0813', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081304', 'Machupicchu', '08', '0813', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081305', 'Maras', '08', '0813', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081306', 'Ollantaytambo', '08', '0813', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('081307', 'Yucay', '08', '0813', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090101', 'Huancavelica', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090102', 'Acobambilla', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090103', 'Acoria', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090104', 'Conayca', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090105', 'Cuenca', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090106', 'Huachocolpa', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090107', 'Huayllahuara', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090108', 'Izcuchaca', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090109', 'Laria', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090110', 'Manta', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090111', 'Mariscal Cáceres', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090112', 'Moya', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090113', 'Nuevo Occoro', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090114', 'Palca', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090115', 'Pilchaca', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090116', 'Vilca', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090117', 'Yauli', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090118', 'Ascensión', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090119', 'Huando', '09', '0901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090201', 'Acobamba', '09', '0902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090202', 'Andabamba', '09', '0902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090203', 'Anta', '09', '0902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090204', 'Caja', '09', '0902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090205', 'Marcas', '09', '0902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090206', 'Paucara', '09', '0902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090207', 'Pomacocha', '09', '0902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090208', 'Rosario', '09', '0902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090301', 'Lircay', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090302', 'Anchonga', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090303', 'Callanmarca', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090304', 'Ccochaccasa', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090305', 'Chincho', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090306', 'Congalla', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090307', 'Huanca-Huanca', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090308', 'Huayllay Grande', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090309', 'Julcamarca', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090310', 'San Antonio de Antaparco', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090311', 'Santo Tomas de Pata', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090312', 'Secclla', '09', '0903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090401', 'Castrovirreyna', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090402', 'Arma', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090403', 'Aurahua', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090404', 'Capillas', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090405', 'Chupamarca', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090406', 'Cocas', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090407', 'Huachos', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090408', 'Huamatambo', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090409', 'Mollepampa', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090410', 'San Juan', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090411', 'Santa Ana', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090412', 'Tantara', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090413', 'Ticrapo', '09', '0904', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090501', 'Churcampa', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090502', 'Anco', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090503', 'Chinchihuasi', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090504', 'El Carmen', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090505', 'La Merced', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090506', 'Locroja', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090507', 'Paucarbamba', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090508', 'San Miguel de Mayocc', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090509', 'San Pedro de Coris', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090510', 'Pachamarca', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090511', 'Cosme', '09', '0905', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090601', 'Huaytara', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090602', 'Ayavi', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090603', 'Córdova', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090604', 'Huayacundo Arma', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090605', 'Laramarca', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090606', 'Ocoyo', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090607', 'Pilpichaca', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090608', 'Querco', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090609', 'Quito-Arma', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090610', 'San Antonio de Cusicancha', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090611', 'San Francisco de Sangayaico', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090612', 'San Isidro', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090613', 'Santiago de Chocorvos', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090614', 'Santiago de Quirahuara', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090615', 'Santo Domingo de Capillas', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090616', 'Tambo', '09', '0906', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090701', 'Pampas', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090702', 'Acostambo', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090703', 'Acraquia', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090704', 'Ahuaycha', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090705', 'Colcabamba', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090706', 'Daniel Hernández', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090707', 'Huachocolpa', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090709', 'Huaribamba', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090710', 'Ñahuimpuquio', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090711', 'Pazos', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090713', 'Quishuar', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090714', 'Salcabamba', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090715', 'Salcahuasi', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090716', 'San Marcos de Rocchac', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090717', 'Surcubamba', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090718', 'Tintay Puncu', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090719', 'Quichuas', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090720', 'Andaymarca', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090721', 'Roble', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090722', 'Pichos', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('090723', 'Santiago de Tucuma', '09', '0907', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100101', 'Huanuco', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100102', 'Amarilis', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100103', 'Chinchao', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100104', 'Churubamba', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100105', 'Margos', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100106', 'Quisqui (Kichki)', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100107', 'San Francisco de Cayran', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100108', 'San Pedro de Chaulan', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100109', 'Santa María del Valle', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100110', 'Yarumayo', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100111', 'Pillco Marca', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100112', 'Yacus', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100113', 'San Pablo de Pillao', '10', '1001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100201', 'Ambo', '10', '1002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100202', 'Cayna', '10', '1002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100203', 'Colpas', '10', '1002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100204', 'Conchamarca', '10', '1002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100205', 'Huacar', '10', '1002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100206', 'San Francisco', '10', '1002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100207', 'San Rafael', '10', '1002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100208', 'Tomay Kichwa', '10', '1002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100301', 'La Unión', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100307', 'Chuquis', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100311', 'Marías', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100313', 'Pachas', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100316', 'Quivilla', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100317', 'Ripan', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100321', 'Shunqui', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100322', 'Sillapata', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100323', 'Yanas', '10', '1003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100401', 'Huacaybamba', '10', '1004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100402', 'Canchabamba', '10', '1004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100403', 'Cochabamba', '10', '1004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100404', 'Pinra', '10', '1004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100501', 'Llata', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100502', 'Arancay', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100503', 'Chavín de Pariarca', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100504', 'Jacas Grande', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100505', 'Jircan', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100506', 'Miraflores', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100507', 'Monzón', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100508', 'Punchao', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100509', 'Puños', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100510', 'Singa', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100511', 'Tantamayo', '10', '1005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100601', 'Rupa-Rupa', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100602', 'Daniel Alomía Robles', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100603', 'Hermílio Valdizan', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100604', 'José Crespo y Castillo', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100605', 'Luyando', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100606', 'Mariano Damaso Beraun', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100607', 'Pucayacu', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100608', 'Castillo Grande', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100609', 'Pueblo Nuevo', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100610', 'Santo Domingo de Anda', '10', '1006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100701', 'Huacrachuco', '10', '1007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100702', 'Cholon', '10', '1007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100703', 'San Buenaventura', '10', '1007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100704', 'La Morada', '10', '1007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100705', 'Santa Rosa de Alto Yanajanca', '10', '1007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100801', 'Panao', '10', '1008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100802', 'Chaglla', '10', '1008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100803', 'Molino', '10', '1008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100804', 'Umari', '10', '1008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100901', 'Puerto Inca', '10', '1009', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100902', 'Codo del Pozuzo', '10', '1009', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100903', 'Honoria', '10', '1009', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100904', 'Tournavista', '10', '1009', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('100905', 'Yuyapichis', '10', '1009', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101001', 'Jesús', '10', '1010', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101002', 'Baños', '10', '1010', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101003', 'Jivia', '10', '1010', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101004', 'Queropalca', '10', '1010', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101005', 'Rondos', '10', '1010', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101006', 'San Francisco de Asís', '10', '1010', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101007', 'San Miguel de Cauri', '10', '1010', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101101', 'Chavinillo', '10', '1011', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101102', 'Cahuac', '10', '1011', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101103', 'Chacabamba', '10', '1011', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101104', 'Aparicio Pomares', '10', '1011', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101105', 'Jacas Chico', '10', '1011', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101106', 'Obas', '10', '1011', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101107', 'Pampamarca', '10', '1011', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('101108', 'Choras', '10', '1011', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110101', 'Ica', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110102', 'La Tinguiña', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110103', 'Los Aquijes', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110104', 'Ocucaje', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110105', 'Pachacutec', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110106', 'Parcona', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110107', 'Pueblo Nuevo', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110108', 'Salas', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110109', 'San José de Los Molinos', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110110', 'San Juan Bautista', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110111', 'Santiago', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110112', 'Subtanjalla', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110113', 'Tate', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110114', 'Yauca del Rosario', '11', '1101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110201', 'Chincha Alta', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110202', 'Alto Laran', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110203', 'Chavin', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110204', 'Chincha Baja', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110205', 'El Carmen', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110206', 'Grocio Prado', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110207', 'Pueblo Nuevo', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110208', 'San Juan de Yanac', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110209', 'San Pedro de Huacarpana', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110210', 'Sunampe', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110211', 'Tambo de Mora', '11', '1102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110301', 'Nasca', '11', '1103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110302', 'Changuillo', '11', '1103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110303', 'El Ingenio', '11', '1103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110304', 'Marcona', '11', '1103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110305', 'Vista Alegre', '11', '1103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110401', 'Palpa', '11', '1104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110402', 'Llipata', '11', '1104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110403', 'Río Grande', '11', '1104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110404', 'Santa Cruz', '11', '1104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110405', 'Tibillo', '11', '1104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110501', 'Pisco', '11', '1105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110502', 'Huancano', '11', '1105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110503', 'Humay', '11', '1105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110504', 'Independencia', '11', '1105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110505', 'Paracas', '11', '1105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110506', 'San Andrés', '11', '1105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110507', 'San Clemente', '11', '1105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('110508', 'Tupac Amaru Inca', '11', '1105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120101', 'Huancayo', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120104', 'Carhuacallanga', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120105', 'Chacapampa', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120106', 'Chicche', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120107', 'Chilca', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120108', 'Chongos Alto', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120111', 'Chupuro', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120112', 'Colca', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120113', 'Cullhuas', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120114', 'El Tambo', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120116', 'Huacrapuquio', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120117', 'Hualhuas', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120119', 'Huancan', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120120', 'Huasicancha', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120121', 'Huayucachi', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120122', 'Ingenio', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120124', 'Pariahuanca', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120125', 'Pilcomayo', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120126', 'Pucara', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120127', 'Quichuay', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120128', 'Quilcas', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120129', 'San Agustín', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120130', 'San Jerónimo de Tunan', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120132', 'Saño', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120133', 'Sapallanga', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120134', 'Sicaya', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120135', 'Santo Domingo de Acobamba', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120136', 'Viques', '12', '1201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120201', 'Concepción', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120202', 'Aco', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120203', 'Andamarca', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120204', 'Chambara', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120205', 'Cochas', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120206', 'Comas', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120207', 'Heroínas Toledo', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120208', 'Manzanares', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120209', 'Mariscal Castilla', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120210', 'Matahuasi', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120211', 'Mito', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120212', 'Nueve de Julio', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120213', 'Orcotuna', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120214', 'San José de Quero', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120215', 'Santa Rosa de Ocopa', '12', '1202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120301', 'Chanchamayo', '12', '1203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120302', 'Perene', '12', '1203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120303', 'Pichanaqui', '12', '1203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120304', 'San Luis de Shuaro', '12', '1203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120305', 'San Ramón', '12', '1203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120306', 'Vitoc', '12', '1203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120401', 'Jauja', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120402', 'Acolla', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120403', 'Apata', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120404', 'Ataura', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120405', 'Canchayllo', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120406', 'Curicaca', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120407', 'El Mantaro', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120408', 'Huamali', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120409', 'Huaripampa', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120410', 'Huertas', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120411', 'Janjaillo', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120412', 'Julcán', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120413', 'Leonor Ordóñez', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120414', 'Llocllapampa', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120415', 'Marco', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120416', 'Masma', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120417', 'Masma Chicche', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120418', 'Molinos', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120419', 'Monobamba', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120420', 'Muqui', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120421', 'Muquiyauyo', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120422', 'Paca', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120423', 'Paccha', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120424', 'Pancan', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120425', 'Parco', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120426', 'Pomacancha', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120427', 'Ricran', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120428', 'San Lorenzo', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120429', 'San Pedro de Chunan', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120430', 'Sausa', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120431', 'Sincos', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120432', 'Tunan Marca', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120433', 'Yauli', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120434', 'Yauyos', '12', '1204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120501', 'Junin', '12', '1205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120502', 'Carhuamayo', '12', '1205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120503', 'Ondores', '12', '1205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120504', 'Ulcumayo', '12', '1205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120601', 'Satipo', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120602', 'Coviriali', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120603', 'Llaylla', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120604', 'Mazamari', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120605', 'Pampa Hermosa', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120606', 'Pangoa', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120607', 'Río Negro', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120608', 'Río Tambo', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120609', 'Vizcatan del Ene', '12', '1206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120701', 'Tarma', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120702', 'Acobamba', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120703', 'Huaricolca', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120704', 'Huasahuasi', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120705', 'La Unión', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120706', 'Palca', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120707', 'Palcamayo', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120708', 'San Pedro de Cajas', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120709', 'Tapo', '12', '1207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120801', 'La Oroya', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120802', 'Chacapalpa', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120803', 'Huay-Huay', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120804', 'Marcapomacocha', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120805', 'Morococha', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120806', 'Paccha', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120807', 'Santa Bárbara de Carhuacayan', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120808', 'Santa Rosa de Sacco', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120809', 'Suitucancha', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120810', 'Yauli', '12', '1208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120901', 'Chupaca', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120902', 'Ahuac', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120903', 'Chongos Bajo', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120904', 'Huachac', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120905', 'Huamancaca Chico', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120906', 'San Juan de Iscos', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120907', 'San Juan de Jarpa', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120908', 'Tres de Diciembre', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('120909', 'Yanacancha', '12', '1209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130101', 'Trujillo', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130102', 'El Porvenir', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130103', 'Florencia de Mora', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130104', 'Huanchaco', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130105', 'La Esperanza', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130106', 'Laredo', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130107', 'Moche', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130108', 'Poroto', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130109', 'Salaverry', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130110', 'Simbal', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130111', 'Victor Larco Herrera', '13', '1301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130201', 'Ascope', '13', '1302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130202', 'Chicama', '13', '1302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130203', 'Chocope', '13', '1302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130204', 'Magdalena de Cao', '13', '1302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130205', 'Paijan', '13', '1302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130206', 'Rázuri', '13', '1302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130207', 'Santiago de Cao', '13', '1302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130208', 'Casa Grande', '13', '1302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130301', 'Bolívar', '13', '1303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130302', 'Bambamarca', '13', '1303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130303', 'Condormarca', '13', '1303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130304', 'Longotea', '13', '1303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130305', 'Uchumarca', '13', '1303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130306', 'Ucuncha', '13', '1303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130401', 'Chepen', '13', '1304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130402', 'Pacanga', '13', '1304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130403', 'Pueblo Nuevo', '13', '1304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130501', 'Julcan', '13', '1305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130502', 'Calamarca', '13', '1305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130503', 'Carabamba', '13', '1305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130504', 'Huaso', '13', '1305', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130601', 'Otuzco', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130602', 'Agallpampa', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130604', 'Charat', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130605', 'Huaranchal', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130606', 'La Cuesta', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130608', 'Mache', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130610', 'Paranday', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130611', 'Salpo', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130613', 'Sinsicap', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130614', 'Usquil', '13', '1306', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130701', 'San Pedro de Lloc', '13', '1307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130702', 'Guadalupe', '13', '1307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130703', 'Jequetepeque', '13', '1307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130704', 'Pacasmayo', '13', '1307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130705', 'San José', '13', '1307', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130801', 'Tayabamba', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130802', 'Buldibuyo', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130803', 'Chillia', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130804', 'Huancaspata', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130805', 'Huaylillas', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130806', 'Huayo', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130807', 'Ongon', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130808', 'Parcoy', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130809', 'Pataz', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130810', 'Pias', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130811', 'Santiago de Challas', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130812', 'Taurija', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130813', 'Urpay', '13', '1308', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130901', 'Huamachuco', '13', '1309', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130902', 'Chugay', '13', '1309', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130903', 'Cochorco', '13', '1309', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130904', 'Curgos', '13', '1309', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130905', 'Marcabal', '13', '1309', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130906', 'Sanagoran', '13', '1309', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130907', 'Sarin', '13', '1309', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('130908', 'Sartimbamba', '13', '1309', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131001', 'Santiago de Chuco', '13', '1310', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131002', 'Angasmarca', '13', '1310', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131003', 'Cachicadan', '13', '1310', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131004', 'Mollebamba', '13', '1310', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131005', 'Mollepata', '13', '1310', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131006', 'Quiruvilca', '13', '1310', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131007', 'Santa Cruz de Chuca', '13', '1310', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131008', 'Sitabamba', '13', '1310', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131101', 'Cascas', '13', '1311', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131102', 'Lucma', '13', '1311', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131103', 'Marmot', '13', '1311', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131104', 'Sayapullo', '13', '1311', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131201', 'Viru', '13', '1312', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131202', 'Chao', '13', '1312', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('131203', 'Guadalupito', '13', '1312', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140101', 'Chiclayo', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140102', 'Chongoyape', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140103', 'Eten', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140104', 'Eten Puerto', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140105', 'José Leonardo Ortiz', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140106', 'La Victoria', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140107', 'Lagunas', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140108', 'Monsefu', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140109', 'Nueva Arica', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140110', 'Oyotun', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140111', 'Picsi', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140112', 'Pimentel', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140113', 'Reque', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140114', 'Santa Rosa', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140115', 'Saña', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140116', 'Cayalti', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140117', 'Patapo', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140118', 'Pomalca', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140119', 'Pucala', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140120', 'Tuman', '14', '1401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140201', 'Ferreñafe', '14', '1402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140202', 'Cañaris', '14', '1402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140203', 'Incahuasi', '14', '1402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140204', 'Manuel Antonio Mesones Muro', '14', '1402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140205', 'Pitipo', '14', '1402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140206', 'Pueblo Nuevo', '14', '1402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140301', 'Lambayeque', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140302', 'Chochope', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140303', 'Illimo', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140304', 'Jayanca', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140305', 'Mochumi', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140306', 'Morrope', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140307', 'Motupe', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140308', 'Olmos', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140309', 'Pacora', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140310', 'Salas', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140311', 'San José', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('140312', 'Tucume', '14', '1403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150101', 'Lima', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150102', 'Ancón', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150103', 'Ate', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150104', 'Barranco', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150105', 'Breña', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150106', 'Carabayllo', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150107', 'Chaclacayo', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150108', 'Chorrillos', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150109', 'Cieneguilla', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150110', 'Comas', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150111', 'El Agustino', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150112', 'Independencia', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150113', 'Jesús María', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150114', 'La Molina', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150115', 'La Victoria', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150116', 'Lince', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150117', 'Los Olivos', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150118', 'Lurigancho', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150119', 'Lurin', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150120', 'Magdalena del Mar', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150121', 'Pueblo Libre', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150122', 'Miraflores', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150123', 'Pachacamac', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150124', 'Pucusana', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150125', 'Puente Piedra', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150126', 'Punta Hermosa', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150127', 'Punta Negra', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150128', 'Rímac', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150129', 'San Bartolo', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150130', 'San Borja', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150131', 'San Isidro', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150132', 'San Juan de Lurigancho', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150133', 'San Juan de Miraflores', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150134', 'San Luis', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150135', 'San Martín de Porres', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150136', 'San Miguel', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150137', 'Santa Anita', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150138', 'Santa María del Mar', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150139', 'Santa Rosa', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150140', 'Santiago de Surco', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150141', 'Surquillo', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150142', 'Villa El Salvador', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150143', 'Villa María del Triunfo', '15', '1501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150201', 'Barranca', '15', '1502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150202', 'Paramonga', '15', '1502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150203', 'Pativilca', '15', '1502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150204', 'Supe', '15', '1502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150205', 'Supe Puerto', '15', '1502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150301', 'Cajatambo', '15', '1503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150302', 'Copa', '15', '1503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150303', 'Gorgor', '15', '1503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150304', 'Huancapon', '15', '1503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150305', 'Manas', '15', '1503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150401', 'Canta', '15', '1504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150402', 'Arahuay', '15', '1504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150403', 'Huamantanga', '15', '1504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150404', 'Huaros', '15', '1504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150405', 'Lachaqui', '15', '1504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150406', 'San Buenaventura', '15', '1504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150407', 'Santa Rosa de Quives', '15', '1504', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150501', 'San Vicente de Cañete', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150502', 'Asia', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150503', 'Calango', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150504', 'Cerro Azul', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150505', 'Chilca', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150506', 'Coayllo', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150507', 'Imperial', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150508', 'Lunahuana', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150509', 'Mala', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150510', 'Nuevo Imperial', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150511', 'Pacaran', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150512', 'Quilmana', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150513', 'San Antonio', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150514', 'San Luis', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150515', 'Santa Cruz de Flores', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150516', 'Zúñiga', '15', '1505', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150601', 'Huaral', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150602', 'Atavillos Alto', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150603', 'Atavillos Bajo', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150604', 'Aucallama', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150605', 'Chancay', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150606', 'Ihuari', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150607', 'Lampian', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150608', 'Pacaraos', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150609', 'San Miguel de Acos', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150610', 'Santa Cruz de Andamarca', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150611', 'Sumbilca', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150612', 'Veintisiete de Noviembre', '15', '1506', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150701', 'Matucana', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150702', 'Antioquia', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150703', 'Callahuanca', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150704', 'Carampoma', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150705', 'Chicla', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150706', 'Cuenca', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150707', 'Huachupampa', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150708', 'Huanza', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150709', 'Huarochiri', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150710', 'Lahuaytambo', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150711', 'Langa', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150712', 'Laraos', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150713', 'Mariatana', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150714', 'Ricardo Palma', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150715', 'San Andrés de Tupicocha', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150716', 'San Antonio', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150717', 'San Bartolomé', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150718', 'San Damian', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150719', 'San Juan de Iris', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150720', 'San Juan de Tantaranche', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150721', 'San Lorenzo de Quinti', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150722', 'San Mateo', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150723', 'San Mateo de Otao', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150724', 'San Pedro de Casta', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150725', 'San Pedro de Huancayre', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150726', 'Sangallaya', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150727', 'Santa Cruz de Cocachacra', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150728', 'Santa Eulalia', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150729', 'Santiago de Anchucaya', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150730', 'Santiago de Tuna', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150731', 'Santo Domingo de Los Olleros', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150732', 'Surco', '15', '1507', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150801', 'Huacho', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150802', 'Ambar', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150803', 'Caleta de Carquin', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150804', 'Checras', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150805', 'Hualmay', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150806', 'Huaura', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150807', 'Leoncio Prado', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150808', 'Paccho', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150809', 'Santa Leonor', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150810', 'Santa María', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150811', 'Sayan', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150812', 'Vegueta', '15', '1508', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150901', 'Oyon', '15', '1509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150902', 'Andajes', '15', '1509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150903', 'Caujul', '15', '1509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150904', 'Cochamarca', '15', '1509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150905', 'Navan', '15', '1509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('150906', 'Pachangara', '15', '1509', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151001', 'Yauyos', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151002', 'Alis', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151003', 'Allauca', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151004', 'Ayaviri', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151005', 'Azángaro', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151006', 'Cacra', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151007', 'Carania', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151008', 'Catahuasi', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151009', 'Chocos', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151010', 'Cochas', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151011', 'Colonia', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151012', 'Hongos', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151013', 'Huampara', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151014', 'Huancaya', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151015', 'Huangascar', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151016', 'Huantan', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151017', 'Huañec', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151018', 'Laraos', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151019', 'Lincha', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151020', 'Madean', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151021', 'Miraflores', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151022', 'Omas', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151023', 'Putinza', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151024', 'Quinches', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151025', 'Quinocay', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151026', 'San Joaquín', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151027', 'San Pedro de Pilas', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151028', 'Tanta', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151029', 'Tauripampa', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151030', 'Tomas', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151031', 'Tupe', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151032', 'Viñac', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('151033', 'Vitis', '15', '1510', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160101', 'Iquitos', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160102', 'Alto Nanay', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160103', 'Fernando Lores', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160104', 'Indiana', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160105', 'Las Amazonas', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160106', 'Mazan', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160107', 'Napo', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160108', 'Punchana', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160110', 'Torres Causana', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160112', 'Belén', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160113', 'San Juan Bautista', '16', '1601', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160201', 'Yurimaguas', '16', '1602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160202', 'Balsapuerto', '16', '1602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160205', 'Jeberos', '16', '1602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160206', 'Lagunas', '16', '1602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160210', 'Santa Cruz', '16', '1602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160211', 'Teniente Cesar López Rojas', '16', '1602', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160301', 'Nauta', '16', '1603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160302', 'Parinari', '16', '1603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160303', 'Tigre', '16', '1603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160304', 'Trompeteros', '16', '1603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160305', 'Urarinas', '16', '1603', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160401', 'Ramón Castilla', '16', '1604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160402', 'Pebas', '16', '1604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160403', 'Yavari', '16', '1604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160404', 'San Pablo', '16', '1604', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160501', 'Requena', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160502', 'Alto Tapiche', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160503', 'Capelo', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160504', 'Emilio San Martín', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160505', 'Maquia', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160506', 'Puinahua', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160507', 'Saquena', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160508', 'Soplin', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160509', 'Tapiche', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160510', 'Jenaro Herrera', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160511', 'Yaquerana', '16', '1605', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160601', 'Contamana', '16', '1606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160602', 'Inahuaya', '16', '1606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160603', 'Padre Márquez', '16', '1606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160604', 'Pampa Hermosa', '16', '1606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160605', 'Sarayacu', '16', '1606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160606', 'Vargas Guerra', '16', '1606', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160701', 'Barranca', '16', '1607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160702', 'Cahuapanas', '16', '1607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160703', 'Manseriche', '16', '1607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160704', 'Morona', '16', '1607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160705', 'Pastaza', '16', '1607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160706', 'Andoas', '16', '1607', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160801', 'Putumayo', '16', '1608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160802', 'Rosa Panduro', '16', '1608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160803', 'Teniente Manuel Clavero', '16', '1608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('160804', 'Yaguas', '16', '1608', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170101', 'Tambopata', '17', '1701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170102', 'Inambari', '17', '1701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170103', 'Las Piedras', '17', '1701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170104', 'Laberinto', '17', '1701', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170201', 'Manu', '17', '1702', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170202', 'Fitzcarrald', '17', '1702', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170203', 'Madre de Dios', '17', '1702', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170204', 'Huepetuhe', '17', '1702', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170301', 'Iñapari', '17', '1703', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170302', 'Iberia', '17', '1703', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('170303', 'Tahuamanu', '17', '1703', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180101', 'Moquegua', '18', '1801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180102', 'Carumas', '18', '1801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180103', 'Cuchumbaya', '18', '1801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180104', 'Samegua', '18', '1801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180105', 'San Cristóbal', '18', '1801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180106', 'Torata', '18', '1801', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180201', 'Omate', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180202', 'Chojata', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180203', 'Coalaque', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180204', 'Ichuña', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180205', 'La Capilla', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180206', 'Lloque', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180207', 'Matalaque', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180208', 'Puquina', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180209', 'Quinistaquillas', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180210', 'Ubinas', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180211', 'Yunga', '18', '1802', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180301', 'Ilo', '18', '1803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180302', 'El Algarrobal', '18', '1803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('180303', 'Pacocha', '18', '1803', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190101', 'Chaupimarca', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190102', 'Huachon', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190103', 'Huariaca', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190104', 'Huayllay', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190105', 'Ninacaca', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190106', 'Pallanchacra', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190107', 'Paucartambo', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190108', 'San Francisco de Asís de Yarusyacan', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190109', 'Simon Bolívar', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190110', 'Ticlacayan', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190111', 'Tinyahuarco', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190112', 'Vicco', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190113', 'Yanacancha', '19', '1901', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190201', 'Yanahuanca', '19', '1902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190202', 'Chacayan', '19', '1902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190203', 'Goyllarisquizga', '19', '1902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190204', 'Paucar', '19', '1902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190205', 'San Pedro de Pillao', '19', '1902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190206', 'Santa Ana de Tusi', '19', '1902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190207', 'Tapuc', '19', '1902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190208', 'Vilcabamba', '19', '1902', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190301', 'Oxapampa', '19', '1903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190302', 'Chontabamba', '19', '1903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190303', 'Huancabamba', '19', '1903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190304', 'Palcazu', '19', '1903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190305', 'Pozuzo', '19', '1903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190306', 'Puerto Bermúdez', '19', '1903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190307', 'Villa Rica', '19', '1903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('190308', 'Constitución', '19', '1903', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200101', 'Piura', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200104', 'Castilla', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200105', 'Catacaos', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200107', 'Cura Mori', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200108', 'El Tallan', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200109', 'La Arena', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200110', 'La Unión', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200111', 'Las Lomas', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200114', 'Tambo Grande', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200115', 'Veintiseis de Octubre', '20', '2001', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200201', 'Ayabaca', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200202', 'Frias', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200203', 'Jilili', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200204', 'Lagunas', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200205', 'Montero', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200206', 'Pacaipampa', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200207', 'Paimas', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200208', 'Sapillica', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200209', 'Sicchez', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200210', 'Suyo', '20', '2002', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200301', 'Huancabamba', '20', '2003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200302', 'Canchaque', '20', '2003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200303', 'El Carmen de la Frontera', '20', '2003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200304', 'Huarmaca', '20', '2003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200305', 'Lalaquiz', '20', '2003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200306', 'San Miguel de El Faique', '20', '2003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200307', 'Sondor', '20', '2003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200308', 'Sondorillo', '20', '2003', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200401', 'Chulucanas', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200402', 'Buenos Aires', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200403', 'Chalaco', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200404', 'La Matanza', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200405', 'Morropon', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200406', 'Salitral', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200407', 'San Juan de Bigote', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200408', 'Santa Catalina de Mossa', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200409', 'Santo Domingo', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200410', 'Yamango', '20', '2004', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200501', 'Paita', '20', '2005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200502', 'Amotape', '20', '2005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200503', 'Arenal', '20', '2005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200504', 'Colan', '20', '2005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200505', 'La Huaca', '20', '2005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200506', 'Tamarindo', '20', '2005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200507', 'Vichayal', '20', '2005', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200601', 'Sullana', '20', '2006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200602', 'Bellavista', '20', '2006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200603', 'Ignacio Escudero', '20', '2006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200604', 'Lancones', '20', '2006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200605', 'Marcavelica', '20', '2006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200606', 'Miguel Checa', '20', '2006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200607', 'Querecotillo', '20', '2006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200608', 'Salitral', '20', '2006', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200701', 'Pariñas', '20', '2007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200702', 'El Alto', '20', '2007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200703', 'La Brea', '20', '2007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200704', 'Lobitos', '20', '2007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200705', 'Los Organos', '20', '2007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200706', 'Mancora', '20', '2007', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200801', 'Sechura', '20', '2008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200802', 'Bellavista de la Unión', '20', '2008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200803', 'Bernal', '20', '2008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200804', 'Cristo Nos Valga', '20', '2008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200805', 'Vice', '20', '2008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('200806', 'Rinconada Llicuar', '20', '2008', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210101', 'Puno', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210102', 'Acora', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210103', 'Amantani', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210104', 'Atuncolla', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210105', 'Capachica', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210106', 'Chucuito', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210107', 'Coata', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210108', 'Huata', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210109', 'Mañazo', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210110', 'Paucarcolla', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210111', 'Pichacani', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210112', 'Plateria', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210113', 'San Antonio', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210114', 'Tiquillaca', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210115', 'Vilque', '21', '2101', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210201', 'Azángaro', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210202', 'Achaya', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210203', 'Arapa', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210204', 'Asillo', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210205', 'Caminaca', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210206', 'Chupa', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210207', 'José Domingo Choquehuanca', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210208', 'Muñani', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210209', 'Potoni', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210210', 'Saman', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210211', 'San Anton', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210212', 'San José', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210213', 'San Juan de Salinas', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210214', 'Santiago de Pupuja', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210215', 'Tirapata', '21', '2102', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210301', 'Macusani', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210302', 'Ajoyani', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210303', 'Ayapata', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210304', 'Coasa', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210305', 'Corani', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210306', 'Crucero', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210307', 'Ituata', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210308', 'Ollachea', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210309', 'San Gaban', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210310', 'Usicayos', '21', '2103', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210401', 'Juli', '21', '2104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210402', 'Desaguadero', '21', '2104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210403', 'Huacullani', '21', '2104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210404', 'Kelluyo', '21', '2104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210405', 'Pisacoma', '21', '2104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210406', 'Pomata', '21', '2104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210407', 'Zepita', '21', '2104', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210501', 'Ilave', '21', '2105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210502', 'Capazo', '21', '2105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210503', 'Pilcuyo', '21', '2105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210504', 'Santa Rosa', '21', '2105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210505', 'Conduriri', '21', '2105', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210601', 'Huancane', '21', '2106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210602', 'Cojata', '21', '2106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210603', 'Huatasani', '21', '2106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210604', 'Inchupalla', '21', '2106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210605', 'Pusi', '21', '2106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210606', 'Rosaspata', '21', '2106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210607', 'Taraco', '21', '2106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210608', 'Vilque Chico', '21', '2106', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210701', 'Lampa', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210702', 'Cabanilla', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210703', 'Calapuja', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210704', 'Nicasio', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210705', 'Ocuviri', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210706', 'Palca', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210707', 'Paratia', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210708', 'Pucara', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210709', 'Santa Lucia', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210710', 'Vilavila', '21', '2107', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210801', 'Ayaviri', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210802', 'Antauta', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210803', 'Cupi', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210804', 'Llalli', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210805', 'Macari', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210806', 'Nuñoa', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210807', 'Orurillo', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210808', 'Santa Rosa', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210809', 'Umachiri', '21', '2108', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210901', 'Moho', '21', '2109', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210902', 'Conima', '21', '2109', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210903', 'Huayrapata', '21', '2109', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('210904', 'Tilali', '21', '2109', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211001', 'Putina', '21', '2110', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211002', 'Ananea', '21', '2110', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211003', 'Pedro Vilca Apaza', '21', '2110', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211004', 'Quilcapuncu', '21', '2110', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211005', 'Sina', '21', '2110', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211101', 'Juliaca', '21', '2111', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211102', 'Cabana', '21', '2111', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211103', 'Cabanillas', '21', '2111', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211104', 'Caracoto', '21', '2111', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211105', 'San Miguel', '21', '2111', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211201', 'Sandia', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211202', 'Cuyocuyo', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211203', 'Limbani', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211204', 'Patambuco', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211205', 'Phara', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211206', 'Quiaca', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211207', 'San Juan del Oro', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211208', 'Yanahuaya', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211209', 'Alto Inambari', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211210', 'San Pedro de Putina Punco', '21', '2112', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211301', 'Yunguyo', '21', '2113', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211302', 'Anapia', '21', '2113', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211303', 'Copani', '21', '2113', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211304', 'Cuturapi', '21', '2113', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211305', 'Ollaraya', '21', '2113', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211306', 'Tinicachi', '21', '2113', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('211307', 'Unicachi', '21', '2113', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220101', 'Moyobamba', '22', '2201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220102', 'Calzada', '22', '2201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220103', 'Habana', '22', '2201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220104', 'Jepelacio', '22', '2201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220105', 'Soritor', '22', '2201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220106', 'Yantalo', '22', '2201', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220201', 'Bellavista', '22', '2202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220202', 'Alto Biavo', '22', '2202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220203', 'Bajo Biavo', '22', '2202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220204', 'Huallaga', '22', '2202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220205', 'San Pablo', '22', '2202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220206', 'San Rafael', '22', '2202', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220301', 'San José de Sisa', '22', '2203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220302', 'Agua Blanca', '22', '2203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220303', 'San Martín', '22', '2203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220304', 'Santa Rosa', '22', '2203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220305', 'Shatoja', '22', '2203', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220401', 'Saposoa', '22', '2204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220402', 'Alto Saposoa', '22', '2204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220403', 'El Eslabón', '22', '2204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220404', 'Piscoyacu', '22', '2204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220405', 'Sacanche', '22', '2204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220406', 'Tingo de Saposoa', '22', '2204', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220501', 'Lamas', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220502', 'Alonso de Alvarado', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220503', 'Barranquita', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220504', 'Caynarachi', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220505', 'Cuñumbuqui', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220506', 'Pinto Recodo', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220507', 'Rumisapa', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220508', 'San Roque de Cumbaza', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220509', 'Shanao', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220510', 'Tabalosos', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220511', 'Zapatero', '22', '2205', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220601', 'Juanjuí', '22', '2206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220602', 'Campanilla', '22', '2206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220603', 'Huicungo', '22', '2206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220604', 'Pachiza', '22', '2206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220605', 'Pajarillo', '22', '2206', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220701', 'Picota', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220702', 'Buenos Aires', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220703', 'Caspisapa', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220704', 'Pilluana', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220705', 'Pucacaca', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220706', 'San Cristóbal', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220707', 'San Hilarión', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220708', 'Shamboyacu', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220709', 'Tingo de Ponasa', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220710', 'Tres Unidos', '22', '2207', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220801', 'Rioja', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220802', 'Awajun', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220803', 'Elías Soplin Vargas', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220804', 'Nueva Cajamarca', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220805', 'Pardo Miguel', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220806', 'Posic', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220807', 'San Fernando', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220808', 'Yorongos', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220809', 'Yuracyacu', '22', '2208', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220901', 'Tarapoto', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220902', 'Alberto Leveau', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220903', 'Cacatachi', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220904', 'Chazuta', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220905', 'Chipurana', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220906', 'El Porvenir', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220907', 'Huimbayoc', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220908', 'Juan Guerra', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220909', 'La Banda de Shilcayo', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220910', 'Morales', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220911', 'Papaplaya', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220912', 'San Antonio', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220913', 'Sauce', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('220914', 'Shapaja', '22', '2209', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('221001', 'Tocache', '22', '2210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('221002', 'Nuevo Progreso', '22', '2210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('221003', 'Polvora', '22', '2210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('221004', 'Shunte', '22', '2210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('221005', 'Uchiza', '22', '2210', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230101', 'Tacna', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230102', 'Alto de la Alianza', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230103', 'Calana', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230104', 'Ciudad Nueva', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230105', 'Inclan', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230106', 'Pachia', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230107', 'Palca', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230108', 'Pocollay', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230109', 'Sama', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230110', 'Coronel Gregorio Albarracín Lanchipa', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230111', 'La Yarada los Palos', '23', '2301', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230201', 'Candarave', '23', '2302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230202', 'Cairani', '23', '2302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230203', 'Camilaca', '23', '2302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230204', 'Curibaya', '23', '2302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230205', 'Huanuara', '23', '2302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230206', 'Quilahuani', '23', '2302', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230301', 'Locumba', '23', '2303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230302', 'Ilabaya', '23', '2303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230303', 'Ite', '23', '2303', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230401', 'Tarata', '23', '2304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230402', 'Héroes Albarracín', '23', '2304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230403', 'Estique', '23', '2304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230404', 'Estique-Pampa', '23', '2304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230405', 'Sitajara', '23', '2304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230406', 'Susapaya', '23', '2304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230407', 'Tarucachi', '23', '2304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('230408', 'Ticaco', '23', '2304', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240101', 'Tumbes', '24', '2401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240102', 'Corrales', '24', '2401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240103', 'La Cruz', '24', '2401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240104', 'Pampas de Hospital', '24', '2401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240105', 'San Jacinto', '24', '2401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240106', 'San Juan de la Virgen', '24', '2401', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240201', 'Zorritos', '24', '2402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240202', 'Casitas', '24', '2402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240203', 'Canoas de Punta Sal', '24', '2402', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240301', 'Zarumilla', '24', '2403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240302', 'Aguas Verdes', '24', '2403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240303', 'Matapalo', '24', '2403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('240304', 'Papayal', '24', '2403', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250101', 'Calleria', '25', '2501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250102', 'Campoverde', '25', '2501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250103', 'Iparia', '25', '2501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250104', 'Masisea', '25', '2501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250105', 'Yarinacocha', '25', '2501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250106', 'Nueva Requena', '25', '2501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250107', 'Manantay', '25', '2501', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250201', 'Raymondi', '25', '2502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250202', 'Sepahua', '25', '2502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250203', 'Tahuania', '25', '2502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250204', 'Yurua', '25', '2502', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250301', 'Padre Abad', '25', '2503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250302', 'Irazola', '25', '2503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250303', 'Curimana', '25', '2503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250304', 'Neshuya', '25', '2503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250305', 'Alexander Von Humboldt', '25', '2503', NULL, NULL);
INSERT INTO `DISTRITO` VALUES ('250401', 'Purus', '25', '2504', NULL, NULL);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'intranet', 'acceso');
INSERT INTO `django_content_type` VALUES (2, 'intranet', 'archivo');
INSERT INTO `django_content_type` VALUES (3, 'intranet', 'areaservicio');
INSERT INTO `django_content_type` VALUES (4, 'intranet', 'catalogoplato');
INSERT INTO `django_content_type` VALUES (5, 'intranet', 'catalogotablas');
INSERT INTO `django_content_type` VALUES (6, 'intranet', 'catservicio');
INSERT INTO `django_content_type` VALUES (7, 'intranet', 'cliente');
INSERT INTO `django_content_type` VALUES (8, 'intranet', 'componente');
INSERT INTO `django_content_type` VALUES (9, 'intranet', 'conversacion');
INSERT INTO `django_content_type` VALUES (10, 'intranet', 'cotizacion');
INSERT INTO `django_content_type` VALUES (11, 'intranet', 'departamento');
INSERT INTO `django_content_type` VALUES (12, 'intranet', 'detalle');
INSERT INTO `django_content_type` VALUES (13, 'intranet', 'direccion');
INSERT INTO `django_content_type` VALUES (14, 'intranet', 'directorio');
INSERT INTO `django_content_type` VALUES (15, 'intranet', 'distrito');
INSERT INTO `django_content_type` VALUES (16, 'intranet', 'docadjunto');
INSERT INTO `django_content_type` VALUES (17, 'intranet', 'empresa');
INSERT INTO `django_content_type` VALUES (18, 'intranet', 'estaciontrabajo');
INSERT INTO `django_content_type` VALUES (19, 'intranet', 'hisclaves');
INSERT INTO `django_content_type` VALUES (20, 'intranet', 'historiaclinica');
INSERT INTO `django_content_type` VALUES (21, 'intranet', 'insumo');
INSERT INTO `django_content_type` VALUES (22, 'intranet', 'local');
INSERT INTO `django_content_type` VALUES (23, 'intranet', 'login');
INSERT INTO `django_content_type` VALUES (24, 'intranet', 'logconexion');
INSERT INTO `django_content_type` VALUES (25, 'intranet', 'medicamento');
INSERT INTO `django_content_type` VALUES (26, 'intranet', 'menu');
INSERT INTO `django_content_type` VALUES (27, 'intranet', 'modulos');
INSERT INTO `django_content_type` VALUES (28, 'intranet', 'objacceso');
INSERT INTO `django_content_type` VALUES (29, 'intranet', 'opinion');
INSERT INTO `django_content_type` VALUES (30, 'intranet', 'pagina');
INSERT INTO `django_content_type` VALUES (31, 'intranet', 'pago');
INSERT INTO `django_content_type` VALUES (32, 'intranet', 'pais');
INSERT INTO `django_content_type` VALUES (33, 'intranet', 'pedido');
INSERT INTO `django_content_type` VALUES (34, 'intranet', 'permiso');
INSERT INTO `django_content_type` VALUES (35, 'intranet', 'persona');
INSERT INTO `django_content_type` VALUES (36, 'intranet', 'personal');
INSERT INTO `django_content_type` VALUES (37, 'intranet', 'personacontacto');
INSERT INTO `django_content_type` VALUES (38, 'intranet', 'personadireccion');
INSERT INTO `django_content_type` VALUES (39, 'intranet', 'plantillacomponente');
INSERT INTO `django_content_type` VALUES (40, 'intranet', 'plantillaweb');
INSERT INTO `django_content_type` VALUES (41, 'intranet', 'plato');
INSERT INTO `django_content_type` VALUES (42, 'intranet', 'proveedor');
INSERT INTO `django_content_type` VALUES (43, 'intranet', 'provincia');
INSERT INTO `django_content_type` VALUES (44, 'intranet', 'rol');
INSERT INTO `django_content_type` VALUES (45, 'intranet', 'sector');
INSERT INTO `django_content_type` VALUES (46, 'intranet', 'seguro');
INSERT INTO `django_content_type` VALUES (47, 'intranet', 'servicio');
INSERT INTO `django_content_type` VALUES (48, 'intranet', 'serviciopago');
INSERT INTO `django_content_type` VALUES (49, 'intranet', 'sistema');
INSERT INTO `django_content_type` VALUES (50, 'intranet', 'sistemamodulos');
INSERT INTO `django_content_type` VALUES (51, 'intranet', 'tabtablas');
INSERT INTO `django_content_type` VALUES (52, 'intranet', 'ticket');
INSERT INTO `django_content_type` VALUES (53, 'intranet', 'tipocontacto');
INSERT INTO `django_content_type` VALUES (54, 'intranet', 'unidadejecutora');
INSERT INTO `django_content_type` VALUES (55, 'intranet', 'unidadorganica');
INSERT INTO `django_content_type` VALUES (56, 'intranet', 'unidadorganicadependencia');
INSERT INTO `django_content_type` VALUES (57, 'intranet', 'usuario');
INSERT INTO `django_content_type` VALUES (58, 'intranet', 'usuariorol');
INSERT INTO `django_content_type` VALUES (59, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (60, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (61, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (62, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (63, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (64, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (65, 'intranet', 'authgroup');
INSERT INTO `django_content_type` VALUES (66, 'intranet', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES (67, 'intranet', 'authpermission');
INSERT INTO `django_content_type` VALUES (68, 'intranet', 'authuser');
INSERT INTO `django_content_type` VALUES (69, 'intranet', 'authusergroups');
INSERT INTO `django_content_type` VALUES (70, 'intranet', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES (71, 'intranet', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES (72, 'intranet', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES (73, 'intranet', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (74, 'intranet', 'djangosession');
INSERT INTO `django_content_type` VALUES (75, 'intranet', 'archivofirma');
INSERT INTO `django_content_type` VALUES (76, 'intranet', 'empresarequisitocumplido');
INSERT INTO `django_content_type` VALUES (77, 'intranet', 'empresasocio');
INSERT INTO `django_content_type` VALUES (78, 'intranet', 'procesopaso');
INSERT INTO `django_content_type` VALUES (79, 'intranet', 'requisito');
INSERT INTO `django_content_type` VALUES (80, 'intranet', 'unidadorganicatrabajapersonal');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-06-10 03:34:25.596972');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2025-06-10 03:34:26.497680');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2025-06-10 03:34:26.837271');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-06-10 03:34:26.838335');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-10 03:34:26.853366');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2025-06-10 03:34:26.960150');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-06-10 03:34:27.058056');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-06-10 03:34:27.135203');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-06-10 03:34:27.142266');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-06-10 03:34:27.223292');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-06-10 03:34:27.228531');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-06-10 03:34:27.236526');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-06-10 03:34:27.298698');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-06-10 03:34:27.364458');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-06-10 03:34:27.433977');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-06-10 03:34:27.453692');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-06-10 03:34:27.560741');
INSERT INTO `django_migrations` VALUES (18, 'core', '0001_initial', '2025-06-10 03:34:27.658878');
INSERT INTO `django_migrations` VALUES (19, 'core', '0002_delete_abogado_remove_acceso_idrol_and_more', '2025-06-10 03:34:27.741368');
INSERT INTO `django_migrations` VALUES (20, 'intranet', '0001_initial', '2025-06-10 03:34:28.003335');
INSERT INTO `django_migrations` VALUES (21, 'intranet', '0002_alter_login_options', '2025-06-10 03:34:28.016096');
INSERT INTO `django_migrations` VALUES (22, 'intranet', '0003_alter_login_options', '2025-06-10 03:34:28.028677');
INSERT INTO `django_migrations` VALUES (23, 'intranet', '0004_alter_login_options', '2025-06-10 03:34:28.036505');
INSERT INTO `django_migrations` VALUES (24, 'sessions', '0001_initial', '2025-06-10 03:38:24.424007');
INSERT INTO `django_migrations` VALUES (25, 'intranet', '0002_authgroup_authgrouppermissions_authpermission_and_more', '2025-06-11 06:40:00.113758');
INSERT INTO `django_migrations` VALUES (26, 'intranet', '0003_alter_opinion_options', '2025-06-11 06:40:00.127852');
INSERT INTO `django_migrations` VALUES (27, 'intranet', '0004_archivofirma_empresarequisitocumplido_empresasocio_and_more', '2025-06-16 00:42:21.255949');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('5jj78jzosp9p7zsh4hxg4ps9n0k9m1fo', '.eJxVjMsOwiAQRf-FtSEMj0JduvcbyAxMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJcxZnAeL0uxGmB9cd5DvWW5Op1XWZSe6KPGiX15b5eTncv4OCvXzrkAZr2CJNzMTKKW0CEIzaKa8gKdLZuwTsIWUc_AjeQg4GcFLGWmbx_gDdwDeF:1uQQ7K:85gdNQIQ49cnU__-VgH77CJOSQoiwrd3SNwigiBPNgQ', '2025-06-28 07:36:14.819724');

-- ----------------------------
-- Table structure for DOCADJUNTO
-- ----------------------------
DROP TABLE IF EXISTS `DOCADJUNTO`;
CREATE TABLE `DOCADJUNTO`  (
  `IDDOCADJUNTO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(345) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `URLADJUNTO` varchar(745) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TAMANIO` float NULL DEFAULT NULL,
  `FORMATO` varchar(85) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDDOCADJUNTO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DOCADJUNTO
-- ----------------------------
INSERT INTO `DOCADJUNTO` VALUES (1, '1597603923729.jpeg', 'http://192.168.0.100/uploads/2020-08-16/530f501f6256aeab.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (2, '1597624521087.jpeg', 'http://192.168.0.100/uploads/2020-08-16/9035d35169e61418.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (3, '1597634104767.jpeg', 'http://192.168.0.100/uploads/2020-08-16/daccd4759152b066.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (4, '1597634104767.jpeg', 'http://192.168.0.100/uploads/2020-08-17/cb402e93e281a5c6.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (5, '1597624521087.jpeg', 'http://192.168.0.100/uploads/2020-08-17/11489d9992113cd0.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (6, '1597604036231.jpeg', 'http://192.168.0.100/uploads/2020-08-17/f5ab14e09d043423.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (7, '1597604024371.jpeg', 'http://192.168.0.100/uploads/2020-08-17/d5ca9dc5463d970d.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (8, '1597603923729.jpeg', 'http://192.168.0.100/uploads/2020-08-17/578a456fabc704be.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (9, '1597634104767.jpeg', 'http://192.168.0.100/uploads/2020-08-17/90890bd1216c32f4.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (10, '1597624521087.jpeg', 'http://192.168.0.100/uploads/2020-08-17/0184600c3f9f4249.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (11, '1597604036231.jpeg', 'http://192.168.0.100/uploads/2020-08-17/8dc7992e46173836.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (12, '1597604024371.jpeg', 'http://192.168.0.100/uploads/2020-08-17/5eb947966bbb1c6e.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (13, '1597603923729.jpeg', 'http://192.168.0.100/uploads/2020-08-17/d97587087c28a5af.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (14, '1597634104767.jpeg', 'http://192.168.0.100/uploads/2020-08-17/bffa65f36a18655e.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (15, '1597624521087.jpeg', 'http://192.168.0.100/uploads/2020-08-17/b2f06a2ea5776354.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (16, '1597604036231.jpeg', 'http://192.168.0.100/uploads/2020-08-17/6c52ced2e010e6ac.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (17, '1597604024371.jpeg', 'http://192.168.0.100/uploads/2020-08-17/9f908084e671e977.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (18, '1597603923729.jpeg', 'http://192.168.0.100/uploads/2020-08-17/d9e329f3c6565894.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (19, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/93775a9f6b619700.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (20, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/8eac7a5c66bb3772.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (21, '1597642978173.jpeg', 'http://192.168.0.100/uploads/2020-08-17/4c12ffd174e77231.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (22, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/a59f144c00c81b60.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (23, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/fd871078f4b621f1.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (24, '1597642978173.jpeg', 'http://192.168.0.100/uploads/2020-08-17/364f402c1f8709cf.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (25, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/abd8c93a25606724.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (26, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/7386bfd034cf875c.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (27, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/789ac0c314efc594.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (28, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/8720d2ced533e03e.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (29, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/1c4d7f54ee4d2e80.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (30, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/9a9c7a1653329b15.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (31, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/662775e1af70a088.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (32, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/7231253dae467f2d.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (33, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/50608fcddd91eec6.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (34, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/5ea8089ebce85834.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (35, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/fd611fd08d012b37.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (36, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/87033ce35746b082.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (37, '1597642949261.jpeg', 'http://192.168.0.100/uploads/2020-08-17/d5e11f62ba2be00d.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (38, '1597642926667.jpeg', 'http://192.168.0.100/uploads/2020-08-17/43361c598363b7bb.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (39, '1597645007794.jpeg', 'http://192.168.0.100/uploads/2020-08-17/e76b734d675637b6.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (40, '1597644998553.jpeg', 'http://192.168.0.100/uploads/2020-08-17/40a997a3a6562bb4.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (41, '1597673988608.jpeg', 'http://192.168.0.100/uploads/2020-08-17/2c6312d5ec3735cc.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (42, '1597705201935.jpeg', 'http://192.168.0.100/uploads/2020-08-17/ecc4408f2ba0a86b.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (43, '1597705230483.jpeg', 'http://192.168.0.100/uploads/2020-08-17/b9f73cca556a3845.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (44, '1597705308865.jpeg', 'http://192.168.0.100/uploads/2020-08-17/947f4d26441300b2.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (45, '1597705440516.jpeg', 'http://192.168.0.100/uploads/2020-08-17/3e3fa03302ced077.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (46, '1597707566785.jpeg', 'http://192.168.0.100/uploads/2020-08-17/45b321fd8ef94be7.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (47, '1597707599236.jpeg', 'http://192.168.0.100/uploads/2020-08-17/d8d0ea3798fc05bb.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (48, '1597707665886.jpeg', 'http://192.168.0.100/uploads/2020-08-17/eb5d355509cf7bc9.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (49, '1597707734730.jpeg', 'http://192.168.0.100/uploads/2020-08-17/e91ac1e9d6bf3139.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (50, '1597707916960.jpeg', 'http://192.168.0.100/uploads/2020-08-17/b228a7d7709dfece.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (51, '1597708232456.jpeg', 'http://192.168.0.100/uploads/2020-08-17/64223459c7d9b1af.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (52, '1597708247246.jpeg', 'http://192.168.0.100/uploads/2020-08-17/a6a3001dd2ea8922.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (53, '1597708271291.jpeg', 'http://192.168.0.100/uploads/2020-08-17/faabcb21438bd9bf.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (54, '1597708281352.jpeg', 'http://192.168.0.100/uploads/2020-08-17/0bac0795e985cffc.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (55, '1597708292171.jpeg', 'http://192.168.0.100/uploads/2020-08-17/f1ec16d7d251d6c2.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (56, '1597708399249.jpeg', 'http://192.168.0.100/uploads/2020-08-17/8bbee7c82fc6d271.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (57, '1597708706959.jpeg', 'http://192.168.0.100/uploads/2020-08-17/b0a748ff97889976.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (58, '1597708982723.jpeg', 'http://192.168.0.100/uploads/2020-08-17/2931652413779d75.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (59, '1597709223004.jpeg', 'http://192.168.0.100/uploads/2020-08-17/359aade003321e26.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (60, '1597709392334.jpeg', 'http://192.168.0.100/uploads/2020-08-17/9009475d70764b8d.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (61, '1597709658563.jpeg', 'http://192.168.0.100/uploads/2020-08-17/dcc1091c16a7ac9f.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (62, '1597709767991.jpeg', 'http://192.168.0.100/uploads/2020-08-17/596d960e73235947.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (63, '1597711235273.jpeg', 'http://192.168.0.100/uploads/2020-08-17/8a325b901c55c12e.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (64, '1597711275490.jpeg', 'http://192.168.0.100/uploads/2020-08-17/5d7962af8d75d749.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (65, '1597711331848.jpeg', 'http://192.168.0.100/uploads/2020-08-17/7b970a8ed7caf802.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (66, '1597714602344.jpeg', 'http://192.168.0.100/uploads/2020-08-17/2bace8280fba5265.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (67, '1597714647205.jpeg', 'http://192.168.0.100/uploads/2020-08-17/060a08e8072bf9c9.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (68, '1597714733344.jpeg', 'http://192.168.0.100/uploads/2020-08-17/7fe8dac8adeb9a67.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (69, '1597715037332.jpeg', 'http://192.168.0.100/uploads/2020-08-17/c596c26b5f179726.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (70, '1597715077354.jpeg', 'http://192.168.0.100/uploads/2020-08-17/685b536558311b2c.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (71, '1597715526541.jpeg', 'http://192.168.0.100/uploads/2020-08-17/468ccb3553a9b56b.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (72, '1597715534658.jpeg', 'http://192.168.0.100/uploads/2020-08-17/3f4c7bb1e21b7ac4.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (73, '1597716313679.jpeg', 'http://192.168.0.100/uploads/2020-08-17/05a3dbb14026b363.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (74, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/56bfeee759f6ec46.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (75, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/da69536601017f27.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (76, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/5aa67726b8e551b9.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (77, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/de822acd381b1778.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (78, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/68aba88547205772.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (79, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/8c01722cf71b7c47.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (80, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/67cdfacf437806cb.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (81, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/779678d9d7985afa.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (82, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/7f7e13831cd88f20.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (83, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/38d9cbc4c10b4386.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (84, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/9d46cdfbf02b8287.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (85, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/df8c6286c661a92e.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (86, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/a58d201ce8acc165.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (87, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/ab1f5fc92c49aca6.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (88, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/b751462876ab37dd.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (89, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/05ba979b5832ca2a.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (90, '1597774640689.jpeg', 'http://192.168.0.100/uploads/2020-08-18/52802854913c5995.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (91, '1597774650453.jpeg', 'http://192.168.0.100/uploads/2020-08-18/0c7a00fe7a0bac2c.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (92, '1597787097404.jpeg', 'http://192.168.0.100/uploads/2020-08-18/2ad39983d460a17c.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (93, '1597787110978.jpeg', 'http://192.168.0.100/uploads/2020-08-18/4c2bb476f3a7c3a0.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (94, '1597787097404.jpeg', 'http://192.168.0.100/uploads/2020-08-18/1ae94cf1c68ff097.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (95, '1597787110978.jpeg', 'http://192.168.0.100/uploads/2020-08-18/da8dd21827557ca0.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (96, '1597787097404.jpeg', 'http://192.168.0.100/uploads/2020-08-18/98228c860c38a117.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (97, '1597787110978.jpeg', 'http://192.168.0.100/uploads/2020-08-18/de80df997c5f3ad4.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (98, '1597787743344.jpeg', 'http://192.168.0.100/uploads/2020-08-18/8a47be552d9ed87a.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (99, '1597787754931.jpeg', 'http://192.168.0.100/uploads/2020-08-18/0487d41a9c2650e4.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (100, '1597787770392.jpeg', 'http://192.168.0.100/uploads/2020-08-18/fb877e7327deb253.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (101, '1597788093146.jpeg', 'http://192.168.0.100/uploads/2020-08-18/cf99dc9ab8bfe1e7.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (102, '1597788106253.jpeg', 'http://192.168.0.100/uploads/2020-08-18/33a6d671537d62bf.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (103, '1597788093146.jpeg', 'http://192.168.0.100/uploads/2020-08-18/ca2639d609f060bd.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (104, '1597788106253.jpeg', 'http://192.168.0.100/uploads/2020-08-18/2c747ed2612cf1c0.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (105, '1597790687888.jpeg', 'http://192.168.0.100/uploads/2020-08-18/6703db3acd835a57.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (106, '1597790706901.jpeg', 'http://192.168.0.100/uploads/2020-08-18/706a995b09468c90.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (107, '1597791353457.jpeg', 'http://192.168.0.100/uploads/2020-08-18/7298416ec7cd5a93.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (108, '1597791365489.jpeg', 'http://192.168.0.100/uploads/2020-08-18/38a619db0c1aea6f.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (109, '1597792494715.jpeg', 'http://192.168.0.100/uploads/2020-08-18/eeaa3e0c4d415c43.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (110, '1597792504592.jpeg', 'http://192.168.0.100/uploads/2020-08-18/36963ca51db37a95.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (111, '1597792513048.jpeg', 'http://192.168.0.100/uploads/2020-08-18/9229e609cb4aa5d5.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (112, '1597793009709.jpeg', 'http://192.168.0.100/uploads/2020-08-18/35df3126ffe5f0a7.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (113, '1597793019319.jpeg', 'http://192.168.0.100/uploads/2020-08-18/288b6b61576d4e5b.jpeg', 184808, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (114, 'logo-negro.png', 'http://sentinel.trabajo.ed/uploads/2020-09-10/2d2ff7cc94fcb494.png', 53854, 'image/png', '1');
INSERT INTO `DOCADJUNTO` VALUES (115, 'logo-negro.png', 'http://sentinel.trabajo.ed/uploads/2020-09-10/1ddecb063d66a8d9.png', 53854, 'image/png', '1');
INSERT INTO `DOCADJUNTO` VALUES (116, '1602110024438.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/f557a9d888da5eca.jpeg', 130466, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (117, '1602110035287.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/f69d9f28887ea9a7.jpeg', 136886, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (118, '1602110045307.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/1e910b6f036c6d3a.jpeg', 136223, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (119, '1602116973707.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/5b25afe1b7bb65d3.jpeg', 159249, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (120, '1602116984779.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/512467a4a2286099.jpeg', 148171, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (121, '1602116998294.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/18749f2f5c4f367c.jpeg', 154790, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (122, '1602120384408.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/8cdc59d8641804ba.jpeg', 184748, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (123, '1602120397322.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/854b44587c4782a7.jpeg', 218292, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (124, '1602120408046.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/72937f47fed6a3dd.jpeg', 200281, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (125, '1602120422423.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/c147bd68def91c34.jpeg', 181248, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (126, '1602120384408.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/90d4f124ee8ef807.jpeg', 184748, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (127, '1602120397322.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/34db8b720302d9f5.jpeg', 218292, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (128, '1602120408046.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/056d1b909e72ee37.jpeg', 200281, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (129, '1602120422423.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/931f8ea2fef868ce.jpeg', 181248, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (130, '1602130590694.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/158321609fb4d334.jpeg', 103632, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (131, '1602130602298.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/01c344e61c3b8e42.jpeg', 100130, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (132, '1602130618213.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/07f2e17577256d45.jpeg', 138450, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (133, '1602130629746.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/ec6b4e9d597a8677.jpeg', 77752, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (134, '1602130642220.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/48cb9eccb49c9cce.jpeg', 83119, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (135, '1602130653692.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/e79513ec249262f7.jpeg', 95651, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (136, '1602131022789.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/f490cd7623010cbc.jpeg', 191306, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (137, '1602131033034.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/7d7eabcae9ce69f2.jpeg', 274521, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (138, '1602131045936.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/fd136b21a357f8df.jpeg', 215835, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (139, '1602131060823.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/289b38e30ed8f46f.jpeg', 221464, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (140, '1602131077778.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/baf758b02b346678.jpeg', 161787, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (141, '1602131091095.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/41fc1aea8621dd4a.jpeg', 222661, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (142, '1602132520518.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/c913aef3e70ec225.jpeg', 111892, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (143, '1602132532165.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/070f6e941af5cb97.jpeg', 116477, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (144, '1602132545381.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/26a2a091e740c610.jpeg', 107882, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (145, '1602132557348.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/7e9144347d678784.jpeg', 98157, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (146, '1602132571750.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/c9517542931523f0.jpeg', 123331, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (147, '1602132579817.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/395fde8de8171d3a.jpeg', 103850, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (148, '1602132588884.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/cfc9d98e3a417a38.jpeg', 140975, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (149, '1602132598296.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/07478ba3d5da2447.jpeg', 116354, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (150, '1602132608349.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/9ac7418857f20ef4.jpeg', 163179, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (151, '1602132616491.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/f2afff820cebe927.jpeg', 150960, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (152, '1602132635069.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/1b75b5a46f6102ac.jpeg', 110740, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (153, '1602132648960.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/3b827ee105bfd133.jpeg', 137927, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (154, '1602132659242.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-07/c7d4296999b48666.jpeg', 136159, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (155, '1602209742635.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-08/aa64393b1dbe7297.jpeg', 135117, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (156, '1602209753492.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-08/030ef4b2a20c8649.jpeg', 230918, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (157, '1602209765170.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-08/d283b7f0d03c0872.jpeg', 216972, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (158, '1602372951461.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/f7f05a058842a6cb.jpeg', 134546, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (159, '1602372989680.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/bda897bc5f0b3031.jpeg', 138894, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (160, '1602373005464.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/35bbcc1d0e5a4c20.jpeg', 147002, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (161, '1602378550884.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/e6c0a15420cda761.jpeg', 113300, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (162, '1602378561369.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/3a40c497b1d8d0fc.jpeg', 116922, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (163, '1602380532686.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/09a92ffcab07c00b.jpeg', 114505, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (164, '1602380541963.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/8d141bddf3098038.jpeg', 114195, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (165, '1602381370493.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/c1e063f4494b0456.jpeg', 70583, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (166, '1602381524297.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/bf5e06a20333f14b.jpeg', 72637, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (167, '1602381524297.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/90623d633bed4093.jpeg', 72637, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (168, '1602381524297.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/a4eeaa0f19f7398a.jpeg', 72637, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (169, '1602381708739.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/b5a9b526448de591.jpeg', 73150, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (170, '1602381720911.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-10/46c83358503adad4.jpeg', 72864, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (171, '1602527953252.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-12/c25278dd34c2cb7e.jpeg', 228285, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (172, '1602527963037.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-12/9ad4f54edfc3564e.jpeg', 183510, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (173, '1602528017472.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-12/37d3e327cf9ee3c9.jpeg', 188273, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (174, '1602528035169.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-12/6f286c8720f23785.jpeg', 232967, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (175, '1602610051699.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-13/19aaeeee841e81c6.jpeg', 74616, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (176, '1602611437295.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-13/f636051fbb3399bc.jpeg', 73487, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (177, '1602611437295.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-13/f865d6e74d6e1bfc.jpeg', 73487, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (178, '1602612050479.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-13/25355c4691702d64.jpeg', 72869, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (179, '1602612112815.jpeg', 'http://sentinel.fullsafetyperu.com/uploads/2020-10-13/ebba4c4b83e2dcf6.jpeg', 73280, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (180, '', 'http://sentinel.trabajo.ed/uploads/2020-10-18/', 0, '', '1');
INSERT INTO `DOCADJUNTO` VALUES (181, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/35d988fb296577fc.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (182, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/224620d1c54cbcee.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (183, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/98e96203f1324fe8.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (184, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/bf0702a6be7ed4c8.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (185, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/578dc9693d480829.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (186, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/a8f7d9e4bb5a9680.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (187, '', 'http://sentinel.trabajo.ed/uploads/2020-10-18/', 0, '', '1');
INSERT INTO `DOCADJUNTO` VALUES (188, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/7874280fac41ee60.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (189, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/af63d4133d6c0a23.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (190, '28092020-cusquenios-cajero-agente.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-18/f5368c58d88d49d9.jpg', 19551, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (191, '', 'http://sentinel.trabajo.ed/uploads/2020-10-19/', 0, '', '1');
INSERT INTO `DOCADJUNTO` VALUES (192, 'WhatsApp Image 2020-08-23 at 08.45.26.jpeg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/ebed0a91d9112376.jpeg', 65035, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (193, 'PORTADA-WEB.png', 'http://sentinel.trabajo.ed/uploads/2020-10-19/b9b93232b97f4f41.png', 35344, 'image/png', '1');
INSERT INTO `DOCADJUNTO` VALUES (194, '37d3e327cf9ee3c9.jpeg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/1cbe963ea3a70ea7.jpeg', 188273, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (195, 'edicion_00207.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/e4ba0dff22b2ff75.jpg', 740254, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (196, 'edicion_00207.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/2318516a2eef0c7b.jpg', 740254, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (197, '37d3e327cf9ee3c9.jpeg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/c4507ce87405e732.jpeg', 188273, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (198, '37d3e327cf9ee3c9.jpeg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/af6e1e49939ead8f.jpeg', 188273, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (199, '37d3e327cf9ee3c9.jpeg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/e65fd3f046acf857.jpeg', 188273, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (200, '', 'http://sentinel.trabajo.ed/uploads/2020-10-19/', 0, '', '1');
INSERT INTO `DOCADJUNTO` VALUES (201, 'edicion_00207.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/ace78c16de4a97b9.jpg', 740254, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (202, '', 'http://sentinel.trabajo.ed/uploads/2020-10-19/', 0, '', '1');
INSERT INTO `DOCADJUNTO` VALUES (203, '37d3e327cf9ee3c9.jpeg', 'http://sentinel.trabajo.ed/uploads/2020-10-19/71a8452f9c9c5822.jpeg', 188273, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (204, '20201018_170138.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/6aadfdb37fcd622c.jpg', 1372450, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (205, '20201018_170138.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/5f1e1576f9c125d4.jpg', 1372450, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (206, '20201018_170141.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/9237285d622ed4f4.jpg', 1541320, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (207, '20201018_171126.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/591e726474826ecc.jpg', 1173710, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (208, '20201018_170150.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/0b6d6aecf6b01a8b.jpg', 1520910, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (209, '20201018_170153.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/91db43297363ff1d.jpg', 1529660, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (210, '20201018_170150.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/12992b90fd1e512f.jpg', 1520910, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (211, '20201018_170153.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/08364585f9b9844a.jpg', 1529660, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (212, '20201018_171318.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/6a40866aaf42e376.jpg', 1324120, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (213, '20201018_170150.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/0d317228f467a051.jpg', 1520910, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (214, '20201018_170150.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/dea550649705a496.jpg', 1520910, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (215, '20201018_170026.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/8f1af7d66365d431.jpg', 1926060, 'image/jpeg', '1');
INSERT INTO `DOCADJUNTO` VALUES (216, '20201018_170150.jpg', 'http://sentinel.trabajo.ed/uploads/2020-10-26/57a08fd4cb4abb5c.jpg', 1520910, 'image/jpeg', '1');

-- ----------------------------
-- Table structure for EMPRESA
-- ----------------------------
DROP TABLE IF EXISTS `EMPRESA`;
CREATE TABLE `EMPRESA`  (
  `IDEMPRESA` int(0) NOT NULL AUTO_INCREMENT,
  `RUBRO` varchar(145) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FECHA_CREACION` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `DESCRIPCION` varchar(445) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TIPO_COMERCIO` int(0) NULL DEFAULT NULL COMMENT 'Lista de comercios y tipo de actividad: IDCATALOGOTABLAS=31',
  `IDPERSONA` int(0) NOT NULL,
  `TIPO_EMPRESA` int(0) NULL DEFAULT NULL COMMENT 'Lista de cargos: IDCATALOGOTABLAS=49',
  `FIRMA_DOCUMENTO` int(0) NULL DEFAULT NULL COMMENT 'Lista de cargos: IDCATALOGOTABLAS=50',
  `NRO_SOCIOS` int(0) NULL DEFAULT NULL,
  `ESTADO_RESERVA_NOMBRE` int(0) NULL DEFAULT NULL COMMENT 'Lista de cargos: IDCATALOGOTABLAS=51',
  `TIPO_APORTE` int(0) NULL DEFAULT NULL COMMENT 'Lista de cargos: IDCATALOGOTABLAS=52',
  `RANGO_CAPITAL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO_POLITICA` int(0) NULL DEFAULT NULL COMMENT 'Lista de cargos: IDCATALOGOTABLAS=5',
  `CAPITAL_MONETARIO` decimal(15, 2) NULL DEFAULT NULL,
  `ACTIVIDAD_NEGOCIO` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `ESTADO_CONSTITUCION` int(0) NULL DEFAULT NULL COMMENT 'IDTABLA DE TAB_TABLAS',
  `FECHA_INICIO_PROCESO` datetime(0) NULL DEFAULT NULL,
  `FECHA_FIN_PROCESO_ESTIMADA` date NULL DEFAULT NULL,
  `COSTO_BASE_CONSTITUCION` decimal(10, 2) NULL DEFAULT NULL,
  `TIPO_OFERTA` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FECHA_CADUCIDAD_OFERTA` date NULL DEFAULT NULL,
  `STOCK_OFERTA` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDEMPRESA`) USING BTREE,
  INDEX `fk_EMPRESA_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_EMPRESA_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of EMPRESA
-- ----------------------------
INSERT INTO `EMPRESA` VALUES (1, NULL, '2025-06-27 07:52:14', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50000.00, 'Construcción civil y edificaciones', NULL, '2025-01-10 10:00:00', '2025-03-10', 1500.00, 'Estándar', '2025-02-28', 10);
INSERT INTO `EMPRESA` VALUES (2, NULL, '2025-06-27 07:52:14', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25000.00, 'Desarrollo de software y consultoría IT', NULL, '2025-01-15 11:30:00', '2025-04-15', 1200.00, 'Premium', '2025-03-31', 5);
INSERT INTO `EMPRESA` VALUES (3, NULL, '2025-06-27 07:52:14', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30000.00, 'Servicios de transporte y distribución', NULL, '2025-02-01 09:00:00', '2025-05-01', 1300.00, 'Básico', '2025-04-30', 15);
INSERT INTO `EMPRESA` VALUES (4, NULL, '2025-06-27 07:51:52', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100000.00, 'Servicios de consultoría financiera', NULL, '2024-03-01 08:00:00', '2024-05-01', 2000.00, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (5, NULL, '2025-06-27 07:52:14', NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15000.00, 'Venta de productos orgánicos', NULL, '2025-02-10 14:00:00', '2025-04-10', 900.00, 'Estándar', '2025-03-15', 8);
INSERT INTO `EMPRESA` VALUES (6, NULL, '2025-06-27 07:52:14', NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75000.00, 'Marketing digital y publicidad', NULL, '2025-02-15 16:00:00', '2025-05-15', 1600.00, 'Premium', '2025-04-01', 3);
INSERT INTO `EMPRESA` VALUES (7, NULL, '2025-06-27 07:52:14', NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20000.00, 'Desarrollo de software y web', NULL, '2025-03-01 10:00:00', '2025-06-01', 1100.00, 'Básico', '2025-05-31', 12);
INSERT INTO `EMPRESA` VALUES (8, NULL, '2025-06-27 07:51:52', NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60000.00, 'Gestión de proyectos inmobiliarios', NULL, '2024-06-01 11:00:00', '2024-08-01', 1750.00, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (9, NULL, '2025-06-27 07:52:14', NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40000.00, 'Desarrollo de aplicaciones móviles', NULL, '2025-03-05 13:00:00', '2025-07-05', 1400.00, 'Estándar', '2025-06-30', 7);
INSERT INTO `EMPRESA` VALUES (10, NULL, '2025-06-27 07:52:14', NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90000.00, 'Energías renovables', NULL, '2025-03-10 09:30:00', '2025-08-10', 1900.00, 'Premium', '2025-07-15', 4);
INSERT INTO `EMPRESA` VALUES (11, NULL, '2020-08-29 20:25:32', NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (12, NULL, '2020-08-29 20:25:32', NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (13, NULL, '2020-08-29 20:25:32', NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (14, NULL, '2020-08-29 20:25:32', NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (15, NULL, '2020-08-29 20:25:32', NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (16, NULL, '2020-08-29 20:25:32', NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (17, NULL, '2020-08-29 20:25:32', NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (18, NULL, '2020-08-29 20:25:32', NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (19, NULL, '2020-08-29 20:25:32', NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (20, NULL, '2020-08-29 20:25:32', NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (21, NULL, '2020-08-29 20:25:32', NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (22, NULL, '2020-08-29 20:25:32', NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (23, NULL, '2020-08-29 20:25:32', NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (24, NULL, '2020-08-29 20:25:32', NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (25, NULL, '2020-08-29 20:25:32', NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (26, NULL, '2020-08-29 20:25:32', NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (27, NULL, '2020-08-29 20:25:32', NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (28, NULL, '2020-08-29 20:25:32', NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (29, NULL, '2020-08-29 20:25:32', NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (30, NULL, '2020-08-29 20:25:32', NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (31, NULL, '2020-08-29 20:25:32', NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (32, NULL, '2020-08-29 20:25:32', NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (33, NULL, '2020-08-29 20:25:32', NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (34, NULL, '2020-08-29 20:25:32', NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (35, NULL, '2020-08-29 20:25:32', NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (36, NULL, '2020-08-29 20:25:32', NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (37, NULL, '2020-08-29 20:25:32', NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (38, NULL, '2020-08-29 20:25:32', NULL, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (39, NULL, '2020-08-29 20:25:32', NULL, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (40, NULL, '2020-08-29 20:25:32', NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (41, NULL, '2020-08-29 20:25:32', NULL, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (42, NULL, '2020-08-29 20:25:32', NULL, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (43, NULL, '2020-08-29 21:10:11', NULL, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (44, NULL, '2020-08-29 21:20:09', NULL, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (45, NULL, '2020-08-29 21:23:28', NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (46, NULL, '2020-08-29 21:25:40', NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (47, NULL, '2020-08-29 21:28:17', NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `EMPRESA` VALUES (48, NULL, '2020-08-30 21:09:54', NULL, NULL, 559, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for EMPRESA_REQUISITO_CUMPLIDO
-- ----------------------------
DROP TABLE IF EXISTS `EMPRESA_REQUISITO_CUMPLIDO`;
CREATE TABLE `EMPRESA_REQUISITO_CUMPLIDO`  (
  `IDEMPRESA_REQUISITO` int(0) NOT NULL AUTO_INCREMENT,
  `IDEMPRESA` int(0) NOT NULL,
  `IDREQUISITO` int(0) NOT NULL,
  `FECHA_CUMPLIDO` datetime(0) NULL DEFAULT NULL,
  `VALOR_DATO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `URL_DOCUMENTO_ADJUNTO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ESTADO_CUMPLIMIENTO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `OBSERVACIONES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`IDEMPRESA_REQUISITO`) USING BTREE,
  UNIQUE INDEX `IDEMPRESA`(`IDEMPRESA`, `IDREQUISITO`) USING BTREE,
  INDEX `IDREQUISITO`(`IDREQUISITO`) USING BTREE,
  CONSTRAINT `empresa_requisito_cumplido_ibfk_1` FOREIGN KEY (`IDEMPRESA`) REFERENCES `EMPRESA` (`IDEMPRESA`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `empresa_requisito_cumplido_ibfk_2` FOREIGN KEY (`IDREQUISITO`) REFERENCES `REQUISITO` (`IDREQUISITO`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for EMPRESA_SOCIO
-- ----------------------------
DROP TABLE IF EXISTS `EMPRESA_SOCIO`;
CREATE TABLE `EMPRESA_SOCIO`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `IDEMPRESA` int(0) NOT NULL,
  `IDPERSONA` int(0) NOT NULL,
  `APORTE_CAPITAL` decimal(10, 0) NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'IDTABLA DE TAB_TABLAS',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_EMPRESA_has_PERSONA_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  INDEX `fk_EMPRESA_has_PERSONA_EMPRESA1_idx`(`IDEMPRESA`) USING BTREE,
  CONSTRAINT `fk_EMPRESA_has_PERSONA_EMPRESA1` FOREIGN KEY (`IDEMPRESA`) REFERENCES `EMPRESA` (`IDEMPRESA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_EMPRESA_has_PERSONA_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of EMPRESA_SOCIO
-- ----------------------------
INSERT INTO `EMPRESA_SOCIO` VALUES (6, 1, 1, 20000, 1);
INSERT INTO `EMPRESA_SOCIO` VALUES (7, 1, 412, 10000, 1);
INSERT INTO `EMPRESA_SOCIO` VALUES (8, 1, 431, 2400, 1);
INSERT INTO `EMPRESA_SOCIO` VALUES (9, 1, 431, 2400, 1);
INSERT INTO `EMPRESA_SOCIO` VALUES (10, 2, 1, 1000, 1);
INSERT INTO `EMPRESA_SOCIO` VALUES (11, 2, 658, 2000, 1);

-- ----------------------------
-- Table structure for ESTACION_TRABAJO
-- ----------------------------
DROP TABLE IF EXISTS `ESTACION_TRABAJO`;
CREATE TABLE `ESTACION_TRABAJO`  (
  `IDESTACIONTRABAJO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CODIGO` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `OBSERVACION` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IDUNIDADORGANICA` int(0) NOT NULL,
  `IDPERSONAL` int(0) NOT NULL,
  PRIMARY KEY (`IDESTACIONTRABAJO`) USING BTREE,
  INDEX `fk_ESTACION_TRABAJO_UNIDAD_ORGANICA1_idx`(`IDUNIDADORGANICA`) USING BTREE,
  INDEX `fk_ESTACION_TRABAJO_PERSONAL1_idx`(`IDPERSONAL`) USING BTREE,
  CONSTRAINT `fk_ESTACION_TRABAJO_PERSONAL1` FOREIGN KEY (`IDPERSONAL`) REFERENCES `PERSONAL` (`IDPERSONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ESTACION_TRABAJO_UNIDAD_ORGANICA1` FOREIGN KEY (`IDUNIDADORGANICA`) REFERENCES `UNIDAD_ORGANICA` (`IDUNIDADORGANICA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for HISCLAVES
-- ----------------------------
DROP TABLE IF EXISTS `HISCLAVES`;
CREATE TABLE `HISCLAVES`  (
  `IDHISCLAVE` int(0) NOT NULL AUTO_INCREMENT,
  `HASHCLAVE` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDUSUARIO` int(0) NOT NULL,
  `SYSCREACION` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDHISCLAVE`) USING BTREE,
  INDEX `fk_HISCLAVES_USUARIO1_idx`(`IDUSUARIO`) USING BTREE,
  CONSTRAINT `fk_HISCLAVES_USUARIO1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `USUARIO` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for HISTORIACLINICA
-- ----------------------------
DROP TABLE IF EXISTS `HISTORIACLINICA`;
CREATE TABLE `HISTORIACLINICA`  (
  `IDHISTORIACLINICA` int(0) NOT NULL AUTO_INCREMENT,
  `IDPERSONA` int(0) NOT NULL,
  `FECHAREGISTRO` datetime(0) NULL DEFAULT NULL,
  `TIPO_SANGRE` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDHISTORIACLINICA`) USING BTREE,
  INDEX `fk_HISTORIACLINICA_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_HISTORIACLINICA_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for HISTORIAL_EMPRESA_PROCESO
-- ----------------------------
DROP TABLE IF EXISTS `HISTORIAL_EMPRESA_PROCESO`;
CREATE TABLE `HISTORIAL_EMPRESA_PROCESO`  (
  `IDEMPRESA` int(0) NOT NULL,
  `IDPROCESOPASO` int(0) NOT NULL,
  `FECHA_COMPLETADO` datetime(0) NULL DEFAULT NULL,
  `OBSERVACIONES` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'IDTABLA DE TAB_TABLAS HEREDADO DE CATALOGO_TABLAS',
  PRIMARY KEY (`IDEMPRESA`, `IDPROCESOPASO`) USING BTREE,
  INDEX `fk_EMPRESA_has_PROCESO_PASO_PROCESO_PASO1_idx`(`IDPROCESOPASO`) USING BTREE,
  INDEX `fk_EMPRESA_has_PROCESO_PASO_EMPRESA1_idx`(`IDEMPRESA`) USING BTREE,
  CONSTRAINT `fk_EMPRESA_has_PROCESO_PASO_EMPRESA1` FOREIGN KEY (`IDEMPRESA`) REFERENCES `EMPRESA` (`IDEMPRESA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_EMPRESA_has_PROCESO_PASO_PROCESO_PASO1` FOREIGN KEY (`IDPROCESOPASO`) REFERENCES `PROCESO_PASO` (`IDPROCESOPASO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for INSUMO
-- ----------------------------
DROP TABLE IF EXISTS `INSUMO`;
CREATE TABLE `INSUMO`  (
  `IDINSUMO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(245) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(445) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CANTIDAD` decimal(2, 0) NULL DEFAULT NULL,
  `UNIDAD` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'KG, SACO, CAJAS, ETC',
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDEMPRESA` int(0) NOT NULL,
  PRIMARY KEY (`IDINSUMO`) USING BTREE,
  INDEX `fk_INSUMO_EMPRESA1_idx`(`IDEMPRESA`) USING BTREE,
  CONSTRAINT `fk_INSUMO_EMPRESA1` FOREIGN KEY (`IDEMPRESA`) REFERENCES `EMPRESA` (`IDEMPRESA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for LOCAL
-- ----------------------------
DROP TABLE IF EXISTS `LOCAL`;
CREATE TABLE `LOCAL`  (
  `IDLOCAL` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IDEMPRESA` int(0) NOT NULL,
  `IDDIRECCION` int(0) NOT NULL,
  `TIPO_LOCAL` varchar(145) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDLOCAL`) USING BTREE,
  INDEX `fk_LOCAL_DIRECCION1_idx`(`IDDIRECCION`) USING BTREE,
  INDEX `fk_LOCAL_EMPRESA1_idx`(`IDEMPRESA`) USING BTREE,
  CONSTRAINT `fk_LOCAL_DIRECCION1` FOREIGN KEY (`IDDIRECCION`) REFERENCES `DIRECCION` (`IDDIRECCION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_LOCAL_EMPRESA1` FOREIGN KEY (`IDEMPRESA`) REFERENCES `EMPRESA` (`IDEMPRESA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for LOG_CONEXION
-- ----------------------------
DROP TABLE IF EXISTS `LOG_CONEXION`;
CREATE TABLE `LOG_CONEXION`  (
  `IDLOGCONEXION` int(0) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `INFO` varchar(800) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `BATERIA` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IDUSUARIO` int(0) NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT 1,
  `FECHA_CONEXION` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`IDLOGCONEXION`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 194 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of LOG_CONEXION
-- ----------------------------
INSERT INTO `LOG_CONEXION` VALUES (1, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.56,\"isCharging\":false}', NULL, 1, '2024-02-11 21:30:25');
INSERT INTO `LOG_CONEXION` VALUES (2, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.55,\"isCharging\":false}', NULL, 1, '2024-02-11 21:31:24');
INSERT INTO `LOG_CONEXION` VALUES (3, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.53,\"isCharging\":false}', NULL, 1, '2024-02-11 21:34:51');
INSERT INTO `LOG_CONEXION` VALUES (4, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.53,\"isCharging\":false}', NULL, 1, '2024-02-11 21:34:52');
INSERT INTO `LOG_CONEXION` VALUES (5, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.53,\"isCharging\":false}', NULL, 1, '2024-02-11 21:34:52');
INSERT INTO `LOG_CONEXION` VALUES (6, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.53,\"isCharging\":false}', NULL, 1, '2024-02-11 21:34:52');
INSERT INTO `LOG_CONEXION` VALUES (7, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.52,\"isCharging\":false}', NULL, 1, '2024-02-11 21:38:41');
INSERT INTO `LOG_CONEXION` VALUES (8, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.52,\"isCharging\":false}', NULL, 1, '2024-02-11 21:38:41');
INSERT INTO `LOG_CONEXION` VALUES (9, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.52,\"isCharging\":false}', NULL, 1, '2024-02-11 21:38:41');
INSERT INTO `LOG_CONEXION` VALUES (10, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.52,\"isCharging\":false}', NULL, 1, '2024-02-11 21:38:42');
INSERT INTO `LOG_CONEXION` VALUES (11, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.5,\"isCharging\":false}', NULL, 1, '2024-02-11 21:40:29');
INSERT INTO `LOG_CONEXION` VALUES (12, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.5,\"isCharging\":false}', NULL, 1, '2024-02-11 21:40:30');
INSERT INTO `LOG_CONEXION` VALUES (13, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.5,\"isCharging\":false}', NULL, 1, '2024-02-11 21:40:30');
INSERT INTO `LOG_CONEXION` VALUES (14, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.5,\"isCharging\":false}', NULL, 1, '2024-02-11 21:40:31');
INSERT INTO `LOG_CONEXION` VALUES (15, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.5,\"isCharging\":false}', NULL, 1, '2024-02-11 21:41:30');
INSERT INTO `LOG_CONEXION` VALUES (16, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.5,\"isCharging\":false}', NULL, 1, '2024-02-11 21:41:30');
INSERT INTO `LOG_CONEXION` VALUES (17, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.5,\"isCharging\":false}', NULL, 1, '2024-02-11 21:41:30');
INSERT INTO `LOG_CONEXION` VALUES (18, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.5,\"isCharging\":false}', NULL, 1, '2024-02-11 21:41:31');
INSERT INTO `LOG_CONEXION` VALUES (19, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.49,\"isCharging\":false}', NULL, 1, '2024-02-11 21:42:09');
INSERT INTO `LOG_CONEXION` VALUES (20, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.49,\"isCharging\":false}', NULL, 1, '2024-02-11 21:42:14');
INSERT INTO `LOG_CONEXION` VALUES (21, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.49,\"isCharging\":false}', NULL, 1, '2024-02-11 21:42:22');
INSERT INTO `LOG_CONEXION` VALUES (22, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.49,\"isCharging\":false}', NULL, 1, '2024-02-11 21:42:25');
INSERT INTO `LOG_CONEXION` VALUES (23, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.48,\"isCharging\":false}', NULL, 1, '2024-02-11 21:44:20');
INSERT INTO `LOG_CONEXION` VALUES (24, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.48,\"isCharging\":false}', NULL, 1, '2024-02-11 21:44:21');
INSERT INTO `LOG_CONEXION` VALUES (25, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.48,\"isCharging\":false}', NULL, 1, '2024-02-11 21:44:21');
INSERT INTO `LOG_CONEXION` VALUES (26, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.48,\"isCharging\":false}', NULL, 1, '2024-02-11 21:44:21');
INSERT INTO `LOG_CONEXION` VALUES (27, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.45,\"isCharging\":false}', NULL, 1, '2024-02-11 21:48:22');
INSERT INTO `LOG_CONEXION` VALUES (28, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.45,\"isCharging\":false}', NULL, 1, '2024-02-11 21:48:22');
INSERT INTO `LOG_CONEXION` VALUES (29, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.45,\"isCharging\":false}', NULL, 1, '2024-02-11 21:48:23');
INSERT INTO `LOG_CONEXION` VALUES (30, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.45,\"isCharging\":false}', NULL, 1, '2024-02-11 21:48:23');
INSERT INTO `LOG_CONEXION` VALUES (31, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.45,\"isCharging\":false}', NULL, 1, '2024-02-11 21:48:45');
INSERT INTO `LOG_CONEXION` VALUES (32, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.43,\"isCharging\":false}', NULL, 1, '2024-02-11 21:51:12');
INSERT INTO `LOG_CONEXION` VALUES (33, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.43,\"isCharging\":false}', NULL, 1, '2024-02-11 21:51:13');
INSERT INTO `LOG_CONEXION` VALUES (34, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.43,\"isCharging\":false}', NULL, 1, '2024-02-11 21:51:13');
INSERT INTO `LOG_CONEXION` VALUES (35, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.43,\"isCharging\":false}', NULL, 1, '2024-02-11 21:51:13');
INSERT INTO `LOG_CONEXION` VALUES (36, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.43,\"isCharging\":false}', NULL, 1, '2024-02-11 21:51:31');
INSERT INTO `LOG_CONEXION` VALUES (37, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.43,\"isCharging\":false}', NULL, 1, '2024-02-11 21:51:39');
INSERT INTO `LOG_CONEXION` VALUES (38, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.4,\"isCharging\":false}', NULL, 1, '2024-02-11 21:55:40');
INSERT INTO `LOG_CONEXION` VALUES (39, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.4,\"isCharging\":false}', NULL, 1, '2024-02-11 21:55:40');
INSERT INTO `LOG_CONEXION` VALUES (40, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.4,\"isCharging\":false}', NULL, 1, '2024-02-11 21:55:40');
INSERT INTO `LOG_CONEXION` VALUES (41, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.4,\"isCharging\":false}', NULL, 1, '2024-02-11 21:55:41');
INSERT INTO `LOG_CONEXION` VALUES (42, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.4,\"isCharging\":false}', NULL, 1, '2024-02-11 21:55:52');
INSERT INTO `LOG_CONEXION` VALUES (43, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.4,\"isCharging\":false}', NULL, 1, '2024-02-11 21:55:52');
INSERT INTO `LOG_CONEXION` VALUES (44, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.4,\"isCharging\":false}', NULL, 1, '2024-02-11 21:56:15');
INSERT INTO `LOG_CONEXION` VALUES (45, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.36,\"isCharging\":false}', NULL, 1, '2024-02-11 22:02:44');
INSERT INTO `LOG_CONEXION` VALUES (46, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.36,\"isCharging\":false}', NULL, 1, '2024-02-11 22:02:45');
INSERT INTO `LOG_CONEXION` VALUES (47, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.36,\"isCharging\":false}', NULL, 1, '2024-02-11 22:02:45');
INSERT INTO `LOG_CONEXION` VALUES (48, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"iPhone\",\"platform\":\"web\",\"operatingSystem\":\"ios\",\"osVersion\":\"16.6\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false}', '{\"batteryLevel\":0.36,\"isCharging\":false}', NULL, 1, '2024-02-11 22:02:45');
INSERT INTO `LOG_CONEXION` VALUES (49, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.35,\"isCharging\":false}', NULL, 1, '2024-02-11 22:03:04');
INSERT INTO `LOG_CONEXION` VALUES (50, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.98,\"isCharging\":true}', NULL, 1, '2024-02-12 22:37:44');
INSERT INTO `LOG_CONEXION` VALUES (51, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.98,\"isCharging\":true}', NULL, 1, '2024-02-12 22:37:44');
INSERT INTO `LOG_CONEXION` VALUES (52, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.62,\"isCharging\":true}', NULL, 1, '2024-02-13 21:02:47');
INSERT INTO `LOG_CONEXION` VALUES (53, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.62,\"isCharging\":true}', NULL, 1, '2024-02-13 21:02:50');
INSERT INTO `LOG_CONEXION` VALUES (54, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.62,\"isCharging\":true}', NULL, 1, '2024-02-13 21:02:51');
INSERT INTO `LOG_CONEXION` VALUES (55, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:26:39');
INSERT INTO `LOG_CONEXION` VALUES (56, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:26:43');
INSERT INTO `LOG_CONEXION` VALUES (57, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:26:44');
INSERT INTO `LOG_CONEXION` VALUES (58, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:26:44');
INSERT INTO `LOG_CONEXION` VALUES (59, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:27:32');
INSERT INTO `LOG_CONEXION` VALUES (60, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:27:35');
INSERT INTO `LOG_CONEXION` VALUES (61, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:27:37');
INSERT INTO `LOG_CONEXION` VALUES (62, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:27:37');
INSERT INTO `LOG_CONEXION` VALUES (63, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:27:40');
INSERT INTO `LOG_CONEXION` VALUES (64, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:27:40');
INSERT INTO `LOG_CONEXION` VALUES (65, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.83,\"isCharging\":true}', NULL, 1, '2024-02-13 21:27:48');
INSERT INTO `LOG_CONEXION` VALUES (66, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.84,\"isCharging\":true}', NULL, 1, '2024-02-13 21:28:22');
INSERT INTO `LOG_CONEXION` VALUES (67, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.88,\"isCharging\":true}', NULL, 1, '2024-02-13 21:36:01');
INSERT INTO `LOG_CONEXION` VALUES (68, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.88,\"isCharging\":true}', NULL, 1, '2024-02-13 21:36:02');
INSERT INTO `LOG_CONEXION` VALUES (69, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.89,\"isCharging\":true}', NULL, 1, '2024-02-13 21:37:31');
INSERT INTO `LOG_CONEXION` VALUES (70, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.89,\"isCharging\":true}', NULL, 1, '2024-02-13 21:37:31');
INSERT INTO `LOG_CONEXION` VALUES (71, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.91,\"isCharging\":true}', NULL, 1, '2024-02-13 21:41:46');
INSERT INTO `LOG_CONEXION` VALUES (72, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.91,\"isCharging\":true}', NULL, 1, '2024-02-13 21:41:46');
INSERT INTO `LOG_CONEXION` VALUES (73, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.91,\"isCharging\":true}', NULL, 1, '2024-02-13 21:41:55');
INSERT INTO `LOG_CONEXION` VALUES (74, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.91,\"isCharging\":true}', NULL, 1, '2024-02-13 21:41:55');
INSERT INTO `LOG_CONEXION` VALUES (75, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.92,\"isCharging\":true}', NULL, 1, '2024-02-13 21:45:35');
INSERT INTO `LOG_CONEXION` VALUES (76, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.92,\"isCharging\":true}', NULL, 1, '2024-02-13 21:45:36');
INSERT INTO `LOG_CONEXION` VALUES (77, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.93,\"isCharging\":true}', NULL, 1, '2024-02-13 21:46:55');
INSERT INTO `LOG_CONEXION` VALUES (78, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.93,\"isCharging\":true}', NULL, 1, '2024-02-13 21:46:55');
INSERT INTO `LOG_CONEXION` VALUES (79, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.93,\"isCharging\":true}', NULL, 1, '2024-02-13 21:47:05');
INSERT INTO `LOG_CONEXION` VALUES (80, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.97,\"isCharging\":true}', NULL, 1, '2024-02-13 22:03:15');
INSERT INTO `LOG_CONEXION` VALUES (81, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":0.97,\"isCharging\":true}', NULL, 1, '2024-02-13 22:03:16');
INSERT INTO `LOG_CONEXION` VALUES (82, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.97,\"isCharging\":true}', NULL, 1, '2024-02-13 22:03:16');
INSERT INTO `LOG_CONEXION` VALUES (83, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":0.97,\"isCharging\":true}', NULL, 1, '2024-02-13 22:03:16');
INSERT INTO `LOG_CONEXION` VALUES (84, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:29:12');
INSERT INTO `LOG_CONEXION` VALUES (85, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:29:12');
INSERT INTO `LOG_CONEXION` VALUES (86, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:29:12');
INSERT INTO `LOG_CONEXION` VALUES (87, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:29:54');
INSERT INTO `LOG_CONEXION` VALUES (88, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:29:54');
INSERT INTO `LOG_CONEXION` VALUES (89, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:29:54');
INSERT INTO `LOG_CONEXION` VALUES (90, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:32:29');
INSERT INTO `LOG_CONEXION` VALUES (91, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:32:29');
INSERT INTO `LOG_CONEXION` VALUES (92, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:32:29');
INSERT INTO `LOG_CONEXION` VALUES (93, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:36:08');
INSERT INTO `LOG_CONEXION` VALUES (94, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:36:09');
INSERT INTO `LOG_CONEXION` VALUES (95, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:36:09');
INSERT INTO `LOG_CONEXION` VALUES (96, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:36:28');
INSERT INTO `LOG_CONEXION` VALUES (97, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:41:05');
INSERT INTO `LOG_CONEXION` VALUES (98, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:41:06');
INSERT INTO `LOG_CONEXION` VALUES (99, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:41:06');
INSERT INTO `LOG_CONEXION` VALUES (100, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:41:06');
INSERT INTO `LOG_CONEXION` VALUES (101, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:41:18');
INSERT INTO `LOG_CONEXION` VALUES (102, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:43:08');
INSERT INTO `LOG_CONEXION` VALUES (103, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:43:08');
INSERT INTO `LOG_CONEXION` VALUES (104, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:43:08');
INSERT INTO `LOG_CONEXION` VALUES (105, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:43:24');
INSERT INTO `LOG_CONEXION` VALUES (106, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:47:30');
INSERT INTO `LOG_CONEXION` VALUES (107, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:47:30');
INSERT INTO `LOG_CONEXION` VALUES (108, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:47:31');
INSERT INTO `LOG_CONEXION` VALUES (109, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:47:31');
INSERT INTO `LOG_CONEXION` VALUES (110, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:47:42');
INSERT INTO `LOG_CONEXION` VALUES (111, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:49:50');
INSERT INTO `LOG_CONEXION` VALUES (112, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:49:50');
INSERT INTO `LOG_CONEXION` VALUES (113, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:49:50');
INSERT INTO `LOG_CONEXION` VALUES (114, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:52:15');
INSERT INTO `LOG_CONEXION` VALUES (115, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:52:30');
INSERT INTO `LOG_CONEXION` VALUES (116, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:53:35');
INSERT INTO `LOG_CONEXION` VALUES (117, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:53:35');
INSERT INTO `LOG_CONEXION` VALUES (118, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:53:36');
INSERT INTO `LOG_CONEXION` VALUES (119, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:53:36');
INSERT INTO `LOG_CONEXION` VALUES (120, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:53:44');
INSERT INTO `LOG_CONEXION` VALUES (121, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:54:43');
INSERT INTO `LOG_CONEXION` VALUES (122, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:54:43');
INSERT INTO `LOG_CONEXION` VALUES (123, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:54:44');
INSERT INTO `LOG_CONEXION` VALUES (124, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:54:54');
INSERT INTO `LOG_CONEXION` VALUES (125, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:56:35');
INSERT INTO `LOG_CONEXION` VALUES (126, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:56:36');
INSERT INTO `LOG_CONEXION` VALUES (127, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:56:36');
INSERT INTO `LOG_CONEXION` VALUES (128, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:56:36');
INSERT INTO `LOG_CONEXION` VALUES (129, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (130, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (131, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (132, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (133, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (134, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (135, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (136, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (137, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:31');
INSERT INTO `LOG_CONEXION` VALUES (138, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:45');
INSERT INTO `LOG_CONEXION` VALUES (139, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:45');
INSERT INTO `LOG_CONEXION` VALUES (140, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:45');
INSERT INTO `LOG_CONEXION` VALUES (141, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:45');
INSERT INTO `LOG_CONEXION` VALUES (142, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:45');
INSERT INTO `LOG_CONEXION` VALUES (143, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:45');
INSERT INTO `LOG_CONEXION` VALUES (144, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:53');
INSERT INTO `LOG_CONEXION` VALUES (145, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 22:58:53');
INSERT INTO `LOG_CONEXION` VALUES (146, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:01:34');
INSERT INTO `LOG_CONEXION` VALUES (147, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:01:34');
INSERT INTO `LOG_CONEXION` VALUES (148, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:01:43');
INSERT INTO `LOG_CONEXION` VALUES (149, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:01:43');
INSERT INTO `LOG_CONEXION` VALUES (150, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:02:46');
INSERT INTO `LOG_CONEXION` VALUES (151, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:02:46');
INSERT INTO `LOG_CONEXION` VALUES (152, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:02:47');
INSERT INTO `LOG_CONEXION` VALUES (153, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:02:47');
INSERT INTO `LOG_CONEXION` VALUES (154, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:02:47');
INSERT INTO `LOG_CONEXION` VALUES (155, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:02:47');
INSERT INTO `LOG_CONEXION` VALUES (156, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:03:17');
INSERT INTO `LOG_CONEXION` VALUES (157, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:03:17');
INSERT INTO `LOG_CONEXION` VALUES (158, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:03:20');
INSERT INTO `LOG_CONEXION` VALUES (159, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:03:20');
INSERT INTO `LOG_CONEXION` VALUES (160, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:03:20');
INSERT INTO `LOG_CONEXION` VALUES (161, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:03:26');
INSERT INTO `LOG_CONEXION` VALUES (162, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:03:36');
INSERT INTO `LOG_CONEXION` VALUES (163, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:03:36');
INSERT INTO `LOG_CONEXION` VALUES (164, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:04:49');
INSERT INTO `LOG_CONEXION` VALUES (165, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:04:49');
INSERT INTO `LOG_CONEXION` VALUES (166, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:04:58');
INSERT INTO `LOG_CONEXION` VALUES (167, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:04:58');
INSERT INTO `LOG_CONEXION` VALUES (168, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:06:08');
INSERT INTO `LOG_CONEXION` VALUES (169, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:06:08');
INSERT INTO `LOG_CONEXION` VALUES (170, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:06:08');
INSERT INTO `LOG_CONEXION` VALUES (171, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:06:08');
INSERT INTO `LOG_CONEXION` VALUES (172, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:06:08');
INSERT INTO `LOG_CONEXION` VALUES (173, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:06:08');
INSERT INTO `LOG_CONEXION` VALUES (174, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:06:18');
INSERT INTO `LOG_CONEXION` VALUES (175, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:06:18');
INSERT INTO `LOG_CONEXION` VALUES (176, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:11:17');
INSERT INTO `LOG_CONEXION` VALUES (177, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:11:17');
INSERT INTO `LOG_CONEXION` VALUES (178, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:11:17');
INSERT INTO `LOG_CONEXION` VALUES (179, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:11:17');
INSERT INTO `LOG_CONEXION` VALUES (180, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:11:17');
INSERT INTO `LOG_CONEXION` VALUES (181, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"Windows NT 10.0\",\"platform\":\"web\",\"operatingSystem\":\"windows\",\"osVersion\":\"Windows NT 10.0; Win64; x64\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"121.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:11:17');
INSERT INTO `LOG_CONEXION` VALUES (182, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:11:29');
INSERT INTO `LOG_CONEXION` VALUES (183, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:13:26');
INSERT INTO `LOG_CONEXION` VALUES (184, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:13:26');
INSERT INTO `LOG_CONEXION` VALUES (185, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:13:35');
INSERT INTO `LOG_CONEXION` VALUES (186, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:13:35');
INSERT INTO `LOG_CONEXION` VALUES (187, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:14:55');
INSERT INTO `LOG_CONEXION` VALUES (188, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:14:55');
INSERT INTO `LOG_CONEXION` VALUES (189, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:15:09');
INSERT INTO `LOG_CONEXION` VALUES (190, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:18:54');
INSERT INTO `LOG_CONEXION` VALUES (191, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:18:54');
INSERT INTO `LOG_CONEXION` VALUES (192, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:19:03');
INSERT INTO `LOG_CONEXION` VALUES (193, '{\"identifier\":\"3453ea92-9348-4b76-84e5-6275d5bf8c51\"}', '{\"model\":\"SM-G955U\",\"platform\":\"web\",\"operatingSystem\":\"android\",\"osVersion\":\"Android 8.0.0\",\"manufacturer\":\"Google Inc.\",\"isVirtual\":false,\"webViewVersion\":\"116.0.0.0\"}', '{\"batteryLevel\":1,\"isCharging\":true}', NULL, 1, '2024-02-13 23:19:03');

-- ----------------------------
-- Table structure for LOGIN
-- ----------------------------
DROP TABLE IF EXISTS `LOGIN`;
CREATE TABLE `LOGIN`  (
  `IDLOGIN` int(0) NOT NULL AUTO_INCREMENT,
  `ACCESS_TOKEN` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `EXPIRES_IN` int(0) NULL DEFAULT NULL,
  `IAT_IN` int(0) NULL DEFAULT NULL COMMENT 'TIEMPO DE INICIO DE LOGIN',
  `TOKEN_TYPE` char(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `SCOPE` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `REFRESH_TOKEN` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `FECHA_INGRESO` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `ESTADO` int(0) NULL DEFAULT NULL,
  `TIPO_ACCESO` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'FACEBOOK\nGOOGLE\nNORMAL',
  `IDUSUARIO` int(0) NOT NULL,
  `NRO_INGRESOS` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`IDLOGIN`) USING BTREE,
  INDEX `fk_LOGIN_USUARIO1_idx`(`IDUSUARIO`) USING BTREE,
  CONSTRAINT `fk_LOGIN_USUARIO1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `USUARIO` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of LOGIN
-- ----------------------------
INSERT INTO `LOGIN` VALUES (1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDk5MTAyMjgsImV4cCI6MTc1MDEyNjIyOCwidGlwb190b2tlbiI6IkhTMjU2IiwidGlwb19hY2Nlc28iOiJOT1JNQUwiLCJlc3RhZG8iOjEsImRhdGEiOnsiZGF0YSI6eyJJRFVTVUFSSU8iOjEsIlVTVUFSSU8iOiJlY2FsZXJvY0B1bmkucGUiLCJJRFBFUlNPTkEiOjEsIkVTVEFETyI6MTksIkJBSkEiOjE5LCJOUk9JTlRFTlRPUyI6bnVsbCwiVElQT0RPQ1VNRU5UTyI6MSwiTlJPRE9DVU1FTlRPIjoiNDE4MzM4NzQiLCJOT01CUkVTIjoiRURXSU4gS0VOTkVEWSIsIkFQRUxMSURPX1BBVEVSTk8iOiJDQUxFUk8iLCJBUEVMTElET19NQVRFUk5PIjoiQ0hBTU9SUk8iLCJGT1RPIjoiaHR0cDpcL1wvc2xpbTQudHJhYmFqby5lZFwvdXBsb2Fkc1wvQ29udGVuaWRvc1wvSW1hZ2VuZXNcLzIwMjQtMTEtMjRcLzhjNGJmYTBhMDI1ZTFmM2EucG5nIiwiRkVDSEFfTkFDSU1JRU5UTyI6IjE5ODItMDQtMTMiLCJHRU5FUk8iOjMxMSwiY3JlYXRlZF9hdCI6bnVsbCwiVElQT19QRVJTT05BIjoyNH0sInN1Y2Nlc3MiOnRydWUsIm1lc3NhZ2UiOiJMb3MgZGF0b3Mgc2UgbGlzdGFyb24gY29ycmVjdGFtZW50ZSJ9fQ.Cgfvsf6ilskuWRakWQyAU-K0-krN1TMchjNYr-YtXyY', 1750126228, 1749910228, 'HS256', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDMyMTU2NTUsImV4cCI6MTc0MzQzMTY1NSwidGlwb190b2tlbiI6IkhTMjU2IiwidGlwb19hY2Nlc28iOiJOT1JNQUwiLCJlc3RhZG8iOjEsImRhdGEiOnsiZGF0YSI6eyJJRFVTVUFSSU8iOjEsIlVTVUFSSU8iOiJlY2FsZXJvY0B1bmkucGUiLCJJRFBFUlNPTkEiOjEsIkVTVEFETyI6MTksIkJBSkEiOjE5LCJOUk9JTlRFTlRPUyI6bnVsbCwiVElQT0RPQ1VNRU5UTyI6MSwiTlJPRE9DVU1FTlRPIjoiNDE4MzM4NzQiLCJOT01CUkVTIjoiRURXSU4gS0VOTkVEWSIsIkFQRUxMSURPX1BBVEVSTk8iOiJDQUxFUk8iLCJBUEVMTElET19NQVRFUk5PIjoiQ0hBTU9SUk8iLCJGT1RPIjoiaHR0cDpcL1wvc2xpbTQudHJhYmFqby5lZFwvdXBsb2Fkc1wvQ29udGVuaWRvc1wvSW1hZ2VuZXNcLzIwMjQtMTEtMjRcLzhjNGJmYTBhMDI1ZTFmM2EucG5nIiwiRkVDSEFfTkFDSU1JRU5UTyI6IjE5ODItMDQtMTMiLCJHRU5FUk8iOjMxMSwiY3JlYXRlZF9hdCI6bnVsbCwiVElQT19QRVJTT05BIjoyNH0sInN1Y2Nlc3MiOnRydWUsIm1lc3NhZ2UiOiJMb3MgZGF0b3Mgc2UgbGlzdGFyb24gY29ycmVjdGFtZW50ZSJ9fQ.gabDQoIpc_YjfBuUw1hbZSBv8WSUVcb625yplet-j-c', '2025-06-14 09:10:28', 1, 'Normal', 1, 577);
INSERT INTO `LOGIN` VALUES (5, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MzEwNDkxNjEsImV4cCI6MTczMTI2NTE2MSwidGlwb190b2tlbiI6IkhTMjU2IiwidGlwb19hY2Nlc28iOiJOT1JNQUwiLCJlc3RhZG8iOjEsImRhdGEiOnsiZGF0YSI6eyJJRFVTVUFSSU8iOjMwLCJVU1VBUklPIjoiY2Vkd2lua2VubmVkeUBnbWFpbC5jb20iLCJJRFBFUlNPTkEiOjEsIkVTVEFETyI6MTksIkJBSkEiOjE5LCJOUk9JTlRFTlRPUyI6bnVsbCwiVElQT0RPQ1VNRU5UTyI6MSwiTlJPRE9DVU1FTlRPIjoiNDE4MzM4NzQiLCJOT01CUkVTIjoiRURXSU4gS0VOTkVEWSIsIkFQRUxMSURPX1BBVEVSTk8iOiJDQUxFUk8iLCJBUEVMTElET19NQVRFUk5PIjoiQ0hBTU9SUk8iLCJGT1RPIjoiaHR0cDpcL1wvc2xpbTQudHJhYmFqby5lZFwvdXBsb2Fkc1wvQ29udGVuaWRvc1wvSW1hZ2VuZXNcLzIwMjQtMTAtMjVcLzUzZTczYTlmNTFkNzEzYzQucG5nIiwiRkVDSEFfTkFDSU1JRU5UTyI6IjE5ODItMDQtMTMiLCJHRU5FUk8iOjMxMSwiY3JlYXRlZF9hdCI6bnVsbCwiVElQT19QRVJTT05BIjoyNH0sInN1Y2Nlc3MiOnRydWUsIm1lc3NhZ2UiOiJMb3MgZGF0b3Mgc2UgbGlzdGFyb24gY29ycmVjdGFtZW50ZSJ9fQ.TPak1cHMTYdlMKVSVfrZEuJJIC9KFfwZjbT2OwV-UW0', 1731265161, 1731049161, 'HS256', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MzEwMjI3NzcsImV4cCI6MTczMTIzODc3NywidGlwb190b2tlbiI6IkhTMjU2IiwidGlwb19hY2Nlc28iOiJOT1JNQUwiLCJlc3RhZG8iOjEsImRhdGEiOnsiZGF0YSI6eyJJRFVTVUFSSU8iOjMwLCJVU1VBUklPIjoiY2Vkd2lua2VubmVkeUBnbWFpbC5jb20iLCJJRFBFUlNPTkEiOjEsIkVTVEFETyI6MTksIkJBSkEiOjE5LCJOUk9JTlRFTlRPUyI6bnVsbCwiVElQT0RPQ1VNRU5UTyI6MSwiTlJPRE9DVU1FTlRPIjoiNDE4MzM4NzQiLCJOT01CUkVTIjoiRURXSU4gS0VOTkVEWSIsIkFQRUxMSURPX1BBVEVSTk8iOiJDQUxFUk8iLCJBUEVMTElET19NQVRFUk5PIjoiQ0hBTU9SUk8iLCJGT1RPIjoiaHR0cDpcL1wvc2xpbTQudHJhYmFqby5lZFwvdXBsb2Fkc1wvQ29udGVuaWRvc1wvSW1hZ2VuZXNcLzIwMjQtMTAtMjVcLzUzZTczYTlmNTFkNzEzYzQucG5nIiwiRkVDSEFfTkFDSU1JRU5UTyI6IjE5ODItMDQtMTMiLCJHRU5FUk8iOjMxMSwiY3JlYXRlZF9hdCI6bnVsbCwiVElQT19QRVJTT05BIjoyNH0sInN1Y2Nlc3MiOnRydWUsIm1lc3NhZ2UiOiJMb3MgZGF0b3Mgc2UgbGlzdGFyb24gY29ycmVjdGFtZW50ZSJ9fQ.7-a4IugnSjXBucimAwvOSDnLjK_R_FwqOimfnDmRSZs', '2024-11-08 01:59:21', 1, 'NORMAL', 30, 5);
INSERT INTO `LOGIN` VALUES (6, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3Mjk2NDEzODgsImV4cCI6MTcyOTg1NzM4OCwidGlwb190b2tlbiI6IkhTMjU2IiwidGlwb19hY2Nlc28iOiJOT1JNQUwiLCJlc3RhZG8iOjEsImRhdGEiOnsiZGF0YSI6eyJJRFVTVUFSSU8iOjMxLCJVU1VBUklPIjoidW5pZmlpc0Bob3RtYWlsLmNvbSIsIklEUEVSU09OQSI6NTU4LCJFU1RBRE8iOjE5LCJCQUpBIjoxOSwiTlJPSU5URU5UT1MiOm51bGwsIlRJUE9ET0NVTUVOVE8iOjEsIk5ST0RPQ1VNRU5UTyI6IjQxODMzODczIiwiTk9NQlJFUyI6IlBlcmN5IEphdmllciIsIkFQRUxMSURPX1BBVEVSTk8iOiJDcnV6cyIsIkFQRUxMSURPX01BVEVSTk8iOiJNZWppYXMiLCJGT1RPIjpudWxsLCJGRUNIQV9OQUNJTUlFTlRPIjoiMTkwMC0wMS0wMiIsIkdFTkVSTyI6bnVsbCwiRkVDSEFfUkVHSVNUUk8iOiIyMDI0LTA4LTE1IDIxOjA1OjAzIiwiVElQT19QRVJTT05BIjoyNH0sInN1Y2Nlc3MiOnRydWUsIm1lc3NhZ2UiOiJMb3MgZGF0b3Mgc2UgbGlzdGFyb24gY29ycmVjdGFtZW50ZSJ9fQ.YFEUhh0nFB2NHxECIB6O0nHtGlkbSw4oujop4MDgsDk', 1729857388, 1729641388, 'HS256', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3Mjk2NDEwMTksImV4cCI6MTcyOTg1NzAxOSwidGlwb190b2tlbiI6IkhTMjU2IiwidGlwb19hY2Nlc28iOiJOT1JNQUwiLCJlc3RhZG8iOjEsImRhdGEiOnsiZGF0YSI6eyJJRFVTVUFSSU8iOjMxLCJVU1VBUklPIjoidW5pZmlpc0Bob3RtYWlsLmNvbSIsIklEUEVSU09OQSI6NTU4LCJFU1RBRE8iOjE5LCJCQUpBIjoxOSwiTlJPSU5URU5UT1MiOm51bGwsIlRJUE9ET0NVTUVOVE8iOjEsIk5ST0RPQ1VNRU5UTyI6IjQxODMzODczIiwiTk9NQlJFUyI6IlBlcmN5IEphdmllciIsIkFQRUxMSURPX1BBVEVSTk8iOiJDcnV6cyIsIkFQRUxMSURPX01BVEVSTk8iOiJNZWppYXMiLCJGT1RPIjpudWxsLCJGRUNIQV9OQUNJTUlFTlRPIjoiMTkwMC0wMS0wMiIsIkdFTkVSTyI6bnVsbCwiRkVDSEFfUkVHSVNUUk8iOiIyMDI0LTA4LTE1IDIxOjA1OjAzIiwiVElQT19QRVJTT05BIjoyNH0sInN1Y2Nlc3MiOnRydWUsIm1lc3NhZ2UiOiJMb3MgZGF0b3Mgc2UgbGlzdGFyb24gY29ycmVjdGFtZW50ZSJ9fQ.4YhQmVpdxWyJYX_j6OBUGF67Ez2wjicqVdMvaQzr3Dk', '2024-10-22 18:56:28', 1, 'NORMAL', 31, 2);
INSERT INTO `LOGIN` VALUES (7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MzExMDM2NTgsImV4cCI6MTczMTMxOTY1OCwidGlwb190b2tlbiI6IkhTMjU2IiwidGlwb19hY2Nlc28iOiJOT1JNQUwiLCJlc3RhZG8iOjEsImRhdGEiOnsiZGF0YSI6eyJJRFVTVUFSSU8iOjMyLCJVU1VBUklPIjoibGNvcmRvdmFjMDZAZ21haWwuY29tIiwiSURQRVJTT05BIjo2NTgsIkVTVEFETyI6MTksIkJBSkEiOjE5LCJOUk9JTlRFTlRPUyI6bnVsbCwiVElQT0RPQ1VNRU5UTyI6MSwiTlJPRE9DVU1FTlRPIjoiMzI5NzIwMDMiLCJOT01CUkVTIjoiTHV6IE5lbGx5IiwiQVBFTExJRE9fUEFURVJOTyI6IkNvcmRvdmEiLCJBUEVMTElET19NQVRFUk5PIjoiQ29uc3RhbnRpbm8iLCJGT1RPIjoiaHR0cDpcL1wvc2xpbTQudHJhYmFqby5lZFwvdXBsb2Fkc1wvQ29udGVuaWRvc1wvSW1hZ2VuZXNcLzIwMjQtMTEtMDhcLzQ5ZDY0YjM5ZTIxYWFkYTAuanBnIiwiRkVDSEFfTkFDSU1JRU5UTyI6IjE5NzEtMDYtMTgiLCJHRU5FUk8iOjMxMSwiY3JlYXRlZF9hdCI6IjIwMjQtMTAtMjYgMDk6NTY6NDEiLCJUSVBPX1BFUlNPTkEiOjI0fSwic3VjY2VzcyI6dHJ1ZSwibWVzc2FnZSI6IkxvcyBkYXRvcyBzZSBsaXN0YXJvbiBjb3JyZWN0YW1lbnRlIn19.dt3lQjMNYRy4zZBvS6ZAJveYPrijEv8lal0UGdVTIhM', 1731319658, 1731103658, 'HS256', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MzExMDM0MDYsImV4cCI6MTczMTMxOTQwNiwidGlwb190b2tlbiI6IkhTMjU2IiwidGlwb19hY2Nlc28iOiJOT1JNQUwiLCJlc3RhZG8iOjEsImRhdGEiOnsiZGF0YSI6eyJJRFVTVUFSSU8iOjMyLCJVU1VBUklPIjoibGNvcmRvdmFjMDZAZ21haWwuY29tIiwiSURQRVJTT05BIjo2NTgsIkVTVEFETyI6MTksIkJBSkEiOjE5LCJOUk9JTlRFTlRPUyI6bnVsbCwiVElQT0RPQ1VNRU5UTyI6MSwiTlJPRE9DVU1FTlRPIjoiMzI5NzIwMDMiLCJOT01CUkVTIjoiTHV6IE5lbGx5IiwiQVBFTExJRE9fUEFURVJOTyI6IkNvcmRvdmEiLCJBUEVMTElET19NQVRFUk5PIjoiQ29uc3RhbnRpbm8iLCJGT1RPIjoiaHR0cDpcL1wvc2xpbTQudHJhYmFqby5lZFwvdXBsb2Fkc1wvQ29udGVuaWRvc1wvSW1hZ2VuZXNcLzIwMjQtMTEtMDhcLzQ5ZDY0YjM5ZTIxYWFkYTAuanBnIiwiRkVDSEFfTkFDSU1JRU5UTyI6IjE5NzEtMDYtMTgiLCJHRU5FUk8iOjMxMSwiY3JlYXRlZF9hdCI6IjIwMjQtMTAtMjYgMDk6NTY6NDEiLCJUSVBPX1BFUlNPTkEiOjI0fSwic3VjY2VzcyI6dHJ1ZSwibWVzc2FnZSI6IkxvcyBkYXRvcyBzZSBsaXN0YXJvbiBjb3JyZWN0YW1lbnRlIn19.dflO9_8zRTym5AQ96mGpwn6v6w6uYDxov0lvENPzRoQ', '2024-11-08 17:07:38', 1, 'NORMAL', 32, 9);
INSERT INTO `LOGIN` VALUES (8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NTMwNzMwLCJpYXQiOjE3NDk1MzA2NzAsImp0aSI6IjY1ODUzYTg4Yzc0NzQ3OTU4ODQ4YmJmYjcyNjJlZTNhIiwidXNlcl9pZCI6MX0.rAVRdiPLO86EFJ96LXWVNzELVX0zFvPxmplZFQ4XPIg', 1749617070, 1749530670, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTYxNzA3MCwiaWF0IjoxNzQ5NTMwNjcwLCJqdGkiOiI4YTQ4NTRhYmNmZDk0NTM1YTJlMTIyNmZlNjhlOWQ3MyIsInVzZXJfaWQiOjF9.QbUxnt1LLbuUen3pIQwhh0aUP-QWRDCNoq4h7ccty3g', '2025-06-10 04:44:30', 1, 'NORMAL', 1, 2);
INSERT INTO `LOGIN` VALUES (9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NTMwODg5LCJpYXQiOjE3NDk1MzA4MjksImp0aSI6IjE1NjAwMzhhYzU3NzRjZDI4Yjg1ZjhjMWJkZjQ3ODEzIiwidXNlcl9pZCI6MX0.fFuioSHY7FiZWBkKSyb8gdYc69ylSQGduwerbkEsqj8', 1749617229, 1749530829, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTYxNzIyOSwiaWF0IjoxNzQ5NTMwODI5LCJqdGkiOiJlZmQxYzMzZmQ5ZDI0NDk3OTgyYWY0YjEyZWIwYjg1MCIsInVzZXJfaWQiOjF9.nUvBtXotCC1k0fqrrIEqoKWukE1-Fob0nZmptdpcPJs', '2025-06-10 04:47:09', 1, 'NORMAL', 1, 3);
INSERT INTO `LOGIN` VALUES (10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NTMxMDA5LCJpYXQiOjE3NDk1MzA5NDksImp0aSI6IjM5OGFiYTU2MGZiZjQ2ODhhMDAwN2NjOGViMDQ3MTY0IiwidXNlcl9pZCI6MX0.SnR58WCKYdykRFY3uQTpiW_o5DYRE5iUBtGGHx4igWY', 1749617349, 1749530949, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTYxNzM0OSwiaWF0IjoxNzQ5NTMwOTQ5LCJqdGkiOiI1YWQ4ZDEzZmIyNzA0NDJjOTBjNzc1ZWMwZjRiN2M3MyIsInVzZXJfaWQiOjF9.7VFqhAA0g0PbDkHuV_baNi3pUQ0JV43-1l-dFxyQ2Mg', '2025-06-10 04:49:10', 1, 'NORMAL', 1, 4);
INSERT INTO `LOGIN` VALUES (11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjMwODQwLCJpYXQiOjE3NDk2MzA3ODAsImp0aSI6IjViMmRmN2JmYjQ4MDQzYmJiYjA4NjkwZTIyYjk4M2Y4IiwidXNlcl9pZCI6MX0.UKhNywO9UK-n6tzlCyEhWyxu0kQkAHhPjH7plJ0BY_Q', 1749717180, 1749630780, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTcxNzE4MCwiaWF0IjoxNzQ5NjMwNzgwLCJqdGkiOiIxZTVlODNjMWRkOWQ0YjQxOWVhODQ1ZDliM2NjMTQwNiIsInVzZXJfaWQiOjF9.AHe4JMijSz3JFE8cV8i_w2ZHB3iErMkVVdE0BIXE71Q', '2025-06-11 08:33:01', 1, 'NORMAL', 1, 5);
INSERT INTO `LOGIN` VALUES (12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjMxNDQ2LCJpYXQiOjE3NDk2MzEzODYsImp0aSI6Ijc4NTBlZTJlZDAyOTQ3MmE4NWU4NjkzM2U2ZjdhMzZjIiwidXNlcl9pZCI6MX0.iXGjZbpE4bwvnOg8DlWOvyvNyFDVWg6ybq5003fRWjo', 1749717786, 1749631386, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTcxNzc4NiwiaWF0IjoxNzQ5NjMxMzg2LCJqdGkiOiI0NWI0NGM0NTFlZjU0YTAyOTI3ZWU0YjA4MzVlNmI2YiIsInVzZXJfaWQiOjF9._EGsBIIgcRgDudD7SbwcCHzE8Dn3lmggl5T1dpASUS0', '2025-06-11 08:43:07', 1, 'NORMAL', 1, 6);
INSERT INTO `LOGIN` VALUES (13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjMzMTE1LCJpYXQiOjE3NDk2MzMwNTUsImp0aSI6IjU0YTkyY2RhODFiNTRhMTZiNGY0ZmEzOTI1MDZiM2YxIiwidXNlcl9pZCI6MX0.7P1beB9DEizD5bOK354oI8T6A5my7QBDDhzKrq66OrE', 1749719455, 1749633055, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTcxOTQ1NSwiaWF0IjoxNzQ5NjMzMDU1LCJqdGkiOiJlZmJiMmM4NDIxMWU0YTA2YTNiOTc0MmY2ZjE0MTNhZCIsInVzZXJfaWQiOjF9.Umil9s1I8giRTOdGmIXdflizS24w2zeTE5FNaRY_OOA', '2025-06-11 09:10:56', 1, 'NORMAL', 1, 7);
INSERT INTO `LOGIN` VALUES (14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkyMzYzLCJpYXQiOjE3NDk2OTIzMDMsImp0aSI6ImNiMTE2MGI4YWRkNTQzZTliZDE1YTRiNmE2YWMwODdiIiwidXNlcl9pZCI6MX0.WiXDUC_OPRyxAMWHZRC-zd_2-68PffuLNgEoL9BXTIs', 1749778703, 1749692303, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3ODcwMywiaWF0IjoxNzQ5NjkyMzAzLCJqdGkiOiIzODQ3NGYwODg2NTM0YTgxYWI1YWMzMzBjYTNiNDZhOSIsInVzZXJfaWQiOjF9.bbzPJ3Fgw_cWvBWREgRs8nb0Mv_WTtcyTTDRb7VGblA', '2025-06-11 20:38:24', 1, 'NORMAL', 1, 8);
INSERT INTO `LOGIN` VALUES (15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkyNTI1LCJpYXQiOjE3NDk2OTI0NjUsImp0aSI6IjZmY2NmZGY0YTc4NzQ5ZDM5NjZjZGU5OWZhNmEwMTYwIiwidXNlcl9pZCI6MX0.xEefV_p6yPTp06ca-ii22nBBO1iwhT6B4bBYi3BEi9o', 1749778865, 1749692465, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3ODg2NSwiaWF0IjoxNzQ5NjkyNDY1LCJqdGkiOiIxNWYzOTQwZTg4NzU0OTIyOTAwYTAzYTEzZTMyNWFmMSIsInVzZXJfaWQiOjF9.y02LIwJtvJdPh9PRYiCFMVxiGAmAU-5pv8PPiukBlHQ', '2025-06-11 20:41:05', 1, 'NORMAL', 1, 9);
INSERT INTO `LOGIN` VALUES (16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkyNjc3LCJpYXQiOjE3NDk2OTI2MTcsImp0aSI6IjdlMGU1NTYyYmU3NjQ3OWQ5ODY1MjMzNGU4NDE3OTMwIiwidXNlcl9pZCI6MX0.cK72BkyAp_leC6P2ooNcbiN2yoAghGF9wgObq5QbjTI', 1749779017, 1749692617, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3OTAxNywiaWF0IjoxNzQ5NjkyNjE3LCJqdGkiOiIxMmJhZTk1NmNjMjA0MjZlODIwNjgyYjVmZTA1NzVkYyIsInVzZXJfaWQiOjF9.Rnhx_1wyGCXuK8R0ggEY3dDzpXPv6FjRM-EiT1W8gY0', '2025-06-11 20:43:37', 1, 'NORMAL', 1, 10);
INSERT INTO `LOGIN` VALUES (17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkyODUzLCJpYXQiOjE3NDk2OTI3OTMsImp0aSI6IjFjZGI0Yzk5NzRiOTRkNzBiYWQyYzVhMDc1Mzg2MmNlIiwidXNlcl9pZCI6MX0.P3vHFYOZyr2rWuuaGWB9kk_3BzQUsQBbUFGkvdROA50', 1749779193, 1749692793, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3OTE5MywiaWF0IjoxNzQ5NjkyNzkzLCJqdGkiOiJjNzQ1Y2I2NzNmMzU0ZGQ2YWQxNDA4NGM4MThlZjFmZCIsInVzZXJfaWQiOjF9.jV1-PfwMwZFjU_AJ5D06YYASe8FhU1wPgng76hkYVl8', '2025-06-11 20:46:34', 1, 'NORMAL', 1, 11);
INSERT INTO `LOGIN` VALUES (18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkyOTA0LCJpYXQiOjE3NDk2OTI4NDQsImp0aSI6IjU1YTQzMmVmMzc0NTQ1NGJiODVjZGIxZTIzZjQ2YWJmIiwidXNlcl9pZCI6MX0.QiKdmCb-0D_K4OJh5rZ0m-lxCqP3LhFNS0FyIvPi7oc', 1749779244, 1749692844, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3OTI0NCwiaWF0IjoxNzQ5NjkyODQ0LCJqdGkiOiI3YWVlMTQ0MzRlMDI0MWY5YWMzNWVjNTYwNDI3NTQ1NyIsInVzZXJfaWQiOjF9.aUrKavmmIxKmtk8npIywzCXHYGlz1WuBm7i9VDL-EAA', '2025-06-11 20:47:25', 1, 'NORMAL', 1, 12);
INSERT INTO `LOGIN` VALUES (19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkyOTQ5LCJpYXQiOjE3NDk2OTI4ODksImp0aSI6IjQ4MWQ3NGUxNWYyYjQzZjc5OGMwYmJmYTBkMDBmNWZhIiwidXNlcl9pZCI6MX0.QlT5rt76Wi03JAyryQUYSkStROiFNzAumrX0pdYLdXg', 1749779289, 1749692889, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3OTI4OSwiaWF0IjoxNzQ5NjkyODg5LCJqdGkiOiJiYTBhNDI2ZTI0NWM0MjY3YWNlY2JjZDY4ZDg0NTRkMCIsInVzZXJfaWQiOjF9.F8luWE12cc9WGdAKguIS1wgyYS86aqSG7oNFRY5lXis', '2025-06-11 20:48:09', 1, 'NORMAL', 1, 13);
INSERT INTO `LOGIN` VALUES (20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkzMDI2LCJpYXQiOjE3NDk2OTI5NjYsImp0aSI6IjExYmNhMDliODk4MzQxYTU4ODgwZmQ4NzVmYzhiN2FjIiwidXNlcl9pZCI6MX0.Ckx1MVZ44zLCY2DkZNsHOXYvRBtFtkrnU2Mzc33sM-A', 1749779366, 1749692966, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3OTM2NiwiaWF0IjoxNzQ5NjkyOTY2LCJqdGkiOiI0NjllMGFjODc0ZjM0OWQxYmM4NjVhZjU3NjNlM2RlNCIsInVzZXJfaWQiOjF9.C97day7QCQxT_ClI7ixCgEV4vH4c1Q-8KD17oDSuMWM', '2025-06-11 20:49:27', 1, 'NORMAL', 1, 14);
INSERT INTO `LOGIN` VALUES (21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkzMTcwLCJpYXQiOjE3NDk2OTMxMTAsImp0aSI6IjFjM2E5MzI5YjA5OTRlMzZhMWUyNDZiYWU5N2FlMmQxIiwidXNlcl9pZCI6MX0.qg8CiSshnDhKebaC8F8AOWG0UoPzM5MIyaifgz0IOkQ', 1749779510, 1749693110, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3OTUxMCwiaWF0IjoxNzQ5NjkzMTEwLCJqdGkiOiJhNGVhZWM4Y2I2NzU0ODFmYWRjMGRhYzdkNjgzOTAyNSIsInVzZXJfaWQiOjF9.qS3RgRxVkKIXENu-gR1ErAXdCC4VBpRAXLfHvswjh8Q', '2025-06-11 20:51:51', 1, 'NORMAL', 1, 15);
INSERT INTO `LOGIN` VALUES (22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkzMjM3LCJpYXQiOjE3NDk2OTMxNzcsImp0aSI6IjBjZTA4ZDQxNjllNzQ0YTk4NmM4NWM2Njc3OGJhNGMwIiwidXNlcl9pZCI6MX0.nYFhNju7CO0X8i5Awk_A2GeBPEldfHw9mDj14a6utHw', 1749779577, 1749693177, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3OTU3NywiaWF0IjoxNzQ5NjkzMTc3LCJqdGkiOiJkODI1NTcxYzU3ZWQ0NjI1YTJmYjQwOTg4MTk0MWZjMSIsInVzZXJfaWQiOjF9.8I_a-rKpJpRshUXdbsJTzPYuvBLlGz0dCKg4fDgePAk', '2025-06-11 20:52:58', 1, 'NORMAL', 1, 16);
INSERT INTO `LOGIN` VALUES (23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NjkzODkzLCJpYXQiOjE3NDk2OTMyOTMsImp0aSI6ImY1ZTIyYjU1OTExMjRmMTBiM2IwYTYxYTQwZDZlMGE1IiwidXNlcl9pZCI6MX0.sw694ml6EeLAgum00ksUOBLZuYIqacYzhLbCEtQIJlM', 1749779693, 1749693293, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc3OTY5MywiaWF0IjoxNzQ5NjkzMjkzLCJqdGkiOiI4YWQ0MmQ5OWRmNDg0Y2RlYmJhYTFiZGY3MmU3NDk2ZSIsInVzZXJfaWQiOjF9.J6e2fnna4J06MdLz_0pjc9aarqkjiOw6mGapuTTG3ws', '2025-06-11 20:54:54', 1, 'NORMAL', 1, 17);
INSERT INTO `LOGIN` VALUES (24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5Njk1MzA4LCJpYXQiOjE3NDk2OTQ3MDgsImp0aSI6IjM5OWUzZTBjZTM5MTQ3ZTJiMTUzYzAyZDgwMDQ0ZjcxIiwidXNlcl9pZCI6MX0.kMQc6CHf7vB0_bFY9lcUQANUQ80eO4ouIY-gndyQceM', 1749781108, 1749694708, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTc4MTEwOCwiaWF0IjoxNzQ5Njk0NzA4LCJqdGkiOiI0ZDQ5OGJmMjVmZjU0YzJjYjg5Yjk5NTFjZTgxMTgxZSIsInVzZXJfaWQiOjF9.cR3X6vpnbmWZ8dPJICN4LT8b0Rd02THW6msOhmdhczI', '2025-06-11 21:18:29', 1, 'NORMAL', 1, 18);
INSERT INTO `LOGIN` VALUES (25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5Nzg5MzM3LCJpYXQiOjE3NDk3ODkzMDcsImp0aSI6ImMyYmQxZWI0MDZkNjQ1NGY4ODk2Y2IzYjVlZWMyYjkwIiwidXNlcl9pZCI6MX0.wraSguT7pLXPtpl3673yJxsuKoSwY1e5_CU5dY2BypI', 1749875707, 1749789307, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTg3NTcwNywiaWF0IjoxNzQ5Nzg5MzA3LCJqdGkiOiJjNjdiMjZiMzg1YTA0YWQ2YjgwZDc4MWI4YzRiOTY1ZSIsInVzZXJfaWQiOjF9.Nk3eY6rO9Swzfg44w6eI5BbdiizzhaxrVK0VzGhEJcg', '2025-06-12 23:35:08', 1, 'NORMAL', 1, 19);
INSERT INTO `LOGIN` VALUES (26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5Nzg5NTgwLCJpYXQiOjE3NDk3ODk1NTAsImp0aSI6ImYyNTZmODQ5MWFlNjQ3NzU5YWMyNTcxMDRjNTlhMmE3IiwidXNlcl9pZCI6MX0.XBWAeL9OVdZw4Bi1zo3GPbvedILmJrdOT9hfE-hCTD8', 1749875950, 1749789550, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTg3NTk1MCwiaWF0IjoxNzQ5Nzg5NTUwLCJqdGkiOiJhODM0YTc0NzMzNmQ0YWQ0OWY5NGEyZGRmY2FlMzFhMCIsInVzZXJfaWQiOjF9.P4vbMQjH80rxQmSLdMPIeVr_fn8nfEk1OW0tx_SDrL0', '2025-06-12 23:39:11', 1, 'NORMAL', 1, 20);
INSERT INTO `LOGIN` VALUES (27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5Nzg5NjMxLCJpYXQiOjE3NDk3ODk2MDEsImp0aSI6IjZmMTRkZTJkY2IxMzRlMGVhYzllNjMxNGU0MThlOTI5IiwidXNlcl9pZCI6MX0.juTkC3zCSKiD6-0XcDFBtFw6YfdC5X9757Bc52W2i6w', 1749876001, 1749789601, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTg3NjAwMSwiaWF0IjoxNzQ5Nzg5NjAxLCJqdGkiOiI5NTQ4MWQ5NTk5YjI0ZjdjYjY2MGZjYWRjMDI1ZjI0ZCIsInVzZXJfaWQiOjF9.MD32FiftTv_z4qvd3NHOHPGFX0jPteIZqCEU4Mid0mE', '2025-06-12 23:40:01', 1, 'NORMAL', 1, 21);
INSERT INTO `LOGIN` VALUES (28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NzkwMjgxLCJpYXQiOjE3NDk3OTAyNTEsImp0aSI6IjNmMDUxZWVmMjg1YjRkN2E4YmI2MWIyNDJmMTViOWZhIiwidXNlcl9pZCI6MX0.-WIZKfWDu05BbQIZAUm6lbJHFE-VQiUEv_ngjZHPSfs', 1749876651, 1749790251, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTg3NjY1MSwiaWF0IjoxNzQ5NzkwMjUxLCJqdGkiOiI0MDgzMTkxOWM0YjM0NzI5YmQ5OTFjZmU3Y2UxZWQ0MCIsInVzZXJfaWQiOjF9.C_bK05AfxX1al3TXUSER0e9kSr12-1b-ytADLbECtxw', '2025-06-12 23:50:51', 1, 'NORMAL', 1, 22);
INSERT INTO `LOGIN` VALUES (29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5Nzk0MDE4LCJpYXQiOjE3NDk3OTIyMTgsImp0aSI6IjNmNjVhYTFlMzljMjRkY2RiMTM3ZWFhMWU4YTU3NmQ5IiwidXNlcl9pZCI6MX0.4uhoS3xzD--94YCkNmg5_eRWF86HklxIZMBVlyKwg3U', 1749878618, 1749792218, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTg3ODYxOCwiaWF0IjoxNzQ5NzkyMjE4LCJqdGkiOiIxZWY5MDNiYTFmOTg0MWIxYTFmNmM5NmY4NDRjOTE1YiIsInVzZXJfaWQiOjF9.qesAItgTfI5oiLVSlyfCCUDwpatA--0iQUg42u7fMjo', '2025-06-13 00:23:39', 1, 'NORMAL', 1, 23);
INSERT INTO `LOGIN` VALUES (30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5Nzk5MjExLCJpYXQiOjE3NDk3OTc0MTEsImp0aSI6ImVjYzlkYWM5YWE1NjRkMTZiY2ZlMTBlZDRhNmU4MTViIiwidXNlcl9pZCI6NDd9.xwxWfDMmWfWUiosAJuVMf9GgILaqqsQVTIzCUHJvtqQ', 1749883811, 1749797411, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTg4MzgxMSwiaWF0IjoxNzQ5Nzk3NDExLCJqdGkiOiI2MzVkNThjZmY2YzI0YjFiOGZhN2Q0Y2UwYzU4ZmU4ZCIsInVzZXJfaWQiOjQ3fQ.B3KT1qMh-Rkx7sThKL1Daj6MMWFanOJMOHG3hutd33k', '2025-06-13 01:50:12', 1, 'NORMAL', 47, 1);
INSERT INTO `LOGIN` VALUES (31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODI5MzAwLCJpYXQiOjE3NDk4Mjc1MDAsImp0aSI6IjY3ZGQzN2RlY2EwYjRhOTlhYmFiZGQ5OTA1ZDYwMGM0IiwidXNlcl9pZCI6NDh9.q7gIFrCR-qtBithcaglXAU2Li7Gs8cETNJ9Es9muHcY', 1749913900, 1749827500, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkxMzkwMCwiaWF0IjoxNzQ5ODI3NTAwLCJqdGkiOiJhYjllNGM1ZmZmZmM0OTkwYmYyMDI4YzZmZjZiMTRhNyIsInVzZXJfaWQiOjQ4fQ.G-OrhfJpIk4_tT5XcIj-QzUH34IQYJ51GP9Bg5ksXpI', '2025-06-13 10:11:41', 1, 'NORMAL', 48, 1);
INSERT INTO `LOGIN` VALUES (32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MDA1LCJpYXQiOjE3NDk4MzUyMDUsImp0aSI6IjFiZTJmOWY5OTZiZDRlNzQ4MWQzODA3MGVlZDkzMzhjIiwidXNlcl9pZCI6MX0.9M0oLe6UOIVSVC68bh1BuF5V6dsLMDQ9HL4QcLZE6gs', 1749921605, 1749835205, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTYwNSwiaWF0IjoxNzQ5ODM1MjA1LCJqdGkiOiJlN2U5MGIyYmM5NDc0NTYxYTc5ZTUwZDI1MjI1YjA4YyIsInVzZXJfaWQiOjF9.VP2JaEz3AUq0GYInfZBq59PKYNK4ByvjgcX2sAAcIsQ', '2025-06-13 12:20:05', 1, 'NORMAL', 1, 24);
INSERT INTO `LOGIN` VALUES (33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MDMzLCJpYXQiOjE3NDk4MzUyMzMsImp0aSI6IjgxZjlkMDFjYWFjNDQzYmViYzVkZDk4NTUxMGIyZTk5IiwidXNlcl9pZCI6MX0.S_8yw9h8E4kbOJ_Wf1iBViNhrH0C28DSzYeIbbzX-Cs', 1749921633, 1749835233, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTYzMywiaWF0IjoxNzQ5ODM1MjMzLCJqdGkiOiJhOGEwMzllNTkzY2M0NDExOGQ3ZTMwMzU0NmFjM2QxMCIsInVzZXJfaWQiOjF9.dfWzOFN3bHY-nDQ8vQpW-_rIxisi7fNrvQd-vH9BeFo', '2025-06-13 12:20:33', 1, 'NORMAL', 1, 25);
INSERT INTO `LOGIN` VALUES (34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MDUzLCJpYXQiOjE3NDk4MzUyNTMsImp0aSI6IjY1MGU2N2NiZGIzNDRjNGZiNjJjMTkxZTZkNmFhOGJhIiwidXNlcl9pZCI6MX0.dbW64iqFDRaGvDwMtZcderCp41xIz4JsAQbQuZYixzw', 1749921653, 1749835253, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTY1MywiaWF0IjoxNzQ5ODM1MjUzLCJqdGkiOiI5MWU3MTEwNGJiNGY0MTQ1OTcyM2VlM2I4NmQ2ODcxYSIsInVzZXJfaWQiOjF9.ACPKzOWh0GPbmxNzb6x3If1xoXPq3JoUunwBHmotXSY', '2025-06-13 12:20:53', 1, 'NORMAL', 1, 26);
INSERT INTO `LOGIN` VALUES (35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MDc0LCJpYXQiOjE3NDk4MzUyNzQsImp0aSI6IjI3NmI2ODE3YjcxODQ1ZDg4MDA2ZTc0ZTkwN2M3ZTNkIiwidXNlcl9pZCI6MX0.q2UN15kI7-OnMXQ8-xq1YL0vnL_XlEKE7_nvGTFyhI4', 1749921674, 1749835274, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTY3NCwiaWF0IjoxNzQ5ODM1Mjc0LCJqdGkiOiJlNTRlYzEyOTFkMDU0YjI1ODI2ZjhkZmIxYTU5MzNlMiIsInVzZXJfaWQiOjF9.UAGDBzSQwaJqDvEc1Tig6ZS1gACdjtzI2xCYUYNqg-o', '2025-06-13 12:21:15', 1, 'NORMAL', 1, 27);
INSERT INTO `LOGIN` VALUES (36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MDgxLCJpYXQiOjE3NDk4MzUyODEsImp0aSI6ImEyNDk1NDkyNjNkMzQ3M2U4YTNhZTYwMGRmMjFiNGYwIiwidXNlcl9pZCI6MX0.AV3vF8fyqk6VGOLt83p-hcw0S76xLih2no97zq9ueJo', 1749921681, 1749835281, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTY4MSwiaWF0IjoxNzQ5ODM1MjgxLCJqdGkiOiIwMTI2Y2FjMzU3YzA0NWI4YTRmNWRkMDIyYWVjZTZkNiIsInVzZXJfaWQiOjF9.-1jn2ZR1SBPFG6hkKEIXBbBEysThbpupJK1FYZn6NYM', '2025-06-13 12:21:22', 1, 'NORMAL', 1, 28);
INSERT INTO `LOGIN` VALUES (37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MDg4LCJpYXQiOjE3NDk4MzUyODgsImp0aSI6ImU0NGZjNzMzMmRjNTRhZDQ4MmUxZTAzYjgyMmU1NDNiIiwidXNlcl9pZCI6MX0.eslhZB6bBu5RpACln1CJ8KsbyPak1wYs1fLvLl94GZc', 1749921688, 1749835288, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTY4OCwiaWF0IjoxNzQ5ODM1Mjg4LCJqdGkiOiI2ZTY1YmZmMGMyYjc0MDFmYTc5MmNiMGU3ODRiODMyNCIsInVzZXJfaWQiOjF9.gar7BX9R3nax-sBzvUc6RN28Gn7eI3e8GhWlV2yjRwI', '2025-06-13 12:21:28', 1, 'NORMAL', 1, 29);
INSERT INTO `LOGIN` VALUES (38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MTQ0LCJpYXQiOjE3NDk4MzUzNDQsImp0aSI6IjFlNWNhYjYzOWNjNTQ4Y2I5MmJhZWJmNTYyMDZiZWNkIiwidXNlcl9pZCI6MX0.bIMOwM_9atz4HuIGmu1cbG_4YTeTay2ZBSrwFyUUnbw', 1749921744, 1749835344, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTc0NCwiaWF0IjoxNzQ5ODM1MzQ0LCJqdGkiOiJkODRhMDkxMzgzMzE0Zjk4YjRjNGIzODhiN2MzMTA2MCIsInVzZXJfaWQiOjF9.Wj7QG6oWqDUGSXGJz30qMERjCZYTN6mGzkU6rAI0OXs', '2025-06-13 12:22:24', 1, 'NORMAL', 1, 30);
INSERT INTO `LOGIN` VALUES (39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MjQ2LCJpYXQiOjE3NDk4MzU0NDYsImp0aSI6IjM2MDQ0ZDFhNzhlNjQ2NzdiZjg4ZjM4MGZhNDkyOTRlIiwidXNlcl9pZCI6MX0.iYck3yYtEdJzMA0IimnPlpUud_iXhSeqDCkXAObcenk', 1749921846, 1749835446, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTg0NiwiaWF0IjoxNzQ5ODM1NDQ2LCJqdGkiOiJiMTMwZDkwZGY4ZTM0MzEzOGFlYTgwMDUxNGQzOGU4OCIsInVzZXJfaWQiOjF9.L2Y1kXZ2sHa3alXIaLj-_Rq77o2EssCAkc2AaEXlfwM', '2025-06-13 12:24:07', 1, 'NORMAL', 1, 31);
INSERT INTO `LOGIN` VALUES (40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MjY1LCJpYXQiOjE3NDk4MzU0NjUsImp0aSI6IjA3MDQ3Nzc2YTM5NjQ3ZDFhMDQyNDhhZTIxZDBhYmEyIiwidXNlcl9pZCI6MX0.POUMdLUDSjYQC9Q0Gyd4hB7Gbk4oCIOX5VXp6brg4TA', 1749921865, 1749835465, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTg2NSwiaWF0IjoxNzQ5ODM1NDY1LCJqdGkiOiJmY2EwYjI0NGIyYTA0MzZlOTYyNTA3MDhhYzAzMmUxYiIsInVzZXJfaWQiOjF9.rJd87ZT5v6sM27-he2gWYpj9slwuP6DMlsSreDEArSA', '2025-06-13 12:24:25', 1, 'NORMAL', 1, 32);
INSERT INTO `LOGIN` VALUES (41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3MzYyLCJpYXQiOjE3NDk4MzU1NjIsImp0aSI6ImRmMTYzNjZiNDgxMjQ2ZmNiM2RmMjk1MmE5NmU5ZWUxIiwidXNlcl9pZCI6MX0.GE7JMre4dbzSdAmFu1f25xMefG5ipZVl33n_oKdUJDY', 1749921962, 1749835562, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMTk2MiwiaWF0IjoxNzQ5ODM1NTYyLCJqdGkiOiI1YmFkOGFlOTQxNzE0Y2E5YmYzZTQ2NzY1ZDE2ZjcxOSIsInVzZXJfaWQiOjF9.LTESZk18_Dofg_MD0uESJaNay79SFD_NDX7O4KIoeSU', '2025-06-13 12:26:02', 1, 'NORMAL', 1, 33);
INSERT INTO `LOGIN` VALUES (42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3NTc1LCJpYXQiOjE3NDk4MzU3NzUsImp0aSI6IjI1ODJjMmZiMjEzNDQ4MmE4OGQ1Mzg4Njg4NjJhMTVlIiwidXNlcl9pZCI6MX0.UYpOzheTiSlmnZWfq7-JSMlt6Sq1_2NMBqQQSaHK7NI', 1749922175, 1749835775, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMjE3NSwiaWF0IjoxNzQ5ODM1Nzc1LCJqdGkiOiIyNWJmODFkODcwNGE0YmI1ODA3Mzg4YjU1MTU0OTJlNiIsInVzZXJfaWQiOjF9.OhrdfZ0hgE631QSWPZXMqyPS9oGh1uz-TaD6oTCGYXY', '2025-06-13 12:29:35', 1, 'NORMAL', 1, 34);
INSERT INTO `LOGIN` VALUES (43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3NjY0LCJpYXQiOjE3NDk4MzU4NjQsImp0aSI6ImJhZWIxYmY2Mjc4ZTQ5ODI4ZGYzYzU4YTEyY2I1NDhmIiwidXNlcl9pZCI6MX0.dQDi7vNlWa-S4m853THYwZ9MsBbV4BZi5BUh2PDHvkQ', 1749922264, 1749835864, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMjI2NCwiaWF0IjoxNzQ5ODM1ODY0LCJqdGkiOiI4Njg3NWI1ZjNhNDk0NGI3YmUwYWUzZjA1NWQ5M2IzYyIsInVzZXJfaWQiOjF9.5Ff3ggU3GuaAmvqL4Dc1Zs9D98UlPec8fyZNLy261qY', '2025-06-13 12:31:04', 1, 'NORMAL', 1, 35);
INSERT INTO `LOGIN` VALUES (44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3NzIwLCJpYXQiOjE3NDk4MzU5MjAsImp0aSI6ImVlMWMxNzEzYmQzMTQ2YmM5YmY2OWEyZGJmNmI1ZWI2IiwidXNlcl9pZCI6MX0.ilGWzAuiFxnj86Mfd6YciHbFaRcqGj-xMV83J3j2W1I', 1749922320, 1749835920, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMjMyMCwiaWF0IjoxNzQ5ODM1OTIwLCJqdGkiOiIyODk2NjZkYTQzOTM0YzEzOTg4ZmJkMGFmOGQ3YjAwMiIsInVzZXJfaWQiOjF9.ghPNSQ-Yz4j4WkbyctZcy33Qecgs_A9RJDOSIo8oUbQ', '2025-06-13 12:32:00', 1, 'NORMAL', 1, 36);
INSERT INTO `LOGIN` VALUES (45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3NzkzLCJpYXQiOjE3NDk4MzU5OTMsImp0aSI6IjkwNDhkNjViODQ0YjQ2NTFhMGRhYjlmMTNiZGU5ZTY2IiwidXNlcl9pZCI6MX0._qH1LzE-HhffSCg3FjbnBoBTjKk016bGP-L-CK7qraE', 1749922393, 1749835993, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMjM5MywiaWF0IjoxNzQ5ODM1OTkzLCJqdGkiOiI0MGMwYjMyYWUzMTg0YjA4OGU5YjFkYjQxZTc5MGQ3NyIsInVzZXJfaWQiOjF9.JUHpcoHX4vVPswg-zTRpCgcoQ_h1EnVLwzwvRGW_5Xw', '2025-06-13 12:33:13', 1, 'NORMAL', 1, 37);
INSERT INTO `LOGIN` VALUES (46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3ODY1LCJpYXQiOjE3NDk4MzYwNjUsImp0aSI6IjM0YzIxYWZjMWM1NDRlNmU5N2IyM2ExOWQ2MmUyZDViIiwidXNlcl9pZCI6MX0.h8NayxyQErhwhlMHqY7jRMbAVQBt-RbWJJThQv2OfSg', 1749922465, 1749836065, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMjQ2NSwiaWF0IjoxNzQ5ODM2MDY1LCJqdGkiOiI3ZDhkMTM1MGIyZjg0MWEyYmM2OTUyYTkwMTU2MTM4YyIsInVzZXJfaWQiOjF9.zQWwbCi5y8hC_KQ5Xda89MBZlasdFmDbiePI2mrxDrc', '2025-06-13 12:34:26', 1, 'NORMAL', 1, 38);
INSERT INTO `LOGIN` VALUES (47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODM3OTAyLCJpYXQiOjE3NDk4MzYxMDIsImp0aSI6ImI0ODAxYzZhMzNmZjQ5NDBhMDlkMjZlMDVlNjg3NDYxIiwidXNlcl9pZCI6MX0.JcD1nGfs9F936WW5VteTi3NXnzunsa-6c0vD8b9nLL8', 1749922502, 1749836102, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyMjUwMiwiaWF0IjoxNzQ5ODM2MTAyLCJqdGkiOiJlNWNkM2IwMGUyMjY0NjE5ODNkNjg0MTY4ZjU5YzlmMCIsInVzZXJfaWQiOjF9.UYyYvPWpmM1LiTvYoV7f5yAylv-p6w2dWaK9YPFy3D8', '2025-06-13 12:35:03', 1, 'NORMAL', 1, 39);
INSERT INTO `LOGIN` VALUES (48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQxNzY4LCJpYXQiOjE3NDk4Mzk5NjgsImp0aSI6Ijg2ZTQ5MzljMTBjYjQ4MDU5MDQxMjQ1MTM0ZDJkNDcyIiwidXNlcl9pZCI6MX0.HRIr4yI-3ZvZxCyPuYTcxGy4VieoEj7pbh--FM8sr_4', 1749926368, 1749839968, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyNjM2OCwiaWF0IjoxNzQ5ODM5OTY4LCJqdGkiOiIxMzAwN2U0Y2NlNjg0N2M2OThjZDRlZmE5NWY5MWNlOSIsInVzZXJfaWQiOjF9.ZRNQnQ60cnsrXUiLNEdkwWa0X0UZVx5-raIfAzY87Cs', '2025-06-13 13:39:28', 1, 'NORMAL', 1, 40);
INSERT INTO `LOGIN` VALUES (49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQxODE2LCJpYXQiOjE3NDk4NDAwMTYsImp0aSI6IjFiZjIwNzk0NmQ2NjQ0YjhhNzU2MTc4MDM1NzBjMTBhIiwidXNlcl9pZCI6MX0.mdmeRsypm3EUMECyBYMBv5xxe0YDLNZYDMQwvs20izI', 1749926416, 1749840016, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyNjQxNiwiaWF0IjoxNzQ5ODQwMDE2LCJqdGkiOiI0NGU3ZDE3MjQ4YjM0ZWVjOWZiMWJiMGVjNTUwN2QyNCIsInVzZXJfaWQiOjF9.SssWl5G0adXB-WC203aaHUXIa7P-0Id4jO-OxPGZXgU', '2025-06-13 13:40:17', 1, 'NORMAL', 1, 41);
INSERT INTO `LOGIN` VALUES (50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQyMDA2LCJpYXQiOjE3NDk4NDAyMDYsImp0aSI6IjMwN2FiOTUyMmRhMzQ3NTBiNTdhNzIyNTE2ODczMDcyIiwidXNlcl9pZCI6MX0.0V9BtbJVt_mtR4WbVdCOfAhITE0jFIjSnQ_E-YnMWoo', 1749926606, 1749840206, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyNjYwNiwiaWF0IjoxNzQ5ODQwMjA2LCJqdGkiOiI3MWU2ZGRiYjM0YWE0ODhjYjFhNGIzNzc1MTU4MmUxZiIsInVzZXJfaWQiOjF9.H4sgf3Rq7A54y3TIt31WsAjeQ-EpXrmL1xoZYQ80x_Y', '2025-06-13 13:43:27', 1, 'NORMAL', 1, 42);
INSERT INTO `LOGIN` VALUES (51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ0MTkwLCJpYXQiOjE3NDk4NDIzOTAsImp0aSI6ImYwNjQyYWU1NjYyYTQ5YjNiYmIxYzlkNTk1YzRkNDYwIiwidXNlcl9pZCI6MX0.-RwWizUj6I4zCF4St0JMT54baJzOjW7nPeq2in5QdlM', 1749928790, 1749842390, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyODc5MCwiaWF0IjoxNzQ5ODQyMzkwLCJqdGkiOiIxZWVhNzBjY2E2MWQ0NjMxOGJiOWJiNzNhZmE2YmVkYiIsInVzZXJfaWQiOjF9.98sTaDJfD0R7s94ahDd2qkVyhORGRJj4ZVGdD1gADIs', '2025-06-13 14:19:51', 1, 'NORMAL', 1, 43);
INSERT INTO `LOGIN` VALUES (52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ1MTg4LCJpYXQiOjE3NDk4NDMzODgsImp0aSI6IjYzZDkyOGNhMzBiZTQ5MTk5MmE1MDU1MWI4MmQzNDhiIiwidXNlcl9pZCI6MX0.JXOY2Iyv4YdPGxOSBz8cpHehJym8lxHS31iLd3A0GAA', 1749929788, 1749843388, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyOTc4OCwiaWF0IjoxNzQ5ODQzMzg4LCJqdGkiOiJlMWQ1YmRiNWUyM2I0NWU4OGQyMWQ3ZmMwNTBkZWIyNyIsInVzZXJfaWQiOjF9.rKtxrxJxeDH0lQljepJ7PpY9mMm_E9bC5ZAhcA8jcdk', '2025-06-13 14:36:29', 1, 'NORMAL', 1, 44);
INSERT INTO `LOGIN` VALUES (53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ1MjU2LCJpYXQiOjE3NDk4NDM0NTYsImp0aSI6IjY0Y2Q2MTA0MDM0ZTQ2ZGJhZWI4MmU3ZjYzNTdjYTRjIiwidXNlcl9pZCI6MX0.vfrcfzsVeGNf0QR672QOQ4fkEwG5bLjcIlY4vgC3Tcg', 1749929856, 1749843456, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkyOTg1NiwiaWF0IjoxNzQ5ODQzNDU2LCJqdGkiOiIxNWUwODM0MTAzZjM0NjUyYWVkMjIzN2Q1ODdjZWY2NiIsInVzZXJfaWQiOjF9.RlOFyv9NzNTEvmCpVzejuLa-oIE-ee0GE_kmcrdewuE', '2025-06-13 14:37:37', 1, 'NORMAL', 1, 45);
INSERT INTO `LOGIN` VALUES (54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2MDY3LCJpYXQiOjE3NDk4NDQyNjcsImp0aSI6IjgwZTE4NjA4Y2YzNjQ4MGU5NTZhYWZlMDQzYjNkNWM5IiwidXNlcl9pZCI6MX0.y6VSy2bJSaHHqK-oWvBVdwHGzkIn7FcM54L12_CJkbQ', 1749930667, 1749844267, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMDY2NywiaWF0IjoxNzQ5ODQ0MjY3LCJqdGkiOiIyZWM4ODhkNzdmYjM0ZDllYmVjZDNjYWMzYmExZmZmOSIsInVzZXJfaWQiOjF9.WrHIwfOZ4Q5sYqHXFgLSFzlroSgvkHqoqroEHz_gc4I', '2025-06-13 14:51:08', 1, 'NORMAL', 1, 46);
INSERT INTO `LOGIN` VALUES (55, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2MjA5LCJpYXQiOjE3NDk4NDQ0MDksImp0aSI6ImQwMDQzMDgyYTJiMzQ5YWM4NGQzODJmNTJkYWRjOTkxIiwidXNlcl9pZCI6MX0.sKIR2hBRLd8GN3UNYCg-1ESM108vb0QMRSwrBdQbZ_4', 1749930809, 1749844409, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMDgwOSwiaWF0IjoxNzQ5ODQ0NDA5LCJqdGkiOiI5MWNiYmQ4NzJkMWE0ZTU0OWY4ZDNiOGQ2MzU3ZWM4MiIsInVzZXJfaWQiOjF9.kGT0yDfoLDuaZuQvhfcAnGN6jFx3-xteGpfKM1fB8HI', '2025-06-13 14:53:30', 1, 'NORMAL', 1, 47);
INSERT INTO `LOGIN` VALUES (56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2MjgzLCJpYXQiOjE3NDk4NDQ0ODMsImp0aSI6IjE3YzNlYjQ2N2U0NzRjZTA5Y2NkZmJjN2JiNTk2MzBmIiwidXNlcl9pZCI6MX0.CUKkwOlX_bb6bbtQ2YWllq4VP6KHlZ4ObquPpa44qQc', 1749930883, 1749844483, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMDg4MywiaWF0IjoxNzQ5ODQ0NDgzLCJqdGkiOiI1ZTY0NGNmZGM5MzU0YWRlYmE0ZjE3OGE5ODY0NDc5ZCIsInVzZXJfaWQiOjF9.Y61w8UCPAVEDb4g1Xa5JHSuMpxTdzN3R2oi_1JhXroU', '2025-06-13 14:54:44', 1, 'NORMAL', 1, 48);
INSERT INTO `LOGIN` VALUES (57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2MzI1LCJpYXQiOjE3NDk4NDQ1MjUsImp0aSI6ImZhYzEwNmZiYjJmYzQzMGZiNjhiMjg5OGQwNjBhY2I1IiwidXNlcl9pZCI6MX0.uHyyDPwm-ZTbbFY9jbzTVGZ6nrW30un4KNlbxOKocnY', 1749930925, 1749844525, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMDkyNSwiaWF0IjoxNzQ5ODQ0NTI1LCJqdGkiOiIyMzI4M2M0ZTMxMjg0ZjI2YTYxZDZmOTY1ZDAwODUyMCIsInVzZXJfaWQiOjF9.KJT8fJ_iYlpISI5fSfnKjdvITSbFM4YODm0TsJZpwG0', '2025-06-13 14:55:25', 1, 'NORMAL', 1, 49);
INSERT INTO `LOGIN` VALUES (58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2MzQwLCJpYXQiOjE3NDk4NDQ1NDAsImp0aSI6ImYzODM4ODMwNTU0YjQ0ZTY4YmZlYWY2ZTZmOGRiMzAzIiwidXNlcl9pZCI6MX0.Twb1D_bmQDEO2DKxXx3w7TTVphHwJVCeoxqLX_AAHW4', 1749930940, 1749844540, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMDk0MCwiaWF0IjoxNzQ5ODQ0NTQwLCJqdGkiOiIyZGE3MTAwMDgwZDY0MGE3YmY0NjQwOGExZmI4MTUwZSIsInVzZXJfaWQiOjF9.KwdOgs37kIlwid1-Xwdiso8RklMjDE2cKMjUFvLYazI', '2025-06-13 14:55:41', 1, 'NORMAL', 1, 50);
INSERT INTO `LOGIN` VALUES (59, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2NDg0LCJpYXQiOjE3NDk4NDQ2ODQsImp0aSI6ImJmOTcwMjU5NDIyNzRjZGI4NjhhNjVmOTk3NDI0Y2U4IiwidXNlcl9pZCI6MX0.xbRwcEAwFZXfTH_PIz5tfxjmdoiHHxk6qmPjbqcvzys', 1749931084, 1749844684, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMTA4NCwiaWF0IjoxNzQ5ODQ0Njg0LCJqdGkiOiJmMDlmNGY4NWMwYTE0ZDk4ODE5MTFmMDU2YWQ1NzEyMCIsInVzZXJfaWQiOjF9.QdF5ImtlIbJ6huzMJYesNofZfr2EOSyRXCnMQuiwKp4', '2025-06-13 14:58:04', 1, 'NORMAL', 1, 51);
INSERT INTO `LOGIN` VALUES (60, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2NTAwLCJpYXQiOjE3NDk4NDQ3MDAsImp0aSI6IjAzMjIwMGI1NTQ5ZjQ3YzM4NzM5OTc1MDA5MDQ1NTRkIiwidXNlcl9pZCI6MX0.23BO13FPjFgqy8dBAvjkHBw1lET3UNJg07lnURc8lKM', 1749931100, 1749844700, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMTEwMCwiaWF0IjoxNzQ5ODQ0NzAwLCJqdGkiOiIyZmEzNjgzYmZlN2M0Nzg0OWJmODdkNzVhNWJmNDMyNSIsInVzZXJfaWQiOjF9.GhchHVMUnYkPISiAii4VB6vmvHAPntXfWfgedYi3KPo', '2025-06-13 14:58:20', 1, 'NORMAL', 1, 52);
INSERT INTO `LOGIN` VALUES (61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2NjQwLCJpYXQiOjE3NDk4NDQ4NDAsImp0aSI6ImFkMWE5NWJjNzFmZDQzNWU4MGYzYjEwNzg2ZGU2NjM5IiwidXNlcl9pZCI6MX0.sp8BCHCV-M5EUUM4A_67erLCEfjvzsE8m5vZ8CS2tTY', 1749931240, 1749844840, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMTI0MCwiaWF0IjoxNzQ5ODQ0ODQwLCJqdGkiOiI3NmVlYzMzYjUyYmY0MjI3YjI5N2NjN2FmOWQxMDE2ZSIsInVzZXJfaWQiOjF9.j65DiayaSo-AXN_opOLKZlPV8sc7wCfhZ3qGEpxtgcY', '2025-06-13 15:00:41', 1, 'NORMAL', 1, 53);
INSERT INTO `LOGIN` VALUES (62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2OTAxLCJpYXQiOjE3NDk4NDUxMDEsImp0aSI6ImM4NjI1MzA0Y2IwZjQ1ZjNhYjY5NTAzMDM2Mjg3MThhIiwidXNlcl9pZCI6MX0.kdR-gD4877hxQUgWp62vFSa-q5htHtoWhcPhQfdixqg', 1749931501, 1749845101, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMTUwMSwiaWF0IjoxNzQ5ODQ1MTAxLCJqdGkiOiI3MDMwYzU0NzQ5Yjk0MzU5YTUxZTg1NzgzZGMyYWQ4NiIsInVzZXJfaWQiOjF9.6rQY_i09den7rP6AROcmO-BWGunEcvuTdj-EHdadcgE', '2025-06-13 15:05:01', 1, 'NORMAL', 1, 54);
INSERT INTO `LOGIN` VALUES (63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ2OTYwLCJpYXQiOjE3NDk4NDUxNjAsImp0aSI6IjVhYTI5YTlmNjZjNzRmNzZhZTJmMmIyZmE1NjJmYjBiIiwidXNlcl9pZCI6MX0.mRuFMHByZfsuUp86TzSbRdxoyMVx7yPuA4X6gPfdUBs', 1749931560, 1749845160, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMTU2MCwiaWF0IjoxNzQ5ODQ1MTYwLCJqdGkiOiI3ODVhMDk5ZDBmMDg0MzFhYWRjMGQwNTU3MWNhZGU0ZiIsInVzZXJfaWQiOjF9.olapkPRmPFazgqNrtRa2UVi_B6xj-OUVhucNzzf391Q', '2025-06-13 15:06:01', 1, 'NORMAL', 1, 55);
INSERT INTO `LOGIN` VALUES (64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODQ4NzY0LCJpYXQiOjE3NDk4NDY5NjQsImp0aSI6ImFkMjEzZjdkZmViZDQwZjJiNjZkYzEzZmI2NGEzNTViIiwidXNlcl9pZCI6MX0.GMs8vs4XiPmlFPDb-lC9czRb2W3pfWlVNm5L-n-hlOw', 1749933364, 1749846964, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzMzM2NCwiaWF0IjoxNzQ5ODQ2OTY0LCJqdGkiOiJkMmFmNGE3YWU3Y2U0YzYyYjI4OGY2OTk4NWU2NjhkYSIsInVzZXJfaWQiOjF9.XfEaAD99OtusKntH1dm11qjBBE5L548ZiXs5UJIeJOI', '2025-06-13 15:36:04', 1, 'NORMAL', 1, 56);
INSERT INTO `LOGIN` VALUES (65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODU0MzE3LCJpYXQiOjE3NDk4NTI1MTcsImp0aSI6IjY5NzA5M2QzOWYxMDQ4ZThhZjM4ZjgxZmViYTM2NTE3IiwidXNlcl9pZCI6MX0.CTtNjd5OX09O2Io8vWLyvTm8wRYAfNoSCHi4Kif_sxU', 1749938917, 1749852517, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTkzODkxNywiaWF0IjoxNzQ5ODUyNTE3LCJqdGkiOiI0ZGZmZjE2NGRmMzg0NmIyOWZlY2M2NjMwNjY5MDE3YyIsInVzZXJfaWQiOjF9.QZODLdWOqQhHzXK3UFHbf4aWU6daJ6cy0nzAuComDic', '2025-06-13 17:08:38', 0, 'NORMAL', 1, 57);
INSERT INTO `LOGIN` VALUES (66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODU2MzM2LCJpYXQiOjE3NDk4NTQ1MzYsImp0aSI6IjMzMTVjMGNmMzcyMzQwODM4ZDBiZGUwNDVjZDFkY2Y1IiwidXNlcl9pZCI6MX0.aH_guCbgtq1DVWBH3077w1hYS65CAsjguM4p6hXwT90', 1749940936, 1749854536, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk0MDkzNiwiaWF0IjoxNzQ5ODU0NTM2LCJqdGkiOiI4YjU0OGM4MjVlMWY0YTVlYWRlN2ZmNzAwMWE4ZmNkOSIsInVzZXJfaWQiOjF9.HprZ_88b9dHUbGhy8C47KTFTOD-vinJse0YEr-7JPmM', '2025-06-13 17:42:17', 1, 'NORMAL', 1, 58);
INSERT INTO `LOGIN` VALUES (67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODYzMzg2LCJpYXQiOjE3NDk4NjE1ODYsImp0aSI6Ijc3NmZkMGI1YTAwZjQ1M2E5NWE3NzJlZmY4NmEwOTViIiwidXNlcl9pZCI6MX0.nG-qeryQZLNXqIIjB85SC5gfHXeUJOZ_EgTEmOpdYzM', 1749947986, 1749861586, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk0Nzk4NiwiaWF0IjoxNzQ5ODYxNTg2LCJqdGkiOiI1MWE2N2NkNjdkZDE0Mzk3ODUxZjFlM2YyMWQ5YjJlNiIsInVzZXJfaWQiOjF9.6V2fJldGn7vTbe5RQGPXG_-0bIyqtyGJW5UliOgmX-g', '2025-06-13 19:39:47', 1, 'NORMAL', 1, 59);
INSERT INTO `LOGIN` VALUES (68, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY0NDg4LCJpYXQiOjE3NDk4NjI2ODgsImp0aSI6ImI0NTFiOWI5NjliZjQ0Y2VhZDZkOTE3ZTVlYmU2Y2U5IiwidXNlcl9pZCI6MX0.sVM2BOsPQuh6kxztaJwA6EcB1BkkLXhKgBUMsdDNBDI', 1749949088, 1749862688, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk0OTA4OCwiaWF0IjoxNzQ5ODYyNjg4LCJqdGkiOiIzODFhOTZhMzIwZTQ0ZTkxOTI3NGQ4ZjNkMDI2MjNmYyIsInVzZXJfaWQiOjF9.pV8TH60cIb9S737JTOLsGMUe4fj0O4H8fzRsi38JIyU', '2025-06-13 19:58:08', 0, 'NORMAL', 1, 60);
INSERT INTO `LOGIN` VALUES (69, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY0NTMyLCJpYXQiOjE3NDk4NjI3MzIsImp0aSI6ImM0NzQ1YzBjNjRiMDQ4YzRhNTcxYmZiYjA3N2I3NDA0IiwidXNlcl9pZCI6MX0.6Z5YvtOJyIrubumJtCXU44nU2HZYuw8q0SLYnkRG1Q4', 1749949132, 1749862732, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk0OTEzMiwiaWF0IjoxNzQ5ODYyNzMyLCJqdGkiOiJjZjM4ZTFjOTZjMGI0MDFjODYzNDI4MGM5YzFkNzg4NyIsInVzZXJfaWQiOjF9.oY_1lwDLWyQn6thFE5mLku3wS_wmhj4jqskUu0GWMMo', '2025-06-13 19:58:52', 0, 'NORMAL', 1, 61);
INSERT INTO `LOGIN` VALUES (70, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY0NzYxLCJpYXQiOjE3NDk4NjI5NjEsImp0aSI6ImZjMmViMTJhY2JhODQwZWM5MWY4ZjRlYTMxZjRmZmE0IiwidXNlcl9pZCI6MX0.Mf8F_UG-qiCueV1yVeLiYK0YFzZ5qJNMkOe0t552KhI', 1749949361, 1749862961, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk0OTM2MSwiaWF0IjoxNzQ5ODYyOTYxLCJqdGkiOiI4YzE5NTZmZmE4OGY0MWZhOTE1ODRiNTY5ZDRjM2M1NiIsInVzZXJfaWQiOjF9.ERLXGvtagp9qyPfJGFNdBhwADjVAn8W999_vxqyh_GI', '2025-06-13 20:02:41', 1, 'NORMAL', 1, 62);
INSERT INTO `LOGIN` VALUES (71, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY0OTQyLCJpYXQiOjE3NDk4NjMxNDIsImp0aSI6IjQ2YmRkMzI5MGYxMDQ2NGE5YWVlMmI4Mjk1NjFjYzkzIiwidXNlcl9pZCI6MX0.D5_2YouepPlQG6-kTGAQ41tcbsVda1u62Pi6tKegD-I', 1749949542, 1749863142, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk0OTU0MiwiaWF0IjoxNzQ5ODYzMTQyLCJqdGkiOiJhZmVjZjVhZTk2MWU0ZWQzOGViZTg2M2QwN2YzZWM3MiIsInVzZXJfaWQiOjF9.UC5VDg1zIAhtcZUfh4lZvAQqZMlsmortU038QIumTxc', '2025-06-13 20:05:43', 1, 'NORMAL', 1, 63);
INSERT INTO `LOGIN` VALUES (72, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY1NTIzLCJpYXQiOjE3NDk4NjM3MjMsImp0aSI6ImMzY2E0YWQ3NGY5ZDRkOWNiNGJhYmFkNzRlODcwY2MyIiwidXNlcl9pZCI6MX0.PJ0zderGP_nzfXFSl44HcAGhrWqCJUi-LJCj-r6o94A', 1749950123, 1749863723, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MDEyMywiaWF0IjoxNzQ5ODYzNzIzLCJqdGkiOiJhODIyMzUzNTBlM2Q0N2IzYTdiNjk5MzY5Y2MxMzZiZSIsInVzZXJfaWQiOjF9.Y93UDjACeEz9DmKmexJ720i3dwf763yO_3ukvXXcsS8', '2025-06-13 20:15:24', 1, 'NORMAL', 1, 64);
INSERT INTO `LOGIN` VALUES (73, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY1NTY0LCJpYXQiOjE3NDk4NjM3NjQsImp0aSI6IjQyOWY3OTc0ZDU0ODQyYWY5NmUxY2JhMTFhZWViYTA1IiwidXNlcl9pZCI6MX0._IoWy6PGvOQTJ0QMfDlX-6XW00xWg5pJzHBo6RM_LCI', 1749950164, 1749863764, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MDE2NCwiaWF0IjoxNzQ5ODYzNzY0LCJqdGkiOiIyMzA4ZGVjNTVhNWU0NWVjOTA1YmI4MTQwZWMxNTFlMCIsInVzZXJfaWQiOjF9.FprZGITiKIovfCm0ycHVrvebMn54DSKY8eTTZjaPql0', '2025-06-13 20:16:04', 1, 'NORMAL', 1, 65);
INSERT INTO `LOGIN` VALUES (74, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY1NTY2LCJpYXQiOjE3NDk4NjM3NjYsImp0aSI6ImY4ZmQxMDM5NmJlZDRkZDg5ZmIyNDJhNzkxNjc5NDliIiwidXNlcl9pZCI6MX0.Pklc3gnREZtwf0l7JThZFUKOx_HM67EUfykBDg1-n1E', 1749950166, 1749863766, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MDE2NiwiaWF0IjoxNzQ5ODYzNzY2LCJqdGkiOiIwZGQwNDY4YWRjZTI0ZDkwYmE5ZDU3ZWMwYzJhZjU3NCIsInVzZXJfaWQiOjF9.cxNM41Ph-9m5NGijLhZJhQe2Hhf6Ya7BwbUAkqmOonc', '2025-06-13 20:16:06', 1, 'NORMAL', 1, 66);
INSERT INTO `LOGIN` VALUES (75, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY1NjE0LCJpYXQiOjE3NDk4NjM4MTQsImp0aSI6ImU0ODM3YzZmNWRjZjQwZmY5NDNkODkyNWFlODlkOGNjIiwidXNlcl9pZCI6MX0.Ax-hZ27ij_-dah801oRar8-NY87UiBOemvfAtiw-9ts', 1749950214, 1749863814, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MDIxNCwiaWF0IjoxNzQ5ODYzODE0LCJqdGkiOiI2MmJlOTFjODM4Mzc0NjlmODBkZjgxYTcwOWVlZjVjZiIsInVzZXJfaWQiOjF9.4AK-6qbooX2XSSpm2xDXjNVd6RW-JwUVRU_DkQhvnCA', '2025-06-13 20:16:54', 1, 'NORMAL', 1, 67);
INSERT INTO `LOGIN` VALUES (76, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY1ODUwLCJpYXQiOjE3NDk4NjQwNTAsImp0aSI6ImY1Yjc4M2UwMTIyYTQ3MTRhODg2YzA0ZDQ0NDEyOTcwIiwidXNlcl9pZCI6MX0.vpa8kQtxNxfcGciFhYxz89AY6UzGiJusLkhim_5RnBg', 1749950450, 1749864050, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MDQ1MCwiaWF0IjoxNzQ5ODY0MDUwLCJqdGkiOiJiMjQwOWE1ZTc1MGY0MjJmODM5ZWIyMDAxMTg1N2VmYSIsInVzZXJfaWQiOjF9._Ro_5NBPOPCl1ETdATQ4qzu2LgiL48VgJjXYoIszVv8', '2025-06-13 20:20:51', 0, 'NORMAL', 1, 68);
INSERT INTO `LOGIN` VALUES (77, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY2MTI1LCJpYXQiOjE3NDk4NjQzMjUsImp0aSI6ImY1YjEwOTI3NmFhMzRmYTFhMDA2MjdkZjE4MmI2MTBhIiwidXNlcl9pZCI6MX0.1GqchXXOaogEZjTshNcVXpvMGRXR97cNGI7CPBCevOU', 1749950725, 1749864325, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MDcyNSwiaWF0IjoxNzQ5ODY0MzI1LCJqdGkiOiJlMjEyYzc2MWRiNDU0ODFhYWI1ZDUwNTdkOGIwNWEyZSIsInVzZXJfaWQiOjF9.2IOTvUAMHE58GNJm0zhfbsneEVdDK8HKhdAByYa4YEE', '2025-06-13 20:25:25', 1, 'NORMAL', 1, 69);
INSERT INTO `LOGIN` VALUES (78, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY2MTU0LCJpYXQiOjE3NDk4NjQzNTQsImp0aSI6IjM4ODczNGJhYTIwMTQyMzQ4ZjY5M2MwYzk5OTI5Zjg4IiwidXNlcl9pZCI6MX0.Mf9dKYl6oR7ghxjUzxz8eMFAhBruVyei_1vQn1pcWRM', 1749950754, 1749864354, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MDc1NCwiaWF0IjoxNzQ5ODY0MzU0LCJqdGkiOiJhNWM4M2I1NWY0MTM0NThlOWI3NWZhZDEwYzBiYWU3NyIsInVzZXJfaWQiOjF9.Ei5q8e75-eO8Hpox6wtr2L9yMbZqsd6bf9aoGIIKYXY', '2025-06-13 20:25:54', 0, 'NORMAL', 1, 70);
INSERT INTO `LOGIN` VALUES (79, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY2MjI3LCJpYXQiOjE3NDk4NjQ0MjcsImp0aSI6IjBiOWQ2M2I5ZGQ0ODQ2NTFhOGE5M2I4YjFjOWRjOTA1IiwidXNlcl9pZCI6MX0.eycX2tyaubOB-i6j3B-vjr5L_4x1492yF9JpEMFoqa4', 1749950827, 1749864427, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MDgyNywiaWF0IjoxNzQ5ODY0NDI3LCJqdGkiOiJjNjNmYzNiMDdmMjM0ZjY5OTEwMDhmZDMxMjVkZmQ5ZCIsInVzZXJfaWQiOjF9.8MZsXViIywxcCl4SDGc3CSJ_7L2JD3PYMaX8YYoaWGk', '2025-06-13 20:27:08', 0, 'NORMAL', 1, 71);
INSERT INTO `LOGIN` VALUES (80, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY3MDE3LCJpYXQiOjE3NDk4NjUyMTcsImp0aSI6Ijg0MjIyYmQzYzAzMjRmMWU5NmJlODM1MGI4ZGM5OTBlIiwidXNlcl9pZCI6MX0.eo78si7s9jImFn8e0Qim9zfZhkcR6UpoA4Yd4ZQqUT4', 1749951617, 1749865217, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MTYxNywiaWF0IjoxNzQ5ODY1MjE3LCJqdGkiOiI0NmQ2ZDVmYmZkZTU0ZmQ2OTNiMTMyZWMzNWMwMDdjNiIsInVzZXJfaWQiOjF9.UsFWrTte6TwJXnz0ixvEjyrr7Awkm7qUav0UUgCi2l0', '2025-06-13 20:40:17', 1, 'NORMAL', 1, 72);
INSERT INTO `LOGIN` VALUES (81, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY3MDM2LCJpYXQiOjE3NDk4NjUyMzYsImp0aSI6IjgzY2QyYWQ0YWVjZTQ1MDRhNzJiOTFlZjZlMWZhNWE3IiwidXNlcl9pZCI6MX0.5eIjM6sHKvjlcJr8x6a8TtCxWRfDdsEci7NOdjvePCA', 1749951636, 1749865236, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MTYzNiwiaWF0IjoxNzQ5ODY1MjM2LCJqdGkiOiI0YjM1MTk2ODhiNzk0MzE1OWIxY2VjYWM4YjNlZjJhNiIsInVzZXJfaWQiOjF9.WZvSU5HxymY8sjH7D3Yo_NvXPJ5UxEsF8rREjwe8KFU', '2025-06-13 20:40:37', 1, 'NORMAL', 1, 73);
INSERT INTO `LOGIN` VALUES (82, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY3MDM3LCJpYXQiOjE3NDk4NjUyMzcsImp0aSI6IjBmZDFkMGU2M2MzMDRmM2JiMWU4ODAyZThjMGFjOTNkIiwidXNlcl9pZCI6MX0.irgsrbWPddtsBb0tiuO_g0dZQQwEqGGKSdcqMBaqEKc', 1749951637, 1749865237, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MTYzNywiaWF0IjoxNzQ5ODY1MjM3LCJqdGkiOiIwNWRjYWUxMGEyYjY0ZDcxYWYwNTYyNmNmYjcyNjdjNyIsInVzZXJfaWQiOjF9.yILT7-DJ8Ref7FGT50zzfy988CY7dOep8g0DmNg9fv8', '2025-06-13 20:40:38', 1, 'NORMAL', 1, 74);
INSERT INTO `LOGIN` VALUES (83, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY3MTE2LCJpYXQiOjE3NDk4NjUzMTYsImp0aSI6ImE4Mjc0NjNiYTNkODQzM2RhOTE0NDk3MDlhNTQyOTgwIiwidXNlcl9pZCI6MX0.-iaPEcu4MsaVNPsZS9RZrmkdutoVsgR34BOcZdNJ6ig', 1749951716, 1749865316, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MTcxNiwiaWF0IjoxNzQ5ODY1MzE2LCJqdGkiOiJkZjZkNjQ3ZWVlN2M0ZTZhOWZkMWE2ZDM0NjY1YTUxOCIsInVzZXJfaWQiOjF9.wkk0j_DWLc7Jaf9OQg3e9eGChEsohW8NV8vTlBUPmPQ', '2025-06-13 20:41:57', 0, 'NORMAL', 1, 75);
INSERT INTO `LOGIN` VALUES (84, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY3MTY0LCJpYXQiOjE3NDk4NjUzNjQsImp0aSI6ImY2NWIzNWZlNzI4NzQ5YzE4ZWQwNWFkYTUzODVjNGEzIiwidXNlcl9pZCI6MX0.5gmAsDQN0xcw8ZxIlWg2dXfsOCL4MaSrDjKFyG3qDtQ', 1749951764, 1749865364, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MTc2NCwiaWF0IjoxNzQ5ODY1MzY0LCJqdGkiOiJiZjZlMmY4ZDcwNDI0MThlYjYxYjEzNTgxMjk1YmVhMiIsInVzZXJfaWQiOjF9.j-xrPAgHlUZfVURjoCzCL12SEmZZTUerSJDMAvgI93E', '2025-06-13 20:42:45', 0, 'NORMAL', 1, 76);
INSERT INTO `LOGIN` VALUES (85, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY3MjAzLCJpYXQiOjE3NDk4NjU0MDMsImp0aSI6IjU2MmYwNzJlMTQyZTRkNGI4MWQwMjFkOTc5NGM2YjY1IiwidXNlcl9pZCI6MX0.xiPSHoiXnNHKNFtLJTmshvTLr3zUURIIRnmu6wRSOp8', 1749951803, 1749865403, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MTgwMywiaWF0IjoxNzQ5ODY1NDAzLCJqdGkiOiJlM2E0YmY5NmM3NzM0ZjdkYmY4OTA4MzI2MDg0ODE1NiIsInVzZXJfaWQiOjF9._LDaMKO1zWFNYJ1aHTc10uamnEqbgrxyYU4Fhc8bfWI', '2025-06-13 20:43:23', 0, 'NORMAL', 1, 77);
INSERT INTO `LOGIN` VALUES (86, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY3NTk5LCJpYXQiOjE3NDk4NjU3OTksImp0aSI6IjVhNDlkN2FiODRlYjQ2MWM4ZmJlYWFkMjE3NGJlY2RlIiwidXNlcl9pZCI6MX0.i7z8EXxylsHbKh_3JVtlMop2dXn7ktNJDhZiofN9oks', 1749952199, 1749865799, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MjE5OSwiaWF0IjoxNzQ5ODY1Nzk5LCJqdGkiOiI5MGQ2NWNiYzE5ZTc0ZDM3YjRmMzE1ODhlYmQ0M2IyZSIsInVzZXJfaWQiOjF9.830qZbY-KsiNl8J6Kiz9ThyqOGrQpiCtw4whlcfguO4', '2025-06-13 20:49:59', 0, 'NORMAL', 1, 78);
INSERT INTO `LOGIN` VALUES (87, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODY4NzE3LCJpYXQiOjE3NDk4NjY5MTcsImp0aSI6IjhiOGY2ZmI1OTg1MjRjM2JhNTZiYjA1YjhmMDI4MTVjIiwidXNlcl9pZCI6MX0.F6PZDx9U0s6iKNV7p8JwVe0K00xZJBEkBB1igihXA8Y', 1749953317, 1749866917, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1MzMxNywiaWF0IjoxNzQ5ODY2OTE3LCJqdGkiOiI3NGZhYjQ3ZTcwZjY0MTEyOWZmNTg1N2FmZmRkNjYxOSIsInVzZXJfaWQiOjF9.6VUrJLB0oNtah40Nu4RfdBB1FrrIrrXzyJ3WLdOZf2Q', '2025-06-13 21:08:38', 0, 'NORMAL', 1, 79);
INSERT INTO `LOGIN` VALUES (88, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODczMDc2LCJpYXQiOjE3NDk4NzEyNzYsImp0aSI6IjdmODNmZmUxNTQ1YjRhOTk4MGE4NzY2MjMzZmNlMWE1IiwidXNlcl9pZCI6MX0.hc6pdrd4gN-bSSAaDc00V4Df9FmNtYtDYaJpbiin9xg', 1749957676, 1749871276, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1NzY3NiwiaWF0IjoxNzQ5ODcxMjc2LCJqdGkiOiI1ZWQxZjQ3YWZkMGQ0ZGVjYTFkMTQyZGFiNDFkMWM2ZCIsInVzZXJfaWQiOjF9.E67n8G_CAFalZ58EE9bbnSIwqrNair8ZzxKNF02P4Go', '2025-06-13 22:21:16', 0, 'NORMAL', 1, 80);
INSERT INTO `LOGIN` VALUES (89, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODcxMzQxLCJpYXQiOjE3NDk4NzEzMjMsImp0aSI6ImE2OGIyYjllZTk0MjQyNmRiYWJiOWNlMDM1MTEwOWY2IiwidXNlcl9pZCI6MX0.0mv2qunkYnTJWp8Iq-NBUg-I6zS0N6QBk-21ddftiy4', 1749957723, 1749871323, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1NzcyMywiaWF0IjoxNzQ5ODcxMzIzLCJqdGkiOiI4NDYyYWI0NmU5YWU0NTc5YjQzMDhjYjcyOGQ4Yjg2OCIsInVzZXJfaWQiOjF9.n18CjKZ3hMdifyg4q44gNyXaAjV0rt6BQXxpfVgBXGw', '2025-06-13 22:22:03', 1, 'NORMAL', 1, 81);
INSERT INTO `LOGIN` VALUES (90, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODcxNTM5LCJpYXQiOjE3NDk4NzE1MjEsImp0aSI6IjM0YzJmMWE1Y2M3MTRlZjQ5OTQxMDVmN2YwZGUzNjViIiwidXNlcl9pZCI6MX0.KBuGmB50rhnIZ_E4NqnzQAG5kKxh62FtEM7w6OjBB-g', 1749957921, 1749871521, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1NzkyMSwiaWF0IjoxNzQ5ODcxNTIxLCJqdGkiOiJjZDM0MmU1ZDNlMGI0ZWUxYjNhZWQ1ZmUxNzNjNmU5NiIsInVzZXJfaWQiOjF9.ktkyfcc-KaszjHUdt9nvkYUbeloh9vi6a3P2GwS_krw', '2025-06-13 22:25:22', 1, 'NORMAL', 1, 82);
INSERT INTO `LOGIN` VALUES (91, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODcyNDgxLCJpYXQiOjE3NDk4NzI0NjMsImp0aSI6IjA3MDVkYzFiYWJkZTQ2YmZiYzA2NGIyOWRmODdlMmY1IiwidXNlcl9pZCI6MX0.ZuXnfK0R296PecooZqG6NYt9pZXFBDkToR8T77A-Tno', 1749958863, 1749872463, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1ODg2MywiaWF0IjoxNzQ5ODcyNDYzLCJqdGkiOiIyNWM4ZDAzODkyODU0YmFiYmI4YWM0NDI2Yzk1ZmUyNCIsInVzZXJfaWQiOjF9.5vs3MyYLtccmRYqcnSQdhy5aXFimFGT1eZeQ-mPhuFI', '2025-06-13 22:41:03', 1, 'NORMAL', 1, 83);
INSERT INTO `LOGIN` VALUES (92, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODczMzc4LCJpYXQiOjE3NDk4NzMzNjAsImp0aSI6IjJjY2Q1OWQwMzYyMjQ4YmU5NDE2MDI3MzY4M2MwZjZmIiwidXNlcl9pZCI6MX0.qd4ZScb9nB9CmaN4szYOguaX2FdqXgWrjTUyb4ZAAg8', 1749959760, 1749873360, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk1OTc2MCwiaWF0IjoxNzQ5ODczMzYwLCJqdGkiOiJhNjQ0NWJhZGU5NzA0OTdiODg4Zjg3ZDUwMTQ3MWI4YSIsInVzZXJfaWQiOjF9.rHDLB9M294d34t61zCFiMg65iGpwsVeZGtED9WBwIZ8', '2025-06-13 22:56:00', 1, 'NORMAL', 1, 84);
INSERT INTO `LOGIN` VALUES (93, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODc0NTYwLCJpYXQiOjE3NDk4NzQ1NDIsImp0aSI6IjkxZmI0YTU2NzVhMTQ4MTlhMDk0Yjk0MzJhODc3MWFmIiwidXNlcl9pZCI6MX0.yWIUJGZHQ5Rj2zON51d1kNFnwX8kPTF7pnWoENakffc', 1749960942, 1749874542, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk2MDk0MiwiaWF0IjoxNzQ5ODc0NTQyLCJqdGkiOiJhMzk4MjI4MGQxNjI0MzJmOWQzMmE3OWFhMjY4Mzc5YSIsInVzZXJfaWQiOjF9.zAHJ5LPJQpgwCGlNZDcdGpV0yvS8R3eVQ3Q3ZtmTwP0', '2025-06-13 23:15:42', 0, 'NORMAL', 1, 85);
INSERT INTO `LOGIN` VALUES (94, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODc4NDkyLCJpYXQiOjE3NDk4NzYwOTIsImp0aSI6Ijg1MzhkYThlY2FkYzQ5NDM4ZDNjMmI0NmM2ZTI1ZDdiIiwidXNlcl9pZCI6MX0.wfXSTgiKdWZZB4Ama5Y1UvhZIPC8HNe2VeDh8SP-IW0', 1749962492, 1749876092, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk2MjQ5MiwiaWF0IjoxNzQ5ODc2MDkyLCJqdGkiOiIxMDM3NjQ3NGZlY2U0OWM3OTk5ODZhYWEyM2JhNjUzOCIsInVzZXJfaWQiOjF9.VgTIwEVdxl-QVO_Ge5jcIydwdHvPvskeZIM60Gq2-yM', '2025-06-13 23:41:33', 1, 'NORMAL', 1, 86);
INSERT INTO `LOGIN` VALUES (95, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODgzNjQ2LCJpYXQiOjE3NDk4ODEyNDYsImp0aSI6ImZhZjBiNmE4YTY4ZDQxZTVhYTcwMDEzMzY3MWYxMGFiIiwidXNlcl9pZCI6MX0.jiPQuwjfaBFaPe2UKWUcDFmGapqTaWTM7D4pHlqhUWE', 1749967646, 1749881246, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk2NzY0NiwiaWF0IjoxNzQ5ODgxMjQ2LCJqdGkiOiIyNTM1ZWUwMzQ0NjI0OGVhYTk1NzdkYjM2ZTljYTEzOSIsInVzZXJfaWQiOjF9.-9KcUK7vSqhCMTZMhLsp7kOsPZo7EZ33jedoMA0bk_8', '2025-06-14 01:07:27', 1, 'NORMAL', 1, 87);
INSERT INTO `LOGIN` VALUES (96, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODg0MDE5LCJpYXQiOjE3NDk4ODE2MTksImp0aSI6IjhmODQzY2I1NDM2ZDRhZmRhZmNkYzViZjE5N2FhZGJkIiwidXNlcl9pZCI6MX0.pSPgQGEdR6bUOy_B2O_bNInEO_4-x9BhuOIy552fRJc', 1749968019, 1749881619, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk2ODAxOSwiaWF0IjoxNzQ5ODgxNjE5LCJqdGkiOiIwOGIzNjFhYmVkOWQ0YmNiYWVlZTk5ZjU3OWJkNzRiMSIsInVzZXJfaWQiOjF9.2yzoeGTbV9lWje9AIbKb9lY5KNWEL8q7RDvaAF_Ws1Q', '2025-06-14 01:13:40', 0, 'NORMAL', 1, 88);
INSERT INTO `LOGIN` VALUES (97, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODg5NzAyLCJpYXQiOjE3NDk4ODczMDIsImp0aSI6IjUzMGZlMmI5YzRlMzRlNTRhODkxMGZhMjY3ZWU1MWE2IiwidXNlcl9pZCI6MX0.AxpCQQ6LFpv_9nkObV10XBB8IiEjFplCpsP6lkh0DJ4', 1749973702, 1749887302, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk3MzcwMiwiaWF0IjoxNzQ5ODg3MzAyLCJqdGkiOiJkNjRmOTNjZjEwZDg0YzQ4OTAxZmRjZGNmNjFiY2UzYiIsInVzZXJfaWQiOjF9.925RMR2pz-RsnIqYQ9zSiNysBCgU6VDuyXYYpdcsvo8', '2025-06-14 02:48:23', 0, 'NORMAL', 1, 89);
INSERT INTO `LOGIN` VALUES (98, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5ODkwNjMwLCJpYXQiOjE3NDk4ODgyMzAsImp0aSI6IjJmYTk0OWVlODViZTQ4ZWJiYzg3ZDc4MTc5NjU4YzUyIiwidXNlcl9pZCI6MX0.aSzP3sSV-vL_QSs6rem2EycjmZo3_lvW2xo7LQ4tgoQ', 1749974630, 1749888230, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk3NDYzMCwiaWF0IjoxNzQ5ODg4MjMwLCJqdGkiOiJhYjc3NGU4YTlkMjE0MjljOGNjNGIwZGE1NzJlM2Q2MSIsInVzZXJfaWQiOjF9.ynxiJGd_Fudob608NBZnSaxj1PvpRWIyePoNrxWgfi4', '2025-06-14 03:03:51', 1, 'NORMAL', 1, 90);
INSERT INTO `LOGIN` VALUES (99, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5OTA1NDM1LCJpYXQiOjE3NDk5MDMwMzUsImp0aSI6IjIzNDA3Y2Y0Mzk2NTQxOGY5MjFjYjZkMDdjNjI1YWU2IiwidXNlcl9pZCI6MX0.Dpp7Jkd6nPO_MnHF7z0ROoeyAvUfjzeAdqQtBCCq0cM', 1749989435, 1749903035, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk4OTQzNSwiaWF0IjoxNzQ5OTAzMDM1LCJqdGkiOiIxYTNhNmM2MjcyYmE0NTliYjQyMGI1OWQzMDVmMWViOCIsInVzZXJfaWQiOjF9.P5TZ1_yWiNYTf3LOjMkir_MLGFB3z0Abr36aX0hT7qw', '2025-06-14 07:10:36', 1, 'NORMAL', 1, 91);
INSERT INTO `LOGIN` VALUES (100, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5OTEyODM3LCJpYXQiOjE3NDk5MTA0MzcsImp0aSI6ImM5NDc5ZDMxMmYyNzQ4YjY4ZWE2MDQyZGQ3OTU1Nzk5IiwidXNlcl9pZCI6MX0.6zGNTiRFsc--G0cIReVK7qT8lYs2DZbDMddgJl8UzKI', 1749996837, 1749910437, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0OTk5NjgzNywiaWF0IjoxNzQ5OTEwNDM3LCJqdGkiOiIyYzQ2MTBkNTY3N2E0OTE2YjQ1NDIxNDg2ZDcyZDBlNiIsInVzZXJfaWQiOjF9.IKXAKgW0Miy78iAtb5yMyNRNE5cBThJB7YihR-GQ7HA', '2025-06-14 09:13:58', 1, 'NORMAL', 1, 92);
INSERT INTO `LOGIN` VALUES (101, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5OTEzNjIyLCJpYXQiOjE3NDk5MTM2MDQsImp0aSI6ImNjNjY4MDdiNTkwMTQ0Yjc4OWE3YjI0MDZmNjY2OTc3IiwidXNlcl9pZCI6MX0.tNlppits8-9vs4AFB5LLdQ1AFz3eciiBzzJLCMdqoKA', 1750000004, 1749913604, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDAwMDAwNCwiaWF0IjoxNzQ5OTEzNjA0LCJqdGkiOiI4YTJjMDRiOThhMzQ0MGRmODkyN2JjNmNlMDI2NmIwYyIsInVzZXJfaWQiOjF9.VZ94xHi_g_5pInqMOrqDrT9ZdNwU2HWvrL-5E_r3fmw', '2025-06-14 10:06:45', 0, 'NORMAL', 1, 93);
INSERT INTO `LOGIN` VALUES (102, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5OTEzNjgyLCJpYXQiOjE3NDk5MTM2NjQsImp0aSI6IjUwNzdlNGE2ZjM5MzQ2YWE5MzE4YTcxM2VjYWRmMWJhIiwidXNlcl9pZCI6MX0.4bc7HL9u6m7jUN3KPQ7gz3X-QFFS7RBXutj91rwJGi8', 1750000064, 1749913664, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDAwMDA2NCwiaWF0IjoxNzQ5OTEzNjY0LCJqdGkiOiJkNGY5MTI2YjM0YTE0OTMxYjcyOTFlNTE4MmQxMDUyMCIsInVzZXJfaWQiOjF9.eQf7Zj6rBrUqWtmn74heGpUqhvZz-3w5olU06HB_74s', '2025-06-14 10:07:44', 0, 'NORMAL', 1, 94);
INSERT INTO `LOGIN` VALUES (103, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUwMDAyMzk4LCJpYXQiOjE3NTAwMDIzODAsImp0aSI6ImI1MDE1N2FiMzc4YjQ5NzRhNTYxY2RmOTc0ODM5NThlIiwidXNlcl9pZCI6NDh9.bo1luWt4BvbpSND-RDxPDId6JEFIvzHhapmkYN0UaCM', 1750088780, 1750002380, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDA4ODc4MCwiaWF0IjoxNzUwMDAyMzgwLCJqdGkiOiI5NDYzN2RkOThlODM0ODUzYmJmYTUzY2ZkNTRkNDdmMSIsInVzZXJfaWQiOjQ4fQ.FU-nCHnoQttYFefUKzgR99_Uk3eferHY-R1dtp5WcRY', '2025-06-15 10:46:21', 1, 'NORMAL', 48, 2);
INSERT INTO `LOGIN` VALUES (104, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUwMDUyNjk1LCJpYXQiOjE3NTAwNTI2NzcsImp0aSI6IjNhODlhYjE0NzEzYzQ0NTg4NTQ2MzdhNmFiODgyYjJmIiwidXNlcl9pZCI6MX0.o-kf9r3omJ213OoaHurK2GzssZP-DZkpZOEj9Vl1SAE', 1750139077, 1750052677, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDEzOTA3NywiaWF0IjoxNzUwMDUyNjc3LCJqdGkiOiI5YzZiOGJlMTc5NDA0ZTVjOTI0YjA3MDg5ZmE2ZDcyYSIsInVzZXJfaWQiOjF9.21EK5I-jqfNIXdka8LaqMR_tyoX-z3uOBfqei9QK1mA', '2025-06-16 00:44:38', 0, 'NORMAL', 1, 95);
INSERT INTO `LOGIN` VALUES (105, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUwMDUyOTYyLCJpYXQiOjE3NTAwNTI5NDQsImp0aSI6ImRhMTkzYTIzNmZiMzQyZDA5NzAzNDU3MTQ1N2I1NzI1IiwidXNlcl9pZCI6MX0.UojwT01XYw3iuQHuspCzCEuaSQ_u4E23mkstfuUteBA', 1750139344, 1750052944, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDEzOTM0NCwiaWF0IjoxNzUwMDUyOTQ0LCJqdGkiOiJlNzk2NjkyNDI4NTI0YmQ2ODEyNmVjNmIyYzkxMmM2ZSIsInVzZXJfaWQiOjF9.e1ZEzb8teR-q8lBsEVtavBkAB2EY9QIzBIDOF2qwgTc', '2025-06-16 00:49:04', 0, 'NORMAL', 1, 96);
INSERT INTO `LOGIN` VALUES (106, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUwMDU1MTQ4LCJpYXQiOjE3NTAwNTUxMzAsImp0aSI6IjZjYTFkODM2ZWRmYjQyYjZiYWRjNzYyMDczNTAwMGNmIiwidXNlcl9pZCI6NDh9.Am0X4RIGvzo4rwtdvbGNTMWLW0in8vig9bUmJUnYb3I', 1750141530, 1750055130, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDE0MTUzMCwiaWF0IjoxNzUwMDU1MTMwLCJqdGkiOiIxNTJmM2Q4MWUyZmE0OGY4YmY5ZTFiMGQxMTU2NmVlYSIsInVzZXJfaWQiOjQ4fQ.Wra8JxIUxpk6MIT8tTA4OURKCUuo49qthwrVfQ-n8fk', '2025-06-16 01:25:31', 1, 'NORMAL', 48, 3);
INSERT INTO `LOGIN` VALUES (107, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUwMjkyNzg0LCJpYXQiOjE3NTAyOTI3NjYsImp0aSI6IjU5Y2NiYTcxZTg1YTQ4ZmVhMmY5YTg0ODI1MzZmMmI1IiwidXNlcl9pZCI6MX0.k69IFMScTa4Bn2t9zEmnRaH_ZelzjcrVzQ7PFbOoMQ4', 1750379166, 1750292766, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM3OTE2NiwiaWF0IjoxNzUwMjkyNzY2LCJqdGkiOiJlZmJjOWJiOTcyYTA0ZTM0OGRkOWVjYTQzODg2MTQ4YiIsInVzZXJfaWQiOjF9.q1p-QsfzJ7PnhmebwlJAyr6hmxtaGeFdlA4UNQn49Cc', '2025-06-18 19:26:06', 1, 'NORMAL', 1, 97);
INSERT INTO `LOGIN` VALUES (108, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUwMzE2NTgyLCJpYXQiOjE3NTAzMTY1NjQsImp0aSI6ImQ3MTk5NGYzMmJiZDRkNDI5NTcyNGMwNjQ5OWNiMDkyIiwidXNlcl9pZCI6MX0.5XbHumyhT5wgCwTQa10nKyf-5q9LXltO6os55b_6UE8', 1750402964, 1750316564, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDQwMjk2NCwiaWF0IjoxNzUwMzE2NTY0LCJqdGkiOiJiODkyOTQyNjMzNzQ0NGU2OGI4NTIyNzg1YTlhM2IxOSIsInVzZXJfaWQiOjF9.Jz-FXoCk1hgAq39cS5-P9YNxDCjW1ji7RbMNyyjH8gg', '2025-06-19 02:02:45', 1, 'NORMAL', 1, 98);
INSERT INTO `LOGIN` VALUES (109, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUxMDI0NDA1LCJpYXQiOjE3NTEwMjQzODcsImp0aSI6ImQ0ZmI2ZDNmMTk0YjRmMjJiZDE3Yzk2ZTM4MzcwNGM1IiwidXNlcl9pZCI6MX0.HaNEMuZ3fmaIZpBj09xS_WlXVKg4Y-bW8C7PpZphsVo', 1751110787, 1751024387, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MTExMDc4NywiaWF0IjoxNzUxMDI0Mzg3LCJqdGkiOiJhNDczNjIyMTc0Mjc0MWFhOGE0YTY4YTMxNTQzNWNlYiIsInVzZXJfaWQiOjF9.NomglSI11SrcW97XBMf087t8pUCSUCbu0hUFBQOjrCY', '2025-06-27 06:39:48', 1, 'NORMAL', 1, 99);
INSERT INTO `LOGIN` VALUES (110, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUxMTE3NjMwLCJpYXQiOjE3NTExMTc2MTIsImp0aSI6ImI1MmZiN2RlMDVhNjQ2MjBiZmM5MzNlMmYzODI0ZjQ1IiwidXNlcl9pZCI6MX0.-aOchXoG-Fo4556TJo3M1hfoxQGP4_U9hT4s9zWzsf8', 1751204012, 1751117612, 'refresh', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MTIwNDAxMiwiaWF0IjoxNzUxMTE3NjEyLCJqdGkiOiJlZGU2ODQwNTQyZDQ0ZmQ3OGQwZWRlMjZhMmI2Njg5YSIsInVzZXJfaWQiOjF9.jh1_OrOWtQF0ZKW72DSTmZ2SWLpCN7JFNXWVtEjSCbk', '2025-06-28 08:33:33', 1, 'NORMAL', 1, 100);

-- ----------------------------
-- Table structure for MEDICAMENTO
-- ----------------------------
DROP TABLE IF EXISTS `MEDICAMENTO`;
CREATE TABLE `MEDICAMENTO`  (
  `IDMEDICAMENTO` int(0) NOT NULL AUTO_INCREMENT,
  `CODIGO` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ANEMIA_NINOS` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'S:HABILITAR/N:NO HABILITAR',
  `ANEMIA_GESTANTE` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'S:HABILITAR/N:NO HABILITAR',
  `NOMBRE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CONCENTRACION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FORMA_FARM` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FORMA_FARM_SIMPLIFICADA` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PRESENTACION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `INGREDIENTES_ACTIVOS` varchar(4900) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDMEDICAMENTO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for MENU
-- ----------------------------
DROP TABLE IF EXISTS `MENU`;
CREATE TABLE `MENU`  (
  `IDMENU` int(0) NOT NULL AUTO_INCREMENT,
  `CODIGO` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT ' EJEMPLO 001.00.000:Sistema, 001.01.000:Módulo, 001.01.001:Opción,',
  `NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(445) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `URL` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ICONO` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FECHACREACION` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHAACTUALIZACION` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `FUNCION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDOBJACCESO` int(0) NULL DEFAULT NULL,
  `NROPARAMETROS` int(0) NULL DEFAULT 0,
  `ROUTE` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'GET' COMMENT 'GET, POST, PUT, DELETE,  OPTIONS, PATCH, Any, Custom',
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'P:Pendiente/A:Activo/I:Inactivo/B:Baja',
  `MIDDLEWARE` int(0) NULL DEFAULT NULL COMMENT 'Libre/Login',
  PRIMARY KEY (`IDMENU`) USING BTREE,
  INDEX `fk_MENU_OBJACCESO1_idx`(`IDOBJACCESO`) USING BTREE,
  CONSTRAINT `fk_MENU_OBJACCESO1` FOREIGN KEY (`IDOBJACCESO`) REFERENCES `OBJACCESO` (`IDOBJACCESO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MENU
-- ----------------------------
INSERT INTO `MENU` VALUES (1, 'TS0001MEN001', 'Nuevo Sistema', 'Registra los datos de la tabla sistemas', 'nuevo-sistema', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevoSistema', 1, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (2, 'TS0001MEN002', 'Editar Sistema', 'Editar datos de la tabla sistemas', 'editar-sistema', 'fas fa-edit', '2020-04-26 10:08:39', '2020-07-11 21:42:51', 'editarSistema', 1, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (3, 'TS0001MEN003', 'Eliminar Sistema', 'Eliminar los datos de la tabla Sistemas', 'eliminar-sistema', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'eliminarSistema', 1, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (4, 'TS0001MEN004', 'Extraer columnas del Sistema', 'Extrae las columnas de la tabla sistema', 'get-columna-sistema', NULL, '2020-05-01 12:59:12', '2024-10-31 21:57:09', 'getColumnasSistema', 1, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (5, 'TS0001MEN005', 'Lista de la tabla sistemas', 'Lista todos las filas de la tabla sistema', 'get-filas-sistema', NULL, '2020-05-01 13:00:31', '2024-10-31 21:56:59', 'getFilasSistema', 1, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (6, 'TS0001MEN006', 'Cambiar estado', 'Cambia el estado del sistema', 'cambiar-estado-sistema', NULL, '2020-05-06 13:39:06', '2021-07-20 20:06:05', 'cambiarEstado', 1, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (7, 'TM001MEN001', 'Lista de Módulos', 'Se listan todos los modulos dependiendo del sistema al que pertenece', 'lista-modulos', NULL, '2020-05-15 14:53:15', '2020-07-11 21:42:51', 'listaModulos', 5, 1, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (8, 'TM001MEN002', 'Extraer columnas del Modulo', 'Extrae las columnas de la tabla sistema', 'get-columna-modulos', NULL, '2020-05-01 12:59:12', '2020-07-11 21:42:51', 'getColumnasModulos', 5, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (9, 'TM001MEN003', 'Lista de la tabla modulos', 'Lista todos las filas de la tabla sistema', 'get-filas-modulos', NULL, '2020-05-01 13:00:31', '2020-07-11 21:42:51', 'getFilasModulos', 5, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (10, 'TM001MEN004', 'Cambiar estado Modulo', 'Cambia el estado del modulo', 'cambiar-estado-modulos', NULL, '2020-05-06 13:39:06', '2021-07-20 20:06:20', 'cambiarEstado', 5, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (11, 'TM001MEN005', 'Editar Modulo', 'Editar datos de la tabla modulos', 'editar-modulo', 'fas fa-edit', '2020-04-26 10:08:39', '2020-07-11 21:42:51', 'editarModulo', 5, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (12, 'TM001MEN006', 'Nuevo Modulo', 'Registra los datos de la tabla modulo', 'nuevo-modulo', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevoModulo', 5, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (13, 'TM001MEN007', 'Eliminar Modulo', 'Eliminar los datos de la tabla Modulo', 'eliminar-modulo', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'eliminarModulo', 5, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (14, 'TO001MEN001', 'Lista de Objetos', 'Se listan todos los objetos dependiendo del modulo al que pertenece', 'lista-objeto', NULL, '2020-05-15 14:53:15', '2020-07-11 21:42:51', 'listaObjeto', 6, 1, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (15, 'TO001MEN002', 'Extraer columnas del Objeto acceso', 'Extrae las columnas de la tabla objeto de accesos', 'get-columna-objacceso', NULL, '2020-05-01 12:59:12', '2020-07-11 21:42:51', 'getColumnasObjacceso', 6, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (16, 'TO001MEN003', 'Lista de la tabla objeto accesos', 'Lista todos las filas de la tabla objeto de accesos', 'get-filas-objacceso', NULL, '2020-05-01 13:00:31', '2020-07-11 21:42:51', 'getFilasObjacceso', 6, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (17, 'TO001MEN004', 'Cambiar estado Objeto acceso', 'Cambia el estado del objeto acceso', 'cambiar-estado-objacceso', NULL, '2020-05-06 13:39:06', '2021-07-20 20:06:37', 'cambiarEstado', 6, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (18, 'TO001MEN005', 'Editar Objeto acceso', 'Editar datos de la tabla objeto acceso', 'editar-objacceso', 'fas fa-edit', '2020-04-26 10:08:39', '2020-07-11 21:42:51', 'editarObjacceso', 6, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (19, 'TO001MEN006', 'Nuevo Objeto acceso', 'Registra los datos de la tabla Objeto de acceso', 'nuevo-objacceso', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevoObjacceso', 6, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (20, 'TO001MEN007', 'Eliminar Objeto acceso', 'Eliminar los datos de la tabla Objacceso', 'eliminar-objacceso', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'eliminarObjacceso', 6, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (21, 'TO001MEN008', 'Lista opciones modulo', 'Lista de opciones de los modulos peticion ajax', 'lista-modulos', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'listaModulos', 6, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (22, 'TM001MEN001', 'Extraer columnas de la tabla Menu', 'Extrae las columnas de la tabla menu', 'get-columna-menu', NULL, '2020-05-01 12:59:12', '2020-07-11 21:42:51', 'getColumnasMenu', 8, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (23, 'TM001MEN002', 'Lista de la tabla menu', 'Lista todos las filas de la tabla menu', 'get-filas-menu', NULL, '2020-05-01 13:00:31', '2020-07-11 21:42:51', 'getFilasMenu', 8, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (24, 'TM001MEN003', 'Lista opciones Objacceso', 'Lista de opciones de los objetos acceso peticion ajax', 'lista-objacceso', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'listaObjacceso', 8, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (25, 'TM001MEN004', 'Cambiar estado', 'Cambia el estado del menu prueba 3', 'cambiar-estado-manu', '', '2020-05-06 13:39:06', '2021-07-20 20:06:49', 'cambiarEstado', 8, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (26, 'TM001MEN005', 'Editar Menu', 'Editar datos de la tabla menu', 'editar-menu', 'fas fa-edit', '2020-04-26 10:08:39', '2020-07-11 21:42:51', 'editarMenu', 8, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (27, 'TM001MEN006', 'Eliminar Menu', 'Eliminar los datos de la tabla Menu', 'eliminar-menu', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'eliminarMenu', 8, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (28, 'TM001MEN007', 'Nuevo Menu', 'Registra los datos de la tabla Menu', 'nuevo-menu', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevoMenu', 8, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (29, 'CT001MEN001', 'Extraer columnas de la tabla Catalogo de tablas', 'Extrae las columnas de la tabla catalogo de tablas', 'get-columna-catalogo-tablas', NULL, '2020-05-01 12:59:12', '2020-08-01 15:46:37', 'getColumnasCatalogoTablas', 9, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (30, 'CT001MEN002', 'Lista de la tabla catalogo de tablas', 'Lista todos las filas de la tabla catalogo de tablas', 'get-filas-catalogo-tablas', NULL, '2020-05-01 13:00:31', '2020-08-01 15:46:39', 'getFilasCatalogoTablas', 9, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (31, 'CT001MEN003', 'Cambiar estado', 'Cambia el estado del catalogo de tablas', 'cambiar-estado-catalogo-tablas', '', '2020-05-06 13:39:06', '2021-07-20 20:07:07', 'cambiarEstado', 9, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (32, 'CT001MEN004', 'Editar Catalogo tablas', 'Editar datos de la tabla catalogo de tablas', 'editar-catalogo-tablas', 'fas fa-edit', '2020-04-26 10:08:39', '2020-07-11 21:42:51', 'editarCatalogoTablas', 9, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (33, 'CT001MEN005', 'Nuevo Catalogo tablas', 'Registra los datos de la tabla Catalogo de tablas', 'nuevo-catalogo-tablas', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevoCatalogoTablas', 9, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (34, 'TT001MEN001', 'Extraer columnas de la tabla de tablas', 'Extrae las columnas de la tabla de tablas', 'get-columna-tabla-tablas', NULL, '2020-05-01 12:59:12', '2024-06-02 20:17:05', 'getColumnasTabTablas', 10, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (35, 'TT001MEN002', 'Lista de la tabla de tablas', 'Lista todos las filas de la tabla de tablas', 'get-filas-tabla-tablas', NULL, '2020-05-01 13:00:31', '2024-06-02 20:17:14', 'getFilasTabTablas', 10, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (36, 'TT001MEN003', 'Cambiar estado', 'Cambia el estado de tabla de tablas', 'cambiar-estado-tabla-tablas', '', '2020-05-06 13:39:06', '2021-07-20 20:07:13', 'cambiarEstado', 10, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (37, 'TT001MEN004', 'Editar tabla de tablas', 'Editar datos de la tabla de tablas', 'editar-tabla-tablas', 'fas fa-edit', '2020-04-26 10:08:39', '2020-07-11 21:42:51', 'editarTablaTablas', 10, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (39, 'TT001MEN005', 'Nuevo Tabla de tablas', 'Registra los datos de la tabla de tablas', 'nuevo-tabla-tablas', 'fa fa-plus-circle', NULL, '2020-08-02 15:02:43', 'nuevoTablaTablas', 10, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (40, 'PE0001MEN001', 'Valida persona', 'Valida si existe una persona, con tipo de documento y su número por por ajax', 'valida-persona-ajax', '', NULL, '2020-08-28 16:51:49', 'validaPersonaAjax', 11, 0, 'POST', 19, 20);
INSERT INTO `MENU` VALUES (41, 'US001MEN002', 'Valida usuario', 'Valida si existe un usuario, con campo usuario', 'valida-usuario-ajax', '', NULL, '2020-08-02 22:59:58', 'validaUsuarioAjax', 2, 0, 'POST', 19, 20);
INSERT INTO `MENU` VALUES (42, 'US001MEN003', 'Nuevo usuario', 'Registra un nuevo usuario desde el login', 'nuevo-usuario-ajax', '', NULL, '2020-08-03 22:19:09', 'nuevoUsuarioAjax', 2, 0, 'POST', 19, 20);
INSERT INTO `MENU` VALUES (43, 'PE0001MEN002', 'Extraer columnas de la tabla persona', 'Extrae las columnas de la tablapersona', 'get-columna-persona', NULL, '2020-05-01 12:59:12', '2020-08-28 16:52:48', 'getColumnasPersona', 11, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (44, 'PE0001MEN003', 'Lista de la tabla persona', 'Lista todos las filas de la tabla persona', 'get-filas-persona', NULL, '2020-05-01 13:00:31', '2020-08-28 16:53:41', 'getFilasPersona', 11, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (45, 'VE0001MEN001', 'Extrae columnas de la tabla vehiculo', 'columnas de vehiculo', 'get-columna-vehiculo', NULL, '2020-09-10 10:11:38', NULL, 'getColumnasVehiculo', 12, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (46, 'VE0001MEN002', 'Lista de la tabla vehiculo', 'Lista todos las filas de la tabla vehiculo', 'get-filas-vehiculo', NULL, '2020-05-01 13:00:31', '2020-08-28 16:53:41', 'getFilasVehiculo', 12, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (47, 'VE0001MEN003', 'Editar tabla de vehiculo', 'Editar datos de la tabla de vehiculo', 'editar-vehiculo', 'fas fa-edit', '2020-04-26 10:08:39', '2020-07-11 21:42:51', 'editarVehiculo', 12, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (48, 'VE0001MEN004', 'Cambiar estado', 'Cambia el estado de vehiculo', 'cambiar-estado-vehiculo', '', '2020-05-06 13:39:06', '2021-07-20 20:07:29', 'cambiarEstado', 12, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (49, 'VE0001MEN005', 'Nuevo Vehiculo', 'Registra los datos de la tabla Vehiculo', 'nuevo-vehiculo', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevoVehiculo', 12, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (50, 'VE0001MEN006', 'Eliminar Vehiculo', 'Eliminar los datos de la tabla Vehiculo', 'eliminar-vehiculo', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'eliminarVehiculo', 12, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (51, 'VE0001MEN007', 'Guardar Foto Vehiculo', 'Guarda la foto de los vehiculos', 'guardar-foto-vehiculo', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'guardarFotoVehiculo', 12, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (52, 'PE0001MEN004', 'Cambiar Estado', 'Cambia el estado de la persona', 'cambiar-estado-inspeccion', '', '2020-10-11 22:54:57', '2021-07-20 20:08:39', 'cambiarEstado', 11, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (53, 'IN0001MEN001', 'Extrae columnas de la tabla inspeccion', 'columnas de inspeccion', 'get-columna-inspeccion', NULL, '2020-09-10 10:11:38', NULL, 'getColumnasInspeccion', 13, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (54, 'IN0001MEN002', 'Lista de la tabla inspeccion', 'Lista todos las filas de la tabla inspeccion', 'get-filas-inspeccion', NULL, '2020-05-01 13:00:31', '2020-08-28 16:53:41', 'getFilasInspeccion', 13, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (55, 'EM0001MEN001', 'Extrae columnas de la tabla empresa', 'columnas de empresa', 'get-columna-empresa', NULL, '2020-09-10 10:11:38', NULL, 'getColumnasEmpresa', 14, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (56, 'EM0001MEN002', 'Lista de la tabla empresa', 'Lista todos las filas de la tabla empresa', 'get-filas-empresa', NULL, '2020-05-01 13:00:31', '2020-08-28 16:53:41', 'getFilasEmpresa', 14, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (57, 'EM0001MEN004', 'Cambiar estado', 'Cambia el estado de empresa', 'cambiar-estado-empresa', '', '2020-05-06 13:39:06', '2021-07-20 20:07:45', 'cambiarEstado', 14, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (58, 'EM0001MEN005', 'Nueva empresa', 'Registra los datos de la tabla Empresa', 'nuevo-empresa', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevoEmpresa', 14, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (59, 'EM0001MEN006', 'Eliminar Empresa', 'Eliminar los datos de la tabla Empresa', 'eliminar-empresa', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'eliminarEmpresa', 14, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (60, 'EM0001MEN007', 'Nueva persona', 'Registra los datos de la tabla Persona', 'nuevo-persona', 'fa fa-plus-circle', NULL, '2024-10-06 19:41:49', 'nuevoPersona', 23, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (61, 'EM0001MEN008', 'Editar tabla de persona', 'Editar datos de la tabla de persona', 'editar-persona', 'fas fa-edit', '2020-04-26 10:08:39', '2024-10-06 19:41:53', 'editarPersona', 23, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (62, 'IN0001MEN003', 'Extrae fotos', 'Extrae la lista de fotos', 'extrae-fotos', NULL, '2020-05-01 13:00:31', '2020-08-28 16:53:41', 'extraeFotos', 13, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (63, 'US0002MEN001', 'Extrae lista de accesos por usuario', 'Lista de accesos por usuario', 'get-menu-accesos', NULL, '2021-07-21 10:30:25', '2021-07-25 12:39:04', 'getMenuAccesos', 2, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (64, 'PG0001MEN001', 'Extraer columnas de pagina', 'Extrae las columnas de la tabla pagina', 'get-columna-pagina', NULL, '2020-05-01 12:59:12', '2023-10-14 20:34:35', 'getColumnasPagina', 16, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (65, 'PG0001MEN002', 'Filas de la tabla pagina', 'Lista todos las filas de la tabla pagina', 'get-filas-pagina', NULL, '2020-05-01 13:00:31', '2023-10-14 20:34:42', 'getFilasPagina', 16, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (66, 'PLA0001MEN001', 'Extraer columnas de plantilla', 'API: Extrae las columnas de la tabla plantilla', 'get-columna-plantilla', NULL, '2020-05-01 12:59:12', '2021-08-15 22:54:22', 'getColumnasPlantilla', 18, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (67, 'PLA0001MEN002', 'Filas de la tabla plantilla', 'API: Lista todos las filas de la tabla plantilla', 'get-filas-plantilla', NULL, '2020-05-01 13:00:31', '2021-08-15 22:54:34', 'getFilasPlantilla', 18, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (68, 'PLA0001MEN003', 'Nueva Plantilla', 'Registra los datos de la tabla plantilla', 'nueva-plantilla', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevaPlantilla', 18, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (69, 'PLA0001MEN004', 'Actualizar Plantilla', 'Editar datos de la tabla plantilla', 'actualizar-plantilla', 'fas fa-edit', '2020-04-26 10:08:39', '2021-09-01 22:59:33', 'actualizarPlantilla', 18, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (70, 'PLA0001MEN005', 'Eliminar Plantilla', 'Eliminar los datos de la tabla plantilla', 'eliminar-plantilla', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'eliminarPlantilla', 18, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (71, 'COM0001MEN001', 'Extraer columnas de componente', 'API: Extrae las columnas de la tabla componente', 'get-columna-componente', NULL, '2020-05-01 12:59:12', '2021-09-03 22:35:08', 'getColumnasComponente', 19, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (72, 'COM0001MEN002', 'Filas de la tabla componente', 'API: Lista todos las filas de la tabla componente', 'get-filas-componente', NULL, '2020-05-01 13:00:31', '2021-08-15 22:54:34', 'getFilasComponente', 19, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (73, 'USU001MEN001', 'Get Usuario por ID - API', 'API: Extrae Usuario por ID', 'get-usuario-by-id', '', NULL, '2021-09-04 20:59:20', 'getUsuarioById', 20, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (74, 'COM0001MEN003', 'Nuevo Componente', 'Registra los datos de la tabla componente', 'nuevo-componente', 'fa fa-plus-circle', NULL, '2020-07-11 21:42:51', 'nuevoComponente', 19, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (75, 'ARC0001MEN001', 'Cargar Imagen', 'Carga los datos de la imagen', 'nuevo-imagen', 'fa fa-plus-circle', NULL, '2021-09-27 11:07:51', 'nuevoImagen', 21, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (76, 'ARC0001MEN002', 'Cargar Documento', 'Carga los datos del documento', 'nuevo-documento', 'fa fa-plus-circle', NULL, '2021-09-27 11:07:51', 'nuevoDocumento', 21, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (77, 'COM0001MEN004', 'Actualizar Componente', 'Editar datos de la tabla componente', 'actualizar-componente', 'fas fa-edit', '2020-04-26 10:08:39', '2021-09-01 22:59:33', 'actualizarComponente', 19, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (78, 'COM0001MEN005', 'Eliminar Componente', 'Eliminar los datos de la tabla componente', 'eliminar-componente', 'fas fa-trash', '2020-04-26 10:17:48', '2020-07-11 21:42:51', 'eliminarComponente', 19, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (79, 'USU001MEN002', 'Extraer columnas de la tabla usuario', 'Extrae las columnas de la tabla usuario', 'get-columna-usuario', NULL, '2020-05-01 12:59:12', '2020-08-28 16:52:48', 'getColumnasUsuario', 20, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (80, 'USU001MEN003', 'Filas de la tabla usuario', 'Lista todos las filas de la tabla usuario', 'get-filas-usuario', NULL, '2020-05-01 13:00:31', '2021-08-15 13:18:31', 'getFilasUsuario', 20, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (81, 'UR001MEN001', 'Extraer columnas de la tabla usuario rol', 'Extrae las columnas de la tabla usuario rol', 'get-columna-usuario-rol', NULL, '2020-05-01 12:59:12', '2022-12-29 19:29:27', 'getColumnasUsuarioRol', 22, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (82, 'UR001MEN002', 'Extraer filas de la tabla usuario rol', 'Extrae las filas de la tabla usuario rol', 'get-filas-usuario-rol', NULL, '2020-05-01 12:59:12', '2022-12-29 19:29:27', 'getFilasUsuarioRol', 22, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (83, 'UR001MEN003', 'Actualizar tabla usuario rol', 'Actualizar la tabla usuario rol', 'actualizar-usuario-rol', NULL, '2020-05-01 12:59:12', '2022-12-29 19:29:27', 'actualizarUsuarioRol', 22, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (84, 'USU001MEN004', 'Actualizar la tabla usuario', 'Actualizar la tabla usuario', 'actualizar-usuario', NULL, '2020-05-01 13:00:31', '2022-12-29 19:37:15', 'actualizarUsuario', 20, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (85, 'USU001MEN005', 'resetear la clave de tabla usuario', 'Resetear la clave tabla usuario', 'resetear-clave-usuario', NULL, '2020-05-01 13:00:31', '2022-12-29 19:37:15', 'resetearClaveUsuario', 20, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (86, 'PER001MEN001', 'buscar en la tabla usuario', 'buscar en la tabla persona', 'get-persona', NULL, '2020-05-01 13:00:31', '2023-05-06 20:42:40', 'getPersona', 23, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (87, 'PER001MEN002', 'Extraer columnas de la tabla persona', 'Extrae las columnas de la tabla persona', 'get-columna-persona', NULL, '2020-05-01 12:59:12', '2020-08-28 16:52:48', 'getColumnasPersona', 23, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (88, 'PER001MEN003', 'Filas de la tabla persona', 'Lista todos las filas de la tabla persona', 'get-filas-persona', NULL, '2020-05-01 13:00:31', '2021-08-15 13:18:31', 'getFilasPersona', 23, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (89, 'PG0001MEN003', 'Actualizar pagina', 'editar datos de la tabla pagina', 'actualizar-pagina', NULL, '2020-05-01 13:00:31', '2023-10-14 20:34:42', 'actualizarPagina', 16, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (90, 'PG0001MEN004', 'Extraer archivos de pagina', 'archivos de la tabla pagina', 'get-archivo-pagina', NULL, '2020-05-01 13:00:31', '2023-10-31 23:11:35', 'getArchivoPagina', 16, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (91, 'COM0001MEN002', 'Extrae componente', 'Extrae un componente', 'get-componente-plantilla', NULL, '2021-07-21 10:30:25', '2023-11-04 08:07:29', 'getComponentePlantilla', 19, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (92, 'PLA001MEN006', 'Extraer columnas de la tabla plantilla componente', 'Extrae las columnas de la tabla plantilla columna', 'get-columna-plantilla-componente', NULL, '2020-05-01 12:59:12', '2022-12-29 19:29:27', 'getColumnasPlantillaComponente', 18, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (93, 'PLA001MEN007', 'Extraer filas de la tabla PLANTILLA COMPONENTE', 'Extrae las filas de la tabla plantilla componente', 'get-filas-plantilla-componente', NULL, '2020-05-01 12:59:12', '2022-12-29 19:29:27', 'getFilasPlantillaComponente', 18, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (94, 'PLA001MEN008', 'Actualizar tabla plantilla componente', 'Actualizar la tabla plantilla componente', 'actualizar-plantilla-componente', NULL, '2020-05-01 12:59:12', '2022-12-29 19:29:27', 'actualizarPlantillaComponente', 18, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (95, 'PLA001MEN009', 'Extraer los componentes de plantilla', 'extrae componentes de plantilla', 'get-componentes-plantilla', NULL, '2020-05-01 12:59:12', '2022-12-29 19:29:27', 'getComponentesPlantilla', 18, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (96, 'PG0001MEN005', 'GET SITEMAP', 'Lista todos las url de la web', 'site-map', NULL, '2020-05-01 13:00:31', '2021-08-15 13:18:31', 'getSiteMap', 16, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (97, 'LC0001MEN007', 'Nuevo Log Conexion', 'Registra los datos de la tabla log_conexion', 'nuevo-log-conexion', 'fa fa-plus-circle', NULL, '2024-02-11 20:49:12', 'nuevoLogConexion', 25, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (98, 'PG0001MEN004', 'Nueva pagina', 'registra datos de la tabla pagina', 'nuevo-pagina', NULL, '2020-05-01 13:00:31', '2023-10-14 20:34:42', 'nuevoPagina', 16, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (99, 'PG0001MEN005', 'Eliminar pagina', 'eliminar datos de la tabla pagina', 'eliminar-pagina', NULL, '2020-05-01 13:00:31', '2023-10-14 20:34:42', 'eliminarPagina', 16, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (100, 'PG0001MEN006', 'Get Id Pagina By Url', 'extrae IDPAGINA pagina', 'get-id-pagina-by-url', NULL, '2020-05-01 13:00:31', '2023-10-14 20:34:42', 'getIdPaginaByUrl', 16, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (101, 'EM0001MEN008', 'Actualizar persona', 'Actualizar los datos de la tabla Persona', 'actualizar-persona', 'fa fa-plus-circle', NULL, '2024-10-06 19:41:49', 'actualizarPersona', 23, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (102, 'EM0001MEN009', 'Eliminar persona', 'Actualizar los datos de la tabla Persona', 'eliminar-persona', 'fa fa-plus-circle', NULL, '2024-10-13 19:23:59', 'eliminarPersona', 23, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (103, 'USU001MEN005', 'Nuevo usuario', 'Nueva tabla usuario', 'nuevo-usuario', NULL, '2020-05-01 13:00:31', '2022-12-29 19:37:15', 'nuevoUsuario', 20, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (104, 'R001MEN001', 'Extraer columnas de la tabla rol', 'Extrae las columnas de la tabla rol', 'get-columna-rol', NULL, '2020-05-01 12:59:12', '2024-10-29 22:40:24', 'getColumnasRol', 27, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (105, 'R001MEN002', 'Extraer filas de la tabla rol', 'Extrae las filas de la tabla rol', 'get-filas-rol', NULL, '2020-05-01 12:59:12', '2024-10-29 22:46:47', 'getFilasRol', 27, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (106, 'R001MEN002', 'Nuevo rol', 'registra datos de la tabla rol', 'nuevo-rol', NULL, '2020-05-01 13:00:31', '2024-10-30 20:02:49', 'nuevoRol', 27, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (107, 'R001MEN003', 'Actualizar rol', 'actualizatr datos de la tabla rol', 'actualizar-rol', NULL, '2020-05-01 13:00:31', '2024-10-30 20:02:49', 'actualizarRol', 27, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (108, 'R001MEN004', 'Eliminar rol', 'Eliminar rol de la tabla', 'eliminar-rol', 'fa fa-plus-circle', NULL, '2024-10-31 20:36:15', 'eliminarRol', 27, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (109, 'R001MEN005', 'gey accesos de la tabla rol', 'Extrae la lista de acceso de un rol', 'get-accesos-by-id', NULL, '2020-05-01 12:59:12', '2024-11-05 13:01:24', 'listAccesosByRol', 27, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (110, 'R001MEN006', 'agregar o quitar accesos', 'agregar o quitar acceso de un rol', 'actualizar-acceso-rol', NULL, '2020-05-01 12:59:12', '2024-11-07 18:22:45', 'actualizarAccesoRol', 27, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (111, 'ARC0001MEN002', 'Cargar Imagen Pagina', 'Carga los datos de la imagen de la pagina', 'nuevo-imagen-pagina', 'fa fa-plus-circle', NULL, '2021-09-27 11:07:51', 'nuevoImagenPagina', 21, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (112, 'DIR0001MEN001', 'Sincroniza Directorio ', 'Lista de todas las carpetas donde se carga', 'sincronizar-directorio', NULL, '2020-05-01 13:00:31', '2021-08-15 13:18:31', 'sincronizarDirectorio', 28, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (113, 'DIR0001MEN002', 'Extraer columnas de la tabla directorio', 'Extrae las columnas de la tabla directorio', 'get-columna-directorio', NULL, '2020-05-01 12:59:12', '2024-11-28 19:43:39', 'getColumnasDirectorio', 28, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (114, 'DIR0001MEN003', 'Extraer filas de la tabla directorio', 'Extrae las filas de la tabla directorio', 'get-filas-directorio', NULL, '2020-05-01 12:59:12', '2024-10-29 22:46:47', 'getFilasDirectorio', 28, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (115, 'ARC0001MEN001', 'Extraer filas de la tabla archivo', 'Extrae las filas de la tabla archivo', 'get-filas-archivo', NULL, '2020-05-01 12:59:12', '2024-10-29 22:46:47', 'getFilasArchivo', 21, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (116, 'ARC0001MEN002', 'Extraer columnas de la tabla archivo', 'Extrae las columnas de la tabla archivo', 'get-columna-archivo', NULL, '2020-05-01 12:59:12', '2024-11-28 19:43:39', 'getColumnasArchivo', 21, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (117, 'ARC0001MEN003', 'Extraer archivos por directorio', 'Extrae las filas de la tabla archivo', 'get-filas-archivo-by-directorio', NULL, '2020-05-01 12:59:12', '2024-10-29 22:46:47', 'getFilasArchivoByDirectorio', 21, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (118, 'DIR0001MEN004', 'Nuevo subdirectorio Directorio ', 'Crea un nuevo subdirectorio', 'nuevo-sub-directorio', NULL, '2020-05-01 13:00:31', '2021-08-15 13:18:31', 'nuevoSubDirectorio', 28, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (119, 'DIR0001MEN005', 'Renombrar Directorio ', 'Renombrar directorio', 'renombrar-directorio', NULL, '2020-05-01 13:00:31', '2021-08-15 13:18:31', 'renombrarDirectorio', 28, 0, 'POST', 19, 19);
INSERT INTO `MENU` VALUES (120, 'PPD0001MEN001', 'Extraer filas de la tabla pais', 'Extrae las filas de la tabla pais', 'get-filas-pais', NULL, '2020-05-01 12:59:12', '2025-02-27 12:19:06', 'getFilasPais', 30, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (121, 'PPD0001MEN002', 'Extraer columnas de la tabla pais', 'Extrae las columnas de la tabla pais', 'get-columna-pais', NULL, '2020-05-01 12:59:12', '2024-11-28 19:43:39', 'getColumnasPais', 30, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (122, 'PPD0001MEN003', 'Extraer filas de la tabla departamento', 'Extrae las filas de la tabla departamento', 'get-filas-departamento', NULL, '2020-05-01 12:59:12', '2025-03-01 23:18:23', 'getFilasDepartamento', 31, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (123, 'PPD0001MEN004', 'Extraer columnas de la tabla departamento', 'Extrae las columnas de la tabla departamento', 'get-columna-departamento', NULL, '2020-05-01 12:59:12', '2025-03-01 23:18:31', 'getColumnasDepartamento', 31, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (124, 'PPD0001MEN005', 'Extraer filas de la tabla provincia', 'Extrae las filas de la tabla provincia', 'get-filas-provincia', NULL, '2020-05-01 12:59:12', '2025-03-06 20:09:37', 'getFilasProvincia', 32, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (125, 'PPD0001MEN006', 'Extraer columnas de la tabla provincia', 'Extrae las columnas de la tabla provincia', 'get-columna-provincia', NULL, '2020-05-01 12:59:12', '2025-03-06 20:09:42', 'getColumnasProvincia', 32, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (126, 'PPD0001MEN007', 'Extraer filas de la tabla distrito', 'Extrae las filas de la tabla distrito', 'get-filas-distrito', NULL, '2020-05-01 12:59:12', '2025-03-07 08:26:52', 'getFilasDistrito', 33, 0, 'GET', 19, 19);
INSERT INTO `MENU` VALUES (127, 'PPD0001MEN008', 'Extraer columnas de la tabla distrito', 'Extrae las columnas de la tabla distrito', 'get-columna-distrito', NULL, '2020-05-01 12:59:12', '2025-03-07 08:26:57', 'getColumnasDistrito', 33, 0, 'GET', 19, 19);

-- ----------------------------
-- Table structure for MODULOS
-- ----------------------------
DROP TABLE IF EXISTS `MODULOS`;
CREATE TABLE `MODULOS`  (
  `IDMODULO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRE_CORTO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `RUTA` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDMODULO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MODULOS
-- ----------------------------
INSERT INTO `MODULOS` VALUES (1, 'USUARIOS', 'US', 'usuarios', 19);
INSERT INTO `MODULOS` VALUES (2, 'PEDIDOS', 'PD', 'pedidos', 19);
INSERT INTO `MODULOS` VALUES (3, 'RECURSOS HUMANOS', 'RRHH', 'recursos-humanos', 19);
INSERT INTO `MODULOS` VALUES (4, 'INSUMOS', 'IN', 'insumos', 19);
INSERT INTO `MODULOS` VALUES (5, 'PRODUCTOS', 'PR', 'productos', 19);
INSERT INTO `MODULOS` VALUES (6, 'MANTENIMIENTO DE TABLAS', 'MT', 'mantenimiento-tablas', 19);
INSERT INTO `MODULOS` VALUES (7, 'INSPECCION', 'IN', 'inspeccion', 19);
INSERT INTO `MODULOS` VALUES (8, 'API', 'API', 'api', 19);
INSERT INTO `MODULOS` VALUES (9, 'WEB', 'WB', 'web', 19);
INSERT INTO `MODULOS` VALUES (10, 'MANTENIMIENTO WEB', 'MW', 'mantenimiento-web', 19);

-- ----------------------------
-- Table structure for OBJACCESO
-- ----------------------------
DROP TABLE IF EXISTS `OBJACCESO`;
CREATE TABLE `OBJACCESO`  (
  `IDOBJACCESO` int(0) NOT NULL AUTO_INCREMENT,
  `CODIGO` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRE` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDMODULO` int(0) NOT NULL,
  `RUTA` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CONTROLADOR` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `MIDDLEWARE` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDOBJACCESO`) USING BTREE,
  INDEX `fk_OBJACCESO_MODULOS1_idx`(`IDMODULO`) USING BTREE,
  CONSTRAINT `fk_OBJACCESO_MODULOS1` FOREIGN KEY (`IDMODULO`) REFERENCES `MODULOS` (`IDMODULO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of OBJACCESO
-- ----------------------------
INSERT INTO `OBJACCESO` VALUES (1, 'TS0001', 'Sistema', 8, 'sistema', 'SistemaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (2, 'US0001', 'Usuario', 1, 'usuarios', 'UsuarioControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (3, 'US0002', 'Rol', 1, 'rol', 'RolControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (4, 'US0003', 'Accesos', 1, 'accesos', NULL, 19, 19);
INSERT INTO `OBJACCESO` VALUES (5, 'TM0001', 'Modulos', 8, 'tabla-modulos', 'ModulosControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (6, 'TO0001', 'Objacceso', 8, 'tabla-objeto', 'ObjaccesoControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (8, 'TM0001', 'Menu', 8, 'menu', 'MenuControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (9, 'CT0001', 'CatalogoTablas', 8, 'catalogo-tablas', 'CatalogoTablasControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (10, 'TT0001', 'TabTablas', 8, 'tab-tablas', 'TabTablasControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (11, 'PE0001', 'Persona', 1, 'persona', 'PersonaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (12, 'VE0001', 'Vehiculo', 8, 'vehiculo', 'VehiculoControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (13, 'IN0001', 'Inspeccion', 8, 'inspeccion', 'InspeccionControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (14, 'EM0001', 'Empresa', 8, 'empresa', 'EmpresaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (15, 'PGA0001', 'Pagina', 10, 'pagina', 'PaginaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (16, 'PGW001', 'Pagina', 8, 'pagina', 'PaginaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (17, 'PLW0001', 'Plantilla', 10, 'plantilla', 'PlantillaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (18, 'PLA001', 'Plantilla', 8, 'plantilla', 'PlantillaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (19, 'COM001', 'Componente', 8, 'componente', 'ComponenteControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (20, 'USU001', 'Usuario', 8, 'usuario', 'UsuarioControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (21, 'ARC001', 'Archivo', 8, 'archivo', 'ArchivoControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (22, 'UR0001', 'UsuarioRol', 8, 'usuario-rol', 'UsuarioRolControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (23, 'PER001', 'Persona', 8, 'persona', 'PersonaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (24, 'COM001', 'Componente', 10, 'componente', 'ComponenteControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (25, 'LC0001', 'LogConexion', 8, 'log-conexion', 'LogConexionControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (26, 'CT0001', 'CatalogoTablas ', 6, 'catalogo-tablas', 'CatalogoTablasControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (27, 'R0002', 'Rol', 8, 'rol', 'RolControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (28, 'DIR001', 'Directorio', 8, 'directorio', 'DirectorioControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (29, 'PPD0001', 'Ubicacion ', 6, 'ubicacion', 'UbicacionControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (30, 'PPD0001', 'Pais', 8, 'pais', 'PaisControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (31, 'PPD0001', 'Departamento', 8, 'departamento', 'DepartamentoControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (32, 'PPD0001', 'Provincia', 8, 'provincia', 'ProvinciaControlador', 19, 19);
INSERT INTO `OBJACCESO` VALUES (33, 'PPD0001', 'Distrito', 8, 'distrito', 'DistritoControlador', 19, 19);

-- ----------------------------
-- Table structure for OPINION
-- ----------------------------
DROP TABLE IF EXISTS `OPINION`;
CREATE TABLE `OPINION`  (
  `IDOPINION` int(0) NOT NULL AUTO_INCREMENT,
  `TIPO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'RECLAMO/SUGERENCIA/COMENTARIO',
  `TITULO` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(445) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `VALORACION` decimal(2, 0) NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDUSUARIO` int(0) NOT NULL,
  PRIMARY KEY (`IDOPINION`) USING BTREE,
  INDEX `fk_OPINION_USUARIO1_idx`(`IDUSUARIO`) USING BTREE,
  CONSTRAINT `fk_OPINION_USUARIO1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `USUARIO` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of OPINION
-- ----------------------------
INSERT INTO `OPINION` VALUES (1, 'a', 'sdfdf', 'sdfsdf', 1, 'P', 1);
INSERT INTO `OPINION` VALUES (2, 'r', 'otro asunto', 'dentro del form', 1, 'P', 36);
INSERT INTO `OPINION` VALUES (3, NULL, NULL, NULL, NULL, 'P', 1);
INSERT INTO `OPINION` VALUES (4, 'R', 'este es un titulo genial', 'otra genial oidea', 3, 'P', 1);
INSERT INTO `OPINION` VALUES (5, 'R', 'este es un titulo genial', 'otro mensaje mas', 4, 'P', 1);
INSERT INTO `OPINION` VALUES (6, 'S', 'ahora si donde corresponde', 'gracias por este comentario', 5, 'P', 36);
INSERT INTO `OPINION` VALUES (7, 'R', 'un asumsto mas', 'esta raro esto', NULL, 'P', 1);
INSERT INTO `OPINION` VALUES (8, 'R', 'asunto berit', 'un asunto mas', 4, 'P', 36);
INSERT INTO `OPINION` VALUES (9, 'R', 'sdfsdf', 'ahora si', 4, 'P', 1);
INSERT INTO `OPINION` VALUES (10, NULL, NULL, NULL, NULL, 'P', 1);
INSERT INTO `OPINION` VALUES (11, 'C', 'este es un titulo genial', 'ñkljlkhjklj', 4, 'P', 1);
INSERT INTO `OPINION` VALUES (12, 'R', 'este es un titulo genial', 'kkkkkllllllllllllllll', 4, 'P', 1);

-- ----------------------------
-- Table structure for PAGINA
-- ----------------------------
DROP TABLE IF EXISTS `PAGINA`;
CREATE TABLE `PAGINA`  (
  `IDPAGINA` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(245) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `URL` varchar(645) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TITULO` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `RESUMEN` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `CONTENIDO` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `IDUSUARIOCREACION` int(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `IDUSUARIOACTUALIZACION` int(0) NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `IDPLANTILLA` int(0) NOT NULL,
  `IDPAGINAPADRE` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDPAGINA`) USING BTREE,
  INDEX `fk_PAGINA_PLANTILLA_WEB1_idx`(`IDPLANTILLA`) USING BTREE,
  INDEX `fk_PAGINA_PAGINA1_idx`(`IDPAGINAPADRE`) USING BTREE,
  CONSTRAINT `fk_PAGINA_PAGINA1` FOREIGN KEY (`IDPAGINAPADRE`) REFERENCES `PAGINA` (`IDPAGINA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_PAGINA_PLANTILLA_WEB1` FOREIGN KEY (`IDPLANTILLA`) REFERENCES `PLANTILLA_WEB` (`IDPLANTILLA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PAGINA
-- ----------------------------
INSERT INTO `PAGINA` VALUES (1, 'inicio', 'inicio', 'noticia sera un cambio', '<p>resumen de noticia 3 edwin calero chamorro KENNEDY</p>\n\n<p>resumen de noticia 3 edwin calero chamorro KENNEDY calero</p>\n\n<p>[url=http://slim4.trabajo.ed/uploads\\Contenidos\\Documentos\\2021-09-29/6a7a56f85fcfe2f1.pdf]prueba[/url]</p>\n', '<app-pie></app-pie>\n<p>&nbsp;</p>\n\n<h2 style=\"font-style: italic; text-align: center;\"><span style=\"color:#d35400;\"><span style=\"font-size:22px;\"><strong>Este es un t&iacute;tulo</strong></span></span></h2>\n\n<p>&nbsp;</p>\n\n<p><img alt=\"\" src=\"http://slim4.trabajo.ed/uploads\\Contenidos\\Imagenes\\2021-09-27/a236dd820984a3eb.png\" style=\"height:246px; width:315px\" /></p>\n\n<p>&nbsp;</p>\n', NULL, 1, '2025-02-16 03:48:35', 1, 319, 1, NULL);
INSERT INTO `PAGINA` VALUES (2, 'noticia', 'noticia', 'inicio de la web', NULL, '<p><img alt=\"\" src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-03-03/a092fc899cbe5e05.jpg\" style=\"height:200px; width:200px\" /></p>\n<p>esto seria algo mas del contenido</p>', '2023-12-25 19:28:51', 1, '2024-11-13 23:37:03', 1, 320, 1, NULL);
INSERT INTO `PAGINA` VALUES (3, 'nosotros', 'nosotros', 'nosotros', '<p>Compuesto por varios componentes de nosotros wwwewe</p>', '<!--Causes Details Start-->\n<section class=\"causes-details\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-xl-8 col-lg-7\">\n<div class=\"causes-details__left-bar\">\n<div class=\"causes-details__img\">\n<div class=\"causes-details__img-box\">\n<img src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-03-09/03ea8a91586cc225.jpg\" alt=\"\">\n<div class=\"causes-details__category\">\n<span>Medical</span>\n</div>\n</div>\n<div class=\"causes-details__progress\">\n<div class=\"bar\">\n<div class=\"bar-inner count-bar\" data-percent=\"36%\">\n<div class=\"count-text\">36%</div>\n</div>\n</div>\n<div class=\"causes-details__goals\">\n<p><span>$25,270</span> Raised</p>\n<p><span>$30,000</span> Goal</p>\n</div>\n</div>\n</div>\n<div class=\"causes-details__text-box\">\n<h3>Raise Fund for Clean & Healthy Water</h3>\n<p class=\"causes-details__text-1\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.</p>\n<p class=\"causes-details__text-2\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\n</div>\n<div class=\"causes-details__images-box\">\n<div class=\"row\">\n<div class=\"col-xl-6 col-lg-6\">\n<div class=\"causes-details__images-single\">\n<img src=\"assets/images/resources/causes-details-images-1.jpg\" alt=\"\">\n</div>\n</div>\n<div class=\"col-xl-6 col-lg-6\">\n<div class=\"causes-details__images-single\">\n<img src=\"assets/images/resources/causes-details-images-2.jpg\" alt=\"\">\n</div>\n</div>\n</div>\n</div>\n<div class=\"causes-details__summary\">\n<div class=\"causes-details__summary-text\">\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing. </p>\n</div>\n<div class=\"causes-details__summary-list\">\n<ul class=\"causes-details__summary-list-box list-unstyled\">\n<li>\n<div class=\"icon\">\n<i class=\"fas fa-arrow-circle-right\"></i>\n</div>\n<div class=\"text\">\n<p>Making this first true generator</p>\n</div>\n</li>\n<li>\n<div class=\"icon\">\n<i class=\"fas fa-arrow-circle-right\"></i>\n</div>\n<div class=\"text\">\n<p>Many desktop publish packages</p>\n</div>\n</li>\n<li>\n<div class=\"icon\">\n<i class=\"fas fa-arrow-circle-right\"></i>\n</div>\n<div class=\"text\">\n<p>Lorem Ipsum is not simply</p>\n</div>\n</li>\n<li>\n<div class=\"icon\">\n<i class=\"fas fa-arrow-circle-right\"></i>\n</div>\n<div class=\"text\">\n<p>If you are going to passage</p>\n</div>\n</li>\n<li>\n<div class=\"icon\">\n<i class=\"fas fa-arrow-circle-right\"></i>\n</div>\n<div class=\"text\">\n<p>It has roots in a piece</p>\n</div>\n</li>\n</ul>\n</div>\n</div>\n<div class=\"causes-details__share\">\n<div class=\"causes-details__share-btn-box\">\n<a href=\"#\" class=\"causes-details__share-btn thm-btn\"><i class=\"fas fa-arrow-circle-right\"></i>Donate Us Now</a>\n</div>\n<div class=\"causes-details__share-social\">\n<a href=\"#\"><i class=\"fab fa-twitter\"></i></a>\n<a href=\"#\"><i class=\"fab fa-facebook-square\"></i></a>\n<a href=\"#\"><i class=\"fab fa-dribbble\"></i></a>\n<a href=\"#\"><i class=\"fab fa-instagram\"></i></a>\n</div>\n</div>\n<div class=\"causes-details__download\">\n<div class=\"causes-details__left\">\n<div class=\"icon\">\n<img src=\"assets/images/resources/causes-details-download-icon.png\" alt=\"\">\n</div>\n<div class=\"text\">\n<h4>Our Presentation</h4>\n</div>\n</div>\n<div class=\"causes-details__download-btn-box\">\n<a href=\"#\" class=\"causes-details__download-btn thm-btn\"><i class=\"fas fa-arrow-circle-right\"></i>Download Now</a>\n</div>\n</div>\n<div class=\"comment-one\">\n<h3 class=\"comment-one__title\">Comments</h3>\n<div class=\"comment-one__single\">\n<div class=\"comment-one__image\">\n<img src=\"assets/images/blog/comment-1-1.jpg\" alt=\"\">\n</div>\n<div class=\"comment-one__content\">\n<h3>David Marks <span>3 hours ago</span></h3>\n<p>Sending love. My nephews Nick and Anthony Salaber are your teammates, so I know the caliber person you are. Our whole family is sending our best to you and your family.</p>\n<a href=\"#\" class=\"comment-one__btn thm-btn\"><i class=\"fas fa-arrow-circle-right\"></i>Reply</a>\n</div>\n</div>\n<div class=\"comment-one__single\">\n<div class=\"comment-one__image\">\n<img src=\"assets/images/blog/comment-1-2.jpg\" alt=\"\">\n</div>\n<div class=\"comment-one__content\">\n<h3>Christine Eve <span>3 hours ago</span></h3>\n<p>Sending love. My nephews Nick and Anthony Salaber are your teammates, so I know the caliber person you are. Our whole family is sending our best to you and your family.</p>\n<a href=\"#\" class=\"comment-one__btn thm-btn\"><i class=\"fas fa-arrow-circle-right\"></i>Reply</a>\n</div>\n</div>\n</div>\n<div class=\"comment-form\">\n<h3 class=\"comment-form__title\">Leave a Comment</h3>\n<form action=\"http://layerdrops.com/halpes/assets/inc/sendemail.php\" class=\"comment-one__form contact-form-validated\">\n<div class=\"row\">\n<div class=\"col-xl-6\">\n<div class=\"comment-form__input-box\">\n<input type=\"text\" placeholder=\"Your name\" name=\"name\">\n</div>\n</div>\n<div class=\"col-xl-6\">\n<div class=\"comment-form__input-box\">\n<input type=\"email\" placeholder=\"Email address\" name=\"email\">\n</div>\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-xl-12\">\n<div class=\"comment-form__input-box\">\n<textarea name=\"message\" placeholder=\"Write message\"></textarea>\n</div>\n<button type=\"submit\" class=\"thm-btn comment-form__btn\"><i class=\"fas fa-arrow-circle-right\"></i>Submit Comment</button>\n</div>\n</div>\n</form>\n</div>\n</div>\n</div>\n<div class=\"col-xl-4 col-lg-5\">\n<div class=\"causes-details__right\">\n<div class=\"causes-details__organizer\">\n<div class=\"causes-details__organizer-img\">\n<img src=\"assets/images/resources/causes-details-organizar-img-1.jpg\" alt=\"\">\n</div>\n<div class=\"causes-details__organizer-content\">\n<p>Created 20 Jan, 2021</p>\n<h5>Organizer: <span>Jessica Smith</span></h5>\n<ul class=\"causes-details__organizer-list list-unstyled\">\n<li><i class=\"fas fa-map-marker-alt\"></i>Education</li>\n<li><i class=\"fas fa-map-marker-alt\"></i>Wrightwood, Canada</li>\n</ul>\n</div>\n</div>\n<div class=\"causes-details__donations\">\n<h3 class=\"causes-details__donations-title\">Recent Donations</h3>\n<ul class=\"list-unstyled causes-details__donations-list\">\n<li>\n<div class=\"causes-details__donations-img\">\n<img src=\"assets/images/resources/recent-donation-img-1.jpg\" alt=\"\">\n</div>\n<div class=\"causes-details__donations-content\">\n<h4>$20</h4>\n<h5>David Marks <span>3 hours ago</span></h5>\n<p>God bless you dear</p>\n</div>\n</li>\n<li>\n<div class=\"causes-details__donations-img\">\n<img src=\"assets/images/resources/recent-donation-img-2.jpg\" alt=\"\">\n</div>\n<div class=\"causes-details__donations-content\">\n<h4>$60</h4>\n<h5>Jessica Rose <span>6 hours ago</span></h5>\n<p>God bless you dear</p>\n</div>\n</li>\n<li>\n<div class=\"causes-details__donations-img\">\n<img src=\"assets/images/resources/recent-donation-img-3.jpg\" alt=\"\">\n</div>\n<div class=\"causes-details__donations-content\">\n<h4>$30</h4>\n<h5>Kevim Martin <span>1 day ago</span></h5>\n<p>God bless you dear</p>\n</div>\n</li>\n<li>\n<div class=\"causes-details__donations-img\">\n<img src=\"assets/images/resources/recent-donation-img-4.jpg\" alt=\"\">\n</div>\n<div class=\"causes-details__donations-content\">\n<h4>$180</h4>\n<h5>Anonymous <span>1 day ago</span></h5>\n<p>God bless you dear</p>\n</div>\n</li>\n</ul>\n</div>\n</div>\n</div>\n</div>\n</div>\n</section>\n\n<!--Causes Details End-->', '2023-12-25 19:30:12', 1, '2024-03-09 19:02:19', 1, 318, 2, NULL);
INSERT INTO `PAGINA` VALUES (4, 'noticia i1', 'noticiaI1', 'noticia 3', '<p>resumen de noticia 3</p>\n', '<p>noticia&nbsp;<img alt=\"\" src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-10-31/9def512148cea2df.jpg\" style=\"height:515px; width:411px\" /></p>\n', NULL, 1, '2024-02-25 22:46:11', 1, 319, 1, 2);
INSERT INTO `PAGINA` VALUES (5, 'noticia i3', 'noticia-i3', 'noticia 3', '<p>resumen de noticia 3</p>', '<p>noticia <img alt=\"\" src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-10-31/9def512148cea2df.jpg\" style=\"height:515px; width:411px\" /></p>', NULL, 1, '2024-05-25 18:58:42', 1, 319, 1, 4);
INSERT INTO `PAGINA` VALUES (6, 'noticia i2', 'noticiaI2', 'noticia 2', '<p>resumen de noticia 3</p>\n', '<p>noticia&nbsp;<img alt=\"\" src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2023-10-31/9def512148cea2df.jpg\" style=\"height:515px; width:411px\" /></p>\n', NULL, 1, '2024-02-25 22:46:16', 1, 319, 1, 2);
INSERT INTO `PAGINA` VALUES (46, 'camacho25 tren', 'camacho25-tren', 'camacho', '<p>calero chamorro</p>\n', '<h1><span style=\"color:#e74c3c\"><span style=\"font-size:36px\"><span style=\"font-family:Comic Sans MS,cursive\"><big>calero&nbsp;<img alt=\"\" src=\"http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-03-03/609a4a06fd32129f.jpg\" style=\"height:2000px; width:2000px\" /></big></span></span></span></h1>\n', '2024-02-29 22:33:53', 1, '2024-03-03 18:44:49', 1, 319, 2, NULL);
INSERT INTO `PAGINA` VALUES (47, 'camachosss', 'camachosss', 'camacho', '<p>calero chamorro edwin D</p>\n', '<h1><span style=\"color:#e74c3c\"><span style=\"font-size:36px\"><span style=\"font-family:Comic Sans MS,cursive\"><big>calero</big></span></span></span></h1>\n', '2024-03-01 23:33:48', 1, '2024-03-01 23:38:49', 1, 319, 2, NULL);
INSERT INTO `PAGINA` VALUES (50, 'camacho chavo', 'camacho-chavo', 'camacho', '<p>calero chamorro edwin D</p>\n', '<h1><span style=\"color:#e74c3c\"><span style=\"font-size:36px\"><span style=\"font-family:Comic Sans MS,cursive\"><big>calero</big></span></span></span></h1>\n', '2024-03-01 23:46:25', 1, '2024-03-02 20:34:37', 1, 319, 2, NULL);
INSERT INTO `PAGINA` VALUES (53, 'thiago', 'thiago', 'thiago', '<p>jjj</p>\n', '<p>jjj</p>\n', '2024-03-03 13:43:10', 1, NULL, NULL, 319, 1, 2);
INSERT INTO `PAGINA` VALUES (54, 'berit', 'berit', 'berit', '<p>lkkk</p>\n', '<p>kkkk</p>\n', '2024-03-03 13:44:40', 1, NULL, NULL, 319, 1, NULL);
INSERT INTO `PAGINA` VALUES (55, 'berit 1', 'berit-1', 'berit 1', '<p>llll</p>\n', '<p>llll</p>\n', '2024-03-03 13:46:15', 1, NULL, NULL, 319, 1, 54);
INSERT INTO `PAGINA` VALUES (60, 'edwin', 'edwin', 'inicio de la web', '', '', '2024-11-12 03:04:38', NULL, '2024-11-13 00:38:29', NULL, 318, 1, NULL);
INSERT INTO `PAGINA` VALUES (66, 'edwin', 'edwin-calero', 'inicio de la web', '', '', '2024-11-13 00:42:23', NULL, '2024-11-13 00:42:23', NULL, 318, 1, NULL);
INSERT INTO `PAGINA` VALUES (67, 'edwin', 'edwin-calero-chamorro', 'inicio de la web', '', '', '2024-11-13 00:49:58', NULL, '2024-11-13 00:49:58', 1, 318, 1, NULL);
INSERT INTO `PAGINA` VALUES (68, 'edwin', 'edwin-kennedy', 'inicio de la web', '', '', '2024-11-13 02:40:43', NULL, '2024-11-13 02:40:43', 1, 318, 1, NULL);
INSERT INTO `PAGINA` VALUES (69, 'edwin', 'edwinkennedy', 'inicio de la web', 'aqui se agrega algo mas', 'aqui se agrega el contenido', '2024-11-13 02:41:23', NULL, '2024-11-13 02:41:23', 1, 318, 1, NULL);

-- ----------------------------
-- Table structure for PAGO
-- ----------------------------
DROP TABLE IF EXISTS `PAGO`;
CREATE TABLE `PAGO`  (
  `IDPAGO` int(0) NOT NULL AUTO_INCREMENT,
  `FECHA_PAGO` datetime(0) NULL DEFAULT NULL,
  `MONTO` decimal(6, 2) NULL DEFAULT NULL,
  `CODIGO_PAGO` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'V:VERIFICACION/O:OK',
  `IDPERSONA` int(0) NOT NULL,
  PRIMARY KEY (`IDPAGO`) USING BTREE,
  INDEX `fk_PAGO_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_PAGO_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PAIS
-- ----------------------------
DROP TABLE IF EXISTS `PAIS`;
CREATE TABLE `PAIS`  (
  `IDPAIS` int(0) NOT NULL AUTO_INCREMENT,
  `ISO` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRE` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ISBAN` int(0) NULL DEFAULT NULL,
  `IDIOMA` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PREFIJO_TEL` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDPAIS`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PAIS
-- ----------------------------
INSERT INTO `PAIS` VALUES (1, 'AF', 'Afganistán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (2, 'AX', 'Islas Gland', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (3, 'AL', 'Albania', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (4, 'DE', 'Alemania', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (5, 'AD', 'Andorra', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (6, 'AO', 'Angola', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (7, 'AI', 'Anguilla', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (8, 'AQ', 'Antártida', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (9, 'AG', 'Antigua y Barbuda', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (10, 'AN', 'Antillas Holandesas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (11, 'SA', 'Arabia Saudí', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (12, 'DZ', 'Argelia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (13, 'AR', 'Argentina', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (14, 'AM', 'Armenia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (15, 'AW', 'Aruba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (16, 'AU', 'Australia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (17, 'AT', 'Austria', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (18, 'AZ', 'Azerbaiyán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (19, 'BS', 'Bahamas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (20, 'BH', 'Bahréin', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (21, 'BD', 'Bangladesh', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (22, 'BB', 'Barbados', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (23, 'BY', 'Bielorrusia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (24, 'BE', 'Bélgica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (25, 'BZ', 'Belice', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (26, 'BJ', 'Benin', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (27, 'BM', 'Bermudas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (28, 'BT', 'Bhután', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (29, 'BO', 'Bolivia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (30, 'BA', 'Bosnia y Herzegovina', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (31, 'BW', 'Botsuana', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (32, 'BV', 'Isla Bouvet', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (33, 'BR', 'Brasil', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (34, 'BN', 'Brunéi', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (35, 'BG', 'Bulgaria', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (36, 'BF', 'Burkina Faso', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (37, 'BI', 'Burundi', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (38, 'CV', 'Cabo Verde', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (39, 'KY', 'Islas Caimán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (40, 'KH', 'Camboya', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (41, 'CM', 'Camerún', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (42, 'CA', 'Canadá', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (43, 'CF', 'República Centroafricana', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (44, 'TD', 'Chad', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (45, 'CZ', 'República Checa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (46, 'CL', 'Chile', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (47, 'CN', 'China', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (48, 'CY', 'Chipre', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (49, 'CX', 'Isla de Navidad', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (50, 'VA', 'Ciudad del Vaticano', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (51, 'CC', 'Islas Cocos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (52, 'CO', 'Colombia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (53, 'KM', 'Comoras', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (54, 'CD', 'República Democrática del Congo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (55, 'CG', 'Congo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (56, 'CK', 'Islas Cook', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (57, 'KP', 'Corea del Norte', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (58, 'KR', 'Corea del Sur', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (59, 'CI', 'Costa de Marfil', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (60, 'CR', 'Costa Rica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (61, 'HR', 'Croacia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (62, 'CU', 'Cuba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (63, 'DK', 'Dinamarca', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (64, 'DM', 'Dominica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (65, 'DO', 'República Dominicana', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (66, 'EC', 'Ecuador', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (67, 'EG', 'Egipto', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (68, 'SV', 'El Salvador', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (69, 'AE', 'Emiratos Árabes Unidos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (70, 'ER', 'Eritrea', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (71, 'SK', 'Eslovaquia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (72, 'SI', 'Eslovenia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (73, 'ES', 'España', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (74, 'UM', 'Islas ultramarinas de Estados Unidos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (75, 'US', 'Estados Unidos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (76, 'EE', 'Estonia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (77, 'ET', 'Etiopía', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (78, 'FO', 'Islas Feroe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (79, 'PH', 'Filipinas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (80, 'FI', 'Finlandia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (81, 'FJ', 'Fiyi', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (82, 'FR', 'Francia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (83, 'GA', 'Gabón', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (84, 'GM', 'Gambia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (85, 'GE', 'Georgia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (87, 'GH', 'Ghana', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (88, 'GI', 'Gibraltar', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (89, 'GD', 'Granada', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (90, 'GR', 'Grecia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (91, 'GL', 'Groenlandia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (92, 'GP', 'Guadalupe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (93, 'GU', 'Guam', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (94, 'GT', 'Guatemala', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (95, 'GF', 'Guayana Francesa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (96, 'GN', 'Guinea', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (97, 'GQ', 'Guinea Ecuatorial', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (98, 'GW', 'Guinea-Bissau', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (99, 'GY', 'Guyana', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (100, 'HT', 'Haití', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (101, 'HM', 'Islas Heard y McDonald', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (102, 'HN', 'Honduras', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (103, 'HK', 'Hong Kong', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (104, 'HU', 'Hungría', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (105, 'IN', 'India', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (106, 'ID', 'Indonesia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (107, 'IR', 'Irán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (108, 'IQ', 'Iraq', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (109, 'IE', 'Irlanda', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (110, 'IS', 'Islandia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (111, 'IL', 'Israel', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (112, 'IT', 'Italia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (113, 'JM', 'Jamaica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (114, 'JP', 'Japón', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (115, 'JO', 'Jordania', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (116, 'KZ', 'Kazajstán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (117, 'KE', 'Kenia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (118, 'KG', 'Kirguistán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (119, 'KI', 'Kiribati', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (120, 'KW', 'Kuwait', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (121, 'LA', 'Laos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (122, 'LS', 'Lesotho', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (123, 'LV', 'Letonia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (124, 'LB', 'Líbano', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (125, 'LR', 'Liberia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (126, 'LY', 'Libia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (127, 'LI', 'Liechtenstein', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (128, 'LT', 'Lituania', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (129, 'LU', 'Luxemburgo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (130, 'MO', 'Macao', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (131, 'MK', 'ARY Macedonia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (132, 'MG', 'Madagascar', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (133, 'MY', 'Malasia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (134, 'MW', 'Malawi', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (135, 'MV', 'Maldivas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (136, 'ML', 'Malí', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (137, 'MT', 'Malta', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (138, 'FK', 'Islas Malvinas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (139, 'MP', 'Islas Marianas del Norte', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (140, 'MA', 'Marruecos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (141, 'MH', 'Islas Marshall', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (142, 'MQ', 'Martinica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (143, 'MU', 'Mauricio', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (144, 'MR', 'Mauritania', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (145, 'YT', 'Mayotte', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (146, 'MX', 'México', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (147, 'FM', 'Micronesia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (148, 'MD', 'Moldavia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (149, 'MC', 'Mónaco', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (150, 'MN', 'Mongolia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (151, 'MS', 'Montserrat', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (152, 'MZ', 'Mozambique', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (153, 'MM', 'Myanmar', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (154, 'NA', 'Namibia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (155, 'NR', 'Nauru', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (156, 'NP', 'Nepal', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (157, 'NI', 'Nicaragua', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (158, 'NE', 'Níger', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (159, 'NG', 'Nigeria', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (160, 'NU', 'Niue', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (161, 'NF', 'Isla Norfolk', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (162, 'NO', 'Noruega', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (163, 'NC', 'Nueva Caledonia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (164, 'NZ', 'Nueva Zelanda', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (165, 'OM', 'Omán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (166, 'NL', 'Países Bajos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (167, 'PK', 'Pakistán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (168, 'PW', 'Palau', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (169, 'PS', 'Palestina', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (170, 'PA', 'Panamá', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (171, 'PG', 'Papúa Nueva Guinea', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (172, 'PY', 'Paraguay', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (173, 'PE', 'Perú', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (174, 'PN', 'Islas Pitcairn', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (175, 'PF', 'Polinesia Francesa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (176, 'PL', 'Polonia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (177, 'PT', 'Portugal', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (178, 'PR', 'Puerto Rico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (179, 'QA', 'Qatar', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (180, 'GB', 'Reino Unido', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (181, 'RE', 'Reunión', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (182, 'RW', 'Ruanda', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (183, 'RO', 'Rumania', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (184, 'RU', 'Rusia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (185, 'EH', 'Sahara Occidental', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (186, 'SB', 'Islas Salomón', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (187, 'WS', 'Samoa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (188, 'AS', 'Samoa Americana', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (189, 'KN', 'San Cristóbal y Nevis', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (190, 'SM', 'San Marino', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (191, 'PM', 'San Pedro y Miquelón', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (192, 'VC', 'San Vicente y las Granadinas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (193, 'SH', 'Santa Helena', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (194, 'LC', 'Santa Lucía', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (195, 'ST', 'Santo Tomé y Príncipe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (196, 'SN', 'Senegal', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (197, 'CS', 'Serbia y Montenegro', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (198, 'SC', 'Seychelles', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (199, 'SL', 'Sierra Leona', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (200, 'SG', 'Singapur', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (201, 'SY', 'Siria', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (202, 'SO', 'Somalia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (203, 'LK', 'Sri Lanka', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (204, 'SZ', 'Suazilandia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (205, 'ZA', 'Sudáfrica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (206, 'SD', 'Sudán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (207, 'SE', 'Suecia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (208, 'CH', 'Suiza', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (209, 'SR', 'Surinam', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (210, 'SJ', 'Svalbard y Jan Mayen', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (211, 'TH', 'Tailandia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (212, 'TW', 'Taiwán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (213, 'TZ', 'Tanzania', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (214, 'TJ', 'Tayikistán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (215, 'IO', 'Territorio Británico del Océano Índico', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (216, 'TF', 'Territorios Australes Franceses', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (217, 'TL', 'Timor Oriental', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (218, 'TG', 'Togo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (219, 'TK', 'Tokelau', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (220, 'TO', 'Tonga', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (221, 'TT', 'Trinidad y Tobago', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (222, 'TN', 'Túnez', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (223, 'TC', 'Islas Turcas y Caicos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (224, 'TM', 'Turkmenistán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (225, 'TR', 'Turquía', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (226, 'TV', 'Tuvalu', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (227, 'UA', 'Ucrania', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (228, 'UG', 'Uganda', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (229, 'UY', 'Uruguay', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (230, 'UZ', 'Uzbekistán', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (231, 'VU', 'Vanuatu', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (232, 'VE', 'Venezuela', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (233, 'VN', 'Vietnam', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (234, 'VG', 'Islas Vírgenes Británicas', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (235, 'VI', 'Islas Vírgenes de los Estados Unidos', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (236, 'WF', 'Wallis y Futuna', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (237, 'YE', 'Yemen', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (238, 'DJ', 'Yibuti', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (239, 'ZM', 'Zambia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PAIS` VALUES (240, 'ZW', 'Zimbabue', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for PEDIDO
-- ----------------------------
DROP TABLE IF EXISTS `PEDIDO`;
CREATE TABLE `PEDIDO`  (
  `IDPEDIDO` int(0) NOT NULL AUTO_INCREMENT,
  `COSTO` decimal(5, 0) NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TOTAL` decimal(4, 0) NULL DEFAULT NULL,
  `IDCLIENTE` int(0) NOT NULL,
  `IDPERSONAL` int(0) NOT NULL,
  PRIMARY KEY (`IDPEDIDO`) USING BTREE,
  INDEX `fk_PEDIDO_CLIENTE1_idx`(`IDCLIENTE`) USING BTREE,
  INDEX `fk_PEDIDO_PERSONAL1_idx`(`IDPERSONAL`) USING BTREE,
  CONSTRAINT `fk_PEDIDO_CLIENTE1` FOREIGN KEY (`IDCLIENTE`) REFERENCES `CLIENTE` (`IDCLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_PEDIDO_PERSONAL1` FOREIGN KEY (`IDPERSONAL`) REFERENCES `PERSONAL` (`IDPERSONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PERMISO
-- ----------------------------
DROP TABLE IF EXISTS `PERMISO`;
CREATE TABLE `PERMISO`  (
  `IDUSUARIO` int(0) NOT NULL,
  `IDOBJACCESO` int(0) NOT NULL,
  `TIPO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'P:PERMITIDO/B:BLOQUEADO',
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'A:ACTIVO/I:INACTIVO',
  `SYSCREACION` datetime(0) NULL DEFAULT NULL,
  `SYSACTUALIZACION` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDUSUARIO`, `IDOBJACCESO`) USING BTREE,
  INDEX `fk_USUARIO_has_OBJACCESO_OBJACCESO1_idx`(`IDOBJACCESO`) USING BTREE,
  INDEX `fk_USUARIO_has_OBJACCESO_USUARIO1_idx`(`IDUSUARIO`) USING BTREE,
  CONSTRAINT `fk_USUARIO_has_OBJACCESO_OBJACCESO1` FOREIGN KEY (`IDOBJACCESO`) REFERENCES `OBJACCESO` (`IDOBJACCESO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_USUARIO_has_OBJACCESO_USUARIO1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `USUARIO` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PERSONA
-- ----------------------------
DROP TABLE IF EXISTS `PERSONA`;
CREATE TABLE `PERSONA`  (
  `IDPERSONA` int(0) NOT NULL AUTO_INCREMENT,
  `TIPODOCUMENTO` int(0) NULL DEFAULT NULL,
  `NRODOCUMENTO` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRES` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `APELLIDO_PATERNO` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `APELLIDO_MATERNO` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FOTO` varchar(330) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FECHA_NACIMIENTO` date NULL DEFAULT NULL,
  `GENERO` int(0) NULL DEFAULT NULL COMMENT 'M:MASCULINO/F:FEMENINO',
  `CREADOR_REGISTRO` int(0) NULL DEFAULT NULL,
  `SYSTEMA` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TIPO_PERSONA` int(2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT 'Natural / Juridica',
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'Son restricciones: no vivo / restriccion legal /',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDPERSONA`) USING BTREE,
  INDEX `fk_PERSONA_DOCADJUNTO1_idx`(`FOTO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 738 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PERSONA
-- ----------------------------
INSERT INTO `PERSONA` VALUES (1, 1, '41833874', 'EDWIN KENNEDY', 'CALERO', 'CHAMORRO', 'http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-11-24/8c4bfa0a025e1f3a.png', '1982-04-13', 311, 1, NULL, 24, 19, NULL, '2024-11-24 10:05:15');
INSERT INTO `PERSONA` VALUES (2, 23, '20480865198', 'FULL SAFETY S.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 20, NULL, NULL);
INSERT INTO `PERSONA` VALUES (3, 23, '20100030595', 'BANCO DE LA NACION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (4, 23, '0', 'JUANJO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (6, 23, '20338570041', 'PRAXAIR PERU S.R.L.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (7, 23, '20100094135', 'EXSA S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (8, 23, '20554545743', 'CORPORACION PRIMAX S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (9, 23, '20419387658', 'CEMENTOS PACASMAYO S.A.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (10, 23, '20553167672', 'NUMAY S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (11, 23, '20260733916', 'ORICA CHEMICALS PERU S.A.C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (12, 23, '20100039207', 'RANSA COMERCIAL S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (13, 23, '20259880603', 'EXXONMOBIL DEL PERU S.R.L.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (14, 23, '20137291313', 'MINERA YANACOCHA S.R.L.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (16, 23, '20330791501', 'QUIMPAC S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (17, 23, '20100283884', 'TRANSPORTES ACOSTA Z. EIRL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (18, 23, '20101200125', 'QUIMEX S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (19, 23, '222', 'Quimpac SA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (20, 23, '1222', 'AIR PRODUCTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (21, 23, '123', 'MULTITRAC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (22, 23, '123', 'M. CATALAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (23, 23, '123', 'ACUARUIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (25, 23, '123', 'CUMIRS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (26, 23, '123', 'IGC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (27, 23, '123', 'TGL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (28, 23, '123', 'DCR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (29, 23, '123', 'TRANSMI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (30, 23, '123', 'EMICONSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (31, 23, '123', 'MESSER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (32, 23, '20132062448', 'TRANSPORTES RODRIGO CARRANZA S.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (35, 23, '20369120817', 'TRANSPORTES M. CATALAN S.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (36, 23, '0', 'GOLDFIELDS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (37, 23, '20505470941', 'JP. LOGISTICA S.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (38, 23, '20453693822', 'MULTITRANSPORTES CAJAMARCA S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (39, 23, '20453556086', 'TRANSPORTES ACUARIO S.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (41, 23, '20100228191', 'TRANSALTISA S.A. ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (43, 23, '20529527358', 'EMPRESA DE TRANSPORTES TRANSGROUP CAJAMARCA S.A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (44, 23, '20411217346', 'INVERSIONES GENERALES CRISTIAN S.R.L.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (45, 23, '20412524218', 'DCR MINERÍA Y CONSTRUCCIÓN S.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (47, 23, '20454158050', 'MC TRANSPORTE S.R.L.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (49, 23, '20107012011', 'APM TERMINALS INLAND SERVICES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (53, 23, '20100985722', 'ENGINEERING SERVICES S.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (54, 23, '20496049633', 'ECOMA PERÃš E.I.R.L.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (55, 23, '20107012011', 'APM TERMINALS INLAND SERVICES S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (56, 23, '20338570041', 'PRAXAIR PERU SRL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (57, 23, '20565960548', 'ANDIKEM PERU SRL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (58, 23, '20100028698', 'FERREYROS SOCIEDAD ANÓNIMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (59, 23, '20411423833', 'QUIROZ ROJAS HNOS. CONTRATIST GRALES SRL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (60, 23, '20100359708', 'RENOVA S.A.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (61, 1, '16725420', 'Guido Alexis', 'Cruz', 'Perez', NULL, '1973-07-12', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (62, 1, '42785339', 'Juan Carlos', 'Oclocho ', 'Vargas', NULL, '1984-11-05', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (63, 1, '19330801', 'Victor', 'Saenz', 'Guarniz', NULL, '1975-08-26', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (64, 1, '46658352', 'Pereda', 'Burgos Pereda', 'Vera', NULL, '1990-11-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (65, 1, '0', 'Luis Valentín', 'Burgos', 'Pereda', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (66, 1, '0', 'Vítor Hugo', 'Muñoz', 'Alcalde', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (67, 1, '11111111', 'Dante', 'Becerra', 'Gaona', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (68, 1, '0', 'Jimmy ', 'Gallardo', 'Astopilco', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (69, 1, '0', 'Segundo', 'Valencia', 'Calua', NULL, '2018-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (70, 1, '0', 'Luis ', 'Arroyo', 'Arbildo', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (71, 1, '0', 'Noe ', 'Quiac', 'Bada', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (72, 1, '0', 'Jorge ', 'Saldaña', 'Atalayo', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (73, 1, '0', 'Santiago', 'Espinoza', 'Acosta', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (74, 1, '0', 'Jose ', 'Salcedo ', 'Vasquez', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (75, 1, '0', 'Paul', 'Lopez', 'Villegas ', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (76, 1, '0', 'Dante ', 'Becerra', 'Gaona', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (77, 1, '0', 'Fernando', 'Soto', 'Huaman', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (78, 1, '0', 'Miguel', 'Vasquez', 'Cerquin', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (79, 1, '0', 'Percy ', 'Mejia ', 'Burga', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (80, 1, '9937113', 'Silverio', 'Bueno ', 'Linares', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (81, 1, '0', 'Wilian', 'Martos ', 'Briones ', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (82, 1, '0', 'Humberto', 'Muñoz', 'Abanto ', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (83, 1, '0', 'Hector', 'Gonzalez', 'Cornejo', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (84, 1, '26720207', 'David', 'Guevara ', 'Quispe', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (85, 1, '0', 'Dante', 'Becerra', 'Vasquez', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (86, 1, '13409030', 'Frank Harold ', 'Rosas ', 'Vega', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (87, 1, '0', 'Carlos', 'Coronado', 'Sandoval', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (88, 1, '0', 'JORGE', 'VENEGAS', 'GALA', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (89, 1, '0', 'CARLOS', 'SOTOMAYOR', 'AGUIRRE', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (90, 1, '40582591', 'Edgar', 'Suarez', 'Laboriano', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (91, 1, '26698403', 'Edgardo', 'Pajares', 'Torres', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (92, 1, '2661705', 'José', 'García', 'Cueva', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (93, 1, '41313918', 'Ever', 'Raico', 'Huaccha', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (94, 1, '6268344', 'Jorge', 'Venegas', 'Gala', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (95, 1, '40582591', 'Edgar Jhoni', 'Suarez', 'Laboriano', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (96, 1, '26617025', 'José', 'García', 'Chiza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (97, 1, '45031683', 'Ronald', 'Hernandes', 'Chavarry', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (98, 1, '42089750', 'Miguel ', 'Guevara ', 'Vásquez', NULL, '1975-10-18', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (99, 1, '41459482', 'Juan Carlos', 'Flores', 'Ramírez', NULL, '1981-10-29', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (100, 1, '17543475', 'Augusto', 'Ayala', 'Juarez', NULL, '1970-11-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (101, 1, '26718808', 'Jaime ', 'Valiente', 'Tafur', NULL, '1976-11-12', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (102, 1, '42794906', 'Bernardino ', 'Vásquez', 'Gonzales', NULL, '1982-09-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (103, 1, '26657244', 'Segundo Aníbal', 'Ocas ', 'Rodriguez', NULL, '1965-12-21', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (104, 1, '41017754', 'Carlos Fernando', 'Malaver', 'Olortegui', NULL, '1980-01-30', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (105, 1, '41676795', 'Ronald ', 'Cortez', 'Sarmiento', NULL, '1983-04-16', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (106, 1, '43253618', 'Perci', 'Mejía', 'Burga', NULL, '1985-10-26', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (107, 1, '42794906', 'Bernardino ', 'Vásquez', 'Gonzales', NULL, '1982-09-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (108, 1, '17628379', 'Hector', 'Gonzales', 'Cornejo', NULL, '2018-07-17', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (109, 1, '26682821', 'Avelino', 'Santillan', 'Luicho', NULL, '1971-11-10', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (110, 1, '0', 'Santiago', 'Acosta', 'Espinoza', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (111, 1, '43407124', 'Martín ', 'Cachi', 'Linares', NULL, '1985-12-05', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (112, 1, '41218007', 'Delboy', 'Malca', 'Micha', NULL, '1978-09-11', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (113, 1, '10868985', 'Jean', 'Roca', 'Constantini', NULL, '1978-10-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (114, 1, '15858192', 'Uber', 'Espejo', 'Cercado', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (115, 1, '42867592', 'Fernando ', 'Rojas', 'Culqui', NULL, '1985-03-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (116, 1, '7520703', 'Edson Arturo', 'Llana', 'Chávez', NULL, '1964-10-16', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (117, 1, '9889480', 'Henry ', 'García ', 'Vigo', NULL, '1973-04-22', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (118, 1, '0', 'Hitler', 'Cabanillas', 'Teran', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (119, 1, '0', 'Luis', 'Sangay', 'Quito', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (120, 1, '0', 'Joohn', 'Valdiviezo', 'Mejia', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (121, 1, '0', 'Jesús', 'Diaz', 'Gutierrez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (122, 1, '0', 'FREDDY', 'ORTIZ', 'CARRASCO', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (123, 1, '0', 'Juan', 'Florez', 'Infante', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (124, 1, '41082377', 'José', 'Eugenio ', 'Huatay', NULL, '1984-09-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (125, 1, '70876785', 'Segundo', 'Valencia', 'Calua', NULL, '1990-05-05', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (126, 1, '7973176', 'Rúben ', 'Naveda ', 'Solis', NULL, '1970-04-17', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (127, 1, '41707533', 'Rolando ', 'Julcamoro ', 'Mendo', NULL, '1982-08-07', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (128, 1, '40963699', 'Segundo Arquímedes', 'Rojas', 'Tello', NULL, '1978-10-30', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (129, 1, '26637721', 'Máximo', 'García', 'Cueva', NULL, '1963-04-08', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (130, 1, '26723954', 'Dionicio ', 'Mendoza ', 'Arroyo', NULL, '1965-11-11', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (131, 1, '0', 'ITMAR', 'MACIZO', 'DIAZ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (132, 1, '0', 'Carlos', 'Mantilla', 'Garay', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (133, 1, '41179572', 'Segundo Raúl', 'Ocas ', 'Rodriguez', NULL, '1980-04-19', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (134, 1, '40829807', 'Jorge', 'Saldaña ', 'Atalaya', NULL, '1979-07-19', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (135, 1, '26614008', 'Augusto ', 'Huingo', 'Casahuamán', NULL, '1984-07-28', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (136, 1, '26614008', 'Javier Humberto', 'Muñoz', 'Abanto', NULL, '1965-06-27', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (137, 1, '31745251', 'Cristian', 'Portales ', 'Ventura', NULL, '1983-05-07', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (138, 1, '0', 'Gilmer', 'Pajares', 'Torres', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (139, 1, '0', 'Edgar', 'Florez', 'Vilca', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (140, 1, '0', 'Jacinto', 'Pastor', 'Rojas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (141, 1, '0', 'Salomon', 'Salazar', 'Rodriguez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (142, 1, '0', 'JORGE', 'SALDAÑA', 'ATALAYA', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (143, 1, '26635689', 'Segundo', 'Malca', 'Mendoza', NULL, '1964-06-10', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (144, 1, '26682659', 'Fernando', 'Soto', 'Huamán', NULL, '1970-09-21', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (145, 1, '26691980', 'Medardo ', 'Cotrina ', 'Mendoza', NULL, '1966-12-07', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (146, 1, '80627251', 'Huamán ', 'Ludeña', 'Alex', NULL, '1974-12-05', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (147, 1, '26723229', 'José ', 'Cortez', 'Aliaga', NULL, '1974-12-05', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (148, 1, '80627251', 'Alex', 'Huamán', 'Ludeña', NULL, '1980-03-27', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (149, 1, '0', 'Huner', 'Bazan', 'Rodriguez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (150, 1, '0', 'PEPE', 'MOROCHO', 'CHUQUIMANGO', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (151, 1, '0', 'Luis', 'Valencia', 'Calua', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (152, 1, '0', 'HUGO', 'PERALTA ', 'LOZANO', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (153, 1, '0', 'Pedro', 'Suarez', 'A', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (154, 1, '0', 'José', 'Litano', 'Quispe', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (155, 1, '0', 'Pedro Gerardo', 'Suarez', 'Roldan', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (156, 1, '0', 'Wilson', 'Vasquez', 'Cabanillas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (157, 1, '0', 'Walter', 'Cachay', 'Medina', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (158, 1, '0', 'Jose', 'Galvez', 'Arroyo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (159, 1, '0', 'Jesús', 'Vasquez', 'Caruajulca', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (160, 1, '0', 'Victor', 'Ochoa', 'Paredes', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (161, 1, '0', 'LUIS', 'CERDAN', 'MARIN', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (162, 1, '0', 'WILDER', 'VEGA', 'VILLAR', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (163, 1, '0', 'VITELIO', 'ORTIZ', 'CABANILLAS', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (164, 1, '0', 'LUIS', 'ACUÑA', 'RONCAL', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (165, 1, '0', 'PEDRO ', 'GONZALEZ', 'PEREZ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (166, 1, '0', 'JAVIER', 'LUYO', 'CHUMPITAZ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (167, 1, '0', 'German', 'Gonzales', 'Cornejo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (168, 1, '0', 'Hober', 'Vásquez', 'Cabanillas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (169, 1, '0', 'Alfonso', 'Huaman', 'Cueva', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (170, 1, '0', 'Jorge', 'Alvarez', 'Quito', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (171, 1, '0', 'Luis', 'Herrera', 'Gomero', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (172, 1, '0', 'Victor', 'Quiroz', 'Valencia', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (173, 1, '0', 'Claudio', 'Sanchez', 'Chacon', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (174, 1, '0', 'Marcos ', 'Becerra', 'Vasquez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (175, 1, '0', 'German ', 'Goicochea', 'Galvez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (176, 1, '0', 'Elmer', 'Pérez', 'Silva', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (177, 1, '0', 'Alcides', 'Bullón', 'Torpoco', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (178, 1, '0', 'José', 'Gil', 'Araujo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (179, 1, '0', 'Jorge', 'Chilón', 'Garay', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (180, 1, '0', 'Dionicio ', 'Mendoza', 'Arroyo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (181, 1, '0', 'Roger', 'Yarango ', 'Cruz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (182, 1, '0', 'Juan', 'Salas', 'Castro', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (183, 1, '0', 'Ernesto  ', 'Palomino', 'Changanaqui', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (184, 1, '0', 'Francisco', 'Chilón', 'Chuquipoma', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (185, 1, '0', 'Luis', 'Vite', 'Casaverde', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (186, 1, '0', 'Victor', 'Diaz', 'Giraldo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (187, 1, '19251942', 'Santos', 'Carrera', 'Terrones', NULL, '1969-08-18', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (188, 1, '40235389', 'Johny ', 'Pinedo ', 'Conche', NULL, '1979-04-28', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (189, 1, '25406142', 'Luis ', 'Poma', 'Salas', NULL, '1964-07-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (190, 1, '25547172', 'Luis', 'Vite', 'Casaverde', NULL, '1966-10-27', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (191, 1, '40182051', 'Fernando ', 'Limaylla', 'Torres', NULL, '1979-03-11', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (192, 1, '18055067', 'Carlos ', 'Vásquez', 'Cabanillas', NULL, '1967-05-18', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (193, 1, '18103378', 'Wilsón ', 'Vásquez ', 'Cabanillas', NULL, '1967-01-20', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (194, 1, '20888085', 'Walter', 'Cordova', 'Camavilca', NULL, '1966-06-26', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (195, 1, '16649470', 'Wilsón ', 'Rojas', 'Pardo', NULL, '1966-06-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (196, 1, '42671894', 'Eloy', 'Quiliche ', 'Vargas', NULL, '1984-10-27', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (197, 1, '70021606', 'Itmar', 'Macizo ', 'Díaz', NULL, '1990-05-09', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (198, 1, '46256524', 'Juan', 'Mendoza', 'Villegas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (199, 1, '0', 'Alex', 'Peralta', 'Escobal', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (200, 1, '41754494', 'Luis', 'Cerdan', 'Marín', NULL, '1983-02-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (201, 1, '16641637', 'William', 'Acosta', 'Tejada', NULL, '1966-03-11', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (202, 1, '45143088', 'Víctor', 'Briones ', 'Miranda', NULL, '1988-06-19', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (203, 1, '25801704', 'Gualberto', 'Challco', 'Vargas', NULL, '1978-12-26', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (204, 1, '26708794', 'Juan ', 'Huatay', 'Sangay', NULL, '1967-10-23', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (205, 1, '47576812', 'Herminio', 'Montesinos', 'Castillo', NULL, '1992-07-26', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (206, 1, '43731237', 'Miltón', 'Marín ', 'Sanchez', NULL, '1986-09-15', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (207, 1, '40504757', 'Eber', 'Rabanal', 'Cacho', NULL, '1979-01-09', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (208, 1, '0', 'prueba', 'prueba', 'prueba', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (209, 1, '0', 'Segundo', 'Campos ', 'Chavez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (210, 1, '15778501', '  Javier José', 'Andia', 'Mayta', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (211, 1, '15778502', '  Edmundo Arnulfo', 'Arzapalo', 'Carhuas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (212, 1, '15778504', '  José del Carmen', 'Checa', 'Farfan', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (213, 1, '15778506', '  Wilder Manuel', 'Camavilca', 'Rubio', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (214, 1, '15778508', '  Braulio Joel', 'Mamani', 'De los Rios', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (215, 1, '15778509', '  Cesar Savid', 'Mendoza', 'Vera', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (216, 1, '15778510', '  Jorge Luis', 'Pachas', 'Arteaga', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (217, 1, '15778512', 'Hermez', 'Rojas', 'Olarte', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (218, 1, '15778513', 'Alejandro', 'Solano', 'Paita', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (219, 1, '15778514', 'Jorge Alberto', 'Suerez', 'Vera', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (220, 1, '15778515', '  Cesar Eduardo', 'Ustiano', 'Gonzales', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (221, 1, '15778509', '  CESAR SAVID', 'MENDOZA', 'VERA', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (222, 1, '15778513', '  ALEJANDRO ', 'SOLANO', 'PAITA', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (223, 1, '15778514', '  JORGE ALBERTO', 'SUEREZ', 'VERA', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (224, 1, '15778515', '  CESAR EDUARDO', 'USTIANO', 'GONZALES', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (225, 1, '15778516', '  Francisco', 'Castro', 'Chuquiruna', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (226, 1, '15778517', 'Arturo', 'Sovero', 'Ramos', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (227, 1, '15778521', 'Itmar', 'Mejia', 'Diaz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (228, 1, '15778522', '  Gonzalo', 'Castillo', 'Cruz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (229, 1, '15778524', '  Jorge Armando', 'Sanchez', 'Ponce', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (230, 1, '26637721', 'Máximo', 'García ', 'Cueva', NULL, '1963-08-04', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (231, 1, '25573351', 'Carlos ', 'Sotomayor', 'Aguirre', NULL, '1964-12-11', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (232, 1, '19873835', 'Justo', 'Bautista', 'Dionisio', NULL, '1972-05-14', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (233, 1, '45891461', 'Edwin', 'Arango', 'Lopez', NULL, '1989-08-28', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (234, 1, '26698002', 'Jorge ', 'Miranda', 'Abanto', NULL, '1973-06-25', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (235, 1, '27060749', 'Edinson', 'Chávez', 'Reyna', NULL, '1976-04-17', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (236, 1, '26716249', 'Register ', 'Sánchez', 'Banda', NULL, '1951-04-06', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (237, 1, '43001862', 'Luis Enrique', 'Chávez', 'Solano', NULL, '1981-03-08', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (238, 1, '18851125', 'Segundo', 'Sanchez', 'Fernandez', NULL, '1965-10-31', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (239, 1, '0', 'Segundo', 'Sanchez', 'Fernandez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (240, 1, '26716249', 'Register', 'Sanchez', 'Banda', NULL, '1951-04-06', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (241, 1, '44289825', 'Alan', 'Ramos', 'Medina', NULL, '1986-07-09', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (242, 1, '0', 'Register', 'Sanchez ', 'Banda', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (243, 1, '0', 'Register', 'Sanchez', 'Banda', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (244, 1, '0', 'REGISTER', 'SANCHEZ', 'BANDA', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (245, 1, '26707343', 'Francisco ', 'Becerra', 'Amambal', NULL, '1971-10-10', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (246, 1, '44465005', 'Marcos ', 'Becerra', 'Vásquez', NULL, '1987-05-15', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (247, 1, '17628379', 'Hector ', 'Gonzales', 'Cornejo', NULL, '1968-10-12', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (248, 1, '17958839', 'Javier', 'Luyo', 'Chumpitaz', NULL, '1965-11-08', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (249, 1, '40524689', 'Alejandro ', 'Malca', 'Chávez', NULL, '1979-01-14', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (250, 1, '40836993', 'Pedro', 'Gonzalez', 'Perez', NULL, '1978-12-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (251, 1, '0', 'MISAEL', 'MOZA', 'OLAZO', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (252, 1, '0', 'SEGUNDO ', 'MALCA ', 'MENDOZA', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (253, 1, '0', 'Segundo', 'Barba', 'Huatay', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (254, 1, '16763975', 'Víctor', 'Aguilar ', 'Vásquez', NULL, '1969-02-15', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (255, 1, '16763975', 'Hugo', 'Peralta', 'Lozano', NULL, '1969-02-15', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (256, 1, '27565651', 'Víctor', 'Aguilar ', 'Vásquez', NULL, '1970-08-08', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (257, 1, '26689975', 'Segundo Walter', 'Cachay', 'Medina', NULL, '1968-01-03', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (258, 1, '18103378', 'Wilsón ', 'Vásquez', 'Cabanillas', NULL, '1967-01-20', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (259, 1, '42170545', 'Jorge ', 'Vásquez', 'Cabanillas', NULL, '1983-10-28', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (260, 1, '44051720', 'Miguel ', 'Sánchez', 'Morocho', NULL, '1986-12-24', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (261, 1, '9889480', 'Henry', 'García ', 'Vigo', NULL, '1973-04-22', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (262, 1, '26637721', 'Máximo', 'García ', 'Cueva', NULL, '1963-04-08', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (263, 1, '42417428', 'Dennis', 'Raico', 'Urdampilleta', NULL, '1984-06-13', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (264, 1, '26646004', 'Vitelio ', 'Ortiz', 'Cabanillas', NULL, '1972-07-26', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (265, 1, '20107932', 'Santos Eladio', 'Pompa', 'Gutierrez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (266, 1, '26691980', 'Medardo ', 'Cotrina', 'Mendoza', NULL, '1966-12-07', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (267, 1, '40524689', 'ALEJANDRO', 'MALCA', 'CHAVEZ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (268, 1, '797436', 'Carlos', 'Morales', 'Luna', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (269, 1, '40836993', 'PEDRO', 'GONZALES', 'PEREZ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (270, 1, '26708086', 'Segundo', 'Alcantara', 'Briones', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (271, 1, '16621697', 'William', 'Rodriguez', 'Pintado', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (272, 1, '17958839', 'JAVIER', 'LUYO', 'CHUMPITAZ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (273, 1, '17958839', 'JAVIER', 'LUYO', 'CHUMPITAZ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (274, 1, '44289825', 'Alan', 'Ramos', 'Medina', NULL, '1986-07-09', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (275, 1, '46350500', 'Luis Alberto', 'Acuña', 'Roncal', NULL, '1989-03-24', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (276, 1, '1101441', 'Wilder', 'Villar', 'Vega', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (277, 1, '0', 'Pierre', 'Galvez', 'Tejada', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (278, 1, '42077483', 'Luis ', 'Arroyo', 'Arbildo', NULL, '1983-10-30', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (279, 1, '41459482', 'Juan Carlos', 'Flores', 'Ramírez', NULL, '1981-10-29', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (280, 1, '1188962', 'Dick', 'Campos', 'Burga', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (281, 1, '26720207', 'David ', 'Guevara ', 'Quispe', NULL, '1976-09-22', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (282, 1, '20888085', 'Walter ', 'Cordova', 'Camavilca', NULL, '1966-06-26', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (283, 1, '42977402', 'Luis Manuel ', 'Chiclote', 'Yopla', NULL, '1983-10-17', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (284, 1, '0', 'Julio', 'Mori', 'Vasquez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (285, 1, '0', 'Elver', 'Julcamoro', 'Mendo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (286, 1, '0', 'Jose', 'Salazar', 'Cotrina', NULL, '1985-02-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (287, 1, '40296056', 'Jhon', 'Alarcon', 'Vega', NULL, '1980-08-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (288, 1, '40829807', 'Jorge', 'Saldaña', 'Atalaya', NULL, '1979-07-09', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (289, 1, '41147172', 'Roger ', 'Yarango ', 'Cruz', NULL, '1980-09-07', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (290, 1, '26682821', 'Avelino', 'Santillan', 'Luicho', NULL, '1971-11-10', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (291, 1, '19196756', 'Misael', 'Moza', 'Olazo', NULL, '1964-11-27', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (292, 1, '44289875', 'Alan', 'Ramos', 'Medina', NULL, '1986-07-09', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (293, 1, '26716608', 'Pepe', 'Morocho', 'Chuquimango', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (294, 1, '7993176', 'Rúben ', 'Naveda ', 'Solis', NULL, '1970-04-17', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (295, 1, '0', 'Herminio', 'Guizado', 'Sulca', NULL, '1980-08-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (296, 1, '0', 'Walter', 'Soria', 'Alania', NULL, '1980-02-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (297, 1, '0', 'Bernardo', 'Humalla', 'Cariapaza', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (298, 1, '80646051', 'Wilson', 'Martinez', 'Leon', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (299, 1, '0', 'Antio', 'Diaz', 'Villanueva', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (300, 1, '0', 'Antio', 'Diaz', 'Villanueva', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (301, 1, '0', 'Julio', 'Huaranga', 'Ortega', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (302, 1, '0', 'Freddy ', 'Ortiz', 'Carrasco', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (303, 1, '0', 'Julio', 'Dorado', 'Palca', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (304, 1, '1318624', 'Jorge', 'Mendoza', 'Buiza', NULL, '1980-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (305, 1, '0', 'Eustaquio', 'Maldonado', 'Tapia', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (306, 1, '0', 'Reynaldo ', 'Huamani', 'Cupe', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (307, 1, '0', 'Segundo', 'Vásquez', 'Chavez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (308, 1, '0', 'Wilmer', 'Llanos', 'Alvarado', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (309, 1, '13317520', 'Jose', 'Muñoz ', 'Cabrera', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (310, 1, '0', 'Segundo', 'Aliaga ', 'Torrel', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (311, 1, '0', 'Jorge ', 'Zelada', 'Quiliche', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (312, 1, '0', 'Manuel', 'Sanchez ', 'Rodriguez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (313, 1, '0', 'Efrain ', 'Paico', 'Correa', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (314, 1, '0', 'JORGE', 'ZELADA', 'QUILICHE', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (315, 1, '0', ' Pierre', 'Galvez', 'Tejada', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (316, 1, '0', 'Nicolas', 'Garro', 'Huaman', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (317, 1, '0', 'Dany Deyver', 'Rojas', ' Angeles', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (318, 1, '0', 'Jenrry', 'Abanto', 'Diaz', NULL, '2010-01-01', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (319, 1, '12312312', 'a', 'Q', 'Q', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (320, 1, '12121212', 'Jhon', 'Castañeda', 'Crisologo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (321, 1, '0', 'Luis Gines', 'Briones', 'Suarez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (322, 1, '0', 'Pablo Esteban', 'Ruiz', 'Huaman', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (323, 1, '0', 'German Alfonso', 'Lingan', 'Cruzado', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (324, 1, '0', 'Carlos', 'Cruz ', 'Mejias', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (325, 1, '0', 'stephanie', 'perreault ', 'Melendez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (326, 1, '0', 'Rosa Elizabeth', 'Medina', 'Gutierrez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (327, 1, '0', 'Yacori Mardely', 'Pairazaman', 'Guanilo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (328, 1, '19201154', 'Jenrry ', 'Abanto', 'Diaz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (329, 1, '26678379', 'Jose Antonio', 'Cervantes', 'Villanueva', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (330, 1, '1308866', 'Juan', 'Peralta', 'Lozano', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (331, 1, '46358662', 'Francklin ', 'Aguilar ', 'Murga', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (332, 1, '80474397', 'Termopilo', 'Izquierdo ', 'Llaxa', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (333, 1, '42891769', 'Felix Alexander', 'Silverio ', 'Hernandez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (334, 1, '1220975', 'Avelino', 'Santillan ', 'Luicho', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (335, 1, '46358662', 'Francklin', 'Aguilar', 'Murga', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (336, 1, '80474397', 'Termopilo', 'Izquierdo', 'Lllaxa', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (337, 1, '42891769', 'Félix Alexander', 'Silverio', 'Hernández', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (338, 1, '10000000', 'José', 'Pastor', 'Rojas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (339, 1, '20000000', 'Wilson', 'Chalan', 'Tanta', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (340, 1, '30000000', 'Fernando', 'Yarango', 'Cruz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (341, 1, '1335497', 'Henry', 'Garcia', 'Vigo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (342, 1, '25844216', 'Marcial Gerardo', 'Fache', 'Vargas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (343, 1, '44626160', 'Omar ', 'Bustamante ', 'Mego', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (344, 1, '27060908', 'Lenyn', 'Chávez', 'Chávez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (345, 1, '44345275', 'Flavio Elver ', 'Saenz', 'Guarniz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (346, 1, '26698849', 'Ciro', 'Gutierrez ', 'Chávez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (347, 1, '26772748', 'Diego', 'Huamán', 'Abanto', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (348, 1, '26706183', 'Genaro ', 'Vera', 'Rojas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (349, 1, '4193129', 'Henry', 'Perez', 'Briones', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (350, 1, '1302823', 'Jaime', 'Idrugo', 'Requelme', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (351, 1, '1313722', 'Jorge', 'Rojas', 'Torres', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (352, 1, '12000000', 'Robert', 'Chucari', 'Quispe', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (353, 1, '12345678', 'Segundo', 'Aliaga', 'Torres ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (354, 1, '12300000', 'Marco', 'Mantilla', 'Garay', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (355, 1, '12354678', 'Jorge', 'Vasquez', 'Cabanillas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (356, 1, '12340000', 'Hector', 'Villanueva', 'Infante', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (357, 1, '1000000', 'Wilder', 'Paucar', 'Hernandez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (358, 1, '41091069', 'Hermes', 'Rojas ', 'Olarte', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (359, 1, '41232437', 'Francisco ', 'Chilón ', 'Chuquiruna', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (360, 1, '1000000', 'Alejandro', 'Malca', 'Mendoza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (361, 1, '44288087', 'Juan José ', 'Vasquez', 'Sanchez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (362, 1, '16725420', 'Guido Alexis ', 'Cruz', 'Perez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (363, 1, '27904663', 'Melquiades', 'Ramirez ', 'Paredes', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (364, 1, '0', 'Prueba1', 'Prueba', 'Prueba', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (365, 1, '10103432', 'Luis ', 'Vega', 'Toro', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (366, 1, '0', 'Luis David', 'Beltran', 'Rojas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (367, 1, '98765432', 'Hector', 'Bonifacio', 'De La Cruz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (368, 1, '44254172', 'Quintiliano', 'Rodríguez', 'Romero', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (369, 1, '26705654', 'Segundo Alejandro', 'Espinoza', 'Rojas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (370, 1, '10539047', 'Luciano', 'Peregrino', 'Huingo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (371, 1, '26697775', 'Luis', 'Escobar', 'Portal', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (372, 1, '19218813', 'Francisco', 'Ortiz', 'Lázaro', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (373, 1, '44390294', 'Javier', 'Sulca', 'Huamani', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (374, 1, '42180969', 'Guillermo', 'Chilón', 'Cabanillas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (375, 1, '42523425', 'Gustavo', 'Quispe', 'Alarcon', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (376, 1, '26711888', 'Juan', 'Bardales', 'Saucedo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (377, 1, '44928685', 'Cirilo', 'Longa', 'Romero', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (378, 1, '42460356', 'Gino', 'Sanchez', 'Bellido', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (379, 1, '0', 'Stephanie', 'Perreault', 'Meléndez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (380, 1, '26693308', 'Ernesto  ', 'Sangay', 'Villar', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (381, 1, '1000001', 'Germán', 'Goicochea', 'Armas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (382, 1, '45677584', 'Juan', 'Peralta', 'Escobal', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (383, 1, '71576635', 'Jhon', 'Castañeda', 'Crisólogo ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (384, 1, '40163469', 'Joel', 'Mejía', 'Gálvez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (385, 1, '80422436', 'Juan Jesús ', 'De La Torre', 'Rojas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (386, 1, '26732173', 'Tito', 'Dávila', 'Llanos', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (387, 1, '12000001', 'Miguel', 'García', 'Rojas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (388, 1, '100000', 'Luis', 'Cusquisiban', 'Aquino', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (389, 1, '1010000', 'Fr', 'Ortiz', 'Lasaro', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (390, 1, '47023368', 'César ', 'Huarcaya ', 'Mantaro', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (391, 1, '25844116', 'Marcial', 'Fache', ' Vargas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (392, 1, '40600591', 'Andrés', 'Narro ', 'Urbano', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (393, 1, '40193017', ' Juan ', 'Manihuari ', 'Lucero', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (394, 1, '40821388', 'Carlos', 'Cabrera ', 'Bazan', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (395, 1, '73057379', 'Luis ', 'Cusquisiban ', 'Aquino', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (396, 1, '26422551', 'Rosario', 'Paredes', 'Leon', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (397, 1, '41097685', 'Rogger', 'Núñez', 'Medina', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (398, 1, '26630518', 'Javier', 'Castillo', 'Pozo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (399, 1, '43418562', 'Manuel Estanislao', 'Cabada', 'Marchena', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (400, 1, '44161448', 'Serapio', 'Delgado', 'Guevara', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (401, 1, '2672255', 'Rosario', 'Paredes', 'León', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (402, 1, '40102777', 'Rafael Martín  ', 'Julca', 'Vásquez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (403, 1, '41835098', 'Samuel Bernardo', 'Figueroa', ' Ocaña', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (404, 1, '45854553', 'Frank Williams ', 'Arroyo ', 'Huaylla ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (405, 1, '74957522', 'Edwin Francisco', 'Correa', 'Bustamante', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (406, 1, '40812276', 'Cesar', 'Vara', 'Alarcón', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (407, 1, '41721822', 'Edwin', 'Mejía', 'Roman', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (408, 1, '29705357', 'Alexis', 'Gutierrez', 'Chipana', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (409, 1, '40273376', 'Gustavo', 'Martínez', 'Lobato', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (410, 1, '26697746', 'Noe', 'Ventura', 'Rodríguez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (411, 1, '42624632', 'Wilfredo', 'Fernández', 'Llanos', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (412, 1, '41886066', 'José', 'Ramos', 'Alvarez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (413, 1, '26737660', 'William', 'Gonzales', 'Oca', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (414, 1, '9862656', 'Jorge', 'Villanueva', 'Silva Santisteban', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (415, 1, '25742007', 'Juan', 'Honores', 'Ocampo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (416, 1, '26673952', 'Jaime', 'Portal', 'Contreras', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (417, 1, '41200466', 'Wilman', 'Vargas', 'Chilón ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (418, 1, '1020102', 'Wilson', 'Calua', 'Tafur', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (419, 1, '14251747', 'Carlos Mesias', 'Linares', 'Ordaz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (420, 1, '76441698', 'Edson Kevin', 'Vasquez', 'Núñez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (421, 1, '0', 'Segundo', 'Peralta', 'Roncal', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (422, 1, '47293438', 'Luis', 'Suaréz', 'Roldán', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (423, 1, '9801042', 'Moisés', 'Carrera', 'Ordóñez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (424, 1, '70199413', 'Walter', 'Salazar', 'Saldaña', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (425, 1, '0', 'Nicanor', 'Guevara', 'Trelles', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (426, 1, '0', 'Victor Jorge', 'Tello', 'Castañeda', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (427, 1, '0', 'Walter', 'Becerra', 'Becerra', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (428, 1, '26646163', 'Pedro', 'Terrones', 'Teran', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (429, 1, '10741258', 'José', 'Davis', 'Atoche', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (430, 1, '19331801', 'Víctor', 'Saenz ', 'Guarniz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (431, 1, '41847722', 'Jorge Luis', 'Diaz', 'Risco', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (432, 1, '19229408', 'Luis Arcadio', 'Rodriguez', 'Urbina', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (433, 1, '11111113', 'Yuri', 'Machuca', 'Chavez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (434, 1, '0', 'Wilder ', 'Deza ', 'Rubio', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (435, 1, '44076175', 'Mario', 'Lopez', 'Miranda', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (436, 1, '43432581', 'Gilmer', 'Chávez', 'Salazar', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (437, 1, '0', 'Roberto', 'Santillan', 'Luycho', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (438, 1, '43872769', 'Edwin', 'Membrillo ', 'Alcántara', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (439, 1, '0', 'Jesús', 'Chacón', 'Zambrano', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (440, 1, '0', 'Wilson ', 'Guerra ', 'Vásquez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (441, 1, '26704170', 'Jorge', 'Carrera', 'Torrel', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (442, 1, '48683224', 'Jorge Luis', 'Arias ', 'Zelada', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (443, 1, '0', 'Elmer', 'Becerra', 'Chugden', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (444, 1, '29716251', 'Julio', 'Delgado', 'Álvarez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (445, 1, '25812758', 'Ángel ', 'Romero ', 'Cosme', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (446, 1, '0', 'Dilder', 'Malca', 'Barbosa', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (447, 1, '0', 'Emerson', 'Díaz', 'Mantilla', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (448, 1, '0', 'Asunción', 'Puscan', 'Tuesta', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (449, 1, '27047994', 'Segundo', 'Muñoz', 'Rabanal', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (450, 1, '0', 'Osias', 'Ocón', 'Vargas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (451, 1, '7376529', 'Alfredo', 'Urribarri ', 'Kajatt', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (452, 1, '0', 'Joaquin', 'Ramírez', 'Vargas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (453, 1, '0', 'Walter', 'Vasquez', 'Chavarri', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (454, 1, '0', 'Juan', 'Moran', 'Espinoza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (455, 1, '73712056', 'Brandon', 'Canrrubí', 'Vasquez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (456, 1, '0', 'Juan', 'Moreno', 'Julcamoro', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (457, 1, '0', 'Elías', 'Chilon', 'Cabanillas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (458, 1, '0', 'Segundo', 'Mendoza', 'Alaya', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (459, 1, '0', 'Luis', 'Condorluicho', 'Escobal', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (460, 1, '0', 'controlador', 'prueba', 'Prueba', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (461, 1, '0', 'José Willan', 'Pajares', 'Torres', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (462, 1, '80628792', 'Segundo Nolberto', ' Carrera ', 'Torrel', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (463, 1, '19237902', 'Walter ', 'Ordóñez ', 'Pablo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (464, 1, '88878888', 'Percy', 'Ortiz', 'Guevara', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (465, 1, '0', 'Elvis', 'Escobar', 'Portal', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (466, 1, '0', 'James', 'Olano', 'Peralta', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (467, 1, '0', 'Juan José', 'Vasquez', 'Sanchez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (468, 1, '0', 'Juan José', 'Vasquez', 'Sanchez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (469, 1, '0', 'Guido Alexis', 'Cruz', 'Perez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (470, 1, '18176870', 'Segundo Wilmer', 'Idrogo', 'Ramos', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (471, 1, '0', 'Segundo Maximiliano', 'Julcamoro', 'González', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (472, 1, '41125099', 'Wilton Manuel', 'Marin', 'Huaman', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (473, 1, '0', 'Vicente', 'Contreras', 'Salazar', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (474, 1, '0', 'Percy', 'Sellerico', 'Macedo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (475, 1, '29533153', 'Percy', 'Torres', 'Flores', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (476, 1, '32905797', 'Elmer', 'Varas', 'Gil', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (477, 1, '0', 'Julio', 'Vasquez', 'Hurtado', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (478, 1, '0', 'Cesar', 'Mendoza', 'Vega', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (479, 1, '0', 'Ydidro', 'Santillan ', 'Luicho', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (480, 1, '12421310', 'Jhon', 'Saldaña', 'Sanchez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (481, 1, '12136350', 'Cesar', 'Vega', 'Mendoza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (482, 1, '12942960', 'Porfirio', 'Chavez', 'Lopez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (483, 1, '1228879', 'Fernando ', 'Ramírez ', 'Díaz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (484, 1, '26686141', 'Jose', 'Garcia', 'Valdez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (485, 1, '33269192', 'Milton', 'Vargas', 'Rojas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (486, 1, '43397764', 'Vladimir', 'Salcedo', 'Raffo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (487, 1, '20570167', 'Paulino', 'Garcia', 'Ccencho', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (488, 1, '10603460', 'Jony', 'Palomino', 'Ramirez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (489, 1, '23094756', 'Jose', 'Martinez', 'Campos', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (490, 1, '40095681', 'Mitchel', 'Bendezu ', 'Gomez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (491, 1, '40392586', 'Marcos', 'Pizarro', 'Ventura', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (492, 1, '0', 'Fernando', 'Condo', 'Moron', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (493, 1, '26663391', 'Segundo', 'Cotrina', 'Linarez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (494, 1, '44066126', 'Julio', 'Valiente', 'Infante', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (495, 1, '13402000', 'Enrique', 'Chavez', 'Solano', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (496, 1, '12389430', 'Gilberto', 'Sanchez', 'Rios', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (497, 1, '12367430', 'Eleuterio ', 'Chávez ', 'Cerna', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (498, 1, '12675580', 'Natividad ', 'Sánchez ', 'Chacha', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (499, 1, '12006740', 'Henry', 'Collantes ', 'Mató ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (500, 1, '40813699', 'Abel ', 'Ñavincopa ', 'Ríos', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (501, 1, '40962074', 'Roy ', 'Pérez ', 'Coronel', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (502, 1, '46795330', 'Andy', 'Muñoz', 'Tirado', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (503, 1, '74037823', 'Oscar', 'Cubas', 'Chavez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (504, 1, '12235950', 'Edgar', 'Malca', 'Bendoza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (505, 1, '16725420', 'Guido Alexis', 'Cruz', 'Perez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (506, 1, '74214022', 'Henry', 'Bendezú', 'Ñaupas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (507, 1, '46263021', 'Luis', 'Benique', 'De La Cruz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (508, 1, '73864808', 'Gampol', 'González', 'Quicchicha', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (509, 1, '43726908', 'Félix', 'Cárdenas', 'Pérez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (510, 1, '28549068', 'Nicanor', 'Trelles', 'Guevara', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (511, 1, '26628120', 'Luis', 'Castillo', 'Martinez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (512, 1, '25698569', 'Cristhian', 'Castañeda', 'Vera', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (513, 1, '41258745', 'Bernardo', 'Humalla', ' Cariapaza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (514, 1, '54896544', 'Edgar', 'Ruiz', 'Roncal', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (515, 1, '74826694', 'Hitler', 'Cabanillas', 'Terán', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (516, 1, '74523698', 'Willian', 'González', 'Oca', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (517, 1, '10000201', 'Percy', 'Sallerico', 'Macedo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (518, 1, '10000205', 'Gianpol', 'González', 'Quicchica', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (519, 1, '10000206', 'Jaynor', 'Calapuja', 'Calapuja', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (520, 1, '43575090', 'Fuber', 'Bento', 'Peralta', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (521, 1, '12075600', 'Néstor', 'Zamora', 'Mendoza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (522, 1, '13427290', 'José', 'Ore', 'Figueroa', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (523, 1, '12798270', 'Natividad ', 'Briceño', 'Paredes', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (524, 1, '13429270', 'Oscar', 'Curi', 'Yachas', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (525, 1, '13429280', 'Mario', 'Jimenez', 'Salluca', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (526, 1, '13386110', 'Raúl', 'Mendoza', 'Mamani', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (527, 1, '20674020', 'Marco', 'Qyispe', 'Apaza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (528, 1, '13369580', 'Marcelino', 'Ticona', 'Villafuerte', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (529, 1, '13130890', 'Aliaga', 'Pajares', 'Torres', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (530, 1, '12123201', 'Marcos', 'Aytite', 'Apaza ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (531, 1, '12024350', 'José', 'Salazar', 'Chavez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (532, 1, '12087910', 'Juan', 'Flores', 'Infante', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (533, 1, '12281530', 'Hector', 'Suarez', 'Davila', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (534, 1, '26730321', 'Pedro', 'Valdivia', 'Cercado', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (535, 1, '42574134', 'Pedro', 'Acosta ', 'Chilon', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (536, 1, '16725420', 'Guido Alexis', 'Cruz', 'Perez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (537, 1, '12312110', 'Jimmy ', 'Gallardo ', 'Astopilco', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (538, 1, '64378888', 'Flavio', 'Quispe', 'Apaza', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (539, 1, '12230620', 'César', 'Espinoza ', 'Rojas ', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (540, 1, '12421500', 'Róger', 'Pérez ', 'Silva', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (541, 1, '2150442', 'Jaime', 'Yana', 'Paricahua', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (542, 1, '43007561', 'Burt', 'Loayza', 'Peña', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (543, 1, '10936010', 'Carlos', 'Ramirez', 'Dioses', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (544, 1, '72636666', 'Percy', 'Sánchez', 'Delgado', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (545, 1, '41868772', 'Josué ', 'Cerdán ', 'Cortez', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (546, 1, '13257380', 'Carlos ', 'González Rivera', 'Rivera', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (547, 1, '12989350', 'Reynerio', 'Abanto', 'Cerdán', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (548, 1, '13432880', 'Manuel ', 'Simonetti ', 'Nakamura', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (549, 1, '13409550', 'Luis ', 'Llamocca ', 'Parra', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (550, 1, '1343414', 'Oscar', 'Silva', 'Diaz', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (551, 1, '13031000', 'Edgardo ', 'Trejo ', 'Tuya', 'http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-10-13/48e390d811043fe5.png', '1980-06-11', 311, 1, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (552, 1, '12036200', 'Juan ', 'Gavelan ', 'Guillermo', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (553, 1, '12263940', 'Alejandro ', 'Malca ', 'Chávez (Apoyo)', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (554, 1, '13430310', 'Jaime ', 'Yana ', 'Paricahua (apoyo)', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (555, 1, '13430320', 'Flavio ', 'Quispe ', 'Apaza (apoyo)', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (556, 1, '26689803', 'Luis ', 'Izquierdo ', 'Castrejón', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (557, 1, '13354440', 'Hugo', 'Ramos', 'Chegne', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (558, 1, '41833873', 'Percy Javier', 'Cruzs', 'Mejias', NULL, '1900-01-02', NULL, NULL, NULL, 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (559, 23, '20259880603', 'TERPEL COMERCIAL DEL PERU S.R.L. ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (560, 23, '20165465009', 'POLICIA NACIONAL DEL PERÚ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (653, 1, '55443322', 'kkk', 'kk', 'kk', 'http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-10-24/bd2620ac07a512ae.png', NULL, 312, 31, '', 24, 19, NULL, NULL);
INSERT INTO `PERSONA` VALUES (658, 1, '32972003', 'Luz Nelly', 'Cordova', 'Constantino', 'http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-11-08/49d64b39e21aada0.jpg', '1971-06-18', 311, 1, '', 24, 19, '2024-10-26 09:56:41', '2024-11-08 22:02:41');
INSERT INTO `PERSONA` VALUES (688, 1, '41833877', 'berit', 'calero', 'chamorro', 'http://slim4.trabajo.ed/uploads/Contenidos/Imagenes/2024-10-26/28a91e1dc8d224e3.png', '2024-10-02', 311, 1, '', 24, 19, '2024-10-27 02:31:59', '2024-10-27 02:31:59');
INSERT INTO `PERSONA` VALUES (694, NULL, NULL, 'Carlitos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (698, 1, '43355886', 'brenda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (699, 1, '32874521', 'luceciña', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (700, 1, '12345675', 'tefita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (706, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (707, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (708, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (709, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (710, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (712, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (713, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (715, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (716, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (717, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (719, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (720, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (721, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (722, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (723, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (724, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (725, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (726, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (727, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (728, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (729, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (731, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (732, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (734, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (735, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (736, NULL, NULL, 'edwin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA` VALUES (737, NULL, NULL, 'edwin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for PERSONA_CONTACTO
-- ----------------------------
DROP TABLE IF EXISTS `PERSONA_CONTACTO`;
CREATE TABLE `PERSONA_CONTACTO`  (
  `IDCONTACTO` int(0) NOT NULL AUTO_INCREMENT,
  `IDPERSONA` int(0) NOT NULL,
  `TIPO` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'T:TELEFONO / C:CORREO / D:DIRECCION ',
  `DESCRIPCION` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION_CORTA` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'V:VERIFICACION / A:ALTA / B:BAJA',
  PRIMARY KEY (`IDCONTACTO`) USING BTREE,
  INDEX `fk_PERSONA_CONTACTO_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_PERSONA_CONTACTO_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PERSONA_CONTACTO
-- ----------------------------
INSERT INTO `PERSONA_CONTACTO` VALUES (5, 706, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (6, 707, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (7, 708, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (8, 709, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (9, 710, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (10, 711, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (11, 712, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (12, 713, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (13, 714, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (14, 715, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (15, 716, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (16, 717, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (17, 718, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (18, 719, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (19, 720, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (20, 721, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (21, 722, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (22, 723, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (23, 724, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (24, 725, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (25, 726, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (26, 727, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (27, 728, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (28, 729, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (29, 730, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (30, 731, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (31, 732, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (32, 733, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (33, 734, NULL, NULL, NULL, NULL);
INSERT INTO `PERSONA_CONTACTO` VALUES (34, 735, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for PERSONA_DIRECCION
-- ----------------------------
DROP TABLE IF EXISTS `PERSONA_DIRECCION`;
CREATE TABLE `PERSONA_DIRECCION`  (
  `IDPERSONA` int(0) NOT NULL,
  `IDDIRECCION` int(0) NOT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `ESTADO_PRINCIPAL` int(0) NULL DEFAULT NULL COMMENT '0: NORMAL 1: PRINCIPAL',
  PRIMARY KEY (`IDPERSONA`, `IDDIRECCION`) USING BTREE,
  INDEX `fk_PERSONA_has_DIRECCION_DIRECCION1_idx`(`IDDIRECCION`) USING BTREE,
  INDEX `fk_PERSONA_has_DIRECCION_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_PERSONA_has_DIRECCION_DIRECCION1` FOREIGN KEY (`IDDIRECCION`) REFERENCES `DIRECCION` (`IDDIRECCION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_PERSONA_has_DIRECCION_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PERSONAL
-- ----------------------------
DROP TABLE IF EXISTS `PERSONAL`;
CREATE TABLE `PERSONAL`  (
  `IDPERSONAL` int(0) NOT NULL AUTO_INCREMENT,
  `CODIGO` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDPERSONA` int(0) NOT NULL,
  `NROLICENCIA` char(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CATLICENCIA` char(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FECHA_EMISION_LICENCIA` date NULL DEFAULT NULL,
  `FECHA_CADUCIDAD_LICENCIA` date NULL DEFAULT NULL,
  `FOTO` int(0) NULL DEFAULT NULL COMMENT 'EXTRAE TABLA DOCADJUNTO',
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT '19: ACTIVO / 20: INACTIVO',
  PRIMARY KEY (`IDPERSONAL`) USING BTREE,
  INDEX `fk_PERSONAL_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_PERSONAL_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 499 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PERSONAL
-- ----------------------------
INSERT INTO `PERSONAL` VALUES (1, '0', 558, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (2, '0', 61, '0', 'AII B', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (3, '0', 62, '0', 'AII B', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (4, '0', 63, '0', 'AII B', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (5, '0', 64, '0', 'AI', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (6, '0', 65, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (7, '0', 66, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (8, '111111', 67, 'C192568622', 'AI', '1990-01-01', '1990-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (9, '1231211', 68, '123456', '0', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (10, '123456', 69, '123456', 'AI', '2018-01-01', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (11, '123456', 70, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (12, '123456', 71, '123456', '0', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (13, '123456', 72, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (14, '123456', 73, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (15, '1336020', 74, '123456', '0', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (16, '1322158', 75, '123456', '0', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (17, '123456', 76, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (18, '123456', 77, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (19, '1266726', 78, '123456', '0', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (20, '123456', 79, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (21, '123456', 80, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (22, '123456', 81, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (23, '123456', 82, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (24, '123456', 83, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (25, '1201441', 84, '123456', '0', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (26, '123456', 85, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (27, '1340903', 86, '123456', '0', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (28, '1200736', 87, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (29, '1286078', 88, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (30, '1229396', 89, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (31, '1222277', 90, 'L40582591', 'AIII C', '1900-01-02', '2020-12-12', NULL, 19);
INSERT INTO `PERSONAL` VALUES (32, '1241982', 91, 'L1241982', 'AIII C', '1900-01-02', '2019-09-28', NULL, 19);
INSERT INTO `PERSONAL` VALUES (33, '1262831', 92, 'L2661705', 'AIII C', '1900-01-02', '2020-12-26', NULL, 19);
INSERT INTO `PERSONAL` VALUES (34, '1308604', 93, '0', 'AIII C', '1900-01-02', '2019-07-21', NULL, 19);
INSERT INTO `PERSONAL` VALUES (35, '1286078', 94, 'Q06268344', 'AII A', '1900-01-02', '2019-12-09', NULL, 19);
INSERT INTO `PERSONAL` VALUES (36, '1222277', 95, 'L40582591', '0', '1900-01-02', '2020-12-12', NULL, 19);
INSERT INTO `PERSONAL` VALUES (37, '1262831', 96, 'L26617025', 'AIII C', '1900-01-02', '2020-12-26', NULL, 19);
INSERT INTO `PERSONAL` VALUES (38, '1335586', 97, 'L45031683', 'Seleccione', '1900-01-02', '2019-12-14', NULL, 19);
INSERT INTO `PERSONAL` VALUES (39, '1321856', 98, 'Vigente', 'AIII C', '1900-01-02', '2020-01-06', NULL, 19);
INSERT INTO `PERSONAL` VALUES (40, '1233509', 99, 'Vigente', 'AIII C', '1900-01-02', '2019-12-13', NULL, 19);
INSERT INTO `PERSONAL` VALUES (41, '1211466', 100, 'Vigente', 'AIII C', '1900-01-02', '2019-07-05', NULL, 19);
INSERT INTO `PERSONAL` VALUES (42, '1211790', 101, 'L26718808', 'AIII C', '1900-01-02', '2019-07-26', NULL, 19);
INSERT INTO `PERSONAL` VALUES (43, '1339062', 102, 'L42794906', 'AIII C', '1900-01-02', '2019-01-14', NULL, 19);
INSERT INTO `PERSONAL` VALUES (44, '1333428', 103, 'L26657244', 'AIII C', '1900-01-02', '2019-12-06', NULL, 19);
INSERT INTO `PERSONAL` VALUES (45, '1282766', 104, 'L41017754', 'AIII C', '1900-01-02', '2021-04-12', NULL, 19);
INSERT INTO `PERSONAL` VALUES (46, '1334504', 105, 'L41676795', 'AIII C', '1900-01-02', '2019-09-06', NULL, 19);
INSERT INTO `PERSONAL` VALUES (47, '1334359', 106, 'L4325618', '0', '1900-01-02', '1985-10-26', NULL, 19);
INSERT INTO `PERSONAL` VALUES (48, '1339062', 107, 'L42794906', 'AIII C', '1900-01-02', '2019-01-14', NULL, 19);
INSERT INTO `PERSONAL` VALUES (49, '1215400', 108, 'C17628379', 'AII A', '1900-01-02', '2018-10-19', NULL, 19);
INSERT INTO `PERSONAL` VALUES (50, '1220975', 109, 'L26682821', 'AIII C', '1900-01-02', '2019-06-20', NULL, 19);
INSERT INTO `PERSONAL` VALUES (51, '123456', 110, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (52, '1305893', 111, 'L43407124', 'AIII C', '1900-01-02', '2019-04-05', NULL, 19);
INSERT INTO `PERSONAL` VALUES (53, '1213386', 112, 'L41218007', 'AIII C', '1900-01-02', '2020-11-22', NULL, 19);
INSERT INTO `PERSONAL` VALUES (54, '1335969', 113, 'L10868985', 'AIII C', '1900-01-02', '2018-12-20', NULL, 19);
INSERT INTO `PERSONAL` VALUES (55, '1336019', 114, 'Q15858192', 'AIII B', '1900-01-02', '2019-07-20', NULL, 19);
INSERT INTO `PERSONAL` VALUES (56, '1316509', 115, 'L42867592', 'AIII C', '1900-01-02', '2020-01-05', NULL, 19);
INSERT INTO `PERSONAL` VALUES (57, '1334578', 116, 'L07520703', 'AIII B', '1900-01-02', '2019-10-16', NULL, 19);
INSERT INTO `PERSONAL` VALUES (58, '1335491', 117, 'Q09889480', 'AII B', '1900-01-02', '2020-05-15', NULL, 19);
INSERT INTO `PERSONAL` VALUES (59, '1280192', 118, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (60, '1208740', 119, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (61, '1335495', 120, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (62, '1229899', 121, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (63, '1338955', 122, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (64, '1208791', 123, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (65, '1308781', 124, 'L41082377', '0', '1900-01-02', '1984-09-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (66, '1337436', 125, 'L79876785', 'AIII C', '1900-01-02', '2019-09-28', NULL, 19);
INSERT INTO `PERSONAL` VALUES (67, '1231378', 126, '0', 'Seleccione', '1900-01-02', '2021-07-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (68, '1302023', 127, 'L41707533', 'AIII C', '1900-01-02', '2019-08-07', NULL, 19);
INSERT INTO `PERSONAL` VALUES (69, '1315931', 128, 'L40963699', '0', '1900-01-02', '2020-10-30', NULL, 19);
INSERT INTO `PERSONAL` VALUES (70, '1237952', 129, 'L26637721', 'AIII C', '1900-01-02', '2019-07-05', NULL, 19);
INSERT INTO `PERSONAL` VALUES (71, '1278175', 130, 'L26723954', 'AIII B', '1900-01-02', '2020-01-06', NULL, 19);
INSERT INTO `PERSONAL` VALUES (72, '1340295', 131, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (73, '1265948', 132, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (74, '1213223', 133, 'L41179572', 'AIII C', '1900-01-02', '2019-12-05', NULL, 19);
INSERT INTO `PERSONAL` VALUES (75, '1332840', 134, 'L40829807', 'AIII C', '1900-01-02', '2019-01-22', NULL, 19);
INSERT INTO `PERSONAL` VALUES (76, '1333599', 135, 'L26614008', 'AIII C', '1900-01-02', '2021-06-20', NULL, 19);
INSERT INTO `PERSONAL` VALUES (77, '1201504', 136, 'L26614008', 'AIII C', '1900-01-02', '2019-07-25', NULL, 19);
INSERT INTO `PERSONAL` VALUES (78, '1306333', 137, 'L31745251', 'AII B', '1900-01-02', '2021-03-15', NULL, 19);
INSERT INTO `PERSONAL` VALUES (79, '1298946', 138, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (80, '1337815', 139, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (81, '1224891', 140, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (82, '1262772', 141, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (83, '1332840', 142, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (84, '1204331', 143, 'L2663589', 'AIII C', '1900-01-02', '2019-03-06', NULL, 19);
INSERT INTO `PERSONAL` VALUES (85, '1309252', 144, 'L26682659', 'AII B', '1900-01-02', '2020-09-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (86, '1223567', 145, 'L26691980', 'AIII C', '1900-01-02', '2021-12-05', NULL, 19);
INSERT INTO `PERSONAL` VALUES (87, '1340080', 146, 'L80627251', 'AIII C', '1900-01-02', '2019-09-12', NULL, 19);
INSERT INTO `PERSONAL` VALUES (88, '1273633', 147, 'L26723229', 'Seleccione', '1900-01-02', '2021-01-06', NULL, 19);
INSERT INTO `PERSONAL` VALUES (89, '1340080', 148, 'L26723229', 'AIII C', '1900-01-02', '2021-01-06', NULL, 19);
INSERT INTO `PERSONAL` VALUES (90, '1314387', 149, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (91, '1229582', 150, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (92, '1219462', 151, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (93, '1218061', 152, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (94, '0', 153, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (95, '1335886', 154, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (96, '0', 155, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (97, '1202026', 156, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (98, '1285316', 157, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (99, '1338609', 158, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (100, '1234679', 159, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (101, '1321615', 160, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (102, '130287', 161, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (103, '1101441', 162, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (104, '1339139', 163, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (105, '1340602', 164, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (106, '1315340', 165, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (107, '1324113', 166, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (108, '1308958', 167, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (109, '1211725', 168, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (110, '1211442', 169, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (111, '1211348', 170, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (112, '01304201', 171, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (113, '1322158', 172, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (114, '1312386', 173, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (115, '1308449', 174, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (116, '1301974', 175, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (117, '1217312', 176, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (118, '1329932', 177, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (119, '1249771', 178, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (120, '1215027', 179, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (121, '1238175', 180, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (122, '1231436', 181, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (123, '1306784', 182, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (124, '1204330', 183, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (125, '1215943', 184, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (126, '1334166', 185, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (127, '1338397', 186, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (128, '1222488', 187, 'L19251942', 'AIII C', '1900-01-02', '2019-01-11', NULL, 19);
INSERT INTO `PERSONAL` VALUES (129, '1311823', 188, 'L40235389', 'AIII C', '1900-01-02', '2020-04-24', NULL, 19);
INSERT INTO `PERSONAL` VALUES (130, '1334168', 189, 'L5406142', 'AIII C', '1900-01-02', '2019-05-30', NULL, 19);
INSERT INTO `PERSONAL` VALUES (131, '1334166', 190, 'L25547172', 'AIII C', '1900-01-02', '2019-01-19', NULL, 19);
INSERT INTO `PERSONAL` VALUES (132, '1335877', 191, 'L4182051', '0', '1900-01-02', '2019-03-08', NULL, 19);
INSERT INTO `PERSONAL` VALUES (133, '1234499', 192, 'L18055067', 'AIII C', '1900-01-02', '2019-09-29', NULL, 19);
INSERT INTO `PERSONAL` VALUES (134, '1202026', 193, 'L18103378', 'AIII C', '1900-01-02', '2021-01-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (135, '12558930', 194, 'L20888085', 'AIII C', '1900-01-02', '2019-06-09', NULL, 19);
INSERT INTO `PERSONAL` VALUES (136, '1225845', 195, 'L16649470', 'AIII C', '1900-01-02', '2021-07-12', NULL, 19);
INSERT INTO `PERSONAL` VALUES (137, '1311380', 196, 'L42671894', '0', '1900-01-02', '2019-04-18', NULL, 19);
INSERT INTO `PERSONAL` VALUES (138, '1340295', 197, 'Q70021606', 'AII B', '1900-01-02', '2020-05-09', NULL, 19);
INSERT INTO `PERSONAL` VALUES (139, '1338223', 198, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (140, '1329164', 199, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (141, '1302875', 200, 'L41754494', 'AIII C', '1900-01-02', '2019-07-13', NULL, 19);
INSERT INTO `PERSONAL` VALUES (142, '1226634', 201, 'L16641637', 'AIII C', '1900-01-02', '2021-06-14', NULL, 19);
INSERT INTO `PERSONAL` VALUES (143, '1303014', 202, 'D45143088', 'AII B', '1900-01-02', '2022-12-07', NULL, 19);
INSERT INTO `PERSONAL` VALUES (144, '1307075', 203, 'L25801704', 'AIII C', '1900-01-02', '2020-11-23', NULL, 19);
INSERT INTO `PERSONAL` VALUES (145, '1224885', 204, 'L26708794', '0', '1900-01-02', '2020-08-24', NULL, 19);
INSERT INTO `PERSONAL` VALUES (146, '1338974', 205, 'Q47576812', 'AII B', '1900-01-02', '2022-12-07', NULL, 19);
INSERT INTO `PERSONAL` VALUES (147, '1306068', 206, 'L43731237', 'AIII C', '1900-01-02', '2019-09-16', NULL, 19);
INSERT INTO `PERSONAL` VALUES (148, '1214057', 207, 'L40504757', 'AIII C', '1900-01-02', '2019-07-18', NULL, 19);
INSERT INTO `PERSONAL` VALUES (149, '0', 208, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (150, '1237067', 209, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (151, '1212282', 210, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (152, '1255555', 211, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (153, '1276021', 212, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (154, '1291430', 213, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (155, '1265419', 214, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (156, '1229739', 215, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (157, '1230209', 216, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (158, '1310083', 217, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (159, '1261028', 218, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (160, '1334581', 219, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (161, '1259978', 220, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (162, '1229739', 221, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (163, '1261028', 222, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (164, '1334581', 223, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (165, '1259978', 224, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (166, '1215943', 225, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (167, '1310050', 226, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (168, '1340295', 227, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (169, '1340296', 228, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (170, '1340297', 229, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (171, '1237952', 230, 'L26637721', 'AIII C', '1900-01-02', '2019-06-07', NULL, 19);
INSERT INTO `PERSONAL` VALUES (172, '1229396', 231, 'L25573351', 'AIII C', '1900-01-02', '2020-12-13', NULL, 19);
INSERT INTO `PERSONAL` VALUES (173, '1337689', 232, 'L19873835', 'AIII C', '1900-01-02', '2020-04-17', NULL, 19);
INSERT INTO `PERSONAL` VALUES (174, '1339476', 233, 'Q45891461', 'AII B', '1900-01-02', '2020-04-07', NULL, 19);
INSERT INTO `PERSONAL` VALUES (175, '1315851', 234, 'L26698002', 'AIII C', '1900-01-02', '2019-09-07', NULL, 19);
INSERT INTO `PERSONAL` VALUES (176, '1209099', 235, 'L27060749', 'AIII C', '1900-01-02', '2019-11-04', NULL, 19);
INSERT INTO `PERSONAL` VALUES (177, '1234823', 236, 'L26716249', 'AIII C', '1900-01-02', '2019-04-11', NULL, 19);
INSERT INTO `PERSONAL` VALUES (178, '1340200', 237, 'L43001862', '0', '1900-01-02', '2020-04-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (179, '1305721', 238, 'D18851125', 'AII B', '1900-01-02', '2019-11-04', NULL, 19);
INSERT INTO `PERSONAL` VALUES (180, '1305721', 239, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (181, '1234823', 240, '0', 'Seleccione', '1900-01-02', '2019-04-11', NULL, 19);
INSERT INTO `PERSONAL` VALUES (182, '44289825', 241, 'L44289895', 'AIII C', '1900-01-02', '2020-01-10', NULL, 19);
INSERT INTO `PERSONAL` VALUES (183, '1234823', 242, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (184, '1234823', 243, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (185, '1234823', 244, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (186, '1326578', 245, 'L26707343', 'AIII C', '1900-01-02', '1971-10-10', NULL, 19);
INSERT INTO `PERSONAL` VALUES (187, '1308449', 246, 'L44465005', 'AII B', '1900-01-02', '2021-07-18', NULL, 19);
INSERT INTO `PERSONAL` VALUES (188, '1215400', 247, 'L17628379', 'AII A', '1900-01-02', '2018-10-19', NULL, 19);
INSERT INTO `PERSONAL` VALUES (189, '1324113', 248, 'L17958839', 'AII A', '1900-01-02', '2019-07-11', NULL, 19);
INSERT INTO `PERSONAL` VALUES (190, '1226394', 249, 'L40524689', 'AIII C', '1900-01-02', '2019-12-12', NULL, 19);
INSERT INTO `PERSONAL` VALUES (191, '1315340', 250, 'L40836993', 'AIII C', '1900-01-02', '2020-05-13', NULL, 19);
INSERT INTO `PERSONAL` VALUES (192, '1331945', 251, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (193, '1304331', 252, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (194, '1242171', 253, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (195, '1269994', 254, 'L16763975', 'AIII C', '1900-01-02', '1969-02-15', NULL, 19);
INSERT INTO `PERSONAL` VALUES (196, '1218061', 255, 'L16763975', 'AIII C', '1900-01-02', '2019-12-15', NULL, 19);
INSERT INTO `PERSONAL` VALUES (197, '1269999', 256, 'L27565651', 'AIII C', '1900-01-02', '2019-12-15', NULL, 19);
INSERT INTO `PERSONAL` VALUES (198, '1283316', 257, 'L26689975', 'AIII C', '1900-01-02', '2021-05-11', NULL, 19);
INSERT INTO `PERSONAL` VALUES (199, '1202026', 258, 'L18103378', 'AIII C', '1900-01-02', '2021-01-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (200, 'L42170545', 259, 'L42170545', 'AIII C', '1900-01-02', '2019-10-10', NULL, 19);
INSERT INTO `PERSONAL` VALUES (201, '1337996', 260, 'L44051720', 'AIII C', '1900-01-02', '2018-12-12', NULL, 19);
INSERT INTO `PERSONAL` VALUES (202, '1335497', 261, 'Q09889480', 'AII B', '1900-01-02', '2020-05-15', NULL, 19);
INSERT INTO `PERSONAL` VALUES (203, '0', 262, 'L26637721', 'AIII C', '1900-01-02', '1964-11-07', NULL, 19);
INSERT INTO `PERSONAL` VALUES (204, '1331659', 263, 'L42417428', 'AIII C', '1900-01-02', '2019-10-25', NULL, 19);
INSERT INTO `PERSONAL` VALUES (205, '1339139', 264, 'L26646004', '0', '1900-01-02', '1972-07-26', NULL, 19);
INSERT INTO `PERSONAL` VALUES (206, '1269697', 265, 'L20107932', '0', '1900-01-02', '2020-07-25', NULL, 19);
INSERT INTO `PERSONAL` VALUES (207, '1223867', 266, 'L26691980', 'AIII C', '1900-01-02', '2021-02-05', NULL, 19);
INSERT INTO `PERSONAL` VALUES (208, '1226394', 267, 'L-40524689', 'AIII C', '1900-01-02', '2019-12-12', NULL, 19);
INSERT INTO `PERSONAL` VALUES (209, '1310076', 268, 'L-00797436', '0', '1900-01-02', '2019-03-23', NULL, 19);
INSERT INTO `PERSONAL` VALUES (210, '1315340', 269, 'L-40836993', 'AIII C', '1900-01-02', '2020-05-13', NULL, 19);
INSERT INTO `PERSONAL` VALUES (211, '1281314', 270, 'L-26708086', '0', '1900-01-02', '2020-01-10', NULL, 19);
INSERT INTO `PERSONAL` VALUES (212, '1329550', 271, 'L-16621697', '0', '1900-01-02', '2018-11-17', NULL, 19);
INSERT INTO `PERSONAL` VALUES (213, '1324113', 272, 'L-17958839', 'Seleccione', '1900-01-02', '2019-07-11', NULL, 19);
INSERT INTO `PERSONAL` VALUES (214, '1324113', 273, 'L-17958839', 'Seleccione', '1900-01-02', '2019-07-11', NULL, 19);
INSERT INTO `PERSONAL` VALUES (215, '0', 274, 'L44289825', 'AIII C', '1900-01-02', '2020-01-10', NULL, 19);
INSERT INTO `PERSONAL` VALUES (216, '1340602', 275, 'L46350500', 'AIII C', '1900-01-02', '2020-01-19', NULL, 19);
INSERT INTO `PERSONAL` VALUES (217, '1101441', 276, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (218, '0', 277, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (219, '1337767', 278, 'Q42077483', '0', '1900-01-02', '2021-05-17', NULL, 19);
INSERT INTO `PERSONAL` VALUES (220, '1233509', 279, 'L41459482', 'AIII C', '1900-01-02', '2020-12-16', NULL, 19);
INSERT INTO `PERSONAL` VALUES (221, '1264812', 280, 'L01188962', 'AIII C', '1900-01-02', '2020-05-15', NULL, 19);
INSERT INTO `PERSONAL` VALUES (222, '1201441', 281, 'L26720207', '0', '1900-01-02', '2019-06-19', NULL, 19);
INSERT INTO `PERSONAL` VALUES (223, '1258930', 282, 'L20888085', 'AIII C', '1900-01-02', '2019-06-26', NULL, 19);
INSERT INTO `PERSONAL` VALUES (224, '1339752', 283, 'L42977402', '0', '1900-01-02', '2020-12-14', NULL, 19);
INSERT INTO `PERSONAL` VALUES (225, '1201724', 284, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (226, '1314049', 285, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (227, '1224923', 286, '000000000', '0', '1900-01-02', '2028-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (228, '1207929', 287, '0000000', '0', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (229, '1332840', 288, 'L40829807', 'AIII C', '1900-01-02', '2019-01-22', NULL, 19);
INSERT INTO `PERSONAL` VALUES (230, '1231436', 289, 'L41147172', 'AIII C', '1900-01-02', '2021-04-25', NULL, 19);
INSERT INTO `PERSONAL` VALUES (231, '1220975', 290, 'L26682821', 'AIII C', '1900-01-02', '2019-06-06', NULL, 19);
INSERT INTO `PERSONAL` VALUES (232, '1331945', 291, 'L19196756', 'AIII C', '1900-01-02', '2019-07-15', NULL, 19);
INSERT INTO `PERSONAL` VALUES (233, '1318694', 292, 'L44289875', 'AIII C', '1900-01-02', '2020-01-10', NULL, 19);
INSERT INTO `PERSONAL` VALUES (234, '1229582', 293, 'L26716608', 'AIII C', '1900-01-02', '2019-06-30', NULL, 19);
INSERT INTO `PERSONAL` VALUES (235, '1231378', 294, 'L07993176', 'AIII C', '1900-01-02', '2021-07-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (236, '1324871', 295, '0000000', '0', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (237, '0000000', 296, '0000000', 'AII A', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (238, '0000000', 297, '0000000', 'AII A', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (239, '1338750', 298, '0000000', '0', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (240, '0000000', 299, '0000000', 'AII A', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (241, '123456', 300, '123456', 'AI', '1900-01-02', '2019-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (242, '0000000', 301, '0000000', 'AII A', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (243, '1338955', 302, '123456', '0', '1900-01-02', '2018-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (244, '0000000', 303, '0000000', 'AII A', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (245, '1318624', 304, '0000000', '0', '1900-01-02', '2018-12-31', NULL, 19);
INSERT INTO `PERSONAL` VALUES (246, '1328617', 305, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (247, '1303101', 306, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (248, '1318607', 307, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (249, '1333443', 308, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (250, '1331752', 309, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (251, '1337997', 310, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (252, '1316221', 311, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (253, '1326791', 312, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (254, '1214291', 313, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (255, '1316221', 314, '0', 'Seleccione', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (256, '0', 315, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (257, '0', 316, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (258, '0', 317, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (259, '1203165', 318, 'AI', 'AIII C', '1900-01-02', '2010-01-01', NULL, 19);
INSERT INTO `PERSONAL` VALUES (260, '1234567', 319, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (261, '100899', 320, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (262, '0', 321, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (263, '0', 322, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (264, '0', 323, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (265, '0', 324, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (266, '0', 325, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (267, '0', 326, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (268, '0', 327, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (269, '1203165', 328, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (270, '1296119', 329, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (271, '1308866', 330, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (272, '1334701', 331, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (273, '1317373', 332, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (274, '131400', 333, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (275, '1220975', 334, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (276, '1334701', 335, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (277, '1317373', 336, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (278, '1313400', 337, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (279, '1000000', 338, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (280, '1311537', 339, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (281, '3000000', 340, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (282, '1335497', 341, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (283, '0', 342, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (284, '1337569', 343, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (285, '1300098', 344, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (286, '0000000', 345, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (287, '1021010', 346, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (288, '1260254', 347, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (289, '1200183', 348, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (290, '4193129', 349, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (291, '1302823', 350, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (292, '1313722', 351, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (293, '1338516', 352, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (294, '1337997', 353, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (295, '1294369', 354, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (296, '1228010', 355, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (297, '1234000', 356, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (298, '1337626', 357, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (299, '1310083', 358, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (300, '1215943', 359, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (301, '0100000', 360, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (302, '-------', 361, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (303, '1342871', 362, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (304, '1229412', 363, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (305, '0', 364, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (306, '1304901', 365, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (307, '0', 366, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (308, '1336375', 367, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (309, '1335474', 368, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (310, '1243424', 369, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (311, '1301368', 370, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (312, '1245521', 371, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (313, '1319313', 372, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (314, '1341376', 373, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (315, '1325951', 374, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (316, '1338944', 375, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (317, '1325520', 376, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (318, '1337716', 377, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (319, '1320673', 378, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (320, '0', 379, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (321, '1296008', 380, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (322, '1301974', 381, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (323, '1308866', 382, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (324, '1000899', 383, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (325, '1276656', 384, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (326, '1341455', 385, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (327, '2673210', 386, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (328, '1200000', 387, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (329, '0010000', 388, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (330, '0101000', 389, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (331, '1337851', 390, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (332, '2584411', 391, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (333, '1332747', 392, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (334, '1339170', 393, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (335, '4082138', 394, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (336, '1018707', 395, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (337, '0', 396, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (338, '0000000', 397, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (339, '1228197', 398, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (340, '1216626', 399, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (341, '1333354', 400, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (342, '1303181', 401, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (343, '4010277', 402, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (344, '4183509', 403, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (345, '1341824', 404, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (346, '1001870', 405, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (347, '1307138', 406, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (348, '1334167', 407, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (349, '1334278', 408, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (350, '1337568', 409, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (351, '1208978', 410, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (352, '4262463', 411, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (353, '4188606', 412, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (354, '1313143', 413, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (355, '1338932', 414, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (356, '0', 415, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (357, '1266136', 416, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (358, '1286561', 417, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (359, '1314352', 418, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (360, '1337184', 419, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (361, '1001829', 420, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (362, '1234049', 421, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (363, '1338808', 422, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (364, '1299832', 423, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (365, '0133935', 424, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (366, '1214267', 425, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (367, '1239776', 426, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (368, '1305039', 427, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (369, '1243828', 428, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (370, '1236218', 429, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (371, '00001', 430, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (372, '1225508', 431, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (373, '1211280', 432, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (374, '1206491', 433, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (375, '1291430', 434, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (376, '.', 435, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (377, '1321041', 436, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (378, '1316579', 437, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (379, '1339249', 438, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (380, '1332872', 439, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (381, '1213446', 440, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (382, '1244919', 441, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (383, '.', 442, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (384, '1040355', 443, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (385, '1301562', 444, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (386, '1321218', 445, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (387, '1241899', 446, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (388, '1227142', 447, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (389, '1305313', 448, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (390, '1222533', 449, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (391, '1293806', 450, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (392, '1328015', 451, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (393, '1220972', 452, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (394, '1341328', 453, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (395, '1263352', 454, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (396, '-', 455, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (397, '1201386', 456, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (398, '1305773', 457, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (399, '1321639', 458, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (400, '1342066', 459, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (401, '0', 460, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (402, '1211881', 461, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (403, '1225599', 462, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (404, '1318461', 463, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (405, '1340340', 464, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (406, '1295543', 465, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (407, '1306993', 466, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (408, '0', 467, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (409, '0', 468, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (410, '0', 469, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (411, '1206955', 470, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (412, '1327076', 471, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (413, '1341127', 472, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (414, '1342171', 473, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (415, '1337533', 474, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (416, '1337655', 475, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (417, '1336960', 476, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (418, '1339113', 477, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (419, '1213635', 478, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (420, '1339919', 479, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (421, '1242131', 480, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (422, '1213635', 481, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (423, '1294296', 482, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (424, '1228879', 483, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (425, '1221171', 484, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (426, '1336978', 485, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (427, '0000000', 486, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (428, '0000000', 487, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (429, '0000000', 488, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (430, '0000000', 489, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (431, '0000000', 490, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (432, '0000000', 491, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (433, '1338690', 492, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (434, '1224964', 493, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (435, '1328771', 494, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (436, '1340200', 495, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (437, '1238943', 496, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (438, '1236743', 497, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (439, '1267558', 498, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (440, '1200674', 499, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (441, '1340780', 500, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (442, '1340785', 501, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (443, '4679533', 502, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (444, '7403782', 503, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (445, '1223595', 504, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (446, '1342871', 505, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (447, '0', 506, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (448, '0', 507, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (449, '1338301', 508, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (450, '0', 509, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (451, '1214267', 510, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (452, '1235842', 511, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (453, '1342870', 512, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (454, '1340784', 513, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (455, '1302859', 514, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (456, '1280192', 515, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (457, '1313143', 516, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (458, '1337533', 517, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (459, '1338301', 518, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (460, '1337977', 519, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (461, '4357509', 520, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (462, '1207560', 521, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (463, '1342729', 522, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (464, '1279827', 523, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (465, '1342927', 524, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (466, '1342928', 525, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (467, '1338611', 526, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (468, '2067402', 527, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (469, '1336958', 528, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (470, '1313089', 529, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (471, '0000223', 530, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (472, '1202435', 531, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (473, '1208791', 532, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (474, '1228153', 533, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (475, '1251198', 534, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (476, '1306084', 535, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (477, '1342871', 536, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (478, '1231211', 537, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (479, '1343032', 538, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (480, '1223062', 539, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (481, '1242150', 540, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (482, '1343031', 541, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (483, '1343030', 542, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (484, '1093601', 543, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (485, '1093601', 544, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (486, '1323917', 545, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (487, '1325738', 546, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (488, '1298935', 547, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (489, '1343288', 548, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (490, '1340955', 549, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (491, '1343414', 550, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (492, '1303100', 551, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (493, '1203620', 552, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (494, '1226394', 553, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (495, '1343031', 554, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (496, '1343032', 555, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (497, '1027561', 556, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);
INSERT INTO `PERSONAL` VALUES (498, '1335444', 557, '0', '0', '1900-01-02', '1900-01-02', NULL, 19);

-- ----------------------------
-- Table structure for PLANTILLA_COMPONENTE
-- ----------------------------
DROP TABLE IF EXISTS `PLANTILLA_COMPONENTE`;
CREATE TABLE `PLANTILLA_COMPONENTE`  (
  `IDPLANTILLA` int(0) NOT NULL,
  `IDCOMPONENTE` int(0) NOT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `ORDEN` int(0) NULL DEFAULT NULL COMMENT 'VA EL ORDEN DE LOS COMPONENETES EN LA PLANTILLA',
  PRIMARY KEY (`IDPLANTILLA`, `IDCOMPONENTE`) USING BTREE,
  INDEX `fk_PLANTILLA_WEB_has_COMPONENTE_COMPONENTE1_idx`(`IDCOMPONENTE`) USING BTREE,
  INDEX `fk_PLANTILLA_WEB_has_COMPONENTE_PLANTILLA_WEB1_idx`(`IDPLANTILLA`) USING BTREE,
  CONSTRAINT `fk_PLANTILLA_WEB_has_COMPONENTE_COMPONENTE1` FOREIGN KEY (`IDCOMPONENTE`) REFERENCES `COMPONENTE` (`IDCOMPONENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_PLANTILLA_WEB_has_COMPONENTE_PLANTILLA_WEB1` FOREIGN KEY (`IDPLANTILLA`) REFERENCES `PLANTILLA_WEB` (`IDPLANTILLA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PLANTILLA_COMPONENTE
-- ----------------------------
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (1, 16, 19, 1);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (1, 17, 19, 5);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (1, 18, 19, 2);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (1, 19, 19, 4);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (1, 22, 19, 6);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (1, 23, 19, 3);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (2, 16, 19, 1);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (2, 17, 19, 4);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (2, 21, 19, 2);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (2, 23, 19, 3);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (3, 16, 19, 1);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (3, 18, 19, 2);
INSERT INTO `PLANTILLA_COMPONENTE` VALUES (3, 19, 19, 4);

-- ----------------------------
-- Table structure for PLANTILLA_WEB
-- ----------------------------
DROP TABLE IF EXISTS `PLANTILLA_WEB`;
CREATE TABLE `PLANTILLA_WEB`  (
  `IDPLANTILLA` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'nombre del template el cual se convertira en un componente de angular',
  `DESCRIPCION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDPLANTILLA`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PLANTILLA_WEB
-- ----------------------------
INSERT INTO `PLANTILLA_WEB` VALUES (1, 'inicio', 'Plantilla construida para el Home de la Web de Nuevo Chimbote');
INSERT INTO `PLANTILLA_WEB` VALUES (2, 'noticia', 'Plantilla para las noticias de nuevo chimbote');
INSERT INTO `PLANTILLA_WEB` VALUES (3, 'interna1', 'Plantilla general para las paginas internas de nvo chimbote');

-- ----------------------------
-- Table structure for PLATO
-- ----------------------------
DROP TABLE IF EXISTS `PLATO`;
CREATE TABLE `PLATO`  (
  `IDPLATO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(145) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(545) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PRECIO` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `VALORACION` decimal(2, 0) NULL DEFAULT NULL,
  `TIEMPO_PREPARACION` time(2) NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FECHA_CREACION` datetime(0) NULL DEFAULT NULL,
  `FECHA_ACTUALIZACION` datetime(0) NULL DEFAULT NULL,
  `IDCATALOGO_PLATO` int(0) NOT NULL,
  PRIMARY KEY (`IDPLATO`) USING BTREE,
  INDEX `fk_PLATO_CATALOGO_PLATO1_idx`(`IDCATALOGO_PLATO`) USING BTREE,
  CONSTRAINT `fk_PLATO_CATALOGO_PLATO1` FOREIGN KEY (`IDCATALOGO_PLATO`) REFERENCES `CATALOGO_PLATO` (`IDCATALOGO_PLATO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PROCESO_PASO
-- ----------------------------
DROP TABLE IF EXISTS `PROCESO_PASO`;
CREATE TABLE `PROCESO_PASO`  (
  `IDPROCESOPASO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ORDEN` int(0) NULL DEFAULT NULL,
  `DESCRIPCION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'IDTABLA DE TAB_TABLAS HEREDADO DE CATALOGO_TABLAS',
  PRIMARY KEY (`IDPROCESOPASO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PROVEEDOR
-- ----------------------------
DROP TABLE IF EXISTS `PROVEEDOR`;
CREATE TABLE `PROVEEDOR`  (
  `IDPROVEEDOR` int(0) NOT NULL AUTO_INCREMENT,
  `RUC` char(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRE_RAZONSOCIAL` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDPROVEEDOR`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PROVINCIA
-- ----------------------------
DROP TABLE IF EXISTS `PROVINCIA`;
CREATE TABLE `PROVINCIA`  (
  `IDPROVINCIA` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NOMBRE` varchar(145) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `IDDEPARTAMENTO` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`IDPROVINCIA`) USING BTREE,
  INDEX `fk_PROVINCIA_DEPARTAMENTO1_idx`(`IDDEPARTAMENTO`) USING BTREE,
  CONSTRAINT `PROVINCIA_ibfk_1` FOREIGN KEY (`IDDEPARTAMENTO`) REFERENCES `DEPARTAMENTO` (`IDDEPARTAMENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PROVINCIA
-- ----------------------------
INSERT INTO `PROVINCIA` VALUES ('0101', 'Chachapoyas', NULL, NULL, '01');
INSERT INTO `PROVINCIA` VALUES ('0102', 'Bagua', NULL, NULL, '01');
INSERT INTO `PROVINCIA` VALUES ('0103', 'Bongará', NULL, NULL, '01');
INSERT INTO `PROVINCIA` VALUES ('0104', 'Condorcanqui', NULL, NULL, '01');
INSERT INTO `PROVINCIA` VALUES ('0105', 'Luya', NULL, NULL, '01');
INSERT INTO `PROVINCIA` VALUES ('0106', 'Rodríguez de Mendoza', NULL, NULL, '01');
INSERT INTO `PROVINCIA` VALUES ('0107', 'Utcubamba', NULL, NULL, '01');
INSERT INTO `PROVINCIA` VALUES ('0201', 'Huaraz', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0202', 'Aija', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0203', 'Antonio Raymondi', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0204', 'Asunción', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0205', 'Bolognesi', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0206', 'Carhuaz', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0207', 'Carlos Fermín Fitzcarrald', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0208', 'Casma', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0209', 'Corongo', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0210', 'Huari', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0211', 'Huarmey', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0212', 'Huaylas', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0213', 'Mariscal Luzuriaga', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0214', 'Ocros', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0215', 'Pallasca', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0216', 'Pomabamba', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0217', 'Recuay', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0218', 'Santa', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0219', 'Sihuas', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0220', 'Yungay', NULL, NULL, '02');
INSERT INTO `PROVINCIA` VALUES ('0301', 'Abancay', NULL, NULL, '03');
INSERT INTO `PROVINCIA` VALUES ('0302', 'Andahuaylas', NULL, NULL, '03');
INSERT INTO `PROVINCIA` VALUES ('0303', 'Antabamba', NULL, NULL, '03');
INSERT INTO `PROVINCIA` VALUES ('0304', 'Aymaraes', NULL, NULL, '03');
INSERT INTO `PROVINCIA` VALUES ('0305', 'Cotabambas', NULL, NULL, '03');
INSERT INTO `PROVINCIA` VALUES ('0306', 'Chincheros', NULL, NULL, '03');
INSERT INTO `PROVINCIA` VALUES ('0307', 'Grau', NULL, NULL, '03');
INSERT INTO `PROVINCIA` VALUES ('0401', 'Arequipa', NULL, NULL, '04');
INSERT INTO `PROVINCIA` VALUES ('0402', 'Camaná', NULL, NULL, '04');
INSERT INTO `PROVINCIA` VALUES ('0403', 'Caravelí', NULL, NULL, '04');
INSERT INTO `PROVINCIA` VALUES ('0404', 'Castilla', NULL, NULL, '04');
INSERT INTO `PROVINCIA` VALUES ('0405', 'Caylloma', NULL, NULL, '04');
INSERT INTO `PROVINCIA` VALUES ('0406', 'Condesuyos', NULL, NULL, '04');
INSERT INTO `PROVINCIA` VALUES ('0407', 'Islay', NULL, NULL, '04');
INSERT INTO `PROVINCIA` VALUES ('0408', 'La Uniòn', NULL, NULL, '04');
INSERT INTO `PROVINCIA` VALUES ('0501', 'Huamanga', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0502', 'Cangallo', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0503', 'Huanca Sancos', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0504', 'Huanta', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0505', 'La Mar', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0506', 'Lucanas', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0507', 'Parinacochas', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0508', 'Pàucar del Sara Sara', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0509', 'Sucre', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0510', 'Víctor Fajardo', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0511', 'Vilcas Huamán', NULL, NULL, '05');
INSERT INTO `PROVINCIA` VALUES ('0601', 'Cajamarca', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0602', 'Cajabamba', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0603', 'Celendín', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0604', 'Chota', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0605', 'Contumazá', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0606', 'Cutervo', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0607', 'Hualgayoc', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0608', 'Jaén', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0609', 'San Ignacio', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0610', 'San Marcos', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0611', 'San Miguel', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0612', 'San Pablo', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0613', 'Santa Cruz', NULL, NULL, '06');
INSERT INTO `PROVINCIA` VALUES ('0701', 'Prov. Const. del Callao', NULL, NULL, '07');
INSERT INTO `PROVINCIA` VALUES ('0801', 'Cusco', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0802', 'Acomayo', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0803', 'Anta', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0804', 'Calca', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0805', 'Canas', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0806', 'Canchis', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0807', 'Chumbivilcas', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0808', 'Espinar', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0809', 'La Convención', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0810', 'Paruro', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0811', 'Paucartambo', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0812', 'Quispicanchi', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0813', 'Urubamba', NULL, NULL, '08');
INSERT INTO `PROVINCIA` VALUES ('0901', 'Huancavelica', NULL, NULL, '09');
INSERT INTO `PROVINCIA` VALUES ('0902', 'Acobamba', NULL, NULL, '09');
INSERT INTO `PROVINCIA` VALUES ('0903', 'Angaraes', NULL, NULL, '09');
INSERT INTO `PROVINCIA` VALUES ('0904', 'Castrovirreyna', NULL, NULL, '09');
INSERT INTO `PROVINCIA` VALUES ('0905', 'Churcampa', NULL, NULL, '09');
INSERT INTO `PROVINCIA` VALUES ('0906', 'Huaytará', NULL, NULL, '09');
INSERT INTO `PROVINCIA` VALUES ('0907', 'Tayacaja', NULL, NULL, '09');
INSERT INTO `PROVINCIA` VALUES ('1001', 'Huánuco', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1002', 'Ambo', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1003', 'Dos de Mayo', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1004', 'Huacaybamba', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1005', 'Huamalíes', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1006', 'Leoncio Prado', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1007', 'Marañón', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1008', 'Pachitea', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1009', 'Puerto Inca', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1010', 'Lauricocha ', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1011', 'Yarowilca ', NULL, NULL, '10');
INSERT INTO `PROVINCIA` VALUES ('1101', 'Ica ', NULL, NULL, '11');
INSERT INTO `PROVINCIA` VALUES ('1102', 'Chincha ', NULL, NULL, '11');
INSERT INTO `PROVINCIA` VALUES ('1103', 'Nasca ', NULL, NULL, '11');
INSERT INTO `PROVINCIA` VALUES ('1104', 'Palpa ', NULL, NULL, '11');
INSERT INTO `PROVINCIA` VALUES ('1105', 'Pisco ', NULL, NULL, '11');
INSERT INTO `PROVINCIA` VALUES ('1201', 'Huancayo ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1202', 'Concepción ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1203', 'Chanchamayo ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1204', 'Jauja ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1205', 'Junín ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1206', 'Satipo ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1207', 'Tarma ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1208', 'Yauli ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1209', 'Chupaca ', NULL, NULL, '12');
INSERT INTO `PROVINCIA` VALUES ('1301', 'Trujillo ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1302', 'Ascope ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1303', 'Bolívar ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1304', 'Chepén ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1305', 'Julcán ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1306', 'Otuzco ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1307', 'Pacasmayo ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1308', 'Pataz ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1309', 'Sánchez Carrión ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1310', 'Santiago de Chuco ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1311', 'Gran Chimú ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1312', 'Virú ', NULL, NULL, '13');
INSERT INTO `PROVINCIA` VALUES ('1401', 'Chiclayo ', NULL, NULL, '14');
INSERT INTO `PROVINCIA` VALUES ('1402', 'Ferreñafe ', NULL, NULL, '14');
INSERT INTO `PROVINCIA` VALUES ('1403', 'Lambayeque ', NULL, NULL, '14');
INSERT INTO `PROVINCIA` VALUES ('1501', 'Lima ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1502', 'Barranca ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1503', 'Cajatambo ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1504', 'Canta ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1505', 'Cañete ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1506', 'Huaral ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1507', 'Huarochirí ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1508', 'Huaura ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1509', 'Oyón ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1510', 'Yauyos ', NULL, NULL, '15');
INSERT INTO `PROVINCIA` VALUES ('1601', 'Maynas ', NULL, NULL, '16');
INSERT INTO `PROVINCIA` VALUES ('1602', 'Alto Amazonas ', NULL, NULL, '16');
INSERT INTO `PROVINCIA` VALUES ('1603', 'Loreto ', NULL, NULL, '16');
INSERT INTO `PROVINCIA` VALUES ('1604', 'Mariscal Ramón Castilla ', NULL, NULL, '16');
INSERT INTO `PROVINCIA` VALUES ('1605', 'Requena ', NULL, NULL, '16');
INSERT INTO `PROVINCIA` VALUES ('1606', 'Ucayali ', NULL, NULL, '16');
INSERT INTO `PROVINCIA` VALUES ('1607', 'Datem del Marañón ', NULL, NULL, '16');
INSERT INTO `PROVINCIA` VALUES ('1608', 'Putumayo', NULL, NULL, '16');
INSERT INTO `PROVINCIA` VALUES ('1701', 'Tambopata ', NULL, NULL, '17');
INSERT INTO `PROVINCIA` VALUES ('1702', 'Manu ', NULL, NULL, '17');
INSERT INTO `PROVINCIA` VALUES ('1703', 'Tahuamanu ', NULL, NULL, '17');
INSERT INTO `PROVINCIA` VALUES ('1801', 'Mariscal Nieto ', NULL, NULL, '18');
INSERT INTO `PROVINCIA` VALUES ('1802', 'General Sánchez Cerro ', NULL, NULL, '18');
INSERT INTO `PROVINCIA` VALUES ('1803', 'Ilo ', NULL, NULL, '18');
INSERT INTO `PROVINCIA` VALUES ('1901', 'Pasco ', NULL, NULL, '19');
INSERT INTO `PROVINCIA` VALUES ('1902', 'Daniel Alcides Carrión ', NULL, NULL, '19');
INSERT INTO `PROVINCIA` VALUES ('1903', 'Oxapampa ', NULL, NULL, '19');
INSERT INTO `PROVINCIA` VALUES ('2001', 'Piura ', NULL, NULL, '20');
INSERT INTO `PROVINCIA` VALUES ('2002', 'Ayabaca ', NULL, NULL, '20');
INSERT INTO `PROVINCIA` VALUES ('2003', 'Huancabamba ', NULL, NULL, '20');
INSERT INTO `PROVINCIA` VALUES ('2004', 'Morropón ', NULL, NULL, '20');
INSERT INTO `PROVINCIA` VALUES ('2005', 'Paita ', NULL, NULL, '20');
INSERT INTO `PROVINCIA` VALUES ('2006', 'Sullana ', NULL, NULL, '20');
INSERT INTO `PROVINCIA` VALUES ('2007', 'Talara ', NULL, NULL, '20');
INSERT INTO `PROVINCIA` VALUES ('2008', 'Sechura ', NULL, NULL, '20');
INSERT INTO `PROVINCIA` VALUES ('2101', 'Puno ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2102', 'Azángaro ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2103', 'Carabaya ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2104', 'Chucuito ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2105', 'El Collao ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2106', 'Huancané ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2107', 'Lampa ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2108', 'Melgar ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2109', 'Moho ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2110', 'San Antonio de Putina ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2111', 'San Román ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2112', 'Sandia ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2113', 'Yunguyo ', NULL, NULL, '21');
INSERT INTO `PROVINCIA` VALUES ('2201', 'Moyobamba ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2202', 'Bellavista ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2203', 'El Dorado ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2204', 'Huallaga ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2205', 'Lamas ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2206', 'Mariscal Cáceres ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2207', 'Picota ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2208', 'Rioja ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2209', 'San Martín ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2210', 'Tocache ', NULL, NULL, '22');
INSERT INTO `PROVINCIA` VALUES ('2301', 'Tacna ', NULL, NULL, '23');
INSERT INTO `PROVINCIA` VALUES ('2302', 'Candarave ', NULL, NULL, '23');
INSERT INTO `PROVINCIA` VALUES ('2303', 'Jorge Basadre ', NULL, NULL, '23');
INSERT INTO `PROVINCIA` VALUES ('2304', 'Tarata ', NULL, NULL, '23');
INSERT INTO `PROVINCIA` VALUES ('2401', 'Tumbes ', NULL, NULL, '24');
INSERT INTO `PROVINCIA` VALUES ('2402', 'Contralmirante Villar ', NULL, NULL, '24');
INSERT INTO `PROVINCIA` VALUES ('2403', 'Zarumilla ', NULL, NULL, '24');
INSERT INTO `PROVINCIA` VALUES ('2501', 'Coronel Portillo ', NULL, NULL, '25');
INSERT INTO `PROVINCIA` VALUES ('2502', 'Atalaya ', NULL, NULL, '25');
INSERT INTO `PROVINCIA` VALUES ('2503', 'Padre Abad ', NULL, NULL, '25');
INSERT INTO `PROVINCIA` VALUES ('2504', 'Purús', NULL, NULL, '25');

-- ----------------------------
-- Table structure for REQUISITO
-- ----------------------------
DROP TABLE IF EXISTS `REQUISITO`;
CREATE TABLE `REQUISITO`  (
  `IDREQUISITO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE_REQUISITO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TIPO_REQUISITO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ES_OBLIGATORIO` tinyint(1) NOT NULL DEFAULT 1,
  `DESCRIPCION_REQUISITO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`IDREQUISITO`) USING BTREE,
  UNIQUE INDEX `NOMBRE_REQUISITO`(`NOMBRE_REQUISITO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ROL
-- ----------------------------
DROP TABLE IF EXISTS `ROL`;
CREATE TABLE `ROL`  (
  `IDROL` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'AC:ACTIVO/IN:INACTIVO/BL:BLOQUEADO',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDROL`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ROL
-- ----------------------------
INSERT INTO `ROL` VALUES (1, 'Administrador general', NULL, 19, NULL, NULL);
INSERT INTO `ROL` VALUES (2, 'Administrador de punto de control', 'descripcion punto control', 19, NULL, '2024-11-01 01:14:53');
INSERT INTO `ROL` VALUES (3, 'Empresa Transportista', 'Rol empresa transportiasta', 19, NULL, '2024-11-01 01:30:11');
INSERT INTO `ROL` VALUES (4, 'Cliente Final', NULL, 19, NULL, '2024-11-01 01:30:17');
INSERT INTO `ROL` VALUES (5, 'Empresa Proveedora', NULL, 19, NULL, '2024-11-01 01:30:21');
INSERT INTO `ROL` VALUES (6, 'Controlador', NULL, 19, NULL, NULL);
INSERT INTO `ROL` VALUES (7, 'SOPORTE TECNICO', 'DESC SOPORTE', 19, NULL, NULL);

-- ----------------------------
-- Table structure for SECTOR
-- ----------------------------
DROP TABLE IF EXISTS `SECTOR`;
CREATE TABLE `SECTOR`  (
  `IDSECTOR` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ABREVIATURA` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDSECTOR`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SEGURO
-- ----------------------------
DROP TABLE IF EXISTS `SEGURO`;
CREATE TABLE `SEGURO`  (
  `IDSEGURO` int(0) NOT NULL AUTO_INCREMENT,
  `TIPO_SEGURO` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `COBERTURA` float NULL DEFAULT NULL,
  `MONTO` float NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDSEGURO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SERVICIO
-- ----------------------------
DROP TABLE IF EXISTS `SERVICIO`;
CREATE TABLE `SERVICIO`  (
  `IDSERVICIO` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDCATSERVICIO` int(0) NOT NULL,
  PRIMARY KEY (`IDSERVICIO`) USING BTREE,
  INDEX `fk_SERVICIO_CAT_SERVICIO1_idx`(`IDCATSERVICIO`) USING BTREE,
  CONSTRAINT `fk_SERVICIO_CAT_SERVICIO1` FOREIGN KEY (`IDCATSERVICIO`) REFERENCES `CAT_SERVICIO` (`IDCATSERVICIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SERVICIO_PAGO
-- ----------------------------
DROP TABLE IF EXISTS `SERVICIO_PAGO`;
CREATE TABLE `SERVICIO_PAGO`  (
  `IDSERVICIO` int(0) NOT NULL,
  `IDPAGO` int(0) NOT NULL,
  `ENTREGA_SERVICIO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'P:PENDIENTE/E:ENTREGADO',
  `CANTIDAD` int(0) NULL DEFAULT NULL COMMENT 'Si son varias, pago x varias personas, entradas, etc',
  `DESCRIPCION` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Detalle del tipo de pago oa ctividad',
  `OBSERVACION` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `VALOR_UNITARIO` decimal(7, 2) NULL DEFAULT NULL,
  `SUBTOTAL` decimal(10, 2) NULL DEFAULT NULL,
  `PRODASOCIADO_ID` int(0) NULL DEFAULT NULL COMMENT 'ID de ta bla asociada, ejemplo: cancha sera ID ACTIVIDAD_ESPACIO',
  `PRODASOCIADO_TIPO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Es la tabla asociada, ejemplo: para cancha ACTIVIDAD_ESPACIO',
  PRIMARY KEY (`IDSERVICIO`, `IDPAGO`) USING BTREE,
  INDEX `fk_SERVICIO_has_PAGO_PAGO1_idx`(`IDPAGO`) USING BTREE,
  INDEX `fk_SERVICIO_has_PAGO_SERVICIO1_idx`(`IDSERVICIO`) USING BTREE,
  CONSTRAINT `fk_SERVICIO_has_PAGO_PAGO1` FOREIGN KEY (`IDPAGO`) REFERENCES `PAGO` (`IDPAGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_SERVICIO_has_PAGO_SERVICIO1` FOREIGN KEY (`IDSERVICIO`) REFERENCES `SERVICIO` (`IDSERVICIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for SISTEMA
-- ----------------------------
DROP TABLE IF EXISTS `SISTEMA`;
CREATE TABLE `SISTEMA`  (
  `IDSISTEMA` int(0) NOT NULL AUTO_INCREMENT,
  `TIPO_SISTEMA` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'WB:WEB/CS:CLIENTE SERVIDOR',
  `NOMBRE` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRE_CORTO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT '19: ACTIVO/ 20: INACTIVO',
  `RUTA` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDSISTEMA`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SISTEMA
-- ----------------------------
INSERT INTO `SISTEMA` VALUES (6, 'WB', 'SISTEMA DE APIS', 'APIS', 19, 'api');
INSERT INTO `SISTEMA` VALUES (7, 'WB', 'SISTEMA DE MANTENIMIENTO WEB', 'MANTENIMIENTO WEB', 19, 'web');

-- ----------------------------
-- Table structure for SISTEMA_MODULOS
-- ----------------------------
DROP TABLE IF EXISTS `SISTEMA_MODULOS`;
CREATE TABLE `SISTEMA_MODULOS`  (
  `IDSISTEMA` int(0) NOT NULL,
  `IDMODULO` int(0) NOT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDSISTEMA`, `IDMODULO`) USING BTREE,
  INDEX `fk_SISTEMA_has_MODULOS_MODULOS1_idx`(`IDMODULO`) USING BTREE,
  INDEX `fk_SISTEMA_has_MODULOS_SISTEMA1_idx`(`IDSISTEMA`) USING BTREE,
  CONSTRAINT `fk_SISTEMA_has_MODULOS_MODULOS1` FOREIGN KEY (`IDMODULO`) REFERENCES `MODULOS` (`IDMODULO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_SISTEMA_has_MODULOS_SISTEMA1` FOREIGN KEY (`IDSISTEMA`) REFERENCES `SISTEMA` (`IDSISTEMA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SISTEMA_MODULOS
-- ----------------------------
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 1, 19);
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 2, 19);
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 3, 19);
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 4, 19);
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 5, 19);
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 6, 19);
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 8, 19);
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 9, 19);
INSERT INTO `SISTEMA_MODULOS` VALUES (7, 10, 19);

-- ----------------------------
-- Table structure for TAB_TABLAS
-- ----------------------------
DROP TABLE IF EXISTS `TAB_TABLAS`;
CREATE TABLE `TAB_TABLAS`  (
  `IDTABLA` int(0) NOT NULL AUTO_INCREMENT,
  `IDCATALOGOTABLAS` int(0) NOT NULL,
  `CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRE` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` int(0) UNSIGNED NOT NULL COMMENT 'A:Activo/I:Inactivo',
  `FECHA_CREACION` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ACTUALIZACION` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `COD_ELEMENT1` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `COD_ELEM1_TIPO` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `REFERENCIA1` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `REFERENCIA2` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `REFERENCIA3` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `VALDAT_LON_MIN` int(0) NULL DEFAULT NULL,
  `VALDAT_LON_MAX` int(0) NULL DEFAULT NULL,
  `VALDAT_TIPO` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'NUMERICO\nALFANUMERICO',
  PRIMARY KEY (`IDTABLA`) USING BTREE,
  INDEX `fk_TAB_TABLAS_CATALOGO_TABLAS1_idx`(`IDCATALOGOTABLAS`) USING BTREE,
  CONSTRAINT `fk_TAB_TABLAS_CATALOGO_TABLAS1` FOREIGN KEY (`IDCATALOGOTABLAS`) REFERENCES `CATALOGO_TABLAS` (`IDCATALOGOTABLAS`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of TAB_TABLAS
-- ----------------------------
INSERT INTO `TAB_TABLAS` VALUES (1, 1, '01', 'DNI', 'Documento nacional de Identidad', 19, '2019-03-15 17:27:45', '2023-04-19 22:16:56', NULL, NULL, NULL, NULL, NULL, 8, 8, 'N');
INSERT INTO `TAB_TABLAS` VALUES (2, 1, '02', 'CE', 'Carnet de Extranjeria', 19, '2019-03-15 17:27:45', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, 11, 11, 'N');
INSERT INTO `TAB_TABLAS` VALUES (3, 1, '03', 'PASAPORTE', 'Pasaporte', 19, '2019-03-15 17:27:45', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, 4, 15, 'AN');
INSERT INTO `TAB_TABLAS` VALUES (4, 1, '04', 'CCA', 'Carta Andina', 19, '2019-03-15 17:27:45', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, 4, 15, 'AN');
INSERT INTO `TAB_TABLAS` VALUES (5, 1, '05', 'NINGUNO', 'SIN NUMERO DE DOCUMENTO', 19, '2019-03-18 20:46:12', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (6, 2, '01', 'MOVISTAR', NULL, 19, '2019-03-19 19:17:18', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (7, 2, '02', 'CLARO', NULL, 19, '2019-03-19 19:17:18', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (8, 2, '03', 'ENTEL', NULL, 19, '2019-03-19 19:17:18', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (9, 2, '04', 'BITEL', NULL, 19, '2019-03-19 19:17:18', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (10, 2, '05', 'OTROS', NULL, 19, '2019-03-19 19:17:18', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (11, 3, '01', 'SOLTERO', 'Poniendo descripción', 20, '2019-03-20 12:07:56', '2020-08-02 17:54:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `TAB_TABLAS` VALUES (12, 3, '02', 'CASADO', NULL, 19, '2019-03-20 12:07:56', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (13, 3, '03', 'DIVORCIADO', NULL, 19, '2019-03-20 12:07:56', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (14, 3, '04', 'VIUDO', NULL, 19, '2019-03-20 12:07:56', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (15, 4, '01', 'SECUNDARIA COMPLETA', NULL, 19, '2019-03-20 12:09:50', '2020-08-02 17:11:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (16, 4, '02', 'TECNICO SUPERIOR', NULL, 19, '2019-03-20 12:09:50', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (17, 4, '03', 'BACHILLER', NULL, 19, '2019-03-20 12:09:50', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (18, 4, '04', 'PROFESIONAL TITULADO', NULL, 19, '2019-03-20 12:09:50', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (19, 5, 'O1', 'ACTIVO', '', 19, '2020-05-05 13:18:20', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (20, 5, '02', 'INACTIVO', NULL, 19, '2020-05-05 13:18:46', '2020-08-02 13:11:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (21, 6, '01', 'Control Cero', 'Inicia el control', 19, '2020-08-02 18:07:55', '2020-08-02 18:08:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `TAB_TABLAS` VALUES (22, 6, '02', 'Control Kuntur Wasi', 'Control Kuntur Wasi', 19, '2020-08-02 18:09:14', '2020-08-02 18:09:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `TAB_TABLAS` VALUES (23, 1, '06', 'RUC', 'Registro único de contribuyente', 19, '2020-08-03 00:07:59', '2020-08-03 00:11:18', NULL, NULL, NULL, NULL, NULL, 11, 11, 'N');
INSERT INTO `TAB_TABLAS` VALUES (24, 8, '01', 'Natural', 'Persona Natural', 19, '2020-08-03 21:13:49', '2023-04-19 22:17:00', NULL, NULL, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `TAB_TABLAS` VALUES (25, 8, '02', 'Jurídica', 'Persona Jurídica', 19, '2020-08-03 21:15:22', '2023-04-19 22:17:03', NULL, NULL, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `TAB_TABLAS` VALUES (26, 9, '01', 'Supervisor', 'Supervisor de campo', 19, '2020-08-24 17:28:47', '2020-08-24 17:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (27, 9, '02', 'Conductor', 'Conductor de un proveedor', 19, '2020-08-24 17:29:27', '2020-08-24 17:29:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (28, 9, '03', 'Mecánico', 'Mecánico quien realiza la inspección', 19, '2020-08-24 17:30:28', '2020-08-24 17:30:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (29, 10, '01', 'Hoover', 'Tipo de contenedor', 19, '2020-08-24 17:32:17', '2020-08-24 17:33:02', NULL, NULL, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `TAB_TABLAS` VALUES (30, 10, '02', 'Isotanque', 'Tanque de material', 19, '2020-08-24 17:33:56', '2020-08-24 17:33:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (31, 10, '03', 'Bolsa Gigante', 'Bolsa', 19, '2020-08-24 17:34:16', '2020-08-24 17:34:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (32, 11, '01', 'Aseguramiento con piñas', 'Ninguno', 19, '2020-08-24 17:35:40', '2020-08-24 17:35:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (33, 11, '02', 'Placa informativa metálica', 'Ninguno', 19, '2020-08-24 17:36:07', '2020-08-24 17:36:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (36, 11, '03', 'Precintos metálicos', 'Ninguno', 19, '2020-08-24 17:44:44', '2020-08-24 17:45:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (37, 11, '04', 'Prueba hidrostática', 'Ninguno', 19, '2020-08-24 17:44:44', '2020-08-24 17:45:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (38, 11, '05', 'Válvulas de carga', 'Ninguno', 19, '2020-08-24 17:44:44', '2020-08-24 17:45:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (39, 11, '06', 'Válvulas de descarga', 'Ninguno', 19, '2020-08-24 17:44:44', '2020-08-24 17:45:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (40, 12, '01', 'Casco', 'Ninguno', 19, '2020-08-24 17:47:50', '2020-08-24 17:47:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (41, 12, '02', 'Chalecos', 'Ninguno', 19, '2020-08-24 17:47:50', '2020-08-24 17:47:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (42, 12, '03', 'EPP Autonomo', 'Ninguno', 19, '2020-08-24 17:47:50', '2020-08-24 17:47:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (44, 12, '04', 'Guantes', 'Ninguno', 19, '2020-08-24 17:47:50', '2020-08-24 17:48:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (45, 12, '05', 'Lentes', 'Ninguno', 19, '2020-08-24 17:47:50', '2020-08-24 17:48:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (46, 12, '06', 'Protector Solar', 'Ninguno', 19, '2020-08-24 17:47:50', '2020-08-24 17:49:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (47, 12, '07', 'Ropa de trabajo', 'Ninguno', 19, '2020-08-24 17:47:50', '2020-08-24 17:49:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (48, 12, '08', 'Zapatos punta de acero', 'Ninguno', 19, '2020-08-24 17:47:50', '2020-08-24 17:49:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (49, 13, '01', 'Cinta de inspección trimestral', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (50, 13, '02', 'Compatibilidad de productos', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (51, 13, '03', 'Cronograma de descanso', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (52, 13, '04', 'Custodia de celular', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (53, 13, '05', 'Desactivación de convoy', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (54, 13, '06', 'Efecto cascada', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (55, 13, '07', 'Estacionamiento de unidad', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (56, 13, '08', 'Incumplimiento de protocolo', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (57, 13, '09', 'Uso de cinturón de seguridad', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (58, 13, '10', 'Vigía', 'Ninguno', 19, '2020-08-24 17:50:53', '2020-08-24 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (59, 14, '01', 'Altavoz (camioneta escolta)', 'Ninguno', 19, '2020-08-24 18:02:38', '2020-08-24 18:02:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (60, 14, '02', 'Radio base (manos libres)', 'Ninguno', 19, '2020-08-24 18:02:38', '2020-08-24 18:02:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (61, 14, '03', 'Teléfono celular', 'Ninguno', 19, '2020-08-24 18:02:38', '2020-08-24 18:02:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (62, 14, '04', 'Teléfono satelital', 'Ninguno', 19, '2020-08-24 18:02:38', '2020-08-24 18:02:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (63, 15, '01', 'Botiquin', 'Ninguno', 19, '2020-08-24 18:04:53', '2020-08-24 18:06:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (64, 15, '02', 'Herramientas Auxilio Mecánico', 'Ninguno', 19, '2020-08-24 18:04:53', '2020-08-24 18:06:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (65, 15, '03', 'Kit de respuesta', 'Ninguno', 19, '2020-08-24 18:04:53', '2020-08-24 18:06:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (66, 15, '04', 'Soportes de Apoyo del Semiremolque', 'Ninguno', 19, '2020-08-24 18:04:53', '2020-08-24 18:06:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (67, 15, '05', 'Tacos de seguridad', 'Ninguno', 19, '2020-08-24 18:04:53', '2020-08-24 18:06:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (68, 16, '01', 'Banderines', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (69, 16, '02', 'Cinta Reflectiva', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (70, 16, '03', 'Conos de seguridad', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (71, 16, '04', 'Letrero de Convoy', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (72, 16, '05', 'Número ONU', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (73, 16, '06', 'Paletas de vigía', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (74, 16, '07', 'Placa de Rodaje', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (75, 16, '08', 'Placa metálica Ensayo no destructivo', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (76, 16, '09', 'Placas DOT', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (77, 16, '10', 'Rombo NFPA 704', 'Ninguno', 19, '2020-08-24 18:08:17', '2020-08-24 18:08:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (78, 17, '01', 'Extintor: cartilla de control', 'Ninguno', 19, '2020-08-24 18:10:39', '2020-08-24 18:10:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (79, 17, '02', 'Extintor: condición general', 'Ninguno', 19, '2020-08-24 18:10:39', '2020-08-24 18:10:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (80, 17, '03', 'Extintor: estado porta extintores', 'Ninguno', 19, '2020-08-24 18:10:39', '2020-08-24 18:10:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (81, 17, '04', 'Extintor: presurización', 'Ninguno', 19, '2020-08-24 18:10:39', '2020-08-24 18:10:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (82, 17, '05', 'Extintor: prueba hidrostática', 'Ninguno', 19, '2020-08-24 18:10:39', '2020-08-24 18:10:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (83, 17, '06', 'Extintor: vigencia', 'Ninguno', 19, '2020-08-24 18:10:39', '2020-08-24 18:10:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (84, 18, '01', 'Amortiguadores', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (85, 18, '02', 'Asientos', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (86, 18, '03', 'Guardas fangos', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (87, 18, '04', 'Muelles', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (88, 18, '05', 'Neumáticos <= 3 reencauches', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (89, 18, '06', 'Neumáticos: ajuste de tuercas', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (90, 18, '07', 'Neumáticos desgaste cocada >= 3mm', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (91, 18, '08', 'Neumáticos: estado reencauche', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (92, 18, '09', 'Neumáticos: marcado de tuercas', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (93, 18, '10', 'Neumáticos: presión de aire', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (94, 18, '11', 'Pulmón de aire', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (95, 18, '12', 'Soporte para remolque', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (96, 18, '13', 'Templadores', 'Ninguno', 19, '2020-08-24 18:13:47', '2020-08-24 18:13:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (97, 19, '01', 'Alarma de retroceso', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (98, 19, '02', 'Baterías', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (99, 19, '03', 'Claxón', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (100, 19, '04', 'Cobertor de baterias', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (101, 19, '05', 'Limpia parabrisas (trico)', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (102, 19, '06', 'Luces delanteras(alta y baja)', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (103, 19, '07', 'Luces direccionales', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (104, 19, '08', 'Luces intermitentes', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (105, 19, '09', 'Luces posteriores', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (106, 19, '10', 'Luces y medidores de tablero', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (107, 19, '11', 'Luz de emergencia', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (108, 19, '12', 'Luz de retroceso', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (109, 19, '13', 'Neblineros', 'Ninguno', 19, '2020-08-24 18:15:39', '2020-08-24 18:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (110, 20, '01', 'Cables y conexiones eléctricas', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (111, 20, '02', 'Faja(s) de ventilador', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (112, 20, '03', 'Filtro de aceite', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (113, 20, '04', 'Limpieza general', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (114, 20, '05', 'Mangueras del radiador', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (115, 20, '06', 'Pérdidas de fluídos parte baja', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (116, 20, '07', 'Ruídos anormales', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (117, 20, '08', 'Tanque de combustible', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (118, 20, '09', 'Mata chispas', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (119, 20, '10', 'Tubo de escape', 'Ninguno', 19, '2020-08-24 18:17:53', '2020-08-24 18:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (120, 21, '01', 'Aceite de motor', 'Ninguno', 19, '2020-08-24 18:19:32', '2020-08-24 18:19:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (121, 21, '02', 'Agua de limpia parabrisas', 'Ninguno', 19, '2020-08-24 18:19:32', '2020-08-24 18:19:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (122, 21, '03', 'Fluído hidraúlico', 'Ninguno', 19, '2020-08-24 18:19:32', '2020-08-24 18:19:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (123, 21, '04', 'Líquido de freno y embrague', 'Ninguno', 19, '2020-08-24 18:19:32', '2020-08-24 18:19:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (124, 21, '05', 'Refrigerante de radiador', 'Ninguno', 19, '2020-08-24 18:19:32', '2020-08-24 18:19:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (125, 22, '01', 'Compresor de aire', 'Ninguno', 19, '2020-08-24 18:21:26', '2020-08-24 18:21:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (126, 22, '02', 'Conexiones de freno aire', 'Ninguno', 19, '2020-08-24 18:21:26', '2020-08-24 18:21:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (127, 22, '03', 'Recalentamiento de zapatas', 'Ninguno', 19, '2020-08-24 18:21:26', '2020-08-24 18:21:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (128, 23, '01', 'Timón', 'Ninguno', 19, '2020-08-24 18:23:46', '2020-08-24 18:23:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (129, 24, '01', 'Aseguramiento de objetos', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (130, 24, '02', 'Cinturón de seguridad', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (131, 24, '03', 'Cinturón de seguridad', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (132, 24, '04', 'Elementos distractores', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (133, 24, '05', 'Espejos laterales', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (134, 24, '06', 'Espejos retrovisores', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (135, 24, '07', 'Orden y limpieza', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (136, 24, '08', 'Parabrisas', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (137, 24, '09', 'Plataforma de estribo', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (138, 24, '10', 'Puertas', 'Ninguno', 19, '2020-08-24 18:26:54', '2020-08-24 18:26:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (139, 25, '01', 'Cajón de válvulas', 'Ninguno', 19, '2020-08-24 18:28:54', '2020-08-24 18:28:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (140, 25, '02', 'Estado físico de la Cisterna', 'Ninguno', 19, '2020-08-24 18:28:54', '2020-08-24 18:28:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (141, 25, '03', 'Precintos de seguridad en cajón de válvulas', 'Ninguno', 19, '2020-08-24 18:28:54', '2020-08-24 18:28:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (142, 25, '04', 'Sistema de recuperación de vapores', 'Ninguno', 19, '2020-08-24 18:28:54', '2020-08-24 18:28:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (143, 26, '01', 'Condición de acople', 'Ninguno', 19, '2020-08-24 18:30:05', '2020-08-24 18:30:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (144, 26, '02', 'Marcado 5ta rueda', 'Ninguno', 19, '2020-08-24 18:30:05', '2020-08-24 18:30:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (145, 26, '03', 'Condición King ping', 'Ninguno', 19, '2020-08-24 18:30:05', '2020-08-24 18:30:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (146, 27, '01', 'Condición general', 'Ninguno', 19, '2020-08-24 18:31:33', '2020-08-24 18:31:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (147, 27, '02', 'Parachoque frontal', 'Ninguno', 19, '2020-08-24 18:31:33', '2020-08-24 18:31:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (148, 27, '03', 'Parachoque posterior', 'Ninguno', 19, '2020-08-24 18:31:33', '2020-08-24 18:31:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (149, 27, '04', 'Protector de batería', 'Ninguno', 19, '2020-08-24 18:31:33', '2020-08-24 18:31:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (150, 28, '01', 'Carpa', 'Ninguno', 19, '2020-08-24 18:32:53', '2020-08-24 18:32:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (151, 28, '02', 'Fajas de sujeción', 'Ninguno', 19, '2020-08-24 18:32:53', '2020-08-24 18:32:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (152, 28, '03', 'Precinto de seguridad en Contenedor', 'Ninguno', 19, '2020-08-24 18:32:53', '2020-08-24 18:32:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (153, 28, '04', 'Rache', 'Ninguno', 19, '2020-08-24 18:32:53', '2020-08-24 18:32:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (154, 29, '01', ' Sector Educación', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (155, 29, '02', ' Sector AFP', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (156, 29, '03', ' Sector Automotriz', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (157, 29, '04', ' Sector Consumo Masivo', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (158, 29, '05', ' Sector Hotelería y Turismo', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (159, 29, '06', ' Sector Inmobiliarias y Construcción', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (160, 29, '07', ' Sector logística', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (161, 29, '08', ' Sector Medios de Comunicación', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (162, 29, '09', ' Sector pesca y agroindustria', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (163, 29, '10', ' Sector Minero', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (164, 29, '11', ' Sector Restaurantes', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (165, 29, '12', ' Sector retail', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (166, 29, '13', ' Sector salud', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (167, 29, '14', ' Sector Público', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (168, 29, '15', ' Sector tecnología', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (169, 29, '16', ' Sector Seguros', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (170, 29, '17', ' Sector Telecomunicaciones', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (171, 29, '18', ' Sector Industrial', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (172, 29, '19', ' Sector Textil', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (173, 29, '20', ' Sector Transporte aéreo', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (174, 29, '21', ' Sector Bancos y Cajas', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (175, 29, '22', ' Sector Consultoría', NULL, 19, '2020-08-29 21:59:30', '2020-08-29 21:59:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (176, 30, '01', 'Agroindustrias', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (177, 30, '02', 'Alimentos y bebidas', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (178, 30, '03', 'Asesoria Empresarial', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (179, 30, '04', 'Cabinas Internet', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (180, 30, '05', 'Catering', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (181, 30, '06', 'Comercio Electronico', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (182, 30, '07', 'Comercio Exterior', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (183, 30, '08', 'Construcción e Inmobiliaria', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (184, 30, '09', 'Contabilidad y Finanzas', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (185, 30, '10', 'Cuero y calzado', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (186, 30, '11', 'Electronica', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (187, 30, '12', 'Entretenimiento', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (188, 30, '13', 'Eventos', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (189, 30, '14', 'Eventos y Servicios', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (190, 30, '15', 'Ferreteria', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (191, 30, '16', 'Financiamiento Pymes', NULL, 19, '2020-08-29 22:54:36', '2020-08-29 22:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (192, 30, '17', 'Industria Grafica', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (193, 30, '18', 'Informatica', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (194, 30, '19', 'Ingenieria', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (195, 30, '20', 'Joyeria', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (196, 30, '21', 'Maquinas equipos', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (197, 30, '22', 'Medios de Comunicación', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (198, 30, '23', 'Muebles en General', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (199, 30, '24', 'Otros Rubros', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (200, 30, '25', 'Plasticos y Empaques', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (201, 30, '26', 'Publicidad y Marketing', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (202, 30, '27', 'Restaurantes', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (203, 30, '28', 'Salud y Vida', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (204, 30, '29', 'Seguridad', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (205, 30, '30', 'Servicios Educativos', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (206, 30, '31', 'Servicios Internet', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (207, 30, '32', 'Telecomunicaciones', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (208, 30, '33', 'Textiles', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (209, 30, '34', 'Transporte', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (210, 30, '35', 'Turismo', NULL, 19, '2020-08-29 22:54:37', '2020-08-29 22:54:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (211, 31, '01', 'Interno', NULL, 19, '2020-08-29 23:01:12', '2020-08-29 23:01:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (212, 31, '02', 'Exterior', NULL, 19, '2020-08-29 23:01:12', '2020-08-29 23:01:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (213, 31, '03', 'Terrestre', NULL, 19, '2020-08-29 23:01:12', '2020-08-29 23:01:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (214, 31, '04', 'Marítimo y/o fluvial', NULL, 19, '2020-08-29 23:01:12', '2020-08-29 23:01:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (215, 31, '05', 'Aéreo', NULL, 19, '2020-08-29 23:01:12', '2020-08-29 23:01:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (216, 31, '06', 'Por cuenta propia', NULL, 19, '2020-08-29 23:01:12', '2020-08-29 23:01:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (217, 31, '07', 'Por comisión', NULL, 19, '2020-08-29 23:01:12', '2020-08-29 23:01:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (218, 31, '08', 'Electrónico', NULL, 19, '2020-08-29 23:01:12', '2020-08-29 23:01:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (219, 32, '01', 'Proveedor', NULL, 19, '2020-08-29 23:11:18', '2020-08-29 23:11:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (220, 32, '02', 'Transportista', NULL, 19, '2020-08-29 23:11:58', '2020-08-29 23:11:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (221, 32, '03', 'Cliente', NULL, 19, '2020-08-29 23:12:16', '2020-08-29 23:12:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (222, 33, '01', 'Subida', NULL, 19, '2020-08-30 00:46:14', '2020-08-30 00:46:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (223, 33, '02', 'Bajada', NULL, 19, '2020-08-30 00:46:30', '2020-08-30 00:46:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (226, 35, '01', 'Representante Legal', NULL, 19, '2020-08-30 01:27:33', '2025-06-13 10:26:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (227, 35, '02', 'Conductor ', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (228, 35, '03', 'Supervisor', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (229, 35, '04', 'Supervisor en Respuesta', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (230, 35, '05', 'Seguridad y Salud Ocupacional', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (231, 35, '06', 'Gerente General', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (232, 35, '07', 'GTH', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (233, 35, '08', 'Empresa', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (234, 35, '09', 'Supervisor de Tránsito', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (235, 35, '10', 'Usuario Empresa', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (236, 35, '11', 'Administrador de Punto de Control', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (237, 35, '12', 'Controlador de Campo', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (238, 35, '13', 'Coordinador de Servicio', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (239, 35, '14', 'Mecanico', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (240, 35, '15', 'Auditor de Transporte', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (241, 35, '16', 'Instructor de Manejo', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (242, 35, '17', 'Monitor de ruta', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (243, 35, '18', 'Inspector de ruta', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (244, 35, '19', 'Chofer de reten', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (245, 35, '20', 'Supervisor de operaciones', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (246, 35, '21', 'Jefe de operaciones', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (247, 35, '22', 'Operador de grua', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (248, 35, '23', 'Rigger', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (249, 35, '24', 'Ayudante', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (250, 35, '25', 'Auxiliar de mantenimiento', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (251, 35, '26', 'Asistente de Seguridad', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (252, 35, '27', 'Representante de Orica', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (253, 35, '28', 'Supervisor de respuesta', NULL, 19, '2020-08-30 01:27:33', '2020-08-30 01:27:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (254, 36, '01', 'Primero', NULL, 19, '2020-08-31 17:49:29', '2020-08-31 17:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (255, 36, '02', 'Segundo', NULL, 19, '2020-08-31 17:49:47', '2020-08-31 17:49:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (256, 36, '03', 'Tercero', NULL, 19, '2020-08-31 17:50:05', '2020-08-31 17:50:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (257, 36, '04', 'Cuarto', NULL, 19, '2020-08-31 17:50:20', '2020-08-31 17:50:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (258, 36, '05', 'Quinto', NULL, 19, '2020-08-31 17:50:32', '2020-08-31 17:50:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (259, 36, '06', 'Sexto', NULL, 19, '2020-08-31 17:50:48', '2020-08-31 17:50:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (260, 37, '01', 'Vacio', NULL, 19, '2020-08-31 17:55:28', '2020-08-31 17:55:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (261, 37, '02', 'Cargado', NULL, 19, '2020-08-31 17:55:50', '2020-08-31 17:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (262, 37, '03', 'Cargado Rezagado', NULL, 19, '2020-08-31 17:56:34', '2020-08-31 17:56:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (263, 38, '01', 'Persona', NULL, 19, '2020-09-03 16:08:20', '2020-09-03 16:08:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (264, 38, '02', 'Vehiculo', NULL, 19, '2020-09-03 16:08:45', '2020-09-03 16:08:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (265, 38, '03', 'Contenedor', NULL, 19, '2020-09-03 16:09:10', '2020-09-03 16:09:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (266, 38, '04', 'Seguridad Ocupacional', NULL, 19, '2020-09-03 16:09:42', '2020-09-03 16:09:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (267, 38, '05', 'Mercancias', NULL, 19, '2020-09-03 16:10:26', '2020-09-03 16:10:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (268, 39, '01', 'Liviano', NULL, 19, '2020-09-10 20:34:11', '2020-09-10 20:34:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (269, 39, '02', 'Pesado', NULL, 19, '2020-09-10 20:34:23', '2020-09-10 20:34:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (270, 40, '01', 'Hoover', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (271, 40, '02', 'Isotanque', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (272, 40, '03', 'Tolva', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (273, 40, '04', 'Cisterna', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (274, 40, '05', 'Bombona', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (275, 40, '06', 'Bolsa gigante ', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (276, 40, '07', 'Furgón', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (277, 40, '08', 'Bombona 2', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (278, 40, '09', 'Plataforma', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (279, 40, '10', 'Container', NULL, 19, '2020-09-10 20:36:52', '2020-09-10 20:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (280, 41, '01', 'Scania', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (281, 41, '02', 'Volvo', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (282, 41, '03', 'Freighliner', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (283, 41, '04', 'Mack', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (284, 41, '05', 'Mercedes', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (285, 41, '06', 'Toyota', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (286, 41, '07', 'Mazda', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (287, 41, '08', 'Nissan', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (288, 41, '09', 'Hino', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (289, 41, '10', 'Peugeot', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (290, 41, '11', 'Hyundai', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (291, 41, '12', 'Fameca', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (292, 41, '13', 'Sateci', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (293, 41, '14', 'Famecus', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (294, 41, '15', 'Freighleiner', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (295, 41, '16', 'Foton', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (296, 41, '17', 'White Martins', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (297, 41, '18', 'RMB SATECI', NULL, 19, '2020-09-10 20:56:52', '2020-09-10 20:57:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (298, 42, '01', 'Camioneta', NULL, 19, '2020-09-10 21:12:04', '2020-09-10 21:12:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (299, 42, '02', 'Tracto', NULL, 19, '2020-09-10 21:12:04', '2020-09-10 21:12:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (300, 42, '03', 'Respuesta a emergencia', NULL, 19, '2020-09-10 21:12:04', '2020-09-10 21:12:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (301, 42, '04', 'Monitor de ruta', NULL, 19, '2020-09-10 21:12:04', '2020-09-10 21:12:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (302, 42, '05', 'Carreta/Acople', NULL, 19, '2020-09-10 21:12:04', '2020-09-10 21:12:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (303, 42, '06', 'Camión', NULL, 19, '2020-09-10 21:12:04', '2020-09-10 21:12:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (304, 43, '01', 'Conforme', NULL, 19, '2020-10-13 22:52:51', '2020-10-13 22:52:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (305, 43, '02', 'No conforme', NULL, 19, '2020-10-13 22:53:08', '2020-10-13 22:53:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (306, 43, '03', 'Oportunidad de Mejora', NULL, 19, '2020-10-13 22:53:22', '2020-10-13 22:53:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (307, 44, '01', 'Programado', NULL, 19, '2020-10-30 20:01:31', '2020-10-30 20:01:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (308, 44, '02', 'En transito', NULL, 19, '2020-10-30 20:01:46', '2020-10-30 20:01:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (309, 45, '01', 'OFFLINE', NULL, 19, '2020-10-30 20:13:20', '2020-10-30 20:13:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (310, 45, '02', 'ONLINE', NULL, 19, '2020-10-30 20:13:43', '2020-10-30 20:13:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (311, 46, '01', 'Masculino', NULL, 19, '2020-10-16 19:11:39', '2020-10-16 19:11:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (312, 46, '02', 'Femenino', NULL, 19, '2020-10-16 19:11:50', '2020-10-16 19:11:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (313, 47, '01', 'Prueba de Alcohol', NULL, 19, '2020-11-17 14:53:23', '2020-11-17 14:53:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (314, 47, '02', 'Pausa Activa', NULL, 19, '2020-11-17 14:53:57', '2020-11-17 14:53:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (315, 47, '03', 'Dialogo Diario de Seguridad', NULL, 19, '2020-11-17 14:54:54', '2020-11-17 14:54:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (316, 47, '04', 'Desinfección de Unidades', NULL, 19, '2020-11-17 15:00:32', '2020-11-17 15:00:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (317, 47, '05', 'Control de Temperatura', NULL, 19, '2020-11-17 15:01:58', '2020-11-17 15:01:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (318, 48, '01', 'Publicado', NULL, 19, '2021-09-04 21:33:19', '2021-09-04 21:33:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (319, 48, '02', 'Vista Previa', NULL, 19, '2021-09-04 21:33:40', '2021-09-04 21:33:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (320, 48, '03', 'Despublicado', NULL, 19, '2021-09-04 21:34:03', '2021-09-04 21:34:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (321, 49, '01', 'Sociedad Anónima (S.A.)', 'Empresas con capital dividido en acciones, donde la responsabilidad de los accionistas se limita al monto de sus aportes. ', 19, '2025-06-13 10:33:53', '2025-06-13 10:33:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (322, 49, '02', 'Sociedad Anónima Cerrada (S.A.C.)', 'Una variante de la Sociedad Anónima con un número limitado de accionistas, generalmente hasta 20. ', 19, '2025-06-13 10:34:34', '2025-06-13 10:34:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (323, 49, '03', 'Sociedad Comercial de Responsabilidad Limitada (S.R.L.)', 'Sociedad donde la responsabilidad de los socios está limitada al monto de sus aportes de capital. ', 19, '2025-06-13 10:36:11', '2025-06-13 10:36:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (324, 49, '04', 'Empresa Individual de Responsabilidad Limitada (E.I.R.L.)', 'Empresa Individual de Responsabilidad Limitada (E.I.R.L.)', 19, '2025-06-13 10:36:54', '2025-06-13 10:36:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (325, 49, '05', 'Sociedad Anónima Abierta (S.A.A.)', 'Una Sociedad Anónima que puede ofrecer sus acciones al público en general.', 19, '2025-06-13 10:37:52', '2025-06-13 10:37:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (326, 50, '01', 'Provincia', NULL, 19, '2025-06-13 11:01:13', '2025-06-13 11:01:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (327, 50, '02', 'Lima', NULL, 19, '2025-06-13 11:01:31', '2025-06-13 11:01:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (328, 51, '01', 'Si', NULL, 19, '2025-06-13 11:02:13', '2025-06-13 11:02:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (329, 51, '02', 'No', NULL, 19, '2025-06-13 11:02:26', '2025-06-13 11:02:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (330, 52, '01', 'Dinero', NULL, 19, '2025-06-13 11:04:40', '2025-06-13 11:04:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `TAB_TABLAS` VALUES (331, 52, '01', 'Dinero mas Bienes', NULL, 19, '2025-06-13 11:05:08', '2025-06-13 11:05:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for TICKET
-- ----------------------------
DROP TABLE IF EXISTS `TICKET`;
CREATE TABLE `TICKET`  (
  `IDTICKET` int(0) NOT NULL AUTO_INCREMENT,
  `CODIGO` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `FECHA_HORA_EMISION` timestamp(0) NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `PRIORIDAD` int(0) NULL DEFAULT NULL,
  `TIPO_ATENCION` int(0) NULL DEFAULT NULL,
  `IDCLIENTE` int(0) NOT NULL,
  `IDESTACIONTRABAJO` int(0) NOT NULL,
  `HORA_INICIO` timestamp(0) NULL DEFAULT NULL,
  `HORA_FIN` timestamp(0) NULL DEFAULT NULL,
  `OBSERVACIONES` varchar(245) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDTICKET`) USING BTREE,
  INDEX `fk_TICKET_CLIENTE1_idx`(`IDCLIENTE`) USING BTREE,
  INDEX `fk_TICKET_ESTACION_TRABAJO1_idx`(`IDESTACIONTRABAJO`) USING BTREE,
  CONSTRAINT `fk_TICKET_CLIENTE1` FOREIGN KEY (`IDCLIENTE`) REFERENCES `CLIENTE` (`IDCLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_TICKET_ESTACION_TRABAJO1` FOREIGN KEY (`IDESTACIONTRABAJO`) REFERENCES `ESTACION_TRABAJO` (`IDESTACIONTRABAJO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for TIPO_CONTACTO
-- ----------------------------
DROP TABLE IF EXISTS `TIPO_CONTACTO`;
CREATE TABLE `TIPO_CONTACTO`  (
  `IDTIPOCONTACTO` int(0) NOT NULL AUTO_INCREMENT,
  `TIPO` int(0) NULL DEFAULT NULL COMMENT 'TELEFONO/RADIO/CELULAR/CORREO',
  `NUMERO` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `ESTADO_PRINCIPAL` int(0) NULL DEFAULT NULL,
  `IDPERSONA` int(0) NOT NULL,
  PRIMARY KEY (`IDTIPOCONTACTO`) USING BTREE,
  INDEX `fk_TIPO_CONTACTO_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_TIPO_CONTACTO_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for UNIDAD_EJECUTORA
-- ----------------------------
DROP TABLE IF EXISTS `UNIDAD_EJECUTORA`;
CREATE TABLE `UNIDAD_EJECUTORA`  (
  `IDUNIDADEJECUTORA` int(0) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ABREVIATURA` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'A:ACTIVO/I:INACTIVO',
  PRIMARY KEY (`IDUNIDADEJECUTORA`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for UNIDAD_ORGANICA
-- ----------------------------
DROP TABLE IF EXISTS `UNIDAD_ORGANICA`;
CREATE TABLE `UNIDAD_ORGANICA`  (
  `IDUNIDADORGANICA` int(0) NOT NULL AUTO_INCREMENT,
  `CODIGO` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRE` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `NOMBRE_CORTO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DIRECCION` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ESTADO` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'P:PENDIENT/A:ACTIVO/I:INACTIVO/B:BAJA',
  `TIPO` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'UO:ES UNIDAD ORGANICA/OP:ES OPD\n',
  `IDEMPRESA` int(0) NOT NULL,
  PRIMARY KEY (`IDUNIDADORGANICA`) USING BTREE,
  INDEX `fk_UNIDAD_ORGANICA_EMPRESA1_idx`(`IDEMPRESA`) USING BTREE,
  CONSTRAINT `fk_UNIDAD_ORGANICA_EMPRESA1` FOREIGN KEY (`IDEMPRESA`) REFERENCES `EMPRESA` (`IDEMPRESA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UNIDAD_ORGANICA
-- ----------------------------
INSERT INTO `UNIDAD_ORGANICA` VALUES (1, NULL, 'DIRECTORIO', 'DIR', 'DIRECTORIO ES FORMADO POR EL MIN DE ECONOMIA Y FINANZAS', 'JAVI ER PRADO', '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (2, NULL, 'PRESIDENCIA EJECUTIVA', 'PREEJEC', 'DEFINIDO POR EL DIRECTORIO', NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (3, NULL, 'GERENCIA GENERAL', 'GG', NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (4, NULL, 'GERENCIA RED DE AGENCIAS', 'GRA', NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (5, NULL, 'SUBGERENCIA MACROREGION II - TRUJILLO', 'SBMT', NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (6, '0321', 'HUACHO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (7, '0741', 'TRUJILLO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (8, '0761', 'CAJAMARCA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (9, '0781', 'CHIMBOTE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (10, '0271', 'CHOTA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (11, '0274', 'CUTERVO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (12, '0331', 'BARRANCA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (13, '0341', 'CARAZ', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (14, '0371', 'HUARAZ', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (15, '0744', 'CASAGRANDE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (16, '0757', 'PERIFÉRICA  TRUJILLO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (17, '0763', 'CELENDÍN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (18, '0771', 'VICTOR LARCO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (19, '0801', 'HUAMACHUCO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (20, '0811', 'PACASMAYO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (21, '0812', 'CHEPÉN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (22, '0244', 'SANTA CRUZ', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (23, '0251', 'NINABAMBA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (24, '0272', 'BAMBAMARCA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (25, '0275', 'HUAMBOS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (26, '0276', 'HUALGAYOC', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (27, '0278', 'QUEROCOTILLO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (28, '0279', 'QUEROCOTO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (29, '0280', 'YAUYUCÁN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (30, '0281', 'TACABAMBA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (31, '0284', 'SÓCOTA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (32, '0285', 'SANTO TOMAS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (33, '0322', 'CHURÍN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (34, '0323', 'HUAURA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (35, '0324', 'OYÓN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (36, '0325', 'SAYÁN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (37, '0332', 'CAJATAMBO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (38, '0333', 'PARAMONGA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (39, '0334', 'PATIVILCA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (40, '0335', 'PUEBLO SUPE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (41, '0336', 'PUERTO SUPE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (42, '0337', 'OCROS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (43, '0342', 'CORONGO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (44, '0344', 'HUAYLAS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (45, '0345', 'PISCOBAMBA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (46, '0346', 'POMABAMBA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (47, '0347', 'SIHUAS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (48, '0353', 'YUNGAY', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (49, '0357', 'HUACAYBAMBA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (50, '0372', 'AIJA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (51, '0373', 'CARHUAZ', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (52, '0374', 'CHIQUIÁN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (53, '0375', 'CHACAS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (54, '0376', 'HUARI', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (55, '0377', 'LLAMELLÍN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (56, '0378', 'RECUAY', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (57, '0379', 'SAN LUIS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (58, '0380', 'SAN MARCOS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (59, '0389', 'CHAVÍN DE HUANTAR', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (60, '0392', 'UCO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (61, '0393', 'INDEPENDENCIA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (62, '0742', 'ASCOPE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (63, '0743', 'CARTAVIO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (64, '0745', 'CASCAS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (65, '0746', 'CONTUMAZÁ', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (66, '0747', 'CHICAMA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (67, '0748', 'CHOCÓPE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (68, '0749', 'LAREDO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (69, '0750', 'USQUIL', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (70, '0751', 'OTUZCO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (71, '0752', 'PAIJÁN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (72, '0753', 'PUERTO MALABRIGO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (73, '0754', 'SALAVERRY', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (74, '0756', 'VIRÚ', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (75, '0758', 'JULCÁN', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (76, '0762', 'BOLÍVAR', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (77, '0765', 'SAN MARCOS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (78, '0766', 'SAN MIGUEL', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (79, '0767', 'SAN PABLO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (80, '0772', 'TONGOD', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (81, '0774', 'BAÑOS DEL INCA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (82, '0777', 'SOROCHUCO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (83, '0782', 'CABANA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (84, '0783', 'CASMA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (85, '0784', 'HUARMEY', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (86, '0785', 'NUEVO CHIMBOTE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (87, '0786', 'MORO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (88, '0788', 'SAN JACINTO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (89, '0789', 'SANTA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (90, '0791', 'CONCHUCOS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (91, '0792', 'PALLASCA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (92, '0795', 'PAMPAS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (93, '0802', 'CAJABAMBA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (94, '0803', 'HUACRACHUCO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (95, '0805', 'SANTIAGO DE CHUCO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (96, '0807', 'TAYABAMBA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (97, '0809', 'PARCOY', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (98, '0813', 'GUADALUPE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (99, '0814', 'SAN JOSÉ', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (100, '0815', 'SAN PEDRO DE LLOC', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (101, '0816', 'TEMBLADERA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (102, '0817', 'CHILETE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (103, '0818', 'CIUDAD DE DIOS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (104, '0282', 'PACCHA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (105, '0286', 'CATACHE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (106, '0810', 'CHILLIA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (107, '9552', 'SERPOST TRUJILLO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (108, '9554', 'CHAO', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (109, '9588', 'MUNICIPALIDAD DISTRITAL EL PORVENIR', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (110, '9593', 'MUNICIPALIDAD PROVINCIAL DE CAJAMARCA', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (111, '9598', 'MUNICIPALIDAD DISTRITAL DE LAJAS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (112, '9600', 'MUNICIPALIDAD DISTRITAL DE MOCHE', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (113, '', 'MUNICIPALIDAD DISTRITAL DE LAJAS', NULL, NULL, NULL, '1', '1', 2);
INSERT INTO `UNIDAD_ORGANICA` VALUES (114, '', 'MUNICIPALIDAD DISTRITAL DE MOCHE', NULL, NULL, NULL, '1', '1', 2);

-- ----------------------------
-- Table structure for UNIDAD_ORGANICA_DEPENDENCIA
-- ----------------------------
DROP TABLE IF EXISTS `UNIDAD_ORGANICA_DEPENDENCIA`;
CREATE TABLE `UNIDAD_ORGANICA_DEPENDENCIA`  (
  `IDUNIDADORGANICA` int(0) NOT NULL,
  `IDUNIDADORGANICADEPENDENCIA` int(0) NOT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL,
  `FECHA_CREACION` timestamp(0) NULL DEFAULT NULL,
  `FECHA_FIN` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDUNIDADORGANICA`, `IDUNIDADORGANICADEPENDENCIA`) USING BTREE,
  INDEX `fk_UNIDAD_ORGANICA_has_UNIDAD_ORGANICA_UNIDAD_ORGANICA2_idx`(`IDUNIDADORGANICADEPENDENCIA`) USING BTREE,
  INDEX `fk_UNIDAD_ORGANICA_has_UNIDAD_ORGANICA_UNIDAD_ORGANICA1_idx`(`IDUNIDADORGANICA`) USING BTREE,
  CONSTRAINT `fk_UNIDAD_ORGANICA_has_UNIDAD_ORGANICA_UNIDAD_ORGANICA1` FOREIGN KEY (`IDUNIDADORGANICA`) REFERENCES `UNIDAD_ORGANICA` (`IDUNIDADORGANICA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_UNIDAD_ORGANICA_has_UNIDAD_ORGANICA_UNIDAD_ORGANICA2` FOREIGN KEY (`IDUNIDADORGANICADEPENDENCIA`) REFERENCES `UNIDAD_ORGANICA` (`IDUNIDADORGANICA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UNIDAD_ORGANICA_DEPENDENCIA
-- ----------------------------
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (2, 1, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (3, 2, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (4, 3, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (6, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (7, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (8, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (9, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (10, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (11, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (12, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (13, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (14, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (15, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (16, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (17, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (18, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (19, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (20, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (21, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (22, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (23, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (24, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (25, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (26, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (27, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (28, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (29, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (30, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (31, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (32, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (33, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (34, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (35, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (36, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (37, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (38, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (39, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (40, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (41, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (42, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (43, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (44, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (45, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (46, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (47, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (48, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (49, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (50, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (51, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (52, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (53, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (54, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (55, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (56, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (57, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (58, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (59, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (60, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (61, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (62, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (63, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (64, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (65, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (66, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (67, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (68, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (69, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (70, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (71, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (72, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (73, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (74, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (75, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (76, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (77, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (78, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (79, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (80, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (81, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (82, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (83, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (84, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (85, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (86, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (87, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (88, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (89, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (90, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (91, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (92, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (93, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (94, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (95, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (96, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (97, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (98, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (99, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (100, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (101, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (102, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (103, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (104, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (105, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (106, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (107, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (108, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (109, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (110, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (111, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (112, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (113, 5, 19, NULL, NULL);
INSERT INTO `UNIDAD_ORGANICA_DEPENDENCIA` VALUES (114, 5, 19, NULL, NULL);

-- ----------------------------
-- Table structure for UNIDAD_ORGANICA_TRABAJA_PERSONAL
-- ----------------------------
DROP TABLE IF EXISTS `UNIDAD_ORGANICA_TRABAJA_PERSONAL`;
CREATE TABLE `UNIDAD_ORGANICA_TRABAJA_PERSONAL`  (
  `IDUNIDADORGANICA` int(0) NOT NULL,
  `IDPERSONAL` int(0) NOT NULL,
  `FECHA_INGRESO` datetime(0) NULL DEFAULT NULL,
  `FECHA_FINALIZACION` datetime(0) NULL DEFAULT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'IDTABLA DE TAB_TABLAS HEREDADO DE CATALOGO_TABLAS',
  `CARGO` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDUNIDADORGANICA`, `IDPERSONAL`) USING BTREE,
  INDEX `fk_UNIDAD_ORGANICA_has_PERSONAL_PERSONAL1_idx`(`IDPERSONAL`) USING BTREE,
  INDEX `fk_UNIDAD_ORGANICA_has_PERSONAL_UNIDAD_ORGANICA1_idx`(`IDUNIDADORGANICA`) USING BTREE,
  CONSTRAINT `fk_UNIDAD_ORGANICA_has_PERSONAL_PERSONAL1` FOREIGN KEY (`IDPERSONAL`) REFERENCES `PERSONAL` (`IDPERSONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_UNIDAD_ORGANICA_has_PERSONAL_UNIDAD_ORGANICA1` FOREIGN KEY (`IDUNIDADORGANICA`) REFERENCES `UNIDAD_ORGANICA` (`IDUNIDADORGANICA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for USUARIO
-- ----------------------------
DROP TABLE IF EXISTS `USUARIO`;
CREATE TABLE `USUARIO`  (
  `IDUSUARIO` int(0) NOT NULL AUTO_INCREMENT,
  `USUARIO` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CLAVE` char(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'A:ACTIVO/I:INACTIVO/B:BLOQUEADO',
  `BAJA` int(0) NULL DEFAULT NULL,
  `NROINTENTOS` int(0) NULL DEFAULT NULL,
  `ALIAS` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `DESCRIPCION` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `IDPERSONA` int(0) NOT NULL,
  `IDUSUARIOCREACION` int(0) NULL DEFAULT NULL,
  `ULTIMA_CONEXION` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IDUSUARIO`) USING BTREE,
  INDEX `fk_USUARIO_PERSONA1_idx`(`IDPERSONA`) USING BTREE,
  CONSTRAINT `fk_USUARIO_PERSONA1` FOREIGN KEY (`IDPERSONA`) REFERENCES `PERSONA` (`IDPERSONA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of USUARIO
-- ----------------------------
INSERT INTO `USUARIO` VALUES (1, 'ecaleroc@uni.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2024-10-21 22:13:10', '2024-10-21 21:39:47', 19, 19, NULL, NULL, NULL, 1, 1, NULL);
INSERT INTO `USUARIO` VALUES (2, 'pcruz@fullsafety.pe', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '2022-12-29 19:40:54', NULL, 20, 20, NULL, NULL, NULL, 558, 0, NULL);
INSERT INTO `USUARIO` VALUES (3, 'gcruz@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:11', NULL, 1, 0, NULL, NULL, NULL, 61, 0, NULL);
INSERT INTO `USUARIO` VALUES (4, 'joclocho@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 62, 0, NULL);
INSERT INTO `USUARIO` VALUES (5, 'vsaenz@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 63, 0, NULL);
INSERT INTO `USUARIO` VALUES (6, 'Lburgos@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 64, 0, NULL);
INSERT INTO `USUARIO` VALUES (7, 'lburgos@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 65, 0, NULL);
INSERT INTO `USUARIO` VALUES (8, 'vmunoz@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 66, 0, NULL);
INSERT INTO `USUARIO` VALUES (9, 'Psuarez@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 153, 0, NULL);
INSERT INTO `USUARIO` VALUES (10, 'psuarez@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 155, 0, NULL);
INSERT INTO `USUARIO` VALUES (11, 'asas@ssss.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 208, 0, NULL);
INSERT INTO `USUARIO` VALUES (12, 'pgalvez@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 277, 0, NULL);
INSERT INTO `USUARIO` VALUES (13, 'pgalvez@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 315, 0, NULL);
INSERT INTO `USUARIO` VALUES (14, 'ngarro@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 316, 0, NULL);
INSERT INTO `USUARIO` VALUES (15, 'drojas@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 317, 0, NULL);
INSERT INTO `USUARIO` VALUES (16, 'lsuarez@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 321, 0, NULL);
INSERT INTO `USUARIO` VALUES (17, 'pruiz@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 322, 0, NULL);
INSERT INTO `USUARIO` VALUES (18, 'glingan@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 323, 0, NULL);
INSERT INTO `USUARIO` VALUES (19, 'ccruz@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 324, 0, NULL);
INSERT INTO `USUARIO` VALUES (20, 'sperreault@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 325, 0, NULL);
INSERT INTO `USUARIO` VALUES (21, 'rmedina@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 326, 0, NULL);
INSERT INTO `USUARIO` VALUES (22, 'ypairazaman@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 327, 0, NULL);
INSERT INTO `USUARIO` VALUES (23, 'p', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 364, 0, NULL);
INSERT INTO `USUARIO` VALUES (24, 'lbeltran@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 366, 0, NULL);
INSERT INTO `USUARIO` VALUES (25, 'sperreault@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 379, 0, NULL);
INSERT INTO `USUARIO` VALUES (26, 'p', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 460, 0, NULL);
INSERT INTO `USUARIO` VALUES (27, 'jvasquez@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 467, 0, NULL);
INSERT INTO `USUARIO` VALUES (28, 'jvasquez@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2020-08-30 22:12:23', NULL, 1, 0, NULL, NULL, NULL, 468, 0, NULL);
INSERT INTO `USUARIO` VALUES (29, 'gcruz@fullsafety.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2025-06-11 02:08:03', NULL, 1, 0, NULL, NULL, NULL, 469, NULL, NULL);
INSERT INTO `USUARIO` VALUES (30, 'cedwinkennedy@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '2024-10-29 15:35:52', '2024-10-21 21:39:47', 19, 19, NULL, NULL, NULL, 1, 1, NULL);
INSERT INTO `USUARIO` VALUES (31, 'unifiis@hotmail.com', '1d28c120568c10e19b9d8abe8b66d0983fa3d2e11ee7751aca50f83c6f4a43aa', '2024-10-22 18:50:15', '2024-10-22 18:48:33', 19, 19, NULL, NULL, NULL, 558, 1, NULL);
INSERT INTO `USUARIO` VALUES (32, 'lcordovac06@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '2024-10-29 15:43:48', '2024-10-26 05:03:37', 19, 19, NULL, NULL, NULL, 658, 1, NULL);
INSERT INTO `USUARIO` VALUES (36, 'berit@uni.pe', 'ff2ccb6ba423d356bd549ed4bfb76e96976a0dcde05a09996a1cdb9f83422ec4', NULL, '2024-10-26 22:44:25', 19, 20, NULL, '', '', 688, 1, NULL);
INSERT INTO `USUARIO` VALUES (42, 'carlostefa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 694, NULL, NULL);
INSERT INTO `USUARIO` VALUES (46, 'brenda@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 698, NULL, NULL);
INSERT INTO `USUARIO` VALUES (47, 'lucecina@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 699, NULL, NULL);
INSERT INTO `USUARIO` VALUES (48, 'tefita@uni.pe', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, NULL, NULL);
INSERT INTO `USUARIO` VALUES (49, 'tefi@uni.pe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 736, NULL, NULL);
INSERT INTO `USUARIO` VALUES (50, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 737, NULL, NULL);

-- ----------------------------
-- Table structure for USUARIO_ROL
-- ----------------------------
DROP TABLE IF EXISTS `USUARIO_ROL`;
CREATE TABLE `USUARIO_ROL`  (
  `IDUSUARIO` int(0) NOT NULL,
  `IDROL` int(0) NOT NULL,
  `ESTADO` int(0) NULL DEFAULT NULL COMMENT 'A:ACTIVO/I:INACTIVO',
  `SYSCREACION` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `SYSACTUALIZACION` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`IDUSUARIO`, `IDROL`) USING BTREE,
  INDEX `fk_USUARIO_has_ROL_ROL1_idx`(`IDROL`) USING BTREE,
  INDEX `fk_USUARIO_has_ROL_USUARIO1_idx`(`IDUSUARIO`) USING BTREE,
  CONSTRAINT `fk_USUARIO_has_ROL_ROL1` FOREIGN KEY (`IDROL`) REFERENCES `ROL` (`IDROL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_USUARIO_has_ROL_USUARIO1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `USUARIO` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of USUARIO_ROL
-- ----------------------------
INSERT INTO `USUARIO_ROL` VALUES (1, 1, 19, '2020-08-30 22:14:27', NULL);
INSERT INTO `USUARIO_ROL` VALUES (1, 2, 19, '2022-12-29 19:33:02', NULL);
INSERT INTO `USUARIO_ROL` VALUES (30, 1, 19, '2024-10-21 21:59:31', NULL);
INSERT INTO `USUARIO_ROL` VALUES (31, 1, 19, '2024-10-22 18:55:55', NULL);
INSERT INTO `USUARIO_ROL` VALUES (32, 2, 19, '2024-11-07 18:40:40', NULL);

SET FOREIGN_KEY_CHECKS = 1;
