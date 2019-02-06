-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 06, 2019 at 01:07 AM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.2.12-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zenphoto`
--

-- --------------------------------------------------------

--
-- Table structure for table `_administrators`
--

CREATE TABLE `_administrators` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passhash` int(1) DEFAULT NULL,
  `passupdate` datetime DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `rights` int(11) DEFAULT NULL,
  `custom_data` text COLLATE utf8_unicode_ci,
  `valid` int(1) NOT NULL DEFAULT '1',
  `group` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `loggedin` datetime DEFAULT NULL,
  `lastloggedin` datetime DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prime_album` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_credentials` text COLLATE utf8_unicode_ci,
  `challenge_phrase` text COLLATE utf8_unicode_ci,
  `street` tinytext COLLATE utf8_unicode_ci,
  `website` tinytext COLLATE utf8_unicode_ci,
  `city` tinytext COLLATE utf8_unicode_ci,
  `country` tinytext COLLATE utf8_unicode_ci,
  `state` tinytext COLLATE utf8_unicode_ci,
  `postal` tinytext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `_administrators`
--

INSERT INTO `_administrators` (`id`, `user`, `pass`, `passhash`, `passupdate`, `name`, `email`, `rights`, `custom_data`, `valid`, `group`, `date`, `loggedin`, `lastloggedin`, `quota`, `language`, `prime_album`, `other_credentials`, `challenge_phrase`, `street`, `website`, `city`, `country`, `state`, `postal`) VALUES
(1, 'administrators', NULL, NULL, NULL, 'group', NULL, 1996419053, NULL, 0, NULL, '2018-12-17 21:36:54', NULL, NULL, NULL, NULL, NULL, 'Users with full privileges', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'viewers', NULL, NULL, NULL, 'group', NULL, 9985, NULL, 0, NULL, '2018-12-17 21:36:54', NULL, NULL, NULL, NULL, NULL, 'Users allowed only to view zenphoto objects', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'blocked', NULL, NULL, NULL, 'group', NULL, 0, NULL, 0, NULL, '2018-12-17 21:36:55', NULL, NULL, NULL, NULL, NULL, 'Banned users', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'album managers', NULL, NULL, NULL, 'template', NULL, 68216581, NULL, 0, NULL, '2018-12-17 21:36:55', NULL, NULL, NULL, NULL, NULL, 'Managers of one or more albums', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'default', NULL, NULL, NULL, 'template', NULL, 1889, NULL, 0, NULL, '2018-12-17 21:36:55', NULL, NULL, NULL, NULL, NULL, 'Default user settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'newuser', NULL, NULL, NULL, 'template', NULL, 1, NULL, 0, NULL, '2018-12-17 21:36:55', NULL, NULL, NULL, NULL, NULL, 'Newly registered and verified users', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'root', 'TBRmqP/CJLt2bs99XMksIUm4qtkWT4i8jgnaWR--1vA=', 3, '2018-12-17 21:38:49', NULL, 'root', 1996419053, NULL, 1, NULL, '2018-12-17 21:38:49', '2018-12-17 21:38:59', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
(9, 'pepe', '-FMlIRzMV07sBcOiktZrS7YS2zAbg72IifM6/0I2pz8=', 3, '2018-12-21 18:28:54', NULL, 'pepe@mail.es', 352251873, NULL, 1, NULL, '2018-12-21 18:27:26', '2018-12-21 18:35:52', NULL, NULL, 'en_US', NULL, NULL, NULL, '', '', '', '', '', ''),
(10, 'pepe2', 'LpungVsVBsI6D1A4FlKojmkE8P0aDDP6Qs71gjIKxak=', 3, '2018-12-21 18:38:17', NULL, 'pepe2@mail.com', 352251873, NULL, 1, NULL, '2018-12-21 18:38:17', '2018-12-21 18:39:13', NULL, NULL, 'en_US', NULL, NULL, NULL, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `_admin_to_object`
--

CREATE TABLE `_admin_to_object` (
  `id` int(11) UNSIGNED NOT NULL,
  `adminid` int(11) UNSIGNED NOT NULL,
  `objectid` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci DEFAULT 'album',
  `edit` int(11) DEFAULT '32767'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_albums`
--

CREATE TABLE `_albums` (
  `id` int(11) UNSIGNED NOT NULL,
  `parentid` int(11) UNSIGNED DEFAULT NULL,
  `folder` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci,
  `desc` text COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `updateddate` datetime DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci,
  `show` int(1) UNSIGNED NOT NULL DEFAULT '1',
  `closecomments` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `commentson` int(1) UNSIGNED NOT NULL DEFAULT '1',
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mtime` int(32) DEFAULT NULL,
  `sort_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subalbum_sort_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) UNSIGNED DEFAULT NULL,
  `image_sortdirection` int(1) UNSIGNED DEFAULT '0',
  `album_sortdirection` int(1) UNSIGNED DEFAULT '0',
  `hitcounter` int(11) UNSIGNED DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_hint` text COLLATE utf8_unicode_ci,
  `publishdate` datetime DEFAULT NULL,
  `expiredate` datetime DEFAULT NULL,
  `total_value` int(11) DEFAULT '0',
  `total_votes` int(11) DEFAULT '0',
  `used_ips` longtext COLLATE utf8_unicode_ci,
  `custom_data` text COLLATE utf8_unicode_ci,
  `dynamic` int(1) DEFAULT '0',
  `search_params` text COLLATE utf8_unicode_ci,
  `album_theme` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `rating_status` int(1) DEFAULT '3',
  `watermark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `watermark_thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codeblock` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `_albums`
--

INSERT INTO `_albums` (`id`, `parentid`, `folder`, `title`, `desc`, `date`, `updateddate`, `location`, `show`, `closecomments`, `commentson`, `thumb`, `mtime`, `sort_type`, `subalbum_sort_type`, `sort_order`, `image_sortdirection`, `album_sortdirection`, `hitcounter`, `password`, `password_hint`, `publishdate`, `expiredate`, `total_value`, `total_votes`, `used_ips`, `custom_data`, `dynamic`, `search_params`, `album_theme`, `user`, `rating`, `rating_status`, `watermark`, `watermark_thumb`, `owner`, `codeblock`) VALUES
(1, NULL, 'firstone', 'firstone', NULL, '2018-12-17 21:44:39', '2018-12-17 21:56:32', NULL, 1, 0, 1, NULL, 1545079479, NULL, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, 'root', NULL),
(3, NULL, 'pepe', 'pepe', NULL, '2018-12-17 23:41:51', '2018-12-21 18:53:03', NULL, 1, 0, 1, '1', 1545086511, NULL, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `_captcha`
--

CREATE TABLE `_captcha` (
  `id` int(11) UNSIGNED NOT NULL,
  `ptime` int(32) UNSIGNED NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_comments`
--

CREATE TABLE `_comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `ownerid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `inmoderation` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(52) COLLATE utf8_unicode_ci DEFAULT 'images',
  `IP` text COLLATE utf8_unicode_ci,
  `private` int(1) DEFAULT '0',
  `anon` int(1) DEFAULT '0',
  `custom_data` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_images`
--

CREATE TABLE `_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `albumid` int(11) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci,
  `desc` text COLLATE utf8_unicode_ci,
  `location` text COLLATE utf8_unicode_ci,
  `city` tinytext COLLATE utf8_unicode_ci,
  `state` tinytext COLLATE utf8_unicode_ci,
  `country` tinytext COLLATE utf8_unicode_ci,
  `credit` text COLLATE utf8_unicode_ci,
  `copyright` text COLLATE utf8_unicode_ci,
  `commentson` int(1) UNSIGNED NOT NULL DEFAULT '1',
  `show` int(1) NOT NULL DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `sort_order` int(11) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `thumbX` int(10) UNSIGNED DEFAULT NULL,
  `thumbY` int(10) UNSIGNED DEFAULT NULL,
  `thumbW` int(10) UNSIGNED DEFAULT NULL,
  `thumbH` int(10) UNSIGNED DEFAULT NULL,
  `mtime` int(32) DEFAULT NULL,
  `publishdate` datetime DEFAULT NULL,
  `expiredate` datetime DEFAULT NULL,
  `hitcounter` int(11) UNSIGNED DEFAULT '0',
  `total_value` int(11) UNSIGNED DEFAULT '0',
  `total_votes` int(11) UNSIGNED DEFAULT '0',
  `used_ips` longtext COLLATE utf8_unicode_ci,
  `custom_data` text COLLATE utf8_unicode_ci,
  `rating` float DEFAULT NULL,
  `rating_status` int(1) DEFAULT '3',
  `hasMetadata` int(1) DEFAULT '0',
  `watermark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `watermark_use` int(1) DEFAULT '7',
  `owner` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `codeblock` text COLLATE utf8_unicode_ci,
  `user` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hint` text COLLATE utf8_unicode_ci,
  `EXIFMake` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFModel` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFDescription` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCObjectName` mediumtext COLLATE utf8_unicode_ci,
  `IPTCImageHeadline` mediumtext COLLATE utf8_unicode_ci,
  `IPTCImageCaption` mediumtext COLLATE utf8_unicode_ci,
  `IPTCImageCaptionWriter` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFDateTime` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFDateTimeOriginal` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFDateTimeDigitized` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCDateCreated` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCTimeCreated` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCDigitizeDate` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCDigitizeTime` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFArtist` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCImageCredit` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCByLine` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCByLineTitle` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCSource` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCContact` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFCopyright` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCCopyright` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFExposureTime` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFFNumber` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFISOSpeedRatings` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFExposureBiasValue` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFMeteringMode` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFFlash` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFImageWidth` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFImageHeight` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFOrientation` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFSoftware` mediumtext COLLATE utf8_unicode_ci,
  `EXIFContrast` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFSharpness` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFSaturation` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFWhiteBalance` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFSubjectDistance` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFFocalLength` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFLensType` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFLensInfo` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFFocalLengthIn35mmFilm` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCCity` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCSubLocation` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCState` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCLocationCode` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCLocationName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCContentLocationCode` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCContentLocationName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFGPSLatitude` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFGPSLatitudeRef` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFGPSLongitude` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFGPSLongitudeRef` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFGPSAltitude` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXIFGPSAltitudeRef` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCOriginatingProgram` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IPTCProgramVersion` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoFormat` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoSize` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoArtist` mediumtext COLLATE utf8_unicode_ci,
  `VideoTitle` mediumtext COLLATE utf8_unicode_ci,
  `VideoBitrate` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoBitrate_mode` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoBits_per_sample` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoCodec` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoCompression_ratio` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoDataformat` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoEncoder` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoSamplerate` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoChannelmode` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoChannels` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoFramerate` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoResolution_x` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoResolution_y` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoAspect_ratio` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VideoPlaytime` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XMPrating` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `_images`
--

INSERT INTO `_images` (`id`, `albumid`, `filename`, `title`, `desc`, `location`, `city`, `state`, `country`, `credit`, `copyright`, `commentson`, `show`, `date`, `sort_order`, `height`, `width`, `thumbX`, `thumbY`, `thumbW`, `thumbH`, `mtime`, `publishdate`, `expiredate`, `hitcounter`, `total_value`, `total_votes`, `used_ips`, `custom_data`, `rating`, `rating_status`, `hasMetadata`, `watermark`, `watermark_use`, `owner`, `filesize`, `codeblock`, `user`, `password`, `password_hint`, `EXIFMake`, `EXIFModel`, `EXIFDescription`, `IPTCObjectName`, `IPTCImageHeadline`, `IPTCImageCaption`, `IPTCImageCaptionWriter`, `EXIFDateTime`, `EXIFDateTimeOriginal`, `EXIFDateTimeDigitized`, `IPTCDateCreated`, `IPTCTimeCreated`, `IPTCDigitizeDate`, `IPTCDigitizeTime`, `EXIFArtist`, `IPTCImageCredit`, `IPTCByLine`, `IPTCByLineTitle`, `IPTCSource`, `IPTCContact`, `EXIFCopyright`, `IPTCCopyright`, `EXIFExposureTime`, `EXIFFNumber`, `EXIFISOSpeedRatings`, `EXIFExposureBiasValue`, `EXIFMeteringMode`, `EXIFFlash`, `EXIFImageWidth`, `EXIFImageHeight`, `EXIFOrientation`, `EXIFSoftware`, `EXIFContrast`, `EXIFSharpness`, `EXIFSaturation`, `EXIFWhiteBalance`, `EXIFSubjectDistance`, `EXIFFocalLength`, `EXIFLensType`, `EXIFLensInfo`, `EXIFFocalLengthIn35mmFilm`, `IPTCCity`, `IPTCSubLocation`, `IPTCState`, `IPTCLocationCode`, `IPTCLocationName`, `IPTCContentLocationCode`, `IPTCContentLocationName`, `EXIFGPSLatitude`, `EXIFGPSLatitudeRef`, `EXIFGPSLongitude`, `EXIFGPSLongitudeRef`, `EXIFGPSAltitude`, `EXIFGPSAltitudeRef`, `IPTCOriginatingProgram`, `IPTCProgramVersion`, `VideoFormat`, `VideoSize`, `VideoArtist`, `VideoTitle`, `VideoBitrate`, `VideoBitrate_mode`, `VideoBits_per_sample`, `VideoCodec`, `VideoCompression_ratio`, `VideoDataformat`, `VideoEncoder`, `VideoSamplerate`, `VideoChannelmode`, `VideoChannels`, `VideoFramerate`, `VideoResolution_x`, `VideoResolution_y`, `VideoAspect_ratio`, `VideoPlaytime`, `XMPrating`) VALUES
(1, 1, 'Selection_101.png', 'a:1:{s:5:"en_US";s:13:"Selection_101";}', '', NULL, NULL, NULL, NULL, NULL, '', 1, 1, '2018-12-17 21:44:39', NULL, 651, 890, NULL, NULL, NULL, NULL, 1545079479, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 3, 1, 'copyright', 7, 'root', 58943, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Selection_100.png', 'Selection_100', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 1, '2018-12-17 21:56:32', NULL, 625, 813, NULL, NULL, NULL, NULL, 1545080192, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 3, 1, NULL, 7, 'root', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3, 'Selection_097.png', 'Selection_097', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 1, '2018-12-17 23:41:51', NULL, 240, 165, NULL, NULL, NULL, NULL, 1545086511, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 3, 1, NULL, 7, 'root', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 3, 'Selection_101.png', 'Selection_101', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 1, '2018-12-21 18:53:03', NULL, 651, 890, NULL, NULL, NULL, NULL, 1545414783, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 3, 1, NULL, 7, 'pepe2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `_menu`
--

CREATE TABLE `_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `parentid` int(11) UNSIGNED DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `include_li` int(1) UNSIGNED DEFAULT '1',
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` varchar(48) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `show` int(1) UNSIGNED NOT NULL DEFAULT '1',
  `menuset` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `span_class` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `span_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_news`
--

CREATE TABLE `_news` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `extracontent` text COLLATE utf8_unicode_ci,
  `show` int(1) UNSIGNED NOT NULL DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `titlelink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `commentson` int(1) UNSIGNED DEFAULT '0',
  `codeblock` text COLLATE utf8_unicode_ci,
  `author` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastchange` datetime DEFAULT NULL,
  `lastchangeauthor` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `hitcounter` int(11) UNSIGNED DEFAULT '0',
  `permalink` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `locked` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `expiredate` datetime DEFAULT NULL,
  `total_value` int(11) UNSIGNED DEFAULT '0',
  `total_votes` int(11) UNSIGNED DEFAULT '0',
  `used_ips` longtext COLLATE utf8_unicode_ci,
  `rating` float DEFAULT NULL,
  `rating_status` int(1) DEFAULT '3',
  `sticky` int(1) DEFAULT '0',
  `custom_data` text COLLATE utf8_unicode_ci,
  `truncation` int(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_news2cat`
--

CREATE TABLE `_news2cat` (
  `id` int(11) UNSIGNED NOT NULL,
  `cat_id` int(11) UNSIGNED NOT NULL,
  `news_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_news_categories`
--

CREATE TABLE `_news_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `titlelink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permalink` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `hitcounter` int(11) UNSIGNED DEFAULT '0',
  `user` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hint` text COLLATE utf8_unicode_ci,
  `parentid` int(11) DEFAULT NULL,
  `sort_order` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `custom_data` text COLLATE utf8_unicode_ci,
  `show` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_obj_to_tag`
--

CREATE TABLE `_obj_to_tag` (
  `id` int(11) UNSIGNED NOT NULL,
  `tagid` int(11) UNSIGNED NOT NULL,
  `type` tinytext COLLATE utf8_unicode_ci,
  `objectid` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_options`
--

CREATE TABLE `_options` (
  `id` int(11) UNSIGNED NOT NULL,
  `ownerid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `theme` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `creator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `_options`
--

INSERT INTO `_options` (`id`, `ownerid`, `name`, `value`, `theme`, `creator`) VALUES
(2, 0, 'setup_unprotected_by_adminrequest', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(4, 0, 'libauth_version', '4', '', NULL),
(5, 0, 'strong_hash', '3', '', NULL),
(6, 0, 'extra_auth_hash_text', 'ZLgm!7jrPuW^EqJib?+G0V%cUz}S(-', '', 'zp-core/setup/setup-option-defaults.php'),
(7, 0, 'password_strength', '10', '', 'zp-core/setup/setup-option-defaults.php'),
(8, 0, 'min_password_lenght', '6', '', 'zp-core/setup/setup-option-defaults.php'),
(9, 0, 'user_album_edit_default', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(10, 0, 'time_offset', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(11, 0, 'mod_rewrite_detected', '1', '', NULL),
(12, 0, 'UTF8_image_URI', '1', '', NULL),
(13, 0, 'server_protocol', 'http', '', 'zp-core/setup/setup-option-defaults.php'),
(14, 0, 'charset', 'UTF-8', '', 'zp-core/setup/setup-option-defaults.php'),
(15, 0, 'filesystem_charset', 'UTF-8', '', 'zp-core/setup/setup-option-defaults.php'),
(16, 0, 'image_quality', '85', '', 'zp-core/setup/setup-option-defaults.php'),
(17, 0, 'thumb_quality', '75', '', 'zp-core/setup/setup-option-defaults.php'),
(18, 0, 'search_password', '', '', 'zp-core/setup/setup-option-defaults.php'),
(19, 0, 'watermark_h_offset', '90', '', 'zp-core/setup/setup-option-defaults.php'),
(20, 0, 'watermark_w_offset', '90', '', 'zp-core/setup/setup-option-defaults.php'),
(21, 0, 'watermark_scale', '5', '', 'zp-core/setup/setup-option-defaults.php'),
(22, 0, 'watermark_allow_upscale', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(23, 0, 'perform_video_watermark', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(24, 0, 'image_sorttype', 'filename', '', 'zp-core/setup/setup-option-defaults.php'),
(25, 0, 'image_sortdirection', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(26, 0, 'hotlink_protection', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(27, 0, 'search_fields', 'title,desc,tags,file,location,city,state,country,content,author', '', 'zp-core/setup/setup-option-defaults.php'),
(28, 0, 'allowed_tags_default', 'a => (href =>() title =>() target=>() class=>() id=>() rel=>())\nabbr =>(class=>() id=>() title =>())\nacronym =>(class=>() id=>() title =>())\nb => (class=>() id=>() )\nblockquote =>(class=>() id=>() cite =>())\nbr => (class=>() id=>())\ncode => (class=>() id=>())\nem => (class=>() id=>())\ni => (class=>() id=>()) \nstrike => (class=>() id=>())\nstrong => (class=>() id=>())\nul => (class=>() id=>())\nol => (class=>() id=>())\nli => (class=>() id=>())\np => (class=>() id=>() style=>())\nh1=>(class=>() id=>() style=>())\nh2=>(class=>() id=>() style=>())\nh3=>(class=>() id=>() style=>())\nh4=>(class=>() id=>() style=>())\nh5=>(class=>() id=>() style=>())\nh6=>(class=>() id=>() style=>())\npre=>(class=>() id=>() style=>())\naddress=>(class=>() id=>() style=>())\nspan=>(class=>() id=>() style=>())\ndiv=>(class=>() id=>() style=>())\nimg=>(class=>() id=>() style=>() src=>() title=>() alt=>() width=>() height=>())\niframe=>(class=>() id=>() style=>() src=>() title=>() width=>() height=>())\n', '', NULL),
(29, 0, 'allowed_tags', 'a => (href =>() title =>() target=>() class=>() id=>() rel=>())\nabbr =>(class=>() id=>() title =>())\nacronym =>(class=>() id=>() title =>())\nb => (class=>() id=>() )\nblockquote =>(class=>() id=>() cite =>())\nbr => (class=>() id=>())\ncode => (class=>() id=>())\nem => (class=>() id=>())\ni => (class=>() id=>()) \nstrike => (class=>() id=>())\nstrong => (class=>() id=>())\nul => (class=>() id=>())\nol => (class=>() id=>())\nli => (class=>() id=>())\np => (class=>() id=>() style=>())\nh1=>(class=>() id=>() style=>())\nh2=>(class=>() id=>() style=>())\nh3=>(class=>() id=>() style=>())\nh4=>(class=>() id=>() style=>())\nh5=>(class=>() id=>() style=>())\nh6=>(class=>() id=>() style=>())\npre=>(class=>() id=>() style=>())\naddress=>(class=>() id=>() style=>())\nspan=>(class=>() id=>() style=>())\ndiv=>(class=>() id=>() style=>())\nimg=>(class=>() id=>() style=>() src=>() title=>() alt=>() width=>() height=>())\niframe=>(class=>() id=>() style=>() src=>() title=>() width=>() height=>())\n', '', 'zp-core/setup/setup-option-defaults.php'),
(30, 0, 'style_tags', 'abbr => (title => ())\nacronym => (title => ())\nb => ()\nem => ()\ni => () \nstrike => ()\nstrong => ()\n', '', 'zp-core/setup/setup-option-defaults.php'),
(32, 0, 'full_image_quality', '75', '', 'zp-core/setup/setup-option-defaults.php'),
(33, 0, 'protect_full_image', 'Protected view', '', 'zp-core/setup/setup-option-defaults.php'),
(34, 0, 'locale', '', '', 'zp-core/setup/setup-option-defaults.php'),
(35, 0, 'date_format', '%x', '', 'zp-core/setup/setup-option-defaults.php'),
(36, 0, 'use_lock_image', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(37, 0, 'search_user', '', '', 'zp-core/setup/setup-option-defaults.php'),
(38, 0, 'multi_lingual', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(39, 0, 'tagsort', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(40, 0, 'albumimagesort', 'id', '', 'zp-core/setup/setup-option-defaults.php'),
(41, 0, 'albumimagedirection', 'DESC', '', 'zp-core/setup/setup-option-defaults.php'),
(42, 0, 'cache_full_image', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(43, 0, 'custom_index_page', '', '', 'zp-core/setup/setup-option-defaults.php'),
(44, 0, 'picture_of_the_day', 'a:3:{s:3:"day";N;s:6:"folder";N;s:8:"filename";N;}', '', 'zp-core/setup/setup-option-defaults.php'),
(45, 0, 'exact_tag_match', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(46, 0, 'image_max_size', '3000', '', 'zp-core/setup/setup-option-defaults.php'),
(47, 0, 'EXIFMake', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(48, 0, 'EXIFModel', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(49, 0, 'EXIFExposureTime', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(50, 0, 'EXIFFNumber', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(51, 0, 'EXIFFocalLength', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(52, 0, 'EXIFISOSpeedRatings', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(53, 0, 'EXIFDateTimeOriginal', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(54, 0, 'EXIFExposureBiasValue', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(55, 0, 'EXIFMeteringMode', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(56, 0, 'EXIFFlash', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(59, 0, 'EXIFDescription', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(60, 0, 'IPTCObjectName', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(61, 0, 'IPTCImageHeadline', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(62, 0, 'IPTCImageCaption', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(63, 0, 'IPTCImageCaptionWriter', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(64, 0, 'EXIFDateTime', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(66, 0, 'EXIFDateTimeDigitized', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(67, 0, 'IPTCDateCreated', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(68, 0, 'IPTCTimeCreated', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(69, 0, 'IPTCDigitizeDate', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(70, 0, 'IPTCDigitizeTime', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(71, 0, 'EXIFArtist', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(72, 0, 'IPTCImageCredit', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(73, 0, 'IPTCByLine', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(74, 0, 'IPTCByLineTitle', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(75, 0, 'IPTCSource', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(76, 0, 'IPTCContact', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(77, 0, 'EXIFCopyright', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(78, 0, 'IPTCCopyright', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(79, 0, 'IPTCKeywords', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(86, 0, 'EXIFImageWidth', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(87, 0, 'EXIFImageHeight', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(88, 0, 'EXIFOrientation', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(89, 0, 'EXIFSoftware', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(90, 0, 'EXIFContrast', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(91, 0, 'EXIFSharpness', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(92, 0, 'EXIFSaturation', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(93, 0, 'EXIFWhiteBalance', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(94, 0, 'EXIFSubjectDistance', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(96, 0, 'EXIFLensType', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(97, 0, 'EXIFLensInfo', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(98, 0, 'EXIFFocalLengthIn35mmFilm', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(99, 0, 'IPTCCity', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(100, 0, 'IPTCSubLocation', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(101, 0, 'IPTCState', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(102, 0, 'IPTCLocationCode', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(103, 0, 'IPTCLocationName', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(104, 0, 'IPTCContentLocationCode', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(105, 0, 'IPTCContentLocationName', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(106, 0, 'EXIFGPSLatitude', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(107, 0, 'EXIFGPSLatitudeRef', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(108, 0, 'EXIFGPSLongitude', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(109, 0, 'EXIFGPSLongitudeRef', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(110, 0, 'EXIFGPSAltitude', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(111, 0, 'EXIFGPSAltitudeRef', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(112, 0, 'IPTCOriginatingProgram', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(113, 0, 'IPTCProgramVersion', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(114, 0, 'VideoFormat', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(115, 0, 'VideoSize', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(116, 0, 'VideoArtist', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(117, 0, 'VideoTitle', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(118, 0, 'VideoBitrate', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(119, 0, 'VideoBitrate_mode', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(120, 0, 'VideoBits_per_sample', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(121, 0, 'VideoCodec', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(122, 0, 'VideoCompression_ratio', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(123, 0, 'VideoDataformat', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(124, 0, 'VideoEncoder', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(125, 0, 'VideoSamplerate', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(126, 0, 'VideoChannelmode', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(127, 0, 'VideoChannels', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(128, 0, 'VideoFramerate', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(129, 0, 'VideoResolution_x', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(130, 0, 'VideoResolution_y', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(131, 0, 'VideoAspect_ratio', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(132, 0, 'VideoPlaytime', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(133, 0, 'XMPrating', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(134, 0, 'IPTC_encoding', 'ISO-8859-1', '', 'zp-core/setup/setup-option-defaults.php'),
(135, 0, 'IPTC_convert_linebreaks', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(137, 0, 'sharpen_amount', '40', '', 'zp-core/setup/setup-option-defaults.php'),
(138, 0, 'sharpen_radius', '0.5', '', 'zp-core/setup/setup-option-defaults.php'),
(139, 0, 'sharpen_threshold', '3', '', 'zp-core/setup/setup-option-defaults.php'),
(141, 0, 'search_no_albums', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(142, 0, 'defined_groups', 'a:6:{i:0;s:14:"administrators";i:1;s:7:"viewers";i:2;s:7:"blocked";i:3;s:14:"album managers";i:4;s:7:"default";i:5;s:7:"newuser";}', '', NULL),
(143, 0, 'RSS_album_image', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(144, 0, 'RSS_comments', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(145, 0, 'RSS_articles', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(146, 0, 'RSS_pages', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(147, 0, 'RSS_article_comments', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(148, 0, 'AlbumThumbSelect', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(149, 0, 'menu_truncate_string', '0', '', 'zp-core/setup/setup-option-defaults.php'),
(150, 0, 'menu_truncate_indicator', '', '', 'zp-core/setup/setup-option-defaults.php'),
(151, 0, 'site_email', 'zenphoto@zenphoto.test', '', 'zp-core/setup/setup-option-defaults.php'),
(152, 0, 'site_email_name', 'Zenphoto', '', 'zp-core/setup/setup-option-defaults.php'),
(153, 0, 'Zenphoto_theme_list', 'a:5:{i:0;s:5:"basic";i:37;s:18:"effervescence_plus";i:38;s:7:"garland";i:79;s:7:"zenpage";i:117;s:8:"zpmobile";}', '', NULL),
(154, 0, 'default_copyright', 'Copyright 2018: zenphoto.test', '', 'zp-core/setup/setup-option-defaults.php'),
(155, 0, 'gallery_page_unprotected_register', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(156, 0, 'gallery_page_unprotected_contact', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(157, 0, 'gallery_data', 'a:18:{s:21:"gallery_sortdirection";i:0;s:16:"gallery_sorttype";s:2:"ID";s:13:"gallery_title";a:1:{i:0;s:7:"Gallery";}s:19:"Gallery_description";a:1:{i:0;s:73:"You can insert your Gallery description on the Admin Options Gallery tab.";}s:16:"gallery_password";N;s:12:"gallery_user";N;s:12:"gallery_hint";N;s:10:"hitcounter";N;s:13:"current_theme";s:7:"default";s:13:"website_title";N;s:11:"website_url";N;s:16:"gallery_security";s:6:"public";s:16:"login_user_field";N;s:24:"album_use_new_image_date";N;s:19:"thumb_select_images";N;s:17:"unprotected_pages";a:4:{i:0;s:8:"register";i:1;s:7:"contact";i:2;s:8:"register";i:3;s:7:"contact";}s:13:"album_publish";i:1;s:13:"image_publish";i:1;}', '', NULL),
(158, 0, 'search_cache_duration', '30', '', 'zp-core/setup/setup-option-defaults.php'),
(159, 0, 'search_within', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(160, 0, 'last_update_check', '30', '', NULL),
(161, 0, 'plugins_per_page', '20', '', 'zp-core/setup/setup-option-defaults.php'),
(162, 0, 'plugins_per_page_options', '10', '', 'zp-core/setup/setup-option-defaults.php'),
(163, 0, 'users_per_page', '10', '', 'zp-core/setup/setup-option-defaults.php'),
(164, 0, 'articles_per_page', '15', '', 'zp-core/setup/setup-option-defaults.php'),
(165, 0, 'debug_log_size', '5000000', '', 'zp-core/setup/setup-option-defaults.php'),
(166, 0, 'imageProcessorConcurrency', '30', '', 'zp-core/setup/setup-option-defaults.php'),
(167, 0, 'zp_plugin_legacySpam', '8197', '', 'zp-core/setup/setup-option-defaults.php'),
(168, 0, 'search_album_sort_type', 'title', '', 'zp-core/setup/setup-option-defaults.php'),
(169, 0, 'search_album_sort_direction', '', '', 'zp-core/setup/setup-option-defaults.php'),
(170, 0, 'search_image_sort_type', 'title', '', 'zp-core/setup/setup-option-defaults.php'),
(171, 0, 'search_image_sort_direction', '', '', 'zp-core/setup/setup-option-defaults.php'),
(172, 0, 'search_newsarticle_sort_type', 'date', '', 'zp-core/setup/setup-option-defaults.php'),
(173, 0, 'search_newsarticle_sort_direction', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(174, 0, 'search_page_sort_type', 'title', '', 'zp-core/setup/setup-option-defaults.php'),
(175, 0, 'search_page_sort_direction', '', '', 'zp-core/setup/setup-option-defaults.php'),
(176, 0, 'image_processor_flooding_protection', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(177, 0, 'codeblock_first_tab', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(178, 0, 'GD_FreeType_Path', '/var/www/html/practicas/zenphoto/plugins/gd_fonts', '', 'zp-core/setup/setup-option-defaults.php'),
(179, 0, 'disallow_zh_CN', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(180, 0, 'unsupported_zh_CN', '1', '', NULL),
(181, 0, 'disallow_zh_TW', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(182, 0, 'unsupported_zh_TW', '1', '', NULL),
(183, 0, 'unsupported_da_DK', '1', '', NULL),
(184, 0, 'unsupported_nl_NL', '1', '', NULL),
(185, 0, 'unsupported_fr_FR', '1', '', NULL),
(186, 0, 'disallow_gl_ES', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(187, 0, 'unsupported_gl_ES', '1', '', NULL),
(188, 0, 'unsupported_de_DE', '1', '', NULL),
(189, 0, 'disallow_he_IL', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(190, 0, 'unsupported_he_IL', '1', '', NULL),
(191, 0, 'disallow_is_IS', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(192, 0, 'unsupported_is_IS', '1', '', NULL),
(193, 0, 'unsupported_it_IT', '1', '', NULL),
(194, 0, 'disallow_ja_JP', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(195, 0, 'unsupported_ja_JP', '1', '', NULL),
(196, 0, 'disallow_pl_PL', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(197, 0, 'unsupported_pl_PL', '1', '', NULL),
(198, 0, 'disallow_ru_RU', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(199, 0, 'unsupported_ru_RU', '1', '', NULL),
(200, 0, 'disallow_sk_SK', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(201, 0, 'unsupported_sk_SK', '1', '', NULL),
(202, 0, 'disallow_es_ES', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(203, 0, 'disallow_sv_SE', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(204, 0, 'unsupported_sv_SE', '1', '', NULL),
(205, 0, 'disallow_tr_TR', '1', '', 'zp-core/setup/setup-option-defaults.php'),
(206, 0, 'unsupported_tr_TR', '1', '', NULL),
(207, 0, 'last_garbage_collect', '1549410620', '', NULL),
(209, 0, 'Allow_search', '1', 'basic', 'themes/basic'),
(210, 0, 'Theme_colors', 'light', 'basic', 'themes/basic'),
(211, 0, 'albums_per_page', '6', 'basic', 'themes/basic'),
(212, 0, 'albums_per_row', '2', 'basic', 'themes/basic'),
(213, 0, 'images_per_page', '20', 'basic', 'themes/basic'),
(214, 0, 'images_per_row', '5', 'basic', 'themes/basic'),
(215, 0, 'image_size', '595', 'basic', 'themes/basic'),
(216, 0, 'image_use_side', 'longest', 'basic', 'themes/basic'),
(217, 0, 'thumb_size', '100', 'basic', 'themes/basic'),
(218, 0, 'thumb_crop_width', '100', 'basic', 'themes/basic'),
(219, 0, 'thumb_crop_height', '100', 'basic', 'themes/basic'),
(220, 0, 'thumb_crop', '1', 'basic', 'themes/basic'),
(221, 0, 'thumb_transition', '1', 'basic', 'themes/basic'),
(222, 0, 'colorbox_basic_album', '1', '', 'themes/basic/themeoptions.php'),
(223, 0, 'colorbox_basic_image', '1', '', 'themes/basic/themeoptions.php'),
(224, 0, 'colorbox_basic_search', '1', '', 'themes/basic/themeoptions.php'),
(236, 0, 'Allow_search', '1', 'garland', 'themes/garland'),
(237, 0, 'Allow_cloud', '1', 'garland', 'themes/garland'),
(238, 0, 'albums_per_page', '6', 'garland', 'themes/garland'),
(239, 0, 'albums_per_row', '2', 'garland', 'themes/garland'),
(240, 0, 'images_per_page', '20', 'garland', 'themes/garland'),
(241, 0, 'images_per_row', '5', 'garland', 'themes/garland'),
(242, 0, 'image_size', '520', 'garland', 'themes/garland'),
(243, 0, 'image_use_side', 'longest', 'garland', 'themes/garland'),
(244, 0, 'thumb_transition', '1', 'garland', 'themes/garland'),
(245, 0, 'thumb_size', '85', 'garland', 'themes/garland'),
(246, 0, 'thumb_crop_width', '85', 'garland', 'themes/garland'),
(247, 0, 'thumb_crop_height', '85', 'garland', 'themes/garland'),
(248, 0, 'thumb_crop', '1', 'garland', 'themes/garland'),
(249, 0, 'garland_customHome', '', 'garland', 'themes/garland'),
(250, 0, 'garland_personality', 'image_page', 'garland', 'themes/garland'),
(251, 0, 'garland_transition', 'slide-hori', 'garland', 'themes/garland'),
(252, 0, 'garland_caption_location', 'image', 'garland', 'themes/garland'),
(253, 0, 'colorbox_garland_image', '1', '', 'themes/garland/themeoptions.php'),
(254, 0, 'colorbox_garland_album', '1', '', 'themes/garland/themeoptions.php'),
(255, 0, 'colorbox_garland_search', '1', '', 'themes/garland/themeoptions.php'),
(256, 0, 'garland_menu', '', 'garland', 'themes/garland'),
(257, 0, 'custom_index_page', '', 'garland', 'themes/garland'),
(269, 0, 'mod_rewrite', '1', '', NULL),
(271, 0, 'zenpage_zp_index_news', '', 'zenpage', 'themes/zenpage'),
(272, 0, 'Allow_search', '1', 'zenpage', 'themes/zenpage'),
(273, 0, 'Use_thickbox', '1', 'zenpage', 'themes/zenpage'),
(274, 0, 'zenpage_homepage', 'none', 'zenpage', 'themes/zenpage'),
(275, 0, 'zenpage_contactpage', '1', 'zenpage', 'themes/zenpage'),
(276, 0, 'zenpage_custommenu', '', 'zenpage', 'themes/zenpage'),
(277, 0, 'albums_per_page', '6', 'zenpage', 'themes/zenpage'),
(278, 0, 'albums_per_row', '2', 'zenpage', 'themes/zenpage'),
(279, 0, 'images_per_page', '20', 'zenpage', 'themes/zenpage'),
(280, 0, 'images_per_row', '5', 'zenpage', 'themes/zenpage'),
(281, 0, 'image_size', '580', 'zenpage', 'themes/zenpage'),
(282, 0, 'image_use_side', 'longest', 'zenpage', 'themes/zenpage'),
(283, 0, 'thumb_size', '95', 'zenpage', 'themes/zenpage'),
(284, 0, 'thumb_crop_width', '95', 'zenpage', 'themes/zenpage'),
(285, 0, 'thumb_crop_height', '95', 'zenpage', 'themes/zenpage'),
(286, 0, 'thumb_crop', '1', 'zenpage', 'themes/zenpage'),
(287, 0, 'thumb_transition', '1', 'zenpage', 'themes/zenpage'),
(288, 0, 'colorbox_zenpage_album', '1', '', 'themes/zenpage/themeoptions.php'),
(289, 0, 'colorbox_zenpage_image', '1', '', 'themes/zenpage/themeoptions.php'),
(290, 0, 'colorbox_zenpage_search', '1', '', 'themes/zenpage/themeoptions.php'),
(291, 0, 'custom_index_page', '', 'zenpage', 'themes/zenpage'),
(303, 0, 'Allow_search', '1', 'zpmobile', 'themes/zpmobile'),
(304, 0, 'thumb_transition', '1', 'zpmobile', 'themes/zpmobile'),
(305, 0, 'colorbox_default_album', '1', '', 'themes/zpmobile/themeoptions.php'),
(306, 0, 'colorbox_default_image', '1', '', 'themes/zpmobile/themeoptions.php'),
(307, 0, 'colorbox_default_search', '1', '', 'themes/zpmobile/themeoptions.php'),
(308, 0, 'thumb_size', '79', 'zpmobile', 'themes/zpmobile'),
(309, 0, 'thumb_crop_width', '79', 'zpmobile', 'themes/zpmobile'),
(310, 0, 'thumb_crop_height', '79', 'zpmobile', 'themes/zpmobile'),
(311, 0, 'thumb_crop', '1', 'zpmobile', 'themes/zpmobile'),
(312, 0, 'custom_index_page', 'gallery', 'zpmobile', 'themes/zpmobile'),
(313, 0, 'albums_per_page', '6', 'zpmobile', 'themes/zpmobile'),
(314, 0, 'albums_per_row', '1', 'zpmobile', 'themes/zpmobile'),
(315, 0, 'images_per_page', '24', 'zpmobile', 'themes/zpmobile'),
(316, 0, 'images_per_row', '6', 'zpmobile', 'themes/zpmobile'),
(321, 0, 'image_size', '595', 'zpmobile', 'themes/zpmobile'),
(322, 0, 'image_use_side', 'longest', 'zpmobile', 'themes/zpmobile'),
(328, 0, 'backup_interval', '7', '', 'zp-core/zp-extensions/auto_backup.php'),
(329, 0, 'backups_to_keep', '5', '', 'zp-core/zp-extensions/auto_backup.php'),
(330, 0, 'bxslider_minitems', '3', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(331, 0, 'bxslider_maxitems', '8', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(332, 0, 'bxslider_width', '50', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(333, 0, 'bxslider_height', '50', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(334, 0, 'bxslider_croph', '50', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(335, 0, 'bxslider_cropw', '50', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(336, 0, 'bxslider_speed', '500', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(337, 0, 'bxslider_fullimagelink', '', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(338, 0, 'bxslider_mode', 'horizontal', '', 'zp-core/zp-extensions/bxslider_thumb_nav.php'),
(339, 0, 'WEBdocs_pdf_provider', 'local', '', 'zp-core/zp-extensions/class-WEBdocs.php'),
(340, 0, 'WEBdocs_pps_provider', 'google', '', 'zp-core/zp-extensions/class-WEBdocs.php'),
(341, 0, 'WEBdocs_tif_provider', 'zoho', '', 'zp-core/zp-extensions/class-WEBdocs.php'),
(342, 0, 'colorbox_theme', 'example1', '', 'zp-core/zp-extensions/colorbox_js.php'),
(343, 0, 'email_new_comments', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(344, 0, 'comment_name_required', 'required', '', 'zp-core/zp-extensions/comment_form.php'),
(345, 0, 'comment_email_required', 'required', '', 'zp-core/zp-extensions/comment_form.php'),
(346, 0, 'comment_web_required', 'show', '', 'zp-core/zp-extensions/comment_form.php'),
(347, 0, 'Use_Captcha', '', '', 'zp-core/zp-extensions/comment_form.php'),
(348, 0, 'comment_form_addresses', '0', '', 'zp-core/zp-extensions/comment_form.php'),
(349, 0, 'comment_form_require_addresses', '0', '', 'zp-core/zp-extensions/comment_form.php'),
(350, 0, 'comment_form_members_only', '0', '', 'zp-core/zp-extensions/comment_form.php'),
(351, 0, 'comment_form_albums', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(352, 0, 'comment_form_images', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(353, 0, 'comment_form_articles', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(354, 0, 'comment_form_pages', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(355, 0, 'comment_form_rss', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(356, 0, 'comment_form_private', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(357, 0, 'comment_form_anon', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(358, 0, 'comment_form_showURL', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(359, 0, 'comment_form_comments_per_page', '10', '', 'zp-core/zp-extensions/comment_form.php'),
(360, 0, 'comment_form_pagination', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(361, 0, 'comment_form_toggle', '1', '', 'zp-core/zp-extensions/comment_form.php'),
(362, 0, 'comment_form_dataconfirmation', '0', '', 'zp-core/zp-extensions/comment_form.php'),
(363, 0, 'contactform_rewrite', '_PAGE_/contact', '', 'zp-core/zp-extensions/contact_form.php'),
(364, 0, 'contactform_introtext', 'a:6:{s:5:"en_US";s:90:"<p>Fields with <strong>*</strong> are required. HTML or any other code is not allowed.</p>";s:5:"da_DK";s:90:"<p>Felter med <strong>*</strong> skal udfyldes. HTML eller anden kode er ikke tilladt.</p>";s:5:"nl_NL";s:96:"<p>Velden met een <strong>*</strong> zijn verplicht. HTML of andere code is niet toegestaan.</p>";s:5:"fr_FR";s:107:"<p> Les champs identifiés par <strong>*</strong> sont obligatoires. Aucun code HTML n’est autorisé.</p>";s:5:"de_DE";s:104:"<p>Felder mit einem <strong>*</strong> sind Pflichtfelder. HTML oder anderer Code ist nicht erlaubt.</p>";s:5:"it_IT";s:108:"<p>I campi con <strong>*</strong> sono richiesti. Non è permesso né l\'html né qualsiasi altro codice.</p>";}', '', 'zp-core/zp-extensions/contact_form.php'),
(365, 0, 'contactform_confirmtext', 'a:6:{s:5:"en_US";s:70:"<p>Please confirm that you really want to send this email. Thanks.</p>";s:5:"da_DK";s:65:"<p>Bekræft venligst at du ønsker at sende denne email. Tak.</p>";s:5:"nl_NL";s:50:"<p>Bevestig dat je dit bericht wilt versturen.</p>";s:5:"fr_FR";s:75:"<p>Veuillez confirmer que vous souhaitez réellement envoyer cet email.</p>";s:5:"de_DE";s:89:"<p>Bitte bestätigen Sie, dass Sie diese E-Mail wirklich verschicken möchten. Danke.</p>";s:5:"it_IT";s:71:"<p>Confermare che si vuole veramente inviare questa e-mail. Grazie.</p>";}', '', 'zp-core/zp-extensions/contact_form.php'),
(366, 0, 'contactform_thankstext', 'a:6:{s:5:"en_US";s:31:"<p>Thanks for your message.</p>";s:5:"da_DK";s:30:"<p>Tak for din meddelelse.</p>";s:5:"nl_NL";s:31:"<p>Bedankt voor je bericht.</p>";s:5:"fr_FR";s:30:"<p>Merci de votre message.</p>";s:5:"de_DE";s:39:"<p>Vielen Dank für Ihre Nachricht.</p>";s:5:"it_IT";s:31:"<p>Grazie per il messaggio.</p>";}', '', 'zp-core/zp-extensions/contact_form.php'),
(367, 0, 'contactform_newmessagelink', 'a:6:{s:5:"en_US";s:21:"Send another message.";s:5:"da_DK";s:24:"Send en meddelelse mere.";s:5:"nl_NL";s:22:"Stuur nog een bericht.";s:5:"fr_FR";s:25:"Envoyer un autre message.";s:5:"de_DE";s:22:"Weitere Mail schicken.";s:5:"it_IT";s:25:"Invia un altro messaggio.";}', '', 'zp-core/zp-extensions/contact_form.php'),
(368, 0, 'contactform_title', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(369, 0, 'contactform_name', 'required', '', 'zp-core/zp-extensions/contact_form.php'),
(370, 0, 'contactform_company', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(371, 0, 'contactform_street', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(372, 0, 'contactform_city', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(373, 0, 'contactform_state', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(374, 0, 'contactform_postal', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(375, 0, 'contactform_country', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(376, 0, 'contactform_email', 'required', '', 'zp-core/zp-extensions/contact_form.php'),
(377, 0, 'contactform_website', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(378, 0, 'contactform_phone', 'show', '', 'zp-core/zp-extensions/contact_form.php'),
(379, 0, 'contactform_captcha', '0', '', 'zp-core/zp-extensions/contact_form.php'),
(380, 0, 'contactform_confirm', '1', '', 'zp-core/zp-extensions/contact_form.php'),
(381, 0, 'contactform_sendcopy', '0', '', 'zp-core/zp-extensions/contact_form.php'),
(382, 0, 'contactform_sendcopy_text', 'a:6:{s:5:"en_US";s:105:"<p>A copy of your e-mail will automatically be sent to the address you provided for your own records.</p>";s:5:"da_DK";s:105:"<p>En kopi af din mail vil automatisk blive sendt til den adresse du angav, for dine egne optegnelse.</p>";s:5:"nl_NL";s:79:"<p>Een kopie van je bericht wordt verzonden naar het opgegeven e-mailadres.</p>";s:5:"fr_FR";s:118:"<p>Pour vos archives, une copie de votre email sera automatiquement envoyée à l’adresse que vous avez fournie.</p>";s:5:"de_DE";s:122:"<p>Eine Kopie Ihrer E-Mail wird automatisch für Ihre eigenen Unterlagen an die von Ihnen angegebene Adresse gesendet.</p>";s:5:"it_IT";s:110:"<p>Una copia dell\'e-mail verrà mandata automaticamente all\'indirizzo fornito per registrazione personale.</p>";}', '', 'zp-core/zp-extensions/contact_form.php'),
(383, 0, 'contactform_dataconfirmation', '0', '', 'zp-core/zp-extensions/contact_form.php'),
(384, 0, 'zpcookieconsent_expirydays', '365', '', 'zp-core/zp-extensions/cookieconsent.php'),
(385, 0, 'zpcookieconsent_theme', 'block', '', 'zp-core/zp-extensions/cookieconsent.php'),
(386, 0, 'zpcookieconsent_position', 'bottom', '', 'zp-core/zp-extensions/cookieconsent.php'),
(387, 0, 'zpcookieconsent_colorpopup', '#000', '', 'zp-core/zp-extensions/cookieconsent.php'),
(388, 0, 'zpcookieconsent_colorbutton', '#f1d600', '', 'zp-core/zp-extensions/cookieconsent.php'),
(389, 0, 'zp_plugin_deprecated-functions', '9092', '', NULL),
(390, 0, 'deprecated_core_LanguageSubdomains_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(391, 0, 'deprecated_core_getLanguageText_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(392, 0, 'deprecated_core_setexifvars_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(393, 0, 'deprecated_core_hasPrimaryScripts_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(394, 0, 'deprecated_core_removeDir_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(395, 0, 'deprecated_core_tagURLs_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(396, 0, 'deprecated_core_unTagURLs_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(397, 0, 'deprecated_core_updateImageProcessorLink_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(398, 0, 'deprecated_core_pluginDebug_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(399, 0, 'deprecated_core_removeTrailingSlash_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(400, 0, 'deprecated_core_tidyHTML_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(401, 0, 'deprecated_core_PersistentObject_method', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(402, 0, 'deprecated_core_cleanHTML', '1', '', 'zp-core/zp-extensions/deprecated-functions.php'),
(414, 0, 'downloadList_directory', 'uploaded', '', 'zp-core/zp-extensions/downloadList.php'),
(415, 0, 'downloadList_showfilesize', '1', '', 'zp-core/zp-extensions/downloadList.php'),
(416, 0, 'downloadList_showdownloadcounter', '1', '', 'zp-core/zp-extensions/downloadList.php'),
(417, 0, 'downloadList_zipFromCache', '0', '', 'zp-core/zp-extensions/downloadList.php'),
(418, 0, 'dynamic_locale_visual', '0', '', 'zp-core/zp-extensions/dynamic-locale.php'),
(419, 0, 'dynamic_locale_subdomain', '0', '', 'zp-core/zp-extensions/dynamic-locale.php'),
(420, 0, 'elFinder_files', '1', '', 'zp-core/zp-extensions/elFinder.php'),
(421, 0, 'elFinder_tinymce', '0', '', 'zp-core/zp-extensions/elFinder.php'),
(422, 0, 'favorites_multi', '0', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(423, 0, 'favorites_link', '_PAGE_/favorites', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(424, 0, 'favorites_title', 'a:6:{s:5:"en_US";s:12:"My favorites";s:5:"da_DK";s:15:"Mine favoritter";s:5:"nl_NL";s:15:"Mijn favorieten";s:5:"fr_FR";s:11:"Mes favoris";s:5:"de_DE";s:15:"Meine Favoriten";s:5:"it_IT";s:9:"Preferiti";}', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(425, 0, 'favorites_linktext', 'a:6:{s:5:"en_US";s:12:"My favorites";s:5:"da_DK";s:15:"Mine favoritter";s:5:"nl_NL";s:15:"Mijn favorieten";s:5:"fr_FR";s:11:"Mes favoris";s:5:"de_DE";s:15:"Meine Favoriten";s:5:"it_IT";s:9:"Preferiti";}', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(426, 0, 'favorites_desc', 'a:6:{s:5:"en_US";s:44:"The albums and images selected as favorites.";s:5:"da_DK";s:51:"Albums og billeder, der er markeret som favoritter.";s:5:"nl_NL";s:63:"De albums en afbeeldingen die zijn geselecteerd als favorieten.";s:5:"fr_FR";s:54:"Les albums et les images sélectionnés comme favoris.";s:5:"de_DE";s:49:"Die als Favoriten ausgewählten Alben und Bilder.";s:5:"it_IT";s:39:"Album e immagini scelti come preferiti.";}', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(427, 0, 'favorites_add_button', 'a:6:{s:5:"en_US";s:12:"Add favorite";s:5:"da_DK";s:15:"Tilføj favorit";s:5:"nl_NL";s:23:"Voeg toe aan favorieten";s:5:"fr_FR";s:17:"Ajouter un favori";s:5:"de_DE";s:19:"Favorit hinzufügen";s:5:"it_IT";s:18:"Aggiungi preferito";}', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(428, 0, 'favorites_remove_button', 'a:6:{s:5:"en_US";s:15:"Remove favorite";s:5:"da_DK";s:13:"Fjern favorit";s:5:"nl_NL";s:18:"Verwijder favoriet";s:5:"fr_FR";s:17:"Enlever un favori";s:5:"de_DE";s:16:"Geringer Favorit";s:5:"it_IT";s:17:"Rimuovi preferito";}', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(429, 0, 'favorites_album_sort_type', 'title', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(430, 0, 'favorites_image_sort_type', 'title', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(431, 0, 'favorites_album_sort_direction', '', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(432, 0, 'favorites_image_sort_direction', '', '', 'zp-core/zp-extensions/favoritesHandler.php'),
(433, 0, 'flag_thumbnail_date', 'date', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(434, 0, 'flag_thumbnail_range', '3', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(435, 0, 'flag_thumbnail_new_text', 'NEW', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(436, 0, 'flag_thumbnail_unpublished_text', 'unpub', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(437, 0, 'flag_thumbnail_locked_text', 'locked', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(438, 0, 'flag_thumbnail_geodata_text', 'GPS', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(439, 0, 'flag_thumbnail_use_text', '', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(440, 0, 'flag_thumbnail_flag_new', '1', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(441, 0, 'flag_thumbnail_flag_locked', '1', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(442, 0, 'flag_thumbnail_flag_unpublished', '1', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(443, 0, 'flag_thumbnail_flag_geodata', '1', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(444, 0, 'flag_thumbnail_new_icon', 'new.png', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(445, 0, 'flag_thumbnail_unpublished_icon', 'action.png', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(446, 0, 'flag_thumbnail_locked_icon', 'lock.png', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(447, 0, 'flag_thumbnail_geodata_icon', 'GPS.png', '', 'zp-core/zp-extensions/flag_thumbnail.php'),
(448, 0, 'galleryArticles_albumCategory', '0', '', 'zp-core/zp-extensions/galleryArticles.php'),
(449, 0, 'galleryArticles_album_text', 'a:6:{s:5:"en_US";s:15:"New album: %1$s";s:5:"da_DK";s:15:"Nyt album: %1$s";s:5:"nl_NL";s:17:"Nieuw album: %1$s";s:5:"fr_FR";s:19:"Nouvel album : %1$s";s:5:"de_DE";s:17:"Neues Album: %1$s";s:5:"it_IT";s:17:"Nuovo album: %1$s";}', '', 'zp-core/zp-extensions/galleryArticles.php'),
(450, 0, 'galleryArticles_image_text', 'a:6:{s:5:"en_US";s:21:"New image: [%2$s]%1$s";s:5:"da_DK";s:24:"Nyt billede: [%2$s]%1$s ";s:5:"nl_NL";s:29:"Nieuwe afbeelding: [%2$s]%1$s";s:5:"fr_FR";s:27:"Nouvelle image : [%2$s]%1$s";s:5:"de_DE";s:22:"Neues Bild: [%2$s]%1$s";s:5:"it_IT";s:26:"Nuova immagine: [%2$s]%1$s";}', '', 'zp-core/zp-extensions/galleryArticles.php'),
(451, 0, 'galleryArticles_size', '80', '', 'zp-core/zp-extensions/galleryArticles.php'),
(452, 0, 'galleryArticles_protected', '0', '', 'zp-core/zp-extensions/galleryArticles.php'),
(453, 0, 'gmap_map_roadmap', '1', '', 'zp-core/zp-extensions/GoogleMap.php'),
(454, 0, 'gmap_map_hybrid', '1', '', 'zp-core/zp-extensions/GoogleMap.php'),
(455, 0, 'gmap_map_satellite', '1', '', 'zp-core/zp-extensions/GoogleMap.php'),
(456, 0, 'gmap_map_terrain', '1', '', 'zp-core/zp-extensions/GoogleMap.php'),
(457, 0, 'gmap_starting_map', 'HYBRID', '', 'zp-core/zp-extensions/GoogleMap.php'),
(458, 0, 'gmap_control_type', 'HORIZONTAL_BAR', '', 'zp-core/zp-extensions/GoogleMap.php'),
(459, 0, 'gmap_zoom_size', 'LARGE', '', 'zp-core/zp-extensions/GoogleMap.php'),
(460, 0, 'gmap_cluster_max_zoom', '13', '', 'zp-core/zp-extensions/GoogleMap.php'),
(461, 0, 'gmap_sessions', '1', '', 'zp-core/zp-extensions/GoogleMap.php'),
(462, 0, 'gmap_display', 'hide', '', 'zp-core/zp-extensions/GoogleMap.php'),
(464, 0, 'hitcounter_ignoreIPList_enable', '0', '', 'zp-core/zp-extensions/hitcounter.php'),
(465, 0, 'hitcounter_ignoreSearchCrawlers_enable', '0', '', 'zp-core/zp-extensions/hitcounter.php'),
(466, 0, 'hitcounter_ignoreIPList', '', '', 'zp-core/zp-extensions/hitcounter.php'),
(467, 0, 'hitcounter_searchCrawlerList', 'Teoma, alexa, froogle, Gigabot,inktomi, looksmart, URL_Spider_SQL, Firefly, NationalDirectory, Ask Jeeves, TECNOSEEK, InfoSeek, WebFindBot, girafabot, crawler, www.galaxy.com, Googlebot, Scooter, Slurp, msnbot, appie, FAST, WebBug, Spade, ZyBorg, rabaz ,Baiduspider, Feedfetcher-Google, TechnoratiSnoop, Rankivabot, Mediapartners-Google, Sogou web spider, WebAlta Crawler', '', 'zp-core/zp-extensions/hitcounter.php'),
(468, 0, 'htmlmeta_cache_control', 'no-cache', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(469, 0, 'htmlmeta_pragma', 'no-cache', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(470, 0, 'htmlmeta_robots', 'index', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(471, 0, 'htmlmeta_revisit_after', '10 Days', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(472, 0, 'htmlmeta_expires', '43200', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(473, 0, 'htmlmeta_tags', '', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(474, 0, 'htmlmeta_google-site-verification', '', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(475, 0, 'htmlmeta_htmlmeta_tags', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(476, 0, 'htmlmeta_http-equiv-cache-control', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(477, 0, 'htmlmeta_http-equiv-pragma', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(478, 0, 'htmlmeta_name=keywords', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(479, 0, 'htmlmeta_name-description', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(480, 0, 'htmlmeta_name-robot', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(481, 0, 'htmlmeta_name-publisher', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(482, 0, 'htmlmeta_name-creator', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(483, 0, 'htmlmeta_name-author', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(484, 0, 'htmlmeta_name-copyright', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(485, 0, 'htmlmeta_name-generator', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(486, 0, 'htmlmeta_name-revisit-after', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(487, 0, 'htmlmeta_name-expires', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(489, 0, 'htmlmeta_name-date', '1', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(490, 0, 'htmlmeta_canonical-url', '0', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(491, 0, 'htmlmeta_sitelogo', '', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(492, 0, 'htmlmeta_fb-app_id', '', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(493, 0, 'htmlmeta_twittercard', '', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(494, 0, 'htmlmeta_twittername', '', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(495, 0, 'htmlmeta_ogimage_width', '1280', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(496, 0, 'htmlmeta_ogimage_height', '900', '', 'zp-core/zp-extensions/html_meta_tags.php'),
(497, 0, 'ipBlocker_list', 'a:0:{}', '', 'zp-core/zp-extensions/ipBlocker.php'),
(498, 0, 'ipBlocker_type', 'block', '', 'zp-core/zp-extensions/ipBlocker.php'),
(499, 0, 'ipBlocker_threshold', '10', '', 'zp-core/zp-extensions/ipBlocker.php'),
(500, 0, 'ipBlocker_timeout', '60', '', 'zp-core/zp-extensions/ipBlocker.php'),
(501, 0, 'zp_plugin_jplayer', '0', '', NULL),
(502, 0, 'jplayer_autoplay', '', '', 'zp-core/zp-extensions/jplayer.php'),
(503, 0, 'jplayer_poster', '1', '', 'zp-core/zp-extensions/jplayer.php'),
(504, 0, 'jplayer_postercrop', '1', '', 'zp-core/zp-extensions/jplayer.php'),
(505, 0, 'jplayer_showtitle', '', '', 'zp-core/zp-extensions/jplayer.php'),
(506, 0, 'jplayer_playlist', '', '', 'zp-core/zp-extensions/jplayer.php'),
(507, 0, 'jplayer_playlist_numbered', '1', '', 'zp-core/zp-extensions/jplayer.php'),
(508, 0, 'jplayer_playlist_playtime', '0', '', 'zp-core/zp-extensions/jplayer.php'),
(509, 0, 'jplayer_download', '', '', 'zp-core/zp-extensions/jplayer.php'),
(510, 0, 'jplayer_size', 'jp-video-270p', '', 'zp-core/zp-extensions/jplayer.php'),
(511, 0, 'jplayer_skin', 'zenphotolight', '', 'zp-core/zp-extensions/jplayer.php'),
(512, 0, 'jplayer_counterparts', '0', '', 'zp-core/zp-extensions/jplayer.php'),
(513, 0, 'matomo_disablecookies', '0', '', 'zp-core/zp-extensions/matomo.php'),
(514, 0, 'matomo_requireconsent', 'no-consent', '', 'zp-core/zp-extensions/matomo.php'),
(515, 0, 'mergedrss_items', '10', '', 'zp-core/zp-extensions/mergedRSS.php'),
(516, 0, 'multiple_layouts_images', '0', '', 'zp-core/zp-extensions/multiple_layouts.php'),
(517, 0, 'multiple_layouts_albums', '0', '', 'zp-core/zp-extensions/multiple_layouts.php'),
(518, 0, 'multiple_layouts_pages', '1', '', 'zp-core/zp-extensions/multiple_layouts.php'),
(519, 0, 'multiple_layouts_news', '1', '', 'zp-core/zp-extensions/multiple_layouts.php'),
(520, 0, 'multiple_layouts_news_categories', '1', '', 'zp-core/zp-extensions/multiple_layouts.php'),
(521, 0, 'osmap_width', '100%', '', 'zp-core/zp-extensions/openstreetmap.php'),
(522, 0, 'osmap_height', '300px', '', 'zp-core/zp-extensions/openstreetmap.php'),
(523, 0, 'osmap_zoom', '4', '', 'zp-core/zp-extensions/openstreetmap.php'),
(524, 0, 'osmap_minzoom', '2', '', 'zp-core/zp-extensions/openstreetmap.php'),
(525, 0, 'osmap_maxzoom', '18', '', 'zp-core/zp-extensions/openstreetmap.php'),
(526, 0, 'osmap_controlpos', 'topleft', '', 'zp-core/zp-extensions/openstreetmap.php'),
(527, 0, 'osmap_maptiles', 'OpenStreetMap_Mapnik', '', 'zp-core/zp-extensions/openstreetmap.php'),
(528, 0, 'osmap_clusterradius', '40', '', 'zp-core/zp-extensions/openstreetmap.php'),
(529, 0, 'osmap_markerpopup', '1', '', 'zp-core/zp-extensions/openstreetmap.php'),
(530, 0, 'osmap_markerpopup_title', '1', '', 'zp-core/zp-extensions/openstreetmap.php'),
(531, 0, 'osmap_markerpopup_desc', '1', '', 'zp-core/zp-extensions/openstreetmap.php'),
(532, 0, 'osmap_markerpopup_thumb', '1', '', 'zp-core/zp-extensions/openstreetmap.php'),
(533, 0, 'osmap_showscale', '1', '', 'zp-core/zp-extensions/openstreetmap.php'),
(534, 0, 'osmap_showalbummarkers', '0', '', 'zp-core/zp-extensions/openstreetmap.php'),
(535, 0, 'osmap_showminimap', '0', '', 'zp-core/zp-extensions/openstreetmap.php'),
(536, 0, 'osmap_minimap_width', '100', '', 'zp-core/zp-extensions/openstreetmap.php'),
(537, 0, 'osmap_minimap_height', '100', '', 'zp-core/zp-extensions/openstreetmap.php'),
(538, 0, 'osmap_minimap_zoom', '-5', '', 'zp-core/zp-extensions/openstreetmap.php'),
(539, 0, 'osmap_cluster_showcoverage_on_hover', '0', '', 'zp-core/zp-extensions/openstreetmap.php'),
(540, 0, 'PHPMailer_mail_protocol', 'sendmail', '', 'zp-core/zp-extensions/PHPMailer.php'),
(541, 0, 'PHPMailer_server', '', '', 'zp-core/zp-extensions/PHPMailer.php'),
(542, 0, 'PHPMailer_pop_port', '110', '', 'zp-core/zp-extensions/PHPMailer.php'),
(543, 0, 'PHPMailer_smtp_port', '25', '', 'zp-core/zp-extensions/PHPMailer.php'),
(544, 0, 'PHPMailer_user', '', '', 'zp-core/zp-extensions/PHPMailer.php'),
(545, 0, 'PHPMailer_password', '', '', 'zp-core/zp-extensions/PHPMailer.php'),
(546, 0, 'PHPMailer_secure', '0', '', 'zp-core/zp-extensions/PHPMailer.php'),
(547, 0, 'pagedthumbs_imagesperpage', '10', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(548, 0, 'pagedthumbs_counter', '', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(549, 0, 'pagedthumbs_prevtext', 'a:6:{s:5:"en_US";s:14:"« prev thumbs";s:5:"da_DK";s:21:"« forrige miniaturer";s:5:"nl_NL";s:9:"« vorige";s:5:"fr_FR";s:30:"‹‹ vignettes précédentes";s:5:"de_DE";s:20:"« vorige Thumbnails";s:5:"it_IT";s:17:"« miniature prec";}', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(550, 0, 'pagedthumbs_nexttext', 'a:6:{s:5:"en_US";s:14:"next thumbs »";s:5:"da_DK";s:20:"næste miniaturer »";s:5:"nl_NL";s:11:"volgende »";s:5:"fr_FR";s:26:"vignettes suivantes ››";s:5:"de_DE";s:22:"nächste Thumbnails »";s:5:"it_IT";s:17:"miniature succ »";}', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(551, 0, 'pagedthumbs_width', '50', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(552, 0, 'pagedthumbs_height', '50', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(553, 0, 'pagedthumbs_crop', '1', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(554, 0, 'pagedthumbs_placeholders', '', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(555, 0, 'pagedthumbs_pagelist', '', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(556, 0, 'pagedthumbs_pagelistprevnext', '', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(557, 0, 'pagedthumbs_pagelistlength', '6', '', 'zp-core/zp-extensions/paged_thumbs_nav.php'),
(558, 0, 'print_album_menu_showsubs', '0', '', 'zp-core/zp-extensions/print_album_menu.php'),
(559, 0, 'print_album_menu_count', '1', '', 'zp-core/zp-extensions/print_album_menu.php'),
(560, 0, 'quota_default', '250000', '', 'zp-core/zp-extensions/quota_manager.php'),
(561, 0, 'quota_allowZIP', '1', '', 'zp-core/zp-extensions/quota_manager.php'),
(562, 0, 'rating_recast', '1', '', 'zp-core/zp-extensions/rating.php'),
(563, 0, 'rating_stars_count', '5', '', 'zp-core/zp-extensions/rating.php'),
(564, 0, 'rating_split_stars', '2', '', 'zp-core/zp-extensions/rating.php'),
(565, 0, 'rating_status', '3', '', 'zp-core/zp-extensions/rating.php'),
(566, 0, 'rating_image_individual_control', '0', '', 'zp-core/zp-extensions/rating.php'),
(567, 0, 'register_user_link', '_PAGE_/register', '', 'zp-core/zp-extensions/register_user.php'),
(568, 0, 'register_user_text', 'a:6:{s:5:"en_US";s:129:"You have received this email because you registered with the user id %3$s on this site.\nTo complete your registration visit %1$s.";s:5:"da_DK";s:145:"Du har modtaget denne mail fordi du har registreret dig med brugernavn %3$s på dette websted.\nGør din registrering færdig ved at besøge %1$s.";s:5:"nl_NL";s:136:"Je ontvangt deze e-mail omdat je je bij de site hebt geregistreerd met gebruikersnaam %3$s \nGa naar %1$s om de registratie te voltooien.";s:5:"fr_FR";s:166:"Vous avez reçu cet email parce que vous vous êtes enregistré sur ce site sous le nom d’utilisateur %3$s. \nPour compléter votre inscription, rendez-vous à %1$s.";s:5:"de_DE";s:169:"Sie haben diese E-Mail erhalten, weil Sie sich mit der Benutzer-ID %3$s auf dieser Seite registriert haben. Bitte besuchen Sie %1$s, um die Registrierung abzuschließen.";s:5:"it_IT";s:142:"Si sta ricevendo questa e-mail perché ci si è registrati su questo sito col nome utente %3$s.\nPer completare la registrazione visitare %1$s.";}', '', 'zp-core/zp-extensions/register_user.php'),
(569, 0, 'register_user_page_tip', 'a:6:{s:5:"en_US";s:37:"Click here to register for this site.";s:5:"da_DK";s:40:"Klik her for at tilmelde dig dette site.";s:5:"nl_NL";s:46:"Klik hier om je te registreren voor deze site.";s:5:"fr_FR";s:43:"Cliquez ici pour vous inscrire sur ce site.";s:5:"de_DE";s:52:"Hier klicken, um sich auf die Seite zu registrieren.";s:5:"it_IT";s:38:"Fare clic qui per registrarsi al sito.";}', '', 'zp-core/zp-extensions/register_user.php'),
(570, 0, 'register_user_page_link', 'a:5:{s:5:"en_US";s:8:"Register";s:5:"nl_NL";s:11:"Registreren";s:5:"fr_FR";s:14:"Inscrivez-vous";s:5:"de_DE";s:12:"Registrieren";s:5:"it_IT";s:13:"Registrazione";}', '', 'zp-core/zp-extensions/register_user.php'),
(571, 0, 'register_user_captcha', '0', '', 'zp-core/zp-extensions/register_user.php'),
(572, 0, 'register_user_email_is_id', '1', '', 'zp-core/zp-extensions/register_user.php'),
(573, 0, 'register_user_create_album', '0', '', 'zp-core/zp-extensions/register_user.php'),
(574, 0, 'register_user_notify', '0', '', NULL),
(575, 0, 'register_user_dataconfirmation', '0', '', 'zp-core/zp-extensions/register_user.php'),
(576, 0, 'reCaptcha_theme', 'light', '', 'zp-core/zp-extensions/reCaptcha.php'),
(577, 0, 'reCaptcha_type', 'image', '', 'zp-core/zp-extensions/reCaptcha.php'),
(578, 0, 'reCaptcha_size', 'normal', '', 'zp-core/zp-extensions/reCaptcha.php'),
(582, 0, 'zp_plugin_rewriteTokens', '5046', '', 'zp-core/zp-extensions/rewriteTokens.php');
INSERT INTO `_options` (`id`, `ownerid`, `name`, `value`, `theme`, `creator`) VALUES
(584, 0, 'zp_plugin_rss', '2948', '', 'zp-core/zp-extensions/rss.php'),
(585, 0, 'RSS_truncate_length', '100', '', 'zp-core/zp-extensions/rss.php'),
(586, 0, 'RSS_zenpage_items', '10', '', 'zp-core/zp-extensions/rss.php'),
(587, 0, 'RSS_items', '10', '', 'zp-core/zp-extensions/rss.php'),
(588, 0, 'RSS_imagesize', '240', '', 'zp-core/zp-extensions/rss.php'),
(589, 0, 'RSS_sortorder', 'latest', '', 'zp-core/zp-extensions/rss.php'),
(590, 0, 'RSS_items_albums', '10', '', 'zp-core/zp-extensions/rss.php'),
(591, 0, 'RSS_imagesize_albums', '240', '', 'zp-core/zp-extensions/rss.php'),
(592, 0, 'RSS_sortorder_albums', 'latest', '', 'zp-core/zp-extensions/rss.php'),
(593, 0, 'RSS_enclosure', '0', '', 'zp-core/zp-extensions/rss.php'),
(594, 0, 'RSS_mediarss', '0', '', 'zp-core/zp-extensions/rss.php'),
(595, 0, 'RSS_cache', '1', '', 'zp-core/zp-extensions/rss.php'),
(596, 0, 'RSS_cache_expire', '86400', '', 'zp-core/zp-extensions/rss.php'),
(597, 0, 'RSS_hitcounter', '1', '', 'zp-core/zp-extensions/rss.php'),
(598, 0, 'RSS_title', 'both', '', 'zp-core/zp-extensions/rss.php'),
(599, 0, 'zp_plugin_security-logger', '8292', '', 'zp-core/zp-extensions/security-logger.php'),
(600, 0, 'logger_log_guests', '1', '', 'zp-core/zp-extensions/security-logger.php'),
(601, 0, 'logger_log_admin', '1', '', 'zp-core/zp-extensions/security-logger.php'),
(602, 0, 'logger_log_type', 'all', '', 'zp-core/zp-extensions/security-logger.php'),
(603, 0, 'logge_access_log_type', 'all_user', '', 'zp-core/zp-extensions/security-logger.php'),
(604, 0, 'security_log_size', '5000000', '', 'zp-core/zp-extensions/security-logger.php'),
(605, 0, 'search_statistics_threshold', '25', '', 'zp-core/zp-extensions/search_statistics.php'),
(606, 0, 'search_statistics_terms_threshold', '25', '', 'zp-core/zp-extensions/search_statistics.php'),
(607, 0, 'search_statistics_failed_threshold', '10', '', 'zp-core/zp-extensions/search_statistics.php'),
(608, 0, 'search_statistics_ip_threshold', '10', '', 'zp-core/zp-extensions/search_statistics.php'),
(609, 0, 'zenphoto_seo_lowercase', '1', '', 'zp-core/zp-extensions/seo_zenphoto.php'),
(610, 0, 'Words_to_die_on', 'cialis,ebony,nude,porn,porno,pussy,upskirt,ringtones,phentermine,viagra,levitra', '', 'zp-core/zp-extensions/simpleSpam.php'),
(611, 0, 'Patterns_to_die_on', '\\[url=.*\\]', '', 'zp-core/zp-extensions/simpleSpam.php'),
(612, 0, 'Excessive_URL_count', '5', '', 'zp-core/zp-extensions/simpleSpam.php'),
(613, 0, 'Forgiving', '0', '', 'zp-core/zp-extensions/simpleSpam.php'),
(614, 0, 'Banned_IP_list', 'a:0:{}', '', 'zp-core/zp-extensions/simpleSpam.php'),
(620, 0, 'sitemap_changefreq_index', 'daily', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(621, 0, 'sitemap_changefreq_albums', 'daily', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(622, 0, 'sitemap_changefreq_images', 'daily', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(623, 0, 'sitemap_changefreq_pages', 'weekly', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(624, 0, 'sitemap_changefreq_newsindex', 'daily', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(625, 0, 'sitemap_changefreq_news', 'daily', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(626, 0, 'sitemap_changefreq_newscats', 'weekly', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(627, 0, 'sitemap_lastmod_albums', 'mtime', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(628, 0, 'sitemap_lastmod_images', 'mtime', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(629, 0, 'sitemap_processing_chunk', '25', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(630, 0, 'sitemap_google', '0', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(631, 0, 'sitemap_google_fullimage', '0', '', 'zp-core/zp-extensions/sitemap-extended.php'),
(632, 0, 'zp_plugin_site_upgrade', '2948', '', 'zp-core/zp-extensions/site_upgrade.php'),
(649, 0, 'cycle-slideshow_width', '595', '', 'zp-core/zp-extensions/slideshow2.php'),
(650, 0, 'cycle-slideshow_height', '595', '', 'zp-core/zp-extensions/slideshow2.php'),
(651, 0, 'cycle-slideshow_mode', 'cycle', '', 'zp-core/zp-extensions/slideshow2.php'),
(652, 0, 'cycle-slideshow_effect', 'fade', '', 'zp-core/zp-extensions/slideshow2.php'),
(653, 0, 'cycle-slideshow_speed', '1000', '', 'zp-core/zp-extensions/slideshow2.php'),
(654, 0, 'cycle-slideshow_timeout', '3000', '', 'zp-core/zp-extensions/slideshow2.php'),
(655, 0, 'cycle-slideshow_showdesc', '0', '', 'zp-core/zp-extensions/slideshow2.php'),
(656, 0, 'cycle-slideshow_colorbox_transition', 'fade', '', 'zp-core/zp-extensions/slideshow2.php'),
(657, 0, 'cycle-slideshow_colorbox_imagetype', 'sizedimage', '', 'zp-core/zp-extensions/slideshow2.php'),
(658, 0, 'cycle-slideshow_colorbox_imagetitle', '1', '', 'zp-core/zp-extensions/slideshow2.php'),
(659, 0, 'tagsuggest_excludeunassigned', '1', '', 'zp-core/zp-extensions/tag_suggest.php'),
(660, 0, 'tagsuggest_checkaccess', '0', '', 'zp-core/zp-extensions/tag_suggest.php'),
(661, 0, 'themeSwitcher_theme_basic', '1', '', 'zp-core/zp-extensions/themeSwitcher.php'),
(662, 0, 'themeSwitcher_theme_garland', '1', '', 'zp-core/zp-extensions/themeSwitcher.php'),
(663, 0, 'themeSwitcher_theme_zenpage', '1', '', 'zp-core/zp-extensions/themeSwitcher.php'),
(664, 0, 'themeSwitcher_theme_zpmobile', '1', '', 'zp-core/zp-extensions/themeSwitcher.php'),
(665, 0, 'themeSwitcher_timeout', '120', '', 'zp-core/zp-extensions/themeSwitcher.php'),
(666, 0, 'themeSwitcher_css', '.themeSwitcherControlLink {\n position: fixed;\n z-index: 10000;\n left: 0px;\n top: 0px;\n border-bottom: 1px solid #444;\n border-left: 1px solid #444;\n color: black;\n padding: 2px;\n background-color: #f5f5f5 !important;\n}\n', '', 'zp-core/zp-extensions/themeSwitcher.php'),
(667, 0, 'themeSwitcher_css_loggedin', '.themeSwitcherControlLink {\n position: fixed;\n z-index: 10000;\n left: 0px;\n top: 30px;\n border-bottom: 1px solid #444;\n border-left: 1px solid #444;\n color: black;\n padding: 2px;\n background-color: #f5f5f5 !important;\n}\n', '', 'zp-core/zp-extensions/themeSwitcher.php'),
(668, 0, 'themeSwitcher_adminOnly', '1', '', 'zp-core/zp-extensions/themeSwitcher.php'),
(669, 0, 'tinymce4_zenphoto', 'zenphoto-ribbon.js.php', '', 'zp-core/zp-extensions/tinymce4.php'),
(670, 0, 'tinymce4_zenpage', 'zenpage-slim.js.php', '', 'zp-core/zp-extensions/tinymce4.php'),
(671, 0, 'tinymce4_entitiyencoding', 'raw', '', 'zp-core/zp-extensions/tinymce4.php'),
(672, 0, 'zp_plugin_tinyURL', '8197', '', 'zp-core/zp-extensions/tinyURL.php'),
(673, 0, 'tinyURL_agressive', '0', '', 'zp-core/zp-extensions/tinyURL.php'),
(674, 0, 'tinyURL_text', 'tiny', '', 'zp-core/zp-extensions/tinyURL.php'),
(676, 0, 'spamFilter_none_action', 'pass', '', 'zp-core/zp-extensions/trivialSpam.php'),
(678, 0, 'zp_plugin_uploader_jQuery', '4101', '', 'zp-core/zp-extensions/uploader_jQuery.php'),
(680, 0, 'zp_plugin_uploader_http', '4101', '', 'zp-core/zp-extensions/uploader_http.php'),
(682, 0, 'user_expiry_interval', '365', '', 'zp-core/zp-extensions/user-expiry.php'),
(683, 0, 'user_expiry_warn_interval', '7', '', 'zp-core/zp-extensions/user-expiry.php'),
(684, 0, 'user_expiry_auto_renew', '0', '', 'zp-core/zp-extensions/user-expiry.php'),
(685, 0, 'user_expiry_password_cycle', '0', '', 'zp-core/zp-extensions/user-expiry.php'),
(686, 0, 'zp_plugin_userAddressFields', '8197', '', 'zp-core/zp-extensions/userAddressFields.php'),
(687, 0, 'userAddressFields_addedFields', 'a:1:{s:14:"administrators";a:6:{s:6:"street";b:1;s:7:"website";b:1;s:4:"city";b:1;s:7:"country";b:1;s:5:"state";b:1;s:6:"postal";b:1;}}', '', NULL),
(690, 0, 'user_logout_login_form', '0', '', 'zp-core/zp-extensions/user_login-out.php'),
(691, 0, 'xmpMetadata_suffix', 'xmp', '', 'zp-core/zp-extensions/xmpMetadata.php'),
(692, 0, 'zenpageNewsLink', 'news', '', 'zp-core/zp-extensions/zenpage.php'),
(693, 0, 'zenpageCategoryLink', '_NEWS_/category', '', 'zp-core/zp-extensions/zenpage.php'),
(694, 0, 'zenpageNewsArchiveLink', '_NEWS_/archive', '', 'zp-core/zp-extensions/zenpage.php'),
(695, 0, 'zenpagePagesLink', 'pages', '', 'zp-core/zp-extensions/zenpage.php'),
(696, 0, 'zenpage_articles_per_page', '10', '', 'zp-core/zp-extensions/zenpage.php'),
(697, 0, 'zenpage_text_length', '500', '', 'zp-core/zp-extensions/zenpage.php'),
(698, 0, 'zenpage_textshorten_indicator', ' (...)', '', 'zp-core/zp-extensions/zenpage.php'),
(699, 0, 'zenpage_read_more', 'a:6:{s:5:"en_US";s:9:"Read more";s:5:"da_DK";s:10:"Læse mere";s:5:"nl_NL";s:9:"Lees meer";s:5:"fr_FR";s:13:"Lire la suite";s:5:"de_DE";s:10:"Mehr lesen";s:5:"it_IT";s:11:"Leggi tutto";}', '', 'zp-core/zp-extensions/zenpage.php'),
(700, 0, 'zenpage_indexhitcounter', '', '', 'zp-core/zp-extensions/zenpage.php'),
(701, 0, 'enabled-zenpage-items', 'news-and-pages', '', 'zp-core/zp-extensions/zenpage.php'),
(702, 0, 'zenphoto_news_length', '0', '', 'zp-core/zp-extensions/zenphoto_news.php'),
(703, 0, 'license_accepted', '1.5', '', NULL),
(706, 0, 'magick_max_height', '0', '', 'zp-core/lib-Imagick.php'),
(707, 0, 'magick_max_width', '0', '', 'zp-core/lib-Imagick.php'),
(719, 0, 'image_allow_upscale', '1', '', NULL),
(720, 0, 'thumb_sharpen', '0', '', NULL),
(721, 0, 'image_sharpen', '0', '', NULL),
(722, 0, 'image_interlace', '0', '', NULL),
(723, 0, 'ImbedIPTC', '0', '', NULL),
(729, 0, 'fullimage_watermark', '', '', NULL),
(730, 0, 'fullsizeimage_watermark', '', '', NULL),
(735, 0, 'image_cache_suffix', '', '', NULL),
(736, 0, 'Image_watermark', '', '', NULL),
(741, 0, 'secure_image_processor', '0', '', NULL),
(742, 0, 'protected_image_cache', '0', '', NULL),
(747, 0, 'use_embedded_thumb', '0', '', NULL),
(750, 0, 'EXIFMake-disabled', '0', '', NULL),
(752, 0, 'EXIFModel-disabled', '0', '', NULL),
(754, 0, 'EXIFDescription-disabled', '0', '', NULL),
(756, 0, 'IPTCObjectName-disabled', '0', '', NULL),
(758, 0, 'IPTCImageHeadline-disabled', '0', '', NULL),
(760, 0, 'IPTCImageCaption-disabled', '0', '', NULL),
(762, 0, 'IPTCImageCaptionWriter-disabled', '0', '', NULL),
(764, 0, 'EXIFDateTime-disabled', '0', '', NULL),
(766, 0, 'EXIFDateTimeOriginal-disabled', '0', '', NULL),
(768, 0, 'EXIFDateTimeDigitized-disabled', '0', '', NULL),
(770, 0, 'IPTCDateCreated-disabled', '0', '', NULL),
(772, 0, 'IPTCTimeCreated-disabled', '0', '', NULL),
(774, 0, 'IPTCDigitizeDate-disabled', '0', '', NULL),
(776, 0, 'IPTCDigitizeTime-disabled', '0', '', NULL),
(778, 0, 'EXIFArtist-disabled', '0', '', NULL),
(780, 0, 'IPTCImageCredit-disabled', '0', '', NULL),
(782, 0, 'IPTCByLine-disabled', '0', '', NULL),
(784, 0, 'IPTCByLineTitle-disabled', '0', '', NULL),
(786, 0, 'IPTCSource-disabled', '0', '', NULL),
(788, 0, 'IPTCContact-disabled', '0', '', NULL),
(790, 0, 'EXIFCopyright-disabled', '0', '', NULL),
(792, 0, 'IPTCCopyright-disabled', '0', '', NULL),
(794, 0, 'IPTCKeywords-disabled', '0', '', NULL),
(796, 0, 'EXIFExposureTime-disabled', '0', '', NULL),
(798, 0, 'EXIFFNumber-disabled', '0', '', NULL),
(800, 0, 'EXIFISOSpeedRatings-disabled', '0', '', NULL),
(802, 0, 'EXIFExposureBiasValue-disabled', '0', '', NULL),
(804, 0, 'EXIFMeteringMode-disabled', '0', '', NULL),
(806, 0, 'EXIFFlash-disabled', '0', '', NULL),
(808, 0, 'EXIFImageWidth-disabled', '0', '', NULL),
(810, 0, 'EXIFImageHeight-disabled', '0', '', NULL),
(812, 0, 'EXIFOrientation-disabled', '0', '', NULL),
(814, 0, 'EXIFSoftware-disabled', '0', '', NULL),
(816, 0, 'EXIFContrast-disabled', '0', '', NULL),
(818, 0, 'EXIFSharpness-disabled', '0', '', NULL),
(820, 0, 'EXIFSaturation-disabled', '0', '', NULL),
(822, 0, 'EXIFWhiteBalance-disabled', '0', '', NULL),
(824, 0, 'EXIFSubjectDistance-disabled', '0', '', NULL),
(826, 0, 'EXIFFocalLength-disabled', '0', '', NULL),
(828, 0, 'EXIFLensType-disabled', '0', '', NULL),
(830, 0, 'EXIFLensInfo-disabled', '0', '', NULL),
(832, 0, 'EXIFFocalLengthIn35mmFilm-disabled', '0', '', NULL),
(834, 0, 'IPTCCity-disabled', '0', '', NULL),
(836, 0, 'IPTCSubLocation-disabled', '0', '', NULL),
(838, 0, 'IPTCState-disabled', '0', '', NULL),
(840, 0, 'IPTCLocationCode-disabled', '0', '', NULL),
(842, 0, 'IPTCLocationName-disabled', '0', '', NULL),
(844, 0, 'IPTCContentLocationCode-disabled', '0', '', NULL),
(846, 0, 'IPTCContentLocationName-disabled', '0', '', NULL),
(848, 0, 'EXIFGPSLatitude-disabled', '0', '', NULL),
(850, 0, 'EXIFGPSLatitudeRef-disabled', '0', '', NULL),
(852, 0, 'EXIFGPSLongitude-disabled', '0', '', NULL),
(854, 0, 'EXIFGPSLongitudeRef-disabled', '0', '', NULL),
(856, 0, 'EXIFGPSAltitude-disabled', '0', '', NULL),
(858, 0, 'EXIFGPSAltitudeRef-disabled', '0', '', NULL),
(860, 0, 'IPTCOriginatingProgram-disabled', '0', '', NULL),
(862, 0, 'IPTCProgramVersion-disabled', '0', '', NULL),
(864, 0, 'VideoFormat-disabled', '0', '', NULL),
(866, 0, 'VideoSize-disabled', '0', '', NULL),
(868, 0, 'VideoArtist-disabled', '0', '', NULL),
(870, 0, 'VideoTitle-disabled', '0', '', NULL),
(872, 0, 'VideoBitrate-disabled', '0', '', NULL),
(874, 0, 'VideoBitrate_mode-disabled', '0', '', NULL),
(876, 0, 'VideoBits_per_sample-disabled', '0', '', NULL),
(878, 0, 'VideoCodec-disabled', '0', '', NULL),
(880, 0, 'VideoCompression_ratio-disabled', '0', '', NULL),
(882, 0, 'VideoDataformat-disabled', '0', '', NULL),
(884, 0, 'VideoEncoder-disabled', '0', '', NULL),
(886, 0, 'VideoSamplerate-disabled', '0', '', NULL),
(888, 0, 'VideoChannelmode-disabled', '0', '', NULL),
(890, 0, 'VideoChannels-disabled', '0', '', NULL),
(892, 0, 'VideoFramerate-disabled', '0', '', NULL),
(894, 0, 'VideoResolution_x-disabled', '0', '', NULL),
(896, 0, 'VideoResolution_y-disabled', '0', '', NULL),
(898, 0, 'VideoAspect_ratio-disabled', '0', '', NULL),
(900, 0, 'VideoPlaytime-disabled', '0', '', NULL),
(902, 0, 'XMPrating-disabled', '0', '', NULL),
(905, 0, 'use_imagick', '1', '', NULL),
(953, 0, 'zp_plugin_galleryArticles', '0', '', NULL),
(1143, 0, 'zp_plugin_bxslider_thumb_nav', '0', '', NULL),
(1144, 0, 'zp_plugin_class-AnyFile', '0', '', NULL),
(1145, 0, 'zp_plugin_class-textobject', '0', '', NULL),
(1146, 0, 'zp_plugin_class-video', '0', '', NULL),
(1147, 0, 'zp_plugin_class-WEBdocs', '0', '', NULL),
(1148, 0, 'zp_plugin_colorbox_js', '0', '', NULL),
(1149, 0, 'zp_plugin_crop_image', '4101', '', NULL),
(1150, 0, 'zp_plugin_favoritesHandler', '0', '', NULL),
(1151, 0, 'zp_plugin_flag_thumbnail', '0', '', NULL),
(1154, 0, 'zp_plugin_menu_manager', '0', '', NULL),
(1155, 0, 'zp_plugin_paged_thumbs_nav', '0', '', NULL),
(1156, 0, 'zp_plugin_print_album_menu', '0', '', NULL),
(1157, 0, 'zp_plugin_related_items', '0', '', NULL),
(1158, 0, 'zp_plugin_slideshow2', '0', '', NULL),
(1159, 0, 'zp_plugin_xmpMetadata', '0', '', NULL),
(1160, 0, 'zp_plugin_zenpage', '0', '', NULL),
(1175, 0, 'zenphoto_install', 'a:13:{s:22:"template-functions.php";s:64:"db8e3ea6a424741a03cf9243786dd5af424b29645a26f0db271007cbdd5a46fb";s:20:"functions-filter.php";s:64:"29fe46f1954a4ee9740009a9702e5dd82f6a762a48dcda62a26912ea44ea0513";s:12:"lib-auth.php";s:64:"0c75e8061ee7f5dca59bf6c647c490c96320aaf5649a1e98710257cb53a965cf";s:12:"lib-utf8.php";s:64:"f992ad3495b4b4011c9ffa8334c288e76d41845893670018bc3aa0de772c8dbc";s:13:"functions.php";s:64:"78b091e60e25c83067ac5e560db42a97a1910451399769f1175a6e08367a7985";s:19:"functions-basic.php";s:64:"d99658feb5e82cf5398cd6e3deab2c3f0fe2682c195aa7486e679c426437f87f";s:24:"functions-controller.php";s:64:"973a51828372ce2e530a20bdba393499264cc92dcc59588f376930fcff15ce9f";s:19:"functions-image.php";s:64:"18f8286b5e2d25a1e11877d5e31ec09eee5dbaf73758a702cf6e039b4097efa0";s:15:"SERVER_SOFTWARE";s:22:"Apache/2.4.37 (Ubuntu)";s:8:"ZENPHOTO";s:3:"1.5";s:6:"FOLDER";s:32:"/var/www/html/practicas/zenphoto";s:8:"DATABASE";s:13:"MySQLi 5.7.24";s:14:"SIGNATURE_HASH";s:64:"af948b5c5d5c28c0c4155966931d8c8d7d9958e83c3c8252eabe8c22e20c0f95";}', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `_pages`
--

CREATE TABLE `_pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `parentid` int(11) UNSIGNED DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `extracontent` text COLLATE utf8_unicode_ci,
  `sort_order` varchar(48) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `show` int(1) UNSIGNED NOT NULL DEFAULT '1',
  `titlelink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `commentson` int(1) UNSIGNED DEFAULT '0',
  `codeblock` text COLLATE utf8_unicode_ci,
  `author` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  `lastchange` datetime DEFAULT NULL,
  `lastchangeauthor` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `hitcounter` int(11) UNSIGNED DEFAULT '0',
  `permalink` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `locked` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `expiredate` datetime DEFAULT NULL,
  `total_value` int(11) UNSIGNED DEFAULT '0',
  `total_votes` int(11) UNSIGNED DEFAULT '0',
  `used_ips` longtext COLLATE utf8_unicode_ci,
  `rating` float DEFAULT NULL,
  `rating_status` int(1) DEFAULT '3',
  `user` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hint` text COLLATE utf8_unicode_ci,
  `custom_data` text COLLATE utf8_unicode_ci,
  `truncation` int(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_plugin_storage`
--

CREATE TABLE `_plugin_storage` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `aux` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `_plugin_storage`
--

INSERT INTO `_plugin_storage` (`id`, `type`, `aux`, `data`) VALUES
(10, 'defaultCodeblocks', '', 'a:0:{}'),
(17, 'cacheManager', 'basic', 'a:14:{s:5:"theme";s:5:"basic";s:5:"apply";b:0;s:10:"image_size";s:3:"100";s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";s:3:"100";s:11:"crop_height";s:3:"100";s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:1;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(18, 'cacheManager', 'basic', 'a:14:{s:5:"theme";s:5:"basic";s:5:"apply";b:0;s:10:"image_size";s:3:"595";s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:0;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(19, 'cacheManager', 'garland', 'a:14:{s:5:"theme";s:7:"garland";s:5:"apply";b:0;s:10:"image_size";i:520;s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:0;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(20, 'cacheManager', 'garland', 'a:14:{s:5:"theme";s:7:"garland";s:5:"apply";b:0;s:10:"image_size";i:85;s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";s:3:"100";s:11:"crop_height";s:3:"100";s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:1;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(21, 'cacheManager', 'zenpage', 'a:14:{s:5:"theme";s:7:"zenpage";s:5:"apply";b:0;s:10:"image_size";N;s:11:"image_width";i:580;s:12:"image_height";i:580;s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";N;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";b:1;s:5:"valid";i:1;}'),
(22, 'cacheManager', 'zenpage', 'a:14:{s:5:"theme";s:7:"zenpage";s:5:"apply";b:0;s:10:"image_size";i:95;s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";s:3:"100";s:11:"crop_height";s:3:"100";s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:1;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(23, 'cacheManager', 'zpMobile', 'a:14:{s:5:"theme";s:8:"zpMobile";s:5:"apply";b:0;s:10:"image_size";s:3:"595";s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:0;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(24, 'cacheManager', 'zpMobile', 'a:14:{s:5:"theme";s:8:"zpMobile";s:5:"apply";b:0;s:10:"image_size";N;s:11:"image_width";i:79;s:12:"image_height";i:79;s:10:"crop_width";i:79;s:11:"crop_height";i:79;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:1;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(25, 'cacheManager', 'openstreetmap', 'a:14:{s:5:"theme";s:13:"openstreetmap";s:5:"apply";b:0;s:10:"image_size";i:150;s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:1;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(26, 'cacheManager', 'bxslider_thumb_nav', 'a:14:{s:5:"theme";s:18:"bxslider_thumb_nav";s:5:"apply";b:0;s:10:"image_size";N;s:11:"image_width";s:2:"50";s:12:"image_height";s:2:"50";s:10:"crop_width";s:2:"50";s:11:"crop_height";s:2:"50";s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:1;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(27, 'cacheManager', 'GoogleMap', 'a:14:{s:5:"theme";s:9:"GoogleMap";s:5:"apply";b:0;s:10:"image_size";i:150;s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:1;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(28, 'cacheManager', 'galleryArticles', 'a:14:{s:5:"theme";s:15:"galleryArticles";s:5:"apply";b:0;s:10:"image_size";s:2:"80";s:11:"image_width";N;s:12:"image_height";N;s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:0;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(29, 'cacheManager', 'paged_thumbs_nav', 'a:14:{s:5:"theme";s:16:"paged_thumbs_nav";s:5:"apply";b:0;s:10:"image_size";N;s:11:"image_width";s:2:"50";s:12:"image_height";s:2:"50";s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";b:1;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";N;s:5:"valid";i:1;}'),
(30, 'cacheManager', 'cycle', 'a:14:{s:5:"theme";s:5:"cycle";s:5:"apply";b:0;s:10:"image_size";N;s:11:"image_width";s:3:"595";s:12:"image_height";s:3:"595";s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";N;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";b:1;s:5:"valid";i:1;}'),
(31, 'cacheManager', 'html_meta_tags', 'a:14:{s:5:"theme";s:14:"html_meta_tags";s:5:"apply";b:0;s:10:"image_size";N;s:11:"image_width";s:4:"1280";s:12:"image_height";s:3:"900";s:10:"crop_width";N;s:11:"crop_height";N;s:6:"crop_x";N;s:6:"crop_y";N;s:5:"thumb";N;s:3:"wmk";N;s:4:"gray";N;s:8:"maxspace";b:1;s:5:"valid";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `_search_cache`
--

CREATE TABLE `_search_cache` (
  `id` int(11) UNSIGNED NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_tags`
--

CREATE TABLE `_tags` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `_administrators`
--
ALTER TABLE `_administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `valid` (`valid`,`user`);

--
-- Indexes for table `_admin_to_object`
--
ALTER TABLE `_admin_to_object`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_albums`
--
ALTER TABLE `_albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `folder` (`folder`);

--
-- Indexes for table `_captcha`
--
ALTER TABLE `_captcha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_comments`
--
ALTER TABLE `_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `_images`
--
ALTER TABLE `_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filename` (`filename`,`albumid`),
  ADD KEY `albumid` (`albumid`);

--
-- Indexes for table `_menu`
--
ALTER TABLE `_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_news`
--
ALTER TABLE `_news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titlelink` (`titlelink`);

--
-- Indexes for table `_news2cat`
--
ALTER TABLE `_news2cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_news_categories`
--
ALTER TABLE `_news_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titlelink` (`titlelink`);

--
-- Indexes for table `_obj_to_tag`
--
ALTER TABLE `_obj_to_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagid` (`tagid`),
  ADD KEY `objectid` (`objectid`);

--
-- Indexes for table `_options`
--
ALTER TABLE `_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_option` (`name`,`ownerid`,`theme`);

--
-- Indexes for table `_pages`
--
ALTER TABLE `_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titlelink` (`titlelink`);

--
-- Indexes for table `_plugin_storage`
--
ALTER TABLE `_plugin_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `aux` (`aux`);

--
-- Indexes for table `_search_cache`
--
ALTER TABLE `_search_cache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteria` (`criteria`(255));

--
-- Indexes for table `_tags`
--
ALTER TABLE `_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `_administrators`
--
ALTER TABLE `_administrators`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `_admin_to_object`
--
ALTER TABLE `_admin_to_object`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_albums`
--
ALTER TABLE `_albums`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `_captcha`
--
ALTER TABLE `_captcha`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_comments`
--
ALTER TABLE `_comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_images`
--
ALTER TABLE `_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `_menu`
--
ALTER TABLE `_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_news`
--
ALTER TABLE `_news`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_news2cat`
--
ALTER TABLE `_news2cat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_news_categories`
--
ALTER TABLE `_news_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_obj_to_tag`
--
ALTER TABLE `_obj_to_tag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_options`
--
ALTER TABLE `_options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2214;
--
-- AUTO_INCREMENT for table `_pages`
--
ALTER TABLE `_pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_plugin_storage`
--
ALTER TABLE `_plugin_storage`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `_search_cache`
--
ALTER TABLE `_search_cache`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `_tags`
--
ALTER TABLE `_tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
