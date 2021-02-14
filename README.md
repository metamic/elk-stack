# elk-stack

This project is created for users who want to use ELK easily.

the stack is configured separated each project.

so you can git clone like below for submodules.
```
git clone ---recursive https://github.com/metamic/elk-stack
```

Please use ELK-Stack for your projects easily.

Thank you :)


## usage
in your terminal

first, clone this project
```
git clone https://github.com/metamic/elk-stack.git
cd elk-stack
```

second, change ELK version default is below
```
ELASTICSEARCH_VERSION=7.10.0
KIBANA_VERSION=7.10.1
LOGSTASH_VERSION=7.10.1

# ELASTICSEARCH_PASSWORD=mypassword <<< for security reasons, it is recommended to register as an environment variable.
```

third, change your elastic search password.

🔑this is very important your server security. (use careful '#')

```
export ELASTICSEARCH_PASSWORD=<YOUR PASSWORD>
```

last, start script
```
chmod 755 ./start.sh
./start.sh
```

if you got 'data too large' error, you can change jvm.options of elasticsearch

```
docker exec -it elasticsearch /bin/bash
vim  /usr/share/elasticsearch/config/jvm.options

# change this
-Xms4g
-Xmx4g
```
