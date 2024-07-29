resource "aws_dynamodb_table" "visit_counter" {
  name           = "VisitCounter"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "CounterID"

  attribute {
    name = "CounterID"
    type = "S"
  }
}