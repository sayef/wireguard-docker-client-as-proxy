# wireguard-docker-client-as-proxy
Use wireguard client in docker as proxy


## Build

```
docker build -t wgproxy .
```

## Run

```
docker run -it --name wgproxy -e TZ=UTC -p 3128:3128 --cap-add=NET_ADMIN  wgproxy
```

## Test

- Example 1

  ```
  curl https://google.com -x localhost:3128

  # Note: ping doesn't support proxy
  ```

- Example 2

  ```
  export HTTPS_PROXY=localhost:3128
  export KUBECONFIG=/some/cluster/kube/config

  kubectl get pods
  ```
