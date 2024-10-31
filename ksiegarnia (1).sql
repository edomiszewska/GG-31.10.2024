-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Paź 31, 2024 at 11:39 AM
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
-- Database: `ksiegarnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `idklienta` int(11) NOT NULL,
  `imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `plec` enum('M','K') DEFAULT NULL,
  `miejscowosc` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`idklienta`, `imie`, `nazwisko`, `plec`, `miejscowosc`) VALUES
(1, 'Łukasz', 'Lewandowski', NULL, 'Poznań'),
(2, 'Jan', 'Nowak', NULL, 'Katowice'),
(3, 'Maciej', 'Wójcik', NULL, 'Bydgoszcz'),
(4, 'Agnieszka', 'Jankowska', NULL, 'Lublin'),
(5, 'Tomasz', 'Mazur', NULL, 'Jelenia Góra'),
(6, 'Michał', 'Zieliński', NULL, 'Kraków'),
(7, 'Artur', 'Rutkowski', NULL, 'Kielce'),
(8, 'Mateusz', 'Skorupa', NULL, 'Gdańsk'),
(9, 'Jerzy', 'Rutkowski', NULL, 'Rybnik'),
(10, 'Anna', 'Karenina', NULL, 'Pułtusk'),
(11, 'Monika', 'Brodka', NULL, 'Warszawa'),
(12, 'Andrzej', 'Dudada', NULL, 'Folkowo');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `idksiazki` int(11) NOT NULL,
  `imieautora` text NOT NULL,
  `nazwiskoautora` text NOT NULL,
  `tytul` text NOT NULL,
  `cena` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`idksiazki`, `imieautora`, `nazwiskoautora`, `tytul`, `cena`) VALUES
(1, 'Jan', 'Michalak', 'Zaawansowane programowanie w PHP', 47.29),
(2, 'Andrzej', 'Krawczyk', 'Windows 11 PL. Zaawansowana administracja systemem', 49.99),
(3, 'Paweł', 'Jakubowski', 'HTML5. Tworzenie witryn', 53.65),
(4, 'Tomasz', 'Kowalski', 'Urządzenia techniki komputerowej', 34.15),
(5, 'Łukasz', 'Pasternak', 'PHP. Tworzenie nowoczesnych stron WWW', 29.99),
(6, 'Radosław', 'Małecki', 'Frontend developer: HTML + CSS', 39.99),
(7, 'Michał', 'Segieta', 'Od zera do frontend developera', 28.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `idzamowienia` int(11) NOT NULL,
  `idklienta` int(11) NOT NULL,
  `idksiazki` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`idzamowienia`, `idklienta`, `idksiazki`, `data`, `status`) VALUES
(1, 2, 4, '2021-10-08', 'oczekiwanie'),
(2, 7, 1, '2021-09-05', 'wyslano'),
(3, 9, 1, '2021-10-11', 'wyslano'),
(4, 2, 2, '2021-10-15', 'oczekiwanie'),
(5, 2, 5, '2021-08-12', 'oczekiwanie'),
(6, 3, 2, '2021-10-20', 'wyslano'),
(7, 4, 3, '2021-08-14', 'wyslano'),
(8, 8, 1, '2021-08-19', 'wyslano'),
(9, 3, 5, '2021-11-19', 'wyslano'),
(10, 9, 2, '2021-12-28', 'oczekiwanie'),
(11, 10, 6, '2022-01-12', 'wyslano'),
(12, 10, 7, '2022-01-12', 'wyslano'),
(13, 2, 7, '2022-02-28', 'oczekiwanie'),
(14, 11, 7, '2022-03-15', 'wyslano'),
(15, 11, 5, '2022-04-10', 'wyslano');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`idklienta`),
  ADD KEY `id` (`idklienta`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`idksiazki`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`idzamowienia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `idklienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `idksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `idzamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
