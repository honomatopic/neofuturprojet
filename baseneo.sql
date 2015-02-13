-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 13 Février 2015 à 11:43
-- Version du serveur :  5.5.39
-- Version de PHP :  5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `baseneo`
--

-- --------------------------------------------------------

--
-- Structure de la table `applicationlogiciel`
--

CREATE TABLE IF NOT EXISTS `applicationlogiciel` (
  `num` smallint(6) NOT NULL,
  `nom` varchar(60) COLLATE big5_bin DEFAULT NULL,
  `description` text COLLATE big5_bin,
  `logo` varchar(100) COLLATE big5_bin DEFAULT NULL,
  `versionlogiciel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `applicationlogiciel_num` smallint(6) NOT NULL,
  `version_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE IF NOT EXISTS `etablissement` (
  `coderne` int(10) unsigned NOT NULL,
  `nom` varchar(60) COLLATE big5_bin DEFAULT NULL,
  `telephone` varchar(12) COLLATE big5_bin DEFAULT NULL,
  `maxinstalls` smallint(6) DEFAULT NULL,
  `clientdepuis` datetime DEFAULT NULL,
  `expirationcontrat` datetime DEFAULT NULL,
  `version_has_systemeexploitation1_version_id` int(11) NOT NULL,
  `version_has_systemeexploitation1_systemeexploitation_id` int(11) NOT NULL,
  `categorie_applicationlogiciel_num` smallint(6) DEFAULT NULL,
  `categorie_version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement_has_systemeexploitation`
--

CREATE TABLE IF NOT EXISTS `etablissement_has_systemeexploitation` (
  `etablissement_coderne` int(10) unsigned NOT NULL,
  `systemeexploitation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

-- --------------------------------------------------------

--
-- Structure de la table `systemeexploitation`
--

CREATE TABLE IF NOT EXISTS `systemeexploitation` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) COLLATE big5_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` varchar(10) COLLATE big5_bin NOT NULL,
  `nom` varchar(45) COLLATE big5_bin DEFAULT NULL,
  `prenom` varchar(45) COLLATE big5_bin DEFAULT NULL,
  `email` varchar(80) COLLATE big5_bin DEFAULT NULL,
  `telephone` varchar(12) COLLATE big5_bin DEFAULT NULL,
  `mobile` varchar(12) COLLATE big5_bin DEFAULT NULL,
  `motpasse` varchar(64) COLLATE big5_bin DEFAULT NULL,
  `statut` varchar(32) COLLATE big5_bin DEFAULT NULL,
  `applicationlogiciel_num` smallint(6) DEFAULT NULL,
  `etablissement_coderne` int(10) unsigned DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `telephone`, `mobile`, `motpasse`, `statut`, `applicationlogiciel_num`, `etablissement_coderne`, `version_id`) VALUES
('0', 'Purpel', 'Diane', 'diane.purpel@ac-versailles.fr', '0102030405', '0608091011', 'telecharger', 'Chef d''etablissement', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `id` int(11) NOT NULL,
  `nom` varchar(80) COLLATE big5_bin DEFAULT NULL,
  `date_sortie` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

-- --------------------------------------------------------

--
-- Structure de la table `version_has_etablissement`
--

CREATE TABLE IF NOT EXISTS `version_has_etablissement` (
  `version_id` int(11) NOT NULL,
  `etablissement_coderne` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

-- --------------------------------------------------------

--
-- Structure de la table `version_has_systemeexploitation1`
--

CREATE TABLE IF NOT EXISTS `version_has_systemeexploitation1` (
  `version_id` int(11) NOT NULL,
  `systemeexploitation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `applicationlogiciel`
--
ALTER TABLE `applicationlogiciel`
 ADD PRIMARY KEY (`num`), ADD KEY `fk_applicationlogiciel_versionlogiciel1` (`versionlogiciel_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
 ADD PRIMARY KEY (`applicationlogiciel_num`,`version_id`), ADD KEY `fk_applicationlogiciel_has_version_applicationlogiciel1` (`applicationlogiciel_num`), ADD KEY `fk_applicationlogiciel_has_version_version1` (`version_id`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
 ADD PRIMARY KEY (`coderne`,`version_has_systemeexploitation1_version_id`,`version_has_systemeexploitation1_systemeexploitation_id`), ADD KEY `fk_etablissement_version_has_systemeexploitation11` (`version_has_systemeexploitation1_version_id`,`version_has_systemeexploitation1_systemeexploitation_id`), ADD KEY `fk_etablissement_categorie1` (`categorie_applicationlogiciel_num`,`categorie_version_id`);

--
-- Index pour la table `etablissement_has_systemeexploitation`
--
ALTER TABLE `etablissement_has_systemeexploitation`
 ADD PRIMARY KEY (`etablissement_coderne`,`systemeexploitation_id`), ADD KEY `fk_etablissement_has_systemeexploitation_etablissement1` (`etablissement_coderne`), ADD KEY `fk_etablissement_has_systemeexploitation_systemeexploitation1` (`systemeexploitation_id`);

--
-- Index pour la table `systemeexploitation`
--
ALTER TABLE `systemeexploitation`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_utilisateur_applicationlogiciel` (`applicationlogiciel_num`), ADD KEY `fk_utilisateur_etablissement1` (`etablissement_coderne`), ADD KEY `fk_utilisateur_version1` (`version_id`);

--
-- Index pour la table `version`
--
ALTER TABLE `version`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `version_has_etablissement`
--
ALTER TABLE `version_has_etablissement`
 ADD PRIMARY KEY (`version_id`,`etablissement_coderne`), ADD KEY `fk_version_has_etablissement_version1` (`version_id`), ADD KEY `fk_version_has_etablissement_etablissement1` (`etablissement_coderne`);

--
-- Index pour la table `version_has_systemeexploitation1`
--
ALTER TABLE `version_has_systemeexploitation1`
 ADD PRIMARY KEY (`version_id`,`systemeexploitation_id`), ADD KEY `fk_version_has_systemeexploitation1_version1` (`version_id`), ADD KEY `fk_version_has_systemeexploitation1_systemeexploitation1` (`systemeexploitation_id`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `applicationlogiciel`
--
ALTER TABLE `applicationlogiciel`
ADD CONSTRAINT `fk_applicationlogiciel_versionlogiciel1` FOREIGN KEY (`versionlogiciel_id`) REFERENCES `version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
ADD CONSTRAINT `fk_applicationlogiciel_has_version_applicationlogiciel1` FOREIGN KEY (`applicationlogiciel_num`) REFERENCES `applicationlogiciel` (`num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_applicationlogiciel_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etablissement`
--
ALTER TABLE `etablissement`
ADD CONSTRAINT `fk_etablissement_categorie1` FOREIGN KEY (`categorie_applicationlogiciel_num`, `categorie_version_id`) REFERENCES `categorie` (`applicationlogiciel_num`, `version_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_etablissement_version_has_systemeexploitation11` FOREIGN KEY (`version_has_systemeexploitation1_version_id`, `version_has_systemeexploitation1_systemeexploitation_id`) REFERENCES `version_has_systemeexploitation1` (`version_id`, `systemeexploitation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etablissement_has_systemeexploitation`
--
ALTER TABLE `etablissement_has_systemeexploitation`
ADD CONSTRAINT `fk_etablissement_has_systemeexploitation_etablissement1` FOREIGN KEY (`etablissement_coderne`) REFERENCES `etablissement` (`coderne`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_etablissement_has_systemeexploitation_systemeexploitation1` FOREIGN KEY (`systemeexploitation_id`) REFERENCES `systemeexploitation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
ADD CONSTRAINT `fk_utilisateur_applicationlogiciel` FOREIGN KEY (`applicationlogiciel_num`) REFERENCES `applicationlogiciel` (`num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_utilisateur_etablissement1` FOREIGN KEY (`etablissement_coderne`) REFERENCES `etablissement` (`coderne`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_utilisateur_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `version_has_etablissement`
--
ALTER TABLE `version_has_etablissement`
ADD CONSTRAINT `fk_version_has_etablissement_etablissement1` FOREIGN KEY (`etablissement_coderne`) REFERENCES `etablissement` (`coderne`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_version_has_etablissement_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `version_has_systemeexploitation1`
--
ALTER TABLE `version_has_systemeexploitation1`
ADD CONSTRAINT `fk_version_has_systemeexploitation1_systemeexploitation1` FOREIGN KEY (`systemeexploitation_id`) REFERENCES `systemeexploitation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_version_has_systemeexploitation1_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
