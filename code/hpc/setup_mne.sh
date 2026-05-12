#!/bin/bash

FLUX_DIR="${DATA}/git-repos/FLUX"

mkdir -p "${FLUX_DIR}"
cd "${FLUX_DIR}"

git clone https://github.com/FLUX-pipeline/Cerca

# send setup to interactive job
srun \
--cpus-per-task=12 \
--mem=16G \
--job-name=setup_mne \
--time="01:00:00" \
bash <<EOF
set -e

rm -rf "\${MNE_ENV_PATH}"
source ~/.bashrc
mamba create -y -p "\${MNE_ENV_PATH}" python=3.11 mne jupyter jupyterlab mne-bids -c conda-forge

echo "Installing ipykernel..."
"\${MNE_ENV_PATH}/bin/python" -m ipykernel install \
--prefix="\${JUPYTER_PATH}/../.." \
--name=mne \
--display-name "Python (MNE)"

echo ""
echo "Environment ready."
echo ""
echo "IGNORE what mamba said. Do NOT USE 'conda activate' or 'mamba activate'"
echo ""
echo "You can now activate the environment using:"
echo "    source activate \${MNE_ENV_PATH}"
echo ""
echo "Deactivate using:"
echo "    conda deactivate"
echo ""

EOF
