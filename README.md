# Prometheus Swarm

A sample image that can be used as a base for collecting Swarm mode metrics in Prometheus

## How to use it

You can use the provided `docker-stac.yml` file as an example. You can deploy the full stack with the command:

```bash
docker stack deploy --compose-file docker-stack.yml monitoring
```

