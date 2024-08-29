resource "aws_instance" "web" {
  ami = data.aws_ami.example.id
  for_each = var.instance_names
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.roboshop-all.id] 
  
    tags = {
      name = each.key
    }
}
###########################################################################################
resource "aws_security_group" "roboshop-all" { #this is terraform name, for terraform reference only
    name        = var.sg-name # this is for AWS
    description = var.sg-description
    #vpc_id      = aws_vpc.main.id

    ingress {
        description      = "Allow All ports"
        from_port        = var.inbound-from-port # 0 means all ports
        to_port          = 0 
        protocol         = "tcp"
        cidr_blocks      = var.cidr_blocks
        #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-all"
    }
}
######################################################################################
resource "aws_route53_record" "www" {
  for_each = aws_instance.web
  zone_id = var.zone_id # Replace with your zone ID
  name    = "${each.key}.${var.domain_name}" # Replace with your subdomain, Note: not valid with "apex" domains, e.g. example.com
  type    = "A"
  ttl     = "1"
  records = [startswith ("each.key" ,"web" ) ? each.value.public_ip : each.value.private_ip] 
}