select * from layoffs_staging2;

-- 3. Handling the null values or Blank values(individually check each column whether is has null value or not?
select * from layoffs_staging2 where company is null or company = ''; -- no null value
select * from layoffs_staging2 where location is null or company = ''; -- no null values
select * from layoffs_staging2 where industry is null or company = '';

-- step-1 : getting the null values
select * from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

update layoffs_staging2 t1
join layoffs_staging2 t2 on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null and t2.industry is not null;

-- populating the null value if possible ortherwise delete
select * from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null;

delete from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null;



