######################################################################
#<
#
# Function: p6df::modules::github::deps()
#
#>
######################################################################
p6df::modules::github::deps() {
  ModuleDeps=(
    p6m7g8/p6github
    p6m7g8/p6df-git
  )
}

######################################################################
#<
#
# Function: p6df::modules::github::vscodes()
#
#>
######################################################################
p6df::modules::github::vscodes() {

  # vc/github/git
  code --install-extension eamodio.gitlens
  code --install-extension GitHub.vscode-codeql
  code --install-extension GitHub.vscode-pull-request-github
}

######################################################################
#<
#
# Function: p6df::modules::github::external::yum()
#
#>
######################################################################
p6df::modules::github::external::yum() {

  wget https://github.com/cli/cli/releases/download/v1.8.0/gh_1.8.0_linux_amd64.tar.gz -O - | tar xz
  sudo mv gh_1.8.0_linux_amd64/bin/gh /usr/bin/gh
}

######################################################################
#<
#
# Function: p6df::modules::github::external::brew()
#
#>
######################################################################
p6df::modules::github::external::brew() {

  brew install gh
}

######################################################################
#<
#
# Function: p6df::modules::github::langs()
#
#>
######################################################################
p6df::modules::github::langs() {

  p6df::modules::github::langs::clones
}

######################################################################
#<
#
# Function: p6df::modules::github::langs::clones()
#
#>
######################################################################
p6df::modules::github::langs::clones() {

  p6df::modules::github::langs::clones::focused
  p6df::modules::github::langs::clones::forked
  # p6df::modules::github::langs::clones::misc
}

######################################################################
#<
#
# Function: p6df::modules::github::langs::clones::focused()
#
#  Environment:	 P6_DFZ_SRC_FOCUSED_DIR P6_DFZ_SRC_P6M7G8_DIR
#>
######################################################################
p6df::modules::github::langs::clones::focused() {

  local org_repo
  for org_repo in $(cat $P6_DFZ_SRC_P6M7G8_DIR/p6github/conf/focused); do
    local ou
    local repo
    ou=$(echo $org_repo | cut -f 1 -d /)
    repo=$(echo $org_repo | cut -f 2 -d /)

    p6_github_util_repo_clone_or_pull "$ou" "$P6_DFZ_SRC_FOCUSED_DIR" "$repo"
  done
}

######################################################################
#<
#
# Function: p6df::modules::github::langs::clones::misc()
#
#  Environment:	 P6_DFZ_SRC_MISC_DIR P6_DFZ_SRC_P6M7G8_DIR
#>
######################################################################
p6df::modules::github::langs::clones::misc() {

  local org_repo
  for org_repo in $(cat $P6_DFZ_SRC_P6M7G8_DIR/p6github/conf/misc); do
    local ou
    ou=$(echo $org_repo | cut -f 1 -d /)

    p6_github_util_org_repos_clone "$org" "$P6_DFZ_SRC_MISC_DIR"
  done
}

######################################################################
#<
#
# Function: p6df::modules::github::langs::clones::forked()
#
#  Environment:	 USER
#>
######################################################################
p6df::modules::github::langs::clones::forked() {

  p6_github_util_org_repos_clone "$USER" "$P6_DFZ_SRC_FORKED_DIR"
}

######################################################################
#<
#
# Function: p6df::modules::github::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::github::home::symlink() {

  echo ln -fs $P6_DFZ_SRC_DIR/.config/gh/config.yml conf/config.yml
  #  ln -fs $P6_DFZ_SRC_DIR/.config/gh/config.yml conf/config.yml
}

######################################################################
#<
#
# Function: p6df::modules::github::init()
#
#>
######################################################################
p6df::modules::github::init() {

  p6df::modules::github::aliases::init
}

######################################################################
#<
#
# Function: p6df::modules::github::aliases::init()
#
#>
######################################################################
p6df::modules::github::aliases::init() {

  alias p6df_ghs="p6_github_gh_pr_submit"
  alias p6df_ghpl="p6_github_gh_pr_list"
  alias p6df_ghpc="p6_github_gh_pr_checkout"
  alias p6df_ghpC="p6_github_gh_pr_comment"
  alias p6df_ghpm="p6_github_gh_pr_merge"

  alias ghl=p6df_ghpl
  alias ghc=p6df_ghpc
  alias ghC=p6df_ghpC
  alias ghm=p6df_ghmp
}
