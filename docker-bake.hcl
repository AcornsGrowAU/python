variable "GITHUB_RUN_NUMBER" {
  default = null
}

group "default" {
  targets = [
    "python"
  ]
}

target "python" {
  pull = true
  tags = [
    "acornsaustralia/python:latest",
    GITHUB_RUN_NUMBER != null ? "acornsaustralia/python:${GITHUB_RUN_NUMBER}" : ""
  ]
  platforms = [
    "linux/amd64"
  ]
  args = {
    "FEDORA_VERSION" = "39"
  }
}
