# docker-evaluation-system

> build the system easily

## Build Setup

``` bash
# build docker image named eva
docker build -t=eva:1.0 .

# create a container
docker create -p 80:5050 -p 6800:6800 eva:1.0

# consult the container's id
docker ps -a

# start the container
docker start {id}
```

For a detailed explanation on how things work, check out the [guide](http://www.runoob.com/docker/docker-command-manual.html)
