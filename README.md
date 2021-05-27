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

See our [general instructions for creating Singularity images for Savio](https://docs-research-it.berkeley.edu/services/high-performance-computing/user-guide/software/using-software/using-singularity-savio/#creating-singularity-container-images) for various ways to build the container.

One could also create a Singularity .def file that bootstraps off a base Ubuntu Singularity or Docker container and then converts the various Docker RUN commands found in the Dockerfile here into Singularity %post commands.
