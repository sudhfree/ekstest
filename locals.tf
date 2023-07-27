locals {
  name   = basename(path.cwd)
  region = var.region

  vpc_cidr           = "10.0.0.0/16"
  secondary_vpc_cidr = "10.99.0.0/16"
  azs                = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Blueprint  = local.name
    GithubRepo = "github.com/aws-ia/terraform-aws-eks-blueprints"
  }
  velero_s3_backup_location = "${module.velero_backup_s3_bucket.s3_bucket_arn}/backups"

  name_prefix = "cluster-role"

}
