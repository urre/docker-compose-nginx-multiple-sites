# NGINX, Docker Compose and multiple sites using HTTPS

Simple example using multiple websites together.

## Run

```
docker-compose up -d
```

View sites in the browser

1. [https://example_one.local](https://example_one.local)
2. [https://example_two.local](https://example_two.local)

## Notes
- SSL certs are shipped in `./certs` in this example. You can generate then using open SSL. Also [mkcert](https://github.com/FiloSottile/mkcert) is a great little tool.
- Certs need to be trusted, also `./etc/hosts` need to be updated. See my other [repo](https://github.com/urre/wordpress-nginx-docker-compose) on how to do that.
