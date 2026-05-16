# Data transfer between RFS and ARC
## Purpose
Recommendations for copying raw data (typically from RFS; warm data) to anf from the data directory on ARC (hot data). This will be achieved using the group specific 'nog_rfs' script. 

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC
- A project on RFS drive
- Install neuronal oscillatiosn group (nog) initialisation files (just do once); see [Initialise Settings and Folders](initialise.md)

### Data folders on ARC explained

- **RFS (warm data)**: Backed-up long-term storate
- **$HOME folder **: 5 GB (view with `echo $HOME`): standard Linux home directory; do not use for data
- **$DATA folder (hot data)**: 15 TB (view with `echo $DATA`): the data 'working directory 
  
Typically, you will copy data from RDS or other sources to the `$DATA` folder for analysis, then copy processed data back to RFS after completion.


## Steps
   
#### Log in to ARC
- Login to ARC login node (use `ssh htc-login` from gateway/entry node'; see [Accessing ARC](accessing-ARC.md)



#### nog_rfs

This functions allows the user to interact with the RFS file storage. Requires that the RFS credentials file is set up (see [initialise](initialise.md)).

```bash
nog_rfs (ls|mkdir|push|pull|rm) REMOTE_FILE [LOCAL_FILE]...
```

#### Lists the contents of RFS
```bash
nog_rfs ls
```
'ls' can take remote subdirectory to list argument (e.g. ```nog_rfs ls "RFS_DIR/RFS_SUBDIR"```)

#### Mmke directory on RFS
```bash
nog_rfs mkdir "NEW_DIR/NEW_SUBDIR" "RFS_DIR/RFS_SUBDIR"
```
'mkdir' can take two arguments - a directory tree to create, and a remote directory to create it in
        (e.g. nog_rfs mkdir "NEW_DIR/NEW_SUBDIR" "RFS_DIR/RFS_SUBDIR")
        if only one is given, remote directory is assumed to be the RFS root directory
```

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



<!--
## Verification
## Troubleshooting
## References

-->
