variable "file_content" {
  default     = "File content"
  description = "Content of the file as string"
  type        = string
}

variable "var_boolean" {
  default = true
  type    = bool
}

variable "fruits" {
  default     = ["apple", "banana", "cherry"]
  type        = list(string)
  description = "List of fruits"
}

variable "person_map" {
  type = map(string)
  default = {
    name = "Luiz"
    age  = 31
  }
}

variable "person" {
  type = object({
    name = string
    age  = number
  })

  default = {
    name = "Luiz"
    age  = 31
  }
}
