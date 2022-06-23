terraform {
    backend "remote" {
        hostname = "gmorini.scalr.io"
        organization = "env-u3tcrstrasbvs98"
        workspaces {
          name = "First-VPC"
        }
    }
}