variable "GITHUB_RUN_NUMBER" {
  default = null
}

group "default" {
  targets = [
    "python"
  ]
}

target "python" {
  name = "python-${replace(ver, ".", "-")}"
  matrix = {
    ver = [
      "3.11",
      "3.12",
      "3.14"
    ]
  }

  pull = true
  tags = [
    "acornsaustralia/python:${python_version}",
    GITHUB_RUN_NUMBER != null ? "acornsaustralia/python:${python_version}-${GITHUB_RUN_NUMBER}" : ""
  ]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
  args = {
    "ROCKY_VERSION"  = "10"
    "PYTHON_VERSION" = "${python_version}"
  }
}
