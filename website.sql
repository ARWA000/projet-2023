-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 05 mai 2024 à 21:16
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `website`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

CREATE TABLE `carte` (
  `id` varchar(100) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `product_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(10) NOT NULL,
  `qty` varchar(2) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 0, 'ARWA AGNAOU', 'www.arwaagnaou1@gmail.com', '0876543212', '');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(30) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `details` varchar(100) NOT NULL,
  `price` varchar(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(2, 'ring women', 'diamond wedding ring', '1000', 'wr1.jpeg', 'wr1(2).jpeg', 'wr1(1).jpeg'),
(4, 'ring women ', 'Certificate : YES Item Weight : 6g Metal Stamp : 925,Sterling Setting Type : Prong Setting Style : C', '1500', 'wr3(1).jpeg', 'wr3.jpeg', 'wr3(2).jpeg'),
(5, 'ring women', 'Classic 14K Black Gold 3.0 Carat Black Diamond', '900', 'wr5(2).jpeg', 'wr5(1).jpeg', 'wr5.jpeg'),
(6, 'ring women', ' Jewelers Silver Rose Gold 1.5  Wedding Engagement  Bridal Ring ', '5000', 'wr2.jpeg', 'wr2(2).jpeg', 'wr2(1).jpeg'),
(7, 'ring women', ' Women&#39;s Letter Ring in Silver and Gold', '500', 'wr4(1).jpeg', 'wr4.jpeg', 'wr4(2).jpeg'),
(8, 'ring men', 'Ring Size: US Size 7(Dia.): 17.3mm/0.68&#34; (Approx.) US Size 8(Dia.): 18.1mm/0.71&#34;', '500', 'R4M.jpeg', 'R4M2.jpeg', 'R4M1.jpeg'),
(9, 'ring men 1', 'Men Black Onyx Sterling Sliver Ring', '700', 'R5M2.jpeg', 'R5M1.jpeg', 'R5M.jpeg'),
(10, 'ring men 2', ' Red Agate Brutalist Silver Ring, Top Quality Fashionable, Handmade Men Jewelry,Solid 925 Sterling S', '600', 'R2M2.jpeg', 'R2M1.jpeg', 'R2M.jpeg'),
(11, 'ring men 3', 'Men Square Rhinestone Carved Maple Leaf Band Titanium Steel Ring Jewelry Gift', '700', 'R3M.jpeg', 'R3M2.jpeg', 'R3M1.jpeg'),
(12, 'watch men', '10 Panda-Dial Chronographs That Aren&#39;t the Rolex Paul Newman Daytona', '9000', 'W1M.jpeg', 'W1M2.jpeg', 'W1M1.jpeg'),
(13, 'watch men 1', 'Mens Watches BY BENYAR Chronograph Analog Quartz Movement Leather Band Stylish Sports Designer', '7000', 'W2M.jpeg', 'W2M2.jpeg', 'W2M1.jpeg'),
(14, 'watch men 2', 'MEGALITH Mens Watches Stainless Steel Waterproof Analog Quartz Fashion Business Chronograph ', '9500', 'W3M.jpeg', 'W3M2.jpeg', 'W3M1.jpeg'),
(15, 'watch men 3', 'Maserati Men&#39;s Corsa R8871610002 Black Rubber Analog Quartz Sport Watch', '600', 'W4M.jpeg', 'W4M2.jpeg', 'W4M1.jpeg'),
(16, 'watch women', ' the Lady-Datejust watch in Oystersteel and Everose gold', '14000', 'W1W.jpeg', 'W1W2.jpeg', 'W1W1.jpeg'),
(17, 'watch women 1', 'Anne Klein Women&#39;s AK/2158GNRG Rose Gold-Tone Bracelet Watch', '46', 'W2W.jpeg', 'W2W2.jpeg', 'W2W1.jpeg'),
(18, 'watch women 2', 'Guess W1156L2 Women&#39;s Gold Gold Dial With Crystals Watch', '9000', 'W3W.jpeg', 'W3W2.jpeg', 'W3W1.jpeg'),
(19, 'earrings ', 'gold earrings', '150', 'E1.jpeg', 'E12.jpeg', 'E11.jpeg'),
(20, 'earrings 1', 'Fallon&#39;s exquisitely crafted jewelery always exudes a timeless, yet feminine feel. These interlo', '400', 'E21.jpeg', 'E22.jpeg', 'E2.jpeg'),
(21, 'earrings 2', '18K white gold Akoya pearl and diamond earrings featuring two 5mm Akoya pearls and two round brillia', '1000', 'E3.jpeg', 'E32.jpeg', 'E31.jpeg'),
(22, 'earrings 3', '7mm Cultured Pearl, Diamond Earrings in 14kt White Gold', '80', 'E41.jpeg', 'E4.jpeg', 'E42.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'ARWA AGNAOU', 'www.arwaagnaou1@gmail.com', '2891baceeef1652ee698294da0e71ba78a2a4064');

-- --------------------------------------------------------

--
-- Structure de la table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
