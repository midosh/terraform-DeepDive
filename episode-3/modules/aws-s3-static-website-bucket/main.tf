# Terraform configuration

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  acl    = "public-read"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = var.tags
}

resource "aws_s3_bucket_object" "object_index" {
  acl          = "public-read"
  key          = "index.html"
  bucket       = aws_s3_bucket.s3_bucket.id
  source       = "assets/index.html"
  etag         = filemd5("assets/index.html")

}

resource "aws_s3_bucket_object" "object_error" {
  acl          = "public-read"
  key          = "error.html"
  bucket       = aws_s3_bucket.s3_bucket.id
  source       = "assets/error.html"
  etag         = filemd5("assets/error.html")

}

