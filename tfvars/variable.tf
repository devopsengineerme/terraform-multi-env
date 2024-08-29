variable "instance_names" {
    type = map 
    default = {
    mongodb = "t2.micro"
    redis = "t2.micro"
    shipping = "t3.small"
    web = "t2.micro"
    }
}

variable "domain_name" {
    type =  string
    default = "myfirstroboshop.online"
}
variable "zone_id" {
    type = string
    default = "Z03923452CQN2MMZEEGCB"
}
variable "sg-name" {
  type = string
  default = "allow-all"
}

variable "sg-description" {
  type = string
  default = "Allow TLS inbound traffic"
}

variable "inbound-from-port" {
  #type = string
  default = 0
}

variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}