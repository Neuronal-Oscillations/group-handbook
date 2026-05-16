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

#### Lists the contents of RFS
List files in RFS root
```bash
nog_rfs ls
```
List files in RFS sub directions
```bash
nog_rfs ls DIR/SUBDIR/
```
#### Copy file from RFS to ARC

Copy RFS FILE to current directory
```bash
nog_rfs pull RFS_FILE
```
Copy RFS FILE to specific directory
```bash
nog_rfs pull rfs_file $DATA/DIR
```

#### Copy RFS directory to ARC
```bash
mkdir RFS_FFS_DIR
nog_rfs pull -d RFS_DIE RFS_DIR/
```


#### Copy ARC file to RFS root
```bash
nog_rfs push ARC_FILE
```

#### Copy ARC directory to RFS root
```bash
nog_rfs push ARC_DIRECTORY
```
#### Copy ARC directroy from RFS directpry
```bash
nog_rfs push ARC_DIR RFS_DIR/
```
#### Remove file on RFS to
```bash
nog_rfs rm RFS_DIR/FRS_FILE
```

#### Remove directroy on RFS to (use with caution)
```bash
nog_rfs rm -d RFS_DIR/RFS_SUBDIR
```


#### New RFS directory on root
```bash
nog_rfs mkdir "NEW_DIR
```

#### New RFS directory in other directory
```bash
nog_rfs mkdir NEW_SUBDIR NEW_DIR/
```

<!--
## Verification
## Troubleshooting
## References

-->
