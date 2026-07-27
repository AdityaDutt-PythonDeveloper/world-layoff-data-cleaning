-- Removing columns
select * from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;

-- Now your data is clean and your next job is to perform EDA on dthis clean data