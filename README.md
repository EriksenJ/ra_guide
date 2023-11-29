
# Introduction 

RAs should have a clear set of rules to guide their work so they can focus on _getting_ work done rather than coordinating with their project manager on _how_ to get work done. 

This page contains my guidelines for how I would like research assistants to work on my projects. The guidelines have been honed from a lot of different 

A general guideline is the baseline. If a particular project specifies guidelines, then these supersede the general guidelines. 


# Reproducibility 

All results in projects should be reproducible. There are multiple ways to ensure replicability. In a simple project containing only a couple of R scripts, this could entail having a `master.R` file that runs the code files.  


## Build tool - MAKE 

Build tools generally help run your project code in the right order based on a set of rules that specify output targets and inputs, including code files. Some examples of more advanced build tools include `snakemake`, and `cmake`. While great, I have generally found that these modern build tools are not available on the secure servers hosted at Statistics Denmark, where a substantial part of my project code resides.  

Instead, I generally use the slightly more archaic `make`. `make` is usually pre-installed on Unix-based systems (like macOS and Linux). For Windows, you can install it through tools like Cygwin, GNUWin32, or `rtools`. 

### How Does `make` Work?

- **Makefile**: The core of `make` is the `Makefile`, a text file that specifies how to compile and link a program (in software development) or, in your case, how to run and process statistical analyses.
- **Targets and Dependencies**: In a Makefile, you define "targets" and their dependencies. A target is usually a file that is created by running specific commands. Dependencies are files or other targets that need to be up-to-date before the current target can be processed.
- **Commands**: For each target, you also define the commands that need to be executed to produce that target from its dependencies.


### Detailed Makefile Structure

A Makefile typically consists of several blocks of code, each defining a target, its dependencies, and the commands to execute. Here's a basic structure:

makefile

`target: dependencies     command`

- **Target**: The output file or goal you want to achieve.
- **Dependencies**: Files or targets that must be up-to-date before executing the target's commands.
- **Command**: The command(s) that `make` will execute to create or update the target.

#### Example Makefile for a Research Project

Suppose you have a project with the following workflow:

1. **Data Cleaning** (`clean_data.R`): Cleans raw data (`data.csv`) and produces a cleaned data file (`cleaned_data.csv`).
2. **Analysis** (`analysis.R`): Performs analysis on the cleaned data and produces an analysis output (`analysis_output.csv`).
3. **Report Generation** (`report.Rmd`): Generates a report (`report.html`) from the analysis output using R Markdown.

Your Makefile might look like this:

makefile

`# Final Report report.html: analysis_output.csv report.Rmd     Rscript -e "rmarkdown::render('report.Rmd')"  # Analysis Output analysis_output.csv: cleaned_data.csv analysis.R     Rscript analysis.R  # Cleaned Data cleaned_data.csv: data.csv clean_data.R     Rscript clean_data.R`

#### Breakdown of the Example

- **Cleaned Data**: The `cleaned_data.csv` target depends on `data.csv` and `clean_data.R`. If either of these files changes, running `make cleaned_data.csv` will re-run the `clean_data.R` script.
- **Analysis Output**: Similarly, `analysis_output.csv` depends on the `cleaned_data.csv` and `analysis.R`. Changes in these will trigger the re-running of `analysis.R`.
- **Final Report**: Finally, the `report.html` file depends on the `analysis_output.csv` and `report.Rmd`. Updating either of these will lead to the re-generation of the report.

#### Additional Notes

- **Indentation**: Make sure to use a tab, not spaces, for indentation in the Makefile.
- **Efficiency**: `make` checks the timestamps of dependencies. If a dependency hasn't changed, `make` won't re-run the commands for that target.
- **Multiple Languages**: If your workflow involves Stata or SAS scripts, you can include them in the Makefile just like R scripts. For instance, `stata -b do my_analysis.do` for a Stata script.

#### Advanced Makefile Features

As you become more comfortable with `make`, you can explore advanced features like pattern rules, variables, and functions to make your Makefile more efficient and easier to maintain.


## Version management 



# Project structure and setup 

My projects are typically distributed locally and on a secure server.  The local folder contains notes on project development, literature reviews, and paper drafts. The secure server project location will exist when the project requires the use of restricted access data (e.g., from Statistics Denmark). 

Each (sub)component of a project should have its separate folder. A project with a literature review, presentation files, and a paper (draft) should contains at least those folders.  

```
lit_review/ 
presentations/
paper/
```

All components containing code should have at least a `code`, `temp`, and `out` folder. For example, assume that the simple project contains a simulation exercise written in R showing the consistency of an econometric estimator. The code file outputs the graph `simulate_estimator_consistency_distribution.pdf`. The folders could look like 

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

Raw data is stored in its separate folder, preferably with an indicator for when the raw data was added to the storage location.  


## Each script has one purpose - its name 

Rule: The name of a script should explain what the script does. 

For example, I have written some code that cleans the raw `BEF` register data for use in subsequent analyses. The file that does this should be named `clean_bef.R`. 





# Tasks 

Projects often start from a simple model. 

## Task management 

## Reporting on tasks 




# Coding 

We will write most of our project code in a combination of R, Stata, and SAS (the latter for registry data). 

We generally apply the 

RA Guide on [github](https://raguide.github.io/appendix/learning) has compiled a list of resources on what it implies to be a RA, how to get the most of the experience, and guides on how to work as a RA. 

- What does an academic RA do: Often a substantial amount of data cleaning and descriptive statistics, working in Stata, R, and with git. 

A general introduction to working with `git` is available at 


# Suggestions 

Linh T. Tô has a great set of (free) resources on her website ([link](https://linh.to/resources/). 


## VS Code 

VS Code is a general text editor great for all things from developing python, R, or markdown document. You can add functionality by installing plugins. 

Some favorite plugins 

- 

Installation with `scoop` on windows 

```{ps}
scoop install vscode
```


## Obsidian 

Obsidian is an elegant (markdown-based) digital note editor with latex compilation to pdf ready out of the box.  

## Installing software on Windows 

Working on University provided IT equipment can give update and installation problems if you do not have administrator rights over the computer. 

I presently use the powershell command-line tool `scoop` to manage the installation of most software on my system. 


# Resources 

## Other RA guidelines 


Research assistant guidelines from others 

- Gentzkow and Shapiros 
- https://raguide.github.io/appendix/learning