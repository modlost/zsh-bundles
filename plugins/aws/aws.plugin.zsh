export AWS_HOME=~/.aws

function aws-profile-list {
  echo $AWS_DEFAULT_PROFILE
}

function aws-profile-set {
  export AWS_DEFAULT_PROFILE=$1
}

function aws-profile-list {
  grep profile ~/.aws/config | sed -e 's/\[profile \(.*\)\]/\1/g'
}

compctl -K aws-profile-list aws-profile-set aws-profile-list

completer="/usr/local/aws/bin/aws_zsh_completer.sh"
[ -x $completer ] && source $completer
