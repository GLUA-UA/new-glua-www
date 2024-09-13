# Glua's new website

Based on hugo using the hextra theme

## How to run it

*podman*

```
podman build -t glua-www .
podman run -p 1313:1313 glua-www
```

*docker*

```
docker build -t glua-www .
docker run -p 1313:1313 glua-www
```

