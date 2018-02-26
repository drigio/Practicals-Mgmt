-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2018 at 10:24 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prac-mgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_faculty`
--

CREATE TABLE `accounts_faculty` (
  `id` int(3) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_student`
--

CREATE TABLE `accounts_student` (
  `id` int(5) NOT NULL,
  `enrollment_id` int(7) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `allocation`
--

CREATE TABLE `allocation` (
  `enrollment_id` int(7) DEFAULT NULL,
  `course_id` int(3) DEFAULT NULL,
  `class_id` int(2) DEFAULT NULL,
  `faculty_id` int(3) DEFAULT NULL,
  `batch_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` int(3) NOT NULL,
  `assignment_no` int(2) DEFAULT NULL,
  `course_id` int(3) DEFAULT NULL,
  `class_id` int(2) DEFAULT NULL,
  `batch_id` int(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_marks`
--

CREATE TABLE `assignment_marks` (
  `marks_id` int(5) NOT NULL,
  `assignment_id` int(3) DEFAULT NULL,
  `enrollment_id` int(7) DEFAULT NULL,
  `marks` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_master`
--

CREATE TABLE `assignment_master` (
  `assignment_id` int(3) NOT NULL,
  `question` varchar(30) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submission`
--

CREATE TABLE `assignment_submission` (
  `submission_id` int(5) NOT NULL,
  `enrollment_id` int(7) DEFAULT NULL,
  `answer` blob,
  `submission_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch_master`
--

CREATE TABLE `batch_master` (
  `batch_id` int(1) NOT NULL,
  `batch_name` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch_master`
--

INSERT INTO `batch_master` (`batch_id`, `batch_name`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `class_master`
--

CREATE TABLE `class_master` (
  `class_id` int(2) NOT NULL,
  `class_name` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_master`
--

INSERT INTO `class_master` (`class_id`, `class_name`) VALUES
(1, 'G'),
(2, 'H'),
(3, 'B1'),
(4, 'B2'),
(5, 'A2'),
(6, 'N'),
(7, 'B3'),
(8, 'A3'),
(9, 'A1'),
(11, '');

-- --------------------------------------------------------

--
-- Table structure for table `course_master`
--

CREATE TABLE `course_master` (
  `course_id` int(3) NOT NULL,
  `course_code` varchar(5) DEFAULT NULL,
  `course_name` varchar(25) DEFAULT NULL,
  `theory` int(1) DEFAULT NULL,
  `practical` int(1) DEFAULT NULL,
  `termwork` int(1) DEFAULT NULL,
  `oral` int(1) DEFAULT NULL,
  `path` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_master`
--

INSERT INTO `course_master` (`course_id`, `course_code`, `course_name`, `theory`, `practical`, `termwork`, `oral`, `path`) VALUES
(3, 'CM532', 'jsp', 0, 0, 0, 0, 'GS1');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_master`
--

CREATE TABLE `faculty_master` (
  `faculty_id` int(3) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `mname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_master`
--

INSERT INTO `faculty_master` (`faculty_id`, `username`, `fname`, `mname`, `lname`) VALUES
(2, 'MGYawalkar', 'Megha', 'G', 'Yawalkar'),
(5, 'VSPawar', 'Vaishali', 'S', 'Pawar');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `notice_id` int(2) NOT NULL,
  `notice_content` varchar(500) DEFAULT NULL,
  `class_id` int(2) DEFAULT NULL,
  `batch_id` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_master`
--

CREATE TABLE `role_master` (
  `role_id` int(2) NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `mname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_master`
--

INSERT INTO `role_master` (`role_id`, `fname`, `mname`, `lname`, `username`, `password`) VALUES
(1, 'U', 'V', 'Kokate', 'cmhod', 'cmhod');

-- --------------------------------------------------------

--
-- Table structure for table `student_allocation`
--

CREATE TABLE `student_allocation` (
  `enrollment_id` int(2) DEFAULT NULL,
  `class_id` int(2) DEFAULT NULL,
  `sem_id` int(2) DEFAULT NULL,
  `course_id` int(3) DEFAULT NULL,
  `faculty_id` int(3) DEFAULT NULL,
  `batch_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_master`
--

CREATE TABLE `student_master` (
  `enrollment_id` int(7) NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_master`
--

INSERT INTO `student_master` (`enrollment_id`, `fname`, `lname`) VALUES
(1506029, 'Atharva', 'Deshpande'),
(1506040, 'Vaishnav', 'Gaikwad'),
(1506053, 'Kaushal', 'Jain'),
(1506059, 'Diksha ', 'Katke'),
(1506066, 'Gaurav', 'Kondhare');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_faculty`
--
ALTER TABLE `accounts_faculty`
  ADD KEY `accounts-faculty-id` (`id`);

--
-- Indexes for table `accounts_student`
--
ALTER TABLE `accounts_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts-student-id` (`enrollment_id`);

--
-- Indexes for table `allocation`
--
ALTER TABLE `allocation`
  ADD KEY `enrollment_allocation` (`enrollment_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD KEY `assignments-assignmentid` (`assignment_id`),
  ADD KEY `assignments-courseid` (`course_id`),
  ADD KEY `assignments-batchid` (`batch_id`),
  ADD KEY `assignments-classid` (`class_id`);

--
-- Indexes for table `assignment_marks`
--
ALTER TABLE `assignment_marks`
  ADD PRIMARY KEY (`marks_id`),
  ADD KEY `assignments-marks-assignmentid` (`assignment_id`),
  ADD KEY `assignments-marks-enrollmentid` (`enrollment_id`);

--
-- Indexes for table `assignment_master`
--
ALTER TABLE `assignment_master`
  ADD PRIMARY KEY (`assignment_id`);

--
-- Indexes for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `assignment-submission-enrollmentid` (`enrollment_id`);

--
-- Indexes for table `batch_master`
--
ALTER TABLE `batch_master`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `class_master`
--
ALTER TABLE `class_master`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `course_master`
--
ALTER TABLE `course_master`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `faculty_master`
--
ALTER TABLE `faculty_master`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `role_master`
--
ALTER TABLE `role_master`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `student_allocation`
--
ALTER TABLE `student_allocation`
  ADD KEY `student-allocation-enrollment` (`enrollment_id`),
  ADD KEY `student-allocation-class` (`class_id`),
  ADD KEY `student-allocation-batch` (`batch_id`),
  ADD KEY `student-allocation-course` (`course_id`),
  ADD KEY `student-allocation-faculty` (`faculty_id`),
  ADD KEY `student-allocation-sem` (`sem_id`);

--
-- Indexes for table `student_master`
--
ALTER TABLE `student_master`
  ADD PRIMARY KEY (`enrollment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_student`
--
ALTER TABLE `accounts_student`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_marks`
--
ALTER TABLE `assignment_marks`
  MODIFY `marks_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_master`
--
ALTER TABLE `assignment_master`
  MODIFY `assignment_id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  MODIFY `submission_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_master`
--
ALTER TABLE `batch_master`
  MODIFY `batch_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `class_master`
--
ALTER TABLE `class_master`
  MODIFY `class_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `course_master`
--
ALTER TABLE `course_master`
  MODIFY `course_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faculty_master`
--
ALTER TABLE `faculty_master`
  MODIFY `faculty_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_master`
--
ALTER TABLE `role_master`
  MODIFY `role_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_master`
--
ALTER TABLE `student_master`
  MODIFY `enrollment_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1506067;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_faculty`
--
ALTER TABLE `accounts_faculty`
  ADD CONSTRAINT `accounts-faculty-id` FOREIGN KEY (`id`) REFERENCES `faculty_master` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `accounts_student`
--
ALTER TABLE `accounts_student`
  ADD CONSTRAINT `accounts-student-id` FOREIGN KEY (`enrollment_id`) REFERENCES `student_master` (`enrollment_id`);

--
-- Constraints for table `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `enrollment_allocation` FOREIGN KEY (`enrollment_id`) REFERENCES `student_master` (`enrollment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments-assignmentid` FOREIGN KEY (`assignment_id`) REFERENCES `assignment_master` (`assignment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments-batchid` FOREIGN KEY (`batch_id`) REFERENCES `batch_master` (`batch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments-classid` FOREIGN KEY (`class_id`) REFERENCES `class_master` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments-courseid` FOREIGN KEY (`course_id`) REFERENCES `course_master` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignment_marks`
--
ALTER TABLE `assignment_marks`
  ADD CONSTRAINT `assignments-marks-assignmentid` FOREIGN KEY (`assignment_id`) REFERENCES `assignment_master` (`assignment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments-marks-enrollmentid` FOREIGN KEY (`enrollment_id`) REFERENCES `student_master` (`enrollment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD CONSTRAINT `assignment-submission-enrollmentid` FOREIGN KEY (`enrollment_id`) REFERENCES `student_master` (`enrollment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_allocation`
--
ALTER TABLE `student_allocation`
  ADD CONSTRAINT `student-allocation-batch` FOREIGN KEY (`batch_id`) REFERENCES `batch_master` (`batch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student-allocation-class` FOREIGN KEY (`class_id`) REFERENCES `class_master` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student-allocation-course` FOREIGN KEY (`course_id`) REFERENCES `course_master` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student-allocation-enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `student_master` (`enrollment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student-allocation-faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty_master` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student-allocation-sem` FOREIGN KEY (`sem_id`) REFERENCES `semester_master` (`sem_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;