-- 1. Removing Duplicates
use world_layoffs;

select * from  layoffs_staging;

WITH duplicates_cte AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company,
							location,
                            industry,
                            total_laid_off,
                            percentage_laid_off,
                            `date`,
                            stage,
                            country,
                            funds_raised_millions
               ORDER BY company
           ) AS row_num
    FROM layoffs_staging
)

SELECT *
FROM duplicates_cte
where row_num > 1;
-- we created another table to avoid mistakes 
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_staging2      SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company,
							location,
                            industry,
                            total_laid_off,
                            percentage_laid_off,
                            `date`,
                            stage,
                            country,
                            funds_raised_millions
               ORDER BY company
           ) AS row_num
    FROM layoffs_staging;
    
select * from layoffs_staging2
where row_num > 1;


-- update safe update query
SET SQL_SAFE_UPDATES = 0;

delete 
from layoffs_staging2 
where row_num > 1;

SET SQL_SAFE_UPDATES = 0;

select *
from layoffs_staging2
where row_num > 1;

-- Hence duplicates are removed