/**********************************************************
    # Data Source to Get Latest AL 2023 AMI
**********************************************************/
data "aws_ami" "latest_al_2023_ami" {
    most_recent = true
    owners      = ["amazon"]

    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-2.0.????????-x86_64-gp2"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "architecture"
        values = ["x86_64"]
    }

    filter {
        name   = "creation-date"
        values = ["2023*"]
    }
}

