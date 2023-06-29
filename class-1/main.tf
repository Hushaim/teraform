resource "aws_iam_user" "user" {
  name = "fari"
}

resource "aws_iam_user" "user2" {
  name = "fari2"
}


resource "aws_iam_group" "group" {
  name = "engernier"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user.name,
    aws_iam_user.user2.name,
  ]

  group = aws_iam_group.group.name
}