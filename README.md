# savio-singularity-mpi-example
Materials for creating Singularity container for running a very basic MPI job on Savio, where Savio's mpirun executes the singularity container in parallel. 

## Running the container

Note that you need openMPI >= 2.1.x on Savio.

```
module load intel openmpi/2.1.3-intel
mpirun singularity run mpi.simg                 ## directly run the default command
mpirun singularity exec mpi.simg /app/quad_mpi  ## alternative to invoke manually
```

## Building the container

See our [general instructions for creating Singularity images for Savio](https://github.com/ucb-rit/savio-singularity-template) for various ways to build the container.

Here's one specific way that builds a Docker image first and then creates the Singularity container from the Docker image.

```
# build image with configuration
docker build -t mpi-example  --build-arg SAVIO=1 .

# build singularity container
# the following -m with spaces does not work, but PR is pending
# -m "/global/scratch /global/home/users"
docker run -v /var/run/docker.sock:/var/run/docker.sock \
       -v /tmp:/output --privileged -t --rm \
       singularityware/docker2singularity \
       mpi-example
```



One could also create a Singularity .def file that bootstraps off a base Ubuntu Singularity or Docker container and then converts the various Docker RUN commands into Singularity %post commands.
