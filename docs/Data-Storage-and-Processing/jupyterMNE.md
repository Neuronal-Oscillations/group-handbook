# Running MNE Python on ARC Using Jupyter

## Purpose

Set up a Jupyter server on ARC that you can access from your local computer's browser (Windows, macOS, or Linux). This allows you to run MNE Python interactively and use the `mne_env` kernel in Jupyter notebooks.

## Prerequisites

- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project `psyc-neuosc` at ARC
- System environment configured; see [Initialise Settings and Folders](initialise.md)
- MNE Python installed; see [Setting Up MNE Python](setup-mne.md)

---

## Steps

### 1. Connect to ARC

Connect to the VPN, then access ARC via remote desktop or SSH. You will land on a gateway node.

SSH into the login node:

```bash
ssh -X htc-login
```

### 2. Start the Jupyter Server

Launch a Jupyter server that submits a job to ARC's compute cluster:

```bash
nog_jupyter_server
```

The command will take a few seconds to minutes to complete. It submits a job to run a Jupyter server and prints connection information including an SSH tunnel command.

**Wait for the output.** When complete, you will see an `ssh` command printed to your terminal. Copy this command—you'll need it in the next step.

### 3. Connect Your Local Machine to Jupyter

On your **local machine** (not on ARC), open a Terminal (or MobaXterm on Windows) and paste the SSH tunnel command printed by `nog_jupyter_server`. It should look like:

```bash
ssh -L 8888:htc-cXXX:XXXXX psycXXXX@gateway.arc.ox.ac.uk
```

Enter your Oxford password when prompted. This creates a secure tunnel from your local machine to the Jupyter server.

**Keep this terminal window open** while you use Jupyter.

### 4. Open Jupyter in Your Browser

On your local machine, open a web browser and navigate to:

```
http://localhost:8888/tree
```

You should see the Jupyter file browser. You're now connected to the Jupyter server running on ARC!

### 5. Select the MNE Kernel

When you create a new notebook or open an existing one:

1. Click **Kernel** → **Change kernel**
2. Select **mne_env** from the list
3. The notebook will now use the MNE Python environment

You can now import and use MNE:

```python
import mne
print(mne.__version__)
```

---

## Advanced Options

### Custom Server Settings

You can request specific resources (e.g., memory, CPU cores, walltime) using:

```bash
nog_jupyter_server -h
```

This shows all available options.

### Monitor Jobs

View your submitted jobs and their job IDs:

```bash
squeue -u $USER
```

### Stop the Server

To terminate the Jupyter server job:

```bash
scancel JOBID
```

Replace `JOBID` with the ID from `squeue`.

**Note:** Using `Ctrl+C` on your local machine will not terminate the ARC job. You must use `scancel` to stop it.

---

## Troubleshooting

**Can't connect to localhost:8888?**
- Ensure the SSH tunnel command is still running on your local machine
- Check that the terminal running the tunnel hasn't closed

**Kernel not available?**
- Ensure MNE is installed (see [Setting Up MNE Python](setup-mne.md))
- Restart Jupyter and check the kernel list again

**Server timed out?**
- Jobs have time limits. Resubmit with `nog_jupyter_server` to start a new server

---

<!--
## References
-->
