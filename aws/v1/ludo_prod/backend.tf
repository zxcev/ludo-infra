terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "tf-state-management-x2se2"
    key            = "terraform/ludo/prod/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
