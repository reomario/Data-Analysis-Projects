-- Disney movies analysis --

-- 1.How many percentage does box office account for revenue each year?
Select year, Round(([Studio_Entertainment_NI_1]*100 / [Total] ),2) as Boxoffice_Pct
From revenue
;


-- 2. Which hero characters generate the highest box office revenues?
Select c.movie_title, c.hero, t.total_gross
From characters c
Join total_gross t on c.movie_title = t.movie_title
Order By t.total_gross desc
;


-- 3. Which movie rating is responsible for the highest revenue?
Select MPAA_rating, Sum(Cast([total_gross] as bigint)) as Total_revenue
From total_gross
Group By MPAA_rating
Order By Total_revenue desc
;


-- 4. Which Genre is responsible for the highest revenue?
Select genre, SUM(Cast(total_gross as bigint)) as Total_revenue
From total_gross
Group By genre
Order By Total_revenue desc
;