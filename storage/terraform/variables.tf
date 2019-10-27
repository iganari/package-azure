variable "common" {
  type = "map"
  default = {
    rsg_name     = "rsg-sample"
    rsg_location = "West Europe"
  }
}

variable "storage" {
  type = "map"
  default = {
    asa_name = "asasample"  # name can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long.
    asc_name = "asc-sample"  # Only lowercase alphanumeric characters and hyphens allowed.
  }
}

variable "image-hiyoko" {
  default = [
    "animal_mark_hiyoko.png",
    "hiyoko_baby.png",
    "hiyoko.png",
    "niwatori_hiyoko_koushin.png"
  ]
}