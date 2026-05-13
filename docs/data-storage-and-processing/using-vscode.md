# Prerequisite
- you are on a login node (not gateway, use `ssh htc-login`)
- System Environment set up (see [initialise](initialise.md))
- some mamba environment set up set up (see [setup-mamba-environment](setup-mamba-environment.md))

# Using Cluster Node as VSCode backend

The idea is to submit a job at ARC and later connect to that job via a VSCode instance running in the browser of your local computer.

### 1. Submit VSCode job

Once we have that, we want to submit an interactive job that VSCode later connects to. We can use `nog_vscode_server` for this (see [nog-functions](nog-functions.md)):

```bash
nog_vscode_server
```

When running this for the first time, you will have to enter some details. Afterwards, you will be provided with a link and a code.

Enter the link in your browser, followed by the code and authenticate using your university login.

The VSCode server is now running.

### 2. Configuring VSCode

First, we need to install the Python extension. Install it.

Afterwards, we have to tell VSCode about the mamba environment we created.

Open the Command Palette and search for:
`Preferences: Open User Settings (JSON)`

Copy / Paste the following into there (and adjust if required - replace psycXXXX with your actual username) and the environment name with what you chose:

```json
{
    "python.defaultInterpreterPath": "/data/psyc-neuosc/psycXXXX/environments/env_name/bin/python",
    "python.terminal.activateEnvironment": false,
    "terminal.integrated.inheritEnv": true,
    "terminal.integrated.defaultProfile.linux": "mamba-env",
    "terminal.integrated.profiles.linux": {
        "mamba-env": {
            "path": "bash",
            "args": ["--init-file", "/data/psyc-neuosc/psycXXXX/environments/vscode/.vscode_init.sh"]
        }
    },
    "git.enableSmartCommit": true,
    "terminal.integrated.enableMultiLinePasteWarning": "never"
}
```

And now you should see the mamba environment enabled. It could be that you have to also specify the interpreter. To do so, go back to the Command Palette and search for `Python: Select Interpreter`.

### 3. From then on

If you've set everything up correctly, you only need to call `nog_vscode_server`. See:

```bash
nog_vscode_server -h
```

Enter the link and code in your browser and open VSCode in your browser. The link to the VSCode instance will remain the same (so you can bookmark it).

NOTE: when the job dies, because time is up or other conditions are met, the connection to VSCode is lost. However, there won't be any loss of data or settings, but you might have to start your computation from scratch again. Also note, that `nog_vscode_server` can be run as a batch job, which will keep the server alive even when the connection dies.
