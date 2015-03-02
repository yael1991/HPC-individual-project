#!/bin/bash
#@ job_name = test_par_matlab
#@ initialdir = .
#@ output = matlab_%j.out
#@ error = matlab_%j.err
#@ total_tasks = 1
#@ cpus_per_task = 8
#@ wall_clock_limit = 00:05:00

module load MATLAB
matlab -nodisplay -nosplash -r "main_eficiencia"

