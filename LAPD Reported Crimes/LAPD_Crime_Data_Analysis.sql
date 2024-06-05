select top (10) * from LAPD_Crimes

                   ---------------------------------------Answering Questions--------------------------------------

-- Q1: What are the most common types of crimes reported?

Select [Crm_Cd], [Crm_Cd_Desc], COUNT(*) as Top_Common
From LAPD_Crimes
Group By [Crm_Cd], [Crm_Cd_Desc]
Order By COUNT(*)  desc
;


-- Q2: Do different areas of the city (indicated by "AREA NAME") have higher rates of specific crimes?

With cte As (
SELECT 
     ROW_NUMBER() over (Partition By [AREA_NAME] Order By Count(*) Desc) Top_Rnk,
	 [AREA_NAME], [Crm_Cd_Desc]

From LAPD_Crimes
Group By [AREA_NAME], [Crm_Cd_Desc] )

Select [AREA_NAME], [Crm_Cd_Desc]
From cte
Where Top_Rnk = 1 
;


-- Q3: Do crimes tend to happen more often near certain landmarks or locations?

Select [Premis_Desc], COUNT(*) As Top_Common
From LAPD_Crimes
Group By [Premis_Desc]
Order By COUNT(*) Desc
;


-- Q4: Are there any trends in crime rates over time?

Select _Year, SUM(Total_Crm) Total_Crimes
From 
(
Select 
      ROW_NUMBER() over (Partition By YEAR([Date_Rptd]) Order By COUNT(*) Desc) Top_Crimes,
	  YEAR([Date_Rptd]) _Year, COUNT(*) Total_Crm

From LAPD_Crimes
Group By [Date_Rptd]
) a

Group By _Year
Order By _Year
;


-- Q5: What is the typical outcome for a reported crime (indicated by "Status Status Desc")?

Select [Status], [Status_Desc], COUNT(*) Total
From LAPD_Crimes
Group By [Status], [Status_Desc]
Order By COUNT(*) Desc
;
