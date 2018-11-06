# Prometheus Swarm

A sample image that can be used as a base for collecting Swarm mode metrics in Prometheus

## How to use it

You can use the provided `docker-stack.yml` file as an example. You can deploy the full stack with the command:

### Create overlay network
Before deploying, you need to create an overlay network for monitoring with prometheus

```bash
docker network create --driver overlay --attachable monitoring
```

### Set label on a specific host
Prometheus uses internal TSDB which needs a persistent volume
I set the constraint on Prometheus service therefore you should set the service=prometheus label
```
docker node update --label-add service=prometheus infa-swarm-t1003
```

### Deploy prometheus stack
```bash
docker stack deploy -c docker-compose-stack.yml prometheus
```

### Deploy Grafana Dashboard
```bash
docker stack deploy -c grafana.yml grafana
```

Now you can access your Grafana dashboard via this URL

* http://<IP one of your swarm node>:3000
