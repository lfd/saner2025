## Important Notes

For more flexibility and to debug possible errors, we also provide scripts for individual analysis steps. 
As the holistic pipeline script, they refer to the `project_list` in `/home/saner/analysis/analysis.conf` to select the 
subject projects for analysis.

1. Clone the git repositories of all subject projects:
```
bash /home/saner/analysis/01_git_repos.sh
``` 

2. Analyse all subject projects with Codeface:
```
bash /home/saner/analysis/02_codeface_analysis.sh [number_of_cores]
``` 

3. Analyse all subject projects with Kaiaulu:
```
bash /home/saner/analysis/03_kaiaulu_analysis.sh 
```

4. Data preparation (e.g. identity matching) for the comparative analyses:
```
bash /home/saner/analysis/04_data_preparation.sh  
```

5. Baseline statistics calculation and comparison:
```
bash /home/saner/analysis/05_baseline_comparison.sh  
```

6. Developer network preparation and comparison:
```
bash /home/saner/analysis/06_network_comparison.sh
```

### Troubleshooting

In case Codeface's ID service gets unreachable, please execute:
```
ps aux | grep "node" 
kill [node_process_id]
tmux new -s id
bash start_id_service.sh&
```

Possibly, the analysis run of the affected subject project has to be restarted.

In the event that the analysis fails with one of the MSR tools, we also provide scripts to analyse individual subject projects separately.

Codeface:
```
bash /home/saner/tools/codeface/analysis.sh [project] [number_of_cores]
```

Kaiaulu:
```
bash /home/saner/tools/kaiaulu/analysis.sh [project]
```
