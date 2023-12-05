## Install required software for research assistants using scoop 
## - The file assumes you have scoop installed 

# Uncomment to setup scoop if not already installed
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
# irm get.scoop.sh | iex

# add scoop bucket "extras"
scoop install git
scoop bucket add extras
Scoop bucket add r-bucket https://github.com/cderv/r-bucket.git

# install required software 
scoop install vscode
scoop install r 
scoop install rstudio
scoop install rtools
scoop install tinytex
scoop install pandoc
scoop install quarto
scoop install zotero