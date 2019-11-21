# docker-oe116-setup

## docker commands

### Build the docker image

```bash
docker build -t oe116-setup:0.1 -t oe116-setup:latest .
```

### Run the container

```bash
docker run -it --rm --name oe116-setup oe116-setup:latest bash
```

### Install openedge in the container

```bash
/install/openedge/proinst
```

### Do an install for the db server

N to install as full version
OpenEdge Enterprise RDBMS  
Say No to enabling explorer  
Continue with sql enabled  
English - American as language and make default  
Collation - American,United_States,ISO8859-1,Basic,Basic  
Date format - dmy  
Number format - (comma, period)  
Copy the scripts - No  

### Do an install for the appserver

N to install as full version
OpenEdge Application Server  
Say No to enabling explorer  
Say No to using Sonic ESB  
Say No to Webspeed  
English - American as language and make default  
Charset,CollationCase - American,United_States,ISO8859-1,Basic,Basic  
Date format - dmy  
Number format - (comma, period)  
Web Services Adapter URL - <http://localhost:80/wsa/wsa1>  
WSA Authentication - No  
Install - yes  
Copy the scripts - No  

### Do an install for webspeed

N to install as full version  
OpenEdge Application Server  
4GL Development System  
Say No to enabling explorer  
Say No to using Sonic ESB  
Say No to Webspeed  
English - American as language and make default  
Charset,CollationCase - American,United_States,ISO8859-1,Basic,Basic  
Date format - dmy  
Number format - (comma, period)  
Web Services Adapter URL - <http://localhost:80/wsa/wsa1>  
WSA Authentication - No  
Install - yes  
Copy the scripts - No  

### Copy the response.ini, progress.cfg & ubroker.properties from the install to use in other images

```bash
docker cp oe116-setup:/usr/dlc/install/response.ini conf/
docker cp oe116-setup:/usr/dlc/progress.cfg conf/
docker cp oe116-setup:/usr/dlc/properties/ubroker.properties conf/
```

### Stop the container

```bash
docker stop oe116-setup
```

### Clean the container

```bash
docker rm oe116-setup
```

- - -

Please note that this project is released with a [Contributor Code of Conduct](code-of-conduct.md). By participating in this project you agree to abide by its terms.

