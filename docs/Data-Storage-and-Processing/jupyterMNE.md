# Running MNE Python on ARC using Jupyter

## Purpose
We her dmeonstrate how to set up a server for Jupyter in ARC that can be accss from a website on at Window or MacOS computer. 

## Prerequisite
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project `psyc-neuosc` at ARC
- System Environment set up (see [initialise](initialise.md))
- MNE set up (see [Setting up MNE Python](setup-mne.md))

## Steps

### 1. Connect to ARC

**Connect to the VPN**, then access ARC via remote desktop or SSH. You will land on a gateway node.

SSH into the login node:

```bash
ssh -X htc-login
```


#### 2. Start Jupter server
Start a jupyter server that you can connect to from your local machine's browser

```bash
nog_jupyter_server
```

This will take a few seconds to minutes. It will submit a job to ARC to run a jupyter server. 

Advanced: you canspecify options (e.g. requesting a certain amount of memory). For help functions:

```bash
nog_jupyter_server -h
```
To see the submitted jobs (andJOBIDs) use 
```bash
squeue -u $USER
```

To kill a job 
```bash
scancel <JOBID>
```
Note that `ctrl + c` will **not** terminate the job/

## Connect your local machine to Jupyter

In your local machine's Terminal (or MobaXTerm on Windows), copy and paste the `ssh` command that `nog_jupyter_server` prints. It should look something like this:

```bash
ssh -L 8888:htc-cXXX:XXXXX psycXXXX@gateway.arc.ox.ac.uk
```

You will have to enter your password.

After that, open your browser on your local machine and navigate to [http://localhost:8888/tree](http://localhost:8888/tree)
