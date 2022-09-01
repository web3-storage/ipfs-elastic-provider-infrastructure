terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.38"
    }
  }

  required_version = ">= 1.0.0"
}

resource "aws_dynamodb_table" "blocks_table" {
  name         = var.blocks_table.name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "multihash"
  attribute {
    name = "multihash"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled     = true
    # TODO: Enable after sharing decrypt permissions with required stacks
    # kms_key_arn = var.target_key_arn
  }
}

resource "aws_dynamodb_table" "cars_table" {
  name         = var.cars_table.name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "path"
  attribute {
    name = "path"
    type = "S"
  }
  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled     = true
    # TODO: Enable after sharing decrypt permissions with required stacks
    # kms_key_arn = var.target_key_arn
  }
}
