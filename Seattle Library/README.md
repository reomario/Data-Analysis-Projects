## Seattle Library Checkout Records Dataset

The original file has 9 columns and 17918 rows. The file has been pre-processed in Jupyter Notebook, to remove some rows values and columns that will be not used in the analysis.

### Data Cleaning

#### Main Observations:

* There are 3 Material types of books, Book Large Print Regular Print.
* There are 13 different book Series and 5379 NaN values that we will replace with Undefined instead.
* The Subjects column has a lot of details, so we will use the first record as the main Subject.
* The Puplisher records end with a comma, so we will delete it.
* Some puplishers have various names, we will use only one name to describe them.
* The Publication Year column is of inconsistent data type that needs to be converted to int type.
* There are 9 Duplicated records in the data set that need to be droppped.


### Data Analysis
For our Analysis we will answer the following Questions:

* Q1: Is there a seasonality month and if there is any, which month?
* Q2: What is the most checked out subject throughout the years?
* Q3: What are the top 10 books that have been checked out?
* Q4: What is the most checked out publication year?


### Putting it All Together: Visualisations & Summery

![alt text](https://github.com/reomario/Data-Analysis-Projects/blob/main/Seattle%20Library/Report.PNG)

### Built With:
* Jupyter NoteBook
* Pandas
* Seaborn
* Microsoft Power PI


