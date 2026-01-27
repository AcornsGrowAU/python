variable "GITHUB_RUN_NUMBER" {
  default = null
}

group "default" {
  targets = [
    "python"
  ]
}

target "python" {
  name = "python-${replace(python_version, ".", "-")}"
  matrix = {
    python_version = [
      "3.12", # TO be updated when package is available
    ]
  }

  pull = true
  tags = [
    "acornsaustralia/python:${python_version}",
    GITHUB_RUN_NUMBER != null ? "acornsaustralia/python:${python_version}-${GITHUB_RUN_NUMBER}" : ""
  ]
  platforms = [
    "linux/amd64"
  ]
  args = {
    "ROCKY_VERSION"  = "10"
    "PYTHON_VERSION" = "${python_version}"
  }
}
