resource "aws_s3_bucket" "blog_content" {
  bucket        = "serverless-api-content"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "blog_content_policy" {
  bucket = aws_s3_bucket.blog_content.id
  policy = data.aws_iam_policy_document.blog_content_policy.json
}

data "aws_iam_policy_document" "blog_content_policy" {

  statement {
    principals {
      type        = "AWS"
      identifiers = [var.lambda_exec_iam_arn]
    }

    actions = [
      "s3:*",
    ]

    resources = [
      aws_s3_bucket.blog_content.arn,
      "${aws_s3_bucket.blog_content.arn}/*",
    ]
  }
}
