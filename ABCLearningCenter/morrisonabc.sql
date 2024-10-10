-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 08:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `morrisonabc`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Abstract` varchar(1000) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Publisher` varchar(50) NOT NULL,
  `CopyRightYear` year(4) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `Title`, `Author`, `Abstract`, `Description`, `Publisher`, `CopyRightYear`, `Category`, `UnitPrice`) VALUES
('0324597681', 'Guide to SQL 8th edition', 'Philip J. Pratt & Mary Z. Last', 'A GUIDE TO SQL, 8E, continues to be the essential SQL reference. It builds on the success of previous editions by presenting basic SQL commands in the context of a running case in which a business uses SQL to manage orders, parts, customers, and sales rep', 'Hardbound', 'Course Technology', '2009', 'Databases', 50.00),
('0324785151', 'Microsoft Office Access 2007 1st edition', 'Lisa Friedrichsen', 'This Illustrated Introductory Video companion is your personal guide to Microsoft Access 2007. Microsoft Office Access 2007 Illustrated Introductory Video Companion contains over 60 videos, each approximately 5 minutes in length, that map directly to less', 'Softbound with CD', 'Course Technology', '2009', 'Databases', 35.00),
('0534493033', 'Introduction to Wireless and Mobile Systems 2nd ed', 'Dharma P. Agrawal & Qing-An Zeng', 'This text explains the general principles of how wireless systems work, how mobility is supported, what is the underlying infrastructure and what interactions are needed among different functional components. Designed as a textbook appropriate for undergr', 'Hardbound without CD', 'Nelson Engineering', '2006', 'Communication', 80.00),
('0534525784', 'Introduction to the Internet for Electronic Media ', 'Daniel Kurland, \r\nFrank (Fritz) Messere', 'no abstract', 'Softbound without CD', 'Wadsworth', '1997', 'Electronic media', 35.00),
('0534952852', 'Mechatronics System Design 1st edition', 'Devdas Shetty & Richard Kolk', 'MECHATRONICS - a synergistic combination of mechanical and electrical engineering, computer science, and information technology-is a rapidly emerging technology appropriate for today\'s engineering students and practicing engineers. This book combines the ', 'Hardbound with CD', 'Nelson Engineering', '1998', 'Mechatronics', 78.00),
('053495409X', 'Analog and Digital Signal Processing 2e', 'Ashok Ambardar', 'Ambardar\'s proven text teaches the basic principles and applications of signals, systems, transforms and filters, using both a visual and mathematical approach. This book helps readers develop a thorough understanding of time-domain and frequency-domain r', 'Softbound', 'Nelson Engineering', '1999', 'Electronics Engineering', 75.00),
('0538688416', 'Microsoft Access 2000: Complete Tutorial 1st editi', 'Sandra Cable, Bill Pasewark', 'Covering beginning through advanced software features, this comprehensive book contains step-by-step instructions, screen illustrations, objectives, tips, notes, chapter summaries, end-of-chapter exercises, projects and SCANS correlations. Certified as Ex', 'Hardbound with CD', 'Course Technology', '2000', 'Databases', 65.00),
('0538688572', 'Microsoft Access 2000 QuickTorial 1st edition', 'Pat Murphy', 'With a completion time of 12+ hours, this book covers beginning through advanced features of the software. Lessons contain objectives, step-by-step instructions, screen illustrations, tips, notes, Internet coverage, chapter summaries, end-of-chapter exerc', 'Soft bound with CD', 'Course Technology', '2000', 'Databases', 40.00),
('053874393X', 'New Perspectives on Adobe Flash CS3 1st edition', 'Luis A. Lopez,', 'Provides comprehensive coverage of the new Adobe Flash CS3 software. This text uses the New Perspectives real-life case-based, problem-solving approach to teaching this robust software. Students will learn how to create rich interactive experiences for th', 'Softbound', 'Course Technology', '2009', 'Web Design', 50.00),
('0538751649', 'Adobe  Flash  CS4 - Illustrated Introductory, Inte', 'Barbara Waxer', 'Teaching your students has never been easier than with ADOBE FLASH CS4   ILLUSTRATED, International Edition. The book presents each skill on two facing pages, providing detailed instructions on the left-hand page and large, full-color screenshots on the r', 'Softbound without CD', 'Course Technology', '2010', 'Databases', 45.00),
('0619183551', 'Microsoft Office Access 2003: Complete Tutorial 1s', 'Pasewark and Pasewark, Sandra Cable', 'Microsoft Office Access 2003 Complete is designed for beginning to intermediate users of Microsoft Office 2003. This self-paced, self-instructional guide provides you with all the instruction necessary to become a Microsoft Office Specialist at the Specia', 'Softbound with CD', 'Course Technology', '2005', 'Databases', 55.00),
('0619212845', 'Oracle9i: SQL, with an Introduction to PL/SQL 1st ', 'Lannes Morris-Murphy', 'Prepares students for the first exam in both the Oracle DBA and Internet Application Developer Certification Tracks, and offers a solid general understanding of Oracle9i SQL.', 'Hardbound without CD', 'Course Technology', '2004', 'Databases', 60.00),
('0619216298', 'Guide to Oracle 10g 5th edition', 'Joline Morrison, Mike Morrison & Rocky Conrad', 'Master Oracle\'s most recent database with this hands-on, step-by-step approach to teaching Oracle10g and application development tools.', 'Softbound with CD', 'Course Technology', '2006', 'Databases', 65.00),
('0619216875', 'PHP Programming with MySQL 1e', 'Don Gosselin', 'As the first true academic textbook in the market to combine PHP with MySQL, PHP Programming with MySQL, by Don Gosselin covers one of the fastest growing technology combinations for developing interactive Web sites.', 'Softbound without CD', 'Course Technology', '2006', 'Databases', 62.00),
('0766813916', 'Outdoor Power Equipment (ED Version) 1st edition', 'Jay Webster', 'Designed to assist students in developing the skills required of professionally certified outdoor power equipment technicians, this book features operation, troubleshooting and service information that can be used to maintain and repair commonly used outd', 'Hardbound with CD', 'Delmar Learning', '2001', 'Automotive', 55.00),
('0766838722', 'Electronics for Computer Technology 1st edition', 'David Terrell', 'New from Delmar Learning, Electronics for Computer Technology is perfect for today\'s career-minded students as well as anyone with a keen interest in troubleshooting computer devices, components and electrical circuits. The first chapter introduces system', 'Softbound with CD', 'Delmar Learning', '2003', 'Electronics', 80.00),
('0826906311', 'Plumbing Design and Installation, Third Edition', 'L.V. Ripka', 'Plumbing Design and Installation, 3rd Edition, contains procedures commonly practiced in industry and the trade. This textbook is designed to develop basic competencies of plumbing apprentices and beginnig learners.', 'Hard bound, Glossy paper and with CD', 'American Technical Publihers, Inc.', '2006', 'Plumbing', 300.00),
('0827376995', 'Small Engine Technology (HC) 2nd Edition', 'William Schuster', 'The second edition of this text expands and updates its already thorough coverage of the operation, maintenance and repair of small, air-cooled gas engines. It features new chapters on failure analysis, and starter systems, as well as a rewrite of the ele', 'Hardbound without CD', 'Delmar Learning', '1999', 'Automotive', 50.00),
('1401840663', 'Game Development Essentials (Video Game Art) 1st e', 'Todd Gantzler', 'The premiere title in the Game Development Essentials series explores the art of bringing a game designer\'s concepts to life. A strong foundation in game artistry is the essential first step, and leading game art designer Todd Gantzler takes readers behin', 'Softbound without CD', 'Delmar Learning', '2005', 'Game Art', 65.00),
('1401889948', 'Collision Repair And Refinishing', 'Alfred Thomas and Michael Jund', 'This new book covers all the necessary tasks for gaining knowledge of collision repair and refinishing as outlined by NATEF. In-depth coverage includes structural and non-structural analysis and damage repair, welding, painting and refinishing, paint chem', 'Softbound with CD', 'Published by Delmar Learning', '2010', 'Automotive', 100.00),
('1401890075', 'Technician\'s Guide to Programmable Controllers 5th', 'Richard Cox', 'Hailed as the most comprehensive introduction to PLCs on the market today, this newly updated 5th Edition covers theory, hardware, instructions, programming, installation, startup, and troubleshooting in a way that is easy to understand and apply. New mat', 'Softbound without CD', 'Delmar Learning', '2007', 'Programming', 90.00),
('1401899188', 'The Guidebook for Linemen and Cablemen 1st edition', 'Wayne Van Soelen', 'A comprehensive and reader-friendly book, The Guidebook for Linemen and Cablemen is a reference tool that contains the most-up-to date information for linemen, cablemen, foremen, and others associated with transmission and distribution departments of elec', 'Hardbound', 'Delmar Learning', '2006', 'Utilities', 61.00),
('1401899463', 'Internetworking with Cisco and Microsoft Technolog', 'Anthony V. Chiarella', 'Learn to use two of the most popular technologies in the industry! This new book teaches how to internetwork with Windows 2000 and Cisco routers. Written in a manner that either the beginner or advanced technician can relate to, the book examines five key', 'Softbound', 'Delmar Learning', '2004', 'Networking', 68.00),
('1418000582', 'Introduction To Local Area Networks 1st edition', 'Judson Miers', 'Readers of this book will learn about Local Area Networks (LAN) through the analysis of case studies that explore common operating systems, network services, security, and more! Each chapter of this innovative book develops a concrete foundation in LAN co', 'Hardbound', 'Delmar Learning', '2007', 'Networking', 65.00),
('1418836354', 'A Guide to MySQL 1st edition', 'Philip J. Pratt & Mary Z. Last', 'A Guide to MySQL, by Philip Pratt and Mary Last, is yet another step into the open-source arena, which is rapidly growing in the technology industry. Topics include design techniques, data definition, commands to query a database, updates, administration ', 'Softbound', 'Course Technology', '2006', 'Databases', 50.00),
('1418837059', 'CCNA Guide to Cisco Networking Fundamentals 4th ed', 'Kelly Cannon, Kelly Caudle, Anthony V. Chiarella', 'CCNA Guide to Cisco Networking Fundamentals, 4e is a comprehensive guide for anyone wishing to obtain a solid background in basic Cisco networking concepts. Students are first introduced to theory-based concepts, which are followed-up with practical hands', 'Hardbound', 'Course Technology', '2009', 'Networking', 70.00),
('1418842982', 'Microsoft Office Access 2003, Illustrated Introduc', 'Lisa Friedrichsen', 'Part of the Illustrated series, this text offers a visual, flexible way to build Microsoft Access 2003 skills.', 'Softbound', 'Course Technology', '2006', 'Databases', 35.00),
('1418843628', 'Microsoft Office Access 2003: Complete Concepts an', 'Gary B. Shelly, Thomas J. Cashman,', 'For the past three decades, the Shelly Cashman Series  has effectively introduced computers to millions of students   consistently providing the highest quality, most up-to-date, and innovative materials in computer education. We are proud of the fact tha', 'Softbound', 'Course Technology', '2006', 'Databases', 62.00),
('1418860115', 'Macromedia Flash 8 Interactive Movie Tutorials, St', 'Jim Shuman', 'Add a new dimension to teaching Macromedia Flash 8 with this Cool School interactus movie tutorial CD!', 'Softbound', 'Course Technology', '2007', 'Game Design', 40.00),
('1439079285', 'Adobe Photoshop CS4 (Introductory Concepts and Tec', 'Gary B. Shelly & Joy L. Starks', 'Part of the highly successful Shelly Cashman series, ADOBE  PHOTOSHOP  CS4: COMPREHENSIVE CONCEPTS AND TECHNIQUES follows the proven Shelly Cashman step-by-step, screen-by-screen approach to learning the Photoshop CS4 software. In this text, you will find', 'Softbound without CD', 'Course Technology', '2010', 'Web Design', 36.00),
('1584502428', 'Learning Visual Basic.NET Through Applications 1st', 'Clayton Crooks II', 'This book/CD-ROM package explores a different approach to learning Visual Basic.net thanmost programming books on the market. Instead of reading chapter after chapter on a single topic, Learning Visual Basic.net through Applications focuses on having the ', 'Softbound with CD', 'Delmar Learning', '2002', 'Programming', 55.00),
('1584503955', 'Game Art (Creation, Direction, and Careers) 1st ed', 'Riccard Linde', 'Game Art: Creation, Direction, and Careers is written to give 3D artists who want to move into the games industry the tools and techniques they need to be successful. It is also written for practicing game artists looking to increase their knowledge and s', 'Softbound without CD', 'Delmar Learning', '2005', 'Game Art', 52.00),
('1584504498', 'Introduction To UNIX/Linux 1st edition', 'Christopher Diaz', 'The UNIX system has steadily gained in popularity over the years. Many businesses and educational institutions as well as individuals have begun using UNIX/Linux because of its power, stability, reliability, and flexibility. With this increase in users, a', 'Softbound', 'Delmar Learning', '2006', 'Programming', 55.00),
('1584504668', 'Creating Content Management Systems in Java 1st ed', 'Arron Ferguson', 'In today\'s fast-paced, information-packed world, it\'s critical for businesses to organize and manipulate the data gathered from customers, sales, and product responses, etc. into usable information. Content Management Systems (CMS) can do this for your bu', 'Softbound', 'Delmar Learning', '2007', 'Programming', 51.00),
('1584504838', 'Macromedia Flash Professional 8 Game Graphics 1st ', 'Robert Firebaugh', 'Creating graphics for Flash games can be fun and rewarding, especially when you can channel your imagination into your art and provide potential players with a fun entertainment experience. Written for anyone creating games with Flash, Macromedia  Flash(T', 'Softbound', 'Delmar Learning,', '2007', 'Game Art', 55.00),
('1584505486', 'Creating Game Art for 3D Engines 1e', 'Brad Strong', 'Learn how to create commercial-quality game art and make it come alive in a 3D engine! \"Creating Game Art for 3D Engines\" is the ideal guide for the serious student or aspiring animator who wants to learn how to create and successfully export game art, fr', 'Softbound', 'Delmar Learning', '2008', 'Game Art', 50.00),
('1584505591', 'Ultimate Game Programming with DirectX 2nd edition', 'Allen Sherrod', 'Make your own games using DirectX 10 and C++ with Ultimate\r\nGame Programming with DirectX, Second Edition. Written for\r\nexperienced programmers who want to learn DirectX 10 and\r\nhow to apply it to game creation, this book goes in-depth with\r\nDirectX 10 and ea', 'Softbound without CD', 'Delmar Learning', '2009', 'Game Programming', 65.00),
('1598633600', 'Beginning C++ Through Game Programming 2e', 'Michael Dawson', 'Beginning C++ Through Game Programming, Second Edition approaches C++ from a game programming perspective unlike any other on the market. Offering a thorough and modern introduction to C++, this book is everything that an aspiring game programmer needs in', 'Softbound with CD', 'Delmar Learning', '2007', 'Game Programming', 35.00),
('1598633988', 'Beginning Game Programming with Flash 1st edition', 'Hamsa Suri, \r\nLakshmi Prayaga', 'If you are new to game programming and want to learn how to create dynamic, robust, and fun 2D games, \"Beginning Game Programming with Flash\" is the book for you! Written for introductory game programming students and other enthusiasts, the book begins wi', 'Sotfbound without CD', 'Delmar Learning', '2008', 'Game Programming', 35.00),
('1598634763', 'Beginning Java Game Programming 2nd edition', 'Jonathan S. Harbour', 'Are you serious about learning how to create real, Java-based games for fun and sharing? Do you have a basic understanding of the Java programming language? If you ve answered yes, then you are ready to get started building web-based 2D games from scratch', 'Softbound without CD', 'Delmar Learning', '2008', 'Game Programming', 35.00),
('159863528X', 'Beginning OpenGL Game Programming 2nd edition', 'Luke Benstead', 'Are you a beginning programmer just getting started in 3D graphics programming? If you re comfortable\r\nprogramming in C++ and have a basic understanding of 3D math concepts, Beginning OpenGL\r\nGame Programming, Second Edition will get you started programming', 'Softbound without CD', 'Delmar Learning,', '2010', 'Game Programming', 40.00),
('1844808777', '3D Games Programming  Using DirectX 10 and Open GL', 'Pierre Rautenbach', '3D Game Programming focuses on all the elements making up a 3-D first-person shooter game engine using a bottom-up approach. By following the easy-to-read text, the reader will learn how to create his or her own next-generation 3-D game engine with suppor', 'Softbound with CD', 'Cengage Learning EMEA', '2009', 'Databases', 50.00),
('1931841624', 'Learn SQL In a Weekend 1e', 'Deanna Dicken, Kevin Thompson', 'With this book as your guide, you can progress from basic database design to the more advanced techniques of database communication in just one weekend. On Friday evening, start with the basics of SQL as you set up a sample database. On Saturday, practice', 'Softbound', 'Delmar Learning', '2002', 'Databases', 48.00),
('2002102792', 'Sams Teach Yourself Viual Studio.Net in 21 Days', 'Jason Beres', 'Sams Teach Yourself Visual Studio .NET in 21 Days will help developers that are new to application development and experienced developers understand how to use the .NET Framework and Visual Studio .NET to rapidly develop any type of computer application. ', 'Soft bound, Glossy paper, with CD', 'Sams Publishing', '2003', 'ICT', 40.00),
('2002106457', 'Sams Teach Yourself Java 2 in 24 Hours', 'Rogers Cadenhead', 'Sams Teach Yourself Java in 24 Hours is a step-by-step tutorial that teaches someone with no previous programming experience how to create simple Java programs and applets.\r\n\r\nIt starts out at a lower level than Sams Teach Yourself Java in 21 Days, and take', 'Soft bound, Glossy Paper', 'Sams Publishing', '2003', 'ICT', 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `borrowtran`
--

CREATE TABLE `borrowtran` (
  `UserID` varchar(20) NOT NULL,
  `TransactionNo` int(11) NOT NULL,
  `DateBorrowed` date NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `IsBookReturned` tinyint(1) NOT NULL,
  `Notes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowtran`
--

INSERT INTO `borrowtran` (`UserID`, `TransactionNo`, `DateBorrowed`, `ISBN`, `IsBookReturned`, `Notes`) VALUES
('1', 1, '2024-08-31', '0324785151', 0, ''),
('1', 1, '2024-08-31', '0534493033', 0, ''),
('3', 2, '2024-08-31', '0534493033', 0, ''),
('1', 3, '2024-09-20', '1401889948', 0, ''),
('1', 3, '2024-09-20', '1401890075', 0, ''),
('1', 3, '2024-09-20', '1401899188', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `UserID` int(11) NOT NULL,
  `DateJoined` date NOT NULL,
  `Validity` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`UserID`, `DateJoined`, `Validity`) VALUES
(1, '2007-10-21', '2025-10-31'),
(2, '2007-11-07', '2015-11-07'),
(3, '2008-02-15', '2026-02-28'),
(4, '2007-11-07', '2016-11-07'),
(5, '2008-01-01', '2016-11-07'),
(6, '2008-01-01', '2016-01-01'),
(7, '2007-04-21', '2016-04-21'),
(8, '2007-04-21', '2016-04-21'),
(9, '2007-04-21', '2016-04-21'),
(10, '2008-01-01', '2016-01-01'),
(11, '2008-01-01', '2016-01-01'),
(12, '2008-01-01', '2016-01-01'),
(13, '2007-04-21', '2015-04-21'),
(14, '2007-10-21', '2015-10-21'),
(15, '2007-10-29', '2015-10-29'),
(16, '2007-05-21', '2013-05-21'),
(17, '2007-10-21', '2013-10-21'),
(18, '2007-10-21', '2013-10-21'),
(19, '2007-10-21', '2013-10-21'),
(20, '2007-10-21', '2016-11-07'),
(21, '2007-04-21', '2013-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `reservetran`
--

CREATE TABLE `reservetran` (
  `UserID` varchar(20) NOT NULL,
  `TransactionNo` int(11) NOT NULL,
  `DateReserved` datetime NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Notes` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservetran`
--

INSERT INTO `reservetran` (`UserID`, `TransactionNo`, `DateReserved`, `ISBN`, `Notes`) VALUES
('00000', 0, '2024-08-28 20:00:59', '0619210000', NULL),
('3', 2, '2024-09-19 03:35:58', '0324785151', ''),
('3', 2, '2024-09-19 03:35:58', '0534493033', '');

-- --------------------------------------------------------

--
-- Table structure for table `returntran`
--

CREATE TABLE `returntran` (
  `UserID` varchar(20) NOT NULL,
  `TransactionNo` int(11) NOT NULL,
  `DateReturned` date NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `BorrowTranNo` date NOT NULL,
  `Overdue` float NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Note` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `UserID` int(11) NOT NULL,
  `Role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`UserID`, `Role`) VALUES
(1, 'member'),
(2, 'member'),
(3, 'administrator'),
(4, 'member'),
(5, 'member'),
(6, 'member'),
(7, 'member'),
(8, 'member'),
(9, 'member'),
(10, 'member'),
(11, 'member'),
(12, 'member'),
(13, 'member'),
(14, 'member'),
(15, 'member'),
(16, 'member'),
(17, 'member'),
(18, 'member'),
(19, 'member'),
(20, 'member'),
(21, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `ISBN` varchar(20) NOT NULL,
  `Qty` int(11) NOT NULL,
  `InStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`ISBN`, `Qty`, `InStock`) VALUES
('0324597681', 5, 5),
('0324785151', 5, 5),
('0534493033', 5, 0),
('0534525784', 5, 5),
('0534952852', 5, 5),
('053495409X', 5, 0),
('0538688416', 5, 5),
('0538688572', 5, 5),
('053874393X', 5, 5),
('0538751649', 5, 4),
('0619183551', 5, 5),
('0619212845', 5, 5),
('0619216298', 5, 5),
('0619216875', 5, 5),
('0766813916', 5, 5),
('0766838722', 5, 5),
('0826906311', 5, 5),
('0827376995', 5, 5),
('1401840663', 5, 5),
('1401889948', 5, 5),
('1401890075', 5, 5),
('1401899188', 5, 5),
('1401899463', 5, 5),
('1418000582', 5, 5),
('1418836354', 5, 4),
('1418837059', 5, 5),
('1418842982', 5, 5),
('1418843628', 5, 5),
('1418860115', 5, 4),
('1439079285', 5, 5),
('1584502428', 5, 5),
('1584503955', 5, 5),
('1584504498', 5, 5),
('1584504668', 5, 5),
('1584504838', 5, 5),
('1584505486', 5, 5),
('1584505591', 5, 5),
('1598633600', 5, 3),
('1598633988', 5, 5),
('1598634763', 5, 5),
('159863528X', 5, 5),
('1844808777', 5, 4),
('1931841624', 5, 5),
('2002102792', 5, 5),
('2002106457', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `useracc`
--

CREATE TABLE `useracc` (
  `UserID` int(10) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `useracc`
--

INSERT INTO `useracc` (`UserID`, `Username`, `Password`) VALUES
(1, 'lorna', 'l'),
(2, 'brian', 'b'),
(3, 'admin', 'admin'),
(4, 'sam', 's'),
(5, 'harold', '888-5651'),
(6, 'art', 'arth'),
(7, 'agnes', 'agnes'),
(8, 'mark', 'm'),
(9, 'zoi', 'zoi'),
(10, 'jazz', 'jazz'),
(11, 'susan', 'san'),
(12, 'rosie', 'rose'),
(13, 'leah', 'leah'),
(14, 'mart', 'mart'),
(15, 'jun', 'macho'),
(16, 'pol', 'paula'),
(17, 'teope', 'teof'),
(18, 'may', 'myra'),
(19, 'marines', 'marino'),
(20, 'kiko', 'kiko'),
(21, 'step', 'step');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `HAddress` varchar(200) NOT NULL,
  `WAddress` varchar(200) NOT NULL,
  `Landline` varchar(20) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Fname`, `Lname`, `HAddress`, `WAddress`, `Landline`, `Mobile`, `Email`, `Gender`) VALUES
(1, 'Lorna', 'Josef', '123 South St. Vicente Village, Taguig City', 'ABC', '887-7777', '887-7777', 'lorna@mymail.com', 'female'),
(2, 'Brian', 'Reyes', '23 Nort St. Vicente Village, Taguig City', 'ABC', '887-7777', '0929-1234568', 'brian@mymail.com', 'male'),
(3, 'Josephine', 'dela Cruz', '45 Northern St. Taguig City', 'ABC', '887-7777', '0927-3456789', 'jo@mymail.com', 'female'),
(4, 'Sam', 'dela Cruz', '34 East St. Vicente Village, Taguig City', 'ABC', '887-7777', '0927-1235662', 'sam@mymail.com', 'male'),
(5, 'Arnold', 'Plete', '18 New York St., Cubao, Q.C.', 'male', '888-5666', '0927-1235662', 'harold@mymail.com', 'male'),
(6, 'Arthur', 'Cardenas', '13 New York St., Cubao, Q.C.', 'QC Hall', '921-4444', '0919-2349000', 'art@mymail.com', 'male'),
(7, 'Agnes', 'Martinez', 'Blk.1 Lot 1, Phase 2 Pinagsama Village Taguig City', 'Municipality of Taguig', '886-8240', '0920-0045600', 'agnes@mymail.com', 'female'),
(8, 'Marco', 'Antonio', '234 Quezon St. Bicutan Taguig', 'ABC', '888-5666', '0921-8900345', 'mark@mymail.com', 'male'),
(9, 'Zoilo', 'Hernandez', '1622 Cabrera St. Pasay City', 'SM Mall of Asia', '892-8823', '0917-2394851', 'zoi@mymail.com', 'male'),
(10, 'Jasmine', 'Cruz', '32 Evangelista St., Pasay City', 'SM Mall of Asia', '892-8823', '0921-2229900', 'jazz@mymail.com', 'female'),
(11, 'Susan', 'Aguilar', '40 12th St., Cubao, Q.C.', 'SM Mall of Asia', '892-8823', '0921-2346677', 'susan@mymail.com', 'female'),
(12, 'Rose', 'Alcantara', '10 New Orleans, Cubao, Q.C.', 'SM Mall of Asia', '892-8823', '0918-1119923', 'rosie@mymail.com', 'female'),
(13, 'Leah', 'Garcia', '25 K-5th St., Kamuning, Q.C.', 'SSS - Cubao', '919-6989', '0920-0092314', 'leah@mymail.com', 'female'),
(14, 'Martin', 'Agustin', '1661 Shaw Blvd., Pasig City', 'DepEd - Pasig', '632-6124', '0910-2298351', 'mart@mymail.com', 'male'),
(15, 'Rosendo', 'Mateo Jr', '2341 Pasong Tamo Ext., Makati City', 'Banco de Oro - Makati', '716-9945', '0926-0928092', 'jun@mymail.com', 'male'),
(16, 'Paul', 'Salamat', 'Blk.2, Lot 12, Signal Village, Taguig City', 'FTI - Taguig City', '818-9923', '0921-8823451', 'pol@mymail.com', 'male'),
(17, 'Teofilo', 'Navarro', 'PDS, C-5 Rd., Taguig City', 'Ospital ng Makati', '841-2100', '0918-2939393', 'teope@mymail.com', 'male'),
(18, 'Myra', 'Santos', '21 Acacia Lane, Mandaluyong City', 'EDSA - ShangriLa', '635-5465', '0922-2235444', 'may@mymail.com', 'female'),
(19, 'Marino', 'Miranda', 'Fort Bonifacio, Taguig City', 'Phil. Marines', '818-9203', '0922-8228382', 'marines@mymail.com', 'male'),
(20, 'Francisco', 'Santos', 'EDSA - ShangriLa', 'male', 'NULL', '', 'kiko@mymail.com', 'male'),
(21, 'Stephen', 'Perez', '22 Acacia Lane, Mandaluyong City', 'ABC', '887-7777', '0929-4321678', 'admin@mymail.com', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `borrowtran`
--
ALTER TABLE `borrowtran`
  ADD PRIMARY KEY (`TransactionNo`,`ISBN`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `reservetran`
--
ALTER TABLE `reservetran`
  ADD PRIMARY KEY (`TransactionNo`,`ISBN`);

--
-- Indexes for table `returntran`
--
ALTER TABLE `returntran`
  ADD PRIMARY KEY (`TransactionNo`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `useracc`
--
ALTER TABLE `useracc`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowtran`
--
ALTER TABLE `borrowtran`
  MODIFY `TransactionNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `useracc`
--
ALTER TABLE `useracc`
  MODIFY `UserID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
