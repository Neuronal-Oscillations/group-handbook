# RFS Storage of OHBA Imaging Data

## Purpose

This document provides guidance for storing OHBA imaging data (MEG, OPM, and MRI). Choose your storage based on data sensitivity:

- **RFS (Research File Service)**: Use for large, non-confidential datasets with no personal identifiers (raw scan data, processed results, etc.)
- **OneDrive**: Use for confidential data containing personal identifiers, participant information, or sensitive metadata

## Prerequisites

- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)

---

## Requesting RFS Storage

To request an RFS project for your research:

1. Visit the [Oxford Service Catalogue](https://www.it.ox.ac.uk/article/oxford-research-file-service-rfs-available-for-storing-your-live-research-data)
2. Search for "Oxford Research File Service (RFS)"
3. Complete the request form with your project details
4. You will receive credentials and project access once approved

RFS provides backed-up long-term storage suitable for research data archives.

---
## The RFS web-interface:
The RFS files can be inspected via a web-browswer:
[RFS file browser](https://files.rfs.ox.ac.uk/)


---

## Mounting RFS Storage on Windows or MacOS

Once you have been granted RFS access, mount the storage on your local machine using the appropriate instructions for your operating system.

### Windows

1. Ensure you are connected to the Oxford VPN (e.g., Cisco Secure Client)
2. Open File Explorer and click **This PC** in the left sidebar
3. Select **Map network drive** from the ribbon menu
4. In the **Folder** text box, enter:
   ```
   \\connect.ox.ac.uk\RFS
   ```
5. Assign the mapped drive to **R:** (if available)
6. Click **Finish**

Your RFS project(s) will appear as folders under the mapped R: drive.
  <img width="742" height="513" alt="image" src="https://github.com/user-attachments/assets/73315c93-52c5-47ef-945c-4969df71b8d3" />
### macOS

1. Ensure you are connected to the Oxford VPN
2. Open Finder and select **Go** from the menu bar
3. Click **Connect to Server**
4. Enter the server address:
   ```
   smb://connect.ox.ac.uk/RFS
   ```
5. Click **Connect**
6. Enter your Oxford credentials when prompted

Your RFS project(s) will appear in the mounted SMB share.

Enter the server address: `smb://connect.ox.ac.uk/RFS`

<img width="560" height="263" alt="image" src="https://github.com/user-attachments/assets/5affccbb-3f29-462e-b559-72958dd3babf" />

For username use the AD-OAK domain and your SSO name:
`AD-OAK\psycXXXX`
and your password.

###

<!--
## Verification
## Troubleshooting
## References
-->

## References
[RFS guide](https://help.it.ox.ac.uk/sites/default/files/help/documents/media/rfs_owners_guide.pdf)
