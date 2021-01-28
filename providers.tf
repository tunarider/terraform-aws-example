provider "aws" {
  region                  = "ap-northeast-2"
  shared_credentials_file = pathexpand("~/.aws/credentials")
  profile                 = "aws-example"
}
