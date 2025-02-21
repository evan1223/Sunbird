# About this repo
This is a repo for connecting a webapp container and otel collector container.
The web application has three types of logs: server log, web log, access log.
The logs are redirected to `stdout`.
Through otel collector, the logs can be filtered and appended into three files in local machine.

# How to activate this repo
`docker compose up` in the `docker_jpetstore` and `otel_collector` directory. 
## Warning 
**Otel collector container needs to be start first.**
If the webapp container starts first, it's logging driver will crash.
