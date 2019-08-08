# docker-inotify-container

```
version: "2.4"
services: 
  notifier:
    image: junte/inotify-container
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock 
      - /monitored-folder:/var/monitored-folder
    environment:
      - CONTAINER=<container_name>
      - VOLUMES=/var/monitored-folder
```


version: "2.4"
services: 
  restarter:
    image: restarter
    volumes: 
      - /var/run/docker.sock:/var/run/docker.sock 
      - /monitored-folder:/monitored-folder
    environment:
      - COMMAND=restart mycontainer
      - VOLUMES=/monitored-folder
      - INOTIFY_EVENTS=modify
      - INOTIFY_OPTONS=--monitor -r