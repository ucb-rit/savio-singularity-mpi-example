FROM ubuntu:18.04

ARG SAVIO=1

RUN apt-get update \
    && apt-get install -y apt-utils g++ ssh openmpi-bin libopenmpi-dev wget tzdata && \
    ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime  ## avoid non-existent /etc/localtime bind point

## if planning to use on Savio
RUN if [ ${SAVIO} = "1" ]; then \
mkdir -p /global/home/users /global/scratch; \
fi
## ideally would use -m when building singularity container but see Github issue filed by Chris Paciorek; there is PR to fix this pending

## example application
RUN mkdir /app
WORKDIR /app
COPY quad_mpi.cpp quad_mpi.cpp
RUN  mpicxx quad_mpi.cpp -o quad_mpi

CMD ["/app/quad_mpi"] 



