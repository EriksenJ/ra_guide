---
title: Guide for Research Assistants 
author: Jesper Eriksen
date: last-modified
---

# Introduction 

RAs should have a clear set of rules to guide their work so that they can focus on _getting_ work done rather than coordinating with their project manager on _how_ to get work done. 

This page contains my guidelines for how I would like research assistants to work on my projects. The guidelines have been honed from a lot of different 

A general guideline is the baseline. If a particular project specifies guidelines, then these supersede the general guidelines. 


## Reproducibility 

All results in projects should be reproducible. There are multiple ways to ensure replicability. In a simple project containing only a couple of R scripts, this could entail having a `master.R` file that runs the code files.  

For code run in the project, this entails having a `makefile` that allow us to run all relevant project code from the command line with the command `make all`. 


## Version management 



## Project folder structure and setup 

My projects are typically distributed locally and on a secure server. The secure server project location will exist when the project requires the use of restricted access data (e.g., from Statistics Denmark). The local folder contains notes on project development, literature reviews, and paper drafts. 

The general rule for the local and external project folders are that each component of the project should have its separate folder. All components containing code should have at least a `code`, `temp`, and `out` folder. Raw data is stored in its separate folder, preferably with time information. 


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