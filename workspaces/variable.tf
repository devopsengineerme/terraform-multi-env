variable "instance_types" {
    type = map 
    default = {
    dev = "t2.micro"
    prod = "t3.small"
    }
}