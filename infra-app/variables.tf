variable "env" {
    description = "This is the environment for project"
    type= string  
}
variable "bucket_name" {
    default = "dev"
    description = "This is the bucket name for Infra"
    type= string
}
variable "instance_count" {
    description = "Number of EC2 instances"
    type= number 
}
variable "instance_type" {
    description = "Type of EC2 instance"
    default = "t2.micro"
    type= string 
}
variable "ec2_ami_id" {
    description = "AMI ID for EC2 instance"
    default = "ami-0360c520857e3138f" #Ubuntu AMI
    type= string 
}
variable "ec2_root_storage_size" {
  description = "Size of root storage in GB"
  type        = number
  default     = 8
}
variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type        = string
  default     = "LockID"
}