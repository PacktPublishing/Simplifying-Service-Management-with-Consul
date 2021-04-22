#!/usr/bin/env bash
cat << EOF > /etc/consul/consul.d/consul-server.hcl
server = true
bootstrap_expect = 3
retry_join = ["provider=aws tag_key=Name tag_value=${server_name_tag}"]
bind_addr = "$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
advertise_addr = "$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"
client_addr = "$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
ui = true
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true
ca_file = "/etc/consul/consul.d/consul-agent-ca.pem"
cert_file = "/etc/consul/consul.d/dc1-server-consul-${server_number}.pem"
key_file = "/etc/consul/consul.d/dc1-server-consul-${server_number}-key.pem"
ports {
  http = 8500,
  https = 8501
}
auto_encrypt {
  allow_tls = true
}
connect {
  enabled = true
}
EOF
sudo systemctl start consul