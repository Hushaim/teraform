variable region { #region is the name
  type = string  #all the variable type need
  description ="Enter Region" # description is a option
  default = "" 
}

variable key_name{
  type = string 
  default = ""
  description = "provide key pair name"

}


variable key_file{
  type = string 
  default =  "~/.ssh/id_rsa.pub"
  description = "file location"

}