variable "instance_type" {
    type = string
    default = "t2.xlarge"
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "env" {
    type = string
    default = "dev"
}

variable "cluster_name" {
    type = string
    default = "custom-vpc-cluster"
}

variable "cluster_version" {
    type = string
    default = "1.25"
}

variable "vpc_id" {
    type = string
    default = ""
}

variable "subnet_ids" {
    type = list(string)
    default = []
}

variable "enable_velero" {
    type = string
    default = "yes"
}

variable "enalbe_ALB" {
    type = string
    default = "yes"
}

variable "enalbe_statefulness" {
    type = string
    default = "yes"
}

variable "admin_aws_auth_roles" {
    type = list(string)
    default = []
}

variable "dev_aws_auth_roles" {
    type = list(string)
    default = []
}

# Varibale for alb-controller


variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled."
}

variable "service_account_name" {
  type        = string
  default     = "aws-load-balancer-controller"
  description = "ALB Controller service account name"
}

variable "helm_chart_name" {
  type        = string
  default     = "aws-load-balancer-controller"
  description = "ALB Controller Helm chart name to be installed"
}

variable "helm_chart_release_name" {
  type        = string
  default     = "aws-load-balancer-controller"
  description = "Helm release name"
}

variable "helm_chart_version" {
  type        = string
  default     = "1.5.3"
  description = "ALB Controller Helm chart version."
}

variable "helm_chart_repo" {
  type        = string
  default     = "https://aws.github.io/eks-charts"
  description = "ALB Controller repository name."
}

variable "namespace" {
  type        = string
  default     = "kube-system"
  description = "Kubernetes namespace to deploy ALB Controller Helm chart."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "settings" {
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values."
}