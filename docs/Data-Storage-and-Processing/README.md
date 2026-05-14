# A howto for using ARC and RFS
## Purpose
We here explain the steps of using the ARC and RFS. This includes getting, accounts, loggin in to the systems and executing MNE Python scripts. 

A typical workflow involves:

- Copying raw data (typically from RFS; "warm data") to the $DATA directory on ARC ("hot data")
- Performing analysis on ARC Computing Nodes
- Interactive sessions using Jupyter or VS Code be can done via PC/MAC communicating with a client on the Computing Nodes 
- Copying output on $DATA back to the warm storage (typically RFS)

<img width="1456" height="797" alt="image" src="https://github.com/user-attachments/assets/1b4003c2-6cdf-4b57-ab1a-5189441a937a" />


## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)

  
## Steps
- [Advanced Ressearch Computing (ARC)](accessing-ARC.md)
- [Research File System (RFS)](storage.md)
- [Initialise Settings and Folders](initialise.md)
- [Initialise NOG functions](nog-functions.md)
- [Setting up MNE Python](setup-mne.md)
- [Using Jupyter to run MNE Python](using-jupyter.md)

Useful instructions
- [Copying between RFS and data directories on ARC](RFS-to-ARC-data-transfer.md)
