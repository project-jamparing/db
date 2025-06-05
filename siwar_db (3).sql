-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2025 at 09:28 AM
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
-- Database: `siwar_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `iuran`
--

CREATE TABLE `iuran` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `nominal` decimal(12,2) NOT NULL,
  `tanggal_nagih` date NOT NULL,
  `tanggal_tempo` date NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `kategori_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nik` varchar(16) NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nik`, `role_id`, `status`, `created_at`, `updated_at`) VALUES
(8, '3201010101010005', 2, 'aktif', '2025-06-04 23:10:14', '2025-06-04 23:10:14'),
(9, '3174094402980001', 3, 'aktif', '2025-06-05 00:19:52', '2025-06-05 00:19:52'),
(10, '3375094105050001', 3, 'aktif', '2025-06-05 00:20:22', '2025-06-05 00:20:22'),
(11, '3672023108030031', 3, 'aktif', '2025-06-05 00:21:05', '2025-06-05 00:21:05'),
(12, '3276041209950011', 3, 'aktif', '2025-06-05 00:22:19', '2025-06-05 00:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'kampung'),
(2, 'kost'),
(3, 'kavling'),
(4, 'umkm'),
(5, 'kantor'),
(6, 'bisnis');

-- --------------------------------------------------------

--
-- Table structure for table `kk`
--

CREATE TABLE `kk` (
  `no_kk` varchar(20) NOT NULL,
  `rt_id` int(10) UNSIGNED DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `kategori_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kk`
--

INSERT INTO `kk` (`no_kk`, `rt_id`, `nik`, `kategori_id`) VALUES
('3201010101010001', 1, '3201010101010001', 2),
('3201010101010002', 2, '3201010101010004', 3),
('3201010101010003', 1, '3201051205010001', 3),
('3201010101010004', 1, '3174094402980001', 2),
('3201010101010005', 1, '3302051908040001', 5),
('3201010101010006', 1, '3510060309010001', 4),
('3201010101010007', 2, '3604091710010001', 3),
('3201010101010008', 2, '3204072407990001', 2),
('3201010101010009', 2, '3375094105050001', 4),
('3201010101010010', 2, '3273011512000001', 4),
('3201010101010011', 3, '3403062308010001', 4),
('3201010101010012', 3, '3276041209950011', 4),
('3201010101010013', 3, '3305080602010011', 1),
('3201010101010014', 4, '3202091007020011', 1),
('3201010101010015', 4, '3672023108030031', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(100) NOT NULL,
  `subjek` varchar(100) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `tanggal` date NOT NULL,
  `rt_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `nama`) VALUES
(1, 'admin'),
(2, 'rw'),
(3, 'rt'),
(4, 'warga');

-- --------------------------------------------------------

--
-- Table structure for table `rukun_tetangga`
--

CREATE TABLE `rukun_tetangga` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rukun_tetangga`
--

INSERT INTO `rukun_tetangga` (`id`, `nama`) VALUES
(1, '01'),
(2, '02'),
(3, '03'),
(4, '04');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id` int(10) UNSIGNED NOT NULL,
  `no_kk` varchar(20) DEFAULT NULL,
  `status` enum('lunas','belum_lunas') DEFAULT 'belum_lunas',
  `tanggal_bayar` date DEFAULT NULL,
  `iuran_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `password`, `role_id`) VALUES
(1, '3201010101010001', '$2a$12$dT4iQRmxAE5etsCKo.FRwOvxjuw5UdKLDTONmSpIwwAnC63eUvICa', 1),
(4, '3201010101010005', '$2a$12$dT4iQRmxAE5etsCKo.FRwOvxjuw5UdKLDTONmSpIwwAnC63eUvICa', 2),
(9, '3201051205010001', '$2b$10$MMTRGxMQ.IYwqAmaopzt1uAHHSRLjZkUzHtQPMuAaV./Tu7b4F67.', 4),
(12, '3174094402980001', '$2b$10$hWazUAf2eRrBCj0aMuqJ/.xjAokIdmgQmaI.rjvMvRw3ZmJMl3kTO', 3),
(13, '3302051908040001', '$2b$10$t5Do1b0rFFxxsDpOC6rXZO0QD.GoI1yrsFZ7/wLe6w0pejT9DkT3i', 4),
(14, '3510060309010001', '$2b$10$RJNGObU5c0u8IgAt2gTyJ.d3aCsMRO9RnwO20H4GPyjdQ6zqANqQ.', 4),
(15, '3604091710010001', '$2b$10$PLaTn/hQ/cr5uHdtaU7HZOyp5zQIiK2A57r.bZtPBILf.NDmhDIlW', 4),
(16, '3204072407990001', '$2b$10$1ozo/a7D5WUfTySbqWVHcOD7PEriCnDH1NjoLadVR6zAB6kgJcunG', 4),
(17, '3375094105050001', '$2b$10$pq.rMihwfsWQrd8Hx8VW0u8ogPy75AHDhMlqExxPahM5MQ59bOZjC', 3),
(18, '3273011512000001', '$2b$10$s2ZDYthAXsumvgSp/wWEG.2VdiRAPMT.sXeg3GI5u4gO70Ovg22Fe', 4),
(19, '3403062308010001', '$2b$10$VWqbVvZxn8YNo12ZSpoYKek65/b9RbmB3hxZ/GuG3HiredrSMv2Iu', 4),
(20, '3276041209950011', '$2b$10$SJTCMGhe./KiH8VmVcilROLG/Jy0f4IVRTtfW6rPuPxLVHtPKZade', 3),
(21, '3305080602010011', '$2b$10$9VIs/x6yfgd6kfLx1QJkHeHvvTQsliODhpTJ4xsmqo8jrcFoqx1dG', 4),
(22, '3202091007020011', '$2b$10$ZWNyr1Wu8HzpEQRHrjjf3eO/3V0yc6ZPozbtj2VNtfZ8rwa5FwgZG', 4),
(23, '3672023108030031', '$2b$10$EfSkutj8yRiXMdDxKyUYRuUH5ONODjjCZPv5hc43J9s2dhi6lGmOq', 3);

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_kk` varchar(20) DEFAULT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `pendidikan` varchar(100) DEFAULT NULL,
  `jenis_pekerjaan` varchar(100) DEFAULT NULL,
  `golongan_darah` varchar(3) DEFAULT NULL,
  `status_perkawinan` enum('kawin_tercatat','belum_kawin','cerai_hidup','cerai_mati') DEFAULT 'belum_kawin',
  `tanggal_perkawinan` date DEFAULT NULL,
  `status_hubungan_dalam_keluarga` varchar(50) DEFAULT NULL,
  `kewarganegaraan` varchar(50) DEFAULT NULL,
  `no_paspor` varchar(20) DEFAULT NULL,
  `no_kitap` varchar(20) DEFAULT NULL,
  `ayah` varchar(100) DEFAULT NULL,
  `ibu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`nik`, `nama`, `no_kk`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `pendidikan`, `jenis_pekerjaan`, `golongan_darah`, `status_perkawinan`, `tanggal_perkawinan`, `status_hubungan_dalam_keluarga`, `kewarganegaraan`, `no_paspor`, `no_kitap`, `ayah`, `ibu`) VALUES
('3174094402980001', 'Yodi Suami', '3201010101010004', 'laki-laki', 'Lampung', '1972-07-20', 'Islam', 'Sekolah Dasar', 'Wiraswasta', 'O', 'kawin_tercatat', '1999-01-19', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Yodi Kakek', 'Yodi Nenek'),
('3174094402980002', 'Yodi Istri', '3201010101010004', 'perempuan', 'Bandung', '1974-09-17', 'Islam', 'Sekolah Dasar', 'Ibu Rumah Tangga', 'AB', 'kawin_tercatat', '1999-01-19', 'Istri', 'WNI', NULL, NULL, 'Yodi Kakek', 'Yodi Nenek'),
('3174094402980003', 'Yodi Anak', '3201010101010004', 'laki-laki', 'Bandung', '2018-12-17', 'Islam', 'Sekolah Dasar', 'Ibu Rumah Tangga', 'B', 'belum_kawin', NULL, 'Anak', 'WNI', NULL, NULL, 'Yodi Kakek', 'Yodi Nenek'),
('3201010101010001', 'Ahmad Fauzi', '3201010101010001', 'laki-laki', 'Bandung', '1985-07-15', 'Islam', 'S1', 'Karyawan Swasta', 'O', 'kawin_tercatat', '2010-05-20', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Budi Santoso', 'Siti Aminah'),
('3201010101010002', 'Sari Dewi', '3201010101010001', 'perempuan', 'Bandung', '1987-09-30', 'Islam', 'SMA', 'Ibu Rumah Tangga', 'A', 'kawin_tercatat', '2010-05-20', 'Istri', 'WNI', NULL, NULL, 'Ahmad Fauzi', 'Siti Aminah'),
('3201010101010003', 'Rizky Pratama', '3201010101010001', 'laki-laki', 'Bandung', '2012-03-10', 'Islam', 'SMP', 'Pelajar', 'O', 'belum_kawin', NULL, 'Anak', 'WNI', NULL, NULL, 'Ahmad Fauzi', 'Sari Dewi'),
('3201010101010004', 'Dewi Lestari', '3201010101010002', 'perempuan', 'Jakarta', '1990-01-05', 'Islam', 'D3', 'Guru', 'B', 'kawin_tercatat', '2012-07-18', 'Istri', 'WNI', NULL, NULL, 'Rahmat Hidayat', 'Yuniarti'),
('3201010101010005', 'Andi Saputra', '3201010101010002', 'laki-laki', 'Jakarta', '1988-11-22', 'Islam', 'SMA', 'Wiraswasta', 'AB', 'kawin_tercatat', '2012-07-18', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Samsul Arifin', 'Rohani'),
('3201051205010001', 'Riko Suami', '3201010101010003', 'laki-laki', 'Bandung', '1975-01-05', 'Islam', 'S1', 'Wiraswasta', 'AB', 'kawin_tercatat', '2020-01-31', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Riko Kakek', 'Riko Nenek'),
('3201051205010002', 'Riko Istri', '3201010101010003', 'perempuan', 'Sumedang', '1985-05-14', 'Islam', 'SMA', 'Ibu Rumah Tangga', 'B', 'kawin_tercatat', '2020-01-31', 'Istri', 'WNI', NULL, NULL, 'Riko Kakek', 'Riko Nenek'),
('3201051205010003', 'Riko Anak', '3201010101010003', 'laki-laki', 'Bandung', '2016-02-09', 'Islam', 'Sekolah Menengah Pertama', 'Pelajar', 'AB', 'belum_kawin', NULL, 'Anak', 'WNI', NULL, NULL, 'Riko Suami', 'Riko Istri'),
('3201051205010004', 'Riko Anak Ke2', '3201010101010003', 'perempuan', 'Bandung', '2021-01-03', 'Islam', 'Sekolah Dasar', 'Pelajar', 'B', 'belum_kawin', NULL, 'Anak', 'WNI', NULL, NULL, 'Riko Suami', 'Riko Istri'),
('3202091007020011', 'Jawa Suami', '3201010101010014', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3202091007020012', 'Jawa Istri', '3201010101010014', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3204072407990001', 'Fahri Suami', '3201010101010008', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3204072407990002', 'Fahri Istri', '3201010101010008', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNA', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3273011512000001', 'Denis Suami', '3201010101010010', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'O', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3273011512000002', 'Denis Istri', '3201010101010010', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'O', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3276041209950011', 'Usus Suami', '3201010101010012', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3276041209950012', 'Usus Istri', '3201010101010012', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'O', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3302051908040001', 'Ferdi Suami', '3201010101010005', 'laki-laki', 'Bandung', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'O', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Ferdi Kakek', 'Ferdi Nenek'),
('3302051908040002', 'Ferdi Istri', '3201010101010005', 'perempuan', 'Bandung', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'O', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Ferdi Kakek', 'Ferdi Nenek'),
('3305080602010011', 'Bohlam Suami', '3201010101010013', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3305080602010012', 'Bohlam Istri', '3201010101010013', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3375094105050001', 'Alip suami', '3201010101010009', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3375094105050002', 'Alip Istri', '3201010101010009', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3403062308010001', 'Ulhaq Suami', '3201010101010011', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'AB', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3403062308010002', 'Ulhaq Istri', '3201010101010011', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'B', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3510060309010001', 'Enza Suami', '3201010101010006', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'AB', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3510060309010002', 'Enza Istri', '3201010101010006', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3604091710010001', 'Deny Suami', '3201010101010007', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'O', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3604091710010002', 'Deny Istri', '3201010101010007', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'O', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3672023108030031', 'irsyad Suami', '3201010101010015', 'laki-laki', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Kepala Keluarga', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek'),
('3672023108030032', 'irsyad Istri', '3201010101010015', 'perempuan', 'Rawabadak City', '1990-01-05', 'Islam', 'SMK', 'Ngangur', 'A', 'kawin_tercatat', '2023-01-05', 'Istri', 'WNI', NULL, NULL, 'Enza Kakek', 'Enza Nenek');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('25c6600f-ddeb-42c0-a492-bd5277a5a4b3', 'bf467d61ffb818999c5866a9d92384ec47d3b5ca6b05fe25fd134d4bdf0a5e49', '2025-06-03 04:11:47.240', '20250520073434_init', NULL, NULL, '2025-06-03 04:11:47.227', 1),
('4795a58c-a394-4947-b939-622af9df40fd', '5f441d7e658bdf8dcabef9fb3241c064f2cf2af0e028d65ecb9bc5bae8e7c495', '2025-06-03 04:13:10.819', '20250603041309_siwar', NULL, NULL, '2025-06-03 04:13:09.829', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `iuran`
--
ALTER TABLE `iuran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nik` (`nik`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kk`
--
ALTER TABLE `kk`
  ADD PRIMARY KEY (`no_kk`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `kk_ibfk_2` (`rt_id`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rt_id` (`rt_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rukun_tetangga`
--
ALTER TABLE `rukun_tetangga`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iuran_id` (`iuran_id`),
  ADD KEY `no_kk` (`no_kk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik_3` (`nik`),
  ADD KEY `fk_user_role` (`role_id`),
  ADD KEY `nik` (`nik`),
  ADD KEY `nik_2` (`nik`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `no_kk` (`no_kk`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iuran`
--
ALTER TABLE `iuran`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rukun_tetangga`
--
ALTER TABLE `rukun_tetangga`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `iuran`
--
ALTER TABLE `iuran`
  ADD CONSTRAINT `iuran_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD CONSTRAINT `jabatan_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `jabatan_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `warga` (`nik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kk`
--
ALTER TABLE `kk`
  ADD CONSTRAINT `kk_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `warga` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kk_ibfk_2` FOREIGN KEY (`rt_id`) REFERENCES `rukun_tetangga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_ibfk_1` FOREIGN KEY (`rt_id`) REFERENCES `rukun_tetangga` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`no_kk`) REFERENCES `kk` (`no_kk`) ON DELETE CASCADE,
  ADD CONSTRAINT `tagihan_ibfk_2` FOREIGN KEY (`iuran_id`) REFERENCES `iuran` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `warga` (`nik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `warga`
--
ALTER TABLE `warga`
  ADD CONSTRAINT `warga_ibfk_1` FOREIGN KEY (`no_kk`) REFERENCES `kk` (`no_kk`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
