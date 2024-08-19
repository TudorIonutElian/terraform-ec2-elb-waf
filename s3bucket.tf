resource "aws_s3_bucket" "elb_project_s3bucket" {
  bucket = "elb-project-bucket-load-balancer-ec2-logs"
}

resource "aws_s3_bucket_policy" "elb_project_s3bucket_policy" {
  bucket = aws_s3_bucket.elb_project_s3bucket.id

  policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "AllowPutObject",
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:PutObject",
                "Resource": "arn:aws:s3:::elb_load_balancer/*"
            }
        ]
    }
    EOF
}