#!/usr/bin/env bash
mkdir /etc/consul/cts/
cat << EOF > /etc/consul/cts/cts-config.hcl
log_level = "INFO"
port = 8558
syslog {}
buffer_period {
  enabled = true
  min = "5s"
  max = "20s"
}
consul {
  address = "$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4):8500"
}
driver "terraform" {
  log = false
  persist_log = false
  working_dir = ""
  backend "consul" {
    gzip = true
  }
}
task {
 name        = "find-httpd-nodes"
 description = "Example task with two services"
 source      = "findkim/print/cts"
 version     = "0.1.0"
 services    = ["httpd"]
}
service {
 name = "httpd"
 tag = "python-server"
 # namespace = "service-namespace"
 # datacenter  = "dc1"
 description = "Filter for httpd services that have the python-server tag"
}
EOF
