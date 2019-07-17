# docker-tor-service

A solution in Docker for deploying a single service on to the Tor network  
NGINX has been included as an example

Securely accessing a service you have deployed can be done a few ways such as SSH tunneling and setting up domain names and certificates.
SSH tunneling aside, hosting through Tor is a free alternative, with the only downside being the connection speeds.

### Setup
- Run the `docker-compose.yml`
```bash
docker-compose up -d
```
- You can view the onion link that has been generated with the below command, keep in mind it may take several minutes before your service is registered on the Tor network.
```bash
docker exec tor-service cat /var/lib/tor/hidden_service/hostname
```
### Configuration example; NGINX (included in the project):

All configuration can be done through the `docker-compose.yml`

- Add the service to the `docker-compose.yml`
```yaml
  hidden-service:
    container_name: nginx
    image: nginx:latest
```
- Configure the Tor Service container to connect to the service you would like to host
```yaml
  tor_service:
    container_name: tor-service
    build: .
    environment:
    - HIDDEN_SERVICE_HOST=hidden-service
    - HIDDEN_SERVICE_PORT=80
    depends_on:
    - hidden-service
```
