resource "aws_instance" "vm" {
    ami = "ami-02c7683e4ca3ebf58"
    instance_type = "t2.medium"
    key_name = "id_rsa_key"
    vpc_security_group_ids = [sg-0cfe06dd976c2a1be]
    user_data = file("script.sh")
    tags = {
        Name = "Myntra"
    }
}
