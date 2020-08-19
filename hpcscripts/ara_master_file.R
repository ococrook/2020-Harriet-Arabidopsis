## arabidopsis master file

## generate file list
filelist <- c("araCO3.R", "araCO3_markers2.R",
              "araCO3rep1.R", "araCO3rep1_markers2.R",
              "araCO3rep2.R", "araCO3rep2_markers2.R", 
              "araCO3rep3.R", "araCO3rep3_markers2.R",
              "araCO3rep4.R", "araCO3rep4_markers2.R",
              "araPBS.R", "araPBS_markers2.R",
              "araPBSrep1.R", "araPBSrep1_markers2.R",
              "araPBSrep2.R", "araPBSrep2_markers2.R",
              "araPBSrep3.R", "araPBSrep3_markers2.R",
              "araPBSrep4.R", "araPBSrep4_markers2.R")

task_id <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID")) + 1


source(filelist[task_id])