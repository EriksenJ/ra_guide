
File types 

- `.csv`: file format, which can be read by (almost) all programs, including Excel.
- `.dta`: Stata's file format. Can be read by many, but is primarily used for Stata.
- `.parquet`: Apache Arrow file format. Efficient - columns are in rows (so you can fetch individual variables without loading all data) and the content of variables is compressed.
 - `.sas7bdat`: SAS's own file format. Many programs (R, Stata, ...) can interact with them, but only very slowly. Use SAS to export to other formats.


Notes on data extraction process 

- Start with SAS and export raw .sas7bdat files to, e.g., .csv files. 
- Use R to export .csv files to .parquet files (faster, smaller) 
