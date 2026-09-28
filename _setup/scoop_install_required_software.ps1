## Install required software for research assistants using scoop
## - Assumes scoop is installed (https://scoop.sh)
## - Safe to re-run: already-installed programs and buckets are skipped

# Uncomment to set up scoop if not already installed
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
# irm get.scoop.sh | iex

# git is needed before scoop can add buckets
scoop install git
scoop bucket add extras
scoop bucket add r-bucket https://github.com/cderv/r-bucket.git

# ---- required software ----
scoop install vscode
scoop install r
scoop install rstudio
scoop install rtools
scoop install python
scoop install make
scoop install tinytex
scoop install pandoc
scoop install quarto
scoop install zotero

# ---- optional but useful ----
scoop install gh       # GitHub CLI: issues and pull requests from the terminal
scoop install duckdb   # duckdb command line, for testing SQL outside R

# ---- radian (R console used with the VSCode R extension) ----
python -m pip install -U radian

# ---- R packages ----
Rscript -e "install.packages(c('pacman', 'rio', 'here', 'data.table', 'tidyverse', 'fixest', 'modelsummary', 'kableExtra', 'arrow', 'duckdb', 'languageserver'), repos = 'https://cloud.r-project.org')"

# ---- VSCode extensions ----
$extensions = @(
    'donjayamanne.githistory',
    'GitHub.copilot',
    'James-Yu.latex-workshop',
    'yzhang.markdown-all-in-one',
    'ms-python.python',
    'quarto.quarto',
    'REditorSupport.r',
    'kylebarron.stata-enhanced',
    'DougFinke.vscode-pandoc'
)
foreach ($ext in $extensions) { code --install-extension $ext }

# ---- remaining manual steps ----
Write-Host ""
Write-Host "Done. Remaining manual steps:"
Write-Host "  1. git config --global user.name  'Your Name'"
Write-Host "     git config --global user.email 'you@example.com'"
Write-Host "  2. gh auth login"
Write-Host "  3. In VSCode settings, enable r.bracketedPaste and point r.rterm.windows to radian"
Write-Host "  4. Install Better BibTeX in Zotero and set the citekey formula (see README)"
Read-Host "Press Enter to close"
