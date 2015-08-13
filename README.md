HPCC-Platform-Docker
====================

HPCC running in Docker

...a really simple Docker container for playing around with HPCC. Based on the excellent Docker-noobie friendly [phusion/baseimage](https://github.com/phusion/baseimage-docker).

The container doesn't have a database server configured. It should be fairly easy to add one, or spin up a new container dedicated to running a data store.

**Note:** Do not use this for anything resembling a production environment.

## Usage

First, start up the container:

    $ docker build -t hpcc .
    $ docker run -d -P --name hpcc hpcc

Start HPCC.

    $ docker exec hpcc /etc/init.d/hpcc-init start
      Starting mydafilesrv....       [  OK  ]
      Starting mydali....            [  OK  ]
      Starting mydfuserver....       [  OK  ]
      Starting myeclagent....        [  OK  ]
      Starting myeclccserver....     [  OK  ]
      Starting myeclscheduler....    [  OK  ]
      Starting myesp....             [  OK  ]
      Starting myroxie....           [  OK  ]
      Starting mysasha....           [  OK  ]
      Starting mythor....            [  OK  ]

Now check the port mappings for ECL Watch and ESP.

    $ docker port hpcc
    8002/tcp -> 0.0.0.0:32775
    8010/tcp -> 0.0.0.0:32774

Find out the ip of your docker machine.

    $ docker-machine ip default
    192.168.99.100

You should now be able to hit http://<machine ip>:<exposed port>/ for both
ECL Watch and ESP.

## TODO / BUGS

* The apt-get list in the docker file needs to be slimmed down.
That's actually the list of dependencies to build HPCC, not run it.

* Shouldn't need to exec hpcc-init but not sure correct way to handle
  this when using phusion.
