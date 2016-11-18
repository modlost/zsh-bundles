export AWS_HOME=~/.aws

function agp {
  echo $AWS_DEFAULT_PROFILE
}

function asp {
  export AWS_DEFAULT_PROFILE=$1
}

function alp {
  grep profile ~/.aws/config | sed -e 's/\[profile \(.*\)\]/\1/g'
}

compctl -K agp asp alp

completer="/usr/local/aws/bin/aws_zsh_completer.sh"
[ -x $completer ] && source $completer
