-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2021 a las 13:34:54
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_planes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condiciones`
--

CREATE TABLE `condiciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `validar` tinyint(1) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condiciones_cursos__cursos_condiciones`
--

CREATE TABLE `condiciones_cursos__cursos_condiciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `condicione_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_store`
--

CREATE TABLE `core_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `core_store`
--

INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(1, 'model_def_strapi::core-store', '{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}', 'object', NULL, NULL),
(2, 'model_def_strapi::webhooks', '{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}', 'object', NULL, NULL),
(3, 'model_def_strapi::permission', '{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}', 'object', NULL, NULL),
(4, 'model_def_strapi::role', '{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}', 'object', NULL, NULL),
(5, 'model_def_strapi::user', '{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}}}', 'object', NULL, NULL),
(6, 'model_def_plugins::users-permissions.permission', '{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(7, 'model_def_plugins::users-permissions.role', '{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(8, 'model_def_plugins::users-permissions.user', '{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"matriculas\":{\"collection\":\"matriculas\",\"via\":\"user\",\"isVirtual\":true},\"tel\":{\"type\":\"biginteger\"},\"DNI\":{\"type\":\"string\",\"unique\":true,\"maxLength\":9,\"minLength\":9},\"Nombre\":{\"type\":\"string\"},\"Papellido\":{\"type\":\"string\"},\"Sapellido\":{\"type\":\"string\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(9, 'model_def_plugins::upload.file', '{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(10, 'model_def_plugins::i18n.locale', '{\"uid\":\"plugins::i18n.locale\",\"collectionName\":\"i18n_locales\",\"kind\":\"collectionType\",\"info\":{\"name\":\"locale\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(11, 'plugin_users-permissions_grant', '{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"}}', 'object', '', ''),
(12, 'plugin_upload_settings', '{\"sizeOptimization\":true,\"responsiveDimensions\":true}', 'object', 'development', ''),
(13, 'plugin_content_manager_configuration_content_types::strapi::permission', '{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"Properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}', 'object', '', ''),
(14, 'plugin_content_manager_configuration_content_types::strapi::role', '{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}', 'object', '', ''),
(15, 'plugin_content_manager_configuration_content_types::strapi::user', '{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"PreferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreferedLanguage\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"preferedLanguage\",\"size\":6}]]}}', 'object', '', ''),
(16, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}', 'object', '', ''),
(17, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"ConfirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ConfirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"matriculas\":{\"edit\":{\"label\":\"Matriculas\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Matriculas\",\"searchable\":false,\"sortable\":false}},\"tel\":{\"edit\":{\"label\":\"Tel\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Tel\",\"searchable\":true,\"sortable\":true}},\"DNI\":{\"edit\":{\"label\":\"DNI\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"DNI\",\"searchable\":true,\"sortable\":true}},\"Nombre\":{\"edit\":{\"label\":\"Nombre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Nombre\",\"searchable\":true,\"sortable\":true}},\"Papellido\":{\"edit\":{\"label\":\"Papellido\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Papellido\",\"searchable\":true,\"sortable\":true}},\"Sapellido\":{\"edit\":{\"label\":\"Sapellido\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sapellido\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"tel\",\"size\":4}],[{\"name\":\"DNI\",\"size\":6},{\"name\":\"Nombre\",\"size\":6}],[{\"name\":\"Papellido\",\"size\":6},{\"name\":\"Sapellido\",\"size\":6}]],\"editRelations\":[\"role\",\"matriculas\"]}}', 'object', '', ''),
(18, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}', 'object', '', ''),
(19, 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}', 'object', '', ''),
(20, 'plugin_content_manager_configuration_content_types::plugins::i18n.locale', '{\"uid\":\"plugins::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"created_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}', 'object', '', ''),
(21, 'plugin_i18n_default_locale', '\"en\"', 'string', '', ''),
(22, 'plugin_users-permissions_email', '{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}', 'object', '', ''),
(23, 'plugin_users-permissions_advanced', '{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":true,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"public\"}', 'object', '', ''),
(24, 'core_admin_auth', '{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}', 'object', '', ''),
(25, 'plugin_documentation_config', '{\"restrictedAccess\":false}', 'object', '', ''),
(26, 'model_def_application::cursos.cursos', '{\"uid\":\"application::cursos.cursos\",\"collectionName\":\"cursos\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Cursos\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"nombre\":{\"type\":\"string\"},\"curso_cod\":{\"type\":\"string\"},\"matricula\":{\"via\":\"curso\",\"model\":\"matriculas\"},\"modalidades\":{\"via\":\"curso\",\"collection\":\"modalidades\",\"isVirtual\":true},\"condiciones\":{\"collection\":\"condiciones\",\"via\":\"cursos\",\"dominant\":true,\"attribute\":\"condicione\",\"column\":\"id\",\"isVirtual\":true},\"troncales\":{\"via\":\"cursos\",\"collection\":\"troncales\",\"attribute\":\"troncale\",\"column\":\"id\",\"isVirtual\":true},\"optativas\":{\"via\":\"cursos\",\"collection\":\"optativas\",\"attribute\":\"optativa\",\"column\":\"id\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(27, 'plugin_content_manager_configuration_content_types::application::cursos.cursos', '{\"uid\":\"application::cursos.cursos\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"nombre\",\"defaultSortBy\":\"nombre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"nombre\":{\"edit\":{\"label\":\"Nombre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Nombre\",\"searchable\":true,\"sortable\":true}},\"curso_cod\":{\"edit\":{\"label\":\"Curso_cod\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Curso_cod\",\"searchable\":true,\"sortable\":true}},\"matricula\":{\"edit\":{\"label\":\"Matricula\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Matricula\",\"searchable\":true,\"sortable\":true}},\"troncales\":{\"edit\":{\"label\":\"Troncales\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Troncales\",\"searchable\":false,\"sortable\":false}},\"modalidades\":{\"edit\":{\"label\":\"Modalidades\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Modalidades\",\"searchable\":false,\"sortable\":false}},\"optativas\":{\"edit\":{\"label\":\"Optativas\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Optativas\",\"searchable\":false,\"sortable\":false}},\"condiciones\":{\"edit\":{\"label\":\"Condiciones\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Condiciones\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"nombre\",\"curso_cod\",\"created_at\"],\"edit\":[[{\"name\":\"nombre\",\"size\":6},{\"name\":\"curso_cod\",\"size\":6}]],\"editRelations\":[\"matricula\",\"troncales\",\"modalidades\",\"optativas\",\"condiciones\"]}}', 'object', '', ''),
(28, 'model_def_application::matriculas.matriculas', '{\"uid\":\"application::matriculas.matriculas\",\"collectionName\":\"matriculas\",\"kind\":\"collectionType\",\"info\":{\"name\":\"matriculas\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"fecha\":{\"type\":\"date\"},\"curso\":{\"via\":\"matricula\",\"model\":\"cursos\"},\"user\":{\"via\":\"matriculas\",\"plugin\":\"users-permissions\",\"model\":\"user\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(29, 'plugin_content_manager_configuration_content_types::application::matriculas.matriculas', '{\"uid\":\"application::matriculas.matriculas\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"fecha\":{\"edit\":{\"label\":\"Fecha\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Fecha\",\"searchable\":true,\"sortable\":true}},\"curso\":{\"edit\":{\"label\":\"Curso\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Curso\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"User\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"User\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"fecha\",\"created_at\",\"updated_at\"],\"edit\":[[{\"name\":\"fecha\",\"size\":4}]],\"editRelations\":[\"curso\",\"user\"]}}', 'object', '', ''),
(30, 'model_def_application::usuarios.usuarios', '{\"uid\":\"application::usuarios.usuarios\",\"collectionName\":\"usuarios\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Usuarios\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(31, 'plugin_content_manager_configuration_content_types::application::usuarios.usuarios', '{\"uid\":\"application::usuarios.usuarios\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[],\"editRelations\":[]}}', 'object', '', ''),
(32, 'model_def_application::troncales.troncales', '{\"uid\":\"application::troncales.troncales\",\"collectionName\":\"troncales\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Troncales\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"nombre\":{\"type\":\"string\"},\"asignatura_cod\":{\"type\":\"string\"},\"cursos\":{\"collection\":\"cursos\",\"via\":\"troncales\",\"dominant\":true,\"attribute\":\"curso\",\"column\":\"id\",\"isVirtual\":true},\"modalidades\":{\"via\":\"troncales\",\"collection\":\"modalidades\",\"attribute\":\"modalidade\",\"column\":\"id\",\"isVirtual\":true},\"Eleccion\":{\"type\":\"boolean\"},\"Tipo\":{\"type\":\"enumeration\",\"enum\":[\"general\",\"especifica\",\"de_opcion\"]},\"Anotacion\":{\"type\":\"text\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(33, 'plugin_content_manager_configuration_content_types::application::troncales.troncales', '{\"uid\":\"application::troncales.troncales\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"nombre\",\"defaultSortBy\":\"nombre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"nombre\":{\"edit\":{\"label\":\"Nombre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Nombre\",\"searchable\":true,\"sortable\":true}},\"asignatura_cod\":{\"edit\":{\"label\":\"Asignatura_cod\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Asignatura_cod\",\"searchable\":true,\"sortable\":true}},\"cursos\":{\"edit\":{\"label\":\"Cursos\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Cursos\",\"searchable\":false,\"sortable\":false}},\"modalidades\":{\"edit\":{\"label\":\"Modalidades\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Modalidades\",\"searchable\":false,\"sortable\":false}},\"Eleccion\":{\"edit\":{\"label\":\"Eleccion\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Eleccion\",\"searchable\":true,\"sortable\":true}},\"Tipo\":{\"edit\":{\"label\":\"Tipo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Tipo\",\"searchable\":true,\"sortable\":true}},\"Anotacion\":{\"edit\":{\"label\":\"Anotacion\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Anotacion\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"nombre\",\"asignatura_cod\",\"created_at\"],\"edit\":[[{\"name\":\"nombre\",\"size\":6},{\"name\":\"asignatura_cod\",\"size\":6}],[{\"name\":\"Eleccion\",\"size\":4},{\"name\":\"Tipo\",\"size\":6}],[{\"name\":\"Anotacion\",\"size\":6}]],\"editRelations\":[\"cursos\",\"modalidades\"]}}', 'object', '', ''),
(34, 'model_def_application::modalidades.modalidades', '{\"uid\":\"application::modalidades.modalidades\",\"collectionName\":\"modalidades\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Modalidades\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"nombre\":{\"type\":\"string\"},\"curso\":{\"via\":\"modalidades\",\"model\":\"cursos\"},\"optativas\":{\"via\":\"modalidades\",\"collection\":\"optativas\",\"dominant\":true,\"attribute\":\"optativa\",\"column\":\"id\",\"isVirtual\":true},\"troncales\":{\"via\":\"modalidades\",\"collection\":\"troncales\",\"dominant\":true,\"attribute\":\"troncale\",\"column\":\"id\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL);
INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(35, 'plugin_content_manager_configuration_content_types::application::modalidades.modalidades', '{\"uid\":\"application::modalidades.modalidades\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"nombre\",\"defaultSortBy\":\"nombre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"nombre\":{\"edit\":{\"label\":\"Nombre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Nombre\",\"searchable\":true,\"sortable\":true}},\"curso\":{\"edit\":{\"label\":\"Curso\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Curso\",\"searchable\":true,\"sortable\":true}},\"optativas\":{\"edit\":{\"label\":\"Optativas\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Optativas\",\"searchable\":false,\"sortable\":false}},\"troncales\":{\"edit\":{\"label\":\"Troncales\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Troncales\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"nombre\",\"created_at\",\"updated_at\"],\"edit\":[[{\"name\":\"nombre\",\"size\":6}]],\"editRelations\":[\"curso\",\"optativas\",\"troncales\"]}}', 'object', '', ''),
(36, 'model_def_application::optativas.optativas', '{\"uid\":\"application::optativas.optativas\",\"collectionName\":\"optativas\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Optativas\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"nombre\":{\"type\":\"string\"},\"optativa_cod\":{\"type\":\"string\"},\"cursos\":{\"collection\":\"cursos\",\"via\":\"optativas\",\"dominant\":true,\"attribute\":\"curso\",\"column\":\"id\",\"isVirtual\":true},\"Horas\":{\"type\":\"string\"},\"Religion\":{\"type\":\"boolean\"},\"LenguaExtranjera\":{\"type\":\"boolean\"},\"modalidades\":{\"via\":\"optativas\",\"collection\":\"modalidades\",\"attribute\":\"modalidade\",\"column\":\"id\",\"isVirtual\":true},\"OpcionBilingue\":{\"type\":\"boolean\"},\"Nota\":{\"type\":\"text\"},\"TroncalNoCursada\":{\"type\":\"boolean\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(37, 'plugin_content_manager_configuration_content_types::application::optativas.optativas', '{\"uid\":\"application::optativas.optativas\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"nombre\",\"defaultSortBy\":\"nombre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"nombre\":{\"edit\":{\"label\":\"Nombre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Nombre\",\"searchable\":true,\"sortable\":true}},\"optativa_cod\":{\"edit\":{\"label\":\"Optativa_cod\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Optativa_cod\",\"searchable\":true,\"sortable\":true}},\"cursos\":{\"edit\":{\"label\":\"Cursos\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Cursos\",\"searchable\":false,\"sortable\":false}},\"Horas\":{\"edit\":{\"label\":\"Horas\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Horas\",\"searchable\":true,\"sortable\":true}},\"Religion\":{\"edit\":{\"label\":\"Religion\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Religion\",\"searchable\":true,\"sortable\":true}},\"LenguaExtranjera\":{\"edit\":{\"label\":\"LenguaExtranjera\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"LenguaExtranjera\",\"searchable\":true,\"sortable\":true}},\"modalidades\":{\"edit\":{\"label\":\"Modalidades\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Modalidades\",\"searchable\":false,\"sortable\":false}},\"OpcionBilingue\":{\"edit\":{\"label\":\"OpcionBilingue\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"OpcionBilingue\",\"searchable\":true,\"sortable\":true}},\"Nota\":{\"edit\":{\"label\":\"Nota\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Nota\",\"searchable\":true,\"sortable\":true}},\"TroncalNoCursada\":{\"edit\":{\"label\":\"TroncalNoCursada\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"TroncalNoCursada\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"nombre\",\"optativa_cod\",\"created_at\"],\"edit\":[[{\"name\":\"nombre\",\"size\":6},{\"name\":\"optativa_cod\",\"size\":6}],[{\"name\":\"Horas\",\"size\":6},{\"name\":\"Religion\",\"size\":4}],[{\"name\":\"LenguaExtranjera\",\"size\":4},{\"name\":\"OpcionBilingue\",\"size\":4}],[{\"name\":\"Nota\",\"size\":6},{\"name\":\"TroncalNoCursada\",\"size\":4}]],\"editRelations\":[\"cursos\",\"modalidades\"]}}', 'object', '', ''),
(38, 'model_def_application::condiciones.condiciones', '{\"uid\":\"application::condiciones.condiciones\",\"collectionName\":\"condiciones\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Condiciones\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"nombre\":{\"type\":\"string\"},\"validar\":{\"type\":\"boolean\"},\"cursos\":{\"via\":\"condiciones\",\"collection\":\"cursos\",\"attribute\":\"curso\",\"column\":\"id\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(39, 'plugin_content_manager_configuration_content_types::application::condiciones.condiciones', '{\"uid\":\"application::condiciones.condiciones\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"nombre\",\"defaultSortBy\":\"nombre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"nombre\":{\"edit\":{\"label\":\"Nombre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Nombre\",\"searchable\":true,\"sortable\":true}},\"validar\":{\"edit\":{\"label\":\"Validar\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Validar\",\"searchable\":true,\"sortable\":true}},\"cursos\":{\"edit\":{\"label\":\"Cursos\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"nombre\"},\"list\":{\"label\":\"Cursos\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"nombre\",\"validar\",\"created_at\"],\"edit\":[[{\"name\":\"nombre\",\"size\":6},{\"name\":\"validar\",\"size\":4}]],\"editRelations\":[\"cursos\"]}}', 'object', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `curso_cod` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `matricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `curso_cod`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `matricula`) VALUES
(1, '1º Bachillerato', 'BH1', '2021-11-10 17:05:09', 1, 1, '2021-11-10 16:05:07', '2021-12-11 13:43:57', 1),
(2, '2º ESO', 'E2', '2021-11-11 18:55:39', 1, 1, '2021-11-11 17:55:37', '2021-12-11 13:38:42', NULL),
(3, '1º ESO', 'E1', '2021-12-11 12:02:22', 1, 1, '2021-12-11 10:56:18', '2021-12-11 13:38:46', NULL),
(10, '3º ESO', 'E3', '2021-12-11 12:46:44', 1, 1, '2021-12-11 11:46:42', '2021-12-11 13:38:37', NULL),
(13, '4º ESO', 'E4', '2021-12-11 14:13:52', 1, 1, '2021-12-11 13:13:50', '2021-12-11 13:38:33', NULL),
(14, '2º Bachillerato', 'BH2', '2021-12-11 14:42:55', 1, 1, '2021-12-11 13:42:37', '2021-12-11 13:44:01', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos_optativas__optativas_cursos`
--

CREATE TABLE `cursos_optativas__optativas_cursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `optativa_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cursos_optativas__optativas_cursos`
--

INSERT INTO `cursos_optativas__optativas_cursos` (`id`, `optativa_id`, `curso_id`) VALUES
(1, 1, 3),
(2, 3, 3),
(3, 2, 3),
(4, 5, 3),
(5, 4, 3),
(6, 6, 3),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 10, 3),
(11, 11, 3),
(12, 12, 3),
(28, 15, 2),
(30, 16, 2),
(32, 17, 2),
(34, 18, 2),
(36, 19, 2),
(38, 20, 2),
(40, 21, 2),
(41, 22, 2),
(42, 23, 2),
(46, 26, 2),
(54, 27, 2),
(58, 28, 2),
(62, 29, 2),
(66, 31, 10),
(67, 32, 10),
(68, 33, 10),
(69, 34, 10),
(70, 30, 10),
(71, 36, 10),
(72, 37, 10),
(73, 38, 10),
(74, 39, 10),
(75, 40, 10),
(76, 41, 10),
(77, 42, 10),
(78, 43, 10),
(79, 44, 10),
(80, 45, 13),
(81, 46, 13),
(82, 47, 13),
(83, 48, 13),
(84, 50, 13),
(85, 51, 13),
(86, 52, 13),
(87, 53, 13),
(88, 54, 13),
(89, 55, 13),
(90, 56, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos_troncales__troncales_cursos`
--

CREATE TABLE `cursos_troncales__troncales_cursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `troncale_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cursos_troncales__troncales_cursos`
--

INSERT INTO `cursos_troncales__troncales_cursos` (`id`, `troncale_id`, `curso_id`) VALUES
(1, 1, 3),
(2, 2, 3),
(4, 4, 3),
(5, 5, 3),
(6, 6, 3),
(7, 7, 3),
(31, 11, 2),
(35, 12, 2),
(39, 13, 2),
(43, 14, 2),
(47, 15, 2),
(51, 16, 2),
(55, 17, 2),
(59, 19, 2),
(63, 21, 10),
(66, 22, 10),
(69, 23, 10),
(72, 24, 10),
(75, 25, 10),
(78, 26, 10),
(81, 27, 10),
(88, 31, 10),
(89, 10, 3),
(90, 32, 10),
(91, 34, 10),
(92, 35, 10),
(93, 36, 13),
(94, 37, 13),
(95, 38, 13),
(96, 39, 13),
(97, 40, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i18n_locales`
--

CREATE TABLE `i18n_locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `i18n_locales`
--

INSERT INTO `i18n_locales` (`id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'English (en)', 'en', NULL, NULL, '2021-09-30 06:42:00', '2021-09-30 06:42:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha` date DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `usuario` int(11) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id`, `fecha`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `usuario`, `curso`, `user`) VALUES
(1, '2021-11-03', '2021-11-10 18:57:43', 1, 1, '2021-11-10 17:57:37', '2021-12-11 13:43:57', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidades`
--

CREATE TABLE `modalidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `curso` int(11) DEFAULT NULL,
  `modalidad_cod` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modalidades`
--

INSERT INTO `modalidades` (`id`, `nombre`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `curso`, `modalidad_cod`) VALUES
(2, '3 ESO Bilingüe', '2021-12-11 13:11:15', 1, 1, '2021-12-11 12:11:12', '2021-12-11 13:38:37', 10, NULL),
(3, '1 ESO Bilingüe', '2021-12-11 13:23:19', 1, 1, '2021-12-11 12:23:17', '2021-12-11 13:38:46', 3, NULL),
(4, '1 ESO Plurilingüe Alemán', '2021-12-11 13:23:37', 1, 1, '2021-12-11 12:23:36', '2021-12-11 13:38:46', 3, NULL),
(5, '1 ESO Plurilingüe Francés', '2021-12-11 13:23:48', 1, 1, '2021-12-11 12:23:47', '2021-12-11 13:38:46', 3, NULL),
(6, '2 ESO Bilingüe', '2021-12-11 13:34:21', 1, 1, '2021-12-11 12:34:20', '2021-12-11 13:38:42', 2, NULL),
(7, '2 ESO Plurilingüe Francés', '2021-12-11 13:34:29', 1, 1, '2021-12-11 12:34:28', '2021-12-11 13:38:42', 2, NULL),
(8, '2 ESO Plurilingüe Alemán', '2021-12-11 13:34:40', 1, 1, '2021-12-11 12:34:39', '2021-12-11 13:38:42', 2, NULL),
(9, '3 ESO Plurilingüe Francés', '2021-12-11 13:43:12', 1, 1, '2021-12-11 12:43:11', '2021-12-11 13:38:37', 10, NULL),
(10, '4 ESO Bilingüe', '2021-12-11 14:14:43', 1, 1, '2021-12-11 13:14:42', '2021-12-11 13:38:33', 13, NULL),
(11, '4 ESO Plurilingüe Francés', '2021-12-11 14:15:01', 1, 1, '2021-12-11 13:15:00', '2021-12-11 13:38:33', 13, NULL),
(12, '4 ESO Formación Profesional', '2021-12-11 14:15:24', 1, 1, '2021-12-11 13:15:23', '2021-12-11 13:38:33', 13, NULL),
(13, '1º Bachillerato Humanidades y Ciencias Sociales', '2021-12-11 14:57:42', 1, 1, '2021-12-11 13:57:41', '2021-12-11 13:57:42', 1, NULL),
(14, '1º Bachillerato Humanidades y Ciencias Sociales Bilingüe', '2021-12-11 14:58:00', 1, 1, '2021-12-11 13:57:59', '2021-12-11 13:58:00', 1, NULL),
(15, '1º Bachillerato Ciencias y Tecnología', '2021-12-11 14:58:15', 1, 1, '2021-12-11 13:58:14', '2021-12-11 13:58:15', 1, NULL),
(16, '1º Bachillerato Ciencias y Tecnología Bilingüe', '2021-12-11 14:58:26', 1, 1, '2021-12-11 13:58:25', '2021-12-11 13:58:26', 1, NULL),
(17, '1º Bachillerato ARTE', '2021-12-11 14:58:46', 1, 1, '2021-12-11 13:58:44', '2021-12-11 13:58:48', 1, NULL),
(18, '2º Bachillerato Humanidades y Ciencias Sociales', '2021-12-12 00:10:41', 1, 1, '2021-12-11 23:10:39', '2021-12-11 23:10:41', 14, NULL),
(19, '2º Bachillerato Humanidades y Ciencias Sociales Bilingüe', '2021-12-12 00:11:03', 1, 1, '2021-12-11 23:11:01', '2021-12-11 23:11:03', 14, NULL),
(20, '2º Bachillerato Ciencias y Tecnología', '2021-12-12 00:11:17', 1, 1, '2021-12-11 23:11:15', '2021-12-11 23:11:17', 14, NULL),
(21, '2º Bachillerato Ciencias y Tecnología Bilingüe', '2021-12-12 00:11:36', 1, 1, '2021-12-11 23:11:34', '2021-12-11 23:11:36', 14, NULL),
(22, '2º Bachillerato ARTE', '2021-12-12 00:12:14', 1, 1, '2021-12-11 23:12:11', '2021-12-11 23:12:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidades_optativas__optativas_modalidades`
--

CREATE TABLE `modalidades_optativas__optativas_modalidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `modalidade_id` int(11) DEFAULT NULL,
  `optativa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modalidades_optativas__optativas_modalidades`
--

INSERT INTO `modalidades_optativas__optativas_modalidades` (`id`, `modalidade_id`, `optativa_id`) VALUES
(1, 2, 30),
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 9),
(8, 4, 9),
(9, 5, 9),
(10, 3, 11),
(11, 4, 11),
(12, 5, 11),
(13, 3, 12),
(14, 4, 12),
(15, 5, 12),
(16, 3, 10),
(17, 4, 10),
(18, 5, 10),
(19, 4, 14),
(20, 5, 13),
(21, 6, 15),
(22, 6, 16),
(23, 6, 17),
(24, 6, 18),
(25, 6, 19),
(26, 6, 20),
(27, 6, 23),
(28, 6, 26),
(29, 7, 26),
(30, 8, 26),
(31, 6, 27),
(32, 7, 27),
(33, 8, 27),
(34, 6, 28),
(35, 7, 28),
(36, 8, 28),
(37, 7, 24),
(38, 8, 25),
(39, 2, 31),
(40, 9, 31),
(41, 2, 32),
(42, 9, 32),
(43, 2, 33),
(44, 9, 33),
(45, 2, 34),
(46, 9, 34),
(47, 9, 35),
(48, 2, 36),
(49, 2, 37),
(50, 2, 38),
(51, 2, 39),
(52, 2, 40),
(53, 2, 41),
(54, 2, 42),
(55, 2, 44),
(56, 10, 45),
(57, 11, 45),
(58, 12, 45),
(59, 10, 46),
(60, 11, 46),
(61, 12, 46),
(62, 10, 47),
(63, 11, 47),
(64, 12, 47),
(65, 10, 48),
(66, 11, 48),
(67, 12, 48),
(68, 11, 49),
(69, 10, 50),
(70, 12, 50),
(71, 10, 51),
(72, 12, 51),
(73, 10, 52),
(74, 12, 52),
(75, 10, 53),
(76, 12, 53),
(77, 10, 54),
(78, 12, 54),
(79, 10, 55),
(80, 12, 55),
(81, 12, 56),
(82, 13, 57),
(83, 14, 57),
(84, 13, 58),
(85, 14, 58),
(86, 15, 60),
(87, 16, 60),
(88, 15, 59),
(89, 16, 59),
(90, 17, 61),
(91, 17, 62),
(92, 13, 63),
(93, 14, 63),
(94, 15, 63),
(95, 16, 63),
(96, 13, 64),
(97, 14, 64),
(98, 15, 64),
(99, 16, 64),
(100, 13, 65),
(101, 14, 65),
(102, 15, 65),
(103, 16, 65),
(104, 13, 66),
(105, 14, 66),
(106, 15, 66),
(107, 16, 66),
(108, 13, 67),
(109, 15, 67),
(110, 15, 68),
(111, 16, 68),
(112, 15, 69),
(113, 16, 69),
(114, 13, 69),
(115, 14, 69),
(116, 15, 70),
(117, 16, 70),
(118, 14, 71),
(119, 16, 71),
(120, 20, 72),
(121, 20, 73),
(123, 20, 75),
(124, 20, 74),
(125, 21, 76),
(126, 21, 77),
(127, 20, 77),
(128, 21, 78),
(129, 20, 78),
(130, 21, 79),
(131, 20, 79),
(132, 21, 80),
(133, 20, 80),
(134, 21, 81),
(135, 20, 81),
(136, 21, 82),
(137, 20, 82),
(138, 21, 83),
(139, 20, 83),
(140, 21, 84),
(141, 20, 84);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidades_troncales__troncales_modalidades`
--

CREATE TABLE `modalidades_troncales__troncales_modalidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `modalidade_id` int(11) DEFAULT NULL,
  `troncale_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modalidades_troncales__troncales_modalidades`
--

INSERT INTO `modalidades_troncales__troncales_modalidades` (`id`, `modalidade_id`, `troncale_id`) VALUES
(1, 3, 8),
(2, 4, 8),
(3, 5, 8),
(4, 3, 9),
(5, 4, 9),
(6, 5, 9),
(7, 3, 2),
(8, 4, 2),
(9, 5, 2),
(13, 3, 10),
(14, 4, 10),
(15, 5, 10),
(16, 3, 4),
(17, 4, 4),
(18, 5, 4),
(19, 3, 5),
(20, 4, 5),
(21, 5, 5),
(22, 3, 6),
(23, 4, 6),
(24, 5, 6),
(25, 6, 11),
(26, 7, 11),
(27, 8, 11),
(28, 6, 14),
(29, 7, 14),
(30, 8, 14),
(31, 6, 12),
(32, 7, 12),
(33, 8, 12),
(34, 6, 13),
(35, 7, 13),
(36, 8, 13),
(37, 6, 15),
(38, 7, 15),
(39, 8, 15),
(40, 6, 16),
(41, 7, 16),
(42, 8, 16),
(43, 6, 18),
(44, 7, 18),
(45, 8, 18),
(46, 6, 20),
(47, 7, 20),
(48, 8, 20),
(49, 2, 21),
(50, 9, 21),
(51, 2, 24),
(52, 9, 24),
(53, 2, 32),
(54, 9, 32),
(55, 2, 23),
(56, 9, 23),
(57, 2, 25),
(58, 9, 25),
(59, 2, 33),
(60, 9, 33),
(61, 2, 29),
(62, 9, 29),
(63, 2, 30),
(64, 9, 30),
(65, 2, 34),
(66, 9, 34),
(67, 10, 36),
(68, 11, 36),
(69, 12, 36),
(70, 10, 37),
(71, 11, 37),
(72, 12, 37),
(73, 10, 38),
(74, 11, 38),
(75, 12, 38),
(76, 12, 39),
(77, 12, 40),
(78, 10, 41),
(79, 11, 41),
(80, 10, 42),
(81, 11, 42),
(82, 12, 43),
(83, 12, 44),
(84, 13, 46),
(85, 14, 46),
(86, 15, 46),
(87, 16, 46),
(88, 17, 46),
(89, 13, 47),
(90, 14, 47),
(91, 15, 47),
(92, 16, 47),
(93, 17, 47),
(94, 13, 48),
(95, 14, 48),
(96, 15, 48),
(97, 16, 48),
(98, 17, 48),
(99, 15, 49),
(100, 16, 49),
(101, 13, 50),
(102, 14, 50),
(103, 15, 50),
(104, 16, 50),
(105, 17, 50),
(106, 13, 51),
(107, 14, 51),
(108, 15, 52),
(109, 16, 52),
(110, 22, 55),
(111, 20, 55),
(112, 21, 55),
(113, 19, 55),
(114, 18, 55),
(115, 22, 56),
(116, 21, 56),
(117, 20, 56),
(118, 19, 56),
(119, 18, 56),
(120, 22, 57),
(121, 21, 57),
(122, 20, 57),
(123, 19, 57),
(124, 18, 57),
(125, 21, 58),
(126, 20, 58),
(127, 22, 59),
(128, 22, 60),
(129, 22, 61),
(130, 22, 62),
(131, 21, 63),
(132, 20, 63),
(133, 21, 64),
(134, 20, 64),
(135, 21, 65),
(136, 20, 65),
(137, 21, 66),
(138, 20, 66),
(139, 21, 67),
(140, 20, 67),
(141, 22, 68),
(142, 22, 69),
(143, 22, 70),
(144, 19, 71),
(145, 18, 71),
(146, 19, 72),
(147, 18, 72);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `optativas`
--

CREATE TABLE `optativas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `optativa_cod` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `curso` int(11) DEFAULT NULL,
  `Horas` varchar(255) DEFAULT NULL,
  `Religion` tinyint(1) DEFAULT NULL,
  `LenguaExtranjera` tinyint(1) DEFAULT NULL,
  `TroncalDeOpcion` tinyint(1) DEFAULT NULL,
  `OptativaBiling` tinyint(1) DEFAULT NULL,
  `OpcionBilingue` tinyint(1) DEFAULT NULL,
  `Nota` longtext DEFAULT NULL,
  `TroncalNoCursada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `optativas`
--

INSERT INTO `optativas` (`id`, `nombre`, `optativa_cod`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `curso`, `Horas`, `Religion`, `LenguaExtranjera`, `TroncalDeOpcion`, `OptativaBiling`, `OpcionBilingue`, `Nota`, `TroncalNoCursada`) VALUES
(1, 'Tenologia de la informatica y la comunicacion', 'TIC', '2021-11-10 18:57:10', 1, 1, '2021-11-10 17:57:08', '2021-11-10 17:57:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Creación y Expresión Musical', 'CEM1E', '2021-12-11 12:02:51', 1, 1, '2021-12-11 10:39:23', '2021-12-11 12:26:57', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Iniciación a la Investigación', 'INI1E', '2021-12-11 12:05:36', 1, 1, '2021-12-11 10:39:42', '2021-12-11 12:27:07', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Teatro I: Teatro de creación', 'TEA1E', '2021-12-11 12:05:58', 1, 1, '2021-12-11 10:40:09', '2021-12-11 12:48:26', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Oratoria y debate', 'ORA1E', '2021-12-11 12:06:16', 1, 1, '2021-12-11 10:40:26', '2021-12-11 12:27:25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Refuerzo de la competencia en comunicación lingüística', 'REFLIN1E', '2021-12-11 12:06:24', 1, 1, '2021-12-11 10:40:51', '2021-12-11 12:27:33', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Francés', 'FRA1E', '2021-12-11 12:05:24', 1, 1, '2021-12-11 10:41:02', '2021-12-11 11:12:27', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Alemán', 'ALE1E', '2021-12-11 12:02:39', 1, 1, '2021-12-11 10:41:13', '2021-12-11 11:12:27', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Religión Católica', 'RELCAT1E', '2021-12-11 12:07:19', 1, 1, '2021-12-11 10:44:38', '2021-12-11 12:28:06', 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Valores Éticos', 'VALET1E', '2021-12-11 12:07:41', 1, 1, '2021-12-11 10:45:05', '2021-12-11 12:28:34', 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Religión Evangélica', 'RELEV1E', '2021-12-11 12:07:33', 1, 1, '2021-12-11 10:45:21', '2021-12-11 12:28:15', 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Religión Islámica', 'RELISL1E', '2021-12-11 12:13:41', 1, 1, '2021-12-11 10:45:41', '2021-12-11 12:28:26', 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Francés (SELE Plurilingüe)', 'FRASELE1E', '2021-12-11 12:16:46', 1, 1, '2021-12-11 10:54:49', '2021-12-11 12:28:56', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(14, 'Alemán (SELE Plurilingüe)', 'ALESELE1E', '2021-12-11 12:16:36', 1, 1, '2021-12-11 10:55:25', '2021-12-11 12:28:50', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(15, 'Robótica', 'ROB2E', '2021-12-11 12:33:05', 1, 1, '2021-12-11 11:32:58', '2021-12-11 12:35:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Iniciación a la Investigación', 'INI2E', '2021-12-11 12:33:25', 1, 1, '2021-12-11 11:33:24', '2021-12-11 12:35:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Teatro II: Teatro Clásico de los Siglos de Oro', 'TEA2E', '2021-12-11 12:34:15', 1, 1, '2021-12-11 11:34:14', '2021-12-11 12:48:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Literatura y cine', 'LICI2E', '2021-12-11 12:34:59', 1, 1, '2021-12-11 11:34:57', '2021-12-11 12:36:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Mitología Clásica', 'MITCL2E', '2021-12-11 12:35:32', 1, 1, '2021-12-11 11:35:30', '2021-12-11 12:36:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Arte y Creatividad', 'ART2E', '2021-12-11 12:36:00', 1, 1, '2021-12-11 11:35:58', '2021-12-11 12:36:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Francés', 'FRA2E', '2021-12-11 12:36:14', 1, 1, '2021-12-11 11:36:13', '2021-12-11 11:36:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Alemán', 'ALE2E', '2021-12-11 12:36:35', 1, 1, '2021-12-11 11:36:33', '2021-12-11 11:36:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Refuerzo de la competencia en comunicación lingüística', 'REFLIN2E', '2021-12-11 12:37:01', 1, 1, '2021-12-11 11:37:00', '2021-12-11 12:36:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Francés (SELE Plurilingüe)', 'FRASELE2E', '2021-12-11 12:42:19', 1, 1, '2021-12-11 11:38:14', '2021-12-11 12:37:31', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(25, 'Alemán (SELE Plurilingüe)', 'ALESELE2E', '2021-12-11 12:38:48', 1, 1, '2021-12-11 11:38:46', '2021-12-11 12:37:44', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(26, 'Religión Católica', 'RELCAT2E', '2021-12-11 12:39:41', 1, 1, '2021-12-11 11:39:37', '2021-12-11 12:36:43', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Valores Éticos', 'VALET2E', '2021-12-11 12:41:23', 1, 1, '2021-12-11 11:41:22', '2021-12-11 12:36:53', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Religión Evangélica', 'RELEV2E', '2021-12-11 12:41:39', 1, 1, '2021-12-11 11:41:36', '2021-12-11 12:37:03', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Religión Islámica', 'RELISL2E', '2021-12-11 12:42:02', 1, 1, '2021-12-11 11:41:55', '2021-12-11 12:37:12', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Cultura Clásica', 'CULCL3E', '2021-12-11 13:11:52', 1, 1, '2021-12-11 12:11:48', '2021-12-11 12:45:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Religión Católica', 'RELCAT3E', '2021-12-11 14:17:55', 1, 1, '2021-12-11 12:44:07', '2021-12-11 13:17:55', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Valores Éticos', 'VALET3E', '2021-12-11 13:44:30', 1, 1, '2021-12-11 12:44:29', '2021-12-11 12:44:30', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'Religión Evangélica', 'RELEV3E', '2021-12-11 13:44:45', 1, 1, '2021-12-11 12:44:44', '2021-12-11 12:44:45', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Religión Islámica', 'RELISL3E', '2021-12-11 13:45:12', 1, 1, '2021-12-11 12:45:11', '2021-12-11 12:45:12', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Francés (SELE Plurilingüe)', 'FRASELE3E', '2021-12-11 13:45:32', 1, 1, '2021-12-11 12:45:31', '2021-12-11 12:45:32', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(36, 'Comunicación Audiovisual', 'COAU3E', '2021-12-11 13:46:42', 1, 1, '2021-12-11 12:46:41', '2021-12-11 12:46:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Iniciación a la Actividad Emprendedora y Empresarial', 'IEE3E', '2021-12-11 13:47:19', 1, 1, '2021-12-11 12:47:15', '2021-12-11 12:47:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Iniciación a la Investigación', 'INI3E', '2021-12-11 13:47:45', 1, 1, '2021-12-11 12:47:44', '2021-12-11 12:47:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Teatro III: Teatro Clásico Antiguo', 'TEA3E', '2021-12-11 13:48:16', 1, 1, '2021-12-11 12:48:15', '2021-12-11 12:48:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Física y Química de las Nanopartículas y los cristales', 'FYQNC3E', '2021-12-11 13:49:08', 1, 1, '2021-12-11 12:49:06', '2021-12-11 12:49:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Educación Física y Calidad de Vida', 'EDFCV3E', '2021-12-11 13:49:38', 1, 1, '2021-12-11 12:49:36', '2021-12-11 12:49:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Cerámica', 'CER3E', '2021-12-11 13:50:02', 1, 1, '2021-12-11 12:50:01', '2021-12-11 12:50:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Francés', 'FRA3E', '2021-12-11 14:08:19', 1, 1, '2021-12-11 13:08:18', '2021-12-11 13:08:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Refuerzo de la competencia en comunicación lingüística', 'REFLIN3E', '2021-12-11 14:08:34', 1, 1, '2021-12-11 13:08:33', '2021-12-11 13:08:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Religión Católica', 'RELCAT4E', '2021-12-11 14:18:42', 1, 1, '2021-12-11 13:18:41', '2021-12-11 13:18:42', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Valores Éticos', 'VALET4E', '2021-12-11 14:19:00', 1, 1, '2021-12-11 13:18:58', '2021-12-11 13:19:00', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Religión Evangélica', 'RELEV4E', '2021-12-11 14:19:16', 1, 1, '2021-12-11 13:19:15', '2021-12-11 13:19:16', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Religión Islámica', 'RELISL4E', '2021-12-11 14:19:36', 1, 1, '2021-12-11 13:19:35', '2021-12-11 13:19:36', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'Francés (SELE Plurilingüe)', 'FRASELE4E', '2021-12-11 14:20:07', 1, 1, '2021-12-11 13:20:06', '2021-12-11 13:20:07', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(50, 'Cultura Científica', 'CULCIE4E', '2021-12-11 14:21:00', 1, 1, '2021-12-11 13:20:58', '2021-12-11 13:21:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'Cultura Clásica', 'CULCL4E', '2021-12-11 14:21:19', 1, 1, '2021-12-11 13:21:18', '2021-12-11 13:21:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'Educación Plástica, Visual y Audiovisual', 'EPVA4E', '2021-12-11 14:22:29', 1, 1, '2021-12-11 13:22:28', '2021-12-11 13:22:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'Música', 'MUS4E', '2021-12-11 14:22:50', 1, 1, '2021-12-11 13:22:49', '2021-12-11 13:22:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Filosofía', 'FIL4E', '2021-12-11 14:23:17', 1, 1, '2021-12-11 13:23:16', '2021-12-11 13:23:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'TIC', 'TIC4E', '2021-12-11 14:23:32', 1, 1, '2021-12-11 13:23:31', '2021-12-11 13:23:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'Francés', 'FRA4E', '2021-12-11 14:23:52', 1, 1, '2021-12-11 13:23:51', '2021-12-11 13:23:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'HUMANIDADES', 'HUM', '2021-12-11 23:54:53', 1, 1, '2021-12-11 22:54:51', '2021-12-11 22:54:53', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(58, 'CIENCIAS SOCIALES', 'CCSS1BH', '2021-12-11 23:55:20', 1, 1, '2021-12-11 22:55:19', '2021-12-11 22:55:20', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(59, 'SALUD', 'SLD1BH', '2021-12-11 23:55:38', 1, 1, '2021-12-11 22:55:36', '2021-12-11 22:56:17', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(60, 'INGENIERÍAS Y TECNOLOGÍAS', 'INTEC1BH', '2021-12-11 23:56:05', 1, 1, '2021-12-11 22:56:05', '2021-12-11 22:56:05', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(61, 'Historia del Mundo Contemporáneo', 'HMC1BH', '2021-12-11 23:57:07', 1, 1, '2021-12-11 22:57:06', '2021-12-11 22:57:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Literatura Universal', 'LU1BH', '2021-12-11 23:57:28', 1, 1, '2021-12-11 22:57:27', '2021-12-11 22:57:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'Segunda Lengua Extranjera Francés I', 'FRA1BH', '2021-12-11 23:59:22', 1, 1, '2021-12-11 22:59:21', '2021-12-11 22:59:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'Cultura Audiovisual I', 'CULAU1BH', '2021-12-11 23:59:59', 1, 1, '2021-12-11 22:59:57', '2021-12-11 22:59:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'Religión', 'REL1BH', '2021-12-12 00:01:05', 1, 1, '2021-12-11 23:01:04', '2021-12-11 23:01:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Cultura Científica', 'CULCIE1BH', '2021-12-12 00:01:35', 1, 1, '2021-12-11 23:01:34', '2021-12-11 23:01:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'TIC I', 'TIC1BH', '2021-12-12 00:02:18', 1, 1, '2021-12-11 23:02:16', '2021-12-11 23:02:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Dibujo Técnico I', 'DIBTEC1BH', '2021-12-12 00:06:03', 1, 1, '2021-12-11 23:06:01', '2021-12-11 23:06:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Lenguaje y Práctica Musical', 'LENGMUS1BH', '2021-12-12 00:06:45', 1, 1, '2021-12-11 23:06:44', '2021-12-11 23:06:45', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'Tecnología Industrial I', 'TECIND1BH', '2021-12-12 00:07:17', 1, 1, '2021-12-11 23:07:16', '2021-12-11 23:07:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'TIC I (English)', 'TICING1BH', '2021-12-12 00:08:03', 1, 1, '2021-12-11 23:08:02', '2021-12-11 23:08:03', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(72, 'Imagen y Sonido', 'IMSO2BH', '2021-12-12 00:41:25', 1, 1, '2021-12-11 23:41:24', '2021-12-11 23:41:25', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'Psicología', 'PSI2BH', '2021-12-12 00:41:57', 1, 1, '2021-12-11 23:41:56', '2021-12-11 23:41:57', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'TIC II', 'TIC2BH', '2021-12-12 12:14:41', 1, 1, '2021-12-12 11:13:39', '2021-12-12 11:19:49', NULL, '2', NULL, NULL, NULL, NULL, NULL, '(si se ha cursado en 1º)', NULL),
(75, 'Historia de la Filosofía', 'HIFIL2BH', '2021-12-12 12:14:24', 1, 1, '2021-12-12 11:14:22', '2021-12-12 11:14:24', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'TIC II', 'TICING2BH', '2021-12-12 12:15:09', 1, 1, '2021-12-12 11:15:07', '2021-12-12 11:19:44', NULL, '2', NULL, NULL, NULL, NULL, NULL, '(English)', NULL),
(77, 'Ciencias de la Tierra y del Medio Ambiente', 'CTMA2BH', '2021-12-12 12:20:31', 1, 1, '2021-12-12 11:20:30', '2021-12-12 11:20:31', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'Cultura Audiovisual II', 'CULAU2BH', '2021-12-12 12:21:09', 1, 1, '2021-12-12 11:21:08', '2021-12-12 11:21:09', NULL, '4', NULL, NULL, NULL, NULL, NULL, '(si se ha cursado en 1º)', NULL),
(79, 'Fundamentos de Administración y Gestión', 'FUNAG2BH', '2021-12-12 12:21:29', 1, 1, '2021-12-12 11:21:28', '2021-12-12 11:21:29', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'Historia de la Música y la Danza', 'HISMD2BH', '2021-12-12 12:22:07', 1, 1, '2021-12-12 11:22:06', '2021-12-12 11:22:07', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'Segunda Lengua Extranjera Francés II', 'FRA2BH', '2021-12-12 12:23:17', 1, 1, '2021-12-12 11:23:16', '2021-12-12 11:23:17', NULL, '4', NULL, NULL, NULL, NULL, NULL, '(si se ha cursado en 1º)', NULL),
(82, 'Tecnología Industrial II', 'TECIND2BH', '2021-12-12 12:23:43', 1, 1, '2021-12-12 11:23:42', '2021-12-12 11:23:43', NULL, '4', NULL, NULL, NULL, NULL, NULL, '(si se ha cursado en 1º)', NULL),
(83, 'Dibujo Técnico II', 'DIBTEC2BH', '2021-12-12 12:27:16', 1, 1, '2021-12-12 11:27:14', '2021-12-12 11:27:16', NULL, '4', NULL, NULL, NULL, NULL, NULL, '(si se ha cursado en 1º)', 1),
(84, 'Química', 'QUI2BH', '2021-12-12 12:27:32', 1, 1, '2021-12-12 11:27:31', '2021-12-12 11:27:32', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `strapi_administrator`
--

CREATE TABLE `strapi_administrator` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `preferedLanguage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `strapi_administrator`
--

INSERT INTO `strapi_administrator` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `resetPasswordToken`, `registrationToken`, `isActive`, `blocked`, `preferedLanguage`) VALUES
(1, 'javier ', 'Garcia ', NULL, 'javiggv99@gmail.com', '$2a$10$e2tzTaslfSIrtk2dFF6LdusDGwzikxOlvYqnheZlDs2n8wjLsEone', 'e409986cf4900ce8ada8cffb7f24618a1a4c78fc', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `strapi_permission`
--

CREATE TABLE `strapi_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext DEFAULT NULL,
  `conditions` longtext DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `strapi_permission`
--

INSERT INTO `strapi_permission` (`id`, `action`, `subject`, `properties`, `conditions`, `role`, `created_at`, `updated_at`) VALUES
(1, 'plugins::upload.read', NULL, '{}', '[]', 2, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(2, 'plugins::upload.assets.create', NULL, '{}', '[]', 2, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(3, 'plugins::upload.assets.update', NULL, '{}', '[]', 2, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(4, 'plugins::upload.assets.download', NULL, '{}', '[]', 2, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(5, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 2, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(6, 'plugins::upload.read', NULL, '{}', '[\"admin::is-creator\"]', 3, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(7, 'plugins::upload.assets.create', NULL, '{}', '[]', 3, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(8, 'plugins::upload.assets.update', NULL, '{}', '[\"admin::is-creator\"]', 3, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(9, 'plugins::upload.assets.download', NULL, '{}', '[]', 3, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(10, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 3, '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(15, 'plugins::content-type-builder.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:02', '2021-09-30 06:42:03'),
(16, 'plugins::email.settings.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:02', '2021-09-30 06:42:03'),
(17, 'plugins::upload.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:02', '2021-09-30 06:42:03'),
(18, 'plugins::upload.assets.create', NULL, '{}', '[]', 1, '2021-09-30 06:42:02', '2021-09-30 06:42:03'),
(19, 'plugins::upload.assets.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:02', '2021-09-30 06:42:03'),
(20, 'plugins::upload.assets.download', NULL, '{}', '[]', 1, '2021-09-30 06:42:02', '2021-09-30 06:42:03'),
(21, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(22, 'plugins::upload.settings.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(23, 'plugins::content-manager.single-types.configure-view', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(24, 'plugins::content-manager.collection-types.configure-view', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(25, 'plugins::content-manager.components.configure-layout', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(26, 'plugins::i18n.locale.create', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(27, 'plugins::i18n.locale.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(28, 'plugins::i18n.locale.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(29, 'plugins::i18n.locale.delete', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(30, 'plugins::users-permissions.roles.create', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(31, 'plugins::users-permissions.roles.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(32, 'plugins::users-permissions.roles.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(33, 'plugins::users-permissions.providers.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(34, 'plugins::users-permissions.providers.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(35, 'plugins::users-permissions.email-templates.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(36, 'plugins::users-permissions.email-templates.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(37, 'plugins::users-permissions.advanced-settings.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(38, 'plugins::users-permissions.advanced-settings.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(39, 'plugins::users-permissions.roles.delete', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(40, 'admin::marketplace.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(41, 'admin::marketplace.plugins.install', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(42, 'admin::webhooks.create', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(43, 'admin::webhooks.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(44, 'admin::users.create', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(45, 'admin::marketplace.plugins.uninstall', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(46, 'admin::webhooks.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(47, 'admin::webhooks.delete', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(48, 'admin::users.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(49, 'admin::users.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(50, 'admin::users.delete', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(51, 'admin::roles.create', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(52, 'admin::roles.read', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(53, 'admin::roles.update', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(54, 'admin::roles.delete', NULL, '{}', '[]', 1, '2021-09-30 06:42:03', '2021-09-30 06:42:03'),
(56, 'plugins::documentation.read', NULL, '{}', '[]', 1, '2021-09-30 06:46:47', '2021-09-30 06:46:47'),
(57, 'plugins::documentation.settings.update', NULL, '{}', '[]', 1, '2021-09-30 06:46:47', '2021-09-30 06:46:47'),
(58, 'plugins::documentation.settings.regenerate', NULL, '{}', '[]', 1, '2021-09-30 06:46:47', '2021-09-30 06:46:47'),
(201, 'plugins::content-manager.explorer.create', 'application::condiciones.condiciones', '{\"fields\":[\"nombre\",\"validar\",\"cursos\"]}', '[]', 1, '2021-09-30 07:33:55', '2021-09-30 07:33:55'),
(202, 'plugins::content-manager.explorer.create', 'application::cursos.cursos', '{\"fields\":[\"nombre\",\"curso_cod\",\"matricula\",\"troncales\",\"modalidades\",\"optativas\",\"condiciones\"]}', '[]', 1, '2021-09-30 07:33:55', '2021-09-30 07:33:55'),
(206, 'plugins::content-manager.explorer.read', 'application::condiciones.condiciones', '{\"fields\":[\"nombre\",\"validar\",\"cursos\"]}', '[]', 1, '2021-09-30 07:33:55', '2021-09-30 07:33:55'),
(207, 'plugins::content-manager.explorer.read', 'application::cursos.cursos', '{\"fields\":[\"nombre\",\"curso_cod\",\"matricula\",\"troncales\",\"modalidades\",\"optativas\",\"condiciones\"]}', '[]', 1, '2021-09-30 07:33:55', '2021-09-30 07:33:55'),
(211, 'plugins::content-manager.explorer.update', 'application::condiciones.condiciones', '{\"fields\":[\"nombre\",\"validar\",\"cursos\"]}', '[]', 1, '2021-09-30 07:33:55', '2021-09-30 07:33:55'),
(220, 'plugins::content-manager.explorer.update', 'application::cursos.cursos', '{\"fields\":[\"nombre\",\"curso_cod\",\"matricula\",\"troncales\",\"modalidades\",\"optativas\",\"condiciones\"]}', '[]', 1, '2021-09-30 07:33:55', '2021-09-30 07:33:55'),
(361, 'plugins::content-manager.explorer.create', 'application::usuarios.usuarios', '{\"fields\":[]}', '[]', 1, '2021-11-15 17:48:20', '2021-11-15 17:48:20'),
(363, 'plugins::content-manager.explorer.read', 'application::usuarios.usuarios', '{\"fields\":[]}', '[]', 1, '2021-11-15 17:48:20', '2021-11-15 17:48:20'),
(365, 'plugins::content-manager.explorer.update', 'application::usuarios.usuarios', '{\"fields\":[]}', '[]', 1, '2021-11-15 17:48:20', '2021-11-15 17:48:20'),
(381, 'plugins::content-manager.explorer.create', 'application::matriculas.matriculas', '{\"fields\":[\"fecha\",\"curso\",\"user\"]}', '[]', 1, '2021-11-15 17:49:18', '2021-11-15 17:49:18'),
(383, 'plugins::content-manager.explorer.read', 'application::matriculas.matriculas', '{\"fields\":[\"fecha\",\"curso\",\"user\"]}', '[]', 1, '2021-11-15 17:49:18', '2021-11-15 17:49:18'),
(385, 'plugins::content-manager.explorer.update', 'application::matriculas.matriculas', '{\"fields\":[\"fecha\",\"curso\",\"user\"]}', '[]', 1, '2021-11-15 17:49:18', '2021-11-15 17:49:18'),
(741, 'plugins::content-manager.explorer.create', 'application::modalidades.modalidades', '{\"fields\":[\"nombre\",\"curso\",\"optativas\",\"troncales\"]}', '[]', 1, '2021-12-11 12:30:55', '2021-12-11 12:30:55'),
(743, 'plugins::content-manager.explorer.read', 'application::modalidades.modalidades', '{\"fields\":[\"nombre\",\"curso\",\"optativas\",\"troncales\"]}', '[]', 1, '2021-12-11 12:30:55', '2021-12-11 12:30:55'),
(745, 'plugins::content-manager.explorer.update', 'application::modalidades.modalidades', '{\"fields\":[\"nombre\",\"curso\",\"optativas\",\"troncales\"]}', '[]', 1, '2021-12-11 12:30:55', '2021-12-11 12:30:55'),
(957, 'plugins::content-manager.explorer.create', 'plugins::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"matriculas\",\"tel\",\"DNI\",\"Nombre\",\"Papellido\",\"Sapellido\"]}', '[]', 1, '2021-12-11 22:45:32', '2021-12-11 22:45:32'),
(958, 'plugins::content-manager.explorer.read', 'plugins::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"matriculas\",\"tel\",\"DNI\",\"Nombre\",\"Papellido\",\"Sapellido\"]}', '[]', 1, '2021-12-11 22:45:32', '2021-12-11 22:45:32'),
(959, 'plugins::content-manager.explorer.update', 'plugins::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"matriculas\",\"tel\",\"DNI\",\"Nombre\",\"Papellido\",\"Sapellido\"]}', '[]', 1, '2021-12-11 22:45:32', '2021-12-11 22:45:32'),
(1365, 'plugins::content-manager.explorer.create', 'application::troncales.troncales', '{\"fields\":[\"nombre\",\"asignatura_cod\",\"cursos\",\"modalidades\",\"Eleccion\",\"Tipo\",\"Anotacion\"]}', '[]', 1, '2021-12-11 23:37:04', '2021-12-11 23:37:04'),
(1366, 'plugins::content-manager.explorer.read', 'application::troncales.troncales', '{\"fields\":[\"nombre\",\"asignatura_cod\",\"cursos\",\"modalidades\",\"Eleccion\",\"Tipo\",\"Anotacion\"]}', '[]', 1, '2021-12-11 23:37:04', '2021-12-11 23:37:04'),
(1367, 'plugins::content-manager.explorer.update', 'application::troncales.troncales', '{\"fields\":[\"nombre\",\"asignatura_cod\",\"cursos\",\"modalidades\",\"Eleccion\",\"Tipo\",\"Anotacion\"]}', '[]', 1, '2021-12-11 23:37:04', '2021-12-11 23:37:04'),
(1590, 'plugins::content-manager.explorer.create', 'application::optativas.optativas', '{\"fields\":[\"nombre\",\"optativa_cod\",\"cursos\",\"Horas\",\"Religion\",\"LenguaExtranjera\",\"modalidades\",\"OpcionBilingue\",\"Nota\",\"TroncalNoCursada\"]}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1591, 'plugins::content-manager.explorer.read', 'application::optativas.optativas', '{\"fields\":[\"nombre\",\"optativa_cod\",\"cursos\",\"Horas\",\"Religion\",\"LenguaExtranjera\",\"modalidades\",\"OpcionBilingue\",\"Nota\",\"TroncalNoCursada\"]}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1592, 'plugins::content-manager.explorer.update', 'application::optativas.optativas', '{\"fields\":[\"nombre\",\"optativa_cod\",\"cursos\",\"Horas\",\"Religion\",\"LenguaExtranjera\",\"modalidades\",\"OpcionBilingue\",\"Nota\",\"TroncalNoCursada\"]}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1593, 'plugins::content-manager.explorer.delete', 'application::condiciones.condiciones', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1594, 'plugins::content-manager.explorer.delete', 'application::cursos.cursos', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1595, 'plugins::content-manager.explorer.delete', 'application::matriculas.matriculas', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1596, 'plugins::content-manager.explorer.delete', 'application::modalidades.modalidades', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1597, 'plugins::content-manager.explorer.delete', 'application::optativas.optativas', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1598, 'plugins::content-manager.explorer.delete', 'application::troncales.troncales', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1599, 'plugins::content-manager.explorer.delete', 'application::usuarios.usuarios', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1600, 'plugins::content-manager.explorer.publish', 'application::condiciones.condiciones', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1601, 'plugins::content-manager.explorer.publish', 'application::cursos.cursos', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1602, 'plugins::content-manager.explorer.delete', 'plugins::users-permissions.user', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1603, 'plugins::content-manager.explorer.publish', 'application::matriculas.matriculas', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1604, 'plugins::content-manager.explorer.publish', 'application::modalidades.modalidades', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1605, 'plugins::content-manager.explorer.publish', 'application::optativas.optativas', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1606, 'plugins::content-manager.explorer.publish', 'application::troncales.troncales', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17'),
(1607, 'plugins::content-manager.explorer.publish', 'application::usuarios.usuarios', '{}', '[]', 1, '2021-12-12 11:26:17', '2021-12-12 11:26:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `strapi_role`
--

CREATE TABLE `strapi_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `strapi_role`
--

INSERT INTO `strapi_role` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2021-09-30 06:42:02', '2021-09-30 06:42:02'),
(3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2021-09-30 06:42:02', '2021-09-30 06:42:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `strapi_users_roles`
--

CREATE TABLE `strapi_users_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `strapi_users_roles`
--

INSERT INTO `strapi_users_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `strapi_webhooks`
--

CREATE TABLE `strapi_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext DEFAULT NULL,
  `events` longtext DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `troncales`
--

CREATE TABLE `troncales` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `asignatura_cod` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `curso` int(11) DEFAULT NULL,
  `Eleccion` tinyint(1) DEFAULT NULL,
  `Tipo` varchar(255) DEFAULT NULL,
  `TroncalDeEleccion` tinyint(1) DEFAULT NULL,
  `Anotacion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `troncales`
--

INSERT INTO `troncales` (`id`, `nombre`, `asignatura_cod`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `curso`, `Eleccion`, `Tipo`, `TroncalDeEleccion`, `Anotacion`) VALUES
(1, 'Matematicas', 'MAT1E', '2021-12-11 12:00:42', 1, 1, '2021-11-10 18:00:56', '2021-12-11 11:11:36', 3, NULL, NULL, NULL, NULL),
(2, 'Lengua Castellana y Literatura', 'LENG1E', '2021-12-11 12:00:38', 1, 1, '2021-12-11 10:34:02', '2021-12-11 12:38:51', 3, NULL, NULL, NULL, NULL),
(4, 'Primera Lengua Extranjera Inglés', 'ING1E', '2021-12-11 12:00:52', 1, 1, '2021-12-11 10:34:54', '2021-12-11 12:39:37', 3, NULL, NULL, NULL, NULL),
(5, 'Educación Física', 'EDF1E', '2021-12-11 12:00:19', 1, 1, '2021-12-11 10:35:10', '2021-12-11 12:39:45', 3, NULL, NULL, NULL, NULL),
(6, 'Educación Plástica, Visual y Audiovisual', 'EPVA1E', '2021-12-11 12:00:22', 1, 1, '2021-12-11 10:35:35', '2021-12-11 12:39:54', 3, NULL, NULL, NULL, NULL),
(7, 'Tecnología', 'TEC1E', '2021-12-11 12:01:12', 1, 1, '2021-12-11 10:35:46', '2021-12-11 11:11:36', 3, NULL, NULL, NULL, NULL),
(8, 'Mathematics', 'MATING1E', '2021-12-11 12:00:46', 1, 1, '2021-12-11 10:49:15', '2021-12-11 12:31:37', NULL, NULL, NULL, NULL, NULL),
(9, 'Technology', 'TECING1E', '2021-12-11 12:01:02', 1, 1, '2021-12-11 10:49:30', '2021-12-11 12:32:08', NULL, NULL, NULL, NULL, NULL),
(10, 'Geografía e Historia', 'GEOHIS1E', '2021-12-11 12:00:26', 1, 1, '2021-12-11 10:57:33', '2021-12-11 12:39:23', 3, NULL, NULL, NULL, NULL),
(11, 'Lengua Castellana y Literatura', 'LENG2E', '2021-12-11 12:24:28', 1, 1, '2021-12-11 11:24:26', '2021-12-11 12:40:51', NULL, NULL, NULL, NULL, NULL),
(12, 'Geografía e Historia', 'GEOHIS2E', '2021-12-11 12:25:13', 1, 1, '2021-12-11 11:25:09', '2021-12-11 12:41:10', NULL, NULL, NULL, NULL, NULL),
(13, 'Matemáticas', 'MAT2E', '2021-12-11 12:26:12', 1, 1, '2021-12-11 11:26:10', '2021-12-11 12:41:28', NULL, NULL, NULL, NULL, NULL),
(14, 'Primera Lengua Extranjera Inglés', 'ING2E', '2021-12-11 12:27:02', 1, 1, '2021-12-11 11:26:35', '2021-12-11 12:41:01', NULL, NULL, NULL, NULL, NULL),
(15, 'Educación Física', 'EDF2E', '2021-12-11 12:27:25', 1, 1, '2021-12-11 11:27:22', '2021-12-11 12:41:39', NULL, NULL, NULL, NULL, NULL),
(16, 'Educación Plástica, Visual y Audiovisual', 'EPVA2E', '2021-12-11 12:28:09', 1, 1, '2021-12-11 11:28:07', '2021-12-11 12:41:45', NULL, NULL, NULL, NULL, NULL),
(17, 'Física y Química', 'FYQ2E', '2021-12-11 12:28:49', 1, 1, '2021-12-11 11:28:48', '2021-12-11 11:28:49', NULL, NULL, NULL, NULL, NULL),
(18, 'Physics and Chemistry', 'FYQING2E', '2021-12-11 12:29:56', 1, 1, '2021-12-11 11:29:52', '2021-12-11 12:41:59', NULL, NULL, NULL, NULL, NULL),
(19, 'Música', 'MUS2E', '2021-12-11 12:30:14', 1, 1, '2021-12-11 11:30:13', '2021-12-11 11:30:14', NULL, NULL, NULL, NULL, NULL),
(20, 'Music', 'MUSING2E', '2021-12-11 12:30:32', 1, 1, '2021-12-11 11:30:29', '2021-12-11 12:42:07', NULL, NULL, NULL, NULL, NULL),
(21, 'Lengua Castellana y Literatura', 'LENG3E', '2021-12-11 12:55:47', 1, 1, '2021-12-11 11:55:46', '2021-12-11 13:09:10', NULL, NULL, NULL, NULL, NULL),
(22, 'Biología y Geología', 'BIOGEO3E', '2021-12-11 12:56:50', 1, 1, '2021-12-11 11:56:48', '2021-12-11 11:56:50', NULL, NULL, NULL, NULL, NULL),
(23, 'Geografía e Historia', 'GEOHIS3E', '2021-12-11 12:57:01', 1, 1, '2021-12-11 11:57:00', '2021-12-11 13:09:56', NULL, NULL, NULL, NULL, NULL),
(24, 'Primera Lengua Extranjera Inglés', 'ING3E', '2021-12-11 12:57:16', 1, 1, '2021-12-11 11:57:14', '2021-12-11 13:09:18', NULL, NULL, NULL, NULL, NULL),
(25, 'Educación Física', 'EDF3E', '2021-12-11 12:57:49', 1, 1, '2021-12-11 11:57:47', '2021-12-11 13:10:13', NULL, NULL, NULL, NULL, NULL),
(26, 'Física y Química', 'FYQ3E', '2021-12-11 12:58:04', 1, 1, '2021-12-11 11:58:03', '2021-12-11 11:58:33', NULL, NULL, NULL, NULL, NULL),
(27, 'Tecnología', 'TEC3E', '2021-12-11 12:59:01', 1, 1, '2021-12-11 11:59:00', '2021-12-11 11:59:01', NULL, NULL, NULL, NULL, NULL),
(28, 'Technology', 'TECING3E', '2021-12-11 12:59:13', 1, 1, '2021-12-11 11:59:12', '2021-12-11 11:59:13', NULL, NULL, NULL, NULL, NULL),
(29, 'Physics and Chemistry', 'FYQING3E', '2021-12-11 12:59:32', 1, 1, '2021-12-11 11:59:31', '2021-12-11 13:11:12', NULL, NULL, NULL, NULL, NULL),
(30, 'Music', 'MUSING3E', '2021-12-11 12:59:49', 1, 1, '2021-12-11 11:59:48', '2021-12-11 13:11:21', NULL, NULL, NULL, NULL, NULL),
(31, 'Música', 'MUS3E', '2021-12-11 13:00:02', 1, 1, '2021-12-11 12:00:01', '2021-12-11 12:00:02', NULL, NULL, NULL, NULL, NULL),
(32, 'Biología y Geología', 'BIOGEO3E', '2021-12-11 14:09:43', 1, 1, '2021-12-11 13:09:42', '2021-12-11 13:09:43', NULL, NULL, NULL, NULL, NULL),
(33, 'Technology', 'TECING3E', '2021-12-11 14:10:58', 1, 1, '2021-12-11 13:10:57', '2021-12-11 13:10:58', NULL, NULL, NULL, NULL, NULL),
(34, 'Matemáticas Académicas', 'MATACA3E', '2021-12-11 14:12:20', 1, 1, '2021-12-11 13:12:18', '2021-12-11 13:12:20', NULL, NULL, NULL, NULL, NULL),
(35, 'Matemáticas Aplicadas', 'MATAPL3E', '2021-12-11 14:12:40', 1, 1, '2021-12-11 13:12:39', '2021-12-11 13:12:40', NULL, NULL, NULL, NULL, NULL),
(36, 'Lengua Castellana y Literatura', 'LENG4E', '2021-12-11 14:24:33', 1, 1, '2021-12-11 13:24:32', '2021-12-11 13:24:33', NULL, NULL, NULL, NULL, NULL),
(37, 'Geografía e Historia', 'GEOHIS4E', '2021-12-11 14:24:48', 1, 1, '2021-12-11 13:24:47', '2021-12-11 13:24:48', NULL, NULL, NULL, NULL, NULL),
(38, 'Primera Lengua Extranjera Inglés', 'ING4E', '2021-12-11 14:25:06', 1, 1, '2021-12-11 13:25:05', '2021-12-11 13:25:06', NULL, NULL, NULL, NULL, NULL),
(39, 'Educación Física', 'EDF4E', '2021-12-11 14:25:39', 1, 1, '2021-12-11 13:25:38', '2021-12-11 13:25:39', NULL, NULL, NULL, NULL, NULL),
(40, 'Matemáticas Académicas', 'MATAPL4E', '2021-12-11 14:26:04', 1, 1, '2021-12-11 13:26:03', '2021-12-11 13:26:04', NULL, NULL, NULL, NULL, NULL),
(41, 'Mathematics', 'MATING4E', '2021-12-11 14:26:27', 1, 1, '2021-12-11 13:26:26', '2021-12-11 13:26:27', NULL, NULL, NULL, NULL, NULL),
(42, 'Physical Training', 'EDFING4E', '2021-12-11 14:27:00', 1, 1, '2021-12-11 13:26:59', '2021-12-11 13:27:00', NULL, NULL, NULL, NULL, NULL),
(43, 'Iniciación Actividad Emprendedora y Empresarial', 'IEE4E', '2021-12-11 14:27:33', 1, 1, '2021-12-11 13:27:32', '2021-12-11 13:27:33', NULL, NULL, NULL, NULL, NULL),
(44, 'Ciencias Aplicadas a la Act. Profesional', 'CAAP4E', '2021-12-11 14:30:50', 1, 1, '2021-12-11 13:28:07', '2021-12-11 13:30:50', NULL, 1, NULL, NULL, NULL),
(45, 'Tecnología', 'TEC4E', '2021-12-11 14:31:06', 1, 1, '2021-12-11 13:31:02', '2021-12-11 13:31:06', NULL, 1, NULL, NULL, NULL),
(46, 'Lengua Castellana y Literatura I', 'LENG1BH', '2021-12-11 15:00:57', 1, 1, '2021-12-11 14:00:51', '2021-12-11 14:01:54', NULL, NULL, 'general', NULL, NULL),
(47, 'Primera Lengua Extranjera Inglés I', 'ING1BH', '2021-12-11 15:02:19', 1, 1, '2021-12-11 14:02:18', '2021-12-11 14:02:19', NULL, NULL, 'general', NULL, NULL),
(48, 'Filosofía', 'FIL1BH', '2021-12-11 15:03:02', 1, 1, '2021-12-11 14:03:01', '2021-12-11 14:03:02', NULL, NULL, 'general', NULL, NULL),
(49, 'Matemáticas I', 'MAT1BH', '2021-12-11 15:04:01', 1, 1, '2021-12-11 14:04:00', '2021-12-11 14:04:01', NULL, NULL, 'general', NULL, NULL),
(50, 'Educación Física', 'EDF1BH', '2021-12-11 15:04:49', 1, 1, '2021-12-11 14:04:48', '2021-12-11 14:06:04', NULL, NULL, 'especifica', NULL, NULL),
(51, 'Historia del Mundo Contemporáneo', 'HISMC1BH', '2021-12-11 15:06:48', 1, 1, '2021-12-11 14:06:47', '2021-12-11 14:06:48', NULL, NULL, 'de_opcion', NULL, NULL),
(52, 'Física y Química', 'FYQ1BH', '2021-12-11 15:07:08', 1, 1, '2021-12-11 14:07:07', '2021-12-11 14:07:08', NULL, NULL, 'de_opcion', NULL, NULL),
(53, 'Dibujo Artístico I', 'DART1BH', '2021-12-11 23:57:56', 1, 1, '2021-12-11 22:57:54', '2021-12-11 22:57:56', NULL, NULL, 'especifica', NULL, NULL),
(54, 'Volumen', 'VOL1BH', '2021-12-11 23:58:09', 1, 1, '2021-12-11 22:58:08', '2021-12-11 22:58:09', NULL, NULL, 'especifica', NULL, NULL),
(55, 'Lengua Castellana y Literatura II', 'LENG2BH', '2021-12-12 00:13:27', 1, 1, '2021-12-11 23:13:25', '2021-12-11 23:13:27', NULL, NULL, 'general', NULL, NULL),
(56, 'Primera Lengua Extranjera Inglés II', 'ING2BH', '2021-12-12 00:13:57', 1, 1, '2021-12-11 23:13:56', '2021-12-11 23:13:57', NULL, NULL, 'general', NULL, NULL),
(57, 'Historia de España', 'HISES2BH', '2021-12-12 00:14:34', 1, 1, '2021-12-11 23:14:32', '2021-12-11 23:14:34', NULL, NULL, 'general', NULL, NULL),
(58, 'Matemáticas II', 'MAT2BH', '2021-12-12 00:15:07', 1, 1, '2021-12-11 23:15:02', '2021-12-11 23:15:07', NULL, NULL, 'general', NULL, NULL),
(59, 'Fundamentos de Arte II', 'FUNART2BH', '2021-12-12 00:15:48', 1, 1, '2021-12-11 23:15:46', '2021-12-11 23:15:48', NULL, NULL, 'general', NULL, NULL),
(60, 'Cultura Audiovisual II', 'CULAU2BH', '2021-12-12 00:17:11', 1, 1, '2021-12-11 23:17:10', '2021-12-11 23:17:11', NULL, NULL, 'de_opcion', NULL, NULL),
(61, 'Diseño', 'DIS2BH', '2021-12-12 00:17:34', 1, 1, '2021-12-11 23:17:32', '2021-12-11 23:17:34', NULL, NULL, 'de_opcion', NULL, NULL),
(62, 'Dibujo Artístico II', 'DIBART2BH', '2021-12-12 00:17:50', 1, 1, '2021-12-11 23:17:48', '2021-12-11 23:17:50', NULL, NULL, 'especifica', NULL, NULL),
(63, 'Biología', 'BIO2BH', '2021-12-12 00:19:10', 1, 1, '2021-12-11 23:19:08', '2021-12-11 23:19:10', NULL, NULL, 'de_opcion', NULL, NULL),
(64, 'Química', 'QUI2BH', '2021-12-12 00:19:32', 1, 1, '2021-12-11 23:19:30', '2021-12-11 23:19:32', NULL, NULL, 'de_opcion', NULL, NULL),
(65, 'Geología', 'GEO2BH', '2021-12-12 00:19:54', 1, 1, '2021-12-11 23:19:52', '2021-12-11 23:19:54', NULL, NULL, 'de_opcion', NULL, NULL),
(66, 'Dibujo Técnico II', 'DIBTEC2BH', '2021-12-12 00:23:55', 1, 1, '2021-12-11 23:23:54', '2021-12-11 23:37:39', NULL, NULL, 'de_opcion', NULL, '(si se ha cursado en 1º)'),
(67, 'Física', 'FIS2BH', '2021-12-12 00:24:12', 1, 1, '2021-12-11 23:24:11', '2021-12-11 23:24:12', NULL, NULL, 'de_opcion', NULL, NULL),
(68, 'Técnicas de Expresión Gráfico-Plástica', 'TEXGP1BH', '2021-12-12 00:38:22', 1, 1, '2021-12-11 23:38:20', '2021-12-11 23:38:22', NULL, 1, 'especifica', NULL, NULL),
(69, 'Imagen y Sonido', 'IMSO2BH', '2021-12-12 00:38:54', 1, 1, '2021-12-11 23:38:53', '2021-12-11 23:40:10', NULL, 1, 'especifica', NULL, NULL),
(70, 'TIC II', 'TIC2BH', '2021-12-12 00:39:15', 1, 1, '2021-12-11 23:39:14', '2021-12-11 23:39:15', NULL, 1, 'especifica', NULL, '(si se ha cursado en 1º)'),
(71, 'Latín II', 'LAT2BH', '2021-12-12 12:33:08', 1, 1, '2021-12-12 11:33:06', '2021-12-12 11:33:08', NULL, NULL, 'de_opcion', NULL, NULL),
(72, 'Historia de la Filosofía', 'HISFIL2BH', '2021-12-12 12:34:05', 1, 1, '2021-12-12 11:34:03', '2021-12-12 11:34:05', NULL, NULL, 'de_opcion', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_file`
--

CREATE TABLE `upload_file` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext DEFAULT NULL,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_file_morph`
--

CREATE TABLE `upload_file_morph` (
  `id` int(10) UNSIGNED NOT NULL,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext DEFAULT NULL,
  `field` longtext DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users-permissions_permission`
--

CREATE TABLE `users-permissions_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users-permissions_permission`
--

INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`, `created_by`, `updated_by`) VALUES
(1, 'content-manager', 'collection-types', 'bulkdelete', 0, '', 1, NULL, NULL),
(2, 'content-manager', 'collection-types', 'delete', 0, '', 1, NULL, NULL),
(3, 'content-manager', 'collection-types', 'delete', 0, '', 2, NULL, NULL),
(4, 'content-manager', 'collection-types', 'findone', 0, '', 1, NULL, NULL),
(5, 'content-manager', 'collection-types', 'create', 0, '', 2, NULL, NULL),
(6, 'content-manager', 'collection-types', 'create', 0, '', 1, NULL, NULL),
(7, 'content-manager', 'collection-types', 'bulkdelete', 0, '', 2, NULL, NULL),
(8, 'content-manager', 'collection-types', 'find', 0, '', 2, NULL, NULL),
(9, 'content-manager', 'collection-types', 'find', 0, '', 1, NULL, NULL),
(10, 'content-manager', 'collection-types', 'findone', 0, '', 2, NULL, NULL),
(11, 'content-manager', 'collection-types', 'previewmanyrelations', 0, '', 1, NULL, NULL),
(12, 'content-manager', 'collection-types', 'previewmanyrelations', 0, '', 2, NULL, NULL),
(13, 'content-manager', 'collection-types', 'publish', 0, '', 1, NULL, NULL),
(14, 'content-manager', 'collection-types', 'publish', 0, '', 2, NULL, NULL),
(15, 'content-manager', 'collection-types', 'unpublish', 0, '', 1, NULL, NULL),
(16, 'content-manager', 'collection-types', 'unpublish', 0, '', 2, NULL, NULL),
(17, 'content-manager', 'collection-types', 'update', 0, '', 1, NULL, NULL),
(18, 'content-manager', 'collection-types', 'update', 0, '', 2, NULL, NULL),
(19, 'content-manager', 'components', 'findcomponentconfiguration', 0, '', 1, NULL, NULL),
(20, 'content-manager', 'components', 'findcomponentconfiguration', 0, '', 2, NULL, NULL),
(21, 'content-manager', 'components', 'findcomponents', 0, '', 1, NULL, NULL),
(22, 'content-manager', 'components', 'updatecomponentconfiguration', 0, '', 1, NULL, NULL),
(23, 'content-manager', 'components', 'updatecomponentconfiguration', 0, '', 2, NULL, NULL),
(24, 'content-manager', 'content-types', 'findcontenttypeconfiguration', 0, '', 1, NULL, NULL),
(25, 'content-manager', 'content-types', 'findcontenttypeconfiguration', 0, '', 2, NULL, NULL),
(26, 'content-manager', 'content-types', 'findcontenttypes', 0, '', 1, NULL, NULL),
(27, 'content-manager', 'content-types', 'findcontenttypes', 0, '', 2, NULL, NULL),
(28, 'content-manager', 'components', 'findcomponents', 0, '', 2, NULL, NULL),
(29, 'content-manager', 'content-types', 'findcontenttypessettings', 0, '', 2, NULL, NULL),
(30, 'content-manager', 'content-types', 'findcontenttypessettings', 0, '', 1, NULL, NULL),
(31, 'content-manager', 'content-types', 'updatecontenttypeconfiguration', 0, '', 1, NULL, NULL),
(32, 'content-manager', 'content-types', 'updatecontenttypeconfiguration', 0, '', 2, NULL, NULL),
(33, 'content-manager', 'relations', 'find', 0, '', 1, NULL, NULL),
(34, 'content-manager', 'relations', 'find', 0, '', 2, NULL, NULL),
(35, 'content-manager', 'single-types', 'createorupdate', 0, '', 1, NULL, NULL),
(36, 'content-manager', 'single-types', 'createorupdate', 0, '', 2, NULL, NULL),
(37, 'content-manager', 'single-types', 'delete', 0, '', 1, NULL, NULL),
(38, 'content-manager', 'single-types', 'delete', 0, '', 2, NULL, NULL),
(39, 'content-manager', 'single-types', 'find', 0, '', 1, NULL, NULL),
(40, 'content-manager', 'single-types', 'find', 0, '', 2, NULL, NULL),
(41, 'content-manager', 'single-types', 'unpublish', 0, '', 1, NULL, NULL),
(42, 'content-manager', 'single-types', 'unpublish', 0, '', 2, NULL, NULL),
(43, 'content-manager', 'single-types', 'publish', 0, '', 1, NULL, NULL),
(44, 'content-manager', 'single-types', 'publish', 0, '', 2, NULL, NULL),
(45, 'content-manager', 'uid', 'checkuidavailability', 0, '', 1, NULL, NULL),
(46, 'content-manager', 'uid', 'checkuidavailability', 0, '', 2, NULL, NULL),
(47, 'content-manager', 'uid', 'generateuid', 0, '', 1, NULL, NULL),
(48, 'content-manager', 'uid', 'generateuid', 0, '', 2, NULL, NULL),
(49, 'content-type-builder', 'builder', 'getreservednames', 0, '', 1, NULL, NULL),
(50, 'content-type-builder', 'builder', 'getreservednames', 0, '', 2, NULL, NULL),
(51, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 1, NULL, NULL),
(52, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 2, NULL, NULL),
(53, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 1, NULL, NULL),
(54, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 2, NULL, NULL),
(55, 'content-type-builder', 'components', 'createcomponent', 0, '', 1, NULL, NULL),
(56, 'content-type-builder', 'components', 'createcomponent', 0, '', 2, NULL, NULL),
(57, 'content-type-builder', 'components', 'deletecomponent', 0, '', 1, NULL, NULL),
(58, 'content-type-builder', 'components', 'deletecomponent', 0, '', 2, NULL, NULL),
(59, 'content-type-builder', 'components', 'getcomponent', 0, '', 1, NULL, NULL),
(60, 'content-type-builder', 'components', 'getcomponent', 0, '', 2, NULL, NULL),
(61, 'content-type-builder', 'components', 'getcomponents', 0, '', 2, NULL, NULL),
(62, 'content-type-builder', 'components', 'getcomponents', 0, '', 1, NULL, NULL),
(63, 'content-type-builder', 'components', 'updatecomponent', 0, '', 1, NULL, NULL),
(64, 'content-type-builder', 'components', 'updatecomponent', 0, '', 2, NULL, NULL),
(65, 'content-type-builder', 'connections', 'getconnections', 0, '', 1, NULL, NULL),
(66, 'content-type-builder', 'connections', 'getconnections', 0, '', 2, NULL, NULL),
(67, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 1, NULL, NULL),
(68, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 2, NULL, NULL),
(69, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 1, NULL, NULL),
(70, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 2, NULL, NULL),
(71, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 1, NULL, NULL),
(72, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 2, NULL, NULL),
(73, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 1, NULL, NULL),
(74, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 1, NULL, NULL),
(75, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 2, NULL, NULL),
(76, 'email', 'email', 'getsettings', 0, '', 1, NULL, NULL),
(77, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 2, NULL, NULL),
(78, 'email', 'email', 'getsettings', 0, '', 2, NULL, NULL),
(79, 'email', 'email', 'send', 0, '', 1, NULL, NULL),
(80, 'email', 'email', 'send', 0, '', 2, NULL, NULL),
(81, 'email', 'email', 'test', 0, '', 1, NULL, NULL),
(82, 'email', 'email', 'test', 0, '', 2, NULL, NULL),
(83, 'i18n', 'content-types', 'getnonlocalizedattributes', 0, '', 1, NULL, NULL),
(84, 'i18n', 'content-types', 'getnonlocalizedattributes', 0, '', 2, NULL, NULL),
(85, 'i18n', 'iso-locales', 'listisolocales', 0, '', 1, NULL, NULL),
(86, 'i18n', 'iso-locales', 'listisolocales', 0, '', 2, NULL, NULL),
(87, 'i18n', 'locales', 'createlocale', 0, '', 1, NULL, NULL),
(88, 'i18n', 'locales', 'createlocale', 0, '', 2, NULL, NULL),
(89, 'i18n', 'locales', 'deletelocale', 0, '', 1, NULL, NULL),
(90, 'i18n', 'locales', 'deletelocale', 0, '', 2, NULL, NULL),
(91, 'i18n', 'locales', 'listlocales', 0, '', 1, NULL, NULL),
(92, 'i18n', 'locales', 'listlocales', 0, '', 2, NULL, NULL),
(93, 'i18n', 'locales', 'updatelocale', 0, '', 1, NULL, NULL),
(94, 'i18n', 'locales', 'updatelocale', 0, '', 2, NULL, NULL),
(95, 'upload', 'upload', 'count', 0, '', 2, NULL, NULL),
(96, 'upload', 'upload', 'count', 0, '', 1, NULL, NULL),
(97, 'upload', 'upload', 'destroy', 0, '', 1, NULL, NULL),
(98, 'upload', 'upload', 'destroy', 0, '', 2, NULL, NULL),
(99, 'upload', 'upload', 'find', 0, '', 1, NULL, NULL),
(100, 'upload', 'upload', 'find', 0, '', 2, NULL, NULL),
(101, 'upload', 'upload', 'findone', 0, '', 1, NULL, NULL),
(102, 'upload', 'upload', 'findone', 0, '', 2, NULL, NULL),
(103, 'upload', 'upload', 'getsettings', 0, '', 1, NULL, NULL),
(104, 'upload', 'upload', 'getsettings', 0, '', 2, NULL, NULL),
(105, 'upload', 'upload', 'search', 0, '', 1, NULL, NULL),
(106, 'upload', 'upload', 'search', 0, '', 2, NULL, NULL),
(107, 'upload', 'upload', 'updatesettings', 0, '', 1, NULL, NULL),
(108, 'upload', 'upload', 'updatesettings', 0, '', 2, NULL, NULL),
(109, 'upload', 'upload', 'upload', 0, '', 1, NULL, NULL),
(110, 'upload', 'upload', 'upload', 0, '', 2, NULL, NULL),
(111, 'users-permissions', 'auth', 'callback', 0, '', 1, NULL, NULL),
(112, 'users-permissions', 'auth', 'callback', 1, '', 2, NULL, NULL),
(113, 'users-permissions', 'auth', 'connect', 1, '', 1, NULL, NULL),
(114, 'users-permissions', 'auth', 'connect', 1, '', 2, NULL, NULL),
(115, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 1, NULL, NULL),
(116, 'users-permissions', 'auth', 'emailconfirmation', 1, '', 2, NULL, NULL),
(117, 'users-permissions', 'auth', 'forgotpassword', 0, '', 1, NULL, NULL),
(118, 'users-permissions', 'auth', 'forgotpassword', 1, '', 2, NULL, NULL),
(119, 'users-permissions', 'auth', 'register', 0, '', 1, NULL, NULL),
(120, 'users-permissions', 'auth', 'register', 1, '', 2, NULL, NULL),
(121, 'users-permissions', 'auth', 'resetpassword', 0, '', 1, NULL, NULL),
(122, 'users-permissions', 'auth', 'resetpassword', 1, '', 2, NULL, NULL),
(123, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 1, NULL, NULL),
(124, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 2, NULL, NULL),
(125, 'users-permissions', 'user', 'count', 0, '', 1, NULL, NULL),
(126, 'users-permissions', 'user', 'count', 0, '', 2, NULL, NULL),
(127, 'users-permissions', 'user', 'create', 0, '', 1, NULL, NULL),
(128, 'users-permissions', 'user', 'create', 0, '', 2, NULL, NULL),
(129, 'users-permissions', 'user', 'destroy', 0, '', 1, NULL, NULL),
(130, 'users-permissions', 'user', 'destroy', 0, '', 2, NULL, NULL),
(131, 'users-permissions', 'user', 'destroyall', 0, '', 1, NULL, NULL),
(132, 'users-permissions', 'user', 'destroyall', 0, '', 2, NULL, NULL),
(133, 'users-permissions', 'user', 'find', 0, '', 1, NULL, NULL),
(134, 'users-permissions', 'user', 'find', 0, '', 2, NULL, NULL),
(135, 'users-permissions', 'user', 'findone', 0, '', 1, NULL, NULL),
(136, 'users-permissions', 'user', 'findone', 0, '', 2, NULL, NULL),
(137, 'users-permissions', 'user', 'me', 1, '', 1, NULL, NULL),
(138, 'users-permissions', 'user', 'me', 1, '', 2, NULL, NULL),
(139, 'users-permissions', 'user', 'update', 0, '', 1, NULL, NULL),
(140, 'users-permissions', 'user', 'update', 0, '', 2, NULL, NULL),
(141, 'users-permissions', 'userspermissions', 'createrole', 0, '', 1, NULL, NULL),
(142, 'users-permissions', 'userspermissions', 'createrole', 0, '', 2, NULL, NULL),
(143, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 1, NULL, NULL),
(144, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 2, NULL, NULL),
(145, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 1, NULL, NULL),
(146, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 2, NULL, NULL),
(147, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 1, NULL, NULL),
(148, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 2, NULL, NULL),
(149, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 1, NULL, NULL),
(150, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 2, NULL, NULL),
(151, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 1, NULL, NULL),
(152, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 2, NULL, NULL),
(153, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 1, NULL, NULL),
(154, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 2, NULL, NULL),
(155, 'users-permissions', 'userspermissions', 'getrole', 0, '', 1, NULL, NULL),
(156, 'users-permissions', 'userspermissions', 'getrole', 0, '', 2, NULL, NULL),
(157, 'users-permissions', 'userspermissions', 'getroles', 0, '', 1, NULL, NULL),
(158, 'users-permissions', 'userspermissions', 'getroles', 0, '', 2, NULL, NULL),
(159, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 1, NULL, NULL),
(160, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 2, NULL, NULL),
(161, 'users-permissions', 'userspermissions', 'index', 0, '', 1, NULL, NULL),
(162, 'users-permissions', 'userspermissions', 'index', 0, '', 2, NULL, NULL),
(163, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 1, NULL, NULL),
(164, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 1, NULL, NULL),
(165, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 2, NULL, NULL),
(166, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 2, NULL, NULL),
(167, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 1, NULL, NULL),
(168, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 2, NULL, NULL),
(169, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 1, NULL, NULL),
(170, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 2, NULL, NULL),
(171, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 1, NULL, NULL),
(172, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 2, NULL, NULL),
(173, 'documentation', 'documentation', 'deletedoc', 0, '', 2, NULL, NULL),
(174, 'documentation', 'documentation', 'getinfos', 0, '', 1, NULL, NULL),
(175, 'documentation', 'documentation', 'deletedoc', 0, '', 1, NULL, NULL),
(176, 'documentation', 'documentation', 'getinfos', 0, '', 2, NULL, NULL),
(177, 'documentation', 'documentation', 'index', 0, '', 1, NULL, NULL),
(178, 'documentation', 'documentation', 'login', 0, '', 1, NULL, NULL),
(179, 'documentation', 'documentation', 'index', 0, '', 2, NULL, NULL),
(180, 'documentation', 'documentation', 'login', 0, '', 2, NULL, NULL),
(181, 'documentation', 'documentation', 'loginview', 0, '', 1, NULL, NULL),
(182, 'documentation', 'documentation', 'loginview', 0, '', 2, NULL, NULL),
(183, 'documentation', 'documentation', 'regeneratedoc', 0, '', 2, NULL, NULL),
(184, 'documentation', 'documentation', 'updatesettings', 0, '', 1, NULL, NULL),
(185, 'documentation', 'documentation', 'updatesettings', 0, '', 2, NULL, NULL),
(186, 'documentation', 'documentation', 'regeneratedoc', 0, '', 1, NULL, NULL),
(187, 'config-sync', 'config', 'exportall', 0, '', 1, NULL, NULL),
(188, 'config-sync', 'config', 'exportall', 0, '', 2, NULL, NULL),
(189, 'config-sync', 'config', 'getdiff', 0, '', 1, NULL, NULL),
(190, 'config-sync', 'config', 'getdiff', 0, '', 2, NULL, NULL),
(191, 'config-sync', 'config', 'importall', 0, '', 1, NULL, NULL),
(192, 'config-sync', 'config', 'importall', 0, '', 2, NULL, NULL),
(193, 'entity-relationship-chart', 'entity-relationship-chart', 'geterdata', 0, '', 1, NULL, NULL),
(194, 'entity-relationship-chart', 'entity-relationship-chart', 'geterdata', 0, '', 2, NULL, NULL),
(195, 'entity-relationship-chart', 'entity-relationship-chart', 'index', 0, '', 1, NULL, NULL),
(196, 'entity-relationship-chart', 'entity-relationship-chart', 'index', 0, '', 2, NULL, NULL),
(197, 'raw-query', 'raw-query', 'execute', 0, '', 1, NULL, NULL),
(198, 'raw-query', 'raw-query', 'execute', 0, '', 2, NULL, NULL),
(199, 'sync-roles-permissions', 'sync-roles-permissions', 'getroles', 0, '', 1, NULL, NULL),
(200, 'sync-roles-permissions', 'sync-roles-permissions', 'getroles', 0, '', 2, NULL, NULL),
(201, 'sync-roles-permissions', 'sync-roles-permissions', 'index', 0, '', 1, NULL, NULL),
(202, 'sync-roles-permissions', 'sync-roles-permissions', 'index', 0, '', 2, NULL, NULL),
(203, 'sync-roles-permissions', 'sync-roles-permissions', 'updateroles', 0, '', 1, NULL, NULL),
(204, 'sync-roles-permissions', 'sync-roles-permissions', 'updateroles', 0, '', 2, NULL, NULL),
(205, 'testing', 'my-plugin', 'index', 0, '', 1, NULL, NULL),
(206, 'testing', 'my-plugin', 'index', 0, '', 2, NULL, NULL),
(207, 'application', 'cursos', 'count', 0, '', 1, NULL, NULL),
(208, 'application', 'cursos', 'count', 1, 'isauthenticated', 2, NULL, NULL),
(209, 'application', 'cursos', 'create', 0, '', 1, NULL, NULL),
(210, 'application', 'cursos', 'create', 0, '', 2, NULL, NULL),
(211, 'application', 'cursos', 'delete', 0, '', 1, NULL, NULL),
(212, 'application', 'cursos', 'delete', 0, '', 2, NULL, NULL),
(213, 'application', 'cursos', 'find', 0, '', 1, NULL, NULL),
(214, 'application', 'cursos', 'find', 1, 'isauthenticated', 2, NULL, NULL),
(215, 'application', 'cursos', 'findone', 0, '', 1, NULL, NULL),
(216, 'application', 'cursos', 'findone', 1, 'isauthenticated', 2, NULL, NULL),
(217, 'application', 'cursos', 'update', 0, '', 1, NULL, NULL),
(218, 'application', 'cursos', 'update', 0, '', 2, NULL, NULL),
(219, 'application', 'matriculas', 'count', 0, '', 1, NULL, NULL),
(220, 'application', 'matriculas', 'count', 1, 'isauthenticated', 2, NULL, NULL),
(221, 'application', 'matriculas', 'create', 0, '', 1, NULL, NULL),
(222, 'application', 'matriculas', 'create', 1, 'isauthenticated', 2, NULL, NULL),
(223, 'application', 'matriculas', 'delete', 0, '', 1, NULL, NULL),
(224, 'application', 'matriculas', 'delete', 1, 'isauthenticated', 2, NULL, NULL),
(225, 'application', 'matriculas', 'find', 0, '', 1, NULL, NULL),
(226, 'application', 'matriculas', 'find', 1, '', 2, NULL, NULL),
(227, 'application', 'matriculas', 'findone', 0, '', 1, NULL, NULL),
(228, 'application', 'matriculas', 'findone', 1, '', 2, NULL, NULL),
(229, 'application', 'matriculas', 'update', 0, '', 1, NULL, NULL),
(230, 'application', 'matriculas', 'update', 1, 'isauthenticated', 2, NULL, NULL),
(231, 'application', 'usuarios', 'count', 0, '', 1, NULL, NULL),
(232, 'application', 'usuarios', 'count', 1, 'isauthenticated', 2, NULL, NULL),
(233, 'application', 'usuarios', 'create', 0, '', 1, NULL, NULL),
(234, 'application', 'usuarios', 'create', 1, 'isauthenticated', 2, NULL, NULL),
(235, 'application', 'usuarios', 'delete', 0, '', 1, NULL, NULL),
(236, 'application', 'usuarios', 'delete', 0, '', 2, NULL, NULL),
(237, 'application', 'usuarios', 'find', 0, '', 1, NULL, NULL),
(238, 'application', 'usuarios', 'find', 1, 'isauthenticated', 2, NULL, NULL),
(239, 'application', 'usuarios', 'findone', 0, '', 1, NULL, NULL),
(240, 'application', 'usuarios', 'findone', 1, 'isauthenticated', 2, NULL, NULL),
(241, 'application', 'usuarios', 'update', 1, 'isauthenticated', 2, NULL, NULL),
(242, 'application', 'usuarios', 'update', 0, '', 1, NULL, NULL),
(243, 'application', 'troncales', 'count', 0, '', 1, NULL, NULL),
(244, 'application', 'troncales', 'count', 1, 'isauthenticated', 2, NULL, NULL),
(245, 'application', 'troncales', 'create', 0, '', 1, NULL, NULL),
(246, 'application', 'troncales', 'create', 0, '', 2, NULL, NULL),
(247, 'application', 'troncales', 'delete', 0, '', 1, NULL, NULL),
(248, 'application', 'troncales', 'delete', 0, '', 2, NULL, NULL),
(249, 'application', 'troncales', 'find', 0, '', 1, NULL, NULL),
(250, 'application', 'troncales', 'find', 1, 'isauthenticated', 2, NULL, NULL),
(251, 'application', 'troncales', 'findone', 0, '', 1, NULL, NULL),
(252, 'application', 'troncales', 'findone', 1, 'isauthenticated', 2, NULL, NULL),
(253, 'application', 'troncales', 'update', 0, '', 1, NULL, NULL),
(254, 'application', 'troncales', 'update', 0, '', 2, NULL, NULL),
(255, 'application', 'modalidades', 'count', 0, '', 1, NULL, NULL),
(256, 'application', 'modalidades', 'count', 1, 'isauthenticated', 2, NULL, NULL),
(257, 'application', 'modalidades', 'create', 0, '', 1, NULL, NULL),
(258, 'application', 'modalidades', 'create', 0, '', 2, NULL, NULL),
(259, 'application', 'modalidades', 'delete', 0, '', 1, NULL, NULL),
(260, 'application', 'modalidades', 'delete', 0, '', 2, NULL, NULL),
(261, 'application', 'modalidades', 'find', 0, '', 1, NULL, NULL),
(262, 'application', 'modalidades', 'find', 1, 'isauthenticated', 2, NULL, NULL),
(263, 'application', 'modalidades', 'findone', 0, '', 1, NULL, NULL),
(264, 'application', 'modalidades', 'findone', 1, 'isauthenticated', 2, NULL, NULL),
(265, 'application', 'modalidades', 'update', 0, '', 1, NULL, NULL),
(266, 'application', 'modalidades', 'update', 0, '', 2, NULL, NULL),
(267, 'application', 'optativas', 'count', 0, '', 1, NULL, NULL),
(268, 'application', 'optativas', 'count', 1, 'isauthenticated', 2, NULL, NULL),
(269, 'application', 'optativas', 'create', 0, '', 1, NULL, NULL),
(270, 'application', 'optativas', 'create', 0, '', 2, NULL, NULL),
(271, 'application', 'optativas', 'delete', 0, '', 1, NULL, NULL),
(272, 'application', 'optativas', 'delete', 0, '', 2, NULL, NULL),
(273, 'application', 'optativas', 'find', 0, '', 1, NULL, NULL),
(274, 'application', 'optativas', 'find', 1, 'isauthenticated', 2, NULL, NULL),
(275, 'application', 'optativas', 'findone', 0, '', 1, NULL, NULL),
(276, 'application', 'optativas', 'findone', 1, 'isauthenticated', 2, NULL, NULL),
(277, 'application', 'optativas', 'update', 0, '', 1, NULL, NULL),
(278, 'application', 'optativas', 'update', 0, '', 2, NULL, NULL),
(279, 'application', 'condiciones', 'count', 0, '', 1, NULL, NULL),
(280, 'application', 'condiciones', 'count', 1, 'isauthenticated', 2, NULL, NULL),
(281, 'application', 'condiciones', 'create', 0, '', 1, NULL, NULL),
(282, 'application', 'condiciones', 'create', 0, '', 2, NULL, NULL),
(283, 'application', 'condiciones', 'delete', 0, '', 1, NULL, NULL),
(284, 'application', 'condiciones', 'delete', 0, '', 2, NULL, NULL),
(285, 'application', 'condiciones', 'find', 0, '', 1, NULL, NULL),
(286, 'application', 'condiciones', 'find', 1, 'isauthenticated', 2, NULL, NULL),
(287, 'application', 'condiciones', 'findone', 0, '', 1, NULL, NULL),
(288, 'application', 'condiciones', 'findone', 1, 'isauthenticated', 2, NULL, NULL),
(289, 'application', 'condiciones', 'update', 0, '', 1, NULL, NULL),
(290, 'application', 'condiciones', 'update', 0, '', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users-permissions_role`
--

CREATE TABLE `users-permissions_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users-permissions_role`
--

INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`, `created_by`, `updated_by`) VALUES
(1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', NULL, NULL),
(2, 'publico', 'Usuario normal', 'public', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users-permissions_user`
--

CREATE TABLE `users-permissions_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmationToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `tel` bigint(20) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Papellido` varchar(255) DEFAULT NULL,
  `Sapellido` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users-permissions_user`
--

INSERT INTO `users-permissions_user` (`id`, `username`, `email`, `provider`, `password`, `resetPasswordToken`, `confirmationToken`, `confirmed`, `blocked`, `role`, `created_by`, `updated_by`, `created_at`, `updated_at`, `tel`, `DNI`, `Nombre`, `Papellido`, `Sapellido`) VALUES
(1, 'javigg', 'javiggv99@gmail.com', 'local', '$2a$10$dfDbln5Gr3RxGf4qpXuvtObSZ0DM5KdKsP.Ig7pOUE31UU07YCxO6', NULL, NULL, 1, 0, 2, 1, 1, '2021-11-10 18:01:52', '2021-11-15 17:50:35', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `papellido` varchar(255) DEFAULT NULL,
  `sapellido` varchar(255) DEFAULT NULL,
  `nick_user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `papellido`, `sapellido`, `nick_user`, `password`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`, `email`, `role`) VALUES
(1, 'Javier ', 'García', 'García', NULL, 'trucktor3', '2021-11-10 16:51:48', 1, 1, '2021-11-10 15:51:41', '2021-11-10 15:51:48', 'javiggv99@gmail.com', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `condiciones`
--
ALTER TABLE `condiciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `condiciones_cursos__cursos_condiciones`
--
ALTER TABLE `condiciones_cursos__cursos_condiciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_store`
--
ALTER TABLE `core_store`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos_optativas__optativas_cursos`
--
ALTER TABLE `cursos_optativas__optativas_cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos_troncales__troncales_cursos`
--
ALTER TABLE `cursos_troncales__troncales_cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `i18n_locales`
--
ALTER TABLE `i18n_locales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `i18n_locales_code_unique` (`code`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidades`
--
ALTER TABLE `modalidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidades_optativas__optativas_modalidades`
--
ALTER TABLE `modalidades_optativas__optativas_modalidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidades_troncales__troncales_modalidades`
--
ALTER TABLE `modalidades_troncales__troncales_modalidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `optativas`
--
ALTER TABLE `optativas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `strapi_administrator`
--
ALTER TABLE `strapi_administrator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_administrator_email_unique` (`email`);

--
-- Indices de la tabla `strapi_permission`
--
ALTER TABLE `strapi_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `strapi_role`
--
ALTER TABLE `strapi_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_role_name_unique` (`name`),
  ADD UNIQUE KEY `strapi_role_code_unique` (`code`);

--
-- Indices de la tabla `strapi_users_roles`
--
ALTER TABLE `strapi_users_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `troncales`
--
ALTER TABLE `troncales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `upload_file`
--
ALTER TABLE `upload_file`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `upload_file_morph`
--
ALTER TABLE `upload_file_morph`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users-permissions_permission`
--
ALTER TABLE `users-permissions_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users-permissions_role`
--
ALTER TABLE `users-permissions_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users-permissions_role_type_unique` (`type`);

--
-- Indices de la tabla `users-permissions_user`
--
ALTER TABLE `users-permissions_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users-permissions_user_username_unique` (`username`),
  ADD UNIQUE KEY `users-permissions_user_DNI_unique` (`DNI`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `condiciones`
--
ALTER TABLE `condiciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `condiciones_cursos__cursos_condiciones`
--
ALTER TABLE `condiciones_cursos__cursos_condiciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_store`
--
ALTER TABLE `core_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cursos_optativas__optativas_cursos`
--
ALTER TABLE `cursos_optativas__optativas_cursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `cursos_troncales__troncales_cursos`
--
ALTER TABLE `cursos_troncales__troncales_cursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `i18n_locales`
--
ALTER TABLE `i18n_locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `modalidades`
--
ALTER TABLE `modalidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `modalidades_optativas__optativas_modalidades`
--
ALTER TABLE `modalidades_optativas__optativas_modalidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de la tabla `modalidades_troncales__troncales_modalidades`
--
ALTER TABLE `modalidades_troncales__troncales_modalidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `optativas`
--
ALTER TABLE `optativas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `strapi_administrator`
--
ALTER TABLE `strapi_administrator`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `strapi_permission`
--
ALTER TABLE `strapi_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1608;

--
-- AUTO_INCREMENT de la tabla `strapi_role`
--
ALTER TABLE `strapi_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `strapi_users_roles`
--
ALTER TABLE `strapi_users_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `troncales`
--
ALTER TABLE `troncales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `upload_file`
--
ALTER TABLE `upload_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `upload_file_morph`
--
ALTER TABLE `upload_file_morph`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users-permissions_permission`
--
ALTER TABLE `users-permissions_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT de la tabla `users-permissions_role`
--
ALTER TABLE `users-permissions_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users-permissions_user`
--
ALTER TABLE `users-permissions_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
