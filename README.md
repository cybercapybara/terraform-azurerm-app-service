# terraform-azurerm-app-service

Terraform module that manages an [Azure](https://azure.microsoft.com/) App
Service on Linux. It creates a service plan and a Linux web app together,
supports running a custom container image, and exposes the app's default
hostname.

## Usage

```hcl
module "app_service" {
  source = "github.com/moveeeax/terraform-azurerm-app-service"

  name                = "prod-webapp01"
  service_plan_name   = "prod-asp"
  resource_group_name = "prod-rg"
  location            = "eastus"
  sku_name            = "P1v3"

  app_settings = {
    WEBSITES_PORT = "8080"
  }

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| azurerm   | >= 3.0   |

## Inputs

| Name                  | Description                                                        | Type          | Default | Required |
|-----------------------|--------------------------------------------------------------------|---------------|---------|:--------:|
| `name`                | Name of the Linux web app. Globally unique.                        | `string`      | n/a     |   yes    |
| `service_plan_name`   | Name of the service plan hosting the web app.                      | `string`      | n/a     |   yes    |
| `resource_group_name` | Name of the resource group in which to create the resources.       | `string`      | n/a     |   yes    |
| `location`            | Azure region in which to create the resources.                     | `string`      | n/a     |   yes    |
| `sku_name`            | SKU of the service plan.                                           | `string`      | `"B1"`  |    no    |
| `https_only`          | Whether the web app redirects all HTTP traffic to HTTPS.           | `bool`        | `true`  |    no    |
| `always_on`           | Whether the web app is always kept loaded.                         | `bool`        | `true`  |    no    |
| `docker_image_name`   | Docker image and tag to run. Null runs the default runtime.        | `string`      | `null`  |    no    |
| `docker_registry_url` | URL of the container registry hosting the image.                   | `string`      | `null`  |    no    |
| `app_settings`        | Map of application settings exposed as environment variables.      | `map(string)` | `{}`    |    no    |
| `tags`                | Map of tags applied to the resources.                              | `map(string)` | `{}`    |    no    |

## Outputs

| Name               | Description                                    |
|--------------------|------------------------------------------------|
| `id`               | ID of the Linux web app.                       |
| `name`             | Name of the Linux web app.                     |
| `default_hostname` | Default hostname of the web app.               |
| `service_plan_id`  | ID of the service plan hosting the web app.    |

## License

[MIT](LICENSE)
