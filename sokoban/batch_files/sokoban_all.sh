#!/bin/bash
### sbatch config parameters must start with #SBATCH and must precede any other command. to ignore just add another # - like so ##SBATCH
#SBATCH --partition main ### specify partition name where to run a job
##SBATCH --time 7-00:00:00 ### limit the time of job running. Format: D-H:MM:SS
#SBATCH --job-name sokoban_all ### name of the job. replace my_job with your desired job name
#SBATCH --output sokoban_all.out ### output log for running job - %J is the job number variable
#SBATCH --mail-user=tomya@post.bgu.ac.il ### users email for sending job status notifications replace with yours
#SBATCH --mail-type=BEGIN,END,FAIL ### conditions when to send the email. ALL,BEGIN,END,FAIL, REQUEU, NONE
#SBATCH --mem=100G ### total amount of RAM
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32 ##. // max 128

### Start you code below ####
module load anaconda ### load anaconda module
source activate BPLiveExecution
files=("map_13_12_1" "map_6_7_3" "map_10_7_2" )
for file in "${files[@]}"; do
  echo "$file"
  ~/.conda/envs/BPLiveExecution/bin/python ~/repos/BPLiveExecution/main_sokoban.py "$file" "0"
done
