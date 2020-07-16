function from-json-to-sh-params {
  cat $1 | python3 -c 'import sys, json; print(" ".join(["{}={}".format(a["ParameterKey"], a["ParameterValue"]) for a in json.load(sys.stdin)]))'
}

function create-stack {
  aws cloudformation create-stack         \
    --region sa-east-1                    \
    --stack-name $1                       \
    --template-body file://$2             \
    --parameters file://$3                \
    --capabilities CAPABILITY_NAMED_IAM   \
    --capabilities CAPABILITY_NAMED_IAM

  # wait until creation finishes
  aws cloudformation wait stack-create-complete --stack-name $1
}

function update-stack {
  aws cloudformation update-stack        \
    --region sa-east-1                    \
    --stack-name $1                      \
    --template-body file://$2            \
    --parameters file://$3               \
    --capabilities CAPABILITY_IAM        \
    --capabilities CAPABILITY_NAMED_IAM
}

function deploy-stack {
  local STACK_PARAMS="$(from-json-to-sh-params $3)"
  aws cloudformation deploy              \
    --region sa-east-1                   \
    --stack-name $1                      \
    --template-file $2                   \
    --parameter-overrides $STACK_PARAMS  \
    --capabilities CAPABILITY_IAM        \
    --capabilities CAPABILITY_NAMED_IAM
}

function delete-stack {
  aws cloudformation delete-stack     \
    --region sa-east-1                \
    --stack-name $1

  # wait until delete finishes
  aws cloudformation wait stack-delete-complete --stack-name $1
}

function load-config {
  local CURRENT_DIR="$(dirname "$0")"
  source $CURRENT_DIR/../config.sh
}