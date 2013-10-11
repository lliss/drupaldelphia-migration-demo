-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: legacy
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.2-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Horror'),(2,'Transcendentalism');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poems`
--

DROP TABLE IF EXISTS `poems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poems` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `genre_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `poem` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poems`
--

LOCK TABLES `poems` WRITE;
/*!40000 ALTER TABLE `poems` DISABLE KEYS */;
INSERT INTO `poems` VALUES (1,1,2,'THE SPHINX','The Sphinx is drowsy,\r\n  Her wings are furled:\r\nHer ear is heavy,\r\n  She broods on the world.\r\n\"Who\'ll tell me my secret,\r\n  The ages have kept?--\r\nI awaited the seer\r\n  While they slumbered and slept:--\r\n\r\n\"The fate of the man-child,\r\n  The meaning of man;\r\nKnown fruit of the unknown;\r\n  Daedalian plan;\r\nOut of sleeping a waking,\r\n  Out of waking a sleep;\r\nLife death overtaking;\r\n  Deep underneath deep?\r\n\r\n\"Erect as a sunbeam,\r\n  Upspringeth the palm;\r\nThe elephant browses,\r\n  Undaunted and calm;\r\nIn beautiful motion\r\n  The thrush plies his wings;\r\nKind leaves of his covert,\r\n  Your silence he sings.\r\n\r\n\"The waves, unashamèd,\r\n  In difference sweet,\r\nPlay glad with the breezes,\r\n  Old playfellows meet;\r\nThe journeying atoms,\r\n  Primordial wholes,\r\nFirmly draw, firmly drive,\r\n  By their animate poles.\r\n\r\n\"Sea, earth, air, sound, silence.\r\n  Plant, quadruped, bird,\r\nBy one music enchanted,\r\n  One deity stirred,--\r\nEach the other adorning,\r\n  Accompany still;\r\nNight veileth the morning,\r\n  The vapor the hill.\r\n\r\n\"The babe by its mother\r\n  Lies bathèd in joy;\r\nGlide its hours uncounted,--\r\n  The sun is its toy;\r\nShines the peace of all being,\r\n  Without cloud, in its eyes;\r\nAnd the sum of the world\r\n  In soft miniature lies.\r\n\r\n\"But man crouches and blushes,\r\n  Absconds and conceals;\r\nHe creepeth and peepeth,\r\n  He palters and steals;\r\nInfirm, melancholy,\r\n  Jealous glancing around,\r\nAn oaf, an accomplice,\r\n  He poisons the ground.\r\n\r\n\"Out spoke the great mother,\r\n  Beholding his fear;--\r\nAt the sound of her accents\r\n  Cold shuddered the sphere:--\r\n\'Who has drugged my boy\'s cup?\r\n  Who has mixed my boy\'s bread?\r\nWho, with sadness and madness,\r\n  Has turned my child\'s head?\'\"\r\n\r\nI heard a poet answer\r\n  Aloud and cheerfully,\r\n\'Say on, sweet Sphinx! thy dirges\r\n  Are pleasant songs to me.\r\nDeep love lieth under\r\n  These pictures of time;\r\nThey fade in the light of\r\n  Their meaning sublime.\r\n\r\n\"The fiend that man harries\r\n  Is love of the Best;\r\nYawns the pit of the Dragon,\r\n  Lit by rays from the Blest.\r\nThe Lethe of Nature\r\n  Can\'t trance him again,\r\nWhose soul sees the perfect,\r\n  Which his eyes seek in vain.\r\n\r\n\"To vision profounder,\r\n  Man\'s spirit must dive;\r\nHis aye-rolling orb\r\n  At no goal will arrive;\r\nThe heavens that now draw him\r\n  With sweetness untold,\r\nOnce found,--for new heavens\r\n  He spurneth the old.\r\n\r\n\"Pride ruined the angels,\r\n  Their shame them restores;\r\nLurks the joy that is sweetest\r\n  In stings of remorse.\r\nHave I a lover\r\n  Who is noble and free?--\r\nI would he were nobler\r\n  Than to love me.\r\n\r\n\"Eterne alternation\r\n  Now follows, now flies;\r\nAnd under pain, pleasure,--\r\n  Under pleasure, pain lies.\r\nLove works at the centre,\r\n  Heart-heaving alway;\r\nForth speed the strong pulses\r\n  To the borders of day.\r\n\r\n\"Dull Sphinx, Jove keep thy five wits;\r\n  Thy sight is growing blear;\r\nRue, myrrh and cummin for the Sphinx,\r\n  Her muddy eyes to clear!\"\r\nThe old Sphinx bit her thick lip,--\r\n  Said, \"Who taught thee me to name?\r\nI am thy spirit, yoke-fellow;\r\n  Of thine eye I am eyebeam.\r\n\r\n\"Thou art the unanswered question;\r\n  Couldst see thy proper eye,\r\nAlway it asketh, asketh;\r\n  And each answer is a lie.\r\nSo take thy quest through nature,\r\n  It through thousand natures ply;\r\nAsk on, thou clothed eternity;\r\n  Time is the false reply.\"\r\n\r\nUprose the merry Sphinx,\r\n  And crouched no more in stone;\r\nShe melted into purple cloud,\r\n  She silvered in the moon;\r\nShe spired into a yellow flame;\r\n  She flowered in blossoms red;\r\nShe flowed into a foaming wave:\r\n  She stood Monadnoc\'s head.\r\n\r\nThorough a thousand voices\r\n  Spoke the universal dame;\r\n\"Who telleth one of my meanings\r\n  Is master of all I am.\"','sphinx.jpg'),(2,3,1,'The Raven','  Once upon a midnight dreary, while I pondered, weak and weary,\r\n  Over many a quaint and curious volume of forgotten lore--\r\n  While I nodded, nearly napping, suddenly there came a tapping,\r\n  As of some one gently rapping, rapping at my chamber door.\r\n  \"\'Tis some visitor,\" I muttered, \"tapping at my chamber door--\r\n                                     Only this and nothing more.\"\r\n\r\n  Ah, distinctly I remember it was in the bleak December,\r\n  And each separate dying ember wrought its ghost upon the floor.\r\n  Eagerly I wished the morrow;--vainly I had sought to borrow\r\n  From my books surcease of sorrow--sorrow for the lost Lenore--\r\n  For the rare and radiant maiden whom the angels name Lenore--\r\n                                     Nameless here for evermore.\r\n\r\n  And the silken sad uncertain rustling of each purple curtain\r\n  Thrilled me--filled me with fantastic terrors never felt before;\r\n  So that now, to still the beating of my heart, I stood repeating\r\n  \"\'Tis some visiter entreating entrance at my chamber door--\r\n  Some late visiter entreating entrance at my chamber door;\r\n                                     This it is and nothing more.\"\r\n\r\n  Presently my soul grew stronger; hesitating then no longer,\r\n  \"Sir,\" said I, \"or Madam, truly your forgiveness I implore;\r\n  But the fact is I was napping, and so gently you came rapping,\r\n  And so faintly you came tapping, tapping at my chamber door,\r\n  That I scarce was sure I heard you\"--here I opened wide the door--\r\n                                     Darkness there and nothing more.\r\n\r\n  Deep into that darkness peering, long I stood there wondering, fearing,\r\n  Doubting, dreaming dreams no mortals ever dared to dream before;\r\n  But the silence was unbroken, and the stillness gave no token,\r\n  And the only word there spoken was the whispered word, \"Lenore?\"\r\n  This I whispered, and an echo murmured back the word, \"Lenore!\"--\r\n                                     Merely this and nothing more.\r\n\r\n  Back into the chamber turning, all my soul within me burning,\r\n  Soon again I heard a tapping something louder than before.\r\n  \"Surely,\" said I, \"surely that is something at my window lattice;\r\n  Let me see, then, what thereat is and this mystery explore--\r\n  Let my heart be still a moment and this mystery explore;--\r\n                                     \'Tis the wind and nothing more.\r\n\r\n  Open here I flung the shutter, when, with many a flirt and flutter,\r\n  In there stepped a stately Raven of the saintly days of yore.\r\n  Not the least obeisance made he; not a minute stopped or stayed he,\r\n  But, with mien of lord or lady, perched above my chamber door--\r\n  Perched upon a bust of Pallas just above my chamber door--\r\n                                     Perched, and sat, and nothing more.\r\n\r\n  Then the ebony bird beguiling my sad fancy into smiling,\r\n  By the grave and stern decorum of the countenance it wore,\r\n  \"Though thy crest be shorn and shaven, thou,\" I said, \"art sure no craven,\r\n  Ghastly grim and ancient Raven wandering from the Nightly shore--\r\n  Tell me what thy lordly name is on the Night\'s Plutonian shore!\"\r\n                                     Quoth the Raven, \"Nevermore.\"\r\n\r\n  Much I marvelled this ungainly fowl to hear discourse so plainly,\r\n  Though its answer little meaning--little relevancy bore;\r\n  For we cannot help agreeing that no living human being\r\n  Ever yet was blessed with seeing bird above his chamber door--\r\n  Bird or beast upon the sculptured bust above his chamber door,\r\n                                     With such name as \"Nevermore.\"\r\n\r\n  But the Raven, sitting lonely on that placid bust, spoke only\r\n  That one word, as if its soul in that one word he did outpour\r\n  Nothing farther then he uttered; not a feather then he fluttered--\r\n  Till I scarcely more than muttered: \"Other friends have flown before--\r\n  On the morrow _he_ will leave me, as my Hopes have flown before.\"\r\n                                     Then the bird said \"Nevermore.\"\r\n\r\n  Startled at the stillness broken by reply so aptly spoken,\r\n  \"Doubtless,\" said I, \"what it utters is its only stock and store,\r\n  Caught from some unhappy master whom unmerciful Disaster\r\n  Followed fast and followed faster till his songs one burden bore--\r\n  Till the dirges of his Hope that melancholy burden bore\r\n                                     Of \'Never--nevermore.\'\"\r\n\r\n  But the Raven still beguiling all my sad soul into smiling,\r\n  Straight I wheeled a cushioned seat in front of bird and bust and door;\r\n  Then, upon the velvet sinking, I betook myself to linking\r\n  Fancy unto fancy, thinking what this ominous bird of yore--\r\n  What this grim, ungainly, ghastly, gaunt, and ominous bird of yore\r\n                                     Meant in croaking \"Nevermore.\"\r\n\r\n  This I sat engaged in guessing, but no syllable expressing\r\n  To the fowl whose fiery eyes now burned into my bosom\'s core;\r\n  This and more I sat divining, with my head at ease reclining\r\n  On the cushion\'s velvet lining that the lamp-light gloated o\'er,\r\n  But whose velvet violet lining with the lamp-light gloating o\'er\r\n                                     _She_ shall press, ah, nevermore!\r\n\r\n  Then, methought, the air grew denser, perfumed from an unseen censer\r\n  Swung by Seraphim whose foot-falls tinkled on the tufted floor.\r\n  \"Wretch,\" I cried, \"thy God hath lent thee--by these angels he hath sent thee\r\n  Respite--respite and nepenthe from thy memories of Lenore!\r\n  Quaff, oh quaff this kind nepenthe and forget this lost Lenore!\"\r\n                                     Quoth the Raven, \"Nevermore.\"\r\n\r\n  \"Prophet!\" said I, \"thing of evil!--prophet still, if bird or devil!--\r\n  Whether Tempter sent, or whether tempest tossed thee here ashore,\r\n  Desolate, yet all undaunted, on this desert land enchanted--\r\n  On this home by Horror haunted--tell me truly, I implore--\r\n  Is there--_is_ there balm in Gilead?--tell me--tell me, I implore!\"\r\n                                     Quoth the Raven, \"Nevermore.\"\r\n\r\n  \"Prophet!\" said I, \"thing of evil!--prophet still, if bird or devil!\r\n  By that Heaven that bends above us--by that God we both adore--\r\n  Tell this soul with sorrow laden if, within the distant Aidenn,\r\n  It shall clasp a sainted maiden whom the angels name Lenore--\r\n  Clasp a rare and radiant maiden whom the angels name Lenore.\"\r\n                                     Quoth the Raven, \"Nevermore.\"\r\n\r\n  \"Be that our sign of parting, bird or fiend!\" I shrieked, upstarting--\r\n  \"Get thee back into the tempest and the Night\'s Plutonian shore!\r\n  Leave no black plume as a token of that lie thy soul has spoken!\r\n  Leave my loneliness unbroken!--quit the bust above my door!\r\n  Take thy beak from out my heart, and take thy form from off my door!\"\r\n                                     Quoth the Raven, \"Nevermore.\"\r\n\r\n  And the Raven, never flitting, still is sitting, still is sitting\r\n  On the pallid bust of Pallas just above my chamber door;\r\n  And his eyes have all the seeming of a demon\'s that is dreaming\r\n  And the lamp-light o\'er him streaming throws his shadows on the floor;\r\n  And my soul from out that shadow that lies floating on the floor\r\n                                     Shall be lifted--nevermore!\r\n','raven.jpg'),(3,2,2,'One\'s-Self I Sing','  One\'s-self I sing, a simple separate person,\r\n  Yet utter the word Democratic, the word En-Masse.\r\n\r\n  Of physiology from top to toe I sing,\r\n  Not physiognomy alone nor brain alone is worthy for the Muse, I say\r\n      the Form complete is worthier far,\r\n  The Female equally with the Male I sing.\r\n\r\n  Of Life immense in passion, pulse, and power,\r\n  Cheerful, for freest action form\'d under the laws divine,\r\n  The Modern Man I sing.','grass.jpg');
/*!40000 ALTER TABLE `poems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ralph Waldo Emerson','emerson.jpg'),(2,'Walt Whitman','whitman.jpg'),(3,'Edgar Allan Poe','poe.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-11  1:18:46
