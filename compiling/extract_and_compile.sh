#!/bin/bash

## to take arguments use $1 (for first arg)

# uncompress and extract to a directory, create one if it doesn't exist yet
tar -xzf NthPrime.tgz --one-top-level=NthPrime
# move into that new directory
cd NthPrime
# compile the c files into an executable named NthPrime
gcc main.c nth_prime.c -o NthPrime
# run NthPrime with the first provided argument
./NthPrime $1