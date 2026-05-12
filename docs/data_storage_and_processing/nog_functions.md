# Prerequisite

- you are on a login node (not gateway, use `ssh htc-login`)
- System Environment set up (see `first_steps`)
- MNE set up for `nog_jupyter_server` (see `setup_mne`)
- some mamba environment to be used with vscode set up for `nog_vscode_server` (see `setup_mamba_environment`)

# What are they ?

They are command line functions that should streamline the interaction with the ARC cluster.
Once installed correctly (see "first_steps"), they can be accessed from the ARC terminal.
To make nog functions work properly, you MUST follow the setup procedure documented in "first_steps"

# Why nog ?

`nog` is short for Neuronal Oscillations Group. The prefix allows the user to easier distinguish between nog functions and other system commands.

# nog_jupyter_server

This functions will submit a batch job to the cluster, which sets up a jupyter server that you can connect to from your laptop:

```bash
nog_jupyter_server
```

Optional arguments and usage:

```bash
nog_jupyter_server [-h] [-b] [-m MEM] [-c CPUs] [-t TIME] [-p PARTITION]
  -h  help
  -m  memory (default: 16G)
  -c  CPUs (default: 8)
  -t  walltime (default: 08:00:00)
  -p  partition (default: medium)
```

Example:

```bash
nog_jupyter_server -m 16G -t 08:00:00
```

A server will start in the background and shortly after, instructions on how to connect will be printed to the Terminal. When connecting to the server, be patient, as this can take up to several minutes until everything is set up.

# nog_vscode_server

This functions will submit an interactive or batch job to the cluster, which sets up a VSCode server that you can connect to from your laptop:

```bash
nog_vscode_server
```

Optional arguments and usage:

```bash
nog_vscode_server [-h] [-b] [-g] [-m MEM] [-c CPUs] [-t TIME] [-p PARTITION]
  -h  help
  -b  batch mode (default: interactive)
  -g  request GPU
  -m  memory (default: 16G)
  -c  CPUs (default: 4)
  -t  walltime (default: 08:00:00)
  -p  partition (default: medium)
```

Example:

```bash
nog_vscode_server -m 16G -t 08:00:00
```

A server will start in the background and shortly after, instructions on how to connect will be printed to the Terminal. When connecting to the server, be patient, as this can take up to several minutes until everything is set up.

# nog_rfs

This functions allows the user to interact with the RFS file storage. Requires that the RFS credentials file is set up (see `first_steps`).

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

## 1. List RFS files and folders

```bash
# list files in RFS root
nog_rfs ls

# list files in RFS subdir
nog_rfs ls SOME_DIR/SOME_SUBDIR/
```

## 2. Create new directory on RFS

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

## 3. Push data to RFS

```bash
# Push files or directories to root
nog_rfs push file_or_dir

# Push files or directories to other directory
nog_rfs push file_or_dir OTHER_DIR/
```

## 4. Pull data from RFS

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

## 5. Remove files or directories from RFS

Note that here you have to indicate whether you want to remove a file or directory. Use the `-d` flag to remove directories (no flag = file).

```bash
# Remove file
nog_rfs rm RFS_DIR/RFS_SUBDIR/rfs_file

# Remove directory
nog_rfs rm -d RFS_DIR/RFS_SUBDIR
```
