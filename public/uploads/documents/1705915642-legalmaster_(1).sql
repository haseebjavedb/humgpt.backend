-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 01:09 PM
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
-- Database: `legalmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL DEFAULT '0',
  `is_guest` int(11) NOT NULL DEFAULT 1,
  `chatId` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id`, `is_guest`, `chatId`, `title`, `created_at`, `updated_at`) VALUES
(1, '1', 1, 'F7U69-BUWL2-ZT6VI-H2NUA', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-10 14:50:48', '2024-01-10 15:41:47'),
(2, '1', 1, 'YPS6X-688MQ-VJCRZ-YFWLR', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-10 15:01:29', '2024-01-10 15:41:47'),
(3, '7', 0, 'GVB3I-EHHQ6-NHZ1H-X34HM', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-10 17:07:37', '2024-01-10 17:07:37'),
(6, '10', 0, 'CL3V6-LW8FR-VSS7P-ORE5M', 'I need information on civil procedure rules in New York for small claims', '2024-01-10 20:24:43', '2024-01-10 20:24:43'),
(7, '10', 0, 'UQOPW-K9QAQ-VVINY-H5WTR', 'Help me draft a motion for summary judgment in a Florida personal injury case.', '2024-01-10 20:54:57', '2024-01-10 20:54:57'),
(8, '10', 0, 'BMWPN-H7BOL-NWWPU-PIWPE', 'I need a post-judgment motion for a family law case in Washington D.C.', '2024-01-10 21:29:43', '2024-01-10 21:29:43'),
(10, '13', 0, 'RP8DB-7FAU1-XTH8V-ADL2Y', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-10 21:46:50', '2024-01-10 21:46:50'),
(11, '13', 0, '5NXE1-Q7DR3-HK138-XFCVB', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-10 21:51:53', '2024-01-10 21:51:53'),
(12, '13', 0, 'DA21H-9H7ZS-4HQ5L-YG29I', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-10 21:54:10', '2024-01-10 21:54:10'),
(13, '13', 0, 'ZIODB-SZGQ8-NIFID-UL9BC', 'Draft a complaint for a breach of contract case in Texas.', '2024-01-10 21:59:53', '2024-01-10 21:59:53'),
(14, '13', 0, 'DB7XH-TEZPQ-2MA43-4C4KU', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-10 22:14:28', '2024-01-10 22:14:28'),
(15, '13', 0, 'X9MSK-FU8PL-RAC4T-9AE4U', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-11 02:26:45', '2024-01-11 02:26:45'),
(16, '13', 0, '3KPOZ-QBSC9-QG6IJ-4HA6H', 'I need a post-judgment motion for a family law case in Washington D.C.', '2024-01-11 02:32:48', '2024-01-11 02:32:48'),
(17, '13', 0, '58H19-HAMZX-KWDME-5TZRQ', 'Explain the criminal procedure rules in California for a felony case.', '2024-01-11 12:42:11', '2024-01-11 12:42:11'),
(18, '10', 0, '6T3HW-7MDH1-S6MAM-Q5GVX', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-11 22:04:29', '2024-01-11 22:04:29'),
(22, '14', 0, 'GS59P-37IJQ-ZBCPB-M7FJ1', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-15 16:17:29', '2024-01-15 16:17:29'),
(54, '124.29.216.23', 1, 'PW4XU-BRA9K-UYVAS-XIVVK', 'How does bankruptcy law work for individuals in financial distress?', '2024-01-15 22:48:59', '2024-01-15 22:48:59'),
(55, '124.29.216.23', 1, 'K6ZQ8-AJDN4-GHGPF-NZ6IH', 'hello how are you', '2024-01-15 22:49:39', '2024-01-15 22:49:39'),
(56, '10', 0, 'IROFK-8J5F9-SQ5EC-2FQWH', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-15 23:14:11', '2024-01-15 23:14:11'),
(57, '10', 0, 'KDXME-WVRAZ-NBRR6-UDDUN', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-15 23:15:01', '2024-01-15 23:15:01'),
(58, '124.29.216.23', 1, 'G6WCZ-JIDIO-8SUZN-66S46', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-15 23:15:14', '2024-01-15 23:15:14'),
(59, '124.29.216.23', 1, 'R8IWI-DBZXG-QRJ8A-K3OJF', 'I need information on civil procedure rules in New York for small claims', '2024-01-15 23:18:57', '2024-01-15 23:18:57'),
(60, '124.29.216.23', 1, 'DUPJZ-YCKHB-5KDCV-NPWWM', 'Can you create a privacy policy compliant with GDPR for my website?', '2024-01-15 23:21:12', '2024-01-15 23:21:12'),
(61, '10', 0, 'N6TI1-UFLJK-FA39F-UXUHW', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-15 23:43:00', '2024-01-15 23:43:00'),
(62, '124.29.216.23', 1, 'C9V7E-XDZNO-JIGCR-X8B8T', 'Draft a complaint for a breach of contract case in Texas.', '2024-01-15 23:47:05', '2024-01-15 23:47:05'),
(63, '124.29.216.23', 1, '8K54A-CFFT2-NMDRS-R3C99', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 13:18:01', '2024-01-16 13:18:01'),
(64, '124.29.216.23', 1, 'JLX7Y-LWE1J-UYD9V-OOP4O', 'Draft a complaint for a breach of contract case in Texas.', '2024-01-16 13:39:21', '2024-01-16 13:39:21'),
(65, '124.29.216.23', 1, 'B532S-VBKWC-ECY16-68ERW', 'What are the Federal Rules of Civil Procedure regarding class action lawsuits?', '2024-01-16 13:47:08', '2024-01-16 13:47:08'),
(66, '124.29.216.23', 1, 'ZOVZN-QPWLY-22GDG-RDGPG', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 14:44:44', '2024-01-16 14:44:44'),
(67, '17', 0, '345OD-NKGST-NI7BK-XJBGH', 'I need information on civil procedure rules in New York for small claims', '2024-01-16 15:02:28', '2024-01-16 15:02:28'),
(68, '124.29.216.23', 1, 'DIFTQ-97EM5-CYKXB-I13XX', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 15:09:12', '2024-01-16 15:09:12'),
(69, '124.29.216.23', 1, 'LDJQG-D6DYX-WEM9A-6XG9P', 'Draft a complaint for a breach of contract case in Texas.', '2024-01-16 15:22:48', '2024-01-16 15:22:48'),
(70, '124.29.216.23', 1, 'FZK4Q-WCMOL-NU2NB-L2PFD', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 17:53:51', '2024-01-16 17:53:51'),
(71, '18', 0, '846HY-6IYL5-ZY6YE-EJNUJ', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 18:01:51', '2024-01-16 18:01:51'),
(72, '18', 0, '4OM95-D4MW9-EYVSL-6OQRN', 'I need information on civil procedure rules in New York for small claims', '2024-01-16 18:02:19', '2024-01-16 18:02:19'),
(73, '18', 0, 'BY1TZ-X9SW4-W1O9F-LRKWV', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 18:13:51', '2024-01-16 18:13:51'),
(74, '18', 0, 'YQL12-PPFLX-OUNZ1-3Z8NZ', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 18:14:45', '2024-01-16 18:14:45'),
(75, '18', 0, '7QGJW-ZTMQY-8SEJS-ZIV7S', 'Draft a complaint for a breach of contract case in Texas.', '2024-01-16 18:15:16', '2024-01-16 18:15:16'),
(76, '18', 0, '9A5C7-DRVTG-TKEQ4-PA81I', 'What are my legal rights in a workplace harassment situation?', '2024-01-16 18:16:21', '2024-01-16 18:16:21'),
(77, '18', 0, '2G31K-5KX8O-ODV4N-2QYBM', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 18:17:04', '2024-01-16 18:17:04'),
(78, '18', 0, '9IXTJ-WOSZ9-H7S1H-T6I1F', 'hello', '2024-01-16 18:25:11', '2024-01-16 18:25:11'),
(79, '18', 0, 'XYS72-1T2ZI-OWMA7-AUSX2', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 18:26:24', '2024-01-16 18:26:24'),
(80, '18', 0, 'USFO2-3P6UK-IJI2I-2NVSJ', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 18:26:37', '2024-01-16 18:26:37'),
(81, '18', 0, 'ONP2W-EBZSN-4WMK8-FZ7DZ', 'I need information on civil procedure rules in New York for small claims', '2024-01-16 18:31:57', '2024-01-16 18:31:57'),
(82, '18', 0, '8CPNH-KXX1J-9QXQH-PSRZZ', 'Can you provide recent Supreme Court judgments on copyright law?', '2024-01-16 18:52:12', '2024-01-16 18:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_bot` int(11) NOT NULL,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  `is_included` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `chat_id`, `message`, `is_bot`, `is_hidden`, `is_included`, `created_at`, `updated_at`) VALUES
(1, 1, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-10 14:50:48', '2024-01-10 14:50:48'),
(2, 1, 'As of my knowledge cutoff date in early 2023, I can provide a brief summary of a recent and notable Supreme Court case in the United States related to copyright law. However, please note that for the most up-to-date information, you should verify the current status of case law, as new decisions can be made, and existing ones can be overruled or further interpreted.\n\n**Google LLC v. Oracle America, Inc., 593 U.S. ___ (2021)**\n\nThis is a landmark Supreme Court case that concerned copyright protection for software interfaces. The case was about whether Google\'s use of Oracle\'s Java API (Application Programming Interface) for the development of the Android operating system was considered \"fair use\" under copyright law.\n\nThe Supreme Court held that:\n\n- Google\'s copying of the Java API, which included only those lines of code that were needed to allow programmers to work in a new and transformative program, was a fair use of that material.\n- The decision of the court emphasized the role of fair use in providing room for innovation and competition.\n- The court\'s opinion suggested that Google\'s use of the API was transformative because it allowed programmers to create a new and transformative smartphone platform without simply replicating the Oracle Java platform.\n\nThis decision has significant implications for the software industry and for the application of copyright law to software and interfaces. It illustrated how fair use can be a defense to copyright infringement in specific cases involving technology and innovation.\n\nFor the most current and specific rulings, you would need to consult a legal research database, law review articles, or the official Supreme Court website, where you can find opinions issued by the Court after my knowledge cutoff date. Remember that Supreme Court decisions are complex, and understanding their full implications often requires professional legal analysis.', 1, 0, 1, '2024-01-10 14:51:16', '2024-01-10 14:51:16'),
(3, 2, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-10 15:01:29', '2024-01-10 15:01:29'),
(4, 2, 'As of my last knowledge update in April 2023, I don\'t have access to real-time databases or the ability to pull recent court judgments; however, I can tell you about a significant Supreme Court copyright law case from the recent past (before April 2023):\n\n**Google LLC v. Oracle America, Inc., 593 U.S. ___ (2021)**: This was a landmark case in the United States Supreme Court concerning copyright law and its application to software. The court held that Google\'s use of Oracle\'s Java API was a fair use as it was a transformative use. This ruling meant that there was no copyright infringement by Google.\n\nFor the most recent judgments or decisions from the Supreme Court on copyright law, you would need to:\n\n- Check the official website of the Supreme Court for the latest judgments.\n- Use legal research databases like Westlaw, LexisNexis, or Bloomberg Law which provide updates on recent case law.\n- Refer to legal commentary, blogs, or news that cover intellectual property law for summaries and discussions on recent decisions.\n\nIf you are seeking recent judgments for a specific purpose such as legal research or to inform a current legal issue, it is recommended to consult a legal professional or use a current legal research platform.', 1, 0, 1, '2024-01-10 15:01:46', '2024-01-10 15:01:46'),
(5, 3, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-10 17:07:37', '2024-01-10 17:07:37'),
(6, 3, 'I\'m sorry, but I do not have real-time access to databases, court records, or current legal updates. My knowledge on court judgments and case law is limited to information available up to my last training, which does not include recent Supreme Court judgments. However, I can provide general information about copyright law and illustrate with notable cases that have shaped the legal landscape up to that time.\n\nTo get recent Supreme Court judgments on copyright law, you would typically:\n\n1. Check online legal databases like Westlaw, LexisNexis, or Google Scholar, which provide access to court decisions and legal precedent.\n2. Visit the official website of the Supreme Court of your jurisdiction, as many publish their recent decisions and opinions.\n3. Consult legal blogs, law firm publications, and legal news outlets that report and analyze recent court decisions.\n\nIf you need, I can provide summaries and perspectives on well-known copyright law cases and principles that have been influential, or else explain copyright concepts in general. For the latest cases, I would recommend consulting a legal research database, an attorney, or other reliable legal news sources.', 1, 0, 1, '2024-01-10 17:07:56', '2024-01-10 17:07:56'),
(10, 6, 'I need information on civil procedure rules in New York for small claims', 0, 0, 1, '2024-01-10 20:24:43', '2024-01-10 20:24:43'),
(11, 7, 'Help me draft a motion for summary judgment in a Florida personal injury case.', 0, 0, 1, '2024-01-10 20:54:57', '2024-01-10 20:54:57'),
(12, 8, 'I need a post-judgment motion for a family law case in Washington D.C.', 0, 0, 1, '2024-01-10 21:29:43', '2024-01-10 21:29:43'),
(15, 10, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-10 21:46:50', '2024-01-10 21:46:50'),
(16, 11, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-10 21:51:53', '2024-01-10 21:51:53'),
(17, 11, 'As of my last knowledge update in early 2023, I am unable to provide the most recent Supreme Court judgments on copyright law directly from a live database. However, I can refer you to significant Supreme Court cases on copyright law prior to 2023. To obtain the most current Supreme Court rulings, you would need to access legal databases such as Westlaw, LexisNexis, or government websites that publish recent decisions.\n\nTwo notable U.S. Supreme Court copyright law cases before 2023 include:\n\n1. Google LLC v. Oracle America, Inc. (2021)\nIn a landmark decision, the U.S. Supreme Court ruled that Google\'s use of Oracle\'s Java API, when it created the Android operating system, was a fair use. The court held that Google\'s copying of the API, which included only those lines of code that allowed programmers to put their accrued talents to work in a new and transformative program, was a fair use of the material as a matter of law.\n\n2. Allen v. Cooper (2020)\nIn this case, the Supreme Court addressed the issue of sovereign immunity in the context of copyright infringement. The court held that states are immune from copyright infringement suits under the Copyright Clause and the doctrine of sovereign immunity, unless Congress acts to abrogate that immunity through legislation passed under a different constitutional provision, such as the Fourteenth Amendment.\n\nTo stay current with the latest judgments in the United States, legal professionals often access resources like Justia, FindLaw, or the official Supreme Court of the United States website. For practitioners in other jurisdictions, the equivalent supreme or highest courts would be the source of binding legal precedents on copyright law. Please consult a legal professional or access up-to-date legal databases for the latest information.', 1, 0, 1, '2024-01-10 21:52:14', '2024-01-10 21:52:14'),
(18, 12, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-10 21:54:10', '2024-01-10 21:54:10'),
(19, 12, 'As of my knowledge cutoff date in early 2023, I cannot retrieve real-time data or provide live updates on Supreme Court judgments. However, I can tell you about a notable U.S. Supreme Court decision relating to copyright law that has had a significant impact on the legal landscape:\n\n**Google LLC v. Oracle America, Inc., 593 U.S. ___ (2021)**:\nThis landmark case addressed the issue of copyrightability of software, specifically APIs (Application Programming Interfaces). The Supreme Court held that Google\'s use of Oracle’s Java API was a fair use as a matter of law. Google copied roughly 11,500 lines of code from the Java SE program, owned by Oracle, to allow developers to work in a new and transformative Android smartphone environment. The Court concluded that Google’s use of the Java API was transformative and did not harm the potential market for or value of the copyrighted work. This decision has important implications for the software industry and the concept of fair use in copyright law.\n\nTo obtain the most recent Supreme Court judgments on copyright law or any other subject, you would need to look at the Supreme Court\'s official website, legal research databases, or other updated legal resources. If you\'re looking for information post-early 2023, I recommend consulting these sources or engaging with a legal professional who can provide the latest legal developments.', 1, 0, 1, '2024-01-10 21:54:32', '2024-01-10 21:54:32'),
(20, 13, 'Draft a complaint for a breach of contract case in Texas.', 0, 0, 1, '2024-01-10 21:59:53', '2024-01-10 21:59:53'),
(21, 14, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-10 22:14:28', '2024-01-10 22:14:28'),
(22, 14, 'As of my knowledge cutoff date in early 2023, I can refer to some notable recent U.S. Supreme Court cases related to copyright law, but please note that my information may not include the most recent developments:\n\n1. **Google LLC v. Oracle America, Inc., 593 U.S. ___ (2021)**: This landmark case examined whether Google’s use of Oracle’s Java API (application programming interface) was fair use under copyright law. The Supreme Court held that Google’s copying of the Java API was a transformative use, which amounted to fair use. It was a significant decision for the software industry as it clarified the application of fair use to the functional elements of a computer program.\n\n2. **Georgia et al. v. Public.Resource.Org, Inc., 590 U.S. ___ (2020)**: The Court decided that the annotations in the Official Code of Georgia Annotated (OCGA), which include summaries of judicial decisions, opinions of the state attorney general, and other materials, do not qualify for copyright protection because they are “authored by judges and legislators” in the course of their official duties. The Supreme Court found that the government edicts doctrine—where official works that were created by public officials within the scope of their duties are not subject to copyright—applied to the annotated code prepared by the legislature\'s agents.\n\nFor the most current information, it\'s important to conduct up-to-date legal research or consult with a legal professional. To access the latest Supreme Court judgments on copyright law or any other topic, you can usually find them on the official Supreme Court website, in legal databases like Westlaw, LexisNexis, or through institutional resources like law libraries or public court documentation.', 1, 0, 1, '2024-01-10 22:14:55', '2024-01-10 22:14:55'),
(23, 15, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-11 02:26:45', '2024-01-11 02:26:45'),
(24, 15, 'As of my last update in early 2023, I do not have access to real-time databases or the latest rulings. Therefore, I cannot provide the most recent Supreme Court judgments on copyright law. However, I can share information about some notable U.S. Supreme Court cases on copyright law from the past that have had significant impact:\n\n1. Google LLC v. Oracle America, Inc. (2021): This case involved a dispute over copyright infringement concerning Google\'s use of Java API in the Android operating system. The Supreme Court held that Google\'s copying of the Java API was a fair use as a matter of law.\n\n2. Star Athletica, L.L.C. v. Varsity Brands, Inc. (2017): The Court held that the designs of cheerleading uniforms were eligible for copyright protection as their designs were separable from the utilitarian aspects of the uniforms.\n\n3. American Broadcasting Companies, Inc. v. Aereo, Inc. (2014): The Court decided that Aereo\'s service, which allowed subscribers to watch television programs over the internet at about the same time as they were broadcast over the air, was a public performance under the Copyright Act, and thus constituted copyright infringement.\n\n4. Kirtsaeng v. John Wiley & Sons, Inc. (2013): The Supreme Court ruled that the first-sale doctrine applies to goods manufactured and sold abroad, thus allowing the owner of a legally purchased copy made outside the U.S. to resell it without permission from the copyright holder.\n\nTo get the most recent Supreme Court judgments on copyright law or any other legal matter, I recommend consulting legal databases such as Westlaw, LexisNexis, or official court websites where the latest decisions are published. Further, you may want to contact a legal professional or a law librarian who could help you find up-to-date legal information.', 1, 0, 1, '2024-01-11 02:27:12', '2024-01-11 02:27:12'),
(25, 16, 'I need a post-judgment motion for a family law case in Washington D.C.', 0, 0, 1, '2024-01-11 02:32:48', '2024-01-11 02:32:48'),
(26, 16, 'Certainly! Below is a basic example of a post-judgment motion that could be filed in a family law case. This template is intended to serve as a general sample and will need to be tailored to the specific facts and details of your case. It is crucial to consult with a licensed attorney in the jurisdiction of Washington D.C. who can provide you with personalized advice and ensure compliance with local laws and procedural rules.\n\nNote that the formatting, content requirements, and specific procedures may vary based on the court and the nature of the matter, so the relevant rules and statutes should be reviewed to ensure that the motion is properly prepared.\n\n---\n\n[Your Name]\n[Your Address]\n[City, State, Zip Code]\n[Phone Number]\n[Email Address]\n\nIN THE SUPERIOR COURT FOR THE DISTRICT OF COLUMBIA\nFAMILY COURT DIVISION\n\n[Your Name],\nPetitioner,\n\nv. Case No: [Your Case Number]\n\n[Other Party’s Name],\nRespondent.\n\nMOTION FOR [SPECIFY THE TYPE OF MOTION, e.g., MODIFICATION OF CHILD SUPPORT]\n\nComes now [Your Name], Petitioner/Respondent in the above-captioned matter, and pursuant to [cite relevant statute or rule], respectfully submits this Motion for [Modification of Child Support/Amendment of Judgment/Enforcement of Judgment, etc.]. In support of this motion, [Your Name] states as follows:\n\n1. A final judgment was entered in this matter on [date of original judgment entry], whereby [briefly describe the relevant terms of the judgment related to the issue being moved upon].\n\n2. [Explain the change in circumstance or the reason for your post-judgment motion. For example, \"Since the entry of the judgment, there has been a significant change in circumstances warranting a modification of child support payments due to a substantial change in income.\"]\n\n3. [Discuss any efforts made to resolve the matter without court intervention, if applicable.]\n\n4. [Include any legal arguments in support of your motion, referring to specific facts of the case and citing to relevant statutes, case law, or rules of court.]\n\nWHEREFORE, [Your Name] respectfully requests the following relief:\n(a) That the Court grant this Motion for [type of relief sought];\n(b) That the Court order a modification of the current orders to reflect [specific modification sought, if applicable];\n(c) [Any other specific relief being sought];\n(d) That the Court award such other and further relief as deemed just and proper.\n\n[If a hearing is required, include a request for a hearing, such as: \"Petitioner/Respondent further requests a hearing on this motion at the Court’s earliest convenience.\"]\n\nRespectfully submitted,\n[Your Signature]\n[Your Name]\n[Date]\n\nCERTIFICATE OF SERVICE\n\nI hereby certify that on this [Day] of [Month], [Year], I have served a true and correct copy of the foregoing Motion for [type of motion] on [Other Party’s Name], [either “by hand delivery” or “by U.S. Mail to the address listed below,” or “by email at”] [Other Party’s Address or Email].\n\n[Your Signature]\n[Your Name]\n\n---\n\nPlease consult with an attorney to ensure that the motion is appropriate for your case, and that it meets all the necessary procedural requirements, including any deadlines for filing post-judgment motions in Washington D.C. Remember also to adhere to formatting requirements and to include all necessary elements as dictated by applicable rules and statutes.', 1, 0, 1, '2024-01-11 02:33:25', '2024-01-11 02:33:25'),
(27, 17, 'Explain the criminal procedure rules in California for a felony case.', 0, 0, 1, '2024-01-11 12:42:11', '2024-01-11 12:42:11'),
(28, 17, 'In California, the criminal procedure for a felony case typically unfolds through several stages, governed by the California Penal Code and other relevant statutes. The process is intricate and designed to ensure fairness and due process for the accused. Here\'s a high-level overview of the main steps involved in the criminal procedure for a felony case in California:\n\n1. Investigation: Law enforcement agencies investigate suspected criminal activity. If they gather sufficient evidence, they may arrest the suspect or submit the case to the district attorney (DA) to decide whether to press charges.\n\n2. Arrest: If an individual is arrested for a suspected felony, they will typically be taken into custody and may be required to post bail to secure their release pending further proceedings.\n\n3. Arraignment: The first court appearance is the arraignment, where the accused is formally charged with the crime. The accused will be advised of their rights, and they can enter a plea of guilty, not guilty, or no contest (nolo contendere).\n\n4. Preliminary Hearing: A preliminary hearing is held for the judge to determine whether there is enough evidence to require the accused to stand trial. The prosecution presents evidence, and the defense can cross-examine witnesses. If the judge finds sufficient evidence, the case proceeds.\n\n5. Pretrial Motions and Hearings: Both the prosecution and the defense can file pretrial motions, such as motions to suppress evidence or to dismiss the case. These hearings address legal and procedural issues before trial.\n\n6. Plea Bargaining: Throughout the process, plea negotiations may occur between the defense and the prosecution, potentially leading to an agreement where the accused pleads guilty to a lesser charge or receives a reduced sentence.\n\n7. Trial: If no plea agreement is reached, the case goes to trial. The prosecution must prove the accused\'s guilt beyond a reasonable doubt. A felony trial is typically heard by a jury, though the accused can choose a bench trial (heard by a judge only).\n\n8. Sentencing: If the accused is convicted, the court will hold a sentencing hearing to determine the appropriate punishment, which may include imprisonment, fines, probation, community service, or other penalties.\n\n9. Appeals: The convicted party has the right to appeal the conviction or sentence. Appeals are heard by a higher court, which reviews the case for legal errors that may have affected the outcome.\n\nEach step in the felony criminal procedure can involve complexities and nuances that require careful legal attention. Defendants in criminal cases are strongly advised to seek the services of a qualified defense attorney who can protect their rights and advise them through every phase of the process.\n\nPlease note that legal procedures can evolve, and while this overview is designed to be accurate as of the last update, it is essential to consult current resources or legal professionals for the most up-to-date information.', 1, 0, 1, '2024-01-11 12:42:35', '2024-01-11 12:42:35'),
(29, 18, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-11 22:04:29', '2024-01-11 22:04:29'),
(30, 18, 'As of my last knowledge update in early 2023, I can\'t provide real-time details or recent Supreme Court judgments on copyright law. However, I can discuss some notable Supreme Court decisions on copyright law up until that point:\n\n1. **Google LLC v. Oracle America, Inc., 141 S. Ct. 1183 (2021)**: This was a significant case in which the Supreme Court held that Google\'s use of Oracle\'s Java API, used to develop the Android operating system, was a fair use as a matter of law. The decision was a major development in copyright law as it recognized that the copying of software interfaces necessary for interoperability, creativity, and progress in software development could be protected under fair use.\n\n2. **Georgia v. Public.Resource.Org, Inc., 140 S. Ct. 1498 (2020)**: In this case, the Supreme Court held that the annotated version of the Official Code of Georgia, which included annotations prepared by the Code Revision Commission, was not eligible for copyright protection under the government edicts doctrine. The Court decided that since the annotations were authored by an arm of the legislature in the course of its official duties, they were not copyrightable.\n\n3. **Star Athletica, L.L.C. v. Varsity Brands, Inc., 137 S. Ct. 1002 (2017)**: The Court held that a feature incorporated into the design of a useful article, like a cheerleading uniform, can be protected under copyright if the feature (1) can be perceived as a work of art separate from the useful article, and (2) would qualify as a protectable pictorial, graphic, or sculptural work—either on its own or fixed in some other tangible medium of expression—if it were imagined separately from the useful article.\n\nThese cases reflect key areas of copyright law including fair use, the government edicts doctrine, and the separability test relevant to the design of useful articles. For the most current judgments, you would need to access databases such as Westlaw, LexisNexis, Google Scholar, or official Supreme Court resources, which often provide details of the most recent decisions. Alternatively, consulting with a legal professional who has access to updated legal resources would be necessary to obtain the latest rulings and their implications.', 1, 0, 1, '2024-01-11 22:05:08', '2024-01-11 22:05:08'),
(39, 22, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-15 16:17:29', '2024-01-15 16:17:29'),
(40, 22, 'I am unable to provide real-time or the most recent judgments, as my knowledge is limited to information available up to my last update in 2023. However, I can share some significant United States Supreme Court cases related to copyright law that were prominent up to that point. Keep in mind that for the most recent cases, you should consult an updated legal database, a law library, or an attorney specializing in intellectual property law.\n\nHere are some significant Supreme Court cases related to copyright law up to my last knowledge update:\n\n1. **Google LLC v. Oracle America, Inc., 593 U.S. ___ (2021)**:\n   - In a landmark decision, the Court held that Google\'s use of Oracle\'s Java API, copying only what was necessary to allow users to put their accrued talents to work in a new and transformative program, constituted a fair use of the material as a matter of law.\n\n2. **Fourth Estate Public Benefit Corp. v. Wall-Street.com, LLC, 586 U.S. ___ (2019)**:\n   - In this case, the Supreme Court held that the Copyright Act requires a copyright holder to obtain a registered copyright before suing for copyright infringement in U.S. courts. The \"registration approach\" is the correct interpretation of the statute, rather than the \"application approach\" which would have allowed the filing of a lawsuit upon the submission of the copyright application.\n\n3. **Star Athletica, L.L.C. v. Varsity Brands, Inc., 580 U.S. ___ (2017)**:\n   - The Court determined that a feature incorporated into the design of a useful article is eligible for copyright protection if the feature (1) can be perceived as a work of art separate from the useful article and (2) would qualify as a protectable pictorial, graphic, or sculptural work either on its own or in some other medium if imagined separately from the useful article.\n\n4. **Kirtsaeng v. John Wiley & Sons, Inc., 568 U.S. 519 (2013)**:\n   - The Supreme Court held that the doctrine of the first sale, which allows the owner of a legally acquired copyrighted work to resell it, applies to works lawfully made abroad and then imported into the U.S. This was a significant ruling on the international application of the first sale doctrine.\n\nThese cases represent significant decisions on various aspects of copyright law, from fair use doctrine to copyright registration requirements, copyrightable subject matter, and the first sale doctrine. For updated information after my last knowledge update, you should consult current legal resources.', 1, 0, 1, '2024-01-15 16:17:48', '2024-01-15 16:17:48'),
(93, 54, 'How does bankruptcy law work for individuals in financial distress?', 0, 0, 1, '2024-01-15 22:48:59', '2024-01-15 22:48:59'),
(94, 54, 'Bankruptcy law for individuals in financial distress varies from country to country, but I\'ll provide a broad overview of how it generally operates in the United States under the U.S. Bankruptcy Code, particularly under Chapter 7 and Chapter 13, which are the most common forms of individual bankruptcy.\n\n**Chapter 7 Bankruptcy: Liquidation**\n- **Eligibility**: To qualify for Chapter 7, an individual must pass a means test, which compares their income to the median income for a household of their size in their state. If their income is below the median, they can file for Chapter 7.\n- **Process**: Once an individual files for Chapter 7 bankruptcy, an automatic stay is issued, which prevents creditors from collecting debts. A bankruptcy trustee is appointed to manage the case.\n- **Assets**: The trustee will evaluate the bankrupt individual\'s assets and may liquidate non-exempt assets to repay creditors. Each state has a list of exempt assets that the debtor is allowed to keep (such as a certain amount of equity in the home, vehicle, personal belongings, etc.).\n- **Debt Discharge**: After the assets are liquidated and creditors are paid to the extent possible, most remaining unsecured debts (like credit card debts and medical bills) are discharged, meaning the debtor is no longer legally required to pay them.\n\n**Chapter 13 Bankruptcy: Reorganization**\n- **Eligibility**: Chapter 13 is generally for individuals who have a regular income and can afford to pay back at least a portion of their debts through a repayment plan.\n- **Process**: As with Chapter 7, filing for Chapter 13 initiates an automatic stay. Under Chapter 13, the debtor proposes a repayment plan to make installments to creditors over three to five years.\n- **Repayment Plan**: The repayment plan must be approved by the court. It\'s based on the debtor\'s income, expenses, and types of debt. Priority debts (such as child support, taxes, etc.) must be paid in full, while unsecured creditors may not need to be paid in full, depending on the debtor’s disposable income.\n- **Debt Discharge**: After completing the repayment plan, most of the remaining unsecured debts can be discharged, provided the debtor has complied with all other requirements (such as completing a financial management course).\n\n**Impact of Bankruptcy**:\n- Filing for bankruptcy has a significant negative impact on an individual\'s credit score and their ability to obtain credit in the future. Bankruptcies can remain on a credit report for up to 10 years.\n- Not all debts can be discharged in bankruptcy. For example, student loans, child support, alimony, and certain taxes may not be eliminated.\n- There are additional consequences to bankruptcy, such as difficulty in finding housing, higher insurance rates, and potential impacts on employment.\n\n**Legal Proceedings**:\n- An individual seeking bankruptcy must participate in credit counseling before filing.\n- The debtor must complete and file detailed forms, often with the help of a bankruptcy attorney, to commence a bankruptcy case.\n- Throughout the bankruptcy process, the individual must attend court hearings and comply with the legal requirements and procedures set by the bankruptcy court.\n\nBecause bankruptcy laws are complex and can have long-lasting consequences, individuals considering bankruptcy should seek professional advice from a qualified bankruptcy attorney to explore their options and understand the full implications of filing for bankruptcy.', 1, 0, 1, '2024-01-15 22:49:37', '2024-01-15 22:49:37'),
(95, 55, 'hello how are you', 0, 0, 1, '2024-01-15 22:49:39', '2024-01-15 22:49:39'),
(96, 55, 'Hello! I\'m an AI here to help with your legal drafting needs. While I don\'t have feelings, I\'m fully operational and ready to assist you. How can I assist you today?', 1, 0, 1, '2024-01-15 22:49:44', '2024-01-15 22:49:44'),
(97, 56, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-15 23:14:11', '2024-01-15 23:14:11'),
(98, 57, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-15 23:15:01', '2024-01-15 23:15:01'),
(99, 58, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-15 23:15:14', '2024-01-15 23:15:14'),
(100, 58, 'As of my knowledge cutoff date in early 2023, I can provide information on a notable recent case regarding copyright law that was decided on by the U.S. Supreme Court. Keep in mind that new decisions might have been made after my last update, so it is crucial to check the latest resources or databases for the most current information.\n\n**Google LLC v. Oracle America, Inc. (2021)**\n\nOne of the most significant recent copyright law cases decided by the U.S. Supreme Court is *Google LLC v. Oracle America, Inc.*, 593 U.S. ___ (2021). This case concerned the issue of fair use and the copyrightability of software interfaces.\n\nHere\'s a brief summary of the case:\n\n- **Background**: Oracle America, Inc. (the owner of the Oracle Java API) sued Google for copyright infringement, claiming that Google\'s use of Java API in its Android operating system was unauthorized. Specifically, Oracle argued that Google copied the structure, sequence, and organization of the API when it implemented a new Java API for Android that was partially interoperable with Oracle\'s Java API.\n  \n- **Issue**: The key legal issue was whether Google\'s use of the Java API constituted \"fair use\" under copyright law, which is an exception to the exclusive rights held by a copyright owner.\n  \n- **Decision**: The Supreme Court held that Google\'s use of the Java API was protected under the fair use doctrine. The Court noted that Google had only used the parts of the Java API that allowed programmers to put their accrued talents to work in a new and transformative program and concluded that such use was fair as a matter of law.\n\nThe *Google LLC v. Oracle America, Inc.* decision has been seen as a landmark ruling with significant implications for the software industry and the concept of fair use within the realm of copyright law.\n\nTo obtain the most recent Supreme Court judgments on copyright law or any other aspect of law, you would typically refer to legal databases such as Westlaw, LexisNexis, Bloomberg Law, or the official Supreme Court website, which provide the text of the latest opinions and orders. It is also advisable to consult legal professionals or use case law research tools for the latest updates and comprehensive analysis of the judgments.', 1, 0, 1, '2024-01-15 23:15:59', '2024-01-15 23:15:59'),
(101, 59, 'I need information on civil procedure rules in New York for small claims', 0, 0, 1, '2024-01-15 23:18:57', '2024-01-15 23:18:57'),
(102, 59, 'In New York, small claims cases are heard in a Small Claims Court, which is a part of the Civil Court where individuals can sue for money only, up to a certain amount. The procedural rules are designed to be more straightforward and less formal than those in higher courts so that individuals can present their cases without needing a lawyer. Below is a summary of key points regarding the Civil Procedure Rules for small claims in New York:\n\n1. **Jurisdiction**: The Small Claims Court has jurisdiction over cases when the defendant resides, works, or has a place of business in the same city or town where the court is located. The claim must be for money only (no property or specific performance) and usually cannot exceed a certain monetary limit, which is $5,000 in New York City, and may be different outside the city.\n\n2. **Eligibility**: Most individuals, partnerships, associations, and corporations may bring claims to small claims court. However, you must be 18 years or older (or an emancipated minor) to file a claim. If you are younger than 18, a parent or guardian may file the claim on your behalf.\n\n3. **Filing a Claim**: To initiate a case, the claimant must file a Statement of Claim form with the court, providing details of the claim along with the appropriate filing fee. The fee varies depending on the amount of the claim.\n\n4. **Service of Summons**: After filing, the court issues a summons for the defendant, which must be served properly, often by a process server or via certified mail, depending on the local court rules.\n\n5. **Hearing Date**: When the claim is filed, the court will set a date for the hearing. Both parties are expected to be present, and if the defendant fails to show up, the court may issue a default judgment in favor of the plaintiff.\n\n6. **Preparation for Hearing**: Parties should gather all documents, receipts, contracts, photos, or relevant evidence to support their claims or defenses. Witnesses who can offer pertinent testimony should also be prepared to attend.\n\n7. **Conducting the Hearing**: Small claims court proceedings are relatively informal. The judge may ask questions to both parties, and each party will have a chance to present their evidence and arguments. Attorneys are not required, and in some parts of New York, they are not allowed unless the judge permits it.\n\n8. **Judgment**: After hearing both sides, the judge will make a decision, which could be announced at the hearing or mailed to both parties later. The judge\'s decision is final and can only be appealed in limited circumstances.\n\n9. **Collection**: Winning a judgment is only the first step. If the losing party does not voluntarily pay the judgment, the winning party may need to take steps to collect the money, which could involve additional court procedures.\n\nFor the most accurate and up-to-date information, please refer to the New York State Unified Court System\'s website or the specific local small claims court where the claim will be filed. You should also consider consulting with an attorney for guidance, especially if your claim is complex or involves a significant sum of money.', 1, 0, 1, '2024-01-15 23:19:50', '2024-01-15 23:19:50'),
(103, 60, 'Can you create a privacy policy compliant with GDPR for my website?', 0, 0, 1, '2024-01-15 23:21:12', '2024-01-15 23:21:12'),
(104, 61, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-15 23:43:00', '2024-01-15 23:43:00'),
(105, 62, 'Draft a complaint for a breach of contract case in Texas.', 0, 0, 1, '2024-01-15 23:47:05', '2024-01-15 23:47:05'),
(106, 63, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 13:18:01', '2024-01-16 13:18:01'),
(107, 63, 'As of my last update in early 2023, I do not have direct, real-time access to databases, court records, or an updating system for new legal events such as recent Supreme Court judgments. However, I can certainly discuss some landmark U.S. Supreme Court cases on copyright law that had been decided up to that point. If you\'re looking for the most recent decisions, I recommend consulting legal databases such as Westlaw, LexisNexis, or the official Supreme Court website, where the latest opinions are published. You can also check out legal news outlets or law review articles for analysis and summaries of recent judgments. \n\nHere are a few significant U.S. Supreme Court copyright law cases from the past:\n\n1. **Google LLC v. Oracle America, Inc., 593 U.S. ____ (2021)**\n    - This case dealt with whether Google\'s use of Oracle\'s Java API to create the Android operating system constituted \"fair use.\" The Supreme Court ruled in favor of Google, holding that Google\'s use of the Java API was a transformative fair use.\n\n2. **Star Athletica, L.L.C. v. Varsity Brands, Inc., 580 U.S. ____ (2017)**\n    - The Court addressed the issue of copyright protection for fashion designs. The decision clarified the standard for copyrightability of designs, holding that a feature incorporated into the design of a useful article is eligible for copyright protection only if the feature (1) can be perceived as a two- or three-dimensional work of art separate from the useful article, and (2) would qualify as a protectable work on its own.\n\n3. **Kirtsaeng v. John Wiley & Sons, Inc., 568 U.S. 519 (2013)**\n    - This case involved the doctrine of the first sale and whether it applies to legally purchased copyrighted works made abroad. The Supreme Court determined that it does, favoring the principle of international exhaustion of copyright.\n\nTo find the most recent judgments, please check the latest updates on reliable legal resources or consult a legal professional who can provide you with updated information. Remember, interpretation and application of the laws and judgments to specific cases should be performed by a qualified attorney.', 1, 0, 1, '2024-01-16 13:18:32', '2024-01-16 13:18:32'),
(108, 64, 'Draft a complaint for a breach of contract case in Texas.', 0, 0, 1, '2024-01-16 13:39:21', '2024-01-16 13:39:21'),
(109, 64, 'Below is a simplified example of a complaint for a breach of contract case that might be filed in a Texas court. It is important to tailor the content to the specific facts of the case and to follow any specific rules and formatting requirements of the jurisdiction where the complaint is filed. This example is for illustrative purposes and should not be used as a substitute for professional legal advice.\n\n---\n\nIN THE DISTRICT COURT OF [COUNTY NAME] COUNTY, TEXAS\n[PLAINTIFF\'S NAME] §\nPlaintiff, §\nv. § Cause No. [CAUSE NUMBER]\n[DEFENDANT\'S NAME], §\nDefendant. §\n[DIVISION, IF ANY]\n\nCOMPLAINT FOR BREACH OF CONTRACT\n\nPlaintiff [Plaintiff\'s Name], for its Complaint against Defendant [Defendant\'s Name], alleges as follows:\n\n**PARTIES**\n\n1. Plaintiff [Plaintiff\'s Name] is an individual [or company, partnership, etc.] with an address at [Plaintiff\'s Address], [City], [County], Texas.\n\n2. Defendant [Defendant\'s Name] is an individual [or company, partnership, etc.] with an address at [Defendant\'s Address], [City], [County], Texas.\n\n**JURISDICTION AND VENUE**\n\n3. This Court has jurisdiction over the subject matter of this action and over Defendant because the events giving rise to this claim occurred in [County Name] County, Texas.\n\n4. Venue is proper in this county pursuant to Tex. Civ. Prac. & Rem. Code Ann. § 15.002 because it is the county where all or a substantial part of the events or omissions giving rise to the claim occurred.\n\n**FACTS**\n\n5. On or about [Date of Contract], Plaintiff and Defendant entered into a contract, wherein Plaintiff agreed to [describe the service to be performed, goods provided, etc.] for Defendant in exchange for [monetary amount/agreed consideration].\n\n6. A true and correct copy of the contract is attached hereto as Exhibit A.\n\n7. Plaintiff performed all conditions, covenants, and promises required on its part in accordance with the terms of the contract.\n\n8. Defendant breached the contract by [describe the breach, e.g., failing to pay the agreed-upon consideration, not providing the services or goods, etc.].\n\n9. As a direct result of Defendant\'s breach, Plaintiff has suffered damages in an amount to be determined at trial.\n\n**CAUSE OF ACTION FOR BREACH OF CONTRACT**\n\n10. Plaintiff re-alleges and incorporates herein by reference the allegations contained in paragraphs 1 through 9 above.\n\n11. Defendant\'s actions, as alleged above, constitute a breach of contract.\n\n12. Due to Defendant\'s breach, Plaintiff is entitled to damages in an amount to be proven at trial, including but not limited to, [actual damages, consequential damages, etc.], together with interest and costs of court.\n\n**PRAYER FOR RELIEF**\n\nWHEREFORE, Plaintiff prays that Defendant be cited to appear and answer hereof, and that upon final hearing hereof, Plaintiff be awarded a judgment against Defendant for:\n\na. Actual damages in an amount to be proven at trial;\nb. Pre-judgment and post-judgment interest as allowed by law;\nc. Court costs;\nd. Such other and further relief to which Plaintiff may be justly entitled.\n\nRespectfully submitted,\n\n[Plaintiff\'s Attorney\'s Name]\n[Attorney\'s Address]\n[City], [State], [Zip Code]\n[Telephone Number]\n[Fax Number]\n[Email Address]\n[State Bar No.]\n\n**ATTORNEY FOR PLAINTIFF**\n\n---\n\n*Certificate of Service* and *Verification* statements should also be included as per the requirements of the Texas Rules of Civil Procedure.\n\nPlease ensure that a licensed attorney is consulted to customize this complaint to the specific circumstances of the case and to review the court\'s procedural requirements.', 1, 0, 1, '2024-01-16 13:40:11', '2024-01-16 13:40:11'),
(110, 65, 'What are the Federal Rules of Civil Procedure regarding class action lawsuits?', 0, 0, 1, '2024-01-16 13:47:08', '2024-01-16 13:47:08'),
(111, 65, 'The Federal Rules of Civil Procedure (FRCP) regarding class action lawsuits are found primarily in Rule 23. Class action suits are a way for a large number of individuals who have suffered similar harm to sue the defendant in a collective action. Below is a summary of some key provisions of Rule 23:\n\n1. **Prerequisites (Rule 23(a))**: Before a class action can proceed, certain prerequisites must be met:\n   - **Numerosity**: The class is so numerous that joinder of all members is impracticable.\n   - **Commonality**: There are questions of law or fact common to the class.\n   - **Typicality**: The claims or defenses of the representative parties are typical of the claims or defenses of the class.\n   - **Adequacy of Representation**: The representative parties will fairly and adequately protect the interests of the class.\n\n2. **Types of Class Actions (Rule 23(b))**: There are different types of class actions, and a case must fit one of them:\n   - **Class actions for prejudice (23(b)(1))**: The prosecution of separate actions would create a risk of inconsistent adjudications or would impair the interests of other members.\n   - **Class actions for injunctive or declaratory relief (23(b)(2))**: The party opposing the class has acted or refused to act on grounds that apply generally to the class, making injunctive relief or corresponding declaratory relief appropriate for the class as a whole.\n   - **Class actions for damages (23(b)(3))**: The court finds that questions of law or fact common to class members predominate over any questions affecting only individual members, and that a class action is superior to other available methods for fairly and efficiently adjudicating the controversy. The matters pertinent to these findings include:\n     - The interest of members of the class in individually controlling the prosecution or defense of separate actions.\n     - The extent and nature of any litigation concerning the controversy already commenced by or against class members.\n     - The desirability or undesirability of concentrating the litigation of the claims in the particular forum.\n     - The likely difficulties in managing a class action.\n\n3. **Certification Order (Rule 23(c))**: The court must determine whether to certify a case as a class action at an early practicable time and must define the class and the class claims, issues, or defenses. The certification order can be altered or amended before final judgment.\n\n4. **Notice to Class Members (Rule 23(c)(2))**: For actions under Rule 23(b)(3), the court must direct to class members the best notice practicable under the circumstances, informing them of various matters, including the nature of the action, the definition of the class, and the class members\' rights to opt out of the class action or appear with counsel.\n\n5. **Settlement, Voluntary Dismissal, or Compromise (Rule 23(e))**: Any settlement, voluntary dismissal, or compromise must receive court approval, and notice of the proposed settlement must be given to all class members who would be bound by the proposal.\n\nRule 23 also includes provisions related to the conduct of class actions, such as the appointment of class counsel, orders during litigation, and appeals.\n\nIt is important to note that the law surrounding class actions is complex and also may be supplemented by other statutes, such as the Class Action Fairness Act (CAFA), as well as more specific state laws and federal rules. If considering or responding to a class action, it is essential to obtain professional legal advice.', 1, 0, 1, '2024-01-16 13:47:57', '2024-01-16 13:47:57'),
(112, 66, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 14:44:44', '2024-01-16 14:44:44'),
(113, 66, 'As of my knowledge cutoff date in early 2023, I can provide summaries of some recent United States Supreme Court cases related to copyright law. However, please note that there could have been additional cases decided after that date which I would not be aware of. Here are a few significant cases from the last few years:\n\n1. **Google LLC v. Oracle America, Inc., No. 18-956 (2021)**: This case dealt with the question of whether Google\'s use of Oracle\'s Java API for developing the Android operating system was fair use. The Supreme Court held that Google\'s copying of the Java API was a transformative use and therefore constituted fair use under copyright law. This was a landmark decision that helped clarify the application of fair use doctrine to software.\n\n2. **Allen v. Cooper, No. 18-877 (2020)**: In this case, the Supreme Court ruled that states do not have sovereign immunity from copyright infringement claims under the Copyright Remedy Clarification Act (CRCA). The Court found that the CRCA was unconstitutional in terms of its attempt to abrogate state sovereign immunity under the Copyright Clause of the Constitution.\n\nFor the most up-to-date Supreme Court rulings and case law, you should consult legal databases such as Westlaw, LexisNexis, or the Supreme Court’s own website, where opinions are published. Additionally, consulting with a legal professional specializing in intellectual property law can provide more in-depth analysis and discussion of recent developments.', 1, 0, 1, '2024-01-16 14:44:56', '2024-01-16 14:44:56'),
(114, 67, 'I need information on civil procedure rules in New York for small claims', 0, 0, 1, '2024-01-16 15:02:28', '2024-01-16 15:02:28');
INSERT INTO `messages` (`id`, `chat_id`, `message`, `is_bot`, `is_hidden`, `is_included`, `created_at`, `updated_at`) VALUES
(115, 67, 'In New York, small claims cases are heard in Small Claims Court, which is a part of the Civil Court system. Small claims cases are designed to be a quicker and simpler process to resolve disputes involving modest sums of money. Here is some key information regarding small claims in New York:\n\nJurisdictional Limits:\n- The maximum amount that can be claimed in Small Claims Court in New York City is $10,000. Outside New York City, the limit is generally $5,000, but this can vary depending on the location.\n\nWho Can File:\n- Individuals, sole proprietors, and business entities can file as claimants in Small Claims Court, but there are restrictions on how often a business can file.\n- Corporations, partnerships, and associations can only sue for property damage or money claims.\n\nWhere to File:\n- Claims must be filed in the Small Claims Court located in the jurisdiction where the defendant resides, is employed, or has an office for business.\n\nFiling Fees:\n- Filing fees for small claims in New York depend on the amount of the claim. They are typically lower than fees in other civil cases.\n\nRepresentation:\n- Parties often represent themselves without an attorney in Small Claims Court, but they are allowed to have an attorney if desired.\n\nProcedures:\n- Small Claims Court procedures are less formal than those in higher courts. The rules of evidence are not strictly applied, and there is a focus on resolving disputes efficiently.\n\nService of Process:\n- After a claim is filed, the defendant must be served with a summons to appear in court for the hearing. This can be done via various methods, including certified mail or personal service.\n\nHearings:\n- The court will schedule a hearing where both parties can present their case. Witnesses and evidence can be brought forward by both sides.\n  \nAppeals:\n- Decisions made in Small Claims Court can typically be appealed, but there are strict timelines and processes that must be followed.\n\nIt\'s important to review the specific local rules and procedures for the Small Claims Court in the area where the case is being filed. The New York State Unified Court System provides a Small Claims Handbook that offers details on the process and can be found on their official website.\n\nPlease note that this is a general overview and not an exhaustive list of rules. For detailed guidance and latest updates in procedures and limits, you should refer to the official resources provided by the New York State Unified Court System or consult with a legal professional.', 1, 0, 1, '2024-01-16 15:02:48', '2024-01-16 15:02:48'),
(116, 68, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 15:09:12', '2024-01-16 15:09:12'),
(117, 68, 'As of my last update, I cannot provide real-time or the most up-to-date legal cases, rulings, or judgments. For recent Supreme Court judgments on copyright law or any other area of law, it is critical to consult timely legal databases, professional services, or government publications which track legal developments.\n\nIn the United States, for instance, resources such as the U.S. Supreme Court\'s official website, legal research services like Westlaw or LexisNexis, and databases like Google Scholar can offer the latest updates on case law, including Supreme Court decisions.\n\nFor instance, as of my last training data in early 2023, one of the well-known recent Supreme Court cases was Google LLC v. Oracle America, Inc., decided on April 5, 2021. This case addressed the fair use doctrine and found that Google\'s use of Oracle\'s Java API for the Android operating system was a transformative use and thus constituted fair use.\n\nPlease note that newer cases might have been decided or existing cases may have been further interpreted or overruled. Always verify the current status of the law through dependable and current legal channels.', 1, 0, 1, '2024-01-16 15:09:45', '2024-01-16 15:09:45'),
(118, 69, 'Draft a complaint for a breach of contract case in Texas.', 0, 0, 1, '2024-01-16 15:22:48', '2024-01-16 15:22:48'),
(119, 70, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 17:53:51', '2024-01-16 17:53:51'),
(120, 70, 'As of my last knowledge update in early 2023, I do not have access to real-time databases or the ability to pull in new information, including the most recent Supreme Court judgments. However, I can provide information on key Supreme Court cases related to copyright law up to that point. For the latest rulings, it would be necessary for you to consult an updated legal database such as Westlaw, LexisNexis, or the official Supreme Court website.\n\nOne significant Supreme Court case in the realm of copyright law is the Google LLC v. Oracle America, Inc. case decided in April 2021. The Court held that Google\'s use of the Java API, owned by Oracle, was a fair use as a matter of law. This decision was pivotal in the context of software and the application of fair use doctrine.\n\nTo get the most current information, it\'s essential to access legal databases that are updated regularly with new decisions or to consult a legal professional who can provide the latest case law.', 1, 0, 1, '2024-01-16 17:54:13', '2024-01-16 17:54:13'),
(121, 71, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 18:01:51', '2024-01-16 18:01:51'),
(122, 71, 'As of my last update, I don\'t have real-time data access or the ability to provide the most recent court judgments. However, I can mention some significant U.S. Supreme Court cases relating to copyright law that had occurred before 2023:\n\n1. **Google LLC v. Oracle America, Inc. (2021)**: The Supreme Court held that Google\'s use of Oracle\'s Java API, copying only what was needed to allow programmers to work in a different computing environment, was a fair use of the material as a matter of law.\n\n2. **Star Athletica, L.L.C. v. Varsity Brands, Inc. (2017)**: This case addressed the copyrightability of designs on cheerleading uniforms. The Court held that the designs were separable and could be protected by copyright because they could stand alone as works of art independent of the utilitarian aspects of the clothing.\n\n3. **Kirtsaeng v. John Wiley & Sons, Inc. (2013)**: The case involved the doctrine of the first sale, which allows the purchaser of a legally-acquired copyrighted work to resell or otherwise dispose of the particular copy. The Court confirmed that this doctrine applies to works lawfully made abroad and then imported into the U.S.\n\nFor the most recent and authoritative information, you should refer to legal databases such as Westlaw, LexisNexis, or the Supreme Court\'s own website, where they publish opinions shortly after they are handed down. Alternatively, for direct and recent insights, consulting with a legal professional or law firm that specializes in intellectual property law would be beneficial.', 1, 0, 1, '2024-01-16 18:02:18', '2024-01-16 18:02:18'),
(123, 72, 'I need information on civil procedure rules in New York for small claims', 0, 0, 1, '2024-01-16 18:02:19', '2024-01-16 18:02:19'),
(124, 72, 'The New York State Unified Court System has established a specific set of procedures for small claims cases, which are designed to be relatively quick and informal compared to other civil cases. Small claims cases in New York deal with disputes involving money where the amount sought does not exceed a certain limit, typically $5,000 for most courts, while it is $10,000 in the New York City Civil Court.\n\nHere is a brief summary of the civil procedure rules in New York for small claims:\n\n**Filing a Small Claim:**\n- The claim must be filed in the correct venue, typically where the defendant lives, works, or has a place of business.\n- The claimant must fill out a Statement of Claim form, which includes the nature of the claim and the amount of money sought.\n- A small filing fee is required, which varies depending on the claim amount.\n\n**Notifying the Defendant:**\n- Once filed, the court will set a hearing date and notify the defendant with a notice of claim, which must be served properly according to the court’s rules.\n- Defendants in small claims are generally required to appear in person for the hearing.\n\n**The Hearing:**\n- Hearings in small claims court are typically less formal than in other courts.\n- Both parties are allowed to present their evidence and arguments directly to the judge or hearing officer.\n- No attorneys are needed, but parties may choose to be represented by one.\n- Witnesses may be brought to testify on behalf of either party.\n\n**The Decision:**\n- The judge or hearing officer will render a decision after hearing both sides, which may be announced immediately or mailed to the parties afterward.\n- The decision is legally binding and can be enforced through various collection methods if not paid.\n\n**Appeals:**\n- In New York small claims court, the decision can only be appealed by the defendant and not by the claimant.\n- An appeal must be filed within a set time frame, typically 30 days after the decision.\n\nFor the most accurate and detailed information, you should refer to the specific court where the claim is being filed. Different locales can have minor variations in their rules and procedures. Additionally, please note that the above points provide a general overview and the procedures can change. For the latest and most specific information, you should refer to the New York Courts official website or consult with an attorney who is experienced in small claims in the specific locality where the claim will be filed.', 1, 0, 1, '2024-01-16 18:03:14', '2024-01-16 18:03:14'),
(125, 73, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 18:13:51', '2024-01-16 18:13:51'),
(126, 73, 'As of my last update in early 2023, I cannot supply real-time updates or the most current legal decisions. However, I can mention a couple of high-profile copyright law cases decided by the United States Supreme Court in recent years prior to 2023, which had significant implications for copyright law. Here are some notable cases:\n\n1. **Google LLC v. Oracle America, Inc., 593 U. S. ____ (2021)**: This was a landmark decision where the Supreme Court ruled that Google’s use of the Java API, owned by Oracle, was a fair use as a matter of law. The case addressed issues of software copyright ability and the scope of fair use within the context of computer code.\n\n2. **Georgia v. Public.Resource.Org, Inc., 590 U. S. ____ (2020)**: In this case, the Supreme Court ruled that the annotations in the Official Code of Georgia, even though created by a private company, were not copyrightable since they were effectively a work of the government, and referral to them was \"inextricably intertwined\" with those statutes.\n\nKeep in mind that my information is not current, and there may have been further significant rulings since then. For the most recent Supreme Court judgments on copyright law or any other legal area, you would typically consult the Supreme Court’s official website, online legal databases such as Westlaw or LexisNexis, or other current legal resources.', 1, 0, 1, '2024-01-16 18:14:06', '2024-01-16 18:14:06'),
(127, 74, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 18:14:46', '2024-01-16 18:14:46'),
(128, 74, 'I\'m unable to offer real-time or the most recent legal updates, such as recent Supreme Court judgements. My responses are based on knowledge up until my last update in 2023. For the latest Supreme Court decisions on copyright law, you would typically check the Supreme Court\'s official website, legal databases like LexisNexis, Westlaw, or publically available resources like Google Scholar or government databases that archive court decisions. To stay up-to-date, many legal professionals also subscribe to legal news services or periodicals that report on recent cases and legal developments.\n\nHowever, until the date of my last training data, notable U.S. Supreme Court cases concerning copyright law included:\n\n1. **Google LLC v. Oracle America, Inc., 593 U.S.___ (2021)**: In this landmark case, the Supreme Court held that Google\'s use of Oracle\'s Java API (Application Programming Interface) was a fair use as a matter of law, therefore not infringing Oracle\'s copyrights. This case provided further clarification on the application of fair use in the context of software.\n\n2. **Allen v. Cooper, 589 U.S. ___ (2020)**: In this decision, the Supreme Court ruled that states do not have sovereign immunity from copyright infringement claims under the Copyright Remedy Clarification Act (CRCA), because Congress lacked authority to abrogate state sovereign immunity under the Copyright Clause of the Constitution.\n\n3. **Star Athletica, L.L.C. v. Varsity Brands, Inc., 580 U.S.___ (2017)**: This case addressed the copyrightability of fashion designs, specifically cheerleading uniforms. The Court held that the designs were eligible for copyright protection because their design elements could be perceived as both separate and capable of existing independently of the utilitarian aspects of the clothing.\n\nFor the most recent cases and legal trends in copyright law, it is vital to consult a current legal database or a legal professional who can provide the latest information and interpretation of the law as it stands.', 1, 0, 1, '2024-01-16 18:15:14', '2024-01-16 18:15:14'),
(129, 75, 'Draft a complaint for a breach of contract case in Texas.', 0, 0, 1, '2024-01-16 18:15:16', '2024-01-16 18:15:16'),
(130, 76, 'What are my legal rights in a workplace harassment situation?', 0, 0, 1, '2024-01-16 18:16:21', '2024-01-16 18:16:21'),
(131, 76, 'Dealing with workplace harassment can be a stressful and tough experience. If you believe you are being subjected to harassment in the workplace, it\'s important to know that you have legal rights that can be enforced to protect you and to address the situation. The specific rights and remedies available to you may vary depending on your jurisdiction (e.g., country, state, or local municipality), but here is a general overview of the rights many employees have in situations involving workplace harassment:\n\n**1. Right to a Safe Work Environment:**\nMost countries have laws that require employers to provide a safe work environment that is free from harassment and discrimination. This includes protection from harassment based on race, color, religion, sex, national origin, age, disability, and other characteristics protected by law.\n\n**2. Right to File a Complaint:**\nYou have the right to file a complaint regarding the harassment. This can usually be done internally through your employer\'s human resources department or through an external body, such as an equal employment opportunity commission or labor department.\n\n**3. Right to Protection from Retaliation:**\nAfter reporting harassment, you are typically protected from retaliation by your employer. Retaliation includes any adverse action taken against you, such as being fired, demoted, or subjected to more harassment because you made a complaint.\n\n**4. Right to Have the Complaint Investigated:**\nYou have the right to have your complaint promptly and thoroughly investigated by your employer or a relevant authority. During the investigation, confidentiality should be maintained to the extent possible.\n\n**5. Right to Remedies:**\nIf harassment is found to have occurred, you have the right to appropriate remedies. These can include, but are not limited to, reinstatement, compensation for lost wages, a change in work assignments, or other measures necessary to remedy the effects of the harassment.\n\n**6. Right to Take Legal Action:**\nIf internal complaints do not lead to a satisfactory resolution, you can usually take legal action against the employer. This can involve filing a lawsuit for damages or other relief.\n\nIt is crucial to document any incidences of harassment meticulously, including dates, times, witnesses, and the nature of the harassment itself. This documentation can be vital in any investigation or legal action.\n\nGiven the complexity and serious nature of workplace harassment, if you believe you are a victim, it is advisable to seek guidance from a qualified attorney who specializes in employment law to understand the full scope of your rights and the options available to you within your specific jurisdiction.', 1, 0, 1, '2024-01-16 18:17:04', '2024-01-16 18:17:04'),
(132, 77, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 18:17:04', '2024-01-16 18:17:04'),
(133, 77, 'As of my last update, I cannot provide real-time or the most recent Supreme Court judgments. However, I can mention some prominent U.S. Supreme Court cases concerning copyright law that have been influential. For the most recent cases, you\'ll need to consult a legal database or other current legal resources. Below are a few landmark copyright cases decided by the U.S. Supreme Court:\n\n1. **Eldred v. Ashcroft** (2003): This case addressed the constitutionality of the Copyright Term Extension Act (CTEA), which extended the rights of copyright holders. The Court held that the CTEA was constitutional under the Copyright Clause.\n\n2. **Golan v. Holder** (2012): This case involved a challenge to the provisions of the Uruguay Round Agreements Act that restored U.S. copyright protection to certain works that were in the public domain. The Supreme Court upheld the Act, ruling that it did not violate the First Amendment.\n\n3. **Kirtsaeng v. John Wiley & Sons, Inc.** (2013): The Court held that the doctrine of first sale, which allows the owner of a legally purchased copy of a copyrighted work to resell or otherwise dispose of that copy, applies to works lawfully made abroad and then imported into the U.S.\n\n4. **American Broadcasting Companies, Inc. v. Aereo, Inc.** (2014): The Supreme Court ruled that Aereo\'s service, which allowed subscribers to watch television programs over the Internet at about the same time as the programs were broadcast over the air, was a public performance under the Copyright Act and was thus infringing.\n\n5. **Star Athletica, L.L.C. v. Varsity Brands, Inc.** (2017): The Court addressed copyright protection for fashion designs and held that a feature incorporated into the design of a useful article is eligible for copyright protection if the feature (1) can be perceived as a two- or three-dimensional work of art separate from the useful article, and (2) would qualify as a protectable work on its own or fixed in some other tangible medium.\n\nFor the most up-to-date information on recent Supreme Court judgments on copyright law, consulting legal research databases such as Westlaw, LexisNexis, or the official Supreme Court website, as well as legal news outlets, is recommended. Always ensure you are using credible and current resources for your legal research.', 1, 0, 1, '2024-01-16 18:17:30', '2024-01-16 18:17:30'),
(134, 78, 'hello', 0, 0, 1, '2024-01-16 18:25:11', '2024-01-16 18:25:11'),
(135, 78, 'Hello! How can I assist you with your legal drafting or legal inquiry today?', 1, 0, 1, '2024-01-16 18:25:15', '2024-01-16 18:25:15'),
(136, 78, 'How does Build Champions empower immigrants through support and guidance?', 0, 0, 1, '2024-01-16 18:25:30', '2024-01-16 18:25:30'),
(137, 78, '\"Build Champions\" appears to be a reference that could relate to different types of organizations or programs. Since I don\'t have specific information about an entity or program named \"Build Champions,\" I\'ll provide a general response based on the activities that organizations aimed at empowering immigrants typically engage in.\n\nOrganizations that aim to empower immigrants through support and guidance usually offer a range of services and programs designed to help integrate immigrants into their new communities and ensure that they can achieve personal and professional success. Here\'s how such an organization might empower immigrants:\n\n1. Language Education: Providing language classes to help immigrants improve their proficiency in the language spoken in their new country, which is crucial for integration and employment.\n\n2. Employment Assistance: Helping immigrants with job searches, resume writing, interview preparation, and understanding their rights and responsibilities in the workplace.\n\n3. Legal Aid: Offering legal advice and assistance on matters such as immigration status, work permits, citizenship applications, and navigating the legal framework of the host country.\n\n4. Cultural Orientation: Introducing immigrants to the social norms, customs, laws, and other cultural aspects of the host country to facilitate smoother assimilation into society.\n\n5. Social Support: Creating community events and peer support groups where immigrants can meet and build relationships with others who have shared experiences.\n\n6. Advocacy: Advocating for the rights of immigrants at various levels of government and raising awareness of the issues and challenges they face.\n\n7. Education and Training: Providing or facilitating access to education and vocational training that will help immigrants acquire the credentials and skills needed in the job market.\n\n8. Health Services: Offering information about and access to health care services, as well as support in understanding how to navigate the health care system.\n\n9. Financial Guidance: Educating immigrants on financial literacy, including how to manage finances, build credit, and understand taxes in their new country.\n\n10. Youth and Family Programs: Designing programs specifically for children and families to support their specific needs in education, integration, and community-building.\n\nIf \"Build Champions\" is a specific program or entity, it would be helpful to have more context to provide a more precise description of how they empower immigrants. If you can provide additional details, I\'d be glad to offer a more targeted response.', 1, 0, 1, '2024-01-16 18:26:11', '2024-01-16 18:26:11'),
(138, 79, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 18:26:24', '2024-01-16 18:26:24'),
(139, 79, 'I\'m sorry, but I don\'t have access to real-time databases or the latest updates on court judgments beyond my training cut-off in early 2023. Therefore, I cannot provide recent Supreme Court judgments related to copyright law or any other area.\n\nFor the most current and authoritative information, you should consult a legal research platform, visit the official Supreme Court\'s website, or use a database that provides legal professionals access to up-to-date case law. Additionally, it would be prudent to engage with a legal professional who specializes in intellectual property law to get the most recent and pertinent information on copyright law decisions.\n\nThat said, if you have queries about general principles of copyright law, established precedents as of early 2023, or need assistance with drafting documents related to copyright, feel free to ask, and I\'ll do my best to assist you within those parameters.', 1, 0, 1, '2024-01-16 18:26:35', '2024-01-16 18:26:35'),
(140, 80, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 18:26:37', '2024-01-16 18:26:37'),
(141, 80, 'As of my last knowledge update in April 2023, I do not have the capability to access or provide real-time updates on recent Supreme Court judgments, including those related to copyright law. For the most current information on Supreme Court judgments, you would need to check the latest legal databases, law journals, or the official website of the Supreme Court where such rulings are typically published.\n\nTo obtain recent Supreme Court judgments on copyright law, I recommend the following approaches:\n\n1. **Legal Research Databases**: Use legal research databases such as Westlaw, LexisNexis, Bloomberg Law, Google Scholar, or other dedicated legal resources that are continuously updated with the latest case law.\n\n2. **Supreme Court Website**: Visit the official website of the Supreme Court of your jurisdiction. Many high courts and supreme courts around the world publish their rulings online.\n\n3. **Law Journals**: Academic law journals often discuss and analyze recent court decisions, including those from the Supreme Court, which can provide insight into the implications of the rulings.\n\n4. **News Outlets**: Legal news outlets and publishers like Law360, The National Law Review, or The Legal Intelligencer frequently report on recent Supreme Court decisions.\n\nRemember, accessing some of these resources may require a subscription or a professional affiliation with the legal field. After obtaining the judgments, you should review them carefully or consult with a legal professional to understand their implications fully.\n\nIf you have a specific case or topic in mind within copyright law and would like a general overview or summary, I can attempt to provide information based on my current knowledge, but I cannot guarantee the recency of the data.', 1, 0, 1, '2024-01-16 18:26:52', '2024-01-16 18:26:52'),
(142, 81, 'I need information on civil procedure rules in New York for small claims', 0, 0, 1, '2024-01-16 18:31:57', '2024-01-16 18:31:57'),
(143, 81, 'In New York, small claims cases are handled in the Small Claims Court, a subdivision of the city courts, district courts, and the New York City Civil Court. Small Claims Court offers a quicker and simpler way to resolve monetary disputes involving small amounts of money, typically under a certain threshold. Here are key aspects of small claims procedure in New York:\n\n1. **Monetary Limit**: The maximum amount that can be recovered through small claims court varies by location. In towns and villages, the limit is generally $3,000; in cities, the limit is often $5,000.\n\n2. **Eligibility**: Individuals, sole proprietors, and business entities can bring actions in Small Claims Court, while corporations, partnerships, and associations have the right to file claims in some courts up to the local limit.\n\n3. **Jurisdiction**: The case must be filed in the jurisdiction where either the defendant resides, has a place of business, or is employed.\n\n4. **Filing the Claim**: To initiate a small claims action, the claimant must file a Statement of Claim form, which includes a concise version of the facts and the amount demanded.\n\n5. **Service of Process**: After filing the claim, the claimant is responsible for ensuring the defendant is served with a notice of the claim. Service must comply with the rules set by the Small Claims Court, and proof of service must be filed with the court.\n\n6. **Court Appearance**: Both parties are expected to appear on the scheduled court date. Small Claims Court is relatively informal, and the parties often represent themselves, but they may also have an attorney if they choose.\n\n7. **Evidence**: Parties should bring all relevant evidence to the hearing, including contracts, receipts, photographs, and any other documents or witnesses that can support their claims or defenses.\n\n8. **Judgment**: After hearing the case, the judge or arbitrator will make a decision which may be announced at the hearing or mailed to the parties afterward. The judgment is legally binding on both parties.\n\n9. **Appeal**: Either party may appeal the judgment, but there are strict time limits to file an appeal, and in many cases, the appealing party may be required to pay a fee.\n\n10. **Collecting the Judgment**: If the claimant wins the case, they are responsible for the collection of the judgment. The court does not collect the judgment for them, but it may provide resources or instructions on how to collect.\n\nIt\'s important to note that rules can vary slightly by court. This information provides a general overview, and for detailed instructions and procedures, one should consult the New York State Unified Court System\'s website or the specific court where the claim would be filed. Additionally, procedural rules and limits are subject to change, and one should verify the current standards before proceeding with a small claim.', 1, 0, 1, '2024-01-16 18:32:22', '2024-01-16 18:32:22'),
(144, 82, 'Can you provide recent Supreme Court judgments on copyright law?', 0, 0, 1, '2024-01-16 18:52:12', '2024-01-16 18:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_03_111542_create_chats_table', 1),
(6, '2024_01_03_112806_create_messages_table', 1),
(7, '2019_05_03_000001_create_customer_columns', 2),
(8, '2019_05_03_000002_create_subscriptions_table', 2),
(9, '2019_05_03_000003_create_subscription_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'user_access', '485c4e286642b660f7051a2f956674744074715f82f4624ed2579a4cb819614b', '[\"*\"]', NULL, NULL, '2024-01-10 15:41:47', '2024-01-10 15:41:47'),
(2, 'App\\Models\\User', 2, 'auth_token', 'bc13f64c9d1d9dcd36ce777133b33df03295a7cfab8086b6d8da368726d5e037', '[\"*\"]', NULL, NULL, '2024-01-10 16:11:00', '2024-01-10 16:11:00'),
(3, 'App\\Models\\User', 2, 'user_access', 'fddfde6bdce49e1df3a495a3faa4bc2805970ded3af7a626da3bb364673b1686', '[\"*\"]', NULL, NULL, '2024-01-10 16:13:00', '2024-01-10 16:13:00'),
(4, 'App\\Models\\User', 3, 'auth_token', '566995b2c32eb6ed627448952dd2c549884bae8a4011b5a9e50eaf5a26b017b1', '[\"*\"]', NULL, NULL, '2024-01-10 16:31:28', '2024-01-10 16:31:28'),
(5, 'App\\Models\\User', 4, 'auth_token', '92dbcf257b4f61225a7fd19518b65ad985a8a4865ceb89bf2b53323de1799c42', '[\"*\"]', NULL, NULL, '2024-01-10 16:35:25', '2024-01-10 16:35:25'),
(6, 'App\\Models\\User', 5, 'auth_token', '84aabb200976a043a76efcadebb08c8efa514db023dd65d4148e49fb1b143a4f', '[\"*\"]', NULL, NULL, '2024-01-10 16:37:52', '2024-01-10 16:37:52'),
(7, 'App\\Models\\User', 6, 'auth_token', '2c4bee1b54913f21a9ab0ad70e743c9c04debebac9c31115789b8fe30c7cf685', '[\"*\"]', NULL, NULL, '2024-01-10 16:44:56', '2024-01-10 16:44:56'),
(8, 'App\\Models\\User', 6, 'user_access', '65cb20fce75b8e81a919c901d50fb58bc10b474324a1ef505f115fcd1a259138', '[\"*\"]', NULL, NULL, '2024-01-10 16:46:36', '2024-01-10 16:46:36'),
(9, 'App\\Models\\User', 7, 'auth_token', '933865a867c117b55a00989f4566d0a3caeffb4ad28edcdab5d9c3d22f51d291', '[\"*\"]', NULL, NULL, '2024-01-10 17:00:56', '2024-01-10 17:00:56'),
(10, 'App\\Models\\User', 6, 'user_access', '8e830ce74258ddab30eb80586796fe5ddfa549e1ef5ddbebbc68d7ec9b9bce84', '[\"*\"]', NULL, NULL, '2024-01-10 17:05:05', '2024-01-10 17:05:05'),
(11, 'App\\Models\\User', 6, 'user_access', 'c5a1c916ca4f7d94eaa0173b59bc7f458d027d54f783bc902e37b1f06455eef7', '[\"*\"]', NULL, NULL, '2024-01-10 17:05:18', '2024-01-10 17:05:18'),
(12, 'App\\Models\\User', 7, 'user_access', '081bda56c6f9cc46bb280da7ea24b70aaa87307060d55abba1f797669738549d', '[\"*\"]', NULL, NULL, '2024-01-10 17:07:23', '2024-01-10 17:07:23'),
(13, 'App\\Models\\User', 6, 'user_access', '69b1d6d634880b37c6e2363a197fd0700ab033ee703012360d1e00498f1067c4', '[\"*\"]', NULL, NULL, '2024-01-10 18:07:53', '2024-01-10 18:07:53'),
(14, 'App\\Models\\User', 8, 'auth_token', 'e15afbc7a9c883d58489b7cf3d996f82cec6b519ec5318871ef8137712ac2c15', '[\"*\"]', NULL, NULL, '2024-01-10 18:08:55', '2024-01-10 18:08:55'),
(15, 'App\\Models\\User', 9, 'auth_token', '4d635bce84dacace48e4b73823601a08058a42d5c000593c85108cfefe5c7491', '[\"*\"]', NULL, NULL, '2024-01-10 18:27:16', '2024-01-10 18:27:16'),
(16, 'App\\Models\\User', 9, 'user_access', '6e3b38b301f5ad52d638e06348a9db44bb4ed933d449ac382119f5dfeeb66a2d', '[\"*\"]', NULL, NULL, '2024-01-10 18:29:12', '2024-01-10 18:29:12'),
(17, 'App\\Models\\User', 6, 'user_access', '794f89935b102b688662355e9dc047953464bf981e0c29691f64175fe3e87225', '[\"*\"]', NULL, NULL, '2024-01-10 18:31:33', '2024-01-10 18:31:33'),
(18, 'App\\Models\\User', 8, 'user_access', 'e801b3174295800d96705c5bbf8ffd59b26925f885d5b1adeea4ff8142ee6484', '[\"*\"]', NULL, NULL, '2024-01-10 18:34:00', '2024-01-10 18:34:00'),
(19, 'App\\Models\\User', 10, 'auth_token', '76feeeed31277b70ddf12f86d1a2f19d2a30a66a3abd8f49d66cf756b17653bc', '[\"*\"]', NULL, NULL, '2024-01-10 18:48:11', '2024-01-10 18:48:11'),
(20, 'App\\Models\\User', 10, 'user_access', 'f21b7ca4ace6160f39787f189946eb7c340ca98ac5e2acd015c6de54570b5f97', '[\"*\"]', NULL, NULL, '2024-01-10 18:48:31', '2024-01-10 18:48:31'),
(21, 'App\\Models\\User', 10, 'user_access', '5bfdc592c970344b8ea06c9ca3f0839b5d95491d368889625d33fed9348e5a30', '[\"*\"]', NULL, NULL, '2024-01-10 18:49:27', '2024-01-10 18:49:27'),
(22, 'App\\Models\\User', 10, 'user_access', '4997fa516148af932c3384f4d65aaed905d62f2c1b9580111d44c421597ee4e3', '[\"*\"]', NULL, NULL, '2024-01-10 19:05:41', '2024-01-10 19:05:41'),
(23, 'App\\Models\\User', 10, 'user_access', '71d1ced8272bfa04efe9cdb7d7a479d26e5b5821f9049438d06544168c7cab58', '[\"*\"]', NULL, NULL, '2024-01-10 19:07:57', '2024-01-10 19:07:57'),
(24, 'App\\Models\\User', 10, 'user_access', 'be7ccadb7387c218564eed7258fb70a51d2f7f1ab21b8a5c49152168e669dec0', '[\"*\"]', NULL, NULL, '2024-01-10 19:10:56', '2024-01-10 19:10:56'),
(25, 'App\\Models\\User', 8, 'user_access', '002f3d52d92bb232cb86c84dfafcda3f986ab96b21b21635f9d25bcb89823d26', '[\"*\"]', NULL, NULL, '2024-01-10 19:14:21', '2024-01-10 19:14:21'),
(26, 'App\\Models\\User', 8, 'user_access', '6f7e58081cd6e710188ff477afb4037837c2a412387551124d26af2ff6d8a4c7', '[\"*\"]', NULL, NULL, '2024-01-10 19:14:49', '2024-01-10 19:14:49'),
(27, 'App\\Models\\User', 8, 'user_access', '2b493e975067583751fce02708e2889a3ec8caae94a92e9027b451e90b9eb61b', '[\"*\"]', NULL, NULL, '2024-01-10 19:15:50', '2024-01-10 19:15:50'),
(28, 'App\\Models\\User', 10, 'user_access', '767b9ded705113e95f317bb08cc20b0917da2ddac747963cba20e79d8286f220', '[\"*\"]', NULL, NULL, '2024-01-10 19:21:08', '2024-01-10 19:21:08'),
(29, 'App\\Models\\User', 10, 'user_access', '7ef48d4d7b7c2ced11af165585758c8a403b5aa91cedcde4090e13d277b73a91', '[\"*\"]', NULL, NULL, '2024-01-10 19:25:21', '2024-01-10 19:25:21'),
(30, 'App\\Models\\User', 10, 'user_access', '13138389234e2e458b73991a4bd428fa6fcdd4c81bd85f75c5fbe6043f001903', '[\"*\"]', NULL, NULL, '2024-01-10 19:27:54', '2024-01-10 19:27:54'),
(31, 'App\\Models\\User', 11, 'auth_token', '586edf88b87058d966fa8aa47ae3ccc5125141a54e3389840f5b883819dd1187', '[\"*\"]', NULL, NULL, '2024-01-10 19:28:49', '2024-01-10 19:28:49'),
(32, 'App\\Models\\User', 11, 'user_access', '2af2f9be156e2c0e96c60765b81fb66de82ff51ab9cbf2396e8766a2beee5244', '[\"*\"]', NULL, NULL, '2024-01-10 19:29:20', '2024-01-10 19:29:20'),
(33, 'App\\Models\\User', 10, 'user_access', 'fc12c1ef1bb5712223522f8b52ac118386d8476e96e7cfa2b6b88380085d4ac7', '[\"*\"]', NULL, NULL, '2024-01-10 19:34:58', '2024-01-10 19:34:58'),
(34, 'App\\Models\\User', 10, 'user_access', 'cd60379627bf8446d8d3a588a49b0288f430afb00c39e4c78ead774612294f40', '[\"*\"]', NULL, NULL, '2024-01-10 20:02:43', '2024-01-10 20:02:43'),
(35, 'App\\Models\\User', 10, 'user_access', 'b777234ee451d288bbe16c65ee21ec9d6e3cb045bf95f047c718c76b9032ed98', '[\"*\"]', NULL, NULL, '2024-01-10 20:03:51', '2024-01-10 20:03:51'),
(36, 'App\\Models\\User', 10, 'user_access', '587591705afbb39af7c33619d09b8b16fe14ea0a8dce21dc42e8e20c70689ef0', '[\"*\"]', NULL, NULL, '2024-01-10 20:11:38', '2024-01-10 20:11:38'),
(37, 'App\\Models\\User', 10, 'user_access', 'f748f847775744418f736ea73ab09a7d190c39381e69314d6058f0e9a983c18c', '[\"*\"]', NULL, NULL, '2024-01-10 20:20:12', '2024-01-10 20:20:12'),
(38, 'App\\Models\\User', 10, 'user_access', '81fa4ba550038b80e82a8e9d47d089615ddb18709853c5a664e8a90c27a067cb', '[\"*\"]', NULL, NULL, '2024-01-10 20:23:53', '2024-01-10 20:23:53'),
(39, 'App\\Models\\User', 10, 'user_access', 'b2335a02a280464f6052e4e61a5766c4ebeecefa203d580f38e791e89a2ec7e4', '[\"*\"]', NULL, NULL, '2024-01-10 20:24:56', '2024-01-10 20:24:56'),
(40, 'App\\Models\\User', 10, 'user_access', '103afe61698b4f2cd7fda23d0859b831172410211f05f45dad04b70792804dff', '[\"*\"]', NULL, NULL, '2024-01-10 20:35:12', '2024-01-10 20:35:12'),
(41, 'App\\Models\\User', 10, 'user_access', 'e55d169cebcd93ef77f3ac34a44a89f2d4a88070761b769661be3028a102ffc1', '[\"*\"]', NULL, NULL, '2024-01-10 20:44:15', '2024-01-10 20:44:15'),
(42, 'App\\Models\\User', 10, 'user_access', 'fa4fc5764c9163f85c27db8336c0cff952b9c5d3118a4438c0a12495523e7314', '[\"*\"]', NULL, NULL, '2024-01-10 21:40:14', '2024-01-10 21:40:14'),
(43, 'App\\Models\\User', 12, 'auth_token', 'be9e1e784ecb02d0c6bf722f2ca0b4aa42ab009bec03fd5df75e7015e56497fe', '[\"*\"]', NULL, NULL, '2024-01-10 21:41:20', '2024-01-10 21:41:20'),
(44, 'App\\Models\\User', 13, 'auth_token', '0df2f60019463b4c77e188db5b76fd3c751371338bcd98f125960e65e222cb19', '[\"*\"]', NULL, NULL, '2024-01-10 21:43:16', '2024-01-10 21:43:16'),
(45, 'App\\Models\\User', 13, 'user_access', '1bac4f63aaf459aae86ac13ecda4966c6a19ef57d37289a1c59af4c10d43c579', '[\"*\"]', NULL, NULL, '2024-01-10 21:43:31', '2024-01-10 21:43:31'),
(46, 'App\\Models\\User', 10, 'user_access', 'd8d4851c8be118db2eb27d57d67c38bd9efde620b4fc17a96f99e70215e23bad', '[\"*\"]', NULL, NULL, '2024-01-11 13:15:38', '2024-01-11 13:15:38'),
(47, 'App\\Models\\User', 10, 'user_access', 'fb10ee8036c215a035403694c47a57bb3f12d2fd8e426d8e30ebf3d0fb3cf410', '[\"*\"]', NULL, NULL, '2024-01-11 14:59:02', '2024-01-11 14:59:02'),
(48, 'App\\Models\\User', 10, 'user_access', 'b376d37415d8e79f5834b0c0708da49029df3bea3ae1670e40a7e78c6fd2b0e8', '[\"*\"]', NULL, NULL, '2024-01-11 14:59:04', '2024-01-11 14:59:04'),
(49, 'App\\Models\\User', 10, 'user_access', '9ed2add2365eb76f07403136c787f7a2b014f7c9e8e7e203039b702a6815a823', '[\"*\"]', NULL, NULL, '2024-01-11 14:59:06', '2024-01-11 14:59:06'),
(50, 'App\\Models\\User', 10, 'user_access', 'd722bf9b15dcdb9b458ed8c952664fb455b4989f2eac256bce4b2ef425672188', '[\"*\"]', NULL, NULL, '2024-01-11 14:59:07', '2024-01-11 14:59:07'),
(51, 'App\\Models\\User', 10, 'user_access', 'aad65890e949c49bf1bbfd5e058c7cc34c66c954b64c27cd88285035367174ff', '[\"*\"]', NULL, NULL, '2024-01-12 17:02:35', '2024-01-12 17:02:35'),
(52, 'App\\Models\\User', 14, 'auth_token', '2c025934105fe251f974de90469d82644accfd1a2640ca282865814807276798', '[\"*\"]', NULL, NULL, '2024-01-12 19:05:51', '2024-01-12 19:05:51'),
(53, 'App\\Models\\User', 14, 'user_access', '8b4002798d516fd9db2153aee359f1ece5c7d8ca9b689f5aa97da80d7f7820f4', '[\"*\"]', NULL, NULL, '2024-01-12 19:06:11', '2024-01-12 19:06:11'),
(54, 'App\\Models\\User', 15, 'auth_token', '80cd01826fb27d61cf5155cb23122e21144b2965aec57398027bff68a9c424cc', '[\"*\"]', NULL, NULL, '2024-01-12 20:25:53', '2024-01-12 20:25:53'),
(55, 'App\\Models\\User', 15, 'user_access', '7efcc058556c0404b5950678ff442709c3aa3d51bb4ca0cb497059ef716aa11b', '[\"*\"]', NULL, NULL, '2024-01-12 20:26:15', '2024-01-12 20:26:15'),
(56, 'App\\Models\\User', 16, 'auth_token', '310ba24bacf7e86100dbfd01ee92ceb2e5a0259e26d59bc9c5736e27e59bf428', '[\"*\"]', NULL, NULL, '2024-01-12 20:47:32', '2024-01-12 20:47:32'),
(57, 'App\\Models\\User', 16, 'user_access', '3faba28ddb3e61b60420517d4148d8e83a8243fbceec264b2ba2c411144e2af9', '[\"*\"]', NULL, NULL, '2024-01-12 20:48:00', '2024-01-12 20:48:00'),
(58, 'App\\Models\\User', 10, 'user_access', '6a86a33ebcc75a7f4b97a94535a2d8456037d326f55ef5dbec994c6d9a0ac375', '[\"*\"]', NULL, NULL, '2024-01-15 23:02:03', '2024-01-15 23:02:03'),
(59, 'App\\Models\\User', 10, 'user_access', 'bbe547f3ff09387a920d074e95a0d08e8913a44cfaa2a580f0564f8f4f96fa18', '[\"*\"]', NULL, NULL, '2024-01-15 23:42:16', '2024-01-15 23:42:16'),
(60, 'App\\Models\\User', 10, 'user_access', 'cbf7fa19ea221fdd3cba09ad5b6874fe78c3d3ee6e4f6d629fbe04aed96157b4', '[\"*\"]', NULL, NULL, '2024-01-16 13:37:42', '2024-01-16 13:37:42'),
(61, 'App\\Models\\User', 17, 'auth_token', 'ae94db2a55f6f6950ec9836fd2f786773e05d521d134374c7b1818aee042e619', '[\"*\"]', NULL, NULL, '2024-01-16 14:54:41', '2024-01-16 14:54:41'),
(62, 'App\\Models\\User', 17, 'user_access', 'a4db9a3a1bfb77d17c81cc3d0609145c91f9c2d022d4fa278221458444724418', '[\"*\"]', NULL, NULL, '2024-01-16 14:55:01', '2024-01-16 14:55:01'),
(63, 'App\\Models\\User', 18, 'auth_token', '3c257aabbc4ffded259491f0ac022a31d68fc007a4682880c1552d97344ef0bf', '[\"*\"]', NULL, NULL, '2024-01-16 17:57:34', '2024-01-16 17:57:34'),
(64, 'App\\Models\\User', 18, 'user_access', '6cf68ed6ef2ff0c9e811f0f7a01537d93056a2b680a5ee419e304a9193d365dd', '[\"*\"]', NULL, NULL, '2024-01-16 17:57:50', '2024-01-16 17:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('user','admin') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_type`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'haseeb', 'haseeb@gmail.com', NULL, '$2y$12$sZc5/Tvjcu5Y2tlBDZD9t.3JVXTbJH5spxX0P7gpGctDa0XYwb.aG', 'user', NULL, '2024-01-10 15:41:47', '2024-01-10 15:41:47', NULL, NULL, NULL, NULL),
(2, 'test', 'email@gmail.com', NULL, '$2y$12$tX5u2OSSeXIrUgV5MuRAIOEEpNXZEb4uN5XQElbcxex8Yety0.2lW', 'user', NULL, '2024-01-10 16:11:00', '2024-01-10 16:11:00', NULL, NULL, NULL, NULL),
(3, 'user', 'user|@gmail.com', NULL, '$2y$12$AHUIlqU/SROcCQYkSOTAWeoupVKWd8pQCGWu/3rAc94N6ttacmzti', 'user', NULL, '2024-01-10 16:31:28', '2024-01-10 16:31:28', NULL, NULL, NULL, NULL),
(4, 'john Doe', 'john@gnail.com', NULL, '$2y$12$BD6Ar9LL6DsQ47DRIxfx2uc7xi93HFPBY6nhuhwGBlrQXLb4x3AKi', 'user', NULL, '2024-01-10 16:35:25', '2024-01-10 16:35:25', NULL, NULL, NULL, NULL),
(5, 'lala', 'lala@gmail.com', NULL, '$2y$12$oFwJMy58N55A3AZS47nzm.VvHNcw5ZpEJ7s1Iy8y5EVGZEovHHx/K', 'user', NULL, '2024-01-10 16:37:52', '2024-01-10 16:37:52', NULL, NULL, NULL, NULL),
(6, 'haseeb', 'haseeb11@gmail.com', NULL, '$2y$12$LALoSlI8V7cHm3zGYJoYl.FvOzAPuUnNeiMxlp.tcCTLeBeRn6DVq', 'user', NULL, '2024-01-10 16:44:56', '2024-01-10 16:44:56', NULL, NULL, NULL, NULL),
(7, 'loop', 'loop@gmail.com', NULL, '$2y$12$BeaewL21Zu8GoJKWImBPfuEp2Y0K5gtd/o8Nkifh44iYAfT6OzMIu', 'user', NULL, '2024-01-10 17:00:56', '2024-01-10 17:00:56', NULL, NULL, NULL, NULL),
(8, 'khan', 'khan@gmail.com', NULL, '$2y$12$hJh598p4pQzbqK4fODf58uOL44.2fwChx4o2zA4AFZSH0h7cFo4Gm', 'user', NULL, '2024-01-10 18:08:55', '2024-01-10 18:08:55', NULL, NULL, NULL, NULL),
(9, 'joni', 'joni@gmail.com', NULL, '$2y$12$u/Kds1x9wPtytIE6uFMbjuV0AFxYkXr5s1EXEe3Ifh32p7XahRs66', 'user', NULL, '2024-01-10 18:27:16', '2024-01-10 18:27:16', NULL, NULL, NULL, NULL),
(10, 'lala ali', 'lala11@gmail.com', NULL, '$2y$12$NipuQ48ugQFIjdE3/hiqWeOcLYP5cKT0ruwHMAMNmc69zjRHPXAZu', 'user', NULL, '2024-01-10 18:48:11', '2024-01-10 18:48:11', NULL, NULL, NULL, NULL),
(11, 'has', 'has@gmail.com', NULL, '$2y$12$djYIfNu4skS9PhmferVQ.esUe1/qyMgNH/MIQRQMqOSXK848tbMli', 'user', NULL, '2024-01-10 19:28:49', '2024-01-10 19:28:49', NULL, NULL, NULL, NULL),
(12, 'hello', 'hello@gmail.com', NULL, '$2y$12$.O6RX1C7FV3k/FgbGhgf8eDJztOYQsMPh0qJyfStOcrMP/xmR6J..', 'user', NULL, '2024-01-10 21:41:20', '2024-01-10 21:41:20', NULL, NULL, NULL, NULL),
(13, 'hello1', 'hello1@gmail.com', NULL, '$2y$12$vNSP5wems5nrJ5EljdbmHupYScWktZ7W.xX1IkZYZw1NG5Ggpcwp2', 'user', NULL, '2024-01-10 21:43:16', '2024-01-10 21:43:16', NULL, NULL, NULL, NULL),
(14, 'jg', 'jg@gmail.com', NULL, '$2y$12$/uG3KL/mG5Mg6HZvih0EqOfL8m.r/.1Plozu/vkusgMUUtxqrzM0m', 'user', NULL, '2024-01-12 19:05:51', '2024-01-12 19:05:51', NULL, NULL, NULL, NULL),
(15, 'faq', 'faq@gmail.com', NULL, '$2y$12$GdLRm/S8egwUUV4vgRgMqOPxRiKEm.eg9lB1VRKk4xeeboMSo00u2', 'user', NULL, '2024-01-12 20:25:53', '2024-01-12 20:25:53', NULL, NULL, NULL, NULL),
(16, 'kl', 'kl@gmail.com', NULL, '$2y$12$rri.4QR.LmcVxgYVvYKqeeOU3oE8KaFYpuEi3TlMH8kXKP6BMrT5W', 'user', NULL, '2024-01-12 20:47:32', '2024-01-12 20:47:32', NULL, NULL, NULL, NULL),
(17, 'hello', 'hello11@gmail.com', NULL, '$2y$12$LFvuzhFtby.j4KTgCd2aIOFeiM0quDY8C4jnKdKQxLedXKuMGox4u', 'user', NULL, '2024-01-16 14:54:41', '2024-01-16 14:54:41', NULL, NULL, NULL, NULL),
(18, 'kamil', 'kamil@gmail.com', NULL, '$2y$12$cm0UvplZWMlMm7A3wk2xOOUQQhG0DdtaCZGKqlZQRizhoNwbZTNay', 'user', NULL, '2024-01-16 17:57:34', '2024-01-16 17:57:34', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscription_items_subscription_id_stripe_price_index` (`subscription_id`,`stripe_price`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
