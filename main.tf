terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~>2.8"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.9"
    }
  }
}

resource "random_pet" "my_pet" {
  prefix    = "my-pet"
  length    = 2
  separator = "-"
}

resource "random_password" "my_password" {
  length  = 16
  special = false
}

data "local_file" "example" {
  filename = "datasource.txt"
}

resource "local_file" "example" {
  filename = "example.txt"
  content  = <<EOF
  Value of the file content: ${var.file_content}. Boolean value: ${var.var_boolean}

  Data source content: ${data.local_file.example.content}

  Random pet: ${random_pet.my_pet.id}

  Random password: ${random_password.my_password.id}

  Second fruit: ${var.fruits[1]}

  Person name: ${var.person_map.name}
  Person age: ${var.person_map.age}

  Person name: ${var.person.name}
  Person age: ${var.person.age}
  EOF
}

output "random_password" {
  value     = "my password is: ${random_password.my_password.result}"
  sensitive = true
}
