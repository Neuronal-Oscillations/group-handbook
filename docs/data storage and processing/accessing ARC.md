# Accessing ARC 
## Purpose
Recommendation for accessing Advanced Research Comnputing (ARC) and understand the architecture of the clusters. 

A typical workflow involves:
1. Copying raw data (typically from RFS; warm data) to the data directory on ARC (hot data)
2. Performing analysis on ARC
3. Copying output data back to the core store (typically RFS)

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC
  
## Steps

### Requesting access to the ARC 

The Neuronal Oscillations project on the ARC infrastructure is called "psyc-neuosc". Users can apply for individual accounts on the ARC systems by visiting the [OxIntranet page](https://unioxfordnexus.sharepoint.com/sites/OxIntranet-research-innovation/SitePages/ARC-accessing-ARC.aspx?Mode=Edit#requesting-a-user-account) and selecting the psyc-neuosc project.The Neuronal Oscillations project on the ARC infrastructure is called "psyc-neuosc". Users can apply for individual accounts on the ARC systems by visiting the [OxIntranet page](https://unioxfordnexus.sharepoint.com/sites/OxIntranet-research-innovation/SitePages/ARC-accessing-ARC.aspx?Mode=Edit#requesting-a-user-account) and selecting the psyc-neuosc project.


### Accessing the ARC using the NoMachine client software

1. Connect via web browser to [NoMachine](https://www.nomachine.com/)
2. Ensure you are on the VPN network
2. Run NoMachine
3. Add the host `nx.arc.ox.ac.uk`
4. Login with Oxford SSO
4. Select "Create a new virtual desktop"
5. Once the desktop opens, launch applications from the menu (bottom left corner)

The abobe steps bring you to an entry node. The next step is to nagivate to an htc node write

`ssh -X htc-login`


<img width="1165" height="594" alt="image" src="https://github.com/user-attachments/assets/c3965657-656e-4823-9cd0-7cdbd57decdb" />




<!--
## Verification
## Troubleshooting
## References

-->
