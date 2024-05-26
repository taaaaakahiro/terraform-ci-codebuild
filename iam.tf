//todo
resource "aws_iam_role" "s3_role" {
  name = "s3_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  # Optional: Attach a policy to the role
  inline_policy {
    name = "s3_policy"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "s3:*"
          ]
          Resource = [
            "arn:aws:s3:::example-bucket",
            "arn:aws:s3:::example-bucket/*"
          ]
        }
      ]
    })
  }
}

output "role_arn" {
  value = aws_iam_role.s3_role.arn
}
