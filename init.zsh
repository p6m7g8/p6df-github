p6df::modules::github::version() { echo "0.0.1" }
p6df::modules::github::deps()    { 
	ModuleDeps=(
		p6m7g8/p6github
	)
}

p6df::modules::github::external::brew() { 

  brew install hub
}

p6df::modules::github::langs() {

  local org
  for org in $(cat $P6_DFZ_SRC_P6M7G8_DIR/p6github/conf/orgs); do
    p6_GLOBAL_github_api_org_repos_clone "$org"
  done

}

p6df::modules::github::home::symlink() { }

p6df::modules::github::init() {

    eval "$(hub alias -s)"
}

p6_GLOBAL_github_api_org_repos_clone() {
  local org="$1"

  p6_github_api_org_repos_clone "https://github.com" "https://api.github.com" "$org" "$P6_DFZ_SRC_DIR" "" 8
}
