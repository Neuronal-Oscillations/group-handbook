# Starting a jupyter server
## Prerequisite
- you are on a login node (not gateway, use `ssh htc-login`)
- System Environment set up (see [initialise](initialise.md))
- MNE set up (see [Setting up MNE Python](setup-mne.md))

## Start Jupyter job on cluster

You should be able to use the Neuronal Oscillations Group functions (nog functions) if you followed the "first steps" instructions. To start a jupyter server that you can connect to from your local machine's browser, use:

```bash
nog_jupyter_server
```

This will take a few seconds to minutes. It will submit a job to ARC telling it to run a jupyter server. You will then be able to connect to the server and interact with the notebook from your local machine's browser.

You can also specify options (e.g. requesting a certain amount of memory). Check out the help function:

```bash
nog_jupyter_server -h
```

The job is submitted as a batch job (but with live output). To see your current jobs use `squeue -u $USER` and to kill a job use `scancel <JOBID>`. Note that `ctrl + c` will **not** terminate the job (only the output).

## Connect your local machine to Jupyter

In your local machine's Terminal (or MobaXTerm on Windows), copy and paste the `ssh` command that `nog_jupyter_server` prints. It should look something like this:

```bash
ssh -L 8888:htc-cXXX:XXXXX psycXXXX@gateway.arc.ox.ac.uk
```

You will have to enter your password.

After that, open your browser on your local machine and navigate to [http://localhost:8888/tree](http://localhost:8888/tree)
