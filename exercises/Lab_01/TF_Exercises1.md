# Ejercicio 1. Creación de recursos e inicialización de un proyecto para modulo TF

Level: Beginner
Git URL: https://github.com/daordonez/Getting-Started-Terraform/tree/exercises/lab01
Status: Pending

# Ejercicio Terraform 1

## 1.1 Creación de recursos IaC y estructura del módulo

Se requiere crear los siguientes recursos en Azure mediante IaC con Terraform:

- Grupo de recursos con nombre: TST-WESTEUR-TFLAB1
•	VNET con el modificando el direccionamiento, es decir, reducir el número de IPs asignables dentro del rango CIDR: 10.0.0.0/28
•	Maquina virtual B2s - Linux
•	IP Publica para poder acceder a la maquina desde internet a través de SSH
•	Instalar servidor Nginx con mensaje : “Acabas de completar tu primer ejercicio de IaC con Terraform”

Notas del ejercicio:

Todos los nombres de los recursos deberán pasarse mediante fichero de variables. Así mismo, la idea es que se cree un modelo de plantilla (Modulo de terraform) que permita reutilizar dicha configuración en el futuro de ser necesario ( fichero de variables + variables locales + [main.tf](http://main.tf/))

Deberás saber cuando es el momento de utilizar los siguientes comandos:

```
Terraform init
Terraform validate
Terraform fmt check y Terraform fmt
Terraform plan y Terraform plan -out ./Path_file.tfplan
Terraform apply
Terraform destroy
```

Para algunos comandos, no es necesario usar ambos comandos, solo uno de ellos, pero, es importante que pruebes ambos para aprender su comportamiento, o bien documentes el resultado de usar el comando.

## 1.2 Optimización del módulo

Una vez hayas conseguido desplegar la infraestructura base, procedemos a destruirla mediante el comando correspondiente.

La idea de esta segunda parte, es que utilices Data Type de tipo Map() en el fichero de variables correspondiente. En el deberás ofrecer la posibilidad de aprovisionar  la infraestructura del ejercicio PERO, ofreciendo diferentes tamaños de maquina virtual, siendo los tamaños:

```
- small = B2s
- medium = DS2v2
- large = DS4v2

```

Por ultimo, una vez implementes el uso de map() en tu ejercicio, deberás implementar una variable de salida que arroje el FQDN de la maquina virtual, por el cual podrás conectarte a ella mediante RDP.


Seguridad durante la implementación:

 A fin de seguir buenas prácticas durante la implementación del ejercicio, las credenciales de API de Azure no podran exponerse en ningún momento en texto plano en el repositorio. Para ello deberás hacer uso de las variables correspondientes, o implementar mecanismos para que las variables no salgan de tu equipo.

 Bonus track
 Implementar el etiquetado de recursos aplicando al menos las siguientes 3 etiquetas a cada uno de los recursos que se creen mediante TF
 - CompanyName = "DordoLabs"
 - ProjectName = "TF_lab01"
 - BillingCode = "201219DN"