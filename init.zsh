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

  local org
  for org in $(cat $P6_DFZ_SRC_P6M7G8_DIR/p6github/conf/current); do
    p6_GLOBAL_github_api_org_repos_clone "$org"
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

  alias p6df_ghs="p6_github_cli_submit"
  alias p6df_ghpl="p6_github_gh_pr_list"
  alias p6df_ghpc="p6_github_gh_pr_checkout"

  alias ghl=p6df_ghpl
  alias ghc=p6df_ghpc
}

######################################################################
#<
#
# Function: p6_GLOBAL_github_api_org_repos_clone(org)
#
#  Args:
#	org -
#
#>
######################################################################
p6_GLOBAL_github_api_org_repos_clone() {
  local org="$1"

  p6_github_api_org_repos_clone "$org" "$P6_DFZ_SRC_DIR"
}
