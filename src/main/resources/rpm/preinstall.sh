#!/bin/sh

# create group and user account if they do not exist
if [ ! -n "`/usr/bin/getent group pivotal`" ]; then
    /usr/sbin/groupadd -r pivotal 2> /dev/null
fi

if [ ! -n "`/usr/bin/getent passwd spring-xd`" ]; then
    # Do not attempt to create a home dir at this point in the RPM install
    # because the parent dirs do not yet exist and we can't be certain 
    # about /home
    /usr/sbin/useradd -c "Spring-XD User" -r -g pivotal -M spring-xd 2> /dev/null
fi

