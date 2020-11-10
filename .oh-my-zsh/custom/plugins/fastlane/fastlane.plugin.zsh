_fastlane_complete() {
  local word completions
  word="$1"

  # look for Fastfile either in this directory or fastlane/ then grab the lane names
  file="fastlane/sources/RSBWorkflow.rb"

  # parse 'beta' out of 'lane :beta do', etc
  completions=`cat $file | grep "^\s*lane \:" | awk -F ':' '{print $2}' | awk -F ' ' '{print $1}'`

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _fastlane_complete f
