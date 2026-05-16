# Data transfer between RFS and ARC
## Purpose

Recommendations for copying data to and from ARC to RFS.  

1. Copying raw data (typically from RFS; warm data) to the data directory on ARC (hot data)
2. Performing analysis on ARC
3. Copying output data back to the core store (typically RFS)

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC
- A project on RFS drive 
  
## Steps
   
####
- Login to ARC login node (use `ssh htc-login` from gateway/entry node' see [Accessing ARC](accessing-ARC.md)


#### Data folders on ARC explained

- **RFS (warm data)**: Not mounted automatically
- **$HOME folder (no for data)**: 5 GB (view with `echo $HOME`)
- **$DATA folder (hot data)**: 15 TB (view with `echo $DATA`)
  
Typically, you will copy data from RDS or other sources to the `$DATA` folder for analysis, then copy processed data back to RFS after completion.


#### Windows (Command Line - recommended)

Start Terminal in Windows

**From ARC to Windows:**
```bash
scp psyc9999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/mydata/* C:\Users\bobhanson\
```
This copies the `mydata` folder (and subfolders) from the ARC data directory (`$DATA`) to your C: drive.
 
**From Windows to ARC:**
```bash
scp -r C:\Users\bobhanson\mydata\* psyc9999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/
```
This copies the `mydata` folder (and subfolders) from your C: drive to the ARC data directory (`$DATA`). The `-r` flag enables recursive copying of all subfolders.


#### Windows (Graphical Interface Alternative - not recommended)

1. Download and install [WinSCP](https://winscp.net/eng/docs/installation)
2. Connect to `gateway.arc.ox.ac.uk` using your credentials
3. Navigate to your ARC data directory
4. Drag and drop files between your Windows machine and ARC
5. To access RFS, navigate to the mapped network drive (e.g., R:)
- <img width="813" height="549" alt="image" src="https://github.com/user-attachments/assets/eb9b564f-71c4-4c21-920d-032798bc9bdf" />

#### macOS (Command Line)

Start Terminal in MacOS 

**From ARC to macOS:**
```bash
`scp psyc9999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/mydata/* /Users/bobhanson/`
```
This copies the `mydata` folder (and subfolders) from ARC to your local drive.
 
**From macOS to ARC:**
```bash
`scp /Users/bobhanson/maydata/* psyc999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/`
```
This copies the `mydata` folder (and subfolders) from your local folder to the ARC data directory. The `-r` flag enables recursive copying.


###
[The ARC user guide](https://arc-user-guide.readthedocs.io/en/latest/introduction.html)


<!--
## Verification
## Troubleshooting
## References

-->
