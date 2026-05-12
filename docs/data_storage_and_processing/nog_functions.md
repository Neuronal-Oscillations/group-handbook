# Prerequisite
- System Environment set up (see `first_steps`)
- MNE set up for `nog_jupyter_server` (see `setup_mne`)
- some mamba environment to be used with vscode set up for `nog_vscode_server` (see `setup_mamba_environment`)

# What are they ?

They are command line functions that should streamline the interaction with the ARC cluster.
Once installed correctly (see "first_steps"), they can be accessed from the ARC terminal.
To make nog functions work properly, you MUST follow the setup procedure documented in "first_steps"

# Why nog ?

`nog` is short for Neuronal Oscillations Group. The prefix allows the user to easier distinguish between nog functions and other system commands.

# nog_jupyter_server
This functions will submit a batch job to the cluster, which sets up a jupyter server that you can connect to from your laptop. See:
```bash
nog_jupyter_server -h
```

# nog_vscode_server
This functions will submit an interactive or batch job to the cluster, which sets up a VSCode server that you can connect to from your laptop. See:
```bash
nog_vscode_server -h
```

# nog_rfs
This functions allows the user to interact with the RFS file storage. See:
```bash
nog_rfs -h
```
