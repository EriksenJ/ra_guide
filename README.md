
# Introduction 

RAs should have clear guidance for their work so they can focus on _getting_ work done rather than on _how_ to get work done. 

This page describes the general guidelines that I employ for my projects. The guidelines will be updated over time. 

The guidelines draw heavily on 

- _Code and Data for the Social Sciences: A Practitioners Guide_. Gentzkow and Shapiro (2014). [Link](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf) 
	- A general introduction to reproducibility  challenges that many social science researchers have faced, and how the two authors have tried to solve them in their lab. Emphasizes coding conventions, directories, and version control.  
- _Lab Manual_. Gentzkow and Shapiro. Updated over time. [Link](https://github.com/gslab-econ/lab-manual/wiki)
	- An updated version of their (2014) document aimed at their RAs. Includes information on workflows, coding, data handling, and paper and slide production internally in their lab. 
	- We particularly follow their approaches with respect to 
		- Workflow (using github issues) 


# Directories  

- Our projects are typically distributed locally and on a secure server.  The local project  might contain notes, literature reviews, code that doesn't need to run on a secure server, and paper drafts. The secure server project location will exist when the project requires the use of restricted access data (e.g., from Statistics Denmark). 
- We generally apply the rules from Gentzkow and Shapiro (2014), chapter 4: 
	1. Separate directories (folders) by function. 
	2. Separate files into inputs and outputs (and temporary files) 
	3. Make directories (folders) portable.
- Each (sub)component of a project should have its separate folder. A project with a literature review, presentation files, and a paper (draft) should contains at least those folders.  

```
lit_review/ 
presentations/
paper/
```

- All components containing code should have at least a `code`, `temp`, and `out` folder. For example, assume that the simple project contains a simulation exercise written in R showing the consistency of an econometric estimator. The code file outputs the graph `simulate_estimator_consistency_distribution.pdf`. The folders could look like 

```
consistency_simulation/
	code/ 
		simulate_estimator_consistency.R 
	temp/
	out/
		simulate_estimator_consistency_distribution.pdf
lit_review/ 
presentations/
paper/
```

- Raw data is stored in a separate folder. If more than one set of raw files exist, they should be separated into subfolders with meaningful names and possibly date of compilation (this is particularly relevant with compiled raw data from Statistics Denmark). 

```
buildraw/ 
	dst/
		dat1.sas7bdat
		dat2.sas7bdat
consistency_simulation/
	code/ 
		simulate_estimator_consistency.R 
	temp/
	out/
		simulate_estimator_consistency_distribution.pdf
lit_review/ 
presentations/
paper/
```



# Code 

- Scripts are named according to what they  do. 
	- _Example_: Assume we have written some code that cleans the raw `BEF` register data for use in subsequent analyses. The file (sh)could be named `clean_bef.R`. 
- Script outputs must contain the name of the producing script and be informative about content. 
	- _Example_: Assume the file `descriptives_main_sample.R` outputs two summary tables in LaTeX format. One is balance table with means and differences in means between treatment and control groups, and one contains general summary statistics for the full sample. These (sh)could be named `descriptives_main_sample_balance.tex` and `descriptives_main_sample_summary.tex`.
- When possible, use R to solve coding tasks. 


## R 

- We generally work with R for both data cleaning and analysis. 
- We follow the general guidelines in [Google's R Style Guide](https://google.github.io/styleguide/Rguide.xml) 
- Exceptions to style guide: 
	- We do not follow their naming conventions. Do not use dots, separate using underscores, keep code lower case. Example: `.CalcMeans()` should be `calc_mean()`.  
- Use the `rio` [package](https://cran.r-project.org/web/packages/rio/vignettes/rio.html) for data import/export. 
	- It supports a large number of filetypes and generally uses the most efficient IO tool for importing/exporting the file format.
- Use the `data.table` [package](https://stata2r.github.io/data_table/) for data wrangling. 
- [Introduction to data.table](https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html) from the authors of the package. 
	- Introduction for Stata users:  https://stata2r.github.io/data_table/
	- [data.table chapter](https://bookdown.org/ronsarafian/IntrotoDS/datatable.html) in Introduction to Data Science. 
- Use For estimating most types of statistical models, and particularly linear and IV models with fixed effects, we use the `fixest` [package](https://lrberge.github.io/fixest/) by Laurent Berge. It provides estimation tools typically much faster than other options in R and Stata. 
- For saving regression tables, we use the `modelsummary()` 


# Data storage 

- When possible, store data in `.parquet` format. 
- We often work with large administrative data files that can take up many Gb of space. To reduce our server footprint and increase IO speed we generally prefer using the `parquet` format. This is a so-called columnar format, meaning that it is possible to load  These are generally highly compressed 
- We can import and export `.parquet` files using `R` and `python`. Hadley Wiggins, the developer behind the large parts of the `tidyverse` packages, has written an online book [chapter](https://r4ds.hadley.nz/arrow) on using `parquet` files with R. 
- In R, we will often use the following syntaxes to import or export a full dataset: 

```
library(rio) 
dat = import("builddata/out/clean_bef.parquet")
dat |> export("builddata/out/clean_bef.parquet")
```


# Ensuring Reproducibility 

- All results in projects should be reproducible. In a simple project with a couple of R scripts this could be ensured by having a `master.R` script that runs all the scripts. But this often becomes too cumbersome in projects involving more than a few scripts and/or large datasets that need to be processed. 

## Build tool - MAKE 

- Build tools generally help run your project code in the right order based on a set of rules that specify output targets and inputs, including code files. Some examples of more advanced build tools include `snakemake`, and `cmake`. While great, I have generally found that these modern build tools are not available on the secure servers hosted at Statistics Denmark, where a substantial part of my project code resides.  
- We generally use the slightly more archaic `make`. 
- Documentation for `make` is available [here](https://www.gnu.org/software/make/manual/make.html). 
- Helpful introductions to `make` for data analysis 
	- [Automation and Make](https://swcarpentry.github.io/make-novice/) by Software Carpentry. 
	- [Makefiles for R/Latex projects](https://robjhyndman.com/hyndsight/makefiles/) by Rob Hyndman.
	- [Minimal make](https://kbroman.org/minimal_make/) by Karl Broman. Runs a couple of R scripts and creates a latex compiled pdf paper with the resulting figures.  
	- [GNU Make for Reproducible Data Analysis](http://zmjones.com/make/) by Zachary Jones. 
- An important feature of `make` is that it compiles or runs project code based on a general recipe, the `makefile`.  The `makefile` consists of _targets_, _dependencies_, and _commands_, which together defines _rules_.   A `makefile` can contain multiple rules. These rules can be linked, for example, if a rule uses the target of another rule as a dependency. 
	- _Target_: The output file or goal you want to achieve. E.g., `builddata/out/clean_data.parquet`
	- _Dependencies_: Files or targets that must be up-to-date before executing the target's commands. This will typically include the code file you want to run, and the data it uses. E.g., `builddata/code/clean_data.R`, and `buildraw/out/rawdata.csv`. 
	- _Command_: The command(s) that `make` will execute to create or update the target. `make` basically runs from the command line meaning that you must either use a command that is available from the CLI or specify the full path to the program. If, for example,  you want to run an r script, you can use the CLI command `rscript` when this is installed. 

```
#target: dependencies
#	command

builddata/out/clean_data.parquet: builddata/code/clean_data.R buildraw/out/rawdata.csv
	rscript builddata/code/clean_data.R
```

- Make `make` run your command 
	1. Navigate a command line tool, such as `cmd` to the project folder where the makefile is located.
	2. In the command line, type `make target`, where target is the file you want to build.  E.g., `make builddata/out/clean_data.parquet`. 
- How `make` runs your command:  
	- When you tell `make` to create a target, `make` first checks the dependencies for that rule. If a dependency is itself a target from another rule, `make`moves back to this previous rule. This continuous until `make` finds the antecedent dependencies. 
	- `make` then checks the timestamps of antecedent dependencies. If the dependencies have not changed since the target was last created, `make` won't re-run the commands for that target. If the target does not exist, the command is always run. 
	- `make` will the move through the linked set of dependencies, running the commands from rules where dependencies have changed since the target was last created. 
	- `make` will let you know before it tries to run if a dependency does not exist and there exists no rule to create it. 
- Installation: 
	- `make` is usually pre-installed on Unix-based systems (like macOS and Linux). For Windows, you can install it through tools like Cygwin, GNUWin32, or `rtools`. 
- Important syntax notes: 
	- _Indentation_: Make sure to use a tab, not spaces, for indentation in the Makefile.
	- _Multiple Languages_: If your workflow involves Stata or SAS scripts, you can include them in the Makefile just like R scripts. For instance, `stata -b do my_analysis.do` for a Stata script.
- Line splitting with many dependencies 
	- If you file contains many dependencies it can be useful to split the dependency list over multiple lines. You can do this by writing ` \` and continuing the content on the next line after an indentation. If you include anything, include a space, after the backslash, `make` will throw an error. 

```
builddata/out/clean_data.parquet: \
	builddata/code/clean_data.R \
	buildraw/out/rawdata.csv
	rscript builddata/code/clean_data.R
```

- Many targets
	- A file may create multiple outputs, such as regression tables. To specify this, you simple add all targets to the left of `:`

```
builddata/out/clean_data1.parquet builddata/out/clean_data2.parquet : \
	builddata/code/clean_data.R \
	buildraw/out/rawdata.csv
	rscript builddata/code/clean_data.R
```

- Automatic variables 
	- `make` allows you to use [automatic variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html) in rules.
		- `$@`: The name of the target 
		- `$<`: The name of the first prerequisite
		- `$^`: The names of all the prerequisites, with spaces between them

```
builddata/out/clean_data.parquet: \
	builddata/code/clean_data.R \
	buildraw/out/rawdata.csv
	rscript $<
```

- Creating variables 
	- Creating variables can be useful, for example, for creating build rules or listing all targets you want to build. 
	- Variables can be assigned with `:=`. E.g., `var := name1`
	- Variables can be called using `$(variablename)`
	- You can append to a variable by adding `$(variablename)` on the right hand side of the assignment name; `var := $(var) name2`. 

```
R := C:\Users\bxn825\scoop\shims\rscript.exe

builddata/out/clean_data.parquet: \
	builddata/code/clean_data.R \
	buildraw/out/rawdata.csv
	$(R) $<
```

- Creating build rules with many targets (phony targets)  
	- The rule `all: $(targets)` is often used to run all rules you want in a project, when the variable `$(targets)` contains a set of targets in your project. 
	- You can use `.PHONY` to explicitly declare `all` (and other non-file targets) as a phony target. This tells `make` that this target isn't a file but rather a label for a recipe to be executed. 

```
R := C:\Users\bxn825\scoop\shims\rscript.exe

$(targets) := builddata/out/clean_data.parquet
builddata/out/clean_data.parquet: \
	builddata/code/clean_data.R \
	buildraw/out/rawdata.csv
	$(R) $<

$(targets) := $(targets) builddata/out/clean_data.parquet 
builddata/out/clean_data.parquet: \
	builddata/code/clean_data.R \
	buildraw/out/rawdata.csv
	$(R) $<

.PHONY: all 

all: $(targets)
```



# Tasks 

- We generally follow the workflow [approach](https://github.com/gslab-econ/lab-manual/wiki/Workflow) from Gentzkow and Shapiro. 
- Tasks will be specified on github under the relevant project as `issues`. We do this to keep track of open tasks and output from tasks. You can familiarize yourself with github issues [here](https://github.com/features/issues). 
- Each task will contain 
	- A description. 
	- A main set of outcomes to be fulfilled when the task is completed. 
	- A  task supervisor 
- When working on a task 
	- Keep documentation of your work. We suggest having a `running_notes.md` document where you store your notes with forth running dates (top of the document is the latest entry). 
- Asking clarifying questions 
	- It will often be necessary to ask additional clarifying questions when working on a task. 
	- If you ask in person, add a note about the questions and answers to the github issue page so that we can keep track of what we discuss. 
	- You can also ask for clarifications under the github issue. 
- A task is closed by the task supervisor when 
	- The relevant outcomes have been created/reached. 
	- The task assignee has written up a reply to the github issue of how the task was completed, and where outcome files are located (e.g., the code that cleans a relevant bit of data). 
	- The task supervisor agrees that the task has been completed. 


# Reporting and notes 

## Format 

- When you report on a task or write notes or documentation, the preferred output format is markdown files ending in `.md`. These can easily be compiled into pdfs, word documents, or other relevant format using `pandoc` or `quarto`.  
- Markdown files can be edited using most text editors. We suggest VS Code and Obsidian. 


# Software suggestions 

Linh T. Tô has a great set of (free) resources on her website ([link](https://linh.to/resources/). 

- VS Code 
	- A general text editor great for all things from developing python, R, or markdown document. 
	- Has great version control features included 
	- You can add functionality by installing extensions. Some favorite extensions 
		- Git History
		- Github Copilot (free for academic users) 
		- Grammarly (for the non-native English writers) 
		- LaTeX workshop
		- Markdown All in One 
		- Python
		- Quarto 
		- R (consider using this together with `radian`)
		- Stata Enhanced  
	- Installation with `scoop` on windows: `scoop install vscode`
- Obsidian 
	- A markdown-based digital note editor with latex compilation to pdf ready out of the box.  
	- Some suggested plugins 
		- LaTeX Suite 
		- Linter 
		- Obsidian Git 
		- Templater 
		- Zotero Integration
- Scoop - Installing software on Windows 
	- A command line tool for windows to help you install and keep software updated. 
	- Working on University provided IT equipment can give update and installation problems if you do not have administrator rights over the computer. I presently use the powershell command-line tool `scoop` to manage the installation of most software on my system. 