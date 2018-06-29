# Prometheus Swarm

A sample image that can be used as a base for collecting Swarm mode metrics in Prometheus

## How to use it

You can use the provided `docker-stack.yml` file as an example. You can deploy the full stack with the command:

### Create overlay network
Before deploying, you need to create an overlay network for monitoring with prometheus

```bash
docker network create --driver overlay --attachable monitoring
```

### Deploy prometheus stack
```bash
docker stack deploy -c docker-compose-stack.yml prometheus
```

