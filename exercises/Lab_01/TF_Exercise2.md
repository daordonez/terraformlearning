# Ejercicio 2. Implementación de HA en módulo inicial de TF

Level: Beginner

## 1.1 Implementación de alta disponibilidad en el módulo de Terraform

> Este módulo toma como base el ejercicio 1 de esta formación. Antes de poder comenzar este laboratorio, es imprescindible que se haya conseguido implementar las actividades descritas en dicho ejercicio
> 

El objetivo de este ejercicios es mejorar la alta disponibilidad de la infraestructura existente. Para ellos se proponen los siguientes puntos de mejora:

- Implementar una segunda zona de disponibilidad
- Implementar una segunda VM que reciba solicitudes en el servidor NGINX
- Implementar un balanceador de carga que reparta las peticiones entre las 2 maquinas que están en diferentes zonas de disponibilidad


## 1.2 Requerimientos de la arquitectura

Una vez desplegados los recursos adicionales, se deberá securizar las maquinas virtuales para que solo acepten tráfico desde una IP dentro de la vnet. Por lo que serán necesario:

- Implementar reglas de tráfico para conseguir que las VMS solo acepten tráfico interno
- La infraestrcutura solo debe tener una IP publica que esta vinculada directamente al load balancer
- Sera necesario securizar tanto las VMS como el load balancer para que solo acepte peticiones de tráfico HTTP

Así mismo, será necesario mantener los mismos estandares de etiquetas, y nomenclatura y valores de salida.

## 1.3 Valores de salida

Será suficiente con indicar la IP publica del balanceador, PERO será sobresaliente si el resultado de salida sea un registro DNS (subdominio) del dominio raiz "365enespanaol.com” el cual esta gestionado en Azure.