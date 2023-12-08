# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 11.1.2-MariaDB-1:11.1.2+maria~ubu2204)
# Database: bookswap
# Generation Time: 2023-12-08 13:46:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `blurb` varchar(255) NOT NULL,
  `page_count` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `genre_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;

INSERT INTO `books` (`id`, `title`, `author`, `blurb`, `page_count`, `year`, `image`, `created_at`, `updated_at`, `genre_id`)
VALUES
	(1,'Defense of the Realm','Denna Bottjer','Contusion of vagina and vulva, initial encounter',1257,'2012','http://dummyimage.com/189x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(2,'All Is Lost','Cam Yokley','Minor laceration of unspecified innominate or subclavian artery',2706,'1993','http://dummyimage.com/201x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(3,'Crossroads','Quintin Dancer','Secondary sideroblastic anemia due to disease',558,'2008','http://dummyimage.com/233x100.png/dddddd/000000',NULL,NULL,3),
	(4,'Skin Deep','Garland Bester','Contracture, right elbow',2292,'2010','http://dummyimage.com/191x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(5,'It\'s a Boy Girl Thing','Erhart Nind','Contusion of unspecified ring finger with damage to nail, sequela',1538,'2004','http://dummyimage.com/246x100.png/ff4444/ffffff',NULL,NULL,4),
	(6,'North West Frontier','Tiffi Bydaway','Other infectious mononucleosis with polyneuropathy',1865,'1993','http://dummyimage.com/185x100.png/cc0000/ffffff',NULL,NULL,2),
	(7,'MacGyver: Lost Treasure of Atlantis','Serena Straw','Occupant of animal-drawn vehicle injured in collision with other animal-drawn vehicle, initial encounter',1956,'2008','http://dummyimage.com/181x100.png/cc0000/ffffff',NULL,NULL,4),
	(8,'Pretty in Pink','Davide Beaby','Laceration of other specified muscles, fascia and tendons at wrist and hand level',2673,'1998','http://dummyimage.com/203x100.png/cc0000/ffffff',NULL,NULL,2),
	(9,'Hadewijch','Tammy Elwel','Other specified injury of femoral artery, unspecified leg',1570,'1993','http://dummyimage.com/131x100.png/ff4444/ffffff',NULL,NULL,4),
	(10,'Cold Prey (Fritt Vilt)','Franzen Churm','Unspecified reduction defect of left lower limb',642,'2007','http://dummyimage.com/210x100.png/cc0000/ffffff',NULL,NULL,3),
	(11,'Big Bang Love, Juvenile A (46-okunen no koi)','Corey Lampert','Displaced comminuted fracture of shaft of radius, left arm, initial encounter for open fracture type I or II',2462,'2001','http://dummyimage.com/191x100.png/ff4444/ffffff',NULL,NULL,4),
	(12,'Outbreak','Nettle Roman','Toxoplasmosis with other organ involvement',2971,'2011','http://dummyimage.com/119x100.png/dddddd/000000',NULL,NULL,4),
	(13,'Oliver & Company','Andrej Benardeau','Poisoning by propionic acid derivatives, assault, initial encounter',2991,'2009','http://dummyimage.com/243x100.png/ff4444/ffffff',NULL,NULL,4),
	(14,'Horse Rebellion, The (Pulakapina)','Farrel Dye','Puncture wound without foreign body of unspecified lesser toe(s) without damage to nail',989,'2012','http://dummyimage.com/145x100.png/ff4444/ffffff',NULL,NULL,2),
	(15,'Faces of Death 3','Rosana Binns','Toxic effect of ethanol, intentional self-harm, subsequent encounter',330,'2006','http://dummyimage.com/175x100.png/dddddd/000000',NULL,NULL,2),
	(16,'Seventh Horse of the Sun  (Suraj Ka Satvan Ghoda)','Sanderson Corish','Toxic effect of venom of bees, intentional self-harm, sequela',1384,'2007','http://dummyimage.com/122x100.png/cc0000/ffffff',NULL,NULL,1),
	(17,'Little Ashes','Zorine Worwood','Keratoconjunctivitis sicca, not specified as Sjogren\'s, bilateral',2073,'1999','http://dummyimage.com/173x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(18,'Men Without Women','Orrin Follett','Laceration of muscle, fascia and tendon of abdomen',793,'1986','http://dummyimage.com/104x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(19,'Angus, Thongs and Perfect Snogging','Sileas Jevons','Postprocedural hematoma of an endocrine system organ or structure following an endocrine system procedure',2991,'2003','http://dummyimage.com/195x100.png/ff4444/ffffff',NULL,NULL,1),
	(20,'An Evening with Robin Williams','Gussie Worms','Rheumatoid polyneuropathy with rheumatoid arthritis of left hand',1127,'1986','http://dummyimage.com/101x100.png/dddddd/000000',NULL,NULL,1),
	(21,'Night in the Life of Jimmy Reardon, A','Michaelina Caulton','Intentional self-harm by drowning and submersion in natural water',1298,'1993','http://dummyimage.com/148x100.png/ff4444/ffffff',NULL,NULL,2),
	(22,'Storm Warning','Beth Juggins','Opera house as the place of occurrence of the external cause',844,'2005','http://dummyimage.com/109x100.png/dddddd/000000',NULL,NULL,2),
	(23,'Goal! III','Richardo Godball','Age-related osteoporosis with current pathological fracture, unspecified femur, subsequent encounter for fracture with malunion',2210,'1993','http://dummyimage.com/231x100.png/cc0000/ffffff',NULL,NULL,3),
	(24,'Bonsái','Verge Duffin','Unspecified injury of dorsal artery of left foot, sequela',2132,'1999','http://dummyimage.com/237x100.png/cc0000/ffffff',NULL,NULL,2),
	(25,'Gangs of New York','Cello Itscovitz','Unspecified injury of dorsal vein of unspecified foot, initial encounter',568,'1991','http://dummyimage.com/139x100.png/dddddd/000000',NULL,NULL,4),
	(26,'Donner Party, The','Boothe Poston','Age-related osteoporosis with current pathological fracture, left hand, sequela',409,'2011','http://dummyimage.com/250x100.png/ff4444/ffffff',NULL,NULL,1),
	(27,'Prisoner of the Mountains (Kavkazsky plennik)','Page Rozzier','Other specified retinal disorders',1892,'1993','http://dummyimage.com/250x100.png/cc0000/ffffff',NULL,NULL,1),
	(28,'Faraway, So Close (In weiter Ferne, so nah!)','Grant Cobley','Unspecified injury of other intra-abdominal organs, initial encounter',709,'1993','http://dummyimage.com/137x100.png/ff4444/ffffff',NULL,NULL,3),
	(29,'What Just Happened','Fifine Spurier','Poisoning by amphetamines, intentional self-harm, subsequent encounter',1813,'2006','http://dummyimage.com/125x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(30,'Noises Off...','Mord Kinchlea','Nondisplaced fracture of cuboid bone of unspecified foot, subsequent encounter for fracture with malunion',2244,'1997','http://dummyimage.com/103x100.png/dddddd/000000',NULL,NULL,4),
	(31,'White Man\'s Burden','Koralle Kirsop','Type 1 diabetes mellitus with proliferative diabetic retinopathy without macular edema, bilateral',1716,'2005','http://dummyimage.com/104x100.png/cc0000/ffffff',NULL,NULL,4),
	(32,'A Fight For','Delbert Gueinn','Other injury of flexor muscle, fascia and tendon of left middle finger at wrist and hand level, subsequent encounter',1517,'1992','http://dummyimage.com/143x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(33,'Page of Madness, A (Kurutta ippêji)','Eric Kettlewell','Spermatocele of epididymis, unspecified',925,'2010','http://dummyimage.com/179x100.png/ff4444/ffffff',NULL,NULL,1),
	(34,'Unfinished Business','Galvin Eames','Nondisplaced spiral fracture of shaft of radius, unspecified arm, subsequent encounter for open fracture type I or II with malunion',1655,'2006','http://dummyimage.com/152x100.png/dddddd/000000',NULL,NULL,3),
	(35,'My Kid Could Paint That','Emelyne Ortas','Attic perforation of tympanic membrane, left ear',2070,'1995','http://dummyimage.com/214x100.png/cc0000/ffffff',NULL,NULL,1),
	(36,'Sweet November','Kasey Warn','Dislocation of L2/L3 lumbar vertebra, subsequent encounter',1842,'2007','http://dummyimage.com/180x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(37,'I Woke Up Early the Day I Died','Tiertza Ericsson','Sprain of deltoid ligament of unspecified ankle, subsequent encounter',310,'2008','http://dummyimage.com/180x100.png/ff4444/ffffff',NULL,NULL,2),
	(38,'Her Alibi','Waylan Aishford','Anterior dislocation of proximal end of tibia, left knee',1373,'1996','http://dummyimage.com/216x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(39,'Crouching Tiger, Hidden Dragon (Wo hu cang long)','Margaux Lighten','Bladder disorders in diseases classified elsewhere',1738,'2004','http://dummyimage.com/122x100.png/dddddd/000000',NULL,NULL,3),
	(40,'Vizontele Tuuba','Thomasin Labern','Nondisplaced bicondylar fracture of unspecified tibia, subsequent encounter for closed fracture with malunion',1667,'2007','http://dummyimage.com/227x100.png/ff4444/ffffff',NULL,NULL,4),
	(41,'Rent-a-Kid','Preston Youthed','Unspecified superficial injuries of left back wall of thorax, sequela',2653,'2001','http://dummyimage.com/185x100.png/dddddd/000000',NULL,NULL,1),
	(42,'Rough Magic','Agosto Richemond','Moderate laceration of liver, initial encounter',497,'2003','http://dummyimage.com/146x100.png/cc0000/ffffff',NULL,NULL,4),
	(43,'Pokémon 3: The Movie','Briney Seaward','Other specified disorders of bone density and structure, forearm',2730,'2002','http://dummyimage.com/205x100.png/dddddd/000000',NULL,NULL,4),
	(44,'Associate, The','Bruce Zuanelli','Pathological fracture in other disease, right ankle, subsequent encounter for fracture with delayed healing',590,'2002','http://dummyimage.com/104x100.png/ff4444/ffffff',NULL,NULL,1),
	(45,'Hansel & Gretel','Nonah Sheraton','Strain of muscle and tendon of long flexor muscle of toe at ankle and foot level, right foot',2261,'1990','http://dummyimage.com/102x100.png/dddddd/000000',NULL,NULL,1),
	(46,'Coming Home (Gui lai)','Bronson Goard','Displaced fracture of medial phalanx of left little finger, subsequent encounter for fracture with nonunion',954,'2007','http://dummyimage.com/113x100.png/cc0000/ffffff',NULL,NULL,1),
	(47,'Six of a Kind','Nesta Allport','Poisoning by immunoglobulin, accidental (unintentional)',2109,'1998','http://dummyimage.com/179x100.png/ff4444/ffffff',NULL,NULL,4),
	(48,'Buttcrack','Creight Lindermann','Major laceration of celiac artery, initial encounter',2391,'2000','http://dummyimage.com/170x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(49,'Necessary Roughness','Michael Stanlike','Inferior subluxation of right humerus, sequela',1092,'2012','http://dummyimage.com/226x100.png/ff4444/ffffff',NULL,NULL,3),
	(50,'Something of Value','Lamond Abbess','Puncture wound with foreign body of lip, subsequent encounter',689,'1993','http://dummyimage.com/106x100.png/dddddd/000000',NULL,NULL,4),
	(51,'Eyewitness (Janitor, The)','Maxie Benedito','Contusion of right great toe with damage to nail, sequela',1136,'2011','http://dummyimage.com/150x100.png/ff4444/ffffff',NULL,NULL,2),
	(52,'New Kids Turbo','Valene Dandie','Acute erythroid leukemia, in relapse',2268,'1999','http://dummyimage.com/185x100.png/dddddd/000000',NULL,NULL,3),
	(53,'I Don\'t Want to Be a Man (Ich möchte kein Mann sein)','Torrance Lyard','Irregular astigmatism, unspecified eye',2910,'1994','http://dummyimage.com/148x100.png/cc0000/ffffff',NULL,NULL,2),
	(54,'Letters to God','Rip Ensten','Displaced intertrochanteric fracture of unspecified femur, subsequent encounter for closed fracture with routine healing',841,'2006','http://dummyimage.com/163x100.png/dddddd/000000',NULL,NULL,4),
	(55,'Bill Burr: I\'m Sorry You Feel That Way','Cyrillus Schiefersten','Unspecified bus occupant injured in collision with other motor vehicles in nontraffic accident, subsequent encounter',1207,'1970','http://dummyimage.com/109x100.png/dddddd/000000',NULL,NULL,1),
	(56,'Death Before Dishonor','Darbee Fisby','Rheumatoid lung disease with rheumatoid arthritis of right shoulder',886,'1995','http://dummyimage.com/228x100.png/ff4444/ffffff',NULL,NULL,1),
	(57,'Sleepless Night (Nuit blanche)','Silvain Vize','Chronic petrositis, right ear',946,'2009','http://dummyimage.com/188x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(58,'Bank Job, The','Xymenes Fowden','Other cysts of jaw',930,'2009','http://dummyimage.com/159x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(59,'Orchestra Wives','Idaline Mathwen','Other osteoporosis with current pathological fracture, unspecified ankle and foot, subsequent encounter for fracture with malunion',1078,'1998','http://dummyimage.com/148x100.png/dddddd/000000',NULL,NULL,2),
	(60,'Chill','Eadmund Yegorchenkov','Coxa magna, left hip',410,'2012','http://dummyimage.com/190x100.png/dddddd/000000',NULL,NULL,2),
	(61,'End of Days','Clementine Bacchus','Displaced oblique fracture of shaft of left fibula, initial encounter for open fracture type I or II',1144,'1989','http://dummyimage.com/175x100.png/dddddd/000000',NULL,NULL,1),
	(62,'The Adventures of Tartu','Lev Blue','Subluxation of T7/T8 thoracic vertebra, initial encounter',1859,'2004','http://dummyimage.com/135x100.png/ff4444/ffffff',NULL,NULL,4),
	(63,'Locals, The','Lynsey Meigh','Abrasion of right ring finger',1890,'2000','http://dummyimage.com/193x100.png/dddddd/000000',NULL,NULL,4),
	(64,'Bird on a Wire','Jethro MacAindreis','Staphylococcal scalded skin syndrome',1156,'1988','http://dummyimage.com/105x100.png/ff4444/ffffff',NULL,NULL,2),
	(65,'Addams Family, The','Giralda Pidwell','Poisoning by, adverse effect of and underdosing of other opioids',1570,'2011','http://dummyimage.com/202x100.png/ff4444/ffffff',NULL,NULL,3),
	(66,'Villain, The (Ek Villain)','Zuzana Clemenzi','Nondisplaced fracture of body of hamate [unciform] bone, left wrist, subsequent encounter for fracture with nonunion',1751,'1994','http://dummyimage.com/103x100.png/cc0000/ffffff',NULL,NULL,1),
	(67,'Modern Problems','Stan Thoms','Nondisplaced comminuted fracture of shaft of ulna, left arm, initial encounter for closed fracture',1968,'2009','http://dummyimage.com/144x100.png/dddddd/000000',NULL,NULL,3),
	(68,'State Affairs (Une affaire d\'état)','Lelah Olczyk','Degeneration of chamber angle, unspecified eye',1599,'1995','http://dummyimage.com/201x100.png/cc0000/ffffff',NULL,NULL,3),
	(69,'Sliding Doors','Janelle Roseby','Coma',2232,'2009','http://dummyimage.com/212x100.png/ff4444/ffffff',NULL,NULL,2),
	(70,'Prefab People, The (Panelkapcsolat)','Onida Coye','Other fracture of head and neck of left femur',1909,'2005','http://dummyimage.com/160x100.png/dddddd/000000',NULL,NULL,1),
	(71,'Yrrol: An Enormously Well Thought Out Movie (Yrrol - en kolossalt genomtänkt film)','Malissia Flecknell','Salter-Harris Type II physeal fracture of lower end of ulna, unspecified arm, initial encounter for closed fracture',1464,'2011','http://dummyimage.com/173x100.png/cc0000/ffffff',NULL,NULL,3),
	(72,'Dark Side of the Heart, The (Lado oscuro del corazón, El)','Denni Gidney','War operations involving rubber bullets, military personnel, subsequent encounter',986,'1999','http://dummyimage.com/172x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(73,'Bandit Queen','Birdie Braidley','Late congenital syphilitic polyneuropathy',2033,'1997','http://dummyimage.com/228x100.png/cc0000/ffffff',NULL,NULL,3),
	(74,'The Corsican Brothers','Sylvester Gawkes','Malar fracture, left side',916,'2007','http://dummyimage.com/104x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(75,'Killer (Bulletproof Heart)','Wyatt Heffernon','Occupant of animal-drawn vehicle injured in collision with other nonmotor vehicles, sequela',2722,'2012','http://dummyimage.com/195x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(76,'Reckoning, The','Alisun Philott','Nondisplaced fracture of neck of fifth metacarpal bone, right hand, subsequent encounter for fracture with routine healing',2787,'2009','http://dummyimage.com/166x100.png/dddddd/000000',NULL,NULL,2),
	(77,'Treasure Island','Jennie Deporte','Other physeal fracture of upper end of humerus, left arm, subsequent encounter for fracture with routine healing',500,'2009','http://dummyimage.com/104x100.png/cc0000/ffffff',NULL,NULL,3),
	(78,'FernGully 2: The Magical Rescue','Magdalene Liggett','Early syphilis, unspecified',1057,'2002','http://dummyimage.com/186x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(79,'The Roots of Heaven','Astra Maginot','Other fracture of left ilium, subsequent encounter for fracture with delayed healing',1746,'2007','http://dummyimage.com/249x100.png/ff4444/ffffff',NULL,NULL,3),
	(80,'Housefull 2','Darcee Leppard','Acquired absence of right wrist',2902,'2008','http://dummyimage.com/127x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(81,'Basketball Diaries, The','Thornie Alvin','Other benign mammary dysplasias of left breast',839,'2011','http://dummyimage.com/171x100.png/cc0000/ffffff',NULL,NULL,4),
	(82,'Love and Lemons (Små citroner gula)','Juditha Belcham','Blepharochalasis right eye, unspecified eyelid',1598,'2000','http://dummyimage.com/181x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(83,'I\'m Gonna Explode (a.k.a. I\'m Going to Explode) (Voy a explotar)','Sherwynd Hawthorn','Other specified injury of axillary or brachial vein, left side',1429,'2004','http://dummyimage.com/245x100.png/cc0000/ffffff',NULL,NULL,2),
	(84,'Nomad (Köshpendiler)','Herta Lintot','Fracture of unspecified part of body of mandible, unspecified side, subsequent encounter for fracture with nonunion',1814,'1986','http://dummyimage.com/144x100.png/ff4444/ffffff',NULL,NULL,2),
	(85,'Jekyll','Rona Palethorpe','Unspecified dislocation of right ring finger',1813,'1993','http://dummyimage.com/243x100.png/ff4444/ffffff',NULL,NULL,3),
	(86,'Eddie','Devonne Ferretti','Drowning and submersion due to falling or jumping from crushed sailboat, initial encounter',1611,'2008','http://dummyimage.com/116x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(87,'Fourth Angel, The','Ofelia Rookeby','Nondisplaced comminuted fracture of shaft of left fibula, initial encounter for closed fracture',1761,'1992','http://dummyimage.com/173x100.png/dddddd/000000',NULL,NULL,3),
	(88,'Super Cops, The','Kaila Doale','Toxic effect of sulfur dioxide',1471,'2001','http://dummyimage.com/178x100.png/dddddd/000000',NULL,NULL,1),
	(89,'Looking for Hortense (Cherchez Hortense) ','Bevan Zima','Puncture wound with foreign body of unspecified back wall of thorax with penetration into thoracic cavity, subsequent encounter',1773,'2000','http://dummyimage.com/245x100.png/dddddd/000000',NULL,NULL,3),
	(90,'I Capture the Castle','Ewart Terrell','Nondisplaced spiral fracture of shaft of unspecified tibia, subsequent encounter for open fracture type I or II with nonunion',695,'1992','http://dummyimage.com/213x100.png/ff4444/ffffff',NULL,NULL,1),
	(91,'Humboldt County','Irena Thundercliffe','Subluxation of metacarpophalangeal joint of left ring finger, sequela',908,'2000','http://dummyimage.com/158x100.png/dddddd/000000',NULL,NULL,2),
	(92,'Next Three Days, The','Lauritz Brosh','Partial traumatic amputation of left forearm, level unspecified, sequela',1957,'2008','http://dummyimage.com/140x100.png/cc0000/ffffff',NULL,NULL,4),
	(93,'Clara and Me (Clara et moi)','Selena Mobley','Unspecified physeal fracture of unspecified metatarsal, subsequent encounter for fracture with nonunion',2060,'2011','http://dummyimage.com/165x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(94,'Mistress America','Evanne Simanenko','Sprain of metacarpophalangeal joint of right ring finger, sequela',1693,'2003','http://dummyimage.com/174x100.png/dddddd/000000',NULL,NULL,4),
	(95,'Dragonlance: Dragons of Autumn Twilight','Pierce Jansens','Salter-Harris Type II physeal fracture of lower end of ulna, right arm, subsequent encounter for fracture with nonunion',499,'2011','http://dummyimage.com/228x100.png/dddddd/000000',NULL,NULL,3),
	(96,'The Fuller Brush Girl','Cahra Bradnam','Type 2 diabetes mellitus with mild nonproliferative diabetic retinopathy without macular edema, bilateral',1157,'2000','http://dummyimage.com/222x100.png/dddddd/000000',NULL,NULL,2),
	(97,'KM 31: Kilometro 31','Malia Heibl','Other specified injury of greater saphenous vein at lower leg level, unspecified leg, subsequent encounter',2736,'2004','http://dummyimage.com/227x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(98,'Hound of the Baskervilles, The','Georgie Battershall','Refsum\'s disease',2835,'2002','http://dummyimage.com/231x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(99,'Deep Water','Chad Stiddard','Stable burst fracture of first lumbar vertebra, sequela',1936,'2010','http://dummyimage.com/231x100.png/ff4444/ffffff',NULL,NULL,1),
	(100,'Event Horizon','Janey Nance','Burns involving 90% or more of body surface with 20-29% third degree burns',473,'2006','http://dummyimage.com/231x100.png/ff4444/ffffff',NULL,NULL,1),
	(101,'Autopsy','Cecilius Maidstone','Occupant of streetcar injured by fall in streetcar, initial encounter',2641,'2002','http://dummyimage.com/228x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(102,'Somm','Susy Ilyin','Other mechanical complication of other internal joint prosthesis',1583,'2010','http://dummyimage.com/244x100.png/dddddd/000000',NULL,NULL,3),
	(103,'Evan Almighty','Dorthy Paolinelli','Chronic gout due to renal impairment, right shoulder, without tophus (tophi)',441,'2008','http://dummyimage.com/154x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(104,'Hellraiser: Hellworld','Jaine Austwick','Other osteoporosis with current pathological fracture, right shoulder, sequela',1045,'1988','http://dummyimage.com/218x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(105,'Dragon Ball Z: Battle of Gods','Charleen Newick','Sprain of unspecified parts of lumbar spine and pelvis, subsequent encounter',1514,'1996','http://dummyimage.com/135x100.png/ff4444/ffffff',NULL,NULL,3),
	(106,'Tin Toy','Salli Quarrie','Assault by drowning and submersion in natural water',1508,'1977','http://dummyimage.com/244x100.png/ff4444/ffffff',NULL,NULL,1),
	(107,'Man Who Haunted Himself, The','Cacilie Caris','Fall from stairs and steps due to ice and snow, initial encounter',2575,'2006','http://dummyimage.com/218x100.png/dddddd/000000',NULL,NULL,3),
	(108,'Snug as a Bug (U Pana Boga za piecem)','Meyer Ffrench','Laceration with foreign body of right ring finger without damage to nail',1877,'2008','http://dummyimage.com/228x100.png/cc0000/ffffff',NULL,NULL,4),
	(109,'Flat, The','Prisca Dysert','Displaced fracture of neck of scapula, right shoulder, initial encounter for closed fracture',390,'2005','http://dummyimage.com/144x100.png/dddddd/000000',NULL,NULL,2),
	(110,'True Believer','Rabbi Duchatel','Pressure ulcer of left ankle',2617,'1994','http://dummyimage.com/241x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(111,'Sinbad: Legend of the Seven Seas','Christabel Tieman','Chronic embolism and thrombosis of unspecified deep veins of right distal lower extremity',1339,'2008','http://dummyimage.com/190x100.png/cc0000/ffffff',NULL,NULL,3),
	(112,'Breathe In','Aron Schoenrock','Injury of optic tract and pathways',2347,'2002','http://dummyimage.com/201x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(113,'Four Sons','Derry Mowlam','Abscess of breast associated with pregnancy, unspecified trimester',1765,'1987','http://dummyimage.com/109x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(114,'Two Girls and a Guy','Andres Pulbrook','Laceration with foreign body of unspecified lesser toe(s) with damage to nail, initial encounter',1818,'1994','http://dummyimage.com/228x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(115,'What\'s the Matter with Helen?','Kristyn Mathews','Sedative, hypnotic or anxiolytic dependence with other sedative, hypnotic or anxiolytic-induced disorders',602,'2001','http://dummyimage.com/183x100.png/cc0000/ffffff',NULL,NULL,3),
	(116,'Open Season 2','Auberon Breslau','Displaced unspecified condyle fracture of lower end of right femur, subsequent encounter for closed fracture with nonunion',1311,'1994','http://dummyimage.com/230x100.png/cc0000/ffffff',NULL,NULL,2),
	(117,'The Man in the Orange Jacket','Mitchel Blenkhorn','Peroxisomal disorders',2398,'1996','http://dummyimage.com/169x100.png/cc0000/ffffff',NULL,NULL,2),
	(118,'Wonderland','Ira Hamor','Displacement of femoral arterial graft (bypass), subsequent encounter',1044,'1998','http://dummyimage.com/193x100.png/cc0000/ffffff',NULL,NULL,3),
	(119,'Creator','Lucienne Puttock','Terrorism involving other explosions and fragments, civilian injured, initial encounter',569,'2010','http://dummyimage.com/124x100.png/dddddd/000000',NULL,NULL,3),
	(120,'All the Invisible Children','Tabbie Boots','Overexertion from repetitive movements, sequela',514,'2008','http://dummyimage.com/143x100.png/dddddd/000000',NULL,NULL,4),
	(121,'Bopha!','Horatius Ackers','Nondisplaced fracture of coronoid process of unspecified ulna, initial encounter for open fracture type I or II',1308,'1997','http://dummyimage.com/184x100.png/cc0000/ffffff',NULL,NULL,1),
	(122,'Saint of Fort Washington, The','Howie Crush','Puncture wound of abdominal wall without foreign body, unspecified quadrant without penetration into peritoneal cavity, sequela',651,'1990','http://dummyimage.com/173x100.png/cc0000/ffffff',NULL,NULL,2),
	(123,'Heathcliff: The Movie','Alvy Beet','Nondisplaced fracture of base of third metacarpal bone, right hand',688,'1996','http://dummyimage.com/218x100.png/cc0000/ffffff',NULL,NULL,3),
	(124,'Fall of the Republic: The Presidency of Barack H. Obama','Nikoletta Rontsch','Unspecified fracture of lower leg',2134,'1993','http://dummyimage.com/188x100.png/ff4444/ffffff',NULL,NULL,4),
	(125,'Paradise','Adams Fasham','Non-pressure chronic ulcer of back limited to breakdown of skin',2484,'2005','http://dummyimage.com/192x100.png/ff4444/ffffff',NULL,NULL,4),
	(126,'American Loser (Trainwreck: My Life as an Idiot)','Edna Vaggers','Laceration of fallopian tube, unspecified, sequela',819,'1993','http://dummyimage.com/113x100.png/ff4444/ffffff',NULL,NULL,2),
	(127,'Neon Bible, The','Arni Arnout','Acute toxic conjunctivitis, right eye',1842,'2011','http://dummyimage.com/175x100.png/dddddd/000000',NULL,NULL,3),
	(128,'Mutiny on the Bounty','Susy Hughs','Nondisplaced fracture of base of second metacarpal bone, right hand, subsequent encounter for fracture with nonunion',1485,'2005','http://dummyimage.com/227x100.png/dddddd/000000',NULL,NULL,4),
	(129,'Girl with a Pearl Earring','Violette Jellico','Decreased fetal movements, second trimester',860,'1993','http://dummyimage.com/207x100.png/cc0000/ffffff',NULL,NULL,3),
	(130,'Elephant White','Nickolas Bertwistle','Folliculitis ulerythematosa reticulata',1592,'2010','http://dummyimage.com/249x100.png/ff4444/ffffff',NULL,NULL,4),
	(131,'Family Man, The','Ambrosius Seczyk','Unspecified injury of intrinsic muscle, fascia and tendon of left thumb at wrist and hand level, sequela',1280,'2004','http://dummyimage.com/220x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(132,'Tucker: The Man and His Dream','Nero Nurse','Cellulitis of unspecified orbit',2983,'1988','http://dummyimage.com/236x100.png/cc0000/ffffff',NULL,NULL,4),
	(133,'Pieces of April','Gabriell Azema','Poisoning by unspecified antidepressants, intentional self-harm, initial encounter',1652,'2005','http://dummyimage.com/106x100.png/dddddd/000000',NULL,NULL,3),
	(134,'Fort Bliss','Shirleen Shepherd','Displaced fracture of right radial styloid process, sequela',1104,'1993','http://dummyimage.com/219x100.png/cc0000/ffffff',NULL,NULL,4),
	(135,'Farewell to the King','Chris Harder','Abrasion of right front wall of thorax, sequela',393,'2005','http://dummyimage.com/148x100.png/ff4444/ffffff',NULL,NULL,1),
	(136,'Fire Down Below','Laina Shirtcliffe','Tuberculoma of brain and spinal cord',2599,'2011','http://dummyimage.com/129x100.png/cc0000/ffffff',NULL,NULL,1),
	(137,'Monte Carlo','Debbi Mahoney','Hereditary and idiopathic neuropathy',1207,'1993','http://dummyimage.com/213x100.png/cc0000/ffffff',NULL,NULL,3),
	(138,'The Hearse','Marcello Gotobed','Congenital stenosis and stricture of bile ducts',1438,'2010','http://dummyimage.com/141x100.png/dddddd/000000',NULL,NULL,3),
	(139,'Eight Legged Freaks','Grove Damper','Presence of artificial shoulder joint',2431,'2000','http://dummyimage.com/208x100.png/ff4444/ffffff',NULL,NULL,1),
	(140,'Man of Steel','Juliet Reeve','Unspecified occupant of snowmobile injured in nontraffic accident, initial encounter',1640,'1994','http://dummyimage.com/137x100.png/dddddd/000000',NULL,NULL,4),
	(141,'Black Bread (Pa Negre)','Cordie Boutellier','Pathological fracture, left fibula, sequela',1238,'2004','http://dummyimage.com/158x100.png/dddddd/000000',NULL,NULL,2),
	(142,'I Know What I Saw','Lorinda Baldry','Poisoning by ophthalmological drugs and preparations, assault, subsequent encounter',1372,'1996','http://dummyimage.com/211x100.png/ff4444/ffffff',NULL,NULL,2),
	(143,'I Travel Alone','Ashlin Gipson','Crushing injury of right little finger, sequela',844,'1986','http://dummyimage.com/247x100.png/dddddd/000000',NULL,NULL,1),
	(144,'The Hearts of Age','Pietro England','Maternal care for disproportion due to hydrocephalic fetus, fetus 3',890,'1998','http://dummyimage.com/160x100.png/dddddd/000000',NULL,NULL,2),
	(145,'Raincoat','Izabel Semor','Transient synovitis, right ankle and foot',1848,'1992','http://dummyimage.com/152x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(146,'Bright Young Things','Yvon Levensky','Other contact with turkey, subsequent encounter',1281,'2000','http://dummyimage.com/123x100.png/cc0000/ffffff',NULL,NULL,4),
	(147,'Jack and Diane','Marin Salmons','Other displaced fracture of sixth cervical vertebra, initial encounter for closed fracture',2936,'2004','http://dummyimage.com/197x100.png/cc0000/ffffff',NULL,NULL,3),
	(148,'Smooth Talk','Cloris Baiyle','Bronchiectasis, uncomplicated',582,'1994','http://dummyimage.com/107x100.png/ff4444/ffffff',NULL,NULL,4),
	(149,'Jacknife','Drugi Bamlett','Poisoning by rifampicins, assault, subsequent encounter',1780,'1993','http://dummyimage.com/243x100.png/dddddd/000000',NULL,NULL,1),
	(150,'Home Movie','Carny Leworthy','Displaced transcondylar fracture of left humerus, subsequent encounter for fracture with routine healing',448,'2001','http://dummyimage.com/227x100.png/cc0000/ffffff',NULL,NULL,1),
	(151,'Get to Know Your Rabbit','Beverley Scimone','Displaced comminuted fracture of shaft of radius, unspecified arm, subsequent encounter for closed fracture with nonunion',929,'2006','http://dummyimage.com/240x100.png/ff4444/ffffff',NULL,NULL,1),
	(152,'Curse of the Werewolf, The','Caritta Guare','Unspecified injury of wrist, hand and finger(s)',855,'2000','http://dummyimage.com/241x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(153,'Rudolph the Red-Nosed Reindeer: The Movie','Arlinda Sposito','Nondisplaced fracture of proximal third of navicular [scaphoid] bone of right wrist, initial encounter for closed fracture',2925,'1994','http://dummyimage.com/108x100.png/ff4444/ffffff',NULL,NULL,2),
	(154,'Oranges','Tabbie Gianulli','Open bite, left foot, subsequent encounter',2604,'2012','http://dummyimage.com/178x100.png/cc0000/ffffff',NULL,NULL,2),
	(155,'The Forbidden Room','Brendan Elgy','Abrasion, unspecified hip, subsequent encounter',1695,'1999','http://dummyimage.com/170x100.png/cc0000/ffffff',NULL,NULL,2),
	(156,'We Are Young. We Are Strong.','Jory Elcomb','Poisoning by tetracyclic antidepressants, undetermined, initial encounter',2380,'2008','http://dummyimage.com/101x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(157,'Ciao Bella','Tobe Duligall','Diffuse traumatic brain injury with loss of consciousness of 6 hours to 24 hours, sequela',1282,'1992','http://dummyimage.com/184x100.png/ff4444/ffffff',NULL,NULL,2),
	(158,'Queen: Days of Our Lives','Tandy Sebley','Driver of three-wheeled motor vehicle injured in collision with other motor vehicles in traffic accident, sequela',1726,'1995','http://dummyimage.com/150x100.png/dddddd/000000',NULL,NULL,4),
	(159,'Here Comes the Groom','Ellynn Banfill','Abrasion of left hand',2873,'2003','http://dummyimage.com/135x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(160,'Faces of Schlock','Nicola Boyack','Unspecified ultralight, microlight or powered-glider accident injuring occupant, initial encounter',2099,'2003','http://dummyimage.com/111x100.png/dddddd/000000',NULL,NULL,4),
	(161,'I Want to Be a Soldier','Leah Hardiker','Old laceration of cervix uteri',1005,'1988','http://dummyimage.com/138x100.png/5fa2dd/ffffff',NULL,NULL,2),
	(162,'Brass Monkey','Jefferey Wingate','Unspecified injury of right kidney, sequela',2866,'2010','http://dummyimage.com/108x100.png/cc0000/ffffff',NULL,NULL,3),
	(163,'Dragon ball Z 04: Lord Slug','Riane Songhurst','Other fracture of left lower leg, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion',2821,'2007','http://dummyimage.com/154x100.png/dddddd/000000',NULL,NULL,4),
	(164,'Shoot the Piano Player (Tirez sur le pianiste)','Alissa Louw','Radiographic dye allergy status',426,'1995','http://dummyimage.com/180x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(165,'Hammer of the Gods','Tamma Vaillant','Anogenital herpesviral infection, unspecified',2797,'2004','http://dummyimage.com/247x100.png/ff4444/ffffff',NULL,NULL,4),
	(166,'Fog of War: Eleven Lessons from the Life of Robert S. McNamara, The','Gina Brognot','Pressure ulcer of right lower back, unspecified stage',1558,'1997','http://dummyimage.com/233x100.png/ff4444/ffffff',NULL,NULL,1),
	(167,'Connie and Carla','Merrel Dimitrescu','Frostbite with tissue necrosis of wrist, hand, and finger(s)',803,'2004','http://dummyimage.com/223x100.png/ff4444/ffffff',NULL,NULL,1),
	(168,'Hustler, The','Ally Coye','Car driver injured in collision with pedal cycle in nontraffic accident, subsequent encounter',2419,'2008','http://dummyimage.com/187x100.png/dddddd/000000',NULL,NULL,2),
	(169,'Ice Princess','Elsworth Bromehead','Displaced fracture of pisiform, left wrist, initial encounter for open fracture',320,'2010','http://dummyimage.com/134x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(170,'Read My Lips (Sur mes lèvres)','Sadye Paffley','Superficial foreign body of vagina and vulva',2688,'2005','http://dummyimage.com/205x100.png/cc0000/ffffff',NULL,NULL,2),
	(171,'House Is Black, The','Anatol Conichie','Sprain of radiocarpal joint of left wrist, sequela',1157,'2011','http://dummyimage.com/133x100.png/dddddd/000000',NULL,NULL,4),
	(172,'Barren Lives (Vidas Secas)','Opaline Bellas','Unspecified pre-existing diabetes mellitus in pregnancy, first trimester',1541,'1996','http://dummyimage.com/132x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(173,'First Power, The','Stoddard Kolodziej','22 weeks gestation of pregnancy',2269,'1998','http://dummyimage.com/194x100.png/dddddd/000000',NULL,NULL,3),
	(174,'Pusher','Waylon Lodge','Displaced fracture of epiphysis (separation) (upper) of left femur, subsequent encounter for open fracture type I or II with malunion',973,'2012','http://dummyimage.com/186x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(175,'Black Room, The','Esta Kienl','Struck by dolphin, sequela',2865,'1990','http://dummyimage.com/176x100.png/ff4444/ffffff',NULL,NULL,3),
	(176,'Prairie Fever','Maddy Eastcott','Diverticulitis of intestine, part unspecified, with perforation and abscess without bleeding',1387,'2007','http://dummyimage.com/150x100.png/dddddd/000000',NULL,NULL,4),
	(177,'Reno 911!: Miami','Corbet Massingberd','Laceration without foreign body of right front wall of thorax without penetration into thoracic cavity, sequela',2251,'2006','http://dummyimage.com/101x100.png/5fa2dd/ffffff',NULL,NULL,1),
	(178,'Sleeping Beauty, The (La belle endormie)','Jasmine Challenger','Other specified congenital malformations of female genitalia',2489,'2008','http://dummyimage.com/228x100.png/cc0000/ffffff',NULL,NULL,2),
	(179,'Switching Goals','Ethelbert Tacker','Unspecified fracture of lower end of unspecified ulna, subsequent encounter for closed fracture with malunion',2481,'2012','http://dummyimage.com/101x100.png/cc0000/ffffff',NULL,NULL,4),
	(180,'Magic & Bird: A Courtship of Rivals','Stavro Laurenzi','Degeneration of pupillary margin, unspecified eye',2578,'2002','http://dummyimage.com/187x100.png/ff4444/ffffff',NULL,NULL,3),
	(181,'Confessional, The (Confessionnal, Le)','Hyatt Gutman','Struck by turkey, subsequent encounter',1440,'1984','http://dummyimage.com/164x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(182,'Barbarian Invasions, The (Les invasions barbares)','Randi McRae','Fracture of base of skull, right side, sequela',552,'1997','http://dummyimage.com/237x100.png/ff4444/ffffff',NULL,NULL,2),
	(183,'Murder Party','Estel McCarron','Nondisplaced fracture of olecranon process without intraarticular extension of right ulna, subsequent encounter for open fracture type I or II with malunion',2636,'1996','http://dummyimage.com/235x100.png/dddddd/000000',NULL,NULL,2),
	(184,'Trap: What Happened to Our Dream of Freedom, The','Carmela Tours','Unspecified maternal infectious and parasitic disease complicating childbirth',1978,'2003','http://dummyimage.com/209x100.png/dddddd/000000',NULL,NULL,1),
	(185,'Images of the World and the Inscription of War (Bilder der Welt und Inschrift des Krieges)','Maggi Mullin','Laceration of unspecified blood vessel at lower leg level',1046,'2004','http://dummyimage.com/144x100.png/cc0000/ffffff',NULL,NULL,1),
	(186,'Keeping the Promise (Sign of the Beaver, The)','Hermia Pensom','Laceration of peroneal artery, unspecified leg',1460,'2011','http://dummyimage.com/151x100.png/cc0000/ffffff',NULL,NULL,3),
	(187,'Science and Islam','Caitrin Botham','Nondisplaced fracture of third metatarsal bone, right foot, initial encounter for open fracture',812,'2006','http://dummyimage.com/165x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(188,'Fuck You, Goethe (Fack Ju Göhte)','Chas Trunkfield','Hereditary optic atrophy',2415,'2003','http://dummyimage.com/180x100.png/ff4444/ffffff',NULL,NULL,2),
	(189,'Dark of the Sun','Anallese Ovill','Exposure to ignition of plastic jewelry, initial encounter',593,'1986','http://dummyimage.com/166x100.png/5fa2dd/ffffff',NULL,NULL,4),
	(190,'Dylan Dog: Dead of Night','Kristoforo Ambrogio','Blister (nonthermal) of left ear, initial encounter',1167,'2010','http://dummyimage.com/182x100.png/cc0000/ffffff',NULL,NULL,1),
	(191,'Lost Missile, The','Reyna McKeller','Occupant of animal-drawn vehicle injured in collision with other animal-drawn vehicle',2979,'2010','http://dummyimage.com/228x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(192,'Sacrifice, The (Offret - Sacraficatio)','Agustin Roman','Injury of other nerves at wrist and hand level of right arm, sequela',2277,'2009','http://dummyimage.com/125x100.png/cc0000/ffffff',NULL,NULL,1),
	(193,'Like Father, Like Son','Carley Ivers','Other symptoms and signs involving cognitive functions following nontraumatic intracerebral hemorrhage',1775,'1996','http://dummyimage.com/241x100.png/dddddd/000000',NULL,NULL,4),
	(194,'Looking for Eric','Georgina Hessel','Burn of unspecified degree of unspecified multiple fingers (nail), including thumb, subsequent encounter',2976,'1992','http://dummyimage.com/107x100.png/cc0000/ffffff',NULL,NULL,1),
	(195,'Out of the Blue','Thaddeus Poxton','Unspecified traumatic displaced spondylolisthesis of second cervical vertebra, initial encounter for open fracture',1157,'2009','http://dummyimage.com/248x100.png/dddddd/000000',NULL,NULL,4),
	(196,'Walk to Remember, A','Marita Morrow','Severe combined immunodeficiency [SCID] with low T- and B-cell numbers',2926,'2012','http://dummyimage.com/101x100.png/dddddd/000000',NULL,NULL,3),
	(197,'Performance','Fran Liptrod','Contact with other commercial machinery, sequela',773,'1992','http://dummyimage.com/173x100.png/5fa2dd/ffffff',NULL,NULL,3),
	(198,'Toy Story Toons: Small Fry','Gaston Aiken','Open bite of unspecified buttock',2205,'2009','http://dummyimage.com/190x100.png/ff4444/ffffff',NULL,NULL,4),
	(199,'Mission Bloody Mary','Khalil Thewless','Cyclical vomiting, not intractable',2527,'2001','http://dummyimage.com/120x100.png/ff4444/ffffff',NULL,NULL,3),
	(200,'Mesrine: Public Enemy #1 (L\'ennemi public n°1)','Waldo McSharry','Other physeal fracture of right calcaneus, subsequent encounter for fracture with routine healing',631,'2009','http://dummyimage.com/172x100.png/dddddd/000000',NULL,NULL,2);

/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table genres
# ------------------------------------------------------------

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Thriller',NULL,NULL),
	(2,'Romance',NULL,NULL),
	(3,'Historical',NULL,NULL),
	(4,'Non-Fiction',NULL,NULL);

/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(6,'2014_10_12_000000_create_users_table',1),
	(7,'2014_10_12_100000_create_password_reset_tokens_table',1),
	(8,'2019_08_19_000000_create_failed_jobs_table',1),
	(9,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(10,'2023_12_08_110520_create_books_table',1),
	(11,'2023_12_08_121855_create_genres_table',2),
	(12,'2023_12_08_122420_add_genre_column_to_books_table',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
