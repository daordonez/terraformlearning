# Ejercicio 4. Importar una infraestrcutura existente desde Azure

Level: Beginner
Git URL: https://github.com/daordonez/terraformlearning/tree/exercises/lab04
Status: InProgress

## Entorno: "Green field” vs "Brown field”.

Existen dos tipos de escenarios durante la implementación de IaC. Es posible que la compañia para la que estemos realizando el proceso de implementación todavía no disponga de recursos desplegados en una nube pública, por lo que siendo así, nos encontramos en un entorno de "Green field”, donde nosotros podremos decidir el camino a seguir , y aprovisionar desde cero la infraestrcutura como queramos.

En otros casos, la compañia para la que estamos implementando el IaC ya dispone de recursos desplegados en la nube, y será necesario importarlos, e incluirlo en el estado de Terraform, para poder realizar las integraciones con los nuevos recursos en adelante.

## 1.1 Importación de recursos en un entorno "Brown field” al Terraform State.

El objetivo del ejercicio es importar todos los recursos aprovisionados en un un grupo de recursos dado. Para ello, será necesario hacer uso de los comandos:

- Terraform CLI + Code (legacy way)

```bash
$ terraform import [options] ADDR ID
# Example
# terraform import aws_vpc.main vpc-123456789
```

- Import code

```bash
#import.tf
import {
	to = "awc_vpc.main"
	id = "vpc-12345678"
}
```

> It's mandatory to choose one of the accepted methods get a proper import process with `import {}` statement, either with: `terraform plan -generate-config-out=generated.tf` or manual resource declaration with `resource {}`
> 

## 1.2 Comprobación del TF State

Si todo ha ido tal y como se espera, deberemos ver que todos los elementos del grupo de recursos, están ahora incluidos en el fichero Terraform state.

## Some helper notes

Importing code for Terraform CLI commando

```bash
#main.tf

resource "awc_vpc" "main" { # <- Matches with 2 params of terraform import comand
	cidr_block         = var.vpc_cidr
	enable_dns_support = true
	tags = {
		Name = var.vpc_name
	}
}
```

```bash
$ terraform plan

# If we've done everything ok, we should see any changes.
```