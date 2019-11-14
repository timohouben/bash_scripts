#!/bin/bash

cd "$(dirname "$0")"
for i in *;do mv ${i}/*.tec ${i}/steady;done
for i in *;do mv ${i}/*.pvd ${i}/steady;done
for i in *;do mv ${i}/*.vtu ${i}/steady;done

