# Storage of OHBA imaging data
## Purpose
This document provides recommendations for storing OHBA imaging data, including MEG, OPM, and MRI data. The Oxford Research File Service (RFS) can only be used for non-confidential data (for example large data with no identifiers). OneDrive can be used for confidential data.

## Prerequisites

1. Follow the steps at [Oxford Research File Service (RFS) - Available for storing your live research data](https://www.it.ox.ac.uk/article/oxford-research-file-service-rfs-available-for-storing-your-live-research-data)
   - This will direct you to the Service Catalogue where RFS can be requested

## Steps

### Requestions a RFS storage 
- Follow steps at https://www.it.ox.ac.uk/article/oxford-research-file-service-rfs-available-for-storing-your-live-research-data
  (this will take you to the Service Catalogue where RFS can be requestes)

### Mounting RFS storage

#### Windows
1. Ensure you are connected to the Oxford VPN (for example, via Cisco Secure Client on MSD IT)
2. In File Explorer, click **This PC** in the left-hand panel
3. Select **Map network drive** from the ribbon
4. In the **Folder** text box, enter: `\\connect.ox.ac.uk\RFS`
5. RFS should be mapped to the R: drive if possible. If you have multiple RFS folders, they will be visible under this mapped drive

  <img width="742" height="513" alt="image" src="https://github.com/user-attachments/assets/73315c93-52c5-47ef-945c-4969df71b8d3" />

#### macOS

1. Ensure you are connected to the Oxford VPN
2. In Finder, select **Go**
3. Click **Connect to Server**
4. Enter the server address: `smb://connect.ox.ac.uk/RFS`

  <img width="560" height="263" alt="image" src="https://github.com/user-attachments/assets/5affccbb-3f29-462e-b559-72958dd3babf" />


<!--
## Verification
## Troubleshooting
## References

-->
