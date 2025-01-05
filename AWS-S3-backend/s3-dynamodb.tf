resource "aws_s3_bucket" "eks-s3" {
  bucket = "eksctl-practice"
  force_destroy = true
  tags = {
    Name        = "eksctl-practice"
  }
}

resource "aws_dynamodb_table" "eks-table" {
  name           = "aws-eks-backend"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "EksID"

  attribute {
    name = "EksID"
    type = "S"
  }
  
  tags = {
    Name        = "aws-eks-backend"
  }
}