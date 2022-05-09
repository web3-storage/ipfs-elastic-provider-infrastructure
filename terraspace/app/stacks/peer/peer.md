<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 3.38)

- <a name="requirement_http"></a> [http](#requirement\_http) (~> 2.1)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (~> 3.38)

- <a name="provider_http"></a> [http](#provider\_http) (~> 2.1)

## Modules

The following Modules are called:

### <a name="module_eks"></a> [eks](#module\_eks)

Source: terraform-aws-modules/eks/aws

Version: ~> 18.2.0

### <a name="module_gateway_endpoint_to_dynamodb"></a> [gateway\_endpoint\_to\_dynamodb](#module\_gateway\_endpoint\_to\_dynamodb)

Source: ../../modules/gateway-endpoint-to-dynamodb

Version:

### <a name="module_gateway_endpoint_to_s3"></a> [gateway\_endpoint\_to\_s3](#module\_gateway\_endpoint\_to\_s3)

Source: ../../modules/gateway-endpoint-to-s3

Version:

### <a name="module_vpc"></a> [vpc](#module\_vpc)

Source: terraform-aws-modules/vpc/aws

Version: ~> 3.0

## Resources

The following resources are used by this module:

- [aws_security_group_rule.dns_ingress_tcp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.dns_ingress_udp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.fargate_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.fargate_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) (data source)
- [aws_eks_cluster.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) (data source)
- [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_account_id"></a> [account\_id](#input\_account\_id)

Description: AWS account ID

Type: `string`

### <a name="input_eks"></a> [eks](#input\_eks)

Description: EKS cluster

Type:

```hcl
object({
    name    = string
    version = string
    eks_managed_node_groups = object({
      desired_size   = number
      min_size       = number
      max_size       = number
      instance_types = list(string)
    })
  })
```

### <a name="input_region"></a> [region](#input\_region)

Description: VPC Gateways service names are composed using this region

Type: `string`

### <a name="input_vpc"></a> [vpc](#input\_vpc)

Description: VPC for EKS worker nodes

Type:

```hcl
object({
    name                 = string
    cidr                 = string
    private_subnets      = list(string)
    public_subnets       = list(string)
    enable_nat_gateway   = bool
    single_nat_gateway   = bool
    enable_dns_hostnames = bool
  })
```

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate)

Description: Base64 encoded Certificate Authority PEM for EKS

### <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id)

Description: EKS cluster name

### <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url)

Description: Used for allowing Kubernetes to manage AWS resources

### <a name="output_host"></a> [host](#output\_host)

Description: EKS control plane API server endpoint
<!-- END_TF_DOCS -->