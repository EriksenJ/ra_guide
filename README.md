
# Introduction 

RAs should have a clear set of rules to guide their work so they can focus on _getting_ work done rather than coordinating with their project manager on _how_ to get work done. 

This page contains my guidelines for how I would like research assistants to work on my projects. The guidelines have been honed from a lot of different 

A general guideline is the baseline. If a particular project specifies guidelines, then these supersede the general guidelines. 


# Reproducibility 

All results in projects should be reproducible. There are multiple ways to ensure replicability. In a simple project containing only a couple of R scripts, this could entail having a `master.R` file that runs the code files.  


## Build tool - MAKE 

Build tools generally help run your project code in the right order based on a set of rules that specify output targets and inputs, including code files. Some examples of more advanced build tools include `snakemake`, and `cmake`. While great, I have generally found that these modern build tools are not available on the secure servers hosted at Statistics Denmark, where a substantial part of my project code resides.  

Instead, I generally use the slightly more archaic `make`.  Documentation for `make` is available [here](https://www.gnu.org/software/make/manual/make.html). 

An important feature of `make` is that it compiles or runs project code based on a general recipe, the `makefile`.  The `makefile` consists of _targets_, _dependencies_, and _commands_, which together defines _rules_.   A `makefile` can contain multiple rules. These rules can be linked, for example, if a rule uses the target of another rule as a dependency. 

- _Target_: The output file or goal you want to achieve. E.g., `builddata/out/clean_data.parquet`
- _Dependencies_: Files or targets that must be up-to-date before executing the target's commands. This will typically include the code file you want to run, and the data it uses. E.g., `builddata/code/clean_data.R`, and `buildraw/out/rawdata.csv`. 
- _Command_: The command(s) that `make` will execute to create or update the target. `make` basically runs from the command line meaning that you must either use a command that is available from the CLI or specify the full path to the program. If, for example,  you want to run an r script, you can use the CLI command `rscript` when this is installed. 

```
#target: dependencies
#	command

builddata/out/clean_data.parquet: builddata/code/clean_data.R buildraw/out/rawdata.csv
	rscript builddata/code/clean_data.R
```

Make `make` run your command 

1. Navigate a command line tool, such as `cmd` to the project folder where the makefile is located.
2. In the command line, type `make target`, where target is the file you want to build.  E.g., `make builddata/out/clean_data.parquet`. 

How `make` runs your command: 
 
- When you tell `make` to create a target, `make` first checks the dependencies for that rule. If a dependency is itself a target from another rule, `make`moves back to this previous rule. This continuous until `make` finds the antecedent dependencies. 
- `make` then checks the timestamps of antecedent dependencies. If the dependencies have not changed since the target was last created, `make` won't re-run the commands for that target. If the target does not exist, the command is always run. 
- `make` will the move through the linked set of dependencies, running the commands from rules where dependencies have changed since the target was last created. 
- `make` will let you know before it tries to run if a dependency does not exist and there exists no rule to create it. 

Installation: 

- `make` is usually pre-installed on Unix-based systems (like macOS and Linux). For Windows, you can install it through tools like Cygwin, GNUWin32, or `rtools`. 

Important syntax notes: 

- _Indentation_: Make sure to use a tab, not spaces, for indentation in the Makefile.
- _Multiple Languages_: If your workflow involves Stata or SAS scripts, you can include them in the Makefile just like R scripts. For instance, `stata -b do my_analysis.do` for a Stata script.

Line splitting with many dependencies 

- If you file contains many dependencies it can be useful to split the dependency list over multiple lines. You can do this by writing ` \` and continuing the content on the next line after an indentation. If you include anything, include a space, after the backslash, `make` will throw an error. 

```
builddata/out/clean_data.parquet: \
	builddata/code/clean_data.R \
	buildraw/out/rawdata.csv
	rscript builddata/code/clean_data.R
```

Many targets

- A file may create multiple outputs, such as regression tables. To specify this, you simple add all targets to the left of `:`

```
builddata/out/clean_data1.parquet builddata/out/clean_data2.parquet : \
	builddata/code/clean_data.R \
	buildraw/out/rawdata.csv
	rscript builddata/code/clean_data.R
```


Automatic variables 

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

Creating variables 

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

Creating build rules with many targets (phony targets)  

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