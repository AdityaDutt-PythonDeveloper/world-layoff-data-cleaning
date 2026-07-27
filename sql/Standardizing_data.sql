-- 2. Standardizing data: It means finding issues in your data and fixing it
-- look at each column one by one by selecting it differently and try to find out if there are any errors or not like its data type are correct or not
-- or names entered without any error or not.
use world_layoffs;

select * from layoffs_staging2;

-- checking company
select company, trim(company)
from layoffs_staging2;

SET SQL_SAFE_UPDATES = 0;

update layoffs_staging2
set company = trim(company);

-- checking industry
select * from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct industry from layoffs_staging2 order by industry;

-- checking country, location was all good
update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

-- correcting the date column data type
update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y'); -- %Y capital y is used when year is given in 4 digits like 2026 etc. 

alter table layoffs_staging2
modify column `date` date;












