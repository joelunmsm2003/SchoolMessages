-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-04-2016 a las 08:06:04
-- Versión del servidor: 5.5.41-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user` int(100) NOT NULL DEFAULT '0',
  `anio` int(11) DEFAULT NULL,
  `periodo` int(100) NOT NULL DEFAULT '0',
  `seccion` int(100) DEFAULT NULL,
  `grado` int(100) DEFAULT NULL,
  `niveleducativo` int(100) DEFAULT NULL,
  `promedio` int(100) DEFAULT NULL,
  `puesto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `user` (`user`),
  KEY `periodo` (`periodo`),
  KEY `anio` (`anio`),
  KEY `seccion` (`seccion`),
  KEY `grado` (`grado`),
  KEY `niveleducativo` (`niveleducativo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `user`, `anio`, `periodo`, `seccion`, `grado`, `niveleducativo`, `promedio`, `puesto`) VALUES
(1, 5, 1, 1, 1, 1, 1, 12, 2),
(2, 6, 1, 1, 1, 1, 1, 6, 4),
(3, 7, 1, 1, 1, 1, 1, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnocurso`
--

CREATE TABLE IF NOT EXISTS `alumnocurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(100) DEFAULT NULL,
  `curso` int(100) DEFAULT NULL,
  `profesor` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curso` (`curso`),
  KEY `alumno` (`alumno`),
  KEY `profesor` (`profesor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `alumnocurso`
--

INSERT INTO `alumnocurso` (`id`, `alumno`, `curso`, `profesor`) VALUES
(1, 1, 2, 1),
(2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anio`
--

CREATE TABLE IF NOT EXISTS `anio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `anio`
--

INSERT INTO `anio` (`id`, `nombre`) VALUES
(1, 2016),
(2, 2017);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nivel` int(100) DEFAULT NULL,
  `colegio` int(100) DEFAULT NULL,
  `dni` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `fnacimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `nivel` (`nivel`),
  KEY `colegio` (`colegio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `nombres`, `email`, `is_staff`, `is_active`, `date_joined`, `nivel`, `colegio`, `dni`, `direccion`, `distrito`, `fnacimiento`) VALUES
(1, 'pbkdf2_sha256$15000$7hHbuIE3ib5M$VJO0fu9znbdoIv+cBiN5hXPbVtGHJ89bV6CDfoQFakI=', '2016-04-24 23:03:17', 1, 'root', '', '', NULL, '', 1, 1, '2016-04-24 16:09:31', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'pbkdf2_sha256$15000$lltdNsvRJFYQ$Gw5KG6kRcgTpfNhNeLElAOgdO3mvD1qW/RL4YopS2dU=', '2016-04-24 16:12:57', 0, 'director', 'Carlos', '', NULL, '', 0, 1, '2016-04-24 16:12:57', 1, 1, NULL, NULL, NULL, NULL),
(3, 'pbkdf2_sha256$15000$GvlBeQRsFicf$ml9E+u9OdxNt5yXVRuhX+2PnoGP+G6N76eJNOpvmoHs=', '2016-04-24 17:58:37', 0, 'joel', 'Joel', '', NULL, '', 0, 1, '2016-04-24 17:58:37', 6, 1, NULL, NULL, NULL, NULL),
(4, 'pbkdf2_sha256$15000$5D5MSWAHseIT$aSzEjzaMbl1Ld+QQqizKjfMRSGIMIG6wt9ZnNV76Y8Q=', '2016-04-24 17:59:03', 0, 'cristian', '', '', NULL, '', 0, 1, '2016-04-24 17:59:03', 6, 1, NULL, NULL, NULL, NULL),
(5, 'pbkdf2_sha256$15000$pk03CBXENXg6$r1Akp2yURZ96e0cWritm5yiuodxFPB7aMpnP1N7R2QM=', '2016-04-24 18:54:09', 0, 'alumno', 'Pepe', '', NULL, '', 0, 1, '2016-04-24 18:54:09', 3, 1, NULL, NULL, NULL, NULL),
(6, 'pbkdf2_sha256$15000$etgYQayexK59$gjUEU+OgY9/snvsb2V+ZJOjBXbktwlWYUtlP/hi8IQw=', '2016-04-24 22:26:37', 0, 'alumno2', 'Jorge', '', NULL, '', 0, 1, '2016-04-24 22:26:37', 3, 1, NULL, NULL, NULL, NULL),
(7, 'pbkdf2_sha256$15000$rQysaC7IvgiN$gQtAOHOsAuvhxP7PEZq31OKGJ9kFUJpFE4jU/AbEjzc=', '2016-04-24 22:28:50', 0, 'alumno3', 'Anita', '', NULL, '', 0, 1, '2016-04-24 22:28:50', 3, 1, NULL, NULL, NULL, NULL),
(8, 'pbkdf2_sha256$15000$xmtymP9Tycn2$uZsB4thV0snAQfDozjtvhZIciE0iKFNDFrt+ruw2Fdo=', '2016-04-24 23:03:31', 0, 'profesor', 'Girafales', '', NULL, '', 0, 1, '2016-04-24 23:03:31', 2, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colegio`
--

CREATE TABLE IF NOT EXISTS `colegio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `colegio`
--

INSERT INTO `colegio` (`id`, `nombre`, `direccion`) VALUES
(1, 'Maristas', 'San Isidro'),
(2, 'Claretiano', 'San Borja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `niveleducativo` int(100) DEFAULT NULL,
  `grado` int(100) DEFAULT NULL,
  `colegio` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grado` (`grado`),
  KEY `niveleducativo` (`niveleducativo`),
  KEY `colegio` (`colegio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `niveleducativo`, `grado`, `colegio`) VALUES
(1, 'Quimica', NULL, NULL, NULL),
(2, 'Fisica', NULL, NULL, NULL),
(3, 'Matematica', NULL, NULL, NULL),
(4, 'Lenguaje', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-04-24 16:12:58', '2', 'director', 1, '', 4, 1),
(2, '2016-04-24 16:13:36', '2', 'director', 2, 'Changed first_name.', 4, 1),
(3, '2016-04-24 17:58:38', '3', 'joel', 1, '', 4, 1),
(4, '2016-04-24 17:58:47', '3', 'joel', 2, 'Changed first_name.', 4, 1),
(5, '2016-04-24 17:59:04', '4', 'cristian', 1, '', 4, 1),
(6, '2016-04-24 17:59:09', '4', 'cristian', 2, 'No fields changed.', 4, 1),
(7, '2016-04-24 18:54:09', '5', 'alumno', 1, '', 4, 1),
(8, '2016-04-24 18:54:22', '5', 'alumno', 2, 'Changed first_name.', 4, 1),
(9, '2016-04-24 22:26:37', '6', 'alumno2', 1, '', 4, 1),
(10, '2016-04-24 22:26:48', '6', 'alumno2', 2, 'Changed first_name.', 4, 1),
(11, '2016-04-24 22:28:50', '7', 'alumno3', 1, '', 4, 1),
(12, '2016-04-24 23:03:32', '8', 'profesor', 1, '', 4, 1),
(13, '2016-04-24 23:03:50', '8', 'profesor', 2, 'Changed first_name.', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-04-22 01:40:46'),
(2, 'auth', '0001_initial', '2016-04-22 01:40:51'),
(3, 'admin', '0001_initial', '2016-04-22 01:40:53'),
(4, 'sessions', '0001_initial', '2016-04-22 01:40:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('kvcxaups2tkuj6dfbvso4lea6rct3wyt', 'Y2FjMjY2ZTQ0MDRhYjhlM2UwMTY3NzQ3ZTU2ODY4ODg5OGQzZDM5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxMjM3NWY1NzkxNmY3M2E5MjM1YTE1MjA1Mzg2YTkxNzJiYTM3ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2016-05-08 22:35:33'),
('ok0mtknbhrlb13kaqoqggfz14tcejmvq', 'Y2FjMjY2ZTQ0MDRhYjhlM2UwMTY3NzQ3ZTU2ODY4ODg5OGQzZDM5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxMjM3NWY1NzkxNmY3M2E5MjM1YTE1MjA1Mzg2YTkxNzJiYTM3ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2016-05-08 18:44:30'),
('pt5efyr1jsr1higz7lyut0k9mcxx64tf', 'Y2FjMjY2ZTQ0MDRhYjhlM2UwMTY3NzQ3ZTU2ODY4ODg5OGQzZDM5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxMjM3NWY1NzkxNmY3M2E5MjM1YTE1MjA1Mzg2YTkxNzJiYTM3ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2016-05-08 23:03:17'),
('raw7uby71adcs8ta45u7exp98q1xwube', 'Y2FjMjY2ZTQ0MDRhYjhlM2UwMTY3NzQ3ZTU2ODY4ODg5OGQzZDM5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxMjM3NWY1NzkxNmY3M2E5MjM1YTE1MjA1Mzg2YTkxNzJiYTM3ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2016-05-08 17:58:23'),
('s1ylxyg04o3oinmrre28jlgsd3mqn40d', 'Y2FjMjY2ZTQ0MDRhYjhlM2UwMTY3NzQ3ZTU2ODY4ODg5OGQzZDM5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxMjM3NWY1NzkxNmY3M2E5MjM1YTE1MjA1Mzg2YTkxNzJiYTM3ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2016-05-08 16:12:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE IF NOT EXISTS `grado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id`, `nombre`) VALUES
(1, 'Primer'),
(2, 'Segundo'),
(3, 'Tercer'),
(4, 'Cuarto'),
(5, 'Quinto'),
(6, 'Sexto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE IF NOT EXISTS `nivel` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`id`, `nombre`) VALUES
(1, 'Director'),
(2, 'Profesor'),
(3, 'Alumno'),
(4, 'Secretario'),
(5, 'Admin'),
(6, 'Manager');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveleducativo`
--

CREATE TABLE IF NOT EXISTS `niveleducativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `niveleducativo`
--

INSERT INTO `niveleducativo` (`id`, `nombre`) VALUES
(1, 'Inicial'),
(2, 'Primaria'),
(3, 'Secundaria'),
(4, 'Academia'),
(5, 'Universidad'),
(6, 'Instituto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE IF NOT EXISTS `periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id`, `nombre`) VALUES
(1, 'I Bimestre'),
(2, 'II Bimestre'),
(3, 'III Bimestre'),
(4, 'IV Bimestre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE IF NOT EXISTS `profesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `user`) VALUES
(1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE IF NOT EXISTS `seccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `nombre`) VALUES
(1, 'A'),
(2, 'B');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`anio`) REFERENCES `anio` (`id`),
  ADD CONSTRAINT `alumno_ibfk_3` FOREIGN KEY (`periodo`) REFERENCES `periodo` (`id`),
  ADD CONSTRAINT `alumno_ibfk_4` FOREIGN KEY (`seccion`) REFERENCES `seccion` (`id`),
  ADD CONSTRAINT `alumno_ibfk_5` FOREIGN KEY (`grado`) REFERENCES `grado` (`id`),
  ADD CONSTRAINT `alumno_ibfk_6` FOREIGN KEY (`niveleducativo`) REFERENCES `niveleducativo` (`id`);

--
-- Filtros para la tabla `alumnocurso`
--
ALTER TABLE `alumnocurso`
  ADD CONSTRAINT `alumnocurso_ibfk_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `alumnocurso_ibfk_2` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `alumnocurso_ibfk_3` FOREIGN KEY (`profesor`) REFERENCES `profesor` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD CONSTRAINT `auth_user_ibfk_1` FOREIGN KEY (`nivel`) REFERENCES `nivel` (`id`),
  ADD CONSTRAINT `auth_user_ibfk_2` FOREIGN KEY (`colegio`) REFERENCES `colegio` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
