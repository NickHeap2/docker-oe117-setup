# docker-oe117-setup

## docker commands

### Build the docker image

```bash
docker build -t oe117-setup:0.1 -t oe117-setup:latest .
```

### Run the container

```bash
docker run -it --rm --name oe117-setup oe117-setup:latest bash
```

### Install openedge in the container

```bash
/install/oe117/proinst
```

### Do an install for the db server

OpenEdge Enterprise RDBMS  
Say No to enabling explorer  
Continue with sql enabled  
English - American as language and make default  
Collation - American,United_States,ISO8859-1,Basic,Basic  
Date format - dmy   
Number format - (comma, period)  
Copy the scripts - yes  

### Do an install for the appserver

OpenEdge Enterprise RDBMS  
Say No to enabling explorer  
Continue with sql enabled  
English - American as language and make default  
Collation - American,United_States,ISO8859-1,Basic,Basic  
Date format - dmy  
Number format - (comma, period)  
Copy the scripts - yes  

### Copy the response.ini, progress.cfg & ubroker.properties from the install to use in other images

```bash
docker cp oe117-setup:/usr/dlc/install/response.ini .
docker cp oe117-setup:/usr/dlc/progress.cfg .
docker cp oe117-setup:/usr/dlc/ubroker.properties .
```

### Stop the container

```bash
docker stop oe117-setup
```

### Clean the container

```bash
docker rm oe117-setup
```
