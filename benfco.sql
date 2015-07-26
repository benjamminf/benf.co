-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 26, 2015 at 03:09 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `benfco`
--
CREATE DATABASE IF NOT EXISTS `benfco` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `benfco`;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfiles`
--

CREATE TABLE IF NOT EXISTS `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_assetfiles`
--

INSERT INTO `craft_assetfiles` (`id`, `sourceId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(18, 1, 1, 'social-image-blue.jpg', 'image', 560, 292, 25820, '2015-07-24 04:21:31', '2015-07-24 04:21:32', '2015-07-24 04:21:32', '992312f2-c61e-4302-938b-4fdccb6749c0'),
(19, 1, 1, 'social-image-red.jpg', 'image', 560, 292, 27592, '2015-07-24 04:21:32', '2015-07-24 04:21:32', '2015-07-24 04:21:32', 'ba5b166a-612a-4ab8-a50a-9857b276eafc'),
(30, 1, 1, 'craft-forms-logo.svg', 'image', 188, 64, 2640, '2015-07-24 09:22:27', '2015-07-24 09:22:27', '2015-07-24 09:22:27', 'c57e8a90-a3f1-4ebd-9966-d0a77907d907'),
(36, 2, 2, 'DSC_0678sm.jpg', 'image', 580, 580, 190695, '2015-07-26 05:44:02', '2015-07-26 05:44:03', '2015-07-26 05:44:03', '977a7f99-51a8-4d8a-9aca-cc354994ac17'),
(37, 1, 1, 'card-row-arrow.svg', 'image', 58, 54, 639, '2015-07-26 07:12:13', '2015-07-26 07:12:13', '2015-07-26 07:12:13', '770ff10a-6e17-4fe7-af3b-8207a2af55c5'),
(40, 2, 2, 'vectorstock_2856345.jpg', 'image', 3000, 2215, 342856, '2015-07-26 14:23:16', '2015-07-26 14:23:17', '2015-07-26 14:23:17', 'c40b9896-6a33-405f-9806-b343a6538032');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfolders`
--

CREATE TABLE IF NOT EXISTS `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `craft_assetfolders`
--

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Graphics', '', '2015-07-06 02:29:14', '2015-07-06 02:29:14', '281468b1-cf43-44f0-af42-0d87be261860'),
(2, NULL, 2, 'Photos', '', '2015-07-06 02:30:00', '2015-07-06 02:30:00', '97cd932d-a787-4270-b8a6-567dfeaae497');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE IF NOT EXISTS `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(11) NOT NULL,
  `offset` int(11) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetsources`
--

CREATE TABLE IF NOT EXISTS `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `craft_assetsources`
--

INSERT INTO `craft_assetsources` (`id`, `name`, `handle`, `type`, `settings`, `sortOrder`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Graphics', 'graphics', 'Local', '{"path":"{basePath}images\\/graphics\\/","url":"{baseUrl}images\\/graphics\\/"}', 1, 51, '2015-07-06 02:29:14', '2015-07-13 01:46:22', 'dec6aace-5d97-4a01-8b5f-28cf5788ccfb'),
(2, 'Photos', 'photos', 'Local', '{"path":"{basePath}images\\/photos\\/","url":"{baseUrl}images\\/photos\\/"}', 2, 52, '2015-07-06 02:30:00', '2015-07-13 01:46:27', '0cb42fe8-f876-4f85-a8c4-02746e1e5801');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE IF NOT EXISTS `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `craft_assettransformindex`
--

INSERT INTO `craft_assettransformindex` (`id`, `fileId`, `filename`, `format`, `location`, `sourceId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 36, 'DSC_0678sm.jpg', NULL, '_250x250_crop_center-center', 2, 1, 0, '2015-07-26 05:44:13', '2015-07-26 05:44:13', '2015-07-26 05:44:14', 'c6d634d5-e809-429e-9864-1bd144a83c4c'),
(2, 36, 'DSC_0678sm.jpg', NULL, '_250x250_crop_center-center_100', 2, 1, 0, '2015-07-26 05:44:59', '2015-07-26 05:44:59', '2015-07-26 05:45:00', '18268a4c-4df0-4e9f-b9d5-edd01e0bcb9f'),
(3, 36, 'DSC_0678sm.jpg', NULL, '_800x450_crop_center-center_100', 2, 1, 0, '2015-07-26 13:04:17', '2015-07-26 13:04:17', '2015-07-26 13:04:18', '7716b063-3b9b-4445-8f38-8e247851598e'),
(4, 36, 'DSC_0678sm.jpg', NULL, '_800x300_crop_center-center_100', 2, 1, 0, '2015-07-26 13:05:05', '2015-07-26 13:05:05', '2015-07-26 13:05:06', 'fecc8838-7003-450a-81b7-9326123e423f'),
(5, 36, 'DSC_0678sm.jpg', NULL, '_600x300_crop_center-center_100', 2, 1, 0, '2015-07-26 13:05:21', '2015-07-26 13:05:21', '2015-07-26 13:05:22', '8d2b1f96-8494-4798-86e8-57e1a11b82c5'),
(6, 36, 'DSC_0678sm.jpg', NULL, '_300x300_crop_center-center_100', 2, 1, 0, '2015-07-26 13:05:33', '2015-07-26 13:05:33', '2015-07-26 13:05:34', '27caa92c-988e-43b7-8cf8-00fe4e9ae974'),
(7, 40, 'vectorstock_2856345.jpg', NULL, '_800x450_crop_center-center_100', 2, 1, 0, '2015-07-26 14:23:27', '2015-07-26 14:23:27', '2015-07-26 14:23:29', '47a730d3-9930-4d4f-a7c0-a7a1ef604e0f'),
(8, 40, 'vectorstock_2856345.jpg', NULL, '_250x250_crop_center-center_100', 2, 1, 0, '2015-07-26 14:23:37', '2015-07-26 14:23:37', '2015-07-26 14:23:38', 'bd0766b9-da9d-4fd8-9bb2-ab3706e36bef');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE IF NOT EXISTS `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE IF NOT EXISTS `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE IF NOT EXISTS `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_i18n`
--

CREATE TABLE IF NOT EXISTS `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE IF NOT EXISTS `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_metaKeywords` text COLLATE utf8_unicode_ci,
  `field_metaDescription` text COLLATE utf8_unicode_ci,
  `field_metaTitle` text COLLATE utf8_unicode_ci,
  `field_metaTwitter` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_metaRobots` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_metaSection` text COLLATE utf8_unicode_ci,
  `field_summary` text COLLATE utf8_unicode_ci,
  `field_filterLimit` tinyint(3) unsigned DEFAULT '0',
  `field_filterOrderBy` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'postDate',
  `field_filterOrderDirection` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'desc',
  `field_showTitle` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_linkUrl` text COLLATE utf8_unicode_ci,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_color` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_metaKeywords`, `field_metaDescription`, `field_metaTitle`, `field_metaTwitter`, `field_metaRobots`, `field_metaSection`, `field_summary`, `field_filterLimit`, `field_filterOrderBy`, `field_filterOrderDirection`, `field_showTitle`, `field_linkUrl`, `field_body`, `field_color`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_au', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-06 01:51:01', '2015-07-21 09:08:50', 'a8ae5228-bcc2-4f5f-ad4f-bdd94914e4e9'),
(2, 2, 'en_au', 'Home', '', '', '', '', '', '', NULL, 0, 'postDate', 'desc', 0, NULL, '<h1>Hi, I''m Ben.</h1><h2>I''m a web developer that does many things.<br>Check out <a href="https://github.com/benjamminf" target="_blank">my work</a> or follow me <a href="https://twitter.com/benjfleming" target="_blank" aria-label="on Twitter">@benjfleming</a><br>Contact me through <a href="mailto:email@benf.co">email@benf.co</a></h2>', NULL, '2015-07-06 01:51:03', '2015-07-26 12:48:10', 'f75bd913-4b89-4dd5-a1c6-db8fb8d54b55'),
(5, 5, 'en_au', NULL, 'benf, benjamin fleming, web design, web development, hydro css, hydro framework, craft cms, craft plugins, web experiments', 'I am Ben, a web developer who authored the Hydro framework, and that specialises in front-end development and Craft CMS.', NULL, '@benjfleming', '[]', NULL, NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-06 03:39:51', '2015-07-24 04:23:55', 'b83a33c8-07a0-4870-8e8b-4578fb23508e'),
(13, 15, 'en_au', 'Hydro Framework', '', '', '', '', '', '', '', 0, 'postDate', 'desc', 1, 'http://hydroframework.com', NULL, NULL, '2015-07-21 09:45:44', '2015-07-24 05:42:54', '0f22d3de-dbd9-4b6a-bc87-f76160511fa0'),
(16, 18, 'en_au', 'social-image-blue', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 04:21:31', '2015-07-24 04:21:31', '562f8f2a-6c97-4579-9593-54483950e0d6'),
(17, 19, 'en_au', 'social-image-red', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 04:21:32', '2015-07-24 04:21:32', 'f497fd72-d4ee-4670-8746-f8c2c3d0d5b5'),
(18, 20, 'en_au', 'A site to call my own', '', '', '', '', '', '', 'You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.', 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 06:10:23', '2015-07-26 14:53:47', 'ae0fc377-5475-41f4-8ad3-e9598a313913'),
(19, 22, 'en_au', 'Craft', 'Craft CMS, Craft plugins, Craft Forms', 'Plugins and other resources for Craft CMS.', '', '', '', 'Craft CMS', NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 06:37:27', '2015-07-26 11:29:22', '5199624b-99df-49ea-ba61-d07e04ffaa21'),
(20, 23, 'en_au', 'Blog', 'ben fleming, web blog, developer blog, front-end blog, javascript blog, craft blog, sass blog', '', '', '', '', 'Blog', NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 06:54:52', '2015-07-26 11:38:36', '7ca9b126-906c-445f-a587-e78a4e48baa8'),
(21, 24, 'en_au', 'Forms', 'Craft CMS, Craft plugins, Craft Forms, form plugin, form builder, web form, contact form, subscribe form', 'A form building plugin for Craft CMS. Build complex forms for your website and manage their submissions all through the control panel.', '', '', '', 'Craft CMS', 'Build complex forms for your website and manage their submissions all through the control panel.', 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 07:04:28', '2015-07-26 11:31:26', 'afd00733-96ca-4990-aca2-5ccddb25a8f6'),
(22, 25, 'en_au', 'Emailer', '', '', '', '', '', '', 'Trigger emails to be sent ', 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 07:39:03', '2015-07-24 07:39:03', '3f544ad4-39d9-462b-9de1-cec3d4eb482e'),
(23, 26, 'en_au', 'Craft Plugins', NULL, NULL, NULL, NULL, '[]', NULL, '', 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 07:45:40', '2015-07-24 08:27:27', '11c0aa1f-05db-4394-b41c-b3be00b796bf'),
(24, 27, 'en_au', 'Blog', NULL, NULL, NULL, NULL, '[]', NULL, '', 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 07:45:57', '2015-07-24 07:45:57', '2d0904df-f13b-43c6-bd0d-46e81f064c4b'),
(27, 30, 'en_au', 'craft-forms-logo', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-24 09:22:27', '2015-07-24 09:23:31', '9a665b73-4336-43d4-bc33-ab38c4ca3dca'),
(28, 31, 'en_au', 'Craft', NULL, NULL, NULL, NULL, '[]', NULL, 'Craft is content management at its finest.', 0, 'postDate', 'desc', 0, 'http://buildwithcraft.com', NULL, '#da5a47', '2015-07-26 03:58:59', '2015-07-26 05:40:17', 'f89d46c5-e54c-4e78-ad20-1441f6d6881f'),
(29, 32, 'en_au', 'Hydro', NULL, NULL, NULL, NULL, '[]', NULL, 'A simple framework for building complex websites.', 0, 'postDate', 'desc', 0, 'http://hydroframework.com', NULL, '#62bce9', '2015-07-26 03:59:06', '2015-07-26 05:38:26', '94c02e8f-b5f1-4a23-9834-62502cf611ed'),
(30, 33, 'en_au', 'Sass', NULL, NULL, NULL, NULL, '[]', NULL, 'Sass is the most mature, stable, and powerful professional grade CSS extension language in the world.', 0, 'postDate', 'desc', 0, 'http://sass-lang.com', NULL, '#cf649a', '2015-07-26 03:59:10', '2015-07-26 05:38:11', '23f2f354-c9ed-4bef-a6b3-997ad5893965'),
(31, 34, 'en_au', 'Javascript', NULL, NULL, NULL, NULL, '[]', NULL, 'JavaScript is a cross-platform, object-oriented scripting language.', 0, 'postDate', 'desc', 0, 'http://javascript.com', NULL, '#000000', '2015-07-26 03:59:14', '2015-07-26 05:39:32', 'a1ff0de2-7990-4a06-9c6c-aaaca6218417'),
(33, 36, 'en_au', 'Benjamin Fleming', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-26 05:44:02', '2015-07-26 14:56:38', '99564826-cbf8-4e6c-87d2-3572f725bcb7'),
(34, 37, 'en_au', 'card-row-arrow', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-26 07:12:13', '2015-07-26 07:12:13', 'c99165dd-cb77-463f-a245-529a5949ad87'),
(35, 38, 'en_au', 'New Post', '', '', '', '', '', '', 'Another new post', 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-26 12:39:55', '2015-07-26 12:39:55', '68dd6628-7c3d-4e3a-89e1-521ca6e93310'),
(36, 40, 'en_au', 'Stock image of laptop', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 0, 'postDate', 'desc', 0, NULL, NULL, NULL, '2015-07-26 14:23:17', '2015-07-26 14:57:05', '8fa5b66c-f80b-4c82-a131-9474d3b87e66');

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE IF NOT EXISTS `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE IF NOT EXISTS `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'User', 1, 0, '2015-07-06 01:51:01', '2015-07-21 09:08:50', '37e58533-7270-4a1c-a736-d7acbb657149'),
(2, 'Entry', 1, 0, '2015-07-06 01:51:03', '2015-07-26 12:48:10', '2afad09d-d8f2-4376-a3e0-6c3eebdf194d'),
(5, 'GlobalSet', 1, 0, '2015-07-06 03:39:51', '2015-07-24 04:23:55', 'a5a3b308-c10f-4f4d-86c7-91917eaf5b72'),
(13, 'MatrixBlock', 1, 0, '2015-07-21 09:13:46', '2015-07-24 03:02:10', '4ed73eb8-3149-4071-b42f-8a21dddec387'),
(15, 'Entry', 1, 0, '2015-07-21 09:45:44', '2015-07-24 05:42:54', '623b3022-0a6b-4d70-aa10-a115f352e662'),
(18, 'Asset', 1, 0, '2015-07-24 04:21:31', '2015-07-24 04:21:31', '2095cf3a-81c1-4d0e-af65-3a7804f403af'),
(19, 'Asset', 1, 0, '2015-07-24 04:21:32', '2015-07-24 04:21:32', 'bc7dce4c-35c7-4686-a5ab-14b12101c9fe'),
(20, 'Entry', 1, 0, '2015-07-24 06:10:23', '2015-07-26 14:53:47', '7fcc90ff-85a0-45f1-a61e-54ab166cb3a5'),
(21, 'MatrixBlock', 1, 0, '2015-07-24 06:10:24', '2015-07-26 14:53:47', 'f9c9df5d-f567-4aee-b33f-6dd06e74da52'),
(22, 'Entry', 1, 0, '2015-07-24 06:37:27', '2015-07-26 11:29:22', '7450e435-06f6-454b-b667-6b39d700b18c'),
(23, 'Entry', 1, 0, '2015-07-24 06:54:52', '2015-07-26 11:38:36', 'd0966f06-3c21-4c62-bbf2-ec51310252b2'),
(24, 'Entry', 1, 0, '2015-07-24 07:04:28', '2015-07-26 11:31:26', 'ac478fcb-bce0-46e4-b713-6c9e48f01edc'),
(25, 'Entry', 1, 0, '2015-07-24 07:39:03', '2015-07-24 07:39:03', 'c06f2cc7-ae88-4e76-b6e5-bd602865aca3'),
(26, 'Entry', 1, 0, '2015-07-24 07:45:40', '2015-07-24 08:27:27', '5e95578d-218c-4c08-97bb-efdc31176c58'),
(27, 'Entry', 1, 0, '2015-07-24 07:45:57', '2015-07-24 07:45:57', '868fd9a1-1b8b-4698-940c-d02e3f21d3a8'),
(30, 'Asset', 1, 0, '2015-07-24 09:22:27', '2015-07-24 09:23:31', '4e02e85a-bbf9-4865-b2df-8063e059a7d6'),
(31, 'Tag', 1, 0, '2015-07-26 03:58:59', '2015-07-26 05:40:17', '7ba992bc-f395-4ab5-8b3a-8729073f5ef0'),
(32, 'Tag', 1, 0, '2015-07-26 03:59:06', '2015-07-26 05:38:26', '79f8e41e-5f56-490a-86fb-0d760503d5cf'),
(33, 'Tag', 1, 0, '2015-07-26 03:59:10', '2015-07-26 05:38:11', 'f07c0ccb-9458-4ba2-a3e7-e1ccbb016a9d'),
(34, 'Tag', 1, 0, '2015-07-26 03:59:14', '2015-07-26 05:39:32', '2b325af6-b6ca-495d-9fbd-794a83a3b1ee'),
(36, 'Asset', 1, 0, '2015-07-26 05:44:02', '2015-07-26 14:56:38', 'a6ce3ba1-056c-4dd7-a686-d584f3f9ef6c'),
(37, 'Asset', 1, 0, '2015-07-26 07:12:13', '2015-07-26 07:12:13', 'b63ed861-ce27-4025-b6d1-bc2d084e2d30'),
(38, 'Entry', 1, 0, '2015-07-26 12:39:55', '2015-07-26 12:39:55', '936ecb8e-2dcf-4d31-88d1-3d5dca192c08'),
(39, 'MatrixBlock', 1, 0, '2015-07-26 12:39:55', '2015-07-26 12:39:55', '1177609f-42e7-45bf-8cc7-ffb0608187ec'),
(40, 'Asset', 1, 0, '2015-07-26 14:23:17', '2015-07-26 14:57:05', '681caf36-04a1-442c-a8e4-fa0b3c2a1fcc');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_i18n`
--

CREATE TABLE IF NOT EXISTS `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `craft_elements_i18n`
--

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_au', '', NULL, 1, '2015-07-06 01:51:01', '2015-07-21 09:08:50', '43e43c45-23b1-4d9b-81dd-4763d45c6eb2'),
(2, 2, 'en_au', 'homepage', '__home__', 1, '2015-07-06 01:51:03', '2015-07-26 12:48:10', '6b07f66e-af73-430f-9e53-bcc239f86680'),
(5, 5, 'en_au', '', NULL, 1, '2015-07-06 03:39:51', '2015-07-24 04:23:55', '9a4591a8-54b6-4c88-ba45-3c138ccdeb77'),
(13, 13, 'en_au', '', NULL, 1, '2015-07-21 09:13:46', '2015-07-24 03:02:10', '44d20ce5-4160-4fd9-9918-444ab0ff4276'),
(15, 15, 'en_au', 'hydro', NULL, 1, '2015-07-21 09:45:44', '2015-07-24 05:42:54', '74b75b80-1a85-485b-add6-d42b861c52ac'),
(18, 18, 'en_au', 'social-image-blue', NULL, 1, '2015-07-24 04:21:32', '2015-07-24 04:21:32', 'c16918be-3ae8-44e8-bef8-034b02a0a301'),
(19, 19, 'en_au', 'social-image-red', NULL, 1, '2015-07-24 04:21:32', '2015-07-24 04:21:32', '38d1aeed-6a2a-4c06-8589-777acd0307cc'),
(20, 20, 'en_au', 'a-site-to-call-my-own', 'blog/a-site-to-call-my-own', 1, '2015-07-24 06:10:24', '2015-07-26 14:53:47', '4aa67613-548c-414c-b8a5-5f3611e1c075'),
(21, 21, 'en_au', '', NULL, 1, '2015-07-24 06:10:24', '2015-07-26 14:53:47', 'bc6e4f72-5c82-4a7e-89f6-7161fbf6a99a'),
(22, 22, 'en_au', 'craft', 'craft', 1, '2015-07-24 06:37:27', '2015-07-26 11:29:22', '8f4c587b-4152-4fe3-ae9f-3dd9c2da72dc'),
(23, 23, 'en_au', 'blog', 'blog', 1, '2015-07-24 06:54:52', '2015-07-26 11:38:36', '89887e67-d721-488c-a0ba-70072d3ed8f2'),
(24, 24, 'en_au', 'forms', 'craft/forms', 1, '2015-07-24 07:04:28', '2015-07-26 11:31:26', '1f262c06-d0b0-421d-a32a-2cea76a8561f'),
(25, 25, 'en_au', 'emailer', 'craft/emailer', 1, '2015-07-24 07:39:03', '2015-07-24 07:39:05', 'b7af3bae-8309-47b9-a00f-5e0501e01761'),
(26, 26, 'en_au', 'craft', NULL, 1, '2015-07-24 07:45:40', '2015-07-24 08:27:27', '9a942fcb-c85a-4edb-811f-2ff7317ef282'),
(27, 27, 'en_au', 'blog', NULL, 1, '2015-07-24 07:45:57', '2015-07-24 07:45:58', '32fceb16-40e9-4a57-a0c0-1c58a20845e6'),
(30, 30, 'en_au', 'craft-forms-logo', NULL, 1, '2015-07-24 09:22:27', '2015-07-24 09:23:31', '211036cb-6979-464d-8b21-4960b8d61c5f'),
(31, 31, 'en_au', 'craft', NULL, 1, '2015-07-26 03:59:00', '2015-07-26 05:40:17', '7f769642-0f2d-4b25-995f-20bda9c5b1c0'),
(32, 32, 'en_au', 'hydro', NULL, 1, '2015-07-26 03:59:06', '2015-07-26 05:38:26', '6faf5871-d653-4238-91c4-6c67740e2888'),
(33, 33, 'en_au', 'sass', NULL, 1, '2015-07-26 03:59:10', '2015-07-26 05:38:11', '7edabe99-9791-44ca-9b40-8f0beda37e6f'),
(34, 34, 'en_au', 'javascript', NULL, 1, '2015-07-26 03:59:14', '2015-07-26 05:39:32', 'e992e462-9251-44a5-bcd3-1985e9d3da48'),
(36, 36, 'en_au', 'dsc-0678sm', NULL, 1, '2015-07-26 05:44:02', '2015-07-26 14:56:38', '98b45c0f-f35e-4a18-a732-9804fc043f7c'),
(37, 37, 'en_au', 'card-row-arrow', NULL, 1, '2015-07-26 07:12:13', '2015-07-26 07:12:13', '31dd4c0e-ed3c-47f0-a422-b2425389f7dd'),
(38, 38, 'en_au', 'new-post', 'blog/new-post', 1, '2015-07-26 12:39:55', '2015-07-26 12:39:55', 'ae10bcd7-55a3-4767-aca5-3c4a0b009838'),
(39, 39, 'en_au', '', NULL, 1, '2015-07-26 12:39:55', '2015-07-26 12:39:55', '1caf254d-2216-4c26-a6bb-2d3ff2dc7d1e'),
(40, 40, 'en_au', 'vectorstock-2856345', NULL, 1, '2015-07-26 14:23:17', '2015-07-26 14:57:05', 'fae7544f-b0ac-44e0-9f7b-49efafac4313');

-- --------------------------------------------------------

--
-- Table structure for table `craft_emailmessages`
--

CREATE TABLE IF NOT EXISTS `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE IF NOT EXISTS `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, NULL, '2015-07-06 01:51:03', NULL, '2015-07-06 01:51:03', '2015-07-26 12:48:10', '99da9f1e-f489-4596-ba82-f4c3fd804518'),
(15, 4, 11, 1, '2015-07-21 09:45:00', NULL, '2015-07-21 09:45:44', '2015-07-24 05:42:01', '9d8ffe03-2d2e-4b57-a99a-60fd5db9b447'),
(20, 3, 3, 1, '2015-07-24 06:10:00', NULL, '2015-07-24 06:10:24', '2015-07-26 14:53:48', '3a6ba82c-cd3e-4d2d-8e58-a79cfb57a427'),
(22, 8, NULL, NULL, '2015-07-24 06:37:27', NULL, '2015-07-24 06:37:27', '2015-07-26 11:29:22', 'd8c01d40-7acf-4b27-bec2-0625c8fe6d1e'),
(23, 9, NULL, NULL, '2015-07-24 06:54:52', NULL, '2015-07-24 06:54:52', '2015-07-26 11:38:36', '4093886f-25c8-4525-a669-033918ebd592'),
(24, 7, 12, 1, '2015-07-24 07:04:00', NULL, '2015-07-24 07:04:28', '2015-07-26 11:31:26', '85b6c7c6-f315-4a80-a20c-bc1698d1f3a4'),
(25, 7, 12, 1, '2015-07-24 07:39:03', NULL, '2015-07-24 07:39:03', '2015-07-24 07:39:03', 'a1f6aae4-34e1-47dd-8ed7-21195c6a7a44'),
(26, 4, 10, 1, '2015-07-24 07:45:00', NULL, '2015-07-24 07:45:40', '2015-07-24 08:27:27', 'a521bef9-2214-488d-82d2-23bfa24d6998'),
(27, 4, 10, 1, '2015-07-24 07:45:57', NULL, '2015-07-24 07:45:57', '2015-07-24 07:45:57', 'e368507b-cf1e-48f9-b4f5-cd77626e54ba'),
(38, 3, 3, 1, '2015-07-26 12:39:55', NULL, '2015-07-26 12:39:55', '2015-07-26 12:39:55', '496968fa-7c6f-497c-b9b8-2f95f325339e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrydrafts`
--

CREATE TABLE IF NOT EXISTS `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE IF NOT EXISTS `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 95, 'Homepage', 'homepage', 1, 'Title', NULL, NULL, '2015-07-06 01:51:03', '2015-07-24 06:57:16', '3361063c-4808-4a28-b9b9-5a3278288434'),
(3, 3, 93, 'Blog Post', 'blogPost', 1, 'Title', NULL, NULL, '2015-07-06 03:19:03', '2015-07-24 06:56:47', '4d6d3cdf-a8db-4687-80f1-4024de10497f'),
(10, 4, 68, 'Internal Link', 'internalLink', 1, 'Title', NULL, NULL, '2015-07-13 06:44:55', '2015-07-13 06:45:09', '30cf4920-fdf8-4c06-b50b-e1a4ce541ade'),
(11, 4, 69, 'External Link', 'externalLink', 1, 'Title', NULL, NULL, '2015-07-13 06:45:33', '2015-07-13 06:45:33', 'f3e38ffe-d58f-43eb-8a51-d08d6d4070be'),
(12, 7, 97, 'Craft Plugin', 'craftPlugin', 1, 'Title', NULL, NULL, '2015-07-24 05:51:31', '2015-07-24 07:01:29', '252a7a33-a9a2-49ab-bcfc-cd0c47039e99'),
(13, 8, 91, 'Craft', 'craft', 1, 'Title', NULL, NULL, '2015-07-24 06:37:27', '2015-07-24 06:55:58', 'dc0fc53c-917e-4795-89ea-5eb424c14727'),
(14, 9, 98, 'Blog', 'blog', 0, NULL, '{section.name|raw}', NULL, '2015-07-24 06:54:52', '2015-07-24 07:02:15', 'f17fa303-fef6-4e93-9024-4c8bf8e1e8c2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entryversions`
--

CREATE TABLE IF NOT EXISTS `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=56 ;

--
-- Dumping data for table `craft_entryversions`
--

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `locale`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 1, 1, 'en_au', 1, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"1":"<p>A<\\/p>"}}', '2015-07-06 03:41:36', '2015-07-06 03:41:36', 'e1b2b7ec-5835-4547-984f-878eab6cf29f'),
(8, 2, 1, 1, 'en_au', 2, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"1":{"new1":{"type":"text","enabled":"1","fields":{"textContent":"<p>Hi, I''m Ben.<\\/p><p>I''m a web developer that does many things.<br>Check out my work or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/p>"}}},"27":"","12":"","8":"","10":"","7":"","13":"","9":"","26":"","11":""}}', '2015-07-21 09:13:47', '2015-07-21 09:13:47', '45b5b84d-4723-48ef-a62c-3ced9620567d'),
(9, 2, 1, 1, 'en_au', 3, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"1":{"13":{"type":"text","enabled":"1","fields":{"textContent":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out my work or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>"}}},"27":"","12":"","8":"","10":"","7":"","13":"","9":"","26":"","11":""}}', '2015-07-21 09:25:33', '2015-07-21 09:25:33', 'e6220079-38f7-45aa-9e33-20eab937379d'),
(12, 15, 4, 1, 'en_au', 1, '', '{"typeId":"4","authorId":"1","title":"Hydro Framework","slug":"hydro-framework","postDate":1437471944,"expiryDate":null,"enabled":1,"fields":{"1":"","27":"","29":"","12":"","8":"","38":"","10":"","7":"","13":"","55":"1","28":"","37":"","9":"","26":"","11":""}}', '2015-07-21 09:45:45', '2015-07-21 09:45:45', '37090305-46e0-412c-9690-8740882e9b88'),
(15, 15, 4, 1, 'en_au', 2, '', '{"typeId":"4","authorId":"1","title":"Hydro Framework","slug":"hydro","postDate":1437471900,"expiryDate":null,"enabled":1,"fields":{"1":"","27":"","29":"","12":"","8":"","38":"","10":"","7":"","13":"","55":"1","28":"","37":"","9":"","26":"","11":""}}', '2015-07-21 09:49:16', '2015-07-21 09:49:16', 'b46cc40d-6536-408f-983a-8575a9b91df0'),
(17, 2, 1, 1, 'en_au', 4, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"1":{"13":{"type":"text","enabled":"1","fields":{"textContent":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out my work or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\" aria-label=\\"on Twitter\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>"}}},"27":"","12":"","8":"","10":"","7":"","13":"","9":"","26":"","11":""}}', '2015-07-24 03:02:10', '2015-07-24 03:02:10', 'c0cc22ea-0127-48a4-830e-4193b8a9034f'),
(18, 2, 1, 1, 'en_au', 5, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"63":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out my work or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\" aria-label=\\"on Twitter\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>","27":"","12":"","8":"","10":"","7":"","13":"","9":"","26":"","11":""}}', '2015-07-24 03:23:43', '2015-07-24 03:23:43', 'de5ee132-6626-4d1d-a90e-b31145381a49'),
(19, 2, 1, 1, 'en_au', 6, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"63":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out my work or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\" aria-label=\\"on Twitter\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>","27":"","12":"","8":"","10":"","7":"test","13":"","9":"","26":"","11":""}}', '2015-07-24 03:47:34', '2015-07-24 03:47:34', 'dc5d87df-1fc0-4f47-be85-5b77071bddf2'),
(20, 2, 1, 1, 'en_au', 7, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"63":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out my work or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\" aria-label=\\"on Twitter\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>","27":"","12":"","8":"","10":"","7":"test","13":"","9":"","26":"","11":""}}', '2015-07-24 03:47:47', '2015-07-24 03:47:47', 'de59aac3-c4ce-4f88-8265-ff3ed2bd2f29'),
(21, 2, 1, 1, 'en_au', 8, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"63":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out my work or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\" aria-label=\\"on Twitter\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>","27":"","12":"","8":"","10":"","7":"","13":"","9":"","26":"","11":""}}', '2015-07-24 03:47:51', '2015-07-24 03:47:51', '3f7c1257-2c4a-4fd3-b8f1-4bc7103060ae'),
(22, 15, 4, 1, 'en_au', 3, '', '{"typeId":"11","authorId":"1","title":"Hydro Framework","slug":"hydro","postDate":1437471900,"expiryDate":null,"enabled":1,"fields":{"38":"","62":"http:\\/\\/hydroframework.com","37":""}}', '2015-07-24 05:42:01', '2015-07-24 05:42:01', '2d5d2ef0-0a08-4813-93b6-bdfc6e212902'),
(23, 20, 3, 1, 'en_au', 1, '', '{"typeId":null,"authorId":"1","title":"Blog Post","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"new1":{"type":"text","enabled":"1","fields":{"textContent":"<p>Test<\\/p>"}}},"12":"","8":"","38":"","10":"","7":"","13":"","37":"A test blog post","2":"","9":"","11":""}}', '2015-07-24 06:10:24', '2015-07-24 06:10:24', 'f33121c8-d704-46be-85f8-ec5725159955'),
(24, 24, 7, 1, 'en_au', 1, '', '{"typeId":null,"authorId":"1","title":"Forms","slug":"forms","postDate":1437721468,"expiryDate":null,"enabled":1,"fields":{"12":"","8":"","38":"","10":"","7":"","64":"","13":"","37":"Build complex forms for your website and manage their submissions all through the control panel.","9":"","11":""}}', '2015-07-24 07:04:29', '2015-07-24 07:04:29', '0695e442-1999-49d9-a305-6ee0746864bb'),
(25, 25, 7, 1, 'en_au', 1, '', '{"typeId":null,"authorId":"1","title":"Emailer","slug":"emailer","postDate":1437723543,"expiryDate":null,"enabled":1,"fields":{"12":"","8":"","38":"","10":"","7":"","64":"","13":"","37":"Trigger emails to be sent ","9":"","11":""}}', '2015-07-24 07:39:04', '2015-07-24 07:39:04', 'e86241e9-2003-444c-bde5-dff70246040a'),
(26, 24, 7, 1, 'en_au', 2, '', '{"typeId":"12","authorId":"1","title":"Forms","slug":"forms","postDate":1437721440,"expiryDate":null,"enabled":1,"fields":{"12":"","8":"","38":"","10":"","7":"","64":["28"],"13":"","37":"Build complex forms for your website and manage their submissions all through the control panel.","9":"","11":""}}', '2015-07-24 08:45:06', '2015-07-24 08:45:06', '3956ef43-25b8-458d-b150-1e084c8d8824'),
(27, 24, 7, 1, 'en_au', 3, '', '{"typeId":"12","authorId":"1","title":"Forms","slug":"forms","postDate":1437721440,"expiryDate":null,"enabled":1,"fields":{"12":"","8":"","38":"","10":"","7":"","64":["30"],"13":"","37":"Build complex forms for your website and manage their submissions all through the control panel.","9":"","11":""}}', '2015-07-24 09:23:33', '2015-07-24 09:23:33', '5ec98e5c-f97a-480c-9661-fffb5cefe62a'),
(28, 20, 3, 1, 'en_au', 2, '', '{"typeId":"3","authorId":"1","title":"Blog Post","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>Test<\\/p>"}}},"12":"","8":"","38":"","10":"","7":"","13":"","37":"A test blog post","2":["31","32","33","34"],"9":"","11":""}}', '2015-07-26 03:59:24', '2015-07-26 03:59:24', '3ba23dd8-0579-4ce4-a412-e95eb33c8b01'),
(29, 20, 3, 1, 'en_au', 3, '', '{"typeId":"3","authorId":"1","title":"Blog Post","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>Test<\\/p>"}}},"12":"","8":"","38":"","10":"","7":"","13":"","37":"A test blog post","2":["32","33","34"],"9":"","11":""}}', '2015-07-26 04:04:01', '2015-07-26 04:04:01', '54d1ddbb-0830-4780-a24c-71fae6629ca3'),
(30, 20, 3, 1, 'en_au', 4, '', '{"typeId":"3","authorId":"1","title":"Blog Post","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>Test<\\/p>"}}},"12":"","8":"","38":"","10":"","7":"","13":"","37":"A test blog post","2":["32","33","34","31"],"9":"","11":""}}', '2015-07-26 04:04:20', '2015-07-26 04:04:20', 'b81e3e64-1df1-4c6f-8fa9-5f6f649adad2'),
(31, 20, 3, 1, 'en_au', 5, '', '{"typeId":"3","authorId":"1","title":"Blog Post","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>Test<\\/p>"}}},"12":"","8":"","38":"","10":"","7":"","13":"","37":"A test blog post","2":["32","33","34","31"],"9":"","11":""}}', '2015-07-26 04:08:38', '2015-07-26 04:08:38', '28fc0b6f-fecc-49fc-a1b2-b0d07ba25da1'),
(32, 20, 3, 1, 'en_au', 6, '', '{"typeId":"3","authorId":"1","title":"Blog Post","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>Test<\\/p>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"A test blog post","2":["31","32","33","34"],"9":"","11":""}}', '2015-07-26 05:44:08', '2015-07-26 05:44:08', 'f6b581bf-112c-4035-8e2e-c8b0e9005104'),
(33, 24, 7, 1, 'en_au', 4, '', '{"typeId":"12","authorId":"1","title":"Forms","slug":"forms","postDate":1437721440,"expiryDate":null,"enabled":1,"fields":{"12":"","8":"A form building plugin for Craft CMS. Build complex forms for your website and manage their submissions all through the control panel.","38":"","10":"","7":"Craft CMS, Craft plugins, Craft Forms, form plugin, form builder, web form, contact form, subscribe form","64":["30"],"13":"Craft CMS","37":"Build complex forms for your website and manage their submissions all through the control panel.","9":"","11":""}}', '2015-07-26 11:31:26', '2015-07-26 11:31:26', '19cef5ae-da39-4549-9b71-0df757a4375b'),
(34, 2, 1, 1, 'en_au', 9, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"63":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out my <a href=\\"https:\\/\\/github.com\\/benjamminf\\" target=\\"_blank\\">GitHub<\\/a> or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\" aria-label=\\"on Twitter\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>","12":"","8":"","10":"","7":"","13":"","9":"","11":""}}', '2015-07-26 11:39:12', '2015-07-26 11:39:12', '3b8881b5-d7bc-404c-bd70-bedb0bfce80a'),
(35, 2, 1, 1, 'en_au', 10, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"63":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out <a href=\\"https:\\/\\/github.com\\/benjamminf\\" target=\\"_blank\\">my work<\\/a> or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\" aria-label=\\"on Twitter\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>","12":"","8":"","10":"","7":"","13":"","9":"","11":""}}', '2015-07-26 11:40:08', '2015-07-26 11:40:08', '100f96c3-ba8a-415a-b95c-3c2abd3d827f'),
(36, 20, 3, 1, 'en_au', 7, '', '{"typeId":"3","authorId":"1","title":"Blog Post","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>Test<\\/p>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"A test blog post","2":["31","32","33","34"],"9":"","11":""}}', '2015-07-26 11:45:09', '2015-07-26 11:45:09', '19226eee-5287-4917-962b-d59d543335db'),
(37, 38, 3, 1, 'en_au', 1, '', '{"typeId":null,"authorId":"1","title":"New Post","slug":"new-post","postDate":1437914395,"expiryDate":null,"enabled":1,"fields":{"1":{"new1":{"type":"text","enabled":"1","fields":{"textContent":"<p>Hey<\\/p>"}}},"12":"","8":"","38":"","10":"","7":"","13":"","37":"Another new post","2":"","9":"","11":""}}', '2015-07-26 12:39:55', '2015-07-26 12:39:55', '9e4e8735-5b07-409d-91ec-0d0be08c03f5'),
(38, 2, 1, 1, 'en_au', 11, '', '{"typeId":null,"authorId":null,"title":"Home","slug":"homepage","postDate":1436147463,"expiryDate":null,"enabled":1,"fields":{"63":"<h1>Hi, I''m Ben.<\\/h1><h2>I''m a web developer that does many things.<br>Check out <a href=\\"https:\\/\\/github.com\\/benjamminf\\" target=\\"_blank\\">my work<\\/a> or follow me <a href=\\"https:\\/\\/twitter.com\\/benjfleming\\" target=\\"_blank\\" aria-label=\\"on Twitter\\">@benjfleming<\\/a><br>Contact me through <a href=\\"mailto:email@benf.co\\">email@benf.co<\\/a><\\/h2>","12":"","8":"","10":"","7":"","13":"","9":"","11":""}}', '2015-07-26 12:48:10', '2015-07-26 12:48:10', 'fe7c5d27-77c5-43e9-b4e4-c9fcd04f5651'),
(39, 20, 3, 1, 'en_au', 8, '', '{"typeId":"3","authorId":"1","title":"My first personal website after 10 years in the industry","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>Test<\\/p>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"A test blog post","2":["31","32","33","34"],"9":"","11":""}}', '2015-07-26 13:36:29', '2015-07-26 13:36:29', '002bbb17-3c9c-4cef-9261-0c54cdac31ed'),
(40, 20, 3, 1, 'en_au', 9, '', '{"typeId":"3","authorId":"1","title":"My own website after 10 years in the industry","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends within the first decade. Apparently that is not the case. Anyway, being my first blog too, I''d thought I''d christen it by writing about my build process for this website. Why? Well, why not!<\\/p><h2>The front-end<\\/h2><p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:<\\/p><ul><li>Hydro CSS<\\/li><li>Vue.js<\\/li><li>jQuery<\\/li><li>RequireJS<\\/li><\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends\\u200b within the first decade. Apparently that is not the case.","2":["31","32","33","34"],"9":"","11":""}}', '2015-07-26 13:44:28', '2015-07-26 13:44:28', '03bd1d94-801d-43a0-81d3-350809db1050'),
(41, 20, 3, 1, 'en_au', 10, '', '{"typeId":"3","authorId":"1","title":"My own website after 10 years in the industry","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends within the first decade. Apparently that is not the case. Anyway, being my first blog too, I''d thought I''d christen it by writing about my build process for this website. Why? Well, why not!<\\/p><h2>The front-end<\\/h2><p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:<\\/p><ul><li>Hydro CSS<\\/li><li>Vue.js<\\/li><li>jQuery<\\/li><li>RequireJS<\\/li><\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends\\u200b within the first decade. Apparently that is not the case.","2":"","9":"","11":""}}', '2015-07-26 13:45:25', '2015-07-26 13:45:25', '8355f05e-ea32-47af-8197-9425b919f8c5'),
(42, 20, 3, 1, 'en_au', 11, '', '{"typeId":"3","authorId":"1","title":"My own website after 10 years in the industry","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends within the first decade. Apparently this is not the case. Anyway, being my first blog too, I''d thought I''d christen it by writing about my build process for this website. Why? Well, why not!<\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:<\\/p><ul><li>Hydro CSS<\\/li><li>Vue.js<\\/li><li>jQuery<\\/li><li>RequireJS<\\/li><\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends\\u200b within the first decade. Apparently this is not the case.","2":"","9":"","11":""}}', '2015-07-26 13:46:37', '2015-07-26 13:46:37', 'd0361959-36df-4d7f-93d3-236d6e4c7ea4'),
(43, 20, 3, 1, 'en_au', 12, '', '{"typeId":"3","authorId":"1","title":"My own site after 10 years in the industry","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends within the first decade. Apparently this is not the case. Anyway, being my first blog too, I''d thought I''d christen it by writing about my build process for this website. Why? Well, why not!<\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:<\\/p><ul><li>Hydro CSS<\\/li><li>Vue.js<\\/li><li>jQuery<\\/li><li>RequireJS<\\/li><\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends\\u200b within the first decade. Apparently this is not the case.","2":"","9":"","11":""}}', '2015-07-26 13:47:00', '2015-07-26 13:47:00', '159285eb-d976-45a9-bb27-5cac450e9b9e'),
(44, 20, 3, 1, 'en_au', 13, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends within the first decade. Apparently this is not the case. Anyway, being my first blog too, I''d thought I''d christen it by writing about my build process for this website. Why? Well, why not!<\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:<\\/p><ul><li>Hydro CSS<\\/li><li>Vue.js<\\/li><li>jQuery<\\/li><li>RequireJS<\\/li><\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website following latest design trends\\u200b within the first decade. Apparently this is not the case.","2":"","9":"","11":""}}', '2015-07-26 13:47:37', '2015-07-26 13:47:37', '7d79c296-7a85-4e2b-9772-6b716ac22282'),
(45, 20, 3, 1, 'en_au', 14, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently this is not the case. Anyway, being my first blog too, I''d thought I''d christen it by writing about my build process for this website. Why? Well, why not!<\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:<\\/p><ul><li>Hydro CSS<\\/li><li>Vue.js<\\/li><li>jQuery<\\/li><li>RequireJS<\\/li><\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently this is not the case.","2":"","9":"","11":""}}', '2015-07-26 13:48:28', '2015-07-26 13:48:28', '86024406-a47a-474b-afdf-4264764af5af'),
(46, 20, 3, 1, 'en_au', 15, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<p>Being my first blog too, I''d thought I''d christen it by writing about my build process for this website. Why? Well, why not!<\\/p><h2>The front-end<\\/h2><p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:<\\/p><ul><li>Hydro CSS<\\/li><li>Vue.js<\\/li><li>jQuery<\\/li><li>RequireJS<\\/li><\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not...","2":"","9":"","11":""}}', '2015-07-26 13:49:54', '2015-07-26 13:49:54', 'df51be4c-3652-4f07-a3e7-4c132bc2ad6e'),
(47, 20, 3, 1, 'en_au', 16, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, why not!<\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:<\\/p><ul><li>Hydro CSS<\\/li><li>Vue.js<\\/li><li>jQuery<\\/li><li>RequireJS<\\/li><\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":"","9":"","11":""}}', '2015-07-26 13:51:06', '2015-07-26 13:51:06', 'e6fca06f-66dd-4f38-b6a3-f42520943270'),
(48, 20, 3, 1, 'en_au', 17, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!<\\/em><\\/h3>\\r\\n<h2>The front-end<\\/h2>\\r\\n<p>This website is built on a pretty interesting stack. For the front-end, I''m using the following libraries, languages and tools:\\r\\n<\\/p>\\r\\n<ul>\\r\\n\\t<li>Hydro CSS<\\/li>\\r\\n\\t<li>Vue.js<\\/li>\\r\\n\\t<li>jQuery<\\/li>\\r\\n\\t<li>RequireJS<\\/li>\\r\\n<\\/ul>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":"","9":"","11":""}}', '2015-07-26 13:51:42', '2015-07-26 13:51:42', '8abf5aa6-0a9f-4851-96ee-4c4e6054f661'),
(49, 20, 3, 1, 'en_au', 18, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!<\\/em><\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting front-end stack. It might seem fairly overkill for what seems to be a relatively simple website, but there''s a very good reason for this. My processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code<em> very quickly <\\/em>- the last part being extremely important in this industry.<\\/p><p>There''s actually quite a bit involved, so I''ll separate it up into three sections: styling, scripting and markup.<\\/p><h3>Styling<\\/h3><p>I use the Sass language to produce my styles. Honestly, any web developer in 2015 <em>not <\\/em>using some kind of pre\\/post-processor for CSS is either insane or they''re just sadly unaware of them, in which case let me gladly give you a warm introduction!<\\/p><p>Despite the overwhelming majority of web developers going for Bootstrap or Foundation as a framework, I use a lesser-known but equally as powerful framework called Hydro CSS. You might notice the link to it in the header of this website. This is because I''m the developer of said framework! It''s not officially released, but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation. I''ve been building websites with it for nearly two years now, and so far so good.<\\/p><p>Hydro CSS along with Sass allows me to build extremely modular CSS. I only wrote roughly 10% of the styles for this site, and the other 90% were modules built in to the framework or some I had already written previously.<\\/p><h3>Scripting<\\/h3><p>Here''s where it gets interesting.<\\/p>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":"","9":"","11":""}}', '2015-07-26 14:14:09', '2015-07-26 14:14:09', '055b8ee6-ad53-4533-b31d-50d2cd32d33f'),
(50, 20, 3, 1, 'en_au', 19, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!<\\/em><\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting front-end stack. It might seem fairly overkill for what seems to be a relatively simple website, but there''s a very good reason for this. My processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code<em> very quickly <\\/em>- the last part being extremely important in this industry.<\\/p><p>There''s actually quite a bit involved, so I''ll separate it up into three sections: styling, scripting and markup.<\\/p><h3>Styling<\\/h3><p>I use the Sass language to produce my styles. Honestly, any web developer in 2015 <em>not <\\/em>using some kind of pre\\/post-processor for CSS is either insane or they''re just sadly unaware of them, in which case let me gladly give them a warm introduction!<\\/p><p>Despite the overwhelming majority of web developers going for Bootstrap or Foundation as a framework, I use a lesser-known but equally as powerful framework called Hydro CSS. You might notice the link to it in the header of this website. This is because I''m the developer of said framework! It''s not officially released, but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation. I''ve been building websites with it for nearly two years now, and so far so good.<\\/p><p>Hydro CSS along with Sass allows me to build extremely modular CSS. I only wrote roughly 10% of the styles for this site, and the other 90% were modules built in to the framework or some I had already written previously.<\\/p><h3>Scripting<\\/h3><p>Here''s where it gets interesting.<\\/p>"}}},"12":"","8":"","38":["36"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":"","9":"","11":""}}', '2015-07-26 14:15:30', '2015-07-26 14:15:30', '78d915d7-5df7-4589-befa-bec197d89b22'),
(51, 20, 3, 1, 'en_au', 20, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"blog-post","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!<\\/em><\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting front-end stack. It might seem fairly overkill for what seems to be a relatively simple website, but there''s a very good reason for this. My processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code<em> very quickly <\\/em>- the last part being extremely important in this industry.<\\/p><p>There''s actually quite a bit involved, so I''ll separate it up into three sections: styling, scripting and markup.<\\/p><h3>Styling<\\/h3><p>I use the Sass language to produce my styles. Honestly, any web developer in 2015 <em>not <\\/em>using some kind of pre\\/post-processor for CSS is either insane or they''re just sadly unaware of them, in which case let me gladly give them a warm introduction!<\\/p><p>Despite the overwhelming majority of web developers going for Bootstrap or Foundation as a framework, I use a lesser-known but equally as powerful framework called Hydro CSS. You might notice the link to it in the header of this website. This is because I''m the developer of said framework! It''s not officially released, but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation. I''ve been building websites with it for nearly two years now, and so far so good.<\\/p><p>Hydro CSS along with Sass allows me to build extremely modular CSS. I only wrote roughly 10% of the styles for this site, and the other 90% were modules built in to the framework or some I had already written previously.<\\/p><h3>Scripting<\\/h3><p>Here''s where it gets interesting.<\\/p>"}}},"12":"","8":"","38":["40"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":"","9":"","11":""}}', '2015-07-26 14:23:22', '2015-07-26 14:23:22', 'fbd252b5-5cf3-4f73-9b9d-aae07112f68c'),
(52, 20, 3, 1, 'en_au', 21, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"a-site-to-call-my-own","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!<\\/em><\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting front-end stack. It might seem fairly overkill for what seems to be a relatively simple website, but there''s a very good reason for this. My processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code<em> very quickly <\\/em>- the last part being extremely important in this industry.<\\/p><p>There''s actually quite a bit involved, so I''ll separate it up into three sections: styling, scripting and markup.<\\/p><h3>Styling<\\/h3><p>I use the Sass language to produce my styles. Honestly, any web developer in 2015 <em>not <\\/em>using some kind of pre\\/post-processor for CSS is either insane or they''re just sadly unaware of them, in which case let me gladly give them a warm introduction!<\\/p><p>Despite the overwhelming majority of web developers going for Bootstrap or Foundation as a framework, I use a lesser-known but equally as powerful framework called Hydro CSS. You might notice the link to it in the header of this website. This is because I''m the developer of said framework! It''s not officially released, but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation. I''ve been building websites with it for nearly two years now, and so far so good.<\\/p><p>Hydro CSS along with Sass allows me to build extremely modular CSS. I only wrote roughly 10% of the styles for this site, and the other 90% were modules built in to the framework or some I had already written previously.<\\/p><h3>Scripting<\\/h3><p>Here''s where it gets interesting.<\\/p>"}}},"12":"","8":"","38":["40"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":"","9":"","11":""}}', '2015-07-26 14:36:12', '2015-07-26 14:36:12', 'dd25e4be-6e98-48af-9ee2-b571719c7050'),
(53, 20, 3, 1, 'en_au', 22, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"a-site-to-call-my-own","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!<\\/em><\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting front-end stack. It might seem fairly overkill for what seems to be a relatively simple website, but there''s a very good reason for this. My processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code<em> very quickly <\\/em>- the last part being extremely important in this industry.<\\/p><p>There''s actually quite a bit involved, so I''ll separate it up into three sections: styling, scripting and markup.<\\/p><h3>Styling<\\/h3><p>I use the Sass language to produce my styles. Honestly, any web developer in 2015 <em>not <\\/em>using some kind of pre\\/post-processor for CSS is either insane or they''re just sadly unaware of them, in which case let me gladly give them a warm introduction!<\\/p><p>Despite the overwhelming majority of web developers going for Bootstrap or Foundation as a framework, I use a lesser-known but equally as powerful framework called Hydro CSS. You might notice the link to it in the header of this website. This is because I''m the developer of said framework! It''s not officially released, but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation. I''ve been building websites with it for nearly two years now, and so far so good.<\\/p><p>Hydro CSS along with Sass allows me to build extremely modular CSS. I only wrote roughly 10% of the styles for this site, and the other 90% were modules built in to the framework or some I had already written previously.<\\/p><h3>Scripting<\\/h3><p>Here''s where it gets interesting.<\\/p>"}}},"12":"","8":"","38":["40"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":["31"],"9":"","11":""}}', '2015-07-26 14:48:36', '2015-07-26 14:48:36', '64282b38-5eef-4521-ae62-f530df09eb12'),
(54, 20, 3, 1, 'en_au', 23, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"a-site-to-call-my-own","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!<\\/em><\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting front-end stack. It might seem fairly overkill for what seems to be a relatively simple website, but there''s a very good reason for this. My processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code<em> very quickly <\\/em>- the last part being extremely important in this industry.<\\/p><p>There''s actually quite a bit involved, so I''ll separate it up into three sections: styling, scripting and markup.<\\/p><h3>Styling<\\/h3><p>I use the Sass language to produce my styles. Honestly, any web developer in 2015 <em>not <\\/em>using some kind of pre\\/post-processor for CSS is either insane or they''re just sadly unaware of them, in which case let me gladly give them a warm introduction!<\\/p><p>Despite the overwhelming majority of web developers going for Bootstrap or Foundation as a framework, I use a lesser-known but equally as powerful framework called Hydro CSS. You might notice the link to it in the header of this website. This is because I''m the developer of said framework! It''s not officially released, but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation. I''ve been building websites with it for nearly two years now, and so far so good.<\\/p><p>Hydro CSS along with Sass allows me to build extremely modular CSS. I only wrote roughly 10% of the styles for this site, and the other 90% were modules built in to the framework or some I had already written previously.<\\/p><h3>Scripting<\\/h3><p>Here''s where it gets interesting.<\\/p>"}}},"12":"","8":"","38":["40"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":"","9":"","11":""}}', '2015-07-26 14:51:02', '2015-07-26 14:51:02', 'e508228a-c014-4ff9-b17c-8f3213cbe106'),
(55, 20, 3, 1, 'en_au', 24, '', '{"typeId":"3","authorId":"1","title":"A site to call my own","slug":"a-site-to-call-my-own","postDate":1437718200,"expiryDate":null,"enabled":1,"fields":{"1":{"21":{"type":"text","enabled":"1","fields":{"textContent":"<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!<\\/em><\\/h3><h2>The front-end<\\/h2><p>This website is built on a pretty interesting front-end stack. It might seem fairly overkill for what seems to be a relatively simple website, but there''s a very good reason for this. My processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code<em> very quickly <\\/em>- the last part being extremely important in this industry.<\\/p><p>There''s actually quite a bit involved, so I''ll separate it up into three sections: styling, scripting and markup.<\\/p><h3>Styling<\\/h3><p>I use the Sass language to produce my styles. Honestly, any web developer in 2015 <em>not <\\/em>using some kind of pre\\/post-processor for CSS is either insane or they''re just sadly unaware of them, in which case let me gladly give them a warm introduction!<\\/p><p>Despite the overwhelming majority of web developers going for Bootstrap or Foundation as a framework, I use a lesser-known but equally as powerful framework called Hydro CSS. You might notice the link to it in the header of this website. This is because I''m the developer of said framework! It''s not officially released, but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation. I''ve been building websites with it for nearly two years now, and so far so good.<\\/p><p>Hydro CSS along with Sass allows me to build extremely modular CSS. I only wrote roughly 10% of the styles for this site, and the other 90% were modules built in to the framework or some I had already written previously.<\\/p><h3>Scripting<\\/h3><p>Here''s where it gets interesting.<\\/p>"}}},"12":"","8":"","38":["40"],"10":"","7":"","13":"","37":"You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not.","2":"","9":"","11":""}}', '2015-07-26 14:53:48', '2015-07-26 14:53:48', '26a16533-2fc3-4a6a-abb1-d815915c1f41');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE IF NOT EXISTS `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Content', '2015-07-06 01:51:02', '2015-07-06 01:51:45', '8445ec4f-4c4a-4125-8eba-a23c09002eb5'),
(3, 'Metadata', '2015-07-06 02:35:28', '2015-07-06 02:35:28', 'b776c949-3b55-4096-8ecb-583a7ce751c6'),
(5, 'Assets', '2015-07-06 04:32:34', '2015-07-06 04:32:34', '5738df20-1e01-4b36-bc9a-f4986fc7f3bd'),
(9, 'Filters', '2015-07-06 11:19:06', '2015-07-06 11:19:06', '980505de-245f-4814-a52b-60d139ccd5cf'),
(15, 'Menu', '2015-07-13 02:51:23', '2015-07-13 02:51:23', '65a0df23-d1f9-4472-981e-77be1fb16b6a'),
(16, 'Blog', '2015-07-24 03:21:54', '2015-07-24 03:21:54', '09fb96b1-4f75-43b6-b116-698865c85e2a'),
(17, 'Craft', '2015-07-24 06:58:12', '2015-07-24 06:58:12', '7e8d3ed5-76a6-44ab-9d70-e0c376c96560'),
(18, 'Tags', '2015-07-26 04:00:56', '2015-07-26 04:00:56', 'cc0b9603-9872-4150-8149-0e3c58ee0cf5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE IF NOT EXISTS `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=525 ;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 5, 2, 1, 1, 1, '2015-07-06 01:51:03', '2015-07-06 01:51:03', 'dc589bb6-3309-4ddc-b7e2-846d44e69c9a'),
(3, 5, 2, 2, 0, 2, '2015-07-06 01:51:03', '2015-07-06 01:51:03', '65e4c166-2169-4379-b1ed-412efdd657d4'),
(197, 39, 52, 1, 0, 1, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '353632fb-67f1-4a57-8a81-261bbb707c69'),
(198, 39, 52, 2, 0, 2, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '73f60c20-4157-463f-8859-725cde5c6ab1'),
(199, 39, 53, 7, 0, 1, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '46b41ba9-1a70-4754-9f9e-17da0bdc44a5'),
(200, 39, 53, 8, 0, 2, '2015-07-06 05:35:16', '2015-07-06 05:35:16', 'd1faa7df-3388-4907-8ab2-311f7e03678a'),
(201, 39, 53, 13, 0, 3, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '89167a28-b73b-42fc-9c99-07717639bcd9'),
(202, 39, 53, 9, 0, 4, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '3b9c30c3-daf0-43d5-973c-5f54e20c570f'),
(203, 39, 53, 10, 0, 5, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '8d1cf5b4-f9ec-48c8-8d21-50ea80a49dde'),
(204, 39, 53, 11, 0, 6, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '0cda80d6-e842-4db7-a330-140d42a085a7'),
(205, 39, 53, 12, 0, 7, '2015-07-06 05:35:16', '2015-07-06 05:35:16', 'e96b143a-60fd-4e53-84d0-f864cabc112b'),
(285, 47, 73, 39, 0, 1, '2015-07-06 11:26:17', '2015-07-06 11:26:17', 'b3d37a7c-f839-4d50-9253-848e4ac4491c'),
(287, 47, 73, 41, 0, 3, '2015-07-06 11:26:17', '2015-07-06 11:26:17', '47e039aa-f32a-4fa1-8230-37a8298f1096'),
(288, 47, 73, 42, 0, 4, '2015-07-06 11:26:17', '2015-07-06 11:26:17', 'df098b21-d268-4382-b555-3c65d41471c9'),
(299, 51, 77, 25, 0, 1, '2015-07-13 01:46:22', '2015-07-13 01:46:22', '62e4d336-8914-42ef-86b7-986a082c4850'),
(358, 68, 95, 61, 1, 1, '2015-07-13 06:45:09', '2015-07-13 06:45:09', 'f33111c9-05d7-40f1-930f-9bb8af272271'),
(359, 68, 95, 37, 0, 2, '2015-07-13 06:45:09', '2015-07-13 06:45:09', '8146d0be-8638-4ffc-8c85-4a2b2b7a84a2'),
(360, 68, 95, 38, 0, 3, '2015-07-13 06:45:09', '2015-07-13 06:45:09', 'f07287a0-6275-42c5-b8ff-dcf92442e7c2'),
(361, 69, 96, 62, 1, 1, '2015-07-13 06:45:33', '2015-07-13 06:45:33', '576d250f-b4f9-4ffb-94f3-fa43b39bb8ca'),
(362, 69, 96, 37, 0, 2, '2015-07-13 06:45:33', '2015-07-13 06:45:33', 'a213405e-1378-4545-ac9e-19ef588897cb'),
(363, 69, 96, 38, 0, 3, '2015-07-13 06:45:33', '2015-07-13 06:45:33', 'd998e7ef-28d5-47f2-b0d0-47b39a745437'),
(395, 79, 106, 15, 1, 1, '2015-07-24 03:22:16', '2015-07-24 03:22:16', 'c54dc53a-fa55-4143-a7b3-27c43ac39e55'),
(396, 80, 107, 16, 1, 1, '2015-07-24 03:22:16', '2015-07-24 03:22:16', '1aec9e85-0128-4345-9246-ee6a5d962e9d'),
(397, 80, 107, 60, 0, 2, '2015-07-24 03:22:16', '2015-07-24 03:22:16', '50a9f70d-f603-4c6f-857f-324e5a6128e6'),
(398, 80, 107, 17, 0, 3, '2015-07-24 03:22:16', '2015-07-24 03:22:16', 'ff3ae80a-21b9-4d96-a5b6-3ddf137837d3'),
(399, 81, 108, 18, 1, 1, '2015-07-24 03:22:16', '2015-07-24 03:22:16', '41b8b990-52ac-4040-9dbc-47e7f457f051'),
(400, 81, 108, 20, 1, 2, '2015-07-24 03:22:16', '2015-07-24 03:22:16', '018c6e4a-1345-4813-98b1-d4e159374c06'),
(401, 81, 108, 21, 0, 3, '2015-07-24 03:22:16', '2015-07-24 03:22:16', 'bc223ae4-b1e2-4cc4-9784-4c342ec40af4'),
(402, 81, 108, 22, 0, 4, '2015-07-24 03:22:16', '2015-07-24 03:22:16', 'dfd10cbc-69e8-4879-8167-4d1c929a1a69'),
(403, 81, 108, 23, 0, 5, '2015-07-24 03:22:16', '2015-07-24 03:22:16', 'a27f25d0-06c1-40c8-be2e-901d9188ee20'),
(404, 81, 108, 24, 0, 6, '2015-07-24 03:22:16', '2015-07-24 03:22:16', '063ab0ed-3c84-41b9-98e8-32e669775302'),
(415, 83, 112, 7, 0, 1, '2015-07-24 04:09:32', '2015-07-24 04:09:32', '93d353d7-a81d-4455-931b-8f9b52c0dbd7'),
(416, 83, 112, 8, 0, 2, '2015-07-24 04:09:32', '2015-07-24 04:09:32', 'd6969734-8f93-4bfd-b32e-2cd2c69468ed'),
(417, 83, 112, 10, 0, 3, '2015-07-24 04:09:32', '2015-07-24 04:09:32', 'd9a6034f-4a48-44aa-94cb-d155c429d5ed'),
(418, 83, 112, 11, 0, 4, '2015-07-24 04:09:32', '2015-07-24 04:09:32', '7e13ceca-8f3a-4d08-ad0f-d3f8ce775ea3'),
(453, 91, 119, 7, 0, 1, '2015-07-24 06:55:58', '2015-07-24 06:55:58', '672f4ae2-9061-455b-b069-42eef7abc437'),
(454, 91, 119, 8, 0, 2, '2015-07-24 06:55:58', '2015-07-24 06:55:58', '0bfaba54-f8c6-4fb7-a32c-5a81a81a17a4'),
(455, 91, 119, 9, 0, 3, '2015-07-24 06:55:58', '2015-07-24 06:55:58', '0f640216-c59b-41c5-8f26-fe2ea04a8f29'),
(456, 91, 119, 13, 0, 4, '2015-07-24 06:55:58', '2015-07-24 06:55:58', '9c9104f2-da6b-4d67-9173-a8c831defbf8'),
(457, 91, 119, 10, 0, 5, '2015-07-24 06:55:58', '2015-07-24 06:55:58', '9b3eba1a-b90b-4c82-8b53-ce4fc038354d'),
(458, 91, 119, 11, 0, 6, '2015-07-24 06:55:58', '2015-07-24 06:55:58', '719cd304-b606-4f58-be35-fb3219e31f37'),
(459, 91, 119, 12, 0, 7, '2015-07-24 06:55:58', '2015-07-24 06:55:58', '1cc42df1-6009-4b4e-a1a1-55c01cea3db0'),
(467, 93, 121, 37, 1, 1, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '4a2f14b0-eff1-4ce2-81e8-327989a325db'),
(468, 93, 121, 38, 0, 2, '2015-07-24 06:56:47', '2015-07-24 06:56:47', 'a8099727-f06c-4cea-b331-d53d01d30968'),
(469, 93, 121, 1, 1, 3, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '9f611e5e-89e8-4ffe-a817-c289820acd66'),
(470, 93, 121, 2, 0, 4, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '3d52ba5b-8906-4670-914c-f630a7c52f6c'),
(471, 93, 122, 7, 0, 1, '2015-07-24 06:56:47', '2015-07-24 06:56:47', 'f008e237-605f-496d-9453-99aad99d56c0'),
(472, 93, 122, 8, 0, 2, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '2cc82a6a-6ca1-47b8-86f7-870fe25a60e4'),
(473, 93, 122, 9, 0, 3, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '3dc3350b-6dc0-457f-a75b-329285eef4c6'),
(474, 93, 122, 13, 0, 4, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '6b8b41cb-761e-4eee-a112-eb54bd720303'),
(475, 93, 122, 10, 0, 5, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '4b0d4b75-4440-4028-b14d-fcc374da6805'),
(476, 93, 122, 11, 0, 6, '2015-07-24 06:56:47', '2015-07-24 06:56:47', 'fa4abbb3-06ac-4783-8748-cda8b9ef3233'),
(477, 93, 122, 12, 0, 7, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '4f1890fa-0084-4320-aa13-85c63cd34e80'),
(485, 95, 124, 63, 1, 1, '2015-07-24 06:57:16', '2015-07-24 06:57:16', '15ba4fb8-0d52-45fb-9cc7-2e7aad5cb0dd'),
(486, 95, 125, 7, 0, 1, '2015-07-24 06:57:16', '2015-07-24 06:57:16', '9a8a2ab3-cf36-49a1-9d0f-76543bbab7a0'),
(487, 95, 125, 8, 0, 2, '2015-07-24 06:57:16', '2015-07-24 06:57:16', '7ee77d80-45b2-4dac-a8db-1b6388ba0208'),
(488, 95, 125, 9, 0, 3, '2015-07-24 06:57:16', '2015-07-24 06:57:16', '3d239460-acc1-4cc7-8e46-e41996f08d6e'),
(489, 95, 125, 13, 0, 4, '2015-07-24 06:57:16', '2015-07-24 06:57:16', '62fafd21-b973-4702-9191-cef72a28baca'),
(490, 95, 125, 10, 0, 5, '2015-07-24 06:57:16', '2015-07-24 06:57:16', 'cafdcc3b-a0ee-4fd9-b49d-989a7750de43'),
(491, 95, 125, 11, 0, 6, '2015-07-24 06:57:16', '2015-07-24 06:57:16', '89635a2f-e243-4e35-bd6c-caa7a5d7f9aa'),
(492, 95, 125, 12, 0, 7, '2015-07-24 06:57:16', '2015-07-24 06:57:16', '2d10801b-4480-46c8-a86a-27ba2bf0350a'),
(502, 97, 128, 37, 1, 1, '2015-07-24 07:01:29', '2015-07-24 07:01:29', 'f9f09637-8452-40b8-b83c-7ac2d26192ec'),
(503, 97, 128, 38, 0, 2, '2015-07-24 07:01:29', '2015-07-24 07:01:29', '71398410-4196-4b9a-b776-0838084a6630'),
(504, 97, 128, 64, 0, 3, '2015-07-24 07:01:29', '2015-07-24 07:01:29', '37d0c821-6fe6-4eea-bcca-64f058c857b8'),
(505, 97, 129, 7, 0, 1, '2015-07-24 07:01:29', '2015-07-24 07:01:29', '9ec92299-bf98-46e8-a404-e8fe8985919a'),
(506, 97, 129, 8, 0, 2, '2015-07-24 07:01:29', '2015-07-24 07:01:29', '6d2a044e-e2b2-49e0-8423-40d4995cc384'),
(507, 97, 129, 9, 0, 3, '2015-07-24 07:01:29', '2015-07-24 07:01:29', 'ba3d0597-1be4-4a62-bf05-686e586b39f0'),
(508, 97, 129, 13, 0, 4, '2015-07-24 07:01:29', '2015-07-24 07:01:29', '78a272d6-3150-4927-888c-5897c079a344'),
(509, 97, 129, 10, 0, 5, '2015-07-24 07:01:29', '2015-07-24 07:01:29', 'f5f8f6b1-91dd-4e99-bc94-3935f6114f1e'),
(510, 97, 129, 11, 0, 6, '2015-07-24 07:01:29', '2015-07-24 07:01:29', '4c29ded5-9d04-47d0-99b7-f375d91c5b2f'),
(511, 97, 129, 12, 0, 7, '2015-07-24 07:01:29', '2015-07-24 07:01:29', 'd13b2c55-564e-42f1-a5bc-3c277dc293c7'),
(512, 98, 130, 7, 0, 1, '2015-07-24 07:02:15', '2015-07-24 07:02:15', '389765e1-43cf-45b8-a1ca-f9e0980ec883'),
(513, 98, 130, 8, 0, 2, '2015-07-24 07:02:15', '2015-07-24 07:02:15', '99bb2de7-2634-4f6a-8282-00b462721b3d'),
(514, 98, 130, 9, 0, 3, '2015-07-24 07:02:15', '2015-07-24 07:02:15', '3ea36eae-6a73-4e7b-9323-e796259de15d'),
(515, 98, 130, 13, 0, 4, '2015-07-24 07:02:15', '2015-07-24 07:02:15', '5dd078d5-b883-404d-8e3c-9e8fdf88d499'),
(516, 98, 130, 10, 0, 5, '2015-07-24 07:02:15', '2015-07-24 07:02:15', '793743f1-d8e3-4f8c-b4f8-0ebe39ed9a15'),
(517, 98, 130, 11, 0, 6, '2015-07-24 07:02:15', '2015-07-24 07:02:15', 'd4b2c4a8-6ce4-4d8b-9bd5-85aa9b356de4'),
(518, 98, 130, 12, 0, 7, '2015-07-24 07:02:15', '2015-07-24 07:02:15', '89b7cdb2-e636-4b49-8159-21d2e0a7a8cb'),
(522, 101, 133, 65, 0, 1, '2015-07-26 05:35:49', '2015-07-26 05:35:49', 'e3e7c5fb-3719-4487-bd98-aa9bef63763b'),
(523, 101, 133, 62, 0, 2, '2015-07-26 05:35:49', '2015-07-26 05:35:49', 'a50c7625-eb55-4504-8055-43550ecf84a1'),
(524, 101, 133, 37, 0, 3, '2015-07-26 05:35:49', '2015-07-26 05:35:49', '382707ed-4fb6-4c2a-b93b-589102c2e3d0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE IF NOT EXISTS `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 'Entry', '2015-07-06 01:51:03', '2015-07-06 01:51:03', 'dd4c91ab-7e29-477a-92db-29e2e5ca897f'),
(39, 'Entry', '2015-07-06 05:35:16', '2015-07-06 05:35:16', '60d7e2bf-bd3b-44c6-b014-68f08a37e027'),
(47, 'Entry', '2015-07-06 11:26:17', '2015-07-06 11:26:17', 'ea27b655-49e9-4d91-ab02-9347ebc7217b'),
(51, 'Asset', '2015-07-13 01:46:22', '2015-07-13 01:46:22', '08ebbba1-bbcd-412d-b846-4be74227b4cc'),
(52, 'Asset', '2015-07-13 01:46:27', '2015-07-13 01:46:27', '5b9897f4-55e8-472c-94f7-877d1a72dd27'),
(55, 'Entry', '2015-07-13 02:40:02', '2015-07-13 02:40:02', 'a3960376-b2d3-41ee-9fb3-0fa370f7a760'),
(56, 'Entry', '2015-07-13 02:40:10', '2015-07-13 02:40:10', '80d72cb0-b422-4c16-a198-24a636faf138'),
(57, 'Entry', '2015-07-13 02:40:51', '2015-07-13 02:40:51', '3b2e0960-9e54-4460-a5d2-47f34e3aade1'),
(68, 'Entry', '2015-07-13 06:45:09', '2015-07-13 06:45:09', 'bceb76c3-1796-47f8-80ce-64af06539530'),
(69, 'Entry', '2015-07-13 06:45:33', '2015-07-13 06:45:33', 'd1092749-1b23-466e-84c0-a9e3e1130ef7'),
(79, 'MatrixBlock', '2015-07-24 03:22:15', '2015-07-24 03:22:15', '49c22eb4-7013-4331-866d-714716ee2cea'),
(80, 'MatrixBlock', '2015-07-24 03:22:16', '2015-07-24 03:22:16', '9d39d4d3-7b0b-4d08-965b-d1eccff75ed6'),
(81, 'MatrixBlock', '2015-07-24 03:22:16', '2015-07-24 03:22:16', 'ed39196f-ce1b-46b2-bb90-62a57b221c7c'),
(83, 'GlobalSet', '2015-07-24 04:09:32', '2015-07-24 04:09:32', 'a45105e4-babf-401d-9ad1-f6f315c3859d'),
(91, 'Entry', '2015-07-24 06:55:58', '2015-07-24 06:55:58', 'cd6f9edd-ca34-404a-ad30-9d30ae8fc44e'),
(93, 'Entry', '2015-07-24 06:56:47', '2015-07-24 06:56:47', '36cf21bc-f840-41ba-a1c6-7992dd8b2e4d'),
(95, 'Entry', '2015-07-24 06:57:16', '2015-07-24 06:57:16', '9f32cbe6-e3d2-4044-a731-7641dac96f23'),
(97, 'Entry', '2015-07-24 07:01:29', '2015-07-24 07:01:29', '744e4fb8-7c63-4f60-851e-f400e6d25509'),
(98, 'Entry', '2015-07-24 07:02:15', '2015-07-24 07:02:15', '7e464213-ee4d-4bc0-9e41-d47a0cb39426'),
(101, 'Tag', '2015-07-26 05:35:49', '2015-07-26 05:35:49', 'd92de4aa-1d0d-4b86-bc40-088da17b881a');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE IF NOT EXISTS `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=134 ;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 5, 'Content', 1, '2015-07-06 01:51:03', '2015-07-06 01:51:03', '62099478-1c04-42d5-8d6e-91bf35f60d82'),
(51, 39, 'Company', 1, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '84cc0234-8566-438f-9dcc-8b5a5738db9c'),
(52, 39, 'Content', 2, '2015-07-06 05:35:16', '2015-07-06 05:35:16', '7946a854-c11c-4f4e-8e8d-f6326ced6300'),
(53, 39, 'Metadata', 3, '2015-07-06 05:35:16', '2015-07-06 05:35:16', 'dc6a2512-fed7-461f-a657-f88d0ef2816f'),
(54, 39, 'Positions', 4, '2015-07-06 05:35:16', '2015-07-06 05:35:16', 'a41b8d14-9311-4400-947e-aa1dbe16fb2b'),
(73, 47, 'Filters', 1, '2015-07-06 11:26:17', '2015-07-06 11:26:17', '12d2eb22-816c-4777-9d6a-1cdbb6388d69'),
(77, 51, 'Content', 1, '2015-07-13 01:46:22', '2015-07-13 01:46:22', '0b124310-86d0-4252-a86f-06a04e6b225d'),
(80, 55, 'Carousel', 1, '2015-07-13 02:40:02', '2015-07-13 02:40:02', 'bbbe2244-43fd-49ca-b855-0e98e941ada8'),
(81, 56, 'Gallery', 1, '2015-07-13 02:40:10', '2015-07-13 02:40:10', '1b219a43-32da-4b60-92f7-b54c78d75491'),
(82, 57, 'Section', 1, '2015-07-13 02:40:51', '2015-07-13 02:40:51', '1048facf-e570-4607-baee-9e9f17a65784'),
(95, 68, 'Content', 1, '2015-07-13 06:45:09', '2015-07-13 06:45:09', '99a3cd9b-ed50-42bd-8e7a-f0989a028856'),
(96, 69, 'Content', 1, '2015-07-13 06:45:33', '2015-07-13 06:45:33', '0bbfe7a2-9d11-4d2a-810e-8fb8870e1edc'),
(106, 79, 'Content', 1, '2015-07-24 03:22:15', '2015-07-24 03:22:15', 'c30c6eb6-77ca-4a68-96cd-7d9bec7a0f88'),
(107, 80, 'Content', 1, '2015-07-24 03:22:16', '2015-07-24 03:22:16', '41b4df75-c41c-411a-9945-7b7b5548df10'),
(108, 81, 'Content', 1, '2015-07-24 03:22:16', '2015-07-24 03:22:16', '51f69811-ae07-47eb-85ee-e80f7320bdc1'),
(112, 83, 'Content', 1, '2015-07-24 04:09:32', '2015-07-24 04:09:32', 'b3eeff51-6362-4511-ad32-fca37003b069'),
(119, 91, 'Metadata', 1, '2015-07-24 06:55:58', '2015-07-24 06:55:58', 'a04c65fc-cfcc-4d5d-a74b-ef59a64b3e79'),
(121, 93, 'Content', 1, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '43cf2fad-7c6d-4911-84f2-2ee07bb58a2e'),
(122, 93, 'Metadata', 2, '2015-07-24 06:56:47', '2015-07-24 06:56:47', '2d363e8b-abd2-4adb-b3c2-f680534c98d0'),
(124, 95, 'Content', 1, '2015-07-24 06:57:16', '2015-07-24 06:57:16', '45b53a48-9bbb-4bf0-a2de-25f697883b25'),
(125, 95, 'Metadata', 2, '2015-07-24 06:57:16', '2015-07-24 06:57:16', 'a4e13ce1-ce80-4079-9668-251c6f402084'),
(128, 97, 'Content', 1, '2015-07-24 07:01:29', '2015-07-24 07:01:29', 'edc48a31-9a64-4505-9e8d-ba7fad4af8a6'),
(129, 97, 'Metadata', 2, '2015-07-24 07:01:29', '2015-07-24 07:01:29', '3b4a2e49-ac74-44bb-9f02-c1aaf3c0bdd5'),
(130, 98, 'Metadata', 1, '2015-07-24 07:02:15', '2015-07-24 07:02:15', '7ed90b1b-fb1e-44a4-a726-d76a529dc563'),
(133, 101, 'Content', 1, '2015-07-26 05:35:49', '2015-07-26 05:35:49', '226f86a9-ed5e-4b7e-b486-d23383fe5dfe');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE IF NOT EXISTS `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=66 ;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 16, 'Body', 'blogBody', 'global', '', 0, 'Matrix', '{"maxBlocks":null}', '2015-07-06 01:51:02', '2015-07-24 03:22:15', 'bf12aa80-7d62-4a6a-b899-b3109b8abe80'),
(2, 1, 'Tags', 'tags', 'global', NULL, 0, 'Tags', '{"source":"taggroup:1"}', '2015-07-06 01:51:03', '2015-07-06 01:51:03', 'f3051a7f-781c-4de2-9b4a-1d83bfc617cf'),
(7, 3, 'Keywords', 'metaKeywords', 'global', 'Key words and phrases separated by a comma.', 0, 'PlainText', '{"placeholder":"Company name, service, location...","maxLength":"","multiline":"","initialRows":"4"}', '2015-07-06 02:37:45', '2015-07-06 02:37:45', '2e2202e6-3587-44c0-8b3d-d510d05f3b18'),
(8, 3, 'Description', 'metaDescription', 'global', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"2"}', '2015-07-06 02:38:21', '2015-07-06 03:40:40', '91478836-bd93-4b3d-926e-55800bee0d18'),
(9, 3, 'Title', 'metaTitle', 'global', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2015-07-06 02:40:04', '2015-07-06 02:40:04', '1d4b723d-705b-412b-bdd1-024123ffea4b'),
(10, 3, 'Images', 'metaImages', 'global', 'These images will appear on social media websites.', 0, 'Assets', '{"useSingleFolder":"","sources":"*","defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"1","allowedKinds":["image"],"limit":"","selectionLabel":"Add images"}', '2015-07-06 03:00:21', '2015-07-06 03:00:21', '83398b83-2334-4cc2-a256-9b67fe06079e'),
(11, 3, 'Twitter', 'metaTwitter', 'global', 'The Twitter account handle that will be credited.', 0, 'PlainText', '{"placeholder":"@twitter","maxLength":"140","multiline":"","initialRows":"4"}', '2015-07-06 03:01:49', '2015-07-06 03:02:00', '1039b7f8-4879-41ba-b1c0-c70a9de95107'),
(12, 3, 'Crawling', 'metaRobots', 'global', 'How search engine bots will behave on this page', 0, 'Checkboxes', '{"options":[{"label":"Do not show this page in search results","value":"noindex","default":""},{"label":"Do not follow the links on this page","value":"nofollow","default":""},{"label":"Do not show a snippet in the search results for this page","value":"nosnippet","default":""},{"label":"Do not index images on this page","value":"noimageindex","default":""}]}', '2015-07-06 03:35:37', '2015-07-06 06:18:54', 'b4f7a6b3-d6ac-4de6-b23a-a88f169161d3'),
(13, 3, 'Section', 'metaSection', 'global', 'A section type that this entry belongs to.', 0, 'PlainText', '{"placeholder":"Blog","maxLength":"","multiline":"","initialRows":"4"}', '2015-07-06 03:50:34', '2015-07-06 03:50:34', '55f3684b-3fb8-48cd-a0a7-a701d3c26ec1'),
(15, NULL, 'Content', 'textContent', 'matrixBlockType:1', '', 0, 'RichText', '{"configFile":"","cleanupHtml":"","purifyHtml":"","columnType":"text"}', '2015-07-06 04:29:59', '2015-07-24 03:22:15', 'e6a7fc54-dba4-4088-89ce-43b70e0e2d7c'),
(16, NULL, 'File', 'imageFile', 'matrixBlockType:2', '', 0, 'Assets', '{"useSingleFolder":"","sources":"*","defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"1","allowedKinds":["image"],"limit":"1","selectionLabel":"Add an image"}', '2015-07-06 04:30:00', '2015-07-24 03:22:16', '9cfee930-5df3-4b5c-8e3a-6debf6705061'),
(17, NULL, 'Show Title?', 'imageShowTitle', 'matrixBlockType:2', '', 0, 'Lightswitch', '{"default":""}', '2015-07-06 04:30:00', '2015-07-24 03:22:16', '74b2c5f4-baf2-4db6-a601-9cde71adb600'),
(18, NULL, 'Label', 'buttonLabel', 'matrixBlockType:3', '', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2015-07-06 04:30:00', '2015-07-24 03:22:16', '3addd478-3bd5-4065-8b74-7e1cddfbfb9d'),
(20, NULL, 'URL', 'buttonUrl', 'matrixBlockType:3', 'If you''re linking to a page on this website, use the linked entry field above.', 0, 'PlainText', '{"placeholder":"http:\\/\\/","maxLength":"","multiline":"","initialRows":"4"}', '2015-07-06 04:30:00', '2015-07-24 03:22:16', '028b0652-a1ed-46a1-a438-77f80bc16fa1'),
(21, NULL, 'New Window?', 'buttonBlank', 'matrixBlockType:3', 'Should the link be opened in a new window?', 0, 'Lightswitch', '{"default":""}', '2015-07-06 04:30:01', '2015-07-24 03:22:16', '3a298570-fe47-4ffe-bdf5-71e4052e67ab'),
(22, NULL, 'Style', 'buttonStyle', 'matrixBlockType:3', '', 0, 'Dropdown', '{"options":[{"label":"Default","value":"button","default":"1"},{"label":"Accentuated","value":"button -accent","default":""},{"label":"Subtle","value":"button -subtle","default":""},{"label":"Link","value":"link","default":""}]}', '2015-07-06 04:30:01', '2015-07-24 03:22:16', '1d019184-e9ea-4377-ba25-0d5abf910ad4'),
(23, NULL, 'Icon', 'buttonIcon', 'matrixBlockType:3', '', 0, 'Dropdown', '{"options":[{"label":"None","value":"","default":"1"},{"label":"Arrow Left","value":"arrow-left4","default":""},{"label":"Arrow Right","value":"arrow-right4","default":""},{"label":"Arrow Up","value":"arrow-up4","default":""},{"label":"Arrow Down","value":"arrow-down4","default":""},{"label":"Facebook","value":"facebook","default":""},{"label":"Google+","value":"google","default":""},{"label":"Twitter","value":"twitter","default":""}]}', '2015-07-06 04:30:01', '2015-07-24 03:22:16', '162fba05-edda-4a6f-b242-f838a50acdd7'),
(24, NULL, 'Icon Position', 'buttonIconPosition', 'matrixBlockType:3', 'Which side of the button should the icon be positioned. A full position means that only the icon will show, whereas the label will not.', 0, 'PositionSelect', '{"options":["left","right","full"]}', '2015-07-06 04:30:01', '2015-07-24 03:22:16', 'f5159627-8451-4b39-9e80-e4d2a6844a6d'),
(25, 5, 'High Resolution', 'highres', 'global', 'A higher resolution version of this asset. If it''s an image, it should be twice the size of the original image.', 0, 'Assets', '{"useSingleFolder":"","sources":["folder:1"],"defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"highres","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"","limit":"1","selectionLabel":"Add an asset"}', '2015-07-06 04:34:28', '2015-07-06 04:34:28', '54c13907-0f78-4e72-b3bd-093e497285c6'),
(37, 1, 'Summary', 'summary', 'global', 'A summary paragraph of the content on this page.', 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"1","initialRows":"4"}', '2015-07-06 10:24:55', '2015-07-06 10:36:54', 'b02e6e47-adfb-4644-88ed-cd004fa8132d'),
(38, 1, 'Image', 'image', 'global', '', 0, 'Assets', '{"useSingleFolder":"","sources":["folder:2"],"defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"1","allowedKinds":["image"],"limit":"1","selectionLabel":"Add an image"}', '2015-07-06 10:41:03', '2015-07-06 10:41:03', '9a5b6323-e053-4fde-a25c-c29f05a5f6cd'),
(39, 9, 'Limit', 'filterLimit', 'global', 'Leave as zero for no limit.', 0, 'Number', '{"min":"0","max":"100","decimals":"0"}', '2015-07-06 11:20:06', '2015-07-24 03:06:29', '72837de4-46ee-48c6-a46f-25c96008701d'),
(41, 9, 'Order By', 'filterOrderBy', 'global', '', 0, 'Dropdown', '{"options":[{"label":"Publish Date","value":"postDate","default":"1"},{"label":"Expiry Date","value":"expiryDate","default":""},{"label":"Title","value":"title","default":""}]}', '2015-07-06 11:25:14', '2015-07-06 11:25:14', 'd05e22bc-6445-4ddc-ae32-e0e7bc9dc292'),
(42, 9, 'Order Direction', 'filterOrderDirection', 'global', '', 0, 'Dropdown', '{"options":[{"label":"Ascending","value":"asc","default":""},{"label":"Descending","value":"desc","default":"1"}]}', '2015-07-06 11:25:49', '2015-07-06 12:01:15', 'e6a3cdd7-a512-4a50-8657-c9268f1d780d'),
(55, 1, 'Show Title?', 'showTitle', 'global', '', 0, 'Lightswitch', '{"default":"1"}', '2015-07-13 02:38:52', '2015-07-13 02:38:52', 'a5272ac1-03b3-4fea-a4bd-3de3b0f38dbb'),
(60, NULL, 'Position', 'imagePosition', 'matrixBlockType:2', '', 0, 'PositionSelect', '{"options":["left","center","right"]}', '2015-07-13 06:02:21', '2015-07-24 03:22:16', '8be817bb-ef9b-4269-89db-9f905c18fddd'),
(61, 15, 'Link Entry', 'linkEntry', 'global', 'The entry to link to.', 0, 'Entries', '{"sources":["singles","section:6","section:3","section:4"],"limit":"1","selectionLabel":"Add an entry"}', '2015-07-13 06:43:34', '2015-07-13 06:43:34', 'cc3d7fab-6814-4a7f-992b-af46b5de8f31'),
(62, 15, 'Link URL', 'linkUrl', 'global', 'The URL to link to.', 0, 'PlainText', '{"placeholder":"http:\\/\\/","maxLength":"","multiline":"","initialRows":"4"}', '2015-07-13 06:43:48', '2015-07-13 06:43:48', 'e91c99e9-199a-4ab0-9f8c-eab66016f37b'),
(63, 1, 'Body', 'body', 'global', '', 0, 'RichText', '{"configFile":"","cleanupHtml":"","purifyHtml":"","columnType":"text"}', '2015-07-24 03:22:50', '2015-07-24 03:22:50', 'e33d42a7-e143-424b-bdac-f21d7cd6b339'),
(64, 1, 'Logo', 'logo', 'global', '', 0, 'Assets', '{"useSingleFolder":"","sources":["folder:1"],"defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"1","allowedKinds":["image"],"limit":"1","selectionLabel":"Add an image"}', '2015-07-24 07:00:51', '2015-07-24 08:45:23', '951a2add-f8f8-4b4d-96a2-f5093be42a00'),
(65, 18, 'Color', 'color', 'global', '', 0, 'Color', NULL, '2015-07-26 04:01:11', '2015-07-26 04:01:11', '9d437201-b74c-4738-96fe-a4f9854728ae');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE IF NOT EXISTS `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_globalsets`
--

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 'Metadata', 'metadata', 83, '2015-07-06 03:39:51', '2015-07-24 04:09:32', 'd9edaec9-1724-4ba3-885e-8c94f164e00e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE IF NOT EXISTS `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `releaseDate` datetime NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `build`, `schemaVersion`, `releaseDate`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `track`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '2.4', 2679, '2.4.0', '2015-07-22 18:18:40', 1, 'Benjamin Fleming', 'http://benf.co', 'Australia/Melbourne', 1, 0, 'stable', '2015-07-06 01:51:00', '2015-07-23 08:42:50', '74fc084f-d5a0-486f-86c2-b9e7bdd5ee98');

-- --------------------------------------------------------

--
-- Table structure for table `craft_locales`
--

CREATE TABLE IF NOT EXISTS `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_locales`
--

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
('en_au', 1, '2015-07-06 01:51:00', '2015-07-06 01:51:00', 'c33ca04e-f871-47ea-b451-14b08275b69c');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE IF NOT EXISTS `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixblocks`
--

INSERT INTO `craft_matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(13, 2, 1, 1, 1, NULL, '2015-07-21 09:13:46', '2015-07-24 03:02:10', '48045d6e-faca-47e2-b067-c95d28d310c3'),
(21, 20, 1, 1, 1, NULL, '2015-07-24 06:10:24', '2015-07-26 14:53:48', 'd53f9eab-7d9d-4086-aa4e-b77ce1d0ce75'),
(39, 38, 1, 1, 1, NULL, '2015-07-26 12:39:55', '2015-07-26 12:39:55', '8f2a7076-9ad6-4c05-9324-a4e12a00591a');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE IF NOT EXISTS `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `craft_matrixblocktypes`
--

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 79, 'Text', 'text', 1, '2015-07-06 04:29:59', '2015-07-24 03:22:16', 'a2e1c39c-a690-473b-b5eb-92ed88d5d320'),
(2, 1, 80, 'Image', 'image', 2, '2015-07-06 04:30:00', '2015-07-24 03:22:16', '0f9f8279-e971-4bed-a23d-f73fe3c3b45d'),
(3, 1, 81, 'Button', 'button', 3, '2015-07-06 04:30:00', '2015-07-24 03:22:16', '140d9892-7871-47b2-9b40-8bc78a6c3cdf');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_blogbody`
--

CREATE TABLE IF NOT EXISTS `craft_matrixcontent_blogbody` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_text_textContent` text COLLATE utf8_unicode_ci,
  `field_image_imageShowTitle` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_button_buttonLabel` text COLLATE utf8_unicode_ci,
  `field_button_buttonUrl` text COLLATE utf8_unicode_ci,
  `field_button_buttonBlank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_button_buttonStyle` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'button',
  `field_button_buttonIcon` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `field_button_buttonIconPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_image_imagePosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_blogbody_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_blogbody_locale_idx` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `craft_matrixcontent_blogbody`
--

INSERT INTO `craft_matrixcontent_blogbody` (`id`, `elementId`, `locale`, `field_text_textContent`, `field_image_imageShowTitle`, `field_button_buttonLabel`, `field_button_buttonUrl`, `field_button_buttonBlank`, `field_button_buttonStyle`, `field_button_buttonIcon`, `field_button_buttonIconPosition`, `field_image_imagePosition`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 13, 'en_au', '<h1>Hi, I''m Ben.</h1><h2>I''m a web developer that does many things.<br />Check out my work or follow me <a href="https://twitter.com/benjfleming" target="_blank">@benjfleming</a><br />Contact me through <a href="mailto:mailto:email@benf.co">email@benf.co</a></h2>', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2015-07-21 09:13:46', '2015-07-24 03:02:10', '5aacc6f5-5efa-476b-83ce-785886e10f59'),
(2, 21, 'en_au', '<h3>You''d think being a web developer by trade I''d have made my own pimped out website-following-latest-design-trends within the first decade as a professional. Apparently not. So, being my first blog as well, I''d thought I''d christen it by writing about my build process for this website. Why? Well, <em>why not!</em></h3><h2>The front-end</h2><p>This website is built on a pretty interesting front-end stack. It might seem fairly overkill for what seems to be a relatively simple website, but there''s a very good reason for this. My processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code<em> very quickly </em>- the last part being extremely important in this industry.</p><p>There''s actually quite a bit involved, so I''ll separate it up into three sections: styling, scripting and markup.</p><h3>Styling</h3><p>I use the Sass language to produce my styles. Honestly, any web developer in 2015 <em>not </em>using some kind of pre/post-processor for CSS is either insane or they''re just sadly unaware of them, in which case let me gladly give them a warm introduction!</p><p>Despite the overwhelming majority of web developers going for Bootstrap or Foundation as a framework, I use a lesser-known but equally as powerful framework called Hydro CSS. You might notice the link to it in the header of this website. This is because I''m the developer of said framework! It''s not officially released, but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation. I''ve been building websites with it for nearly two years now, and so far so good.</p><p>Hydro CSS along with Sass allows me to build extremely modular CSS. I only wrote roughly 10% of the styles for this site, and the other 90% were modules built in to the framework or some I had already written previously.</p><h3>Scripting</h3><p>Here''s where it gets interesting.</p>', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2015-07-24 06:10:24', '2015-07-26 14:53:47', '8cb02485-f08c-48d8-8ea1-912cb86365dd'),
(3, 39, 'en_au', '<p>Hey</p>', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2015-07-26 12:39:55', '2015-07-26 12:39:55', '7299d3f8-52ef-4833-931e-dc13c282e8ed');

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE IF NOT EXISTS `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'm000000_000000_base', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '821cd32b-5450-422d-abae-04002dc7eca5'),
(2, NULL, 'm140730_000001_add_filename_and_format_to_transformindex', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '96ad1593-5ebf-42fc-b4ef-1f6832b4af9c'),
(3, NULL, 'm140815_000001_add_format_to_transforms', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', 'e8d11881-a045-4eb8-a714-f47362b8f138'),
(4, NULL, 'm140822_000001_allow_more_than_128_items_per_field', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '0a9100c3-9f3d-44aa-8daf-0a6c2092e2d9'),
(5, NULL, 'm140829_000001_single_title_formats', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '278d43d9-a4d7-43ee-8d48-85f775dddd87'),
(6, NULL, 'm140831_000001_extended_cache_keys', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', 'e54ba9ca-3b4b-4998-b2fb-46066fd5cb7a'),
(7, NULL, 'm140922_000001_delete_orphaned_matrix_blocks', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', 'dbc447b7-2f07-4e86-85f3-b8d71aadd258'),
(8, NULL, 'm141008_000001_elements_index_tune', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '470cd9b2-9fe8-42a3-998e-1059fc69f1d8'),
(9, NULL, 'm141009_000001_assets_source_handle', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '4a44c28f-412c-46c9-977b-5386f9d4f83c'),
(10, NULL, 'm141024_000001_field_layout_tabs', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '15eeafd1-fd10-41cf-a995-64a9effceaab'),
(11, NULL, 'm141030_000001_drop_structure_move_permission', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '9f149cb2-c6a4-46d7-87b9-81aafc6bfbeb'),
(12, NULL, 'm141103_000001_tag_titles', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '287605e6-1860-4225-b947-1c0758040b8c'),
(13, NULL, 'm141109_000001_user_status_shuffle', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '0d22c20d-f70a-4f92-b226-94a108f21386'),
(14, NULL, 'm141126_000001_user_week_start_day', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', 'b28b5491-cccf-4226-a9f0-2f76390b74b4'),
(15, NULL, 'm150210_000001_adjust_user_photo_size', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '2015-07-06 01:51:00', '37963bc4-bbbe-4389-aa29-febf953cd77f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE IF NOT EXISTS `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `craft_plugins`
--

INSERT INTO `craft_plugins` (`id`, `class`, `version`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Sitemap', '0.9.0', 1, '{"sections":{"7":{"changefreq":"weekly","priority":"0.5"},"1":{"changefreq":"weekly","priority":"1.0"}}}', '2015-07-24 05:55:33', '2015-07-24 05:55:33', '2015-07-24 06:12:51', '59c26f13-0e92-4073-807d-5135b00a3cd9'),
(2, 'Dbug', '2.0', 1, NULL, '2015-07-24 05:56:53', '2015-07-24 05:56:53', '2015-07-24 11:28:05', 'f789d78f-b285-4912-8ab4-3bee8c59f76a'),
(3, 'Typogrify', '1.0', 1, NULL, '2015-07-24 05:56:57', '2015-07-24 05:56:57', '2015-07-24 05:56:57', '4c6f7636-ef11-4409-a8ee-3f75201aa43b'),
(4, 'Utilities', '1.0.0', 1, NULL, '2015-07-24 09:37:18', '2015-07-24 09:37:18', '2015-07-24 09:37:18', '14b98c01-3508-4467-a4e6-15d85f2cea04');

-- --------------------------------------------------------

--
-- Table structure for table `craft_rackspaceaccess`
--

CREATE TABLE IF NOT EXISTS `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE IF NOT EXISTS `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

--
-- Dumping data for table `craft_relations`
--

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceLocale`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 10, 5, NULL, 19, 1, '2015-07-24 04:23:55', '2015-07-24 04:23:55', 'cf553563-6931-47f4-b090-1c88088a09f6'),
(4, 10, 5, NULL, 18, 2, '2015-07-24 04:23:55', '2015-07-24 04:23:55', 'c8094861-eec6-4011-86d0-6ca596795ae7'),
(6, 61, 27, NULL, 23, 1, '2015-07-24 07:45:57', '2015-07-24 07:45:57', '2c6a9053-140c-4e7c-b568-5acb31eace61'),
(7, 61, 26, NULL, 22, 1, '2015-07-24 08:27:27', '2015-07-24 08:27:27', '5da834e5-09f3-4387-b0a0-c36d1f877c84'),
(31, 64, 24, NULL, 30, 1, '2015-07-26 11:31:26', '2015-07-26 11:31:26', '823feeed-edb7-4fd5-b28c-c997f75605c3'),
(62, 38, 20, NULL, 40, 1, '2015-07-26 14:53:47', '2015-07-26 14:53:47', '4fa52f00-5d8d-4521-b130-c73d2d6e2444');

-- --------------------------------------------------------

--
-- Table structure for table `craft_routes`
--

CREATE TABLE IF NOT EXISTS `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`),
  KEY `craft_routes_locale_idx` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE IF NOT EXISTS `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`) VALUES
(1, 'username', 0, 'en_au', ' ben '),
(1, 'firstname', 0, 'en_au', ' benjamin '),
(1, 'lastname', 0, 'en_au', ' fleming '),
(1, 'fullname', 0, 'en_au', ' benjamin fleming '),
(1, 'email', 0, 'en_au', ' benjfleming21 gmail com '),
(1, 'slug', 0, 'en_au', ''),
(2, 'slug', 0, 'en_au', ' homepage '),
(2, 'title', 0, 'en_au', ' home '),
(2, 'field', 1, 'en_au', ' hi i m ben i m a web developer that does many things check out my work or follow me benjflemingcontact me through email benf co '),
(25, 'field', 12, 'en_au', ''),
(5, 'field', 11, 'en_au', ' benjfleming '),
(5, 'field', 7, 'en_au', ' benf benjamin fleming web design web development hydro css hydro framework craft cms craft plugins web experiments '),
(5, 'field', 8, 'en_au', ' i am ben a web developer who authored the hydro framework and that specialises in front end development and craft cms '),
(5, 'slug', 0, 'en_au', ''),
(25, 'field', 11, 'en_au', ''),
(25, 'field', 10, 'en_au', ''),
(25, 'field', 13, 'en_au', ''),
(20, 'field', 37, 'en_au', ' you d think being a web developer by trade i d have made my own pimped out website following latest design trends within the first decade as a professional apparently not '),
(25, 'field', 9, 'en_au', ''),
(25, 'field', 64, 'en_au', ''),
(25, 'field', 38, 'en_au', ''),
(25, 'field', 8, 'en_au', ''),
(15, 'title', 0, 'en_au', ' hydro framework '),
(2, 'field', 63, 'en_au', ' hi i m ben i m a web developer that does many things check out my work or follow me benjflemingcontact me through email benf co '),
(15, 'slug', 0, 'en_au', ' hydro '),
(15, 'field', 12, 'en_au', ''),
(15, 'field', 11, 'en_au', ''),
(15, 'field', 10, 'en_au', ''),
(25, 'field', 37, 'en_au', ' trigger emails to be sent '),
(25, 'field', 7, 'en_au', ''),
(24, 'title', 0, 'en_au', ' forms '),
(24, 'slug', 0, 'en_au', ' forms '),
(24, 'field', 12, 'en_au', ''),
(24, 'field', 11, 'en_au', ''),
(24, 'field', 10, 'en_au', ''),
(24, 'field', 13, 'en_au', ' craft cms '),
(24, 'field', 9, 'en_au', ''),
(24, 'field', 64, 'en_au', ' craft forms logo '),
(20, 'field', 1, 'en_au', ' you d think being a web developer by trade i d have made my own pimped out website following latest design trends within the first decade as a professional apparently not so being my first blog as well i d thought i d christen it by writing about my build process for this website why well why not the front endthis website is built on a pretty interesting front end stack it might seem fairly overkill for what seems to be a relatively simple website but there s a very good reason for this my processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code very quickly the last part being extremely important in this industry there s actually quite a bit involved so i ll separate it up into three sections styling scripting and markup stylingi use the sass language to produce my styles honestly any web developer in 2015 not using some kind of pre post processor for css is either insane or they re just sadly unaware of them in which case let me gladly give them a warm introduction despite the overwhelming majority of web developers going for bootstrap or foundation as a framework i use a lesser known but equally as powerful framework called hydro css you might notice the link to it in the header of this website this is because i m the developer of said framework it s not officially released but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation i ve been building websites with it for nearly two years now and so far so good hydro css along with sass allows me to build extremely modular css i only wrote roughly 10% of the styles for this site and the other 90% were modules built in to the framework or some i had already written previously scriptinghere s where it gets interesting '),
(20, 'field', 8, 'en_au', ''),
(20, 'field', 38, 'en_au', ' vectorstock 2856345 '),
(20, 'field', 7, 'en_au', ''),
(2, 'field', 7, 'en_au', ''),
(2, 'field', 26, 'en_au', ''),
(2, 'field', 27, 'en_au', ''),
(2, 'field', 8, 'en_au', ''),
(2, 'field', 9, 'en_au', ''),
(2, 'field', 13, 'en_au', ''),
(2, 'field', 10, 'en_au', ''),
(2, 'field', 11, 'en_au', ''),
(2, 'field', 12, 'en_au', ''),
(13, 'field', 15, 'en_au', ' hi i m ben i m a web developer that does many things check out my work or follow me benjflemingcontact me through email benf co '),
(13, 'slug', 0, 'en_au', ''),
(15, 'field', 1, 'en_au', ''),
(15, 'field', 9, 'en_au', ''),
(15, 'field', 27, 'en_au', ''),
(15, 'field', 13, 'en_au', ''),
(15, 'field', 29, 'en_au', ''),
(15, 'field', 38, 'en_au', ''),
(15, 'field', 28, 'en_au', ''),
(15, 'field', 37, 'en_au', ''),
(15, 'field', 8, 'en_au', ''),
(15, 'field', 26, 'en_au', ''),
(15, 'field', 7, 'en_au', ''),
(15, 'field', 55, 'en_au', ' 1 '),
(24, 'field', 38, 'en_au', ''),
(24, 'field', 8, 'en_au', ' a form building plugin for craft cms build complex forms for your website and manage their submissions all through the control panel '),
(24, 'field', 37, 'en_au', ' build complex forms for your website and manage their submissions all through the control panel '),
(24, 'field', 7, 'en_au', ' craft cms craft plugins craft forms form plugin form builder web form contact form subscribe form '),
(23, 'title', 0, 'en_au', ' blog '),
(23, 'slug', 0, 'en_au', ' blog '),
(22, 'title', 0, 'en_au', ' craft '),
(22, 'slug', 0, 'en_au', ' craft '),
(21, 'slug', 0, 'en_au', ''),
(21, 'field', 15, 'en_au', ' you d think being a web developer by trade i d have made my own pimped out website following latest design trends within the first decade as a professional apparently not so being my first blog as well i d thought i d christen it by writing about my build process for this website why well why not the front endthis website is built on a pretty interesting front end stack it might seem fairly overkill for what seems to be a relatively simple website but there s a very good reason for this my processes have been gradually crafted and tools carefully chosen over the years to allow me to produce highly modular and squeaky clean code very quickly the last part being extremely important in this industry there s actually quite a bit involved so i ll separate it up into three sections styling scripting and markup stylingi use the sass language to produce my styles honestly any web developer in 2015 not using some kind of pre post processor for css is either insane or they re just sadly unaware of them in which case let me gladly give them a warm introduction despite the overwhelming majority of web developers going for bootstrap or foundation as a framework i use a lesser known but equally as powerful framework called hydro css you might notice the link to it in the header of this website this is because i m the developer of said framework it s not officially released but essentially the only thing holding it back from a proper release is my laziness when it comes to writing documentation i ve been building websites with it for nearly two years now and so far so good hydro css along with sass allows me to build extremely modular css i only wrote roughly 10% of the styles for this site and the other 90% were modules built in to the framework or some i had already written previously scriptinghere s where it gets interesting '),
(20, 'title', 0, 'en_au', ' a site to call my own '),
(20, 'slug', 0, 'en_au', ' a site to call my own '),
(20, 'field', 12, 'en_au', ''),
(20, 'field', 11, 'en_au', ''),
(20, 'field', 10, 'en_au', ''),
(20, 'field', 2, 'en_au', ''),
(20, 'field', 13, 'en_au', ''),
(20, 'field', 9, 'en_au', ''),
(5, 'field', 10, 'en_au', ' social image red social image blue '),
(18, 'field', 25, 'en_au', ''),
(18, 'filename', 0, 'en_au', ' social image blue jpg '),
(18, 'extension', 0, 'en_au', ' jpg '),
(18, 'kind', 0, 'en_au', ' image '),
(18, 'slug', 0, 'en_au', ''),
(18, 'title', 0, 'en_au', ' social image blue '),
(19, 'field', 25, 'en_au', ''),
(19, 'filename', 0, 'en_au', ' social image red jpg '),
(19, 'extension', 0, 'en_au', ' jpg '),
(19, 'kind', 0, 'en_au', ' image '),
(19, 'slug', 0, 'en_au', ''),
(19, 'title', 0, 'en_au', ' social image red '),
(15, 'field', 62, 'en_au', ' http hydroframework com '),
(25, 'slug', 0, 'en_au', ' emailer '),
(25, 'title', 0, 'en_au', ' emailer '),
(22, 'field', 7, 'en_au', ' craft cms craft plugins craft forms '),
(22, 'field', 8, 'en_au', ' plugins and other resources for craft cms '),
(22, 'field', 9, 'en_au', ''),
(22, 'field', 13, 'en_au', ' craft cms '),
(22, 'field', 10, 'en_au', ''),
(22, 'field', 11, 'en_au', ''),
(22, 'field', 12, 'en_au', ''),
(26, 'field', 61, 'en_au', ' craft plugins '),
(26, 'field', 37, 'en_au', ''),
(26, 'field', 38, 'en_au', ''),
(26, 'slug', 0, 'en_au', ' craft '),
(26, 'title', 0, 'en_au', ' craft plugins '),
(27, 'field', 61, 'en_au', ' blog '),
(27, 'field', 37, 'en_au', ''),
(27, 'field', 38, 'en_au', ''),
(27, 'slug', 0, 'en_au', ' blog '),
(27, 'title', 0, 'en_au', ' blog '),
(34, 'title', 0, 'en_au', ' javascript '),
(34, 'name', 0, 'en_au', ' javascript '),
(34, 'slug', 0, 'en_au', ' javascript '),
(33, 'title', 0, 'en_au', ' sass '),
(33, 'slug', 0, 'en_au', ' sass '),
(33, 'name', 0, 'en_au', ' sass '),
(32, 'slug', 0, 'en_au', ' hydro '),
(32, 'title', 0, 'en_au', ' hydro '),
(32, 'name', 0, 'en_au', ' hydro '),
(31, 'name', 0, 'en_au', ' craft '),
(31, 'slug', 0, 'en_au', ' craft '),
(31, 'title', 0, 'en_au', ' craft '),
(30, 'field', 25, 'en_au', ''),
(30, 'filename', 0, 'en_au', ' craft forms logo svg '),
(30, 'extension', 0, 'en_au', ' svg '),
(30, 'kind', 0, 'en_au', ' image '),
(30, 'slug', 0, 'en_au', ' craft forms logo '),
(30, 'title', 0, 'en_au', ' craft forms logo '),
(31, 'field', 65, 'en_au', ' da5a47 '),
(35, 'field', 65, 'en_au', ''),
(35, 'name', 0, 'en_au', ' craft '),
(35, 'slug', 0, 'en_au', ''),
(35, 'title', 0, 'en_au', ' craft '),
(32, 'field', 65, 'en_au', ' 62bce9 '),
(33, 'field', 65, 'en_au', ' cf649a '),
(32, 'field', 62, 'en_au', ' http hydroframework com '),
(32, 'field', 37, 'en_au', ' a simple framework for building complex websites '),
(34, 'field', 65, 'en_au', ' 000000 '),
(34, 'field', 62, 'en_au', ' http javascript com '),
(34, 'field', 37, 'en_au', ' javascript is a cross platform object oriented scripting language '),
(33, 'field', 62, 'en_au', ' http sass lang com '),
(33, 'field', 37, 'en_au', ' sass is the most mature stable and powerful professional grade css extension language in the world '),
(31, 'field', 62, 'en_au', ' http buildwithcraft com '),
(31, 'field', 37, 'en_au', ' craft is content management at its finest '),
(36, 'filename', 0, 'en_au', ' dsc_0678sm jpg '),
(36, 'extension', 0, 'en_au', ' jpg '),
(36, 'kind', 0, 'en_au', ' image '),
(36, 'slug', 0, 'en_au', ' dsc 0678sm '),
(36, 'title', 0, 'en_au', ' benjamin fleming '),
(37, 'field', 25, 'en_au', ''),
(37, 'filename', 0, 'en_au', ' card row arrow svg '),
(37, 'extension', 0, 'en_au', ' svg '),
(37, 'kind', 0, 'en_au', ' image '),
(37, 'slug', 0, 'en_au', ''),
(37, 'title', 0, 'en_au', ' card row arrow '),
(23, 'field', 7, 'en_au', ' ben fleming web blog developer blog front end blog javascript blog craft blog sass blog '),
(23, 'field', 8, 'en_au', ''),
(23, 'field', 9, 'en_au', ''),
(23, 'field', 13, 'en_au', ' blog '),
(23, 'field', 10, 'en_au', ''),
(23, 'field', 11, 'en_au', ''),
(23, 'field', 12, 'en_au', ''),
(38, 'field', 37, 'en_au', ' another new post '),
(38, 'field', 7, 'en_au', ''),
(38, 'field', 38, 'en_au', ''),
(38, 'field', 8, 'en_au', ''),
(38, 'field', 1, 'en_au', ' hey '),
(38, 'field', 9, 'en_au', ''),
(38, 'field', 13, 'en_au', ''),
(38, 'field', 2, 'en_au', ''),
(38, 'field', 10, 'en_au', ''),
(38, 'field', 11, 'en_au', ''),
(38, 'field', 12, 'en_au', ''),
(38, 'slug', 0, 'en_au', ' new post '),
(38, 'title', 0, 'en_au', ' new post '),
(39, 'field', 15, 'en_au', ' hey '),
(39, 'slug', 0, 'en_au', ''),
(40, 'filename', 0, 'en_au', ' vectorstock_2856345 jpg '),
(40, 'extension', 0, 'en_au', ' jpg '),
(40, 'kind', 0, 'en_au', ' image '),
(40, 'slug', 0, 'en_au', ' vectorstock 2856345 '),
(40, 'title', 0, 'en_au', ' stock image of laptop ');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE IF NOT EXISTS `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'Homepage', 'homepage', 'single', 1, 'index', 1, '2015-07-06 01:51:03', '2015-07-06 01:51:03', 'fc22fb04-71ee-4513-8843-e63933aaf698'),
(3, NULL, 'Blog Posts', 'blogPosts', 'channel', 1, '_pagetypes/blog-post', 1, '2015-07-06 03:19:03', '2015-07-24 06:54:30', '84925853-8224-4495-be29-7deb9d9b8690'),
(4, 1, 'Navigation', 'navigation', 'structure', 0, NULL, 0, '2015-07-06 03:45:39', '2015-07-24 05:42:52', '7ce4a6b4-a82b-4961-86d3-5243afa34a56'),
(7, 2, 'Craft Plugins', 'craftPlugins', 'structure', 1, '_pagetypes/craft-plugin', 1, '2015-07-24 05:51:31', '2015-07-24 06:54:37', '9aef9ed8-7751-47c9-8d82-a502682d8d98'),
(8, NULL, 'Craft', 'craft', 'single', 1, 'craft', 0, '2015-07-24 06:37:27', '2015-07-24 06:37:27', 'd9ad1a61-ca67-4907-b3e1-75f6cf685524'),
(9, NULL, 'Blog', 'blog', 'single', 1, 'blog', 0, '2015-07-24 06:54:52', '2015-07-24 06:54:52', '59f29acc-84ed-4c7e-a2cf-bd97c4fb9ea2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_i18n`
--

CREATE TABLE IF NOT EXISTS `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `craft_sections_i18n`
--

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_au', 1, '__home__', NULL, '2015-07-06 01:51:03', '2015-07-06 01:51:03', '2341d9f2-4a0a-4170-b20b-b085aeb59219'),
(3, 3, 'en_au', 0, 'blog/{slug}', NULL, '2015-07-06 03:19:03', '2015-07-24 05:51:56', 'f17c9cf8-bede-4e0e-a165-c5cce394aae0'),
(4, 4, 'en_au', 0, NULL, NULL, '2015-07-06 03:45:39', '2015-07-24 05:42:52', 'f3d6cc78-a5ef-4aeb-8e05-150e837c21ae'),
(7, 7, 'en_au', 0, 'craft/{slug}', NULL, '2015-07-24 05:51:31', '2015-07-24 06:54:03', 'eb7413a6-8607-4a63-ab6f-a649816451e9'),
(8, 8, 'en_au', 0, 'craft', NULL, '2015-07-24 06:37:27', '2015-07-24 06:37:27', 'c0a8438f-2784-49c0-8328-646598c87ea1'),
(9, 9, 'en_au', 0, 'blog', NULL, '2015-07-24 06:54:52', '2015-07-24 06:54:52', 'c76fb2be-175a-4f34-aafb-19776a0d6612');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE IF NOT EXISTS `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '4a88a326137c855fbe39e9516ef52366f069ccecczozMjoiX3NvRjZKR0xEWUhCMWdfX3lYM3RwczNIZndMNFdxMnUiOw==', '2015-07-21 09:04:47', '2015-07-21 09:04:47', '1c76a566-e756-4901-9655-69c9c55f5cf4'),
(2, 1, '440849b1bd0178a8c34288fbaa59c3f9ba3f3048czozMjoiWExGRXJXYlB3Vlc0ZExTajNXQk4ybkpVN241dnVlbngiOw==', '2015-07-23 08:35:57', '2015-07-23 08:35:57', 'd4ede5f9-8f19-4553-bd09-1ebeb4c943e8');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE IF NOT EXISTS `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE IF NOT EXISTS `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `craft_structureelements`
--

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 8, 0, '2015-07-06 06:50:10', '2015-07-06 06:50:10', 'b910d931-0d39-4a7b-8d41-9f07ef4f694c'),
(6, 1, 15, 1, 2, 3, 1, '2015-07-21 09:45:44', '2015-07-21 09:45:44', '2a98162c-6ba5-419e-9710-43292c34d4b0'),
(9, 2, NULL, 9, 1, 6, 0, '2015-07-24 07:04:29', '2015-07-24 07:04:29', '930b985a-e35b-4560-aa00-3ed28aab2c85'),
(10, 2, 24, 9, 2, 3, 1, '2015-07-24 07:04:29', '2015-07-24 07:04:29', '3bfbbe09-406e-442e-a22a-b507f867b5b2'),
(11, 2, 25, 9, 4, 5, 1, '2015-07-24 07:39:04', '2015-07-24 07:39:04', '8de037b5-0a9a-48e0-aec7-910a6efa1659'),
(12, 1, 26, 1, 4, 5, 1, '2015-07-24 07:45:40', '2015-07-24 07:45:40', '5eadfa37-113b-4888-a2fe-f395a47916ca'),
(13, 1, 27, 1, 6, 7, 1, '2015-07-24 07:45:57', '2015-07-24 07:45:57', 'b8cc9e4a-5877-4a0e-845c-f963394a195b');

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE IF NOT EXISTS `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `craft_structures`
--

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, '2015-07-06 03:45:39', '2015-07-24 05:42:52', '676b257f-ed55-477b-ab95-b3a759298145'),
(2, 1, '2015-07-24 05:51:31', '2015-07-24 06:54:37', 'c7b1ecba-f48e-4f6d-9447-2ab2d680e7c5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemsettings`
--

CREATE TABLE IF NOT EXISTS `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `craft_systemsettings`
--

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{"template":"_layouts\\/email","protocol":"php","emailAddress":"info@spicyweb.com.au","senderName":"Boilerplate"}', '2015-07-06 01:51:02', '2015-07-06 02:02:09', '9f9ba05a-014d-4641-b781-b7016255ecc2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE IF NOT EXISTS `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `craft_taggroups`
--

INSERT INTO `craft_taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', 'default', 101, '2015-07-06 01:51:02', '2015-07-26 05:35:49', 'c6d73e52-0d29-4c12-ad78-030dc76ff6f9');

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE IF NOT EXISTS `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_tags`
--

INSERT INTO `craft_tags` (`id`, `groupId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(31, 1, '2015-07-26 03:59:00', '2015-07-26 05:40:17', '77a5ace2-4a16-44d2-bab7-5d8418cd2d22'),
(32, 1, '2015-07-26 03:59:06', '2015-07-26 05:38:27', 'ee5eb8ce-607b-47f6-94d4-9db8121984e1'),
(33, 1, '2015-07-26 03:59:10', '2015-07-26 05:38:11', '2f3246b4-8527-4d65-a0f3-4204c1ca22c3'),
(34, 1, '2015-07-26 03:59:15', '2015-07-26 05:39:32', '491c6ae7-48a9-418e-823a-e1bfa8a35bf3');

-- --------------------------------------------------------

--
-- Table structure for table `craft_tasks`
--

CREATE TABLE IF NOT EXISTS `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=44 ;

--
-- Dumping data for table `craft_tasks`
--

INSERT INTO `craft_tasks` (`id`, `root`, `lft`, `rgt`, `level`, `currentStep`, `totalSteps`, `status`, `type`, `description`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(43, 43, 1, 2, 0, NULL, NULL, 'pending', 'DeleteStaleTemplateCaches', NULL, '{"elementId":["36","40"]}', '2015-07-26 14:56:38', '2015-07-26 14:57:05', '21ceff57-e4e2-4e5a-8ce5-2b3266e984b8');

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachecriteria`
--

CREATE TABLE IF NOT EXISTS `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE IF NOT EXISTS `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE IF NOT EXISTS `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE IF NOT EXISTS `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE IF NOT EXISTS `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE IF NOT EXISTS `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE IF NOT EXISTS `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE IF NOT EXISTS `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE IF NOT EXISTS `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE IF NOT EXISTS `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `weekStartDay`, `admin`, `client`, `locked`, `suspended`, `pending`, `archived`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ben', NULL, 'Benjamin', 'Fleming', 'benjfleming21@gmail.com', '$2y$13$ZR91Zcv1gW6f2dqlczFOCOfJniuso27GJCopySrmkc3Sy71/BkbYO', NULL, 1, 1, 0, 0, 0, 0, 0, '2015-07-23 08:35:57', '127.0.0.1', NULL, NULL, '2015-07-06 10:11:45', NULL, NULL, NULL, NULL, 0, '2015-07-21 09:08:50', '2015-07-06 01:51:01', '2015-07-23 08:35:57', '008d0c94-de93-42d7-9529-09151c660bd5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE IF NOT EXISTS `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'RecentEntries', 1, '{"section":"3","limit":"10"}', 1, '2015-07-06 01:51:06', '2015-07-06 06:07:46', 'ed6e76a4-7450-4c19-8e03-832b79f80de4'),
(2, 1, 'GetHelp', 2, NULL, 0, '2015-07-06 01:51:06', '2015-07-06 06:06:15', '61bfbebb-8bbc-4f30-bbce-05edad433388'),
(3, 1, 'Updates', 3, NULL, 1, '2015-07-06 01:51:06', '2015-07-06 06:07:46', '4722f502-4e56-4401-a6ed-60ac1f9adb18'),
(4, 1, 'Feed', 4, '{"url":"http:\\/\\/feeds.feedburner.com\\/blogandtonic","title":"Blog & Tonic"}', 0, '2015-07-06 01:51:06', '2015-07-06 06:06:19', 'cf84e2dc-42de-4672-9299-cc2d3c9ab62f'),
(5, 1, 'RecentEntries', 2, '{"section":"4","limit":"10"}', 1, '2015-07-06 06:07:38', '2015-07-06 06:07:46', 'b28f2b74-f56e-4c34-859b-717374e47cab');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_assetfiles`
--
ALTER TABLE `craft_assetfiles`
  ADD CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  ADD CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  ADD CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  ADD CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  ADD CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  ADD CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixcontent_blogbody`
--
ALTER TABLE `craft_matrixcontent_blogbody`
  ADD CONSTRAINT `craft_matrixcontent_blogbody_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_blogbody_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  ADD CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  ADD CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
