project = "tfc-test"

# Labels can be specified for organizational purposes.


app "tfc-test" {
  build {
    use "docker" {
    }
  }

  deploy {
    use "docker" {
      static_environment = {
        "izaak": "test",
        "tfcvar": var.tfc_dev.ecs_cluster_dev
      }
    }
  }
}

variable "ecs_cluster" {
  default = dynamic("terraform-cloud", {
    organization = "acmecorpinfra"
    workspace    = "acmeapp1-dev-us-east-1"
    all_outputs  = "true"
  })
  type    = map(string)
  sensitive   = false
  description = "acmeapp1 outputs"
}
