#!/bin/bash

ENV_DIR="${DATA}/environments"
MNE_ENV_DIR="${ENV_DIR}/mne_env"
FLUX_DIR="${DATA}/FLUX"
JUPYTER_DIR="${ENV_DIR}/.jupyter"

mkdir -p "${FLUX_DIR}"
mkdir -p "${ENV_DIR}"
mkdir -p "${JUPYTER_DIR}"
mkdir -p "${JUPYTER_DIR}/share"
mkdir -p "${JUPYTER_DIR}/share/jupyter"

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
module load Mamba/23.11.0-0
EOF
fi

# add JUPYTER_DIR to .bashrc (later install the mne kernel on $DATA)
sed -i '/JUPYTER_PATH/d' ~/.bashrc
echo "export JUPYTER_PATH=\"${JUPYTER_DIR}/share/jupyter\"" >> ~/.bashrc

sed -i '/MNE_ENV_PATH/d' ~/.bashrc
echo "export MNE_ENV_PATH=\"${MNE_ENV_DIR}\"" >> ~/.bashrc

echo "starting interactive job for installation..."

# send setup to interactive job
srun \
--cpus-per-task=12 \
--mem=16G \
--job-name=setup_mne \
--time="01:00:00" \
bash <<EOF
set -e

rm -rf "${MNE_ENV_DIR}"
source ~/.bashrc
mamba create -y -p "${MNE_ENV_DIR}" python=3.11 mne jupyter jupyterlab mne-bids -c conda-forge

echo "Installing ipykernel..."
"${MNE_ENV_DIR}/bin/python" -m ipykernel install \
--prefix="${JUPYTER_DIR}" \
--name=mne \
--display-name "Python (MNE)"

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
echo ""

EOF
