# Glua's new website

Base on hugo using the hextra theme

## How to run it

*podman*

```
podman build -t glua .
podman run -p 1313:1313
```

*docker*

```
docker build -t glua -f Containerfile
docker run -p 1313:1313
```

