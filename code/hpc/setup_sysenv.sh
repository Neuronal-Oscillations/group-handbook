#!/bin/bash
mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.config/private"

mkdir -p "${DATA}/environments"
mkdir -p "${DATA}/environments/vscode"
mkdir -p "${DATA}/environments/vscode/.vscode-extensions"
mkdir -p "${DATA}/environments/vscode/.vscode-cli"
mkdir -p "${DATA}/environments/vscode/.vscode-server"
mkdir -p "${DATA}/environments/jupyter"
mkdir -p "${DATA}/environments/jupyter/share"
mkdir -p "${DATA}/environments/jupyter/share/jupyter"

lines=(
  "module load Mamba/23.11.0-0"
  "export PATH=\"${DATA}/git-repos/group-handbook/code/hpc/bin:\$PATH\""
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
