data "aws_caller_identity" "current" {}


resource "aws_sqs_queue" "sqs_accident" {
  name = var.sqs_accident_queue_name
  tags = var.default_tags
}

resource "aws_sqs_queue_policy" "sqs_accident_policy" {
  queue_url = aws_sqs_queue.sqs_accident.id
  policy    = data.aws_iam_policy_document.sqs_policy_doc.json
}

data "aws_iam_policy_document" "sqs_policy_doc" {
  statement {
    sid    = "OwnerAccountAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions = [
      "SQS:*"
    ]

    resources = [
      aws_sqs_queue.sqs_accident.arn
    ]
  }
}


resource "aws_sqs_queue" "new_queue" {
  name = "z-dh-sqs-ap-southeast-1-new_queue"
  tags = var.default_tags
}



resource "aws_sqs_queue" "new_queue2" {
  name = "z-dh-sqs-ap-southeast-1-new_queue2"
  tags = var.default_tags
}


