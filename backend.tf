terraform {
  backend "s3" {
    bucket = "vikash-training"
    key    = "vikash.tfstate"
    region = "ap-south-1"
  }
}
