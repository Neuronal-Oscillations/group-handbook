#!/bin/bash

ENV_DIR="${DATA}/environments"
MNE_ENV_DIR="${ENV_DIR}/mne_env"
FLUX_DIR="${DATA}/FLUX"
JUPYTER_DIR="${ENV_DIR}/.jupyter"

mkdir -p "${FLUX_DIR}"
mkdir -p "${ENV_DIR}"
mkdir -p "${MNE_ENV_DIR}"
mkdir -p "${JUPYTER_DIR}"

cd "${FLUX_DIR}"

git clone https://github.com/FLUX-pipeline/Cerca

# set up cache directory for conda / mamba
if ! grep -qF "envs_dirs:" ~/.condarc 2>/dev/null; then
    cat >> ~/.condarc <<EOF
pkgs_dirs:
  - $ENV_DIR/.conda/pkgs
envs_dirs:
  - $ENV_DIR/.conda/envs
EOF
fi

# add mamba to .bashrc
if ! grep -qF "module load Mamba" ~/.bashrc 2>/dev/null; then
    cat >> ~/.bashrc <<EOF
module load Mamba/23.11.0-0 2>/dev/null
source /apps/system/easybuild/software/Mamba/23.11.0-0/etc/profile.d/mamba.sh
EOF
fi

# add JUPYTER_DIR to .bashrc (later install the mne kernel on $DATA)
if ! grep -qF "JUPYTER_PATH" ~/.bashrc 2>/dev/null; then
  echo "export JUPYTER_PATH=\"${DATA}/jupyter\"" >> ~/.bashrc
fi

# send setup to interactive job
srun \
--cpus-per-task=4 \
--mem=16G \
--time=01:00:00 \
--job-name=setup_flux \
bash <<EOF
source ~/.bashrc

mamba create -y -p "${MNE_ENV_DIR}" python=3.11 mne jupyter jupyterlab mne-bids -c conda-forge

echo "Installing ipykernel..."
source activate "${MNE_ENV_DIR}"
python -m ipykernel install \
--prefix="${JUPYTER_DIR}" \
--name=mne \
--display-name "Python (MNE)"

mamba deactivate

echo ""
echo "Environment ready."
echo ""
echo "IGNORE what mamba said. Do NOT USE 'conda activate' or 'mamba activate'"
echo ""
echo "You can now activate the environment using:"
echo "    source activate ${MNE_ENV_DIR}"
echo ""
echo "Deactivate using:"
echo "    conda deactivate"
EOF
