-- ==========================================================
-- Project Name : PressStart - Video Game Rental Management System
-- File Name    : schema.sql
-- Description  : Creates the database and all required tables
-- Author       : Anaina S S
-- ==========================================================

-- ==========================================================
-- Create Database
-- ==========================================================

DROP DATABASE IF EXISTS pressstart_db;

CREATE DATABASE pressstart_db;

USE pressstart_db;

-- ==========================================================
-- Games Table
-- ==========================================================

CREATE TABLE games (

    game_id INT AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(100) NOT NULL,

    genre VARCHAR(50) NOT NULL,

    platform VARCHAR(30) NOT NULL,

    release_year YEAR NOT NULL,

    price_per_day DECIMAL(6,2) NOT NULL,

    stock_count INT NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);


-- ==========================================================
-- Members Table
-- ==========================================================

CREATE TABLE members (

    member_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    username VARCHAR(50) NOT NULL UNIQUE,

    email VARCHAR(100) NOT NULL UNIQUE,

    phone VARCHAR(15) NOT NULL,

    membership_type VARCHAR(20) NOT NULL DEFAULT 'Standard',

    join_date DATE NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- ==========================================================
-- Employees Table
-- ==========================================================

CREATE TABLE employees (

    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) NOT NULL UNIQUE,

    phone VARCHAR(15) NOT NULL,

    designation VARCHAR(50) NOT NULL,

    hire_date DATE NOT NULL,

    salary DECIMAL(10,2) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- ==========================================================
-- Rentals Table
-- ==========================================================

CREATE TABLE rentals (

    rental_id INT AUTO_INCREMENT PRIMARY KEY,

    member_id INT NOT NULL,

    game_id INT NOT NULL,

    employee_id INT NOT NULL,

    rental_date DATE NOT NULL,

    expected_return_date DATE NOT NULL,

    actual_return_date DATE,

    days_rented INT NOT NULL,

    rental_status VARCHAR(20) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (member_id)
        REFERENCES members(member_id),

    FOREIGN KEY (game_id)
        REFERENCES games(game_id),

    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)

);

-- ==========================================================
-- Payments Table
-- ==========================================================

CREATE TABLE payments (

    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    rental_id INT NOT NULL,

    amount DECIMAL(8,2) NOT NULL,

    payment_method VARCHAR(20) NOT NULL,

    payment_date DATE NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (rental_id)
        REFERENCES rentals(rental_id)

);