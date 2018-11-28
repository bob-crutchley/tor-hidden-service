# docker-tor-service

A solution in Docker for deploying a single service on to the Tor network 
Jenkins has been included as an example

Securely accessing a service you have deployed can be done a few ways such as SSH tunneling and setting up domain names and certificates.
SSH tunneling aside, hosting through Tor is a free alternative, with the only downside being the connection speeds.

All configuration can be done through the `docker-compose.yml`

### Configuration example; Jenkins (included in the project):
- Add the service to the `docker-compose.yml`
```yaml
  jenkins:
    container_name: jenkins
    image: bobcrutchley/jenkins
```
- Configure the Tor Service container to connect to the service you would like to host
```yaml
  tor_service:
    container_name: tor-service
    build: .
    environment:
    - HIDDEN_SERVICE_HOST=jenkins
    - HIDDEN_SERVICE_PORT=8080
    depends_on:
    - jenkins
```
- You can view the onion link that has been generated with the below command, keep in mind it may take several minutes before your service is registered on the Tor network.
```bash
docker exec tor-service cat /var/lib/tor/hidden_service/hostname
```

