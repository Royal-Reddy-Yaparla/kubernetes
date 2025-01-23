resource "aws_s3_bucket" "eks-s3" {
  bucket = "eks-cluster-robokart-s3"
  force_destroy = true
  tags = {
    Name        = "eks-cluster-robokart-s3"
  }
}

resource "aws_dynamodb_table" "eks-table" {
  name           = "eks-cluster-backend"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "EksID"

  attribute {
    name = "EksID"
    type = "S"
  }
  
  tags = {
    Name        = "eks-cluster-backend"
  }
}