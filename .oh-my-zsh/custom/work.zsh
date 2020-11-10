alias template='cookiecutter gh:rosberry/swift-project-template'
alias es='emacs -nw'
f() { bundle exec fastlane "$@" }

module() {
    generamba gen $1 rsb_swift_mvp_vm_module --module_path Classes/Presentation/Modules
}

service() {
    generamba gen $1 rsb_swift_service --module_path Classes/BusinessLogic/Services
}

alias firebase_staging='f rsb_firebase --env stg'

# RUBY
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# NPM
export PATH=~/.npm-global/bin:$PATH
