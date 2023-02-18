# Main VPC
resource "aws_vpc" "vikash" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vikash-VPC"
  }
}

# Creating Public Subnets in VPC
resource "aws_subnet" "vikash-public-1" {
  vpc_id                  = aws_vpc.vikash.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "vikash-public-1"
  }
}

resource "aws_subnet" "vikash-public-2" {
  vpc_id                  = aws_vpc.vikash.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "vikash-public-2"
  }
}


# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "vikash-gw" {
  vpc_id = aws_vpc.vikash.id

  tags = {
    Name = "Vikash"
  }
}


# Creating EC2 instances in public subnets
resource "aws_instance" "public_inst_1" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.vikash-public-1.id}"
  key_name = "vikash-b7"
  tags = {
    Name = "vikash_inst_1"
    Owner = "vikash.kumar@cloudeq.com"
    Purpose = "training"
  }
    volume_tags = {
    Name = "public_inst_2"
    Owner = "vikash.kumar@cloudeq.com"
    Purpose = "training"
  }
   
}

resource "aws_instance" "public_inst_2" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.vikash-public-2.id}"
  key_name = "vikash-b7"
  tags = {
    Name = "vikash_inst_2"
    Owner = "vikash.kumar@cloudeq.com"
    Purpose = "training"
  }
  volume_tags = {
    Name = "public_inst_2"
    Owner = "vikash.kumar@cloudeq.com"
    Purpose = "training"
  }


}

resource "aws_instance" "public_inst_3" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.vikash-public-1.id}"
  key_name = "vikash-b7"
  tags = {
    Name = "vikash_inst_3"
    Owner = "vikash.kumar@cloudeq.com"
    Purpose = "training"
  }
  volume_tags = {
    Name = "public_inst_3"
    Owner = "vikash.kumar@cloudeq.com"
    Purpose = "training"
  }


}


resource "aws_instance" "public_inst_4" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.vikash-public-2.id}"
  key_name = "vikash-b7"
  tags = {
    Name = "vikash_inst_4"
    Owner = "vikash.kumar@cloudeq.com"
    Purpose = "training"
  }
  volume_tags = {
    Name = "public_inst_4"
    Owner = "vikash.kumar@cloudeq.com"
    Purpose = "training"
  }


}




