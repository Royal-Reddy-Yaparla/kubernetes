resource "aws_s3_bucket" "eks-s3" {
  bucket = "eks-control-plane-s3"
  force_destroy = true
  tags = {
    Name        = "eksctl-control-plane"
  }
}

resource "aws_dynamodb_table" "eks-table" {
  name           = "eks-control-plane-backend"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  
  tags = {
    Name        = "eks-control-plane-backend"
  }
}