source "amazon-ebs" "ubuntu-image" {
  ami_name = "${var.owner}-secure-consul-{{timestamp}}"
  region = "${var.aws_region}"
  instance_type = var.aws_instance_type
  tags = {
    Name = "${var.owner}-secure-consul"
  }
  source_ami_filter {
      filters = {
        virtualization-type = "hvm"
        name = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
        root-device-type = "ebs"
      }
      owners = ["099720109477"]
      most_recent = true
  }
  communicator = "ssh"
  ssh_username = "ubuntu"
}
build {
  sources = [
    "source.amazon-ebs.ubuntu-image"
  ]
  provisioner "file" {
    source      = "../files/consul.service"
    destination = "/tmp/consul.service"
  }
  provisioner "file" {
    source      = "../files/consul-common.hcl"
    destination = "/tmp/consul-common.hcl"
  }
  provisioner "file" {
    source      = "../files/consul-agent-ca.pem"
    destination = "/tmp/consul-agent-ca.pem"
  }
  provisioner "shell" {
    inline = [
      "sleep 30",
      "sudo apt-get update",
      "sudo apt install unzip default-jre apt-transport-https gnupg2 curl lsb-release -y",
      "curl -k -O \"https://releases.hashicorp.com/consul/${var.consul_version}/consul_${var.consul_version}_linux_amd64.zip\"",
      "unzip consul_${var.consul_version}_linux_amd64.zip",
      "sudo mv consul /usr/local/bin",
      "sudo /usr/local/bin/consul -autocomplete-install",
      "sudo useradd --system --home /etc/consul/consul.d --shell /bin/false consul",
      "sudo mkdir /etc/consul /etc/consul/consul.d /etc/consul/logs /var/lib/consul/ /var/run/consul/",
      "sudo chown -R consul:consul /etc/consul /var/lib/consul/ /var/run/consul/",
      "sudo chmod -R a+r /etc/consul/logs/",
      "sudo mv /tmp/consul.service /etc/systemd/system/consul.service",
      "sudo mv /tmp/consul-common.hcl /etc/consul/consul.d/consul-common.hcl",
      "echo \"copying ca file\"",
      "sudo cp /tmp/consul-agent-ca.pem /etc/consul/consul.d/consul-agent-ca.pem",
      "echo \"ca file copied\"",
      "curl -sL 'https://deb.dl.getenvoy.io/public/gpg.8115BA8E629CC074.key' | sudo gpg --dearmor -o /usr/share/keyrings/getenvoy-keyring.gpg",
      "echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/getenvoy-keyring.gpg] https://deb.dl.getenvoy.io/public/deb/ubuntu $(lsb_release -cs) main\" | sudo tee /etc/apt/sources.list.d/getenvoy.list",
      "sudo apt update",
      "sudo apt install -y getenvoy-envoy"
    ]
  }
}
