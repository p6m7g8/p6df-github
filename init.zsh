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

  local org_repo
  for org_repo in $(cat $P6_DFZ_SRC_P6M7G8_DIR/p6github/conf/current); do
    local ou
    local repo
    ou=$(echo $org_repo | cut -f 1 -d /)
    repo=$(echo $org_repo | cut -f 2 -d /)

    p6_github_util_repo_clone_or_pull "$ou" "$P6_DFZ_SRC_DIR" "$repo"
  done
}

######################################################################
#<
#
# Function: p6df::modules::github::home::symlink()
#
#>
######################################################################
p6df::modules::github::home::symlink() {

  ln -fs $P6_DFZ_SRC_DIR/.config/gh/config.yml conf/config.yml
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