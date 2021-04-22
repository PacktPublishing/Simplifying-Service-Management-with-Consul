#!/usr/bin/env bash

cat << EOF > /etc/consul/consul.d/consul-server.hcl
server = true
bootstrap_expect = 3
retry_join = ["provider=aws tag_key=Name tag_value=${server_name_tag}"]
bind_addr = "$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
advertise_addr = "$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"
client_addr = "$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
ui = true
EOF

sudo systemctl start consul