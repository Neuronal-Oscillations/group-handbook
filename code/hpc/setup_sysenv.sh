#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

# setup path structure
mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.config/private"

mkdir -p "${DATA}/environments"
mkdir -p "${DATA}/environments/.conda"
mkdir -p "${DATA}/environments/.conda/pkgs"
mkdir -p "${DATA}/environments/.conda/envs"

mkdir -p "${DATA}/environments/vscode"
mkdir -p "${DATA}/environments/vscode/.vscode-extensions"
mkdir -p "${DATA}/environments/vscode/.vscode-cli"
mkdir -p "${DATA}/environments/vscode/.vscode-server"

mkdir -p "${DATA}/environments/jupyter"
mkdir -p "${DATA}/environments/jupyter/share"
mkdir -p "${DATA}/environments/jupyter/share/jupyter"

# setup ~/.bashrc
lines=(
  "module load Mamba/23.11.0-0"
  "export PATH=\"${SCRIPT_DIR}/bin:\$PATH\""
  "export RFS_KEY=\"${HOME}/.config/private/rfs_cred\""
  "export VSCODE_BASE=\"${DATA}/environments/vscode\""
  "export VSCODE_EXTENSIONS=\"${DATA}/environments/vscode/.vscode-extensions\""
  "export VSCODE_CLI_DATA_DIR=\"${DATA}/environments/vscode/.vscode-cli\""
  "export VSCODE_AGENT_FOLDER=\"${DATA}/environments/vscode/.vscode-server\""
  "export JUPYTER_PATH=\"${DATA}/environments/jupyter/share/jupyter\""
  "export MNE_ENV_PATH=\"${DATA}/environments/mne_env\""
)

for line in "${lines[@]}"; do
  grep -qxF "$line" ~/.bashrc || echo "$line" >> ~/.bashrc
done

chmod +x "${DATA}/git-repos/group-handbook/code/hpc/bin/"*

# setup ~/.condarc
touch ~/.condarc
if ! grep -q "${DATA}/environments/.conda/pkgs" ~/.condarc; then
    cat >> ~/.condarc <<EOF
pkgs_dirs:
  - $DATA/environments/.conda/pkgs
EOF
fi

if ! grep -q "${DATA}/environments/.conda/envs" ~/.condarc; then
    cat >> ~/.condarc <<EOF
envs_dirs:
  - $DATA/environments/.conda/envs
EOF
fi

# inform user about rfs_cred
echo ""
echo "---------------------------------------"
echo "Store your RFS credentials in:"
echo "${HOME}/.config/private/rfs_cred"
echo ""
echo "The file should looks like this:"
echo ""
echo "username=AD-OAK\\${USER}"
echo "password=your_pass"
echo "domain=ox.ac.uk"
echo "---------------------------------------"
echo ""
