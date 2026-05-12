After following the instructions below, you should have a downloaded version of FLUX, a working MNE environment and jupyter installed with a MNE kernel. You should be able to connect to a jupyter server that is running on an ARC compute node from your local machine's browser.

# First things first

- connect to VPN
  
- connect to ARC (via remote desktop or SSH). You end up at a gateway node.
  
- ssh into login node (`ssh htc-login`)
  

# Install MNE

You can use the script `setup_mne.sh` to download FLUX and install MNE:

```bash
cd $DATA
git clone https://github.com/Neuronal-Oscillations/group-handbook
cd group-handbook


bash code/hpc/setup_mne.sh
```

# Start Jupyter job on cluster

You can use the script `start_jupyter.sh`

```bash
bash code/hpc/start_jupyter.sh
```

There are 4 optional arguments for requesting resources:

```bash
bash code/hpc/start_jupyter.sh \
-m 16G \
-c 8 \
-t 08:00:00 \
-p "long"
```

The values chosen above are the default values that get passed if nothing else is specified. Type `bash code/hpc/start_jupyter.sh -h` to see the help.

The job is submitted as a batch job (but with live output). To see your current jobs use `squeue -u $USER` and to kill a job use `scancel <JOBID>`. Note that `ctrl + c` will **not** terminate the job (only the output).

# Connect your local machine to Jupyter

In your local machine's Terminal (or MobaXTerm on Windows), copy and paste the `ssh` command that `start_jupyter.sh` prints. It should look something like this:

```bash
ssh -L 8888:htc-cXXX:XXXXX -J psycXXXX@gateway.arc.ox.ac.uk psycXXXX@htc-login
```

You will have to enter your password twice (due to node hopping).

After that, open your browser on your local machine and navigate to [http://localhost:8888/tree](http://localhost:8888/tree)

You might have to enter your username in the top field "Password or Token". E.g. `psycXXXX`

After opening your Notebook of choice, set the kernel to `Python (MNE)`

# After first setup

once everything is set up, you log in as before and run from the login node (not the gateway node):

```bash
bash $DATA/group-handbook/code/hpc/start_jupyter.sh
```

and then connect to the job via ssh and open the notebook in your browser.
