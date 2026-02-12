variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-southeast-1"
}

variable "default_tags" {
  type = map(string)
  default = {
    project_id = "1001"
  }
}

variable "sqs_accident_queue_name" {
  type        = string
  default     = "z-dh-sqs-ap-southeast-1-accident-alerts"
  description = "The name of the SQS queue for alerts related to a device accident or unexpected event."
}
