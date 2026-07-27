create database world_layoffs;
use world_layoffs;

select * from layoffs;

-- Data cleaning Steps :
-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null values or blank values
-- 4. Remove any columns 

-- First of all we will create a copy of raw data so that if any mistakes happen atleast we have a copy of original raw data. 
create table layoffs_staging like layoffs;

insert layoffs_staging select * from layoffs;

select * from layoffs_staging;