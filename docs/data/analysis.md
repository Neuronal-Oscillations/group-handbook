# Analysis of OHBA imaging data. 
## Purpose
Recommendation for the analysis imaging data incluyding MEG, OPM and MRI data. We advise to use the Oxford Advanced Research Computing for data analysis. We assume try primary data to be stored on the OXford RFS.                                        .

## Prerequisites
A SSO account at University of Oxford

## Steps

### Requesting access to the ARC 
The Neuronal Oscillations project on the ARC infrastructure called is "psyc-neuosc".Users can now apply for their individual accounts on the ARC systems by visiting our OxIntranet page: [request user account](https://unioxfordnexus.sharepoint.com/sites/OxIntranet-research-innovation/SitePages/ARC-accessing-ARC.aspx?Mode=Edit#requesting-a-user-account) and selecting that project.

### Accessing the ARC from Windows

- Connect directly via web browser to [nx.arc.ox.ac.uk](https://nx.arc.ox.ac.uk/)
- Login using you SSO username and password
- Press "Create a new desktop or custom session"
- Press "Create a new virtual desktop"
- After the Desktop is open launch application from lower left corner (>)

### Data folders on ARc explain
- The RFS (warm data) is not mounted automatically
- The $HOME folder is 15 GB  [to show write `echo $HOME`]
- the $DATA folder is 5TB [to show write `echo $DATA`]
- Typically you will copy data from RDS (or elsewere) to the $DATA for analysis
- After end analysis cope data back to RFS (or warm data repository)

### Coyping files to and from ARC

#### Windows

-Start the application Terminal

From ARC to Windows

`scp psyc9999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/text.txt C:\Users\bobhanson\`

The above will copy the file 'test.txt' from data directory ($DATA) on ARC to the users C: drive 

From Window to ARC

`scp C:\Users\ojensen\test.txt psyc999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/`

The above will copy the file 'test.txt' from the users C: drive to the data directory ($DATA) on ARC 

Use the `-r` option to copy recursively (all sub-folders) 

#### Graphical interface in Windows
- Use [WinSCP](https://winscp.net/eng/docs/installation)
- <img width="813" height="549" alt="image" src="https://github.com/user-attachments/assets/eb9b564f-71c4-4c21-920d-032798bc9bdf" />
- Now you can transfer between the drives your Window machine has access to and your ARC account
- To transfer from RFS navigate to the mapped drive (e.g. R:)

#### MacOS

BELOW TO BE TESTED

-Start the application terminal (xterm)

From ARC to Windows

`scp psyc9999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/text.txt \Users\bobhanson\`

The above will copy the file 'test.txt' from data directory ($DATA) on ARC to the users C: drive 

From Window to ARC

`scp \Users\ojensen\test.txt psyc999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/`

The above will copy the file 'test.txt' from the users C: drive to the data directory ($DATA) on ARC 

Use the `-r` option to copy recursively (all sub-folders) 


  
### Starting Python

### Starting MNE Python

### Mounting the RFS drive

### Editing scripts

###
[The ARC user guide](https://arc-user-guide.readthedocs.io/en/latest/introduction.html)


<!--
## Verification
## Troubleshooting
## References

-->
