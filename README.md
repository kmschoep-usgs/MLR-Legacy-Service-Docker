# MLR-Legacy-Service-Docker
Docker configuration to deploy the MLR-Legacy-Service service in a Docker container 

[![Build Status](https://travis-ci.org/USGS-CIDA/MLR-Legacy-Service-Docker.svg?branch=master)](https://travis-ci.org/USGS-CIDA/MLR-Legacy-Service-Docker) [![Coverage Status](https://coveralls.io/repos/github/USGS-CIDA/MLR-Legacy-Service-Docker/badge.svg?branch=master)](https://coveralls.io/github/USGS-CIDA/MLR-Legacy-Service-Docker?branch=master)

## Local Configuration
You will need a postgreSQL database to run this application. A Dockerized version is available at https://github.com/USGS-CIDA/MLR_Legacy_DB.
The configuration is located in src/main/results/application.yml. You will need to create an application.yml file in your local project's root directory to provide the variable values. It should contain:

```
keystoreLocation: classpath:yourKeystore.jks
keystorePassword: changeMe
```

## Using Docker
To build the image you will need to provide the location of the jar within 
https://cida.usgs.gov/artifactory/mlr-maven/gov/usgs/wma/mlrLegacy as follows:
``` 
% docker build --build-arg mlr_version=0.8-SNAPSHOT .
```

To run the image, you will need to provide as environment variables the variables listed above. The application
will be available on part 8080 within the container.
