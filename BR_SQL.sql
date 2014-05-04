SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for antihack_admins
-- ----------------------------
DROP TABLE IF EXISTS `antihack_admins`;
CREATE TABLE `antihack_admins` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `instance` int(11) DEFAULT NULL,
  `playername` varchar(255) DEFAULT NULL,
  `playerID` varchar(255) DEFAULT NULL,
  `adminlevel` int(11) DEFAULT NULL,
  `added` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of antihack_admins
-- ----------------------------

-- ----------------------------
-- Table structure for antihack_bans
-- ----------------------------
DROP TABLE IF EXISTS `antihack_bans`;
CREATE TABLE `antihack_bans` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `playername` varchar(255) DEFAULT NULL,
  `playerID` varchar(255) DEFAULT NULL,
  `banned` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of antihack_bans
-- ----------------------------

-- ----------------------------
-- Table structure for antihack_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `antihack_whitelist`;
CREATE TABLE `antihack_whitelist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `playername` varchar(255) DEFAULT NULL,
  `playerID` varchar(255) DEFAULT NULL,
  `banned` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of antihack_whitelist
-- ----------------------------

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq1_building` (`class_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for character_data
-- ----------------------------
DROP TABLE IF EXISTS `character_data`;
CREATE TABLE `character_data` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT '1000',
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Generation` int(11) NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) NOT NULL DEFAULT '0',
  `distanceFoot` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `currentState` varchar(100) NOT NULL DEFAULT '[]',
  `KillsH` int(11) NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `Classtype` int(11) DEFAULT '0',
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`) USING BTREE,
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`) USING BTREE,
  KEY `PlayerUID` (`PlayerUID`) USING BTREE,
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of character_data
-- ----------------------------

-- ----------------------------
-- Table structure for character_dead
-- ----------------------------
DROP TABLE IF EXISTS `character_dead`;
CREATE TABLE `character_dead` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT '0',
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Generation` int(11) NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) NOT NULL DEFAULT '0',
  `distanceFoot` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `currentState` varchar(100) NOT NULL DEFAULT '[]',
  `KillsH` int(11) NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `Classtype` int(11) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`) USING BTREE,
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`) USING BTREE,
  KEY `PlayerUID` (`PlayerUID`) USING BTREE,
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of character_dead
-- ----------------------------

-- ----------------------------
-- Table structure for character_variables
-- ----------------------------
DROP TABLE IF EXISTS `character_variables`;
CREATE TABLE `character_variables` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `characterID` int(11) DEFAULT NULL,
  `variable_name` varchar(255) DEFAULT NULL,
  `variable_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `characterID` (`characterID`) USING BTREE,
  CONSTRAINT `characterID` FOREIGN KEY (`characterID`) REFERENCES `character_data` (`CharacterID`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of character_variables
-- ----------------------------

-- ----------------------------
-- Table structure for cust_loadout
-- ----------------------------
DROP TABLE IF EXISTS `cust_loadout`;
CREATE TABLE `cust_loadout` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `inventory` varchar(2048) NOT NULL,
  `backpack` varchar(2048) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cust_loadout
-- ----------------------------

-- ----------------------------
-- Table structure for cust_loadout_profile
-- ----------------------------
DROP TABLE IF EXISTS `cust_loadout_profile`;
CREATE TABLE `cust_loadout_profile` (
  `cust_loadout_id` bigint(20) unsigned NOT NULL,
  `unique_id` varchar(128) NOT NULL,
  PRIMARY KEY (`cust_loadout_id`,`unique_id`),
  KEY `fk2_cust_loadout_profile` (`unique_id`) USING BTREE,
  CONSTRAINT `cust_loadout_profile_ibfk_1` FOREIGN KEY (`cust_loadout_id`) REFERENCES `cust_loadout` (`id`),
  CONSTRAINT `cust_loadout_profile_ibfk_2` FOREIGN KEY (`unique_id`) REFERENCES `profile` (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cust_loadout_profile
-- ----------------------------

-- ----------------------------
-- Table structure for global_state
-- ----------------------------
DROP TABLE IF EXISTS `global_state`;
CREATE TABLE `global_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `globalSetting` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of global_state
-- ----------------------------

-- ----------------------------
-- Table structure for instance_building
-- ----------------------------
DROP TABLE IF EXISTS `instance_building`;
CREATE TABLE `instance_building` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `objectUID` bigint(20) DEFAULT NULL,
  `instanceId` int(20) unsigned NOT NULL DEFAULT '1',
  `buildingId` int(1) DEFAULT NULL,
  `worldspace` varchar(70) NOT NULL DEFAULT '[0,[0,0,0]]',
  `inventory` longtext,
  `hitpoints` longtext,
  `characterId` text,
  `squadId` int(11) DEFAULT '0',
  `combination` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of instance_building
-- ----------------------------

-- ----------------------------
-- Table structure for instance_garage
-- ----------------------------
DROP TABLE IF EXISTS `instance_garage`;
CREATE TABLE `instance_garage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buildingUID` bigint(20) DEFAULT NULL,
  `Instance` int(11) NOT NULL,
  `Classname` varchar(50) NOT NULL,
  `Datestamp` datetime NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Inventory` longtext,
  `Hitpoints` varchar(500) DEFAULT '[]',
  `Fuel` double(13,5) DEFAULT '1.00000',
  `Damage` double(13,5) NOT NULL DEFAULT '0.00000',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of instance_garage
-- ----------------------------

-- ----------------------------
-- Table structure for instance_movement
-- ----------------------------
DROP TABLE IF EXISTS `instance_movement`;
CREATE TABLE `instance_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterID` int(11) DEFAULT NULL,
  `instanceID` int(11) DEFAULT NULL,
  `worldSpace` varchar(255) DEFAULT NULL,
  `changedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of instance_movement
-- ----------------------------

-- ----------------------------
-- Table structure for instance_squad
-- ----------------------------
DROP TABLE IF EXISTS `instance_squad`;
CREATE TABLE `instance_squad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `squadId` int(11) DEFAULT NULL,
  `characterId` int(11) DEFAULT NULL,
  `join_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of instance_squad
-- ----------------------------

-- ----------------------------
-- Table structure for instance_state
-- ----------------------------
DROP TABLE IF EXISTS `instance_state`;
CREATE TABLE `instance_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instanceID` int(11) DEFAULT NULL,
  `currentState` varchar(1000) DEFAULT NULL,
  `worldSpace` varchar(255) DEFAULT NULL,
  `quests` varchar(1000) DEFAULT NULL,
  `lastUpdated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of instance_state
-- ----------------------------

-- ----------------------------
-- Table structure for instance_user
-- ----------------------------
DROP TABLE IF EXISTS `instance_user`;
CREATE TABLE `instance_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIP` varchar(30) NOT NULL,
  PRIMARY KEY (`id`,`userIP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of instance_user
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `payload` varchar(1024) NOT NULL,
  `loop_interval` int(10) unsigned NOT NULL DEFAULT '0',
  `start_delay` int(10) unsigned NOT NULL DEFAULT '30',
  `instance_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_message` (`instance_id`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for object_classes
-- ----------------------------
DROP TABLE IF EXISTS `object_classes`;
CREATE TABLE `object_classes` (
  `Classname` varchar(32) NOT NULL DEFAULT '',
  `Chance` varchar(4) NOT NULL DEFAULT '0',
  `MaxNum` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Damage` varchar(20) NOT NULL DEFAULT '0',
  `Type` text NOT NULL,
  PRIMARY KEY (`Classname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for object_data
-- ----------------------------
DROP TABLE IF EXISTS `object_data`;
CREATE TABLE `object_data` (
  `ObjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Instance` int(11) NOT NULL,
  `Classname` varchar(50) DEFAULT NULL,
  `Datestamp` datetime NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Inventory` longtext,
  `Hitpoints` varchar(500) NOT NULL DEFAULT '[]',
  `Fuel` double(13,5) NOT NULL DEFAULT '1.00000',
  `Damage` double(13,5) NOT NULL DEFAULT '0.00000',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ObjectID`),
  UNIQUE KEY `CheckUID` (`ObjectUID`,`Instance`) USING BTREE,
  KEY `ObjectUID` (`ObjectUID`) USING BTREE,
  KEY `Instance` (`Damage`,`Instance`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for object_spawns
-- ----------------------------
DROP TABLE IF EXISTS `object_spawns`;
CREATE TABLE `object_spawns` (
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Classname` varchar(32) DEFAULT NULL,
  `Worldspace` varchar(64) DEFAULT NULL,
  `Inventory` longtext,
  `Hitpoints` varchar(999) NOT NULL DEFAULT '[]',
  `MapID` varchar(255) NOT NULL DEFAULT '',
  `Last_changed` int(10) DEFAULT NULL,
  PRIMARY KEY (`ObjectUID`,`MapID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of object_spawns
-- ----------------------------

-- ----------------------------
-- Table structure for player_data
-- ----------------------------
DROP TABLE IF EXISTS `player_data`;
CREATE TABLE `player_data` (
  `playerID` int(11) NOT NULL DEFAULT '0',
  `playerUID` varchar(45) NOT NULL DEFAULT '0',
  `playerName` varchar(50) NOT NULL DEFAULT 'Null',
  `playerMorality` int(11) NOT NULL DEFAULT '0',
  `playerSex` int(11) NOT NULL DEFAULT '0',
  KEY `playerID` (`playerID`) USING BTREE,
  KEY `playerUID` (`playerUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of player_data
-- ----------------------------

-- ----------------------------
-- Table structure for player_login
-- ----------------------------
DROP TABLE IF EXISTS `player_login`;
CREATE TABLE `player_login` (
  `LoginID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(45) NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `datestamp` datetime NOT NULL,
  `Action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of player_login
-- ----------------------------

-- ----------------------------
-- Table structure for player_variables
-- ----------------------------
DROP TABLE IF EXISTS `player_variables`;
CREATE TABLE `player_variables` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `playerID` varchar(55) DEFAULT NULL,
  `variable_name` varchar(255) DEFAULT NULL,
  `variable_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `playerID` (`playerID`) USING BTREE,
  CONSTRAINT `playerID` FOREIGN KEY (`playerID`) REFERENCES `player_data` (`playerUID`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of player_variables
-- ----------------------------

-- ----------------------------
-- Table structure for quest
-- ----------------------------
DROP TABLE IF EXISTS `quest`;
CREATE TABLE `quest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_name` varchar(255) DEFAULT NULL,
  `quest_content` longtext,
  `quest_turnin` varchar(255) DEFAULT NULL,
  `quest_reward` varchar(255) DEFAULT NULL,
  `quest_instance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of quest
-- ----------------------------

-- ----------------------------
-- Table structure for squad
-- ----------------------------
DROP TABLE IF EXISTS `squad`;
CREATE TABLE `squad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) DEFAULT NULL,
  `squad_name` varchar(255) DEFAULT NULL,
  `squadLeader` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of squad
-- ----------------------------

-- ----------------------------
-- Table structure for squad_rank
-- ----------------------------
DROP TABLE IF EXISTS `squad_rank`;
CREATE TABLE `squad_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `squadId` int(11) DEFAULT NULL,
  `squadPosition` int(11) DEFAULT NULL,
  `squadMember` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of squad_rank
-- ----------------------------

-- ----------------------------
-- Table structure for squad_rank_name
-- ----------------------------
DROP TABLE IF EXISTS `squad_rank_name`;
CREATE TABLE `squad_rank_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rankId` int(11) DEFAULT NULL,
  `rankName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of squad_rank_name
-- ----------------------------
