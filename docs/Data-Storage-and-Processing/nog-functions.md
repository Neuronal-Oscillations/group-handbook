# nog functions
Functions for the neuronal oscillations group (nog). They are command line functions that should streamline the interaction with the ARC cluster.
Once installed correctly (see [initialise](initialise.md)), they can be accessed from the ARC terminal.
To make nog functions work properly, you MUST follow the setup procedure documented in [initialise](initialise.md)

Available Functions:
- [nog_jupyter_server](#nog_jupyter_server)
- [nog_vscode_server](#nog_vscode_server)
- [nog_rfs](#nog_rfs)
- [nog_slurm](#nog_slurm)

## Prerequisite

- you are on a login node (not gateway, use `ssh htc-login`)
- System Environment set up (see [initialise](initialise.md))
- MNE set up for `nog_jupyter_server` (see [setup-mne](setup-mne.md))
- some mamba environment to be used with vscode set up for `nog_vscode_server` (see [setup-mamba-environment](setup-mamba-environment.md))

## nog_jupyter_server

This functions will submit a batch job to the cluster, which sets up a jupyter server that you can connect to from your laptop:

```bash
nog_jupyter_server
```

Optional arguments and usage:

```bash
nog_jupyter_server [-h] [-b] [-m MEM] [-c CPUs] [-t TIME] [-p PARTITION] [-C CLUSTER]
  -h  help
  -m  memory (default: 16G)
  -c  CPUs (default: 8)
  -t  walltime (default: 08:00:00)
  -p  partition (default: medium)
  -C cluster (default: htc)
```

Example:

```bash
nog_jupyter_server -m 16G -t 08:00:00
```

A server will start in the background and shortly after, instructions on how to connect will be printed to the Terminal. When connecting to the server, be patient, as this can take up to several minutes until everything is set up.

## nog_vscode_server

This functions will submit an interactive job to the cluster, which sets up a VSCode server that you can connect to from your laptop:

```bash
nog_vscode_server
```

Optional arguments and usage:

```bash
nog_vscode_server [-h] [-g] [-m MEM] [-c CPUs] [-t TIME] [-p PARTITION] [-C CLUSTER]
  -h  help
  -g  request GPU
  -m  memory (default: 16G)
  -c  CPUs (default: 4)
  -t  walltime (default: 08:00:00)
  -p  partition (default: medium)
  -C cluster (default: htc)
```

Example:

```bash
nog_vscode_server -m 16G -t 08:00:00
```

A server will start in the background and shortly after, instructions on how to connect will be printed to the Terminal. When connecting to the server, be patient, as this can take up to several minutes until everything is set up.

## nog_rfs

This functions allows the user to interact with the RFS file storage. Requires that the RFS credentials file is set up (see [initialise](initialise.md)).

```bash
nog_rfs (ls|mkdir|push|pull|rm) REMOTE_FILE [LOCAL_FILE]...

'ls' can take one argument - remote subdirectory to list (e.g. nog_rfs ls "RFS_DIR/RFS_SUBDIR")

'mkdir' can take two arguments - a directory tree to create, and a remote directory to create it in
        (e.g. nog_rfs mkdir "NEW_DIR/NEW_SUBDIR" "RFS_DIR/RFS_SUBDIR")
        if only one is given, remote directory is assumed to be the RFS root directory

'push' can take two arguments - local file or directory to push, and remote directory to put it into
       (e.g. nog_rfs push "FILE_OR_DIR" "RFS_DIR/RFS_SUBDIR")
       if only one is given, remote directory is assumed to be the RFS root directory

'pull' [-d] can take two arguments - remote directory to fetch, and local directory to put it into
       -d for pulling directories. Ommit -d for single files
       (e.g. nog_rfs pull -d "RFS_DIR/RFS_SUBDIR" "//data/psyc-neuosc/psyc1908/")
       if only one is given, local directory is assumed to be the current working directory

'rm' [-d] takes one argument - remote file or folder to delete
     -d for deleting directories. Ommit -d for single files
     (e.g. nog_rfs rm -d "RFS_DIR/RFS_SUBDIR")
```

### 1. List RFS files and folders

```bash
# list files in RFS root
nog_rfs ls

# list files in RFS subdir
nog_rfs ls SOME_DIR/SOME_SUBDIR/
```

### 2. Create new directory on RFS

```bash
# make new directory in root
nog_rfs mkdir NEW_DIR

# make new directory in other directory
nog_rfs mkdir NEW_SUBDIR NEW_DIR/

# make new directory tree in root
nog_rfs mkdir NEW_DIR/NEW_SUBDIR

# make new directory tree in other directory
nog_rfs mkdir NEW_SUBSUBDIR/NEW_SUBSUBSUBDIR NEW_DIR/NEW_SUBDIR
```

### 3. Push data to RFS

```bash
# Push files or directories to root
nog_rfs push file_or_dir

# Push files or directories to other directory
nog_rfs push file_or_dir OTHER_DIR/
```

### 4. Pull data from RFS

Note that here you have to indicate whether you want to push a file or directory. Use the `-d` flag to pull directories (no flag = file). Note that when pulling a directory, not the directory itself, but it's content gets pulled.

```bash
# pull file to current directory
nog_rfs pull rfs_file

# pull file to other directory
nog_rfs pull rfs_file $DATA/

# pull directory to current directory
mkdir rfs_data
nog_rfs pull -d rfs_data rfs_data/

# pull directory to other directory
mkdir $DATA/rfs_data
nog_rfs pull -d rfs_data $DATA/rfs_data/
```

### 5. Remove files or directories from RFS

Note that here you have to indicate whether you want to remove a file or directory. Use the `-d` flag to remove directories (no flag = file).

```bash
# Remove file
nog_rfs rm RFS_DIR/RFS_SUBDIR/rfs_file

# Remove directory
nog_rfs rm -d RFS_DIR/RFS_SUBDIR
```

## nog_slurm

Useful for starting, monitoring or canceling jobs.

```bash
nog_slurm <action> [OPTIONS]
```
The main function call is followed by one of those actions. See `help` and examples for every action below:

- [help](#help)
- [submit](#submit)
- [list](#list)
- [usage](#usage)
- [log](#log)
- [cancel](#cancel)
- [exec](#exec)

### help
```bash
Usage: nog_slurm <action> [ACTION OPTIONS]

Actions:
  help           Show this help message
  submit         Submit a script as a SLURM batch job (must be .sh or .py)
  list           List your jobs (optional live view)
  usage          Show current and maximum memory (optional live view)
  log            View log file of running job (optional live view)
  cancel         Cancel jobs
  exec           Execute a command when a job starts or finishes

Options for submit:
  -e <env>       Path to conda / mamba environment to activate before running (default: none)
  -c <cpus>      Number of CPUs requested (default: $CPUs)
  -g <gpu>       Set GPU specification. Uses --gres=<gpu> (default: no GPU)
  -m <mem>       Memory requested (default: $MEM)
  -p <partition> Partition to submit to (default: $PARTITION)
  -t <time>      Wall time limit (default: $TIME)
  -w [id]        Wait for a job to finish before starting. Without argument waits for
                 last submitted (default). Otherwise specify [id]. 
                 Uses --dependency=afterany:[id]
  -C <cluster>   Start job on specified cluster (default: $CLUSTER)

Options for list:
  (none)         List all current jobs
  -l             Live update every $UPDATE_TIME seconds
  -C <cluster>   Show result for specified cluster (default: $CLUSTER)

Options for usage:
  (none)         Show output for last submitted job
  -j <id>        Show output for a specific job ID
  -l             Live update every $UPDATE_TIME seconds
  -s             Shows list of jobs. Select job via index.
  -C <cluster>   Show result for specified cluster (default: $CLUSTER)

Options for log:
  (none)         Show output for last submitted job
  -j <id>        Show output for a specific job ID
  -l             Live update every $UPDATE_TIME seconds
  -s             Shows list of jobs. Select job via index.
  -C <cluster>   Show result for specified cluster (default: $CLUSTER)

Options for cancel:
  (none)         Cancel last submitted job
  -a             Cancel ALL jobs on $CLUSTER
  -j <id[,id]>   Cancel specified comma-separated job IDs
  -s             Shows list of jobs. Select via comma seperated indices.
  -C <cluster>   Operate on jobs for specified cluster (default: $CLUSTER)

Options for exec:
  (none)         Watch last submitted job, execute when finished
  -j <id>        Watch a specific job ID
  -s             Shows list of jobs. Select job to watch via index.
  -r             Execute when job starts running (default: wait for finish)
  -C <cluster>   Operate on jobs for specified cluster (default: $CLUSTER)

Examples:
  nog_slurm submit MyScript.sh           # submit bash script with defaults
  nog_slurm submit -e MyEnv -g 1 -m 32G -c 16 -t 24:00:00 -p long MyScript.py arg1 arg2

  nog_slurm submit -w MyScript.py        # wait for last submitted job to finish before running
  nog_slurm submit -w 12345 MyScript.py  # wait for job 12345 to finish before running

  nog_slurm list                         # list current jobs on $CLUSTER
  nog_slurm list -C arc -l               # list current jobs on arc, live update

  nog_slurm usage -j 12345               # report usage for job 12345
  nog_slurm usage -j 12345 -l            # live update for job 12345

  nog_slurm log -l                       # Show log file for last job, live update
  nog_slurm log -j 12345                 # Show log file for job 12345

  nog_slurm cancel                       # cancel last job on $CLUSTER
  nog_slurm cancel -s                    # cancel selected jobs on $CLUSTER

  nog_slurm cancel -a -C arc             # cancel all jobs on arc
  nog_slurm cancel -j 12345,12346        # cancel specific jobs on $CLUSTER

  nog_slurm exec "echo done"             # Print "done" after last submitted job finished
  nog_slurm exec -r "echo started"       # Print "started" after last submitted job started
  nog_slurm exec -s -r "bash notify.sh"  # select job, run script on start
```

### submit

```bash
nog_slurm submit -e $DATA/environments/mne_env -m 32G -c 16 -t 12:00:00 -w 123456 $DATA/scripts/MyScript.py S42
```

Submits a batch job that looks like this:

```bash
#!/bin/bash
#SBATCH --partition=short
#SBATCH --job-name=MyScript
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --clusters=htc
#SBATCH --output=$DATA/logs/MyScript-%j.log
#SBATCH --error=$DATA/logs/MyScript-%j.log
#SBATCH --dependency=afterany:123456

source $HOME/.bashrc
source activate $DATA/environments/mne_env

python $DATA/scripts/MyScript.py S42
```

This will request 32 Gb of memory, 16 CPUs, for 12 hours, and submits a job that activates the mamba environment `mne_env` and runs the script `MyScript.py` with `S42` as an argument. However, this job will only start after job 123456 finished (`-w 123456`). 

Note that either `mamba` or `conda` is expected to be available via `~/.bashrc` in order to load environments. See [initialise](initialise.md) on how to setup your system environment.

### list

```bash
nog_slurm list -l
```

This will show all currently running jobs on `htc` and update the view every 10s (`-l` for "live"). Omit `-l` for a one time lookup.

### usage

```bash
nog_slurm usage -j 123456 -l
```

Shows a live view (`-l`) of memory usage of job 123456 (`-j 123456`), which updates every 10s.

### log

```bash
nog_slurm log -s -l
```

Displays all jobs, of which you can select one running jobs (`-s`). The log file corresponding to this job will be displayed in terminal and live updated (`-l`).

### cancel

```bash
nog_slurm cancel -s -C arc 
```

Displays all jobs, of which you can select jobs to be canceled (`-s`) in a comma separated format (e.g. `1,3,4`). Selected jobs are canceled on the "arc" cluster (`-C arc`). If you e.g. want to cancel all jobs on "htc" use `nog_slurm cancel -a -C htc`.

### exec

```bash
nog_slurm exec -j 123456 -r "nog_slurm log -l -j 123456"
```

After job 123456 (`-j 123456`) is listed as running (`-r`), show a live view of its log file (`"nog_slurm log -l -j 123456"`).
