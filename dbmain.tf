resource "aws_dynamodb_table" "logins" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "username"

  attribute {
    name = "username"
    type = "S"
  }

  tags = { Name = "Login Table" }
}
