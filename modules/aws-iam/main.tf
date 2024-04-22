resource "aws_iam_instance_profile" "test_profile" {
  name = var.instance-profile-name
  role = aws_iam_role.iam-role.name
}

resource "aws_iam_role" "iam-role" {
  name               = var.iam-role
  assume_role_policy = file("${path.module}/iam-role.json")
} 

resource "aws_iam_role_policy" "iam-policy" {
  name   = var.iam-policy
  role   = aws_iam_role.iam-role.id
  policy = file("${path.module}/iam-policy.json")
}

