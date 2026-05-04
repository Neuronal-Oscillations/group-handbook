# Analysis of OHBA imaging data. 
## Purpose

Recommendations for analyzing imaging data including MEG, OPM, and MRI data. We recommend using the Oxford Advanced Research Computing (ARC) for data analysis. We assume raw primary data to be stored on the Oxford RFS.

A typical workflow involves:
1. Copying raw data (typically from RFS) to the data directory on ARC
2. Performing analysis on ARC
3. Copying output data back to the core store (typically RFS)

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- 
## Steps

### Requesting access to the ARC 

The Neuronal Oscillations project on the ARC infrastructure is called "psyc-neuosc". Users can apply for individual accounts on the ARC systems by visiting the [OxIntranet page](https://unioxfordnexus.sharepoint.com/sites/OxIntranet-research-innovation/SitePages/ARC-accessing-ARC.aspx?Mode=Edit#requesting-a-user-account) and selecting the psyc-neuosc project.The Neuronal Oscillations project on the ARC infrastructure is called "psyc-neuosc". Users can apply for individual accounts on the ARC systems by visiting the [OxIntranet page](https://unioxfordnexus.sharepoint.com/sites/OxIntranet-research-innovation/SitePages/ARC-accessing-ARC.aspx?Mode=Edit#requesting-a-user-account) and selecting the psyc-neuosc project.


### Accessing the ARC from webinterface (from Windows or MacOS) 

1. Connect via web browser to [nx.arc.ox.ac.uk](https://nx.arc.ox.ac.uk/)
2. Login using your SSO username and password
3. Select "Create a new desktop or custom session"
4. Select "Create a new virtual desktop"
5. Once the desktop opens, launch applications from the menu (bottom left corner)
   

#### Data folders on ARC explained

- **RFS (warm data)**: Not mounted automatically
- **$HOME folder**: 15 GB (view with `echo $HOME`)
- **$DATA folder**: 5 TB (view with `echo $DATA`)
Typically, you will copy data from RDS or other sources to the `$DATA` folder for analysis, then copy processed data back to RFS after completion.

### Coyping files to and from ARC

#### Windows (Command Line)

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


#### Windows (Graphical Interface Alternative)

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

  
### Cloning github

Terminal in ARC

Log into your github.com account and find repository do clone; e.g.
```bash
git clone https://github.come/FLUX-pipeline/Cerca
```

Clone only needs to be done once. To later pull latest changes from central to local repository 
```bash
git pull https://github.come/FLUX-pipeline/Cerca
```

Changes can now be made to e.g. FILE.py

To  add latest changes from local to central repository 
```bash
git add FILE.py
git commit -m "DESCRIPTION OF CHANGES"
git push origin main
```






### Running MNE Python in Jupyter Notebook

First time:
```bash
module load Anaconda3/2024.02-1 
conda create -n mne_env python=3.11 mne jupyter jupyterlab -c conda-forge 
```

After installation activate

```bash
conda activate mne_env
```

Install mne-bids
```bash
conda install --channel conda-forge mne-bids
```

And activate again
```bash
conda activate mne_env
```

and run jupyter:

```bash
jupyter notebook
```

The final step is link the MNE environtment to Jupyter:
```bash
python -m ipykernel install --user --name=mne --display-name "Python (MNE)"
```

Now start Jupyher and change to the MNE KerneL: 

1. Launch Jupyter Notebook (go to '>' in lower left corner pf the NoMachine interface and find Jupyter under applications.
2. Open your desired notebook.
3. Go to the top menu and select Kernel 
4.Change kernel.Choose "Python (MNE)" from the list.


###
[The ARC user guide](https://arc-user-guide.readthedocs.io/en/latest/introduction.html)


<!--
## Verification
## Troubleshooting
## References

-->
