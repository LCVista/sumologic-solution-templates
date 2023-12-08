# sumologic-solution-templates
This repository contains deployment templates for Sumo Logic combo solutions.  

# Why Has this been forked at LCVista??

This repo contains the Terraform package for installing Sumo's AWS Observability (SAO) stack. Following the turorial requires you to install from this repo 
exactly, but with light modifications if you need to monitor more than 1 AWS account (we do). I wanted to make sure that our changes are tracked in source 
control, and also make it possible to use TFC for state management. There are some json files outside of the terraform project's root folder that are read
by the "sumo apps" module at runtime, so TFC will need to pull the whole repo for those files to be available during plan/apply runs.
