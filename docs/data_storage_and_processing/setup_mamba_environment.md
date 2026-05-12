# Prerequisite
- System Environment set up (see `first_steps`)

# Setup new environment

You don't need to follow this instructions for setting up the MNE environment. For this you can see `setup_mne`.

You have to use a compute node to setup new environments or install new packages in an existing environment. ALWAYS !.

```bash
 srun --mem=16G --time="04:00:00" --pty bash
```

In the next step, we actually create the environment and install some packages:

```bash
# if you used setup_sysenv.sh you can use NOG_ENV_DIR
# if not you must specify it first (the directory where your environments go)
module load Mamba/23.11.0-0
mamba create -p "${NOG_ENV_DIR}/env_name" python=3.12 -y # choose whatever name / python version. The -y tells the command to skip asking for confirmation
source activate "${NOG_ENV_DIR}/env_name" # DO NOT USE mamba activate or conda activate !!!


mamba install -c conda-forge matplotlib numpy pandas # you name it
mamba deactivate # here you can (and should) use mamba / conda deactivate
```

We can check that everything works by activating the environment. Check that the Python version is correct and also attempt loading a package you've installed:

```bash
source activate "${NOG_ENV_DIR}/env_name"
python
```

and in the python shell:

```python
import numpy as np
# exit()
```

If none of the above throw an error and the Python version is correct you're good to go. Also don't forget to `mamba deactivate`.
