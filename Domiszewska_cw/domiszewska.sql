-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Paź 31, 2024 at 12:59 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cwiczenie2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autor`
--

CREATE TABLE `autor` (
  `id_autora` int(11) NOT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `imie` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id_autora`, `nazwisko`, `imie`) VALUES
(1, 'Lola', 'Lili'),
(2, 'Anna', 'Wesolowska '),
(3, 'Jan', 'Kowalski'),
(4, 'Bolesław ', 'Chrobry'),
(5, 'Maria', 'Antonina');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktura`
--

CREATE TABLE `faktura` (
  `id_faktury` int(11) NOT NULL,
  `nr_faktury` varchar(50) DEFAULT NULL,
  `sposob_platnosci` varchar(50) DEFAULT NULL,
  `data_wystawienia` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `faktura`
--

INSERT INTO `faktura` (`id_faktury`, `nr_faktury`, `sposob_platnosci`, `data_wystawienia`) VALUES
(1, '27485756', 'karta', '2022-11-12 14:57:52'),
(2, '32534553', 'gotówka', '2022-11-03 14:51:43'),
(3, '42342523', 'paypal', '2022-11-03 14:54:24'),
(4, '32353253', 'blik', '2022-11-04 14:58:52');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `miejscowosc` varchar(50) DEFAULT NULL,
  `kod_pocztowy` varchar(6) DEFAULT NULL,
  `ulica` varchar(50) DEFAULT NULL,
  `nr_domu` varchar(7) DEFAULT NULL,
  `telefon` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `klient`
--

INSERT INTO `klient` (`id_klienta`, `imie`, `nazwisko`, `miejscowosc`, `kod_pocztowy`, `ulica`, `nr_domu`, `telefon`, `email`) VALUES
(1, 'Majkel', 'Musz', 'Częstochowa', '44-100', 'Kwiatkowa 3', '3', '+48111222333', 'email@gmail.com'),
(2, 'Aurelia', 'Dominikanska', 'Bolesławiec', NULL, NULL, NULL, '+48222333444', NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `id_ksiazki` int(11) NOT NULL,
  `tytul` varchar(100) DEFAULT NULL,
  `id_autora` int(11) NOT NULL,
  `cena` decimal(8,2) DEFAULT NULL,
  `id_wydawnictwa` int(11) DEFAULT NULL,
  `rok_wydania` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`id_ksiazki`, `tytul`, `id_autora`, `cena`, `id_wydawnictwa`, `rok_wydania`) VALUES
(11, 'Piekna i Bestia', 1, 24.00, 1, 2021),
(12, 'American Story', 4, 250.00, 2, 2023),
(13, 'Mój Mały Kucyk', 5, 120.00, 1, 2009),
(14, 'Alfabet', 1, 25.00, 2, 2020),
(15, 'Kopciuszek', 2, 30.00, 2, 2008),
(16, 'Tajemniczy Ogrod', 3, 40.00, 2, 2005),
(17, 'Dzieci z Bullerbyn', 5, 55.00, 1, 2003),
(18, 'Kotek i Piesek', 4, 20.00, 1, 2020),
(19, 'Podrecznik biologia', 2, 32.00, 2, 2002),
(20, 'Sahara', 1, 200.00, 2, 1988);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szczegoly_zamowienia`
--

CREATE TABLE `szczegoly_zamowienia` (
  `id_zamowien` int(11) NOT NULL,
  `id_ksiazki` int(11) NOT NULL,
  `ilosc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `szczegoly_zamowienia`
--

INSERT INTO `szczegoly_zamowienia` (`id_zamowien`, `id_ksiazki`, `ilosc`) VALUES
(1, 12, 34),
(2, 15, 2),
(3, 20, 22),
(4, 17, 34),
(1, 13, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydawnictwo`
--

CREATE TABLE `wydawnictwo` (
  `id_wydawnictwa` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wydawnictwo`
--

INSERT INTO `wydawnictwo` (`id_wydawnictwa`, `nazwa`) VALUES
(1, 'Krakow'),
(2, 'Gwiazda');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `id_klienta` int(11) DEFAULT NULL,
  `data_zamowienia` datetime DEFAULT NULL,
  `data_wyslania` datetime DEFAULT NULL,
  `koszt_wysylki` decimal(8,2) DEFAULT NULL,
  `id_faktury` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `id_klienta`, `data_zamowienia`, `data_wyslania`, `koszt_wysylki`, `id_faktury`) VALUES
(1, 1, '2023-10-02 10:00:00', '2023-11-12 12:02:52', 18.00, 1),
(2, 2, '2023-10-22 10:00:20', '2023-11-30 12:02:40', 22.00, 3),
(3, 2, '2023-10-05 10:00:30', '2023-11-16 12:03:40', 17.00, 2),
(4, 2, '2023-10-11 10:00:40', '2023-11-12 12:04:40', 23.00, 4);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autora`);

--
-- Indeksy dla tabeli `faktura`
--
ALTER TABLE `faktura`
  ADD PRIMARY KEY (`id_faktury`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id_ksiazki`),
  ADD KEY `fk_autor` (`id_autora`),
  ADD KEY `fk_wydawnictwo` (`id_wydawnictwa`);

--
-- Indeksy dla tabeli `szczegoly_zamowienia`
--
ALTER TABLE `szczegoly_zamowienia`
  ADD KEY `fk_zamowienia` (`id_zamowien`),
  ADD KEY `fk_ksiazki` (`id_ksiazki`);

--
-- Indeksy dla tabeli `wydawnictwo`
--
ALTER TABLE `wydawnictwo`
  ADD PRIMARY KEY (`id_wydawnictwa`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `fk_klient` (`id_klienta`),
  ADD KEY `fk_faktura` (`id_faktury`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `faktura`
--
ALTER TABLE `faktura`
  MODIFY `id_faktury` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `klient`
--
ALTER TABLE `klient`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wydawnictwo`
--
ALTER TABLE `wydawnictwo`
  MODIFY `id_wydawnictwa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `fk_wydawnictwo` FOREIGN KEY (`id_wydawnictwa`) REFERENCES `wydawnictwo` (`id_wydawnictwa`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`id_autora`) REFERENCES `autor` (`id_autora`);

--
-- Constraints for table `szczegoly_zamowienia`
--
ALTER TABLE `szczegoly_zamowienia`
  ADD CONSTRAINT `fk_ksiazki` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazki` (`id_ksiazki`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zamowienia` FOREIGN KEY (`id_zamowien`) REFERENCES `zamowienia` (`id_zamowienia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `fk_faktura` FOREIGN KEY (`id_faktury`) REFERENCES `faktura` (`id_faktury`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_klient` FOREIGN KEY (`id_klienta`) REFERENCES `klient` (`id_klienta`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
