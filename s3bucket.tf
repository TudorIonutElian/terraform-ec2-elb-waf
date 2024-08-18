resource "aws_s3_bucket" "elb_project_s3bucket" {
    bucket = "elb-project-bucket-load-balancer-ec2-logs"
}