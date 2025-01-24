# Reproduction Package for "Does the Tool Matter? Exploring Some Causes of Threats to Validity in Mining Software Repositories"

The study uses the mining software repositories (MSR) tools [Codeface](https://github.com/lfd/codeface) and [Kaiaulu](https://github.com/sailuh/kaiaulu/) to extract and analyse ten large software projects, 
quantitatively and qualitatively comparing results and derived data to better understand the causes and impact of 
uncertainties in MSR tools and analysis pipelines.

*NOTE*: An archival version of the pre-built docker image, together with a copy of the git repository and the input and results data, is available at the DOI [https://doi.org/10.5281/zenodo.14091455](https://doi.org/10.5281/zenodo.14091455).

## Repository Contents

- `analysis/`: This directory contains all necessary bash scripts to reproduce our analysis pipeline as presented in the 
paper.
- `data/`: This directory contains the git repositories and the data extracted by the MSR tools Codeface and Kaiaulu.
- `docker/`: This directory contains the entrypoint script for the docker container.
- `log/`: This directory contains log files of the comparative analysis scripts.
- `plot/`: This directory contains the plots from the paper and the source code to generate them in R.
- `results/`: This directory contains all results of the comparative analysis as CSV files.
- `src/`: This directory contains our comparative analysis scripts in Python.
- `tools/`: This directory contains the MSR tools Codeface and Kaiaulu with the configurations and adjustments described 
in the paper.

## Setup 

### 1. Docker 

Our docker image contains all dependencies including libraries, third-party tools and scripts to reproduce our study.
If docker is not yet installed on your system, please consult the
[official installation instructions](https://docs.docker.com/engine/install/).

1. Build the docker image using:
```
docker build -t saner . [2>&1 | tee build.log]
```

2. Run a docker container from the image:
```
docker run --name saner -d -t --user saner saner
```

3. You can then log in to the docker container once and run all following analyses from within the container:
```
docker exec -it saner bash
```
Alternatively, you can prefix the following commands with `docker exec -it saner`.

### 2. Analysis

We provide a single script to run all analysis steps from cloning git repositories, analysis with Codeface and Kaiaulu to 
baseline data and developer network comparisons. 

Executing all analysis steps sequentially can be very time-consuming (up to several weeks) and risky due to sporadic
parallelisation or database errors.

For quickly evaluating our replication package, you can exclude subject projects from the `project_list` 
in the `/home/saner/analysis/analysis.conf` in your docker container. The above script will then only consider the defined
subset of projects. However, be aware that our visualisations are not optimised for this scenario.

If you prefer to analyse the *entire* set of subject projects with more control, or if you experience any errors, please 
refer to the "Important Notes" 
section below.

1. Start the study analysis pipeline in your docker container:

```
bash /home/saner/analysis/analysis.sh
```

2. To inspect the results and visualisations after analysis on localhost, copy the data from the docker container using:
``` 
docker cp saner:/home/saner/data .
docker cp saner:/home/saner/log .
docker cp saner:/home/saner/plot .
docker cp saner:/home/saner/results .
```
