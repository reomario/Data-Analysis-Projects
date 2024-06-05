## LAPD Reported Crimes Dataset Analysis From 2020 to present

### About the Dataset
The dataset that will be presented in the next lines is available on the [Los Angeles Open Data](https://data.lacity.org/), for this purpose, I’ve used the dataset “[Crime Data from 2020 to Present](https://data.lacity.org/Public-Safety/Crime-Data-from-2020-to-Present/2nrs-mtv8/about_data)”, which covers crime incidents in Los Angeles between the years of 2020 and 2024. 

The original file has `28` columns and `944235` rows. The file has been pre-processed in Jupyter Notebook, to remove some rows values and columns that will be not used in the analysis.

### Columns Description:
*	`DR_NO` - Division of Records Number: Official file number made up of a 2 digit year, area ID, and 5 digits.
*	`DATE OCC` - Date of crime occurrence(YYYY-MM-DD)
*	`AREA` - The LAPD has 21 Community Police Stations referred to as Geographic Areas within the department. These Geographic Areas are sequentially numbered from 1-21.
*	`AREA NAME` - The 21 Geographic Areas or Patrol Divisions are also given a name designation that references a landmark or the surrounding community that it is responsible for.
*	`Rpt Dist No` - Code that represents a sub-area within a Geographic Area.
*	`Crm Cd` - Indicates the crime committed.
*	`Crm Cd Desc` - Defines the Crime Code provided.
*	`Vict Age` - Indicates the age of the victim.
*	`Vict Sex`- F: Female M: Male X: Unknown
*	`Vict Descent` - Descent Code: A - Other Asian B - Black C - Chinese D - Cambodian F - Filipino G - Guamanian H - Hispanic/Latin/Mexican I - American Indian/Alaskan Native J - Japanese K - Korean L - Laotian O - Other P - Pacific Islander S - Samoan U - Hawaiian V - Vietnamese W - White X - Unknown Z - Asian Indian
*	`Premis Cd` - The type of structure, vehicle, or location where the crime took place.
*	`Premis Desc` - Defines the Premise Code provided.
*	`Weapon Used Cd` - The type of weapon used in the crime.
*	`Weapon Desc` - Defines the Weapon Used Code provided.
*	`LOCATION` - Street address of crime incident rounded to the nearest hundred block to maintain anonymity.
*	`LAT` - Latitude Coordinate.
*	`LON` - Longitude Coordinate.


### Data Analysis
For our Analysis we will answer the following Questions:

* Q1: What are the most common types of crimes reported?
* Q2: Do different areas of the city (indicated by "Rpt Dist No") have higher rates of specific crimes?
* Q3: Do crimes tend to happen more often near certain landmarks or locations?
* Q4: Are there any trends in crime rates over time?
* Q5: Are there specific days of the week when certain crimes are more frequent?
* Q6: What is the typical outcome for a reported crime (indicated by "Status Status Desc")?


### Putting it All Together: Visualisations & Summery

![alt text](https://github.com/reomario/Data-Analysis-Projects/blob/main/LAPD%20Reported%20Crimes/LAPD%20Dashboard.PNG)

### Built With :
* Jupyter NoteBook
* Pandas
* SQL Server
* Microsoft Power PI
