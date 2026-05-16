# Data Transfer Between RFS and ARC

## Purpose

Recommendations for copying raw data (typically from RFS; warm data) to and from the data directory on ARC (hot data). This is achieved using the group-specific `nog_rfs` script.

## Prerequisites

- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project `psyc-neuosc` at ARC
- A project on RFS drive
- Install Neuronal Oscillations Group (NOG) initialisation files (one-time setup); see [Initialise Settings and Folders](initialise.md)

## Storage Overview

### Data Folders on ARC Explained

- **RFS (warm data)**: Backed-up long-term storage for archival
- **$HOME folder**: 5 GB (view with `echo $HOME`) — standard Linux home directory; do not use for data
- **$DATA folder (hot data)**: 15 TB (view with `echo $DATA`) — the primary data working directory

**Typical workflow**: Copy data from RFS or other sources to `$DATA` for analysis, then copy processed data back to RFS upon completion.

### The `nog_rfs` Command

The `nog_rfs` function allows interaction with RFS file storage. Requires that RFS credentials are configured (see [Initialise Settings and Folders](initialise.md)).

**Syntax:**
```bash
nog_rfs (ls|mkdir|push|pull|rm) REMOTE_FILE [LOCAL_FILE]...
```

**Options:**

- **`ls`** — List RFS directory contents
  - Takes optional argument: remote subdirectory to list
  - Example: `nog_rfs ls RFS_DIR/RFS_SUBDIR`

- **`mkdir`** — Create a directory on RFS
  - Takes one or two arguments: directory tree to create, and optional remote parent directory
  - Example: `nog_rfs mkdir NEW_DIR/NEW_SUBDIR RFS_DIR/RFS_SUBDIR`
  - If only one argument given, creates in RFS root directory

- **`push`** — Copy local file or directory to RFS
  - Takes one or two arguments: local file/directory, and optional remote destination
  - Example: `nog_rfs push FILE_OR_DIR RFS_DIR/RFS_SUBDIR`
  - If only one argument given, uploads to RFS root directory

- **`pull`** — Copy from RFS to local directory
  - Use `-d` flag for pulling directories; omit for single files
  - Takes one or two arguments: remote file/directory, and optional local destination
  - Example: `nog_rfs pull -d RFS_DIR/RFS_SUBDIR $DATA/DIR/`
  - If only one argument given, downloads to current working directory

- **`rm`** — Delete file or directory on RFS (use with caution)
  - Use `-d` flag for deleting directories; omit for single files
  - Takes one argument: remote file or folder path
  - Example: `nog_rfs rm -d RFS_DIR/RFS_SUBDIR`

---

## Workflow Examples

### Log In to ARC

```bash
ssh htc-login
```
See [Accessing ARC](accessing-ARC.md) for detailed login instructions.

### List RFS Contents

**List RFS root directory:**
```bash
nog_rfs ls
```

**List specific RFS subdirectory:**
```bash
nog_rfs ls DIR/SUBDIR/
```

### Copy Data from RFS to ARC

**Copy single file to current directory:**
```bash
nog_rfs pull RFS_FILE
```

**Copy file to specific ARC directory:**
```bash
nog_rfs pull RFS_FILE $DATA/DIR/
```

**Copy entire directory from RFS:**
```bash
nog_rfs pull -d RFS_DIR/ $DATA/LOCAL_DIR/
```

### Copy Data from ARC to RFS

**Copy file to RFS root:**
```bash
nog_rfs push LOCAL_FILE
```

**Copy directory to RFS root:**
```bash
nog_rfs push LOCAL_DIRECTORY
```

**Copy to specific RFS subdirectory:**
```bash
nog_rfs push LOCAL_DIR RFS_DIR/
```

### Create RFS Directories

**Create new directory in RFS root:**
```bash
nog_rfs mkdir NEW_DIR
```

**Create nested directory structure:**
```bash
nog_rfs mkdir NEW_SUBDIR/NESTED_SUBDIR RFS_DIR/
```

### Remove Files and Directories from RFS

**Remove file:**
```bash
nog_rfs rm RFS_DIR/RFS_FILE
```

**Remove directory (use with caution):**
```bash
nog_rfs rm -d RFS_DIR/RFS_SUBDIR
```

---

<!--
## Verification
## Troubleshooting
## References
-->
