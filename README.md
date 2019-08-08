# docker-inotify-container

``` yaml
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
```