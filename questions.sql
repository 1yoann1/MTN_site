-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 04 nov. 2024 à 15:06
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nom_de_la_base_de_donnees`
--

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` int(6) NOT NULL,
  `questions_no` int(5) NOT NULL,
  `question` text NOT NULL,
  `opt1` varchar(255) NOT NULL,
  `opt2` varchar(255) NOT NULL,
  `opt3` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `questions_no`, `question`, `opt1`, `opt2`, `opt3`, `answer`, `category`) VALUES
(1, 1, 'Qu\'est-ce que le phishing?', 'Un type de cyberattaque.', 'Un type de poisson.', 'Un virus informatique.', 'Un type de cyberattaque.', 'Sécurité'),
(2, 2, 'Qu\'est-ce qu\'un ransomware?', 'Un logiciel malveillant.', 'Un logiciel antivirus.', 'Une mise à jour de sécurité.', 'Un logiciel malveillant.', 'Sécurité'),
(3, 3, 'Comment sécuriser ses appareils mobiles ?', ' Évitez d\'utiliser un mot de passe.', 'Installez régulièrement les mises à jour de sécurité et utilisez un code PIN ou une empreinte digitale.', 'Charger régulièrement ses appareils mobiles.', 'Installez régulièrement les mises à jour de sécurité et utilisez un code PIN ou une empreinte digitale.', 'sécurité'),
(4, 4, 'Comment protéger vos informations sur les services de cloud ?', 'Utilisez l\'authentification à deux facteurs pour un accès plus sécurisé.', 'N\'utilisez jamais de mot de passe.', 'Se connecter à l\'aide d\'un cable réseau.', 'Utilisez l\'authentification à deux facteurs pour un accès plus sécurisé.', 'sécurité'),
(5, 5, 'Quel est le mot de passe le plus sécurisé ?', 'Arme115.', 'Em@}+5&,!|.', 'MTNPassword2024.', 'Em@}+5&,!|.', 'sécurité'),
(6, 6, 'Comment reconnaître un mail de phishing ?', 'Le mail est envoyé aux heures inhabituelles.', 'Le mail est souvent mal orthographiée ou semble étrange.', 'Le mail parle de phishing.', 'Le mail est souvent mal orthographiée ou semble étrange.', 'sécurité'),
(7, 7, 'Pourquoi est-il important de mettre à jour régulièrement les logiciels ?', 'Pour améliorer la couleur des icônes.', 'Pour corriger les failles de sécurité et améliorer les performances.', 'Pour etre informé des dernières nouvelles.', 'Pour corriger les failles de sécurité et améliorer les performances', 'sécurité'),
(8, 8, 'Quel est le rôle d\'un pare-feu ?', 'Bloquer les connexions réseau non autorisées et potentiellement dangereuses.', 'Faire chauffer l\'ordinateur plus rapidement.', 'Isoler l\'ordinateur en cas d\'incendie.', 'Bloquer les connexions réseau non autorisées et potentiellement dangereuses.', 'sécurité'),
(9, 9, 'Pourquoi est-il risqué de se connecter à des réseaux Wi-Fi publics ?', 'Ils peuvent être des cibles faciles pour les cyberattaques et le vol de données.', 'Parcequ\'ils n\'ont pas de propriétaires.', 'Parcequ\'ils ne sont pas munis de mot de passe.', 'Ils peuvent être des cibles faciles pour les cyberattaques et le vol de données.', 'sécurité'),
(10, 10, 'Quelle est la fonction d\'un antivirus ?', 'Détecter, prévenir et supprimer les logiciels malveillants.', 'Amélioré les performances.', 'Mettre à jour vos logiciels de travail.', 'Détecter, prévenir et supprimer les logiciels malveillants.', 'sécurité'),
(11, 11, 'Que signifie l\'acronyme VPN ?', 'Virtual Private Network, un réseau privé virtuel qui sécurise les connexions Internet.', 'Very Personal Network, un réseau très personnel.', 'Virtual Public Network, un réseau virtuel public.', 'Virtual Private Network, un réseau privé virtuel qui sécurise les connexions Internet.', 'sécurité'),
(12, 12, 'Qu\'est-ce qu\'un cheval de Troie ?', 'Un logiciel malveillant qui se fait passer pour un logiciel légitime', 'Un type de logiciel éducatif.\r\n\r\n', 'Un outil de sécurité.', 'Un logiciel malveillant qui se fait passer pour un logiciel légitime', 'sécurité'),
(13, 13, 'Qu\'est-ce que l\'authentification à deux facteurs (2FA) ?', 'Un processus d\'authentification auprès de deux personnes différentes.', 'Un processus de vérification d\'identité utilisant deux adresses e-mail.', 'Une méthode de sécurité utilisant deux moyens différents pour vérifier l\'identité d\'un utilisateur.', 'Une méthode de sécurité utilisant deux moyens différents pour vérifier l\'identité d\'un utilisateur.', 'sécurité'),
(14, 14, 'Quelle est la fonction d\'un réseau privé virtuel (VPN) ?', 'Crypter les connexions Internet pour protéger les données et l\'anonymat en ligne.', 'Accélérer la vitesse de connexion Internet.', 'Masquer son adresse IP.', 'Crypter les connexions Internet pour protéger les données et l\'anonymat en ligne.\r\n\r\n', 'sécurité'),
(15, 15, 'Que signifie HTTPS ?', 'High-Tech Transfer Protocol System, un système de transfert technologique avancé.', 'HyperText Transfer Protocol Secure, une version sécurisée du protocole HTTP.', 'HyperText Transfer Protection System, système de protection des transferts.', 'HyperText Transfer Protocol Secure, une version sécurisée du protocole HTTP.', 'sécurité');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
