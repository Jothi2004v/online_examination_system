-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2025 at 01:21 PM
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
-- Database: `online_exam_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`) VALUES
(1, 'Python'),
(2, 'Java'),
(3, 'C'),
(4, 'PHP'),
(5, 'Operating System');

-- --------------------------------------------------------

--
-- Table structure for table `course_registrations`
--

CREATE TABLE `course_registrations` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_registrations`
--

INSERT INTO `course_registrations` (`id`, `student_id`, `course_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `correct_option` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `course_id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_option`) VALUES
(1, 1, 'Which data type is used to represent a sequence of \r\ncharacters in Python?', 'int', 'float', 'str', 'list', 3),
(2, 1, 'What keyword is used to define a function in Python?', 'func', 'define', 'def', 'function', 3),
(3, 1, 'How do you create a list in Python?', '[]', '{}', '()', 'list()', 1),
(4, 1, 'Which of the following is a Python data structure?', 'Array', 'Dictionary', 'Queue', 'Stack', 2),
(5, 1, 'What does the \"print\" function do in Python?', 'Outputs \r\ndata to the console', 'Inputs data from the user', 'Writes data \r\nto a file', 'Reads data from a file', 1),
(6, 2, 'What is the correct syntax for defining a main method in \r\nJava?', 'public void main(String[] args)', 'public static void \r\nmain(String[] args)', 'void main(String[] args)', 'static void \r\nmain(String args[]', 2),
(7, 2, 'Which of the following is not a primitive data type in \r\nJava?', 'int', 'float', 'String', 'char', 3),
(8, 2, 'How do you create an object of a class in Java?', 'ClassName obj = new ClassName();', 'ClassName obj = \r\nClassName();', 'ClassName obj = new ClassName;', 'new \r\nClassName obj();', 1),
(9, 2, 'What is inheritance in Java?', 'The ability to create new \r\nclasses from existing classes', 'The ability to implement \r\ninterfaces', 'The ability to override methods', 'The ability to \r\ncreate multiple objects', 1),
(10, 2, 'Which keyword is used to prevent a class from being \r\nsubclassed in Java?', 'static', 'final', 'abstract', 'protected', 2),
(11, 3, 'Which header file is required for input and output \r\nfunctions in C?', 'stdlib.h', 'stdio.h', 'conio.h', 'string.h', 2),
(12, 3, 'What is the correct way to declare a pointer in C?', 'int \r\nptr;', 'int *ptr;', 'int &ptr;', 'pointer int ptr;', 2),
(13, 3, 'Which operator is used to access the value at a pointer in \r\nC?', '&', '*', '->', '.', 2),
(14, 3, 'What is the output of \"printf(\"%d\", 10 / 3);\" in C?', '3', '3.33', '10 / 3', 'Error', 1),
(15, 3, 'How do you define a constant in C?', 'const int x = 10;', '#define x 10', 'int x = 10;', 'constant int x = 10;', 2),
(16, 4, 'What is the correct way to start a PHP script?', '<?php', '<php>', '<script>', 'PHP', 1),
(17, 4, 'How do you declare a variable in PHP?', '$var = value;', 'var value;', 'variable = value;', 'value = var;', 1),
(18, 4, 'What function is used to include a file in PHP?', 'include()', 'require()', 'import()', 'open()', 1),
(19, 4, 'Which of the following is a correct way to access a value \r\nin an associative array in PHP?', '$array[key]', '$array->key', '$array.key', '$array[key];', 1),
(20, 4, 'What does the \"echo\" function do in PHP?', 'Displays \r\noutput to the screen', 'Accepts input from the user', 'Writes \r\ndata to a file', 'Reads data from a file', 1),
(21, 5, 'What is the primary function of an operating system?', 'Manage hardware and software resources', 'Execute \r\nprograms', 'Control user access', 'Provide internet access', 1),
(22, 5, 'What is a process in an operating system?', 'A program in \r\nexecution', 'A type of file', 'A method to manage memory', 'A \r\nuser account', 1),
(23, 5, 'Which of the following is an example of an operating \r\nsystem?', 'Windows', 'Microsoft Office', 'Google Chrome', 'Adobe Photoshop', 1),
(24, 5, 'What does the term \"multitasking\" refer to in an \r\noperating system?', 'Running multiple programs at once', 'Running a single program in multiple instances', 'Managing \r\nsystem updates', 'Scheduling tasks', 1),
(25, 5, 'What is virtual memory?', 'Memory that is not physically \r\ninstalled but simulated', 'Memory used by the CPU', 'Memory \r\nfor storing data files', 'Cache memory', 1);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `student_id`, `registration_id`, `score`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_registration`
--

CREATE TABLE `student_registration` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_registration`
--

INSERT INTO `student_registration` (`id`, `name`, `email`, `password`) VALUES
(1, 'jothi prakash', 'jothiprakashvimala2004@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_registrations`
--
ALTER TABLE `course_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `registration_id` (`registration_id`);

--
-- Indexes for table `student_registration`
--
ALTER TABLE `student_registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_registrations`
--
ALTER TABLE `course_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_registration`
--
ALTER TABLE `student_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_registrations`
--
ALTER TABLE `course_registrations`
  ADD CONSTRAINT `course_registrations_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_registration` (`id`),
  ADD CONSTRAINT `course_registrations_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_registration` (`id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`registration_id`) REFERENCES `course_registrations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
