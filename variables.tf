# If you want to make the configuration more flexible, 
# you can move the hardcoded values to variables
variable "virginia_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "tokyo_vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "virginia-network" {
  type = map(any)
  default = {
    vpcs = {
      virginia = {
        cidr = "10.41.0.0/16"
      }
    }
    subnets = {
      virginia-a-public = {
        cidr = "10.41.1.0/24"
        az = "us-east-1a"
        vpc = "virginia"
      }
      virginia-b-public = {
        cidr = "10.41.2.0/24"
        az = "us-east-1b"
        vpc = "virginia"
      }
    }
  }
}

variable "tokyo-network" {
  type = map(any)
  default = {
    vpcs = {
      tokyo = {
        cidr = "172.16.0.0/16"
      }
    }
    subnets = {
      tokyo-a-public = {
        cidr = "172.16.1.0/24"
        az = "ap-northeast-1a"
        vpc = "tokyo"
      }
      tokyo-c-public = {
        cidr = "172.16.3.0/24"
        az = "ap-northeast-1c"
        vpc = "tokyo"
      }
      tokyo-d-private = {
        cidr = "172.16.14.0/24"
        az = "ap-northeast-1d"
        vpc = "tokyo"
      }
    }
  }
}