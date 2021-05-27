FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y apt-utils g++ ssh openmpi-bin libopenmpi-dev wget tzdata && \
    ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime  ## avoid non-existent /etc/localtime bind point

## example application
RUN mkdir /app
WORKDIR /app
COPY quad_mpi.cpp quad_mpi.cpp
RUN  mpicxx quad_mpi.cpp -o quad_mpi

CMD ["/app/quad_mpi"] 



