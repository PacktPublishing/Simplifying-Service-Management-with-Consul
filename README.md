# Simplifying Service Management with Consul

<a href="https://www.packtpub.com/product/simplifying-service-management-with-consul/9781800202627"><img src="https://static.packt-cdn.com/products/9781800202627/cover/smaller" alt="Book Name" height="256px" align="right"></a>

This is the code repository for [Simplifying Service Management with Consul](https://www.packtpub.com/product/simplifying-service-management-with-consul/9781800202627), published by Packt.

**Overcome connectivity and security challenges within dynamic service architectures**

## What is this book about?
Within the elastic and dynamic nature of cloud computing, efficient and accurate service discovery provides the cornerstone for all communications. HashiCorp Consul facilitates this service discovery efficiently and securely, independent of the operating environment. This book will help you build a solid understanding of both the concepts and applications of HashiCorp Consul.

This book covers the following exciting features: 
* Deploy and configure a highly available multi-node Consul architecture
* Implement Consul service discovery across multiple services
* Utilize Consul to monitor and communicate service health status
* Connect services securely across a range of environments
* Leverage your knowledge of the Consul service to automate network infrastructure
* Extend your Consul knowledge and connectivity across multiple environments

If you feel this book is for you, get your [copy](https://www.amazon.com/Simplifying-Service-Management-Consul-architectures/dp/1800202628) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" alt="https://www.packtpub.com/" border="5" /></a>

## Instructions and Navigations
All of the code is organized into folders. For example, Chapter03.

The code will look like the following:
```
cat > first-policy.hcl << EOF
node_prefix "" {
   policy = "write"
}
service_prefix "" {
   policy = "read"
}
EOF
```

**Following is what you need for this book:**
If you are a solutions architect, DevOps engineer, or anyone new to the cloud-native framework looking to get started with using Consul, then this book is for you. Knowledge of Terraform is helpful but not necessary. A basic understanding of networking and Kubernetes systems will help you get the most out of this book.

With the following software and hardware list you can run all code files present in the book (Chapter 1-8).

### Software and Hardware List

| Chapter  | Software required                                                                                  | OS required                        |
| -------- | ---------------------------------------------------------------------------------------------------| -----------------------------------|
| 1-8      | AWS Account, Packer, Terraform, Consul, Text Editor of Choice									                    | Windows, Mac OS X, and Linux (Any) |


We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://static.packt-cdn.com/downloads/9781800202627_ColorImages.pdf).

### Related products <Other books you may enjoy>
* HashiCorp Infrastructure Automation Certification Guide[[Packt]](https://www.packtpub.com/product/hashicorp-infrastructure-automation-certification-guide/9781800565975) [[Amazon]](https://www.amazon.com/HashiCorp-Infrastructure-Automation-Certification-Guide-ebook/dp/B092KM7LXC)

* Terraform Cookbook [[Packt]](https://www.packtpub.com/product/terraform-cookbook/9781800207554) [[Amazon]](https://www.amazon.com/Terraform-Cookbook-Efficiently-Infrastructure-platforms-ebook/dp/B08H8XD9W4)

## Get to Know the Author
**Robert E. Jackson**
He earned his bachelor of science in electrical engineering from Purdue University in 1997, and since then has found himself in a multitude of pre- and post-sales positions with various successful start-ups, mostly in the network access technology space. He has played multiple roles over the course of his career, including sales engineer, solutions engineer, integration engineer, network engineer, and product manager. Throughout all of these engineering positions he never learned to drive a train, but he was able to experience the digital transformation from traditional data centers to cloud computing from multiple viewpoints. He is currently employed at HashiCorp as a senior solutions engineer, based in the northeast area of the United States.
### Download a free PDF

 <i>If you have already purchased a print or Kindle version of this book, you can get a DRM-free PDF version at no cost.<br>Simply click on the link to claim your free PDF.</i>
<p align="center"> <a href="https://packt.link/free-ebook/9781800202627">https://packt.link/free-ebook/9781800202627 </a> </p>