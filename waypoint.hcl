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
        "tfcvar": var.tfc_dev.ecs_cluster_name
#        "tfcvar": var.tfc_dev.ecs_cluster_dev
      }
    }
  }
}

variable "tfc_dev" {
  default = dynamic("terraform-cloud", {
    organization = "hc-waypoint"
    workspace    = "hashiconf-demo"
#    organization = "acmecorpinfra"
#    workspace    = "acmeapp1-dev-us-east-1"
    all_outputs  = "true"
  })
  type    = any
#  type    = map(string)
  sensitive   = false
  description = "acmeapp1 outputs"
}

