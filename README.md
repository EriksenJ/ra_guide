
# Introduction 

This page describes the general RA guidelines we employ for our projects. The purpose of the guidelines is to make it easier to focus on doing replicable and properly documented work. The guidelines draw heavily on Gentzkow and Shapiro's work on reproducible research:

- _Code and Data for the Social Sciences: A Practitioners Guide_. Gentzkow and Shapiro (2014). [Link](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf) 
	- The document contains a general introduction to reproducibility challenges that many social science researchers have faced and how the two authors have tried to solve them in their lab. Emphasizes coding conventions, directories, and version control.  
- _Lab Manual_. Gentzkow and Shapiro. [Link](https://github.com/gslab-econ/lab-manual/wiki) — supplements the 2014 document with workflows, coding, data handling, and paper/slide production. We follow their workflow approach (e.g., using GitHub issues to assign and resolve tasks).


## Onboarding checklist 

Talk with your supervisor about which tasks make sense for you, then work through the following:

- Read [Gentzkow and Shapiro (2014)](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf).
- Read this document. You do not have to follow links the first time; they are there for reference.
- Install the required software — see [Software / Required](#required).
- Set up Git and a GitHub account — see [Version Control](#version-control).
- Setup Claude Code account. 
- Ask your supervisor to add you to the relevant projects on GitHub and Zotero.
- Get to know R — see [Learn R](#learn-r).

After these steps, we will assign tasks to you via the GitHub project(s). 

Optional 

- Go through DST server exercises. 
- Go through github exercises. 

# Workflow 

## Tasks 

- We follow Gentzkow and Shapiro's workflow [approach](https://github.com/gslab-econ/lab-manual/wiki/Workflow). - Tasks will be specified on GitHub under the relevant project as `issues`. We do this to keep track of open tasks, task notes, task  questions, and outputs. You can familiarize yourself with GitHub issues [here](https://github.com/features/issues). 
- Each task will contain 
	- A description. 
	- A set of outcomes. 
	- A task supervisor. 
	- One or more task assignees.
- When working on a task 
	- Keep documentation of your work. We suggest having a `running_notes_(your initials).md` document where you store your thoughts. Keep this in the project dropbox folder. Our experience is that headlines with dates (e.g., 2026-09-28) makes it easier to go back to find thoughts related to a task you previously worked on.  
- Ask questions 
    - We encourage you to work independently but ask questions when you realize you are stuck or something seems unclear. We all get stuck. And it happens particularly often when we start working with the administrative data, so do come around and ask. Our experience is that RAs who ask questions early on are more productive in the long run.
    - If you ask about clarifications or questions related to a task in person, add a note about the questions and answers to the GitHub issue so we can track the progress.  
- A task is closed by the task supervisor when 
	- The relevant outcomes have been created/reached. 
	- The task assignee has written a reply to the GitHub issue on how they completed the task and where relevant outcome files are located (e.g., the code file cleaning a bit of data or the note summarizing results). 
	- The task supervisor agrees that the task is completed. 

## Reporting and notes 

- We write notes in markdown format (files ending in `.md`) whenever possible. Reach for another format only when the task genuinely requires it (e.g., a collaborative live document, or a paper that must be in LaTeX). 
	- Markdown documents can easily be compiled into Word, PDF (via LaTeX), HTML, beamer PDF slides, or other formats using `pandoc` or `quarto`. 
	- Markdown files are plain text, so they play well with Git: diffs are readable, merges are tractable, and full history is preserved. 
	- Searching (and replacing) across multiple markdown files for content using typical text editors is easy. 
	- Markdown files can be edited using most text editors. We suggest VSCode. 
	- [Introduction to basic markdown syntax](https://www.markdownguide.org/basic-syntax/) written by the developers behind the original markdown language (it comes in many flavors).
- We keep personal running-notes documents. 
	- These typically contain thoughts and drafts for notes and tasks. 
	- The document will typically be named `personal_notes/log_*.md` and end in our initials, e.g., `personal_notes/log_je.md`.  

## References 

Zotero 

- We use Zotero to maintain shared libraries with project references.  
   - We use the `betterbiblatex` extension for Zotero to export `.bib` files to projects or to Overleaf. 
- When adding a new reference to a Zotero project collection, pin the bibtex key. 
  - Right-click the reference and select `better bibtex` -> `pin citekey`.
  - Remember to set up the `better bibtex` extension to use the correct citekey structure. See `Software / Required / Zotero`. 

Papers, reports, etc. 

- We store pdf's (or other formats) of papers, files, etc. in the `literature/` folder. 

## Writing papers and collaborative documents 

- For interactive, real-time collaborative documents we use **Overleaf** or **Google Docs**. 
	- **Overleaf** for papers and anything else written in LaTeX. It lets us work on the paper simultaneously and integrates references from shared Zotero libraries. 
	- **Google Docs** for lighter-weight collaborative writing — meeting notes taken jointly, quick drafts to circulate, or documents shared with collaborators outside the group who don't use LaTeX or markdown. 
- For everything else — personal notes, task write-ups, README-style documentation — prefer markdown tracked in Git (see *Reporting and notes*).

# Version Control 

Git 

- We use Git to track changes whenever possible — code, notes, paper sources, configuration. If a file can live in a Git repository, put it there. 
   - Git lets you add, delete, or modify files, mark them as changed (committing), and finally publish them (pushing to the remote repository), with the full change history preserved. See the [Git version control system overview](https://github.com/gslab-econ/lab-manual/wiki/Code). 
- We use GitHub to host our remote repositories for _non-sensitive_ project files. 
    - You can keep the local non-sensitive project files where you prefer on your computer. 
    - You will pull and push changes to this remote directory to update general project files.  
- We use a local Git repository for content stored on secure servers. 
- **What NOT to put in Git.** GDPR-sensitive microdata (never commit — even locally in a repo that might sync to GitHub), large binary data that can be regenerated, and generated outputs like `temp/` and `out/` folders. Add these to `.gitignore` from the start of a project.
- **`.gitignore` essentials.** Every project should have a `.gitignore` at its root covering, at minimum: `temp/`, `out/`, `*.log`, `.Rhistory`, `.RData`, `.Rproj.user/`, `.DS_Store`, credentials files, and any local paths to raw data. GitHub's [gitignore template collection](https://github.com/github/gitignore) has starting points for R, Python, and LaTeX.

A basic Git workflow: 

1. Pull latest updates from the remote repository.
2. Make changes to the files you are working on. 
3. Commit your changes. 
 4. Add a reference to the task you are working on in the commit message if relevant. You do this by adding adding a reference to the task-number, e.g.,  ` #123 Add peer-group-control robustness regression - (text)`, in front of the commit message.  (Read Chris Beams' article on good commit messages). 
4. Pull the latest updates from the remote repository and resolve any conflicts. 
5. Push your changes to the remote repository. 

**Branching and pull requests.** 

When you start work on a task — a new analysis, a nontrivial edit, an experiment you are not sure will pan out — create a branch for it rather than committing straight to `master`/`main` if you are working outside the Dropbox folder. 
    - Name the branch after the task, e.g., `je-issue-123-peer-group-robustness` or `clean-bef-fix`. 
    - Commit and push freely on the branch. 
    - When the work is ready for review, open a pull request (PR) on GitHub. Link the PR to the issue it resolves by including `Closes #123` (or `Fixes #123`) in the PR description — GitHub will auto-close the issue when the PR is merged.
    - The task supervisor reviews the PR, requests changes if needed, and merges when the work is done. Discussion of the *task* stays on the issue; discussion of the *code* stays on the PR.
    - This keeps `master` in a working state, makes it easy to abandon dead ends, and gives the supervisor a clear diff to review.
    - For tiny changes (a typo, a one-line note update) committing directly to `master` is fine.
- Guides 
	- Basic (takes about 20 minutes total and well worth it): [Git Handbook](https://guides.github.com/introduction/git-handbook/), [Understanding the GitHub Flow](https://guides.github.com/introduction/flow/), [Mastering Issues](https://guides.github.com/features/issues/), [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
	- Detailed: [Pro Git](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control), [Version Control with Git](https://www.amazon.com/Version-Control-Git-collaborative-development-ebook/dp/B008Y4OR3A/ref=mt_kindle?_encoding=UTF8&me=&qid=1531951134), Chapters 4-9
	- [Writing good Git commit messages](https://cbea.ms/git-commit/) by Chris Beams.  


# Project storage structure 

We use a combination of University-secure storage, Dropbox, Githup repositories and secure servers at Statistics Denmark.  The local project might contain notes, literature reviews, code that doesn't need to run on a secure server, and paper drafts. The secure server project location will exist when the project requires restricted access data (e.g., from Statistics Denmark).

- Getting started
  - Your project supervisor will help you set up access.
  - Before getting access to DST register data, you must read and sign the internal UCPH ECON and Statistics Denmark guidelines on working with sensitive data.
  - We follow the UCPH ECON guidelines on working with sensitive data, including what information can be downloaded from the secure server. 
- Sensitive local project files  - KU-secure storage 
    - We keep local sensitive files on a secure drive at UCPH.  Supervisors can give you access to the relevant folders.
- Dropbox 
    - We use Dropbox to store large files that are non-sensitive and must be accessed locally. Examples include paper pdf's and raw data files.
- Sensitive DT register data 
    - GDPR-sensitive microdata (e.g., administrative data from Statistics Denmark and the Ministry of Education) is stored on a secure server hosted at Statistics Denmark.
    - Documentation on Statistics Denmark's researcher data access and storage: <https://www.dst.dk/en/TilSalg/Forskningsservice>.
- Github private repositories for non-sensitive local project files
    - Non-sensitive project files live in private GitHub repositories (one per project), so all project participants have access and file history is preserved. See [Version Control](#version-control) for the workflow.

## Directories  structure - generally

- We generally apply the rules from Gentzkow and Shapiro (2014), chapter 4: 
	1. Separate directories (folders) by function. 
	2. Separate files into inputs and outputs (and temporary files) 
	3. Make directories (folders) portable.
- Each (sub)component of a project should have its separate folder. A project with a literature review, presentation files, and a paper (draft) should contain at least those folders.  

```
lit_review/ 
presentations/
paper/
```

- All folders containing code should have at least a `src`, `temp`, and `out` folder. For example, assume that the simple project contains a simulation exercise written in R showing the consistency of an econometric estimator. The code file outputs the graph `simulate_estimator_consistency_distribution.pdf`. The folders could look like 

```
consistency_simulation/
	src/ 
		simulate_estimator_consistency.R 
	temp/
	out/
		simulate_estimator_consistency_distribution.pdf
lit_review/ 
presentations/
paper/
```

- We store raw data in a separate folder. 
  - Suppose we have more than one raw data set, for example, from Statistics Denmark and the Ministry of Education. We then separate them into subfolders with meaningful names and possibly a date of compilation so we can keep track of versions. 

```
buildraw/ 
	dst/
		demo_fixed.sas7bdat
		dat2.sas7bdat
consistency_simulation/
	src/ 
		simulate_estimator_consistency.R 
	temp/
	out/
		simulate_estimator_consistency_distribution.pdf
lit_review/ 
presentations/
paper/
```


## Data formats  

- When possible, store data in `.parquet` format. 
  - `.parquet` files are typically substantially smaller than `.csv` or `.dta` files, so we can reduce our server footprint. 
  - Reading/writing `.parquet` files in R is typically a lot faster than `.csv` and `.dta`. 
- We can import and export `.parquet` files using `R` and `python`. 
  - [Guide to using `parquet` with R](https://arrow.apache.org/cookbook/r/index.html) by Apache. 
  - [Guide to using `parquet` with R](https://r4ds.hadley.nz/arrow) by Hadley Wickham. 
- In R, we will often use the `rio` package to import/export a dataset: 

```
library(rio) 
dat = import("builddata/out/clean_bef.parquet")
dat |> export("builddata/out/clean_bef.parquet")
```

## R projects 

- We use R projects to help RStudio determine where to run our R scripts. 
  - The R-project file must be located at the root of the project directory. 
  - Read about working with scripts and R projects [here](https://r4ds.had.co.nz/workflow-scripts.html).


# Code Conventions  


## General 

- Name scripts by what they do. 
	- _Example_: We have written code that cleans the raw `BEF` register data for use in subsequent analyses. The file (sh)could be named `clean_bef.R`. 
- Script outputs must contain the name of the producing script and be informative about the content. 
	- _Example_: Assume the file `describe_main_sample.R` outputs two summary tables in LaTeX format. One is a balance table with means and differences in means between treatment and control groups, and one contains general summary statistics for the full sample. These (sh)could be named `describe_main_sample_balance.tex` and `describe_main_sample_summary.tex`.
- Keep lines under 100 characters (set your editor's margin to 100). Break long lines with the language's continuation syntax — `///` in Stata, `...` in Matlab, a plain newline inside brackets/parens in R and Python.
- Keep functions under about 200 lines.


## Data validation 

Silent errors from bad joins or upstream data changes are the most common source of hard-to-track bugs in register work. A script that produces a wrong table without erroring is worse than one that crashes.

Every non-trivial build script should assert its assumptions and fail loudly on violations:

- **Row counts** after each join or filter (expected vs. actual).
- **Key uniqueness** on tables that should have one row per unit.
- **No unexpected `NA`s** in downstream-critical variables.
- **Value ranges** where they matter (e.g., `ALDER` between 0 and 120).

In R, `stopifnot()` is the simplest tool. Log the checked counts as you go so reviewers can see what the script produced:

```r
n_bef    = nrow(bef)
n_joined = nrow(joined)
message(sprintf("bef: %d rows, joined: %d, dropped: %d",
                n_bef, n_joined, n_bef - n_joined))
stopifnot(
    n_joined >= 0.95 * n_bef,                     # at most 5% drop
    !anyDuplicated(joined, by = c("PNR", "AAR")), # key uniqueness
    !any(is.na(joined$PERINDKIALT13))             # required variable present
)
```

For SQL pipelines, run a follow-up `SELECT COUNT(*)` (or similar) and assert in R:

```r
n_after = dbGetQuery(con, "SELECT COUNT(*) AS n FROM joined")$n
stopifnot(n_after == expected_n)
```

When a validation fails, fix the query — do not just update the expected value.


## R 

- We follow [Google's R Style Guide](https://google.github.io/styleguide/Rguide.html) 
- Exceptions to style guide: 
	- Use `snake_case` for function and variable names (lowercase, words separated by underscores). Example: prefer `calc_mean()` over `CalcMean()`.
- Use the `rio` [package](https://cran.r-project.org/web/packages/rio/vignettes/rio.html) for data import/export. 
    - It supports many file types and generally uses the most efficient IO tool for importing/exporting the file format.
- **Data wrangling — pick the tool by where the data lives:**
	- **On-disk parquet at register scale**: SQL in duckdb (see [Larger than memory datasets](#larger-than-memory-datasets)).
	- **In-memory `data.frame`**: use [`data.table`](https://stata2r.github.io/data_table/) for anything non-trivial. It is much faster than base R or `dplyr` at scale, has a compact syntax once you learn it, and matches most of our existing code.
	- **Quick exploration on small tables**: `dplyr` is fine.
- `data.table` resources:
	- [Introduction to data.table](https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html) — from the package authors.
	- [Introduction for Stata users](https://stata2r.github.io/data_table/).
	- [data.table chapter](https://bookdown.org/ronsarafian/IntrotoDS/datatable.html) in *Introduction to Data Science*.
	- [data.table cheatsheet](https://raw.githubusercontent.com/rstudio/cheatsheets/master/datatable.pdf).
- Use the `fixest` [package](https://lrberge.github.io/fixest/) by Laurent Berge for estimating most types of statistical models, particularly linear and IV models with fixed effects, when possible.
	- It provides estimation tools typically much faster than other options in R and Stata.
	- Linear, fixed effects, and 2SLS models can be estimated via `feols()`.  
	- [Documentation](https://lrberge.github.io/fixest/). 
- We typically use the `modelsummary` [package](https://modelsummary.com) for summarizing regression results and creating summary statistics tables outputted to latex or markdown format. 
	- An introduction is available [here](https://modelsummary.com). 
	- When adding footnotes to `modelsummary()` tables, use the `footnote()` function from the `kableExtra` package with the options `escape = F` and `threeparttable = T`.
- We use the [`here` package](https://here.r-lib.org/) when specifying paths to ensure all paths are read relative to the project folder. 


### Larger than memory datasets 

Register data (BEF, IND, UDDA, ...) is often too large to load into R at once. Rather than fighting for RAM, keep the data on disk as `.parquet` and query it with `duckdb` — a lightweight SQL engine that reads parquet natively and only materializes what you actually need. You can drive it from R either with dplyr verbs (via `to_duckdb()` / `dbplyr`) or with SQL directly.

**Our default: SQL for anything on-disk, R for anything in-memory.**

When you are working with a parquet file that is register-sized or larger, write the transformation in SQL and let duckdb run it against the parquet. Only `collect()` into R once the result is small enough to reason about interactively — typically after your final `GROUP BY`.

Reach for dplyr-in-duckdb (`to_duckdb()`) only when you are exploring — poking at a dataset to figure out what SQL you eventually want to write. The moment the analysis becomes reproducible pipeline code, port it to SQL.

Why this default:

- Multi-register joins, lags, and sample construction are all cleaner in SQL than in dbplyr, and dbplyr silently `collect()`s some operations (like window functions) — surprising if you expect them to stay on disk.
- A SQL string is version-controllable, copy-pasteable, and readable by anyone who reads SQL — a dplyr chain is not portable outside R.
- Consistency across projects: any RA reading a build script sees SQL, not a mix.

Keep using R (base, `data.table`, `fixest`, `ggplot2`) for everything downstream of `collect()`: modeling, plotting, small-table manipulation.

**Getting started**

- Grant McDermott's [Data wrangling with DuckDB](https://grantmcdermott.com/duckdb-polars/duckdb-sql.html) — the recommended entry point. Covers dplyr and SQL modes side by side, so you can see when each is more natural.
- The `duckdb_intro/duckdb_sql_intro.qmd` document in this repository — a hands-on walkthrough on simulated BEF- and IND-style data that you can run without DST access.
- [awesome-arrow-r](https://github.com/thisisnic/awesome-arrow-r) — reference for the `arrow` + `duckdb` combination.
- Official [DuckDB SQL reference](https://duckdb.org/docs/sql/introduction).

**Example: dplyr verbs on a parquet file**

```r
# load packages 
library(duckdb)
library(tidyverse)
library(arrow) 

# create and/or connect to an existing database file (the name doesn't matter) 
db = dbConnect(duckdb(), "database.duckdb")

# open a connection to the parquet file and treat it as a duckdb database, 
# selecting only the three variables we need 
dat_db = open_dataset("path_to_data.parquet") %>% 
    to_duckdb() %>% 
    select(id, group = Group, salary)

# find number of distinct groups 
dat_db %>% summarise(n_groups = n_distinct(group))

# average salary by group 
dat_db %>% summarise(ave_salary = mean(salary, na.rm = T), .by = c(group))

# plot average salary by group 
dat_db %>% 
    summarise(ave_salary = mean(salary, na.rm = T), .by = c(group)) %>% 
    ggplot(aes(group, ave_salary)) + 
    geom_point() 

# pull observations with salary above 1,000,000 DKK into R 
dat_highsal = dat_db %>% 
    filter(salary > 1000000) %>% 
    collect() 

# inspect the query duckdb will run 
dat_db %>% 
    summarise(ave_salary = mean(salary, na.rm = T), .by = c(group)) %>% 
    explain() 
```

**Example: SQL for register-style work (join, aggregate, lag)**

The typical register task is: pull rows from one or more registers by ID and year, join them, and derive an outcome. Below we join demographics (`bef.parquet`) with annual income (`ind.parquet`) on `PNR` and `AAR`, filter to working-age respondents in 2010–2020, compute mean personal income (`PERINDKIALT13`) by age (`ALDER`) and year, and add each age group's prior-year mean as a lag using a window function partitioned by `ALDER`. The aggregated result is small enough to `collect()` and store as parquet.

```r
library(duckdb)
library(rio)

con = dbConnect(duckdb())

query = "
  WITH joined AS (
    SELECT b.PNR, b.AAR, b.ALDER, i.PERINDKIALT13
    FROM 'buildraw/dst/bef.parquet' b
    JOIN 'buildraw/dst/ind.parquet' i USING (PNR, AAR)
    WHERE b.ALDER BETWEEN 25 AND 60
      AND b.AAR   BETWEEN 2010 AND 2020
  )
  SELECT
    AAR,
    ALDER,
    AVG(PERINDKIALT13)                                             AS mean_income,
    LAG(AVG(PERINDKIALT13)) OVER (PARTITION BY ALDER ORDER BY AAR) AS mean_income_lag1,
    COUNT(*)                                                       AS n_obs
  FROM joined
  GROUP BY AAR, ALDER
  ORDER BY ALDER, AAR
"

result = dbGetQuery(con, query)

result |> export("builddata/out/mean_income_by_alder_year.parquet")

dbDisconnect(con, shutdown = TRUE)
```

Things this shows that dplyr-in-duckdb makes awkward:

- Direct parquet paths in `FROM` — no need to register tables first.
- A CTE (`WITH joined AS ...`) so the join is defined once and reused.
- `LAG(...) OVER (PARTITION BY ALDER ORDER BY AAR)` — window functions are much cleaner in SQL than in dbplyr.
- The final row count is small (AAR × ALDER), so `dbGetQuery` returns a plain `data.frame` straight into R.


# Learn R 


- **Getting started** — work through these in order:
  - Hans Henrik Sievertsen's [Introduction to R](https://github.com/hhsievertsen/Advanced_R/) — a short crash course with economics-related examples. Solve the associated exercises.
  - Atrebas' [introduction to `data.table`](https://atrebas.github.io/post/2020-06-17-datatable-introduction/) — viewing data, subsetting, creating variables, using `.SD`.
  - The `r_introduction.qmd` quarto document in this repository (`r_intro/`).
  - Grant McDermott's [introduction to `duckdb`](https://grantmcdermott.com/duckdb-polars/duckdb-sql.html) for working with large parquet files without loading them into R. `duckdb + dplyr` is often substantially faster than `data.table` or `dplyr` for simple wrangling and descriptive statistics.
- **Deeper references:**
  - [R for Data Science (2e)](https://r4ds.hadley.nz/) by Hadley Wickham — the go-to reference, free online, with chapters on data IO with [arrow](https://r4ds.hadley.nz/arrow), writing [functions](https://r4ds.hadley.nz/functions), and using [Quarto](https://r4ds.hadley.nz/quarto) to communicate results. Each chapter has exercises.
  - Hans Henrik Sievertsen's [Applied Econometrics with R](https://hhsievertsen.github.io/applied_econ_with_r/) — data cleaning, visualization, and regression (with `feols` and `modelsummary`). Good once you have the basics.
  - Hans Henrik Sievertsen's [Interactive introduction to R](https://hhsievertsen.shinyapps.io/r_introduction//#section-welcome) — data handling and plotting basics in your browser.
- ChatGPT often gives great solutions to coding problems.


# Automation and build tools


- We automate everything that can be automated. This implies writing scripts to do all data cleaning, analysis, and table formatting, and using build tools to run these scripts in the correct order.
- We use the build tool `make` to run all project code. 
	- Generally, we want to be able to delete all files in output folders, type `make all` on the command line, and have all output files reappear just as they were before. 


## Build tool - `make` 

- Build tool software gives us a "button" we can push that will run all of our code in the correct order. 
    - Simple build tools (e.g., an R file that runs other R files) run all code in the correct order from scratch and produces all outputs we need. 
    - Good build tools tracks which files have changed and therefore what code needs to be re-run if we change code somewhere in our project pipeline. 
- We use `make` because it is (almost) always available, including on the Statistics Denmark secure servers where more modern build tools like `snakemake` and `cmake` typically are not. Official documentation: <https://www.gnu.org/software/make/manual/make.html>.
- Make builds `targets` defined in a `makefile` by running code whenever `dependencies`. 
- Recommended tutorials for `make` for data analysis:
	- [Automation and Make](https://swcarpentry.github.io/make-novice/) — Software Carpentry.
	- [Makefiles for R/LaTeX projects](https://robjhyndman.com/hyndsight/makefiles/) — Rob Hyndman.
	- [Minimal make](https://kbroman.org/minimal_make/) — Karl Broman.
	- [GNU Make for Reproducible Data Analysis](http://zmjones.com/make/) — Zachary Jones.
- Installation: pre-installed on macOS/Linux. On Windows, install via Scoop with `scoop install make` (see [Software / Required](#required)).

### Anatomy of a make rule 

A `makefile` is a set of _rules_. Each rule has a **target** (the output file to build), **dependencies** (files that must exist and be up-to-date first), and a **command** (what to run to produce the target). When you type `make <target>`, `make` walks the dependency graph and re-runs commands only where a dependency has changed since the target was last built.

```
#target: dependencies
#	command

builddata/out/clean_data.parquet: builddata/src/clean_data.R buildraw/out/rawdata.csv
	Rscript builddata/src/clean_data.R
```

To build: open a terminal in the folder holding the makefile and type `make builddata/out/clean_data.parquet` (or just `make all` if you have set up an `all` target — see below).

**Two syntax gotchas:**

- **Indentation must be a tab, not spaces.** Most editors will let you configure this per-file.
- **Line continuation** uses a trailing `\`. Any character (even a space) after the `\` will break the build.

### Our conventions 

We use a small set of `make` features consistently. Each project makefile follows this pattern:

- Set an `R` variable pointing to the Rscript executable so the command line stays short. (Adapt with other code executables if you need them, e.g. for stata code)
- Use `$<` (the first dependency) in commands, so the target and the code file stay in sync.
- Split long dependency lists across lines with `\`.
- Accumulate output files in a `TARGETS` variable and define a phony `all: $(TARGETS)` at the bottom so `make all` rebuilds everything.

```
R := Rscript

TARGETS := 

TARGETS := $(TARGETS) builddata/out/clean_data1.parquet
builddata/out/clean_data1.parquet: \
	builddata/src/clean_data1.R \
	buildraw/out/rawdata.csv
	$(R) $<

TARGETS := $(TARGETS) builddata/out/clean_data2.parquet
builddata/out/clean_data2.parquet: \
	builddata/src/clean_data2.R \
	buildraw/out/rawdata.csv
	$(R) $<

.PHONY: all 

all: $(TARGETS)
```

For Stata/SAS scripts, swap the command (e.g., `stata -b do $<`). For other automatic variables (`$@` for the target, `$^` for all dependencies), see the [GNU make manual](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html).


### Subfolders 

When projects contain subfolders for distinct tasks, each subfolder should have a makefile. The main project folder makefile should then tell make to enter the subfolder and run the makefile there. We store makefile settings that are common for the project in makefile.env. 

- Assume the following folder structure and note that we have a makefile in each subfolder executable code. 

```
rawextract/ 
	dst/
		demo_fixed.sas7bdat
		dat2.sas7bdat
consistency_simulation/
	src/ 
		simulate_estimator_consistency.R 
	log/
    temp/
	out/
		simulate_estimator_consistency_distribution.pdf
    makefile
builddata/
    src/ 
        clean_demo_fixed.R 
    log/ 
    out/
        clean_demo_fixed.parquet
    makefile
makefile
makefile.env
```

- Content of the settings makefile.env

```
R := Rscript --quiet $< 1> log/$(basename $(notdir $<)).log 2>&1
```

- Content of the main makefile 

```
include makefile.env

.PHONY: all builddata consistency_simulation

all: builddata consistency_simulation 

builddata: 
    @echo entering builddata folder...
    $(MAKE) -C builddata 

consistency_simulation: 
    @echo entering consistency_simulation folder...
    $(MAKE) -C consistency_simulation 
```

- Content of the makefile in `builddata` 

```
include ../makefile.env

# targets 
TARGETS = 

TARGETS := $(TARGETS) out/clean_demo_fixed.parquet
out/clean_demo_fixed.parquet: \
    src/clean_demo_fixed.R \
    ../rawextract/out/demo_fixed.sas7bdat
    $(R)

# run all targets 

.PHONY: all

all: $(TARGETS)
```


# Software 

## Required 

If you work on a windows machine, consider installing the software using `scoop`. We have created a PowerShell executable file that installs all required software in one go for you. To run it: 

1. First [install scoop](https://scoop.sh/)
2. Download the file `scoop_install_required_software.ps1` from the `_setup` folder in this repository.
3. Right-click it and choose "run with powershell". 

The file then installs all the software. It also installs Python, radian, the R packages, and the VSCode extensions we use. You still need to point the VSCode R extension to radian (see `Python and radian` below) and install Better BibTeX in Zotero manually.  

List of required software 

- Git 
	- [Git](https://git-scm.com/) is a command-line version control software. See more under `Version Control`
	- Installation 
		- [Create a GitHub account and install the Git desktop/command line clients](https://help.github.com/articles/set-up-git/).
		- Installation via Scoop on Windows machines: `scoop install git`
- VSCode 
	- [VSCode](https://code.visualstudio.com/) is a general text editor you can use to edit markdown, Python, R, LaTeX, and many other file types. 
	- It has excellent Git version control features included 
	- Installation options: 
		- Follow Jeppe Druedahl's [guide to install VSCode](https://numeconcopenhagen.netlify.app/guides/python-setup/).
		- Install using Scoop on a Windows machine with `scoop bucket add extras; scoop install vscode` (see `Software/Suggestions` on using ). 
	- You can add functionality by installing extensions. Some extensions you'll likely want to install: 
		- Git History
		- GitHub Copilot (free for academic users - read more [here](https://docs.github.com/en/education/explore-the-benefits-of-teaching-and-learning-with-github-education/github-global-campus-for-students/apply-to-github-global-campus-as-a-student)) 
		- LaTeX workshop
		- Markdown All in One 
		- Python
		- Quarto 
		- R (consider using this together with `radian`)
		- Stata Enhanced
		- vscode-pandoc 
	- Guides: 
		- [Markdown and Visual Studio Code](https://code.visualstudio.com/docs/languages/markdown) 
	- We use `pandoc` or `quarto` to convert markdown files into Word, PDF (via LaTeX), beamer slides, or HTML files.
- R, RStudio, rtools
	- [R](https://www.r-project.org/) is an open-source statistical programming language that has gotten a lot of traction in the Econometrics community. The software that runs R code is also called `R` and most be installed on your computer (or server) to run R code. Most new developments in Econometrics are likely to arrive to R before Stata and has better tools for outputting tables/figures. 
	- [Rstudio](https://posit.co/products/open-source/rstudio/) is an editor specialized for R coding. We typically use RStudio whenever we edit R code on the server.  
	- [rtools](https://cran.r-project.org/bin/windows/Rtools/) is a set of software tools R will need to compile some packages, including the `arrow` package we use for parquet format IO. 
	- Installation options: 
		- [Installation guide for R and RStudio](https://posit.co/download/rstudio-desktop/) by Posit (the developers behind RStudio).
		- [Installation guide for rtools](https://cran.r-project.org/bin/windows/Rtools/) via CRAN. 
		- Installation via Scoop on Windows machines: `scoop bucket add r-bucket https://github.com/cderv/r-bucket.git; scoop install r; scoop install rstudio; scoop install rtools`
    - Guides to get started using R
        - [4h R crash course](https://github.com/hhsievertsen/Advanced_R/) by Hans H. Sievertsen. With Economics related examples 
        - [R for Data Science](https://r4ds.had.co.nz/) by Hadley Wickham and Garrett Grolemund.
- Python and radian 
	- [Python](https://www.python.org/) is a general programming language. We mainly need it to install [radian](https://github.com/randy3k/radian), an improved R console with syntax highlighting and autocompletion that works well with the VSCode R extension. 
	- Installation via Scoop on Windows machines: `scoop install python`, then `python -m pip install -U radian`. 
	- Point the VSCode R extension to radian: in VSCode settings, enable `r.bracketedPaste` and set `r.rterm.windows` to the path of `radian.exe` (type `(Get-Command radian).Source` in PowerShell to find it). 
- Make 
	- [Make](https://www.gnu.org/software/make/) is the build tool we use to run all project code. See [Automation and build tools](#automation-and-build-tools). 
	- Installation via Scoop on Windows machines: `scoop install make`
- Tinytex 
  - [Tinytex](https://yihui.org/tinytex/) is a lightweight LaTeX distribution that allows you to compile LaTeX documents to PDF.
  - Installation options: 
    - [Guide](https://yihui.org/tinytex/) from the developers.
    - Installation via Scoop on Windows machines: `scoop install tinytex`
- Pandoc 
	- [Pandoc](https://pandoc.org/index.html) is an open-source command line tool that can be used to convert between many different text formats. We will typically use it to convert between markdown and PDF/word documents. 
	- Installation options: 
		-  [Installation guide](https://pandoc.org/installing.html) from the developers. 
		- Installation via Scoop on Windows machines: `scoop install pandoc`
- Quarto 
	- [Quarto](https://quarto.org/) is a piece of software developed by Posit that allows you to write quarto documents containing both markdown text and integrated R, Python, or some other relevant code. The documents can be edited in RStudio or VSCode. Quarto documents are beneficial when some code requires extensive documentation.    
	- Installation options: 
		-  [Guide](https://quarto.org/docs/get-started/) from the developers. 
		- Installation via Scoop on Windows machines: `scoop install quarto`
- Zotero
	- [Zotero](https://www.zotero.org/) is an open-source reference manager. 
	- Allows easy export of bibtex reference libraries that can cited in markdown and latex documents.   
	- Installation options:
		- [Guide](https://www.zotero.org/download/) from the developers. 
		- Installation via Scoop on Windows machines: `scoop install zotero`
	- Install connectors: 
		- [Installation guide](https://www.zotero.org/download/connectors) from the Zotero developers.
	- Install relevant extensions 
		- [better bibtex](https://retorque.re/zotero-better-bibtex/)
			- Install using the guide at the link. 
			- Set bbt's citation key formula to `authEtAl + year + shorttitle(3,3)` by going to `preferences --> Better BibTex --> Open Better BibTex Preferences --> Citation Key`, and copy the formula in. 

## Suggestions 

- Scoop (windows)
	- A tool for Windows that helps you install and update software. 
	- Installation options: 
    	- [Guide](https://scoop.sh/) from the developers.
	- Working on university-provided IT equipment can give update and installation problems if you do not have administrator rights over the computer. This can be circumvented by ensuring that all (or most) programs are installed in your own user path. Scoop does this. 
	- We presently use the Powershell tool `scoop` to manage the installation of most software on my system. `scoop` uses recipes created by others to install (often) the latest versions of programs. 
	- Installing a program with `scoop` is as simple as `scoop install program`. 
	- Updating a program with `scoop` is as simple as `scoop update program`. Type `scoop update *` to update all installed programs.
	- Scoop searches for install recipes in buckets. Buckets can be added by typing `scoop bucket add ...` in Powershell. Examples of useful buckets include `extras`, `nerd-fonts`, and `r-bucket`. You can find an example of installing and using a `scoop` to set up a new Windows machine at `https://github.com/EriksenJ/_setup`. 
- Linh T. Tô has a great set of (free) resources on her [website](https://linh.to/resources/). 

