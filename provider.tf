provider "aws" {
  region = "ap-northeast-1"
  access_key = local.AWS_ACCESS_KEY_ID
  secret_key = local.AWS_SECRET_ACCESS_KEY
}