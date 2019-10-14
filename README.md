# Aplicación PHP de ejemplo con framework Phalcon 

## Requisitos

Partimos de una imagen Docker (ualmtorres/phalcon-apache-ubuntu) creada a partir de Ubuntu 16.04 incluyendo PHP, el framework Phalcon y Apache. Se usó este [Dockerfile](./Dockerfile) para crearla.

Para la aplicación usaremos esta estructura:

```
├── conf
│   └── apache2.conf
│   └── dir.conf
└── app
    └── .htaccess
    └── index.php    
```

### Archivo `conf/apache2.conf`

Se modifica para la rescritura de URL's, funcionalidad requerida para el uso de la API de ejemplo.

[Enlace a `conf/apache2.conf`](https://gist.github.com/ualmtorres/f761d4c804d618857dfa7705b1c0e2d2)

<script src="https://gist.github.com/ualmtorres/f761d4c804d618857dfa7705b1c0e2d2.js"></script>

### Archivo `conf/dir.conf`

Se modifica para priorizar en Apache la carga de archivos PHP frente a HTML.

[Enlace a `conf/dir.conf`](https://gist.github.com/ualmtorres/8ff877247f6aab3376d6bb3d4730cd13)

<script src="https://gist.github.com/ualmtorres/8ff877247f6aab3376d6bb3d4730cd13.js"></script>

### Archivo `app/.htaccess`

Incluye las reglas de rescritura de URLs.

[Enlace a `app/.htaccess`](https://gist.github.com/ualmtorres/c30c93c889c404e3ec36)

<script src="https://gist.github.com/ualmtorres/c30c93c889c404e3ec36.js"></script>

### Archivo `app/index.php`

Código de la API.

[Enlace a `app/index.php`](https://gist.github.com/ualmtorres/aa3d8a258ed6e22881de)

<script src="https://gist.github.com/ualmtorres/aa3d8a258ed6e22881de.js"></script>

## Despliegue

Ejecutar con 

```
docker run -d -p 80:80 \
   -v $(pwd)/conf/dir.conf:/etc/apache2/mods-available/dir.conf \
   -v $(pwd)/conf/apache2.conf:/etc/apache2/apache2.conf \
   -v $(pwd)/app:/var/www/html \
   ualmtorres/phalcon-apache-ubuntu
```

La API de ejemplo está disponible con estos endpoints:

```
http://localhost/say/date
http://localhost/say/hello/John
```


