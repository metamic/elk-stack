# elk-stack

This project is created for users who want to use ELK easily.

Please use ELK-Stack for your projects easily.

Thank you :)


## usage
in your terminal

first, clone this project
```
git clone https://github.com/metamic/elk-stack.git
cd elk-stack
```

second, change your login password in .env

🔑this is very important your server security.
```
ELASTICSEARCH_VERSION=7.10.0
KIBANA_VERSION=7.10.1
LOGSTASH_VERSION=7.10.1

ELASTICSEARCH_PASSWORD=mypassword <<< here
```

last, run script
```
chmod 755 ./run.sh
./run.sh
```
