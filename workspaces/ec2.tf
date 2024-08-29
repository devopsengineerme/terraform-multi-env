resource "aws_instance" "web" {
  ami = data.aws_ami.example.id
  instance_type = lookup(var.instance_types, terraform.workspace)
    tags = {
      name = "hello-terraform"
    }
}