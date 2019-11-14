# iTerm2 configuration
# --------------------
#tried this command for display full path in iTerm2
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# python environments
# -------------------
alias py36from0719="source /Users/houben/phd/python/venvs/py36from0719/bin/activate"


# PYTHONPATHS and CO
# ------------------
# Setting PYTHONPATH for own modules
#PYTHONPATH="/Users/houben/PhD/python/scripts/spectral_analysis:$PYTHONPATH"
#export PYTHONPATH
# Manually set path for miniconda
PATH="/Users/houben/miniconda2/bin:$PATH"
export PATH
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
alias python3=python3
# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Mac Ports
# ---------
# MacPorts Installer addition on 2018-05-24_at_15:54:30: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
. /Users/houben/miniconda2/etc/profile.d/conda.sh


# Programm Shortcuts
# ------------------

# Bash Shortcuts
# --------------
alias ll='ls -al'
#bind '"\C-p": shell-backward-kill-word'

# Git shortcuts
alias gs='git stage .'
alias gc='git commit -m '
alias gps='git push'
alias gpl='git pull'

# OGS run Shortcuts
# -----------------
# open ogs from anywhere and insert path of file
alias ogs="/Users/houben/PhD/ogs5/executable/ogs5_bugfix_RWPT"
# open ogs from wd and insert name of file
alias ogss="/Users/houben/PhD/ogs5/executable/execute.sh"
# open ogs for multiple runs in subdirectories from current working directory
alias ogsmulti="/Users/houben/PhD/python/scripts/ogs_multi_folder/ogs_multi_folder.py"
# removes ogs results and ogs input files. Will ask for user input!
alias ogsremove="/Users/houben/PhD/bash/scripts/remove_ogs_input_and_output.sh"

# Other Applications shortcuts
# ----------------------------
alias gmsh="/Applications/Gmsh.app/Contents/MacOS/gmsh"
# OGS Data Explorer: Neue Version
alias ogsgui="/Users/houben/PhD/executables_scripts/ogs_data_explorer/DataExplorer"
# OGS Data Explorer: Alte Version
# alias ogsgui="/Applications/ogs-gui.app"
# imgcat
alias img="imgcat"

# executables and scripts shortcuts
# ---------------------------------
alias gmsh2ogs="/Users/houben/PhD/executables_scripts/ogs_data_explorer/GMSH2OGS"
alias checkmesh="/Users/houben/PhD/executables_scripts/ogs_data_explorer/checkMesh"

# remote servers
# --------------
# Eve UFZ
alias evew="sshfs houben@141.65.122.13:/work/houben/ /Users/houben/Desktop/eve_work"
alias evewu="umount -f /Users/houben/Desktop/eve_work"
alias eveh="sshfs houben@141.65.122.13:/home/houben/ /Users/houben/Desktop/eve_home"
alias eved="sshfs houben@141.65.122.13:/data/MultiMoSi/houben/ /Users/houben/Desktop/eve_data"
alias eve="ssh houben@frontend1.eve.ufz.de"
alias evex="ssh -Y houben@frontend1.eve.ufz.de"
alias ejectall="'osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)''"
# FZ Juelich supercomputers
alias judac="ssh houben1@judac.fz-juelich.de"
alias jureca="ssh houben1@jureca.fz-juelich.de"
alias jurecao="sshfs houben1@jureca.fz-juelich.de:/p/home/jusers/houben1/jureca /Users/houben/Desktop/jureca"
alias juron="ssh houben1@juron.fz-juelich.de"

# misc shortcuts
# --------------
alias aus="sudo shutdown -h +1"
alias hallo="echo 'Hallo zurück!'"

# bash scripts
# ------------
alias geo2ogsmesh="/Users/houben/PhD/bash/scripts/gmshmesh_gmsh2ogs.sh"

# python scripts
# --------------
# plot shortcuts
# h = head
# o = ogs
# g = gw_model (DeRooij 2012)
# u = unconfined
# c = confined
# t = transient
# s = steady state
alias hogcs="/Users/houben/PhD/python/scripts/head_ogs_vs_gw-model/confined/execute.sh"
alias hogus="/Users/houben/PhD/python/scripts/head_ogs_vs_gw-model/unconfined/execute.sh"
# open a script to execute a script in all subdirectories. Enter file extension for which will be searched and name of script.
alias scriptmulti="/Users/houben/PhD/python/scripts/script_multi_folder/script_multi_folder.py"

# others
# ------
# added this line to export path for GMT but lead to complications with usual commands
#export PATH="/Applications/GMT-5.4.5.app/Contents/Resources/bin"

# export colors for iTerm2
# -----------------------
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export PATH="/usr/local/sbin:$PATH"
# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/houben/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/houben/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/houben/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/houben/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
