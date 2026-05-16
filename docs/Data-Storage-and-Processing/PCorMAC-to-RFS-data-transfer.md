# Transer of data betweeen ARC and Mac/PC
## Purpose

Recommendations for copying data to and from Mac or Windows to ARC. This allow for moving data to and from the ARC from data of the PC/Mac or folders that has been mapped/mounted. This could for instance be a mounted RFS folder.

NOTE: this is not suitable for copying large datasets between RFS and ARC as this transfers via the Mac/PC. 

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC
  
## Steps
   

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


<!--
## Verification
## Troubleshooting
## References

-->
