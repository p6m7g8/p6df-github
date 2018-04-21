p6df::modules::github::version() { echo "0.0.1" }
p6df::modules::github::deps()    { 
	ModuleDeps=()
}

p6df::modules::github::external() { 

 # brew install hub
}

p6df::modules::github::init() {

    eval "$(hub alias -s)"
}

p6df::modules::github::init
