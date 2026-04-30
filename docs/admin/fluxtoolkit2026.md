# OPM-FLUX Toolkit Course

**Learn how to analyse OPM-MEG data**

📅 **Dates:** 13th–16th July 2026  
📍 **Location:** St. Catherine's College, University of Oxford

---

**In collaboration with:**

- The Oxford Centre for Integrative Neuroscience (OxCIN), Department of Experimental Psychology / Department of Psychiatry  
- The Centre for Human Brain Health, University of Birmingham

---

## Toolkit Summary

The OPM-FLUX toolkit course provides a comprehensive introduction to analysing OPM-MEG data using OPM-FLUX, an advanced analysis pipeline for human electrophysiological data. Originally designed for SQUID-based MEG, the FLUX pipeline has been adapted for OPM-MEG. While OPM-MEG offers exciting opportunities in cognitive and clinical neuroscience, analysing its data can be challenging due to technical complexities and a lack of standardised methods.

Built on **MNE-Python**, a leading MEG analysis toolbox, the course teaches:

- Theoretical foundations of OPM sensors and human electrophysiology  
- Practical experience with OPM-FLUX

The FLUX pipeline is a living resource — it will continue to evolve in step with toolbox developments and emerging insights.

This first version of the FLUX Pipeline is published in [Ferrante et al. (2022) Neuroimage](https://doi.org/10.1016/j.neuroimage.2022.119047)

**Morning sessions:** Lectures on data analysis basics and examples from cognitive neuroscience research (MEG / OPM-MEG).  
**Afternoon sessions:** Hands-on workshops applying the OPM-FLUX pipeline to data collected from local OPM systems.

Analysis coverage includes:

- [FieldLine](https://fieldlineinc.com/) and [Cerca/QuSpin](https://www.cercamagnetics.com/) data  
- BIDS format  
- Preprocessing  
- Event-related fields  
- Spectral analysis  
- Source modelling  
- Multivariate pattern analysis

*(Hands-on training on data acquisition is not included, but general steps will be outlined.)*

---

## Location

Sessions will be held at the **Junior Common Room Lecture Theatre**, [St. Catherine's College](https://www.stcatz.ox.ac.uk/), University of Oxford.

- Lunch, coffee breaks, and one dinner are provided  
- Attendees must arrange their own accommodation — see [UniversityRooms](https://www.universityrooms.com/) for affordable options  
- No parking available at the college; easily reachable by public transport (25-min walk from Oxford train station through the historic old town)

---

## Intended Audience

Target audience: users **new to OPM-MEG** who intend to integrate the technique into cognitive and clinical neuroscience. The OPM-FLUX pipeline provides a standardised approach using MNE Python.

**Prerequisite:** Basic Python skills are required.

For users with more advanced skills, the [OHBA Software Library](https://osl-ephys.readthedocs.io/en/latest/) (which also has an associated course) is recommended.

---

## Requirements

Each attendee must bring:

- Their own laptop (Mac or Windows PC, ideally with 16 GB RAM)  
- MNE Python pre-installed  
- Sample dataset downloaded

Installation instructions will be provided after course acceptance.

---

## Registration & Deadlines

To sign up, complete the [Registration Form](https://forms.cloud.microsoft/e/Q0niPXX3FV).

| Milestone | Date |
| :---- | :---- |
| Registration deadline | 01 May 2026 |
| Attendees informed | 22 May 2026 |
| Payment due (£290) | 01 June 2026 |

The course fee (£290) covers lunch, 2 coffee breaks per day, and a joint dinner in Oxford.

In the selection of attendees, we aim for diverse representation in terms of geography and gender.

---

## Programme

### Monday 13th July

| Time | Session | Speaker |
| :---- | :---- | :---- |
| 09:30–09:45 | Meet and greet | Ole Jensen |
| 09:45–10:15 | The physiological basis of MEG | Hyojin Park |
| 10:15–11:00 | Running an OPM experiment | Arnab Rakshit |
| 11:00–11:30 | Flashtalks | — |
| 11:30–12:00 | Poster session and tea/coffee break | — |
| 12:00–13:00 | The physics of OPM and the next generation of sensors | Anna Kowalczyk |
| 13:00–14:00 | Lunch | — |
| 14:00–14:30 | Dissecting skilled motor control | Katja Kornysheva |
| 14:30–15:00 | OPM infant recordings | Barbara Pomiechowska |
| 15:00–16:00 | OPM-FLUX hands-on: Setting up FLUX and MNE-Python | — |
| 16:00–18:00 | Visiting the OPM-MEG system at OHBA | — |

---

### Tuesday 14th July

| Time | Session | Speaker |
| :---- | :---- | :---- |
| 09:30–10:00 | Brain Imaging Data Structure (BIDS) | Tara Ghafari |
| 10:00–10:45 | Algorithms for noise artefact reduction (SSP, HFC, AMM, ...) | TBC |
| 10:45–11:15 | Flashtalks | — |
| 11:15–12:00 | Poster session and tea/coffee break | — |
| 12:00–12:20 | Preprocessing | TBC |
| 12:20–13:00 | Event-related Fields | Tara Ghafari |
| 13:00–14:00 | Lunch | — |
| 14:00–14:30 | Spatiotemporal properties of common semantic categories for words and pictures | TBC |
| 14:30–15:00 | OPM compared to MEG for MVPA | Jiawei (Jack) Liang |
| 15:00–17:00 | OPM-FLUX hands-on | — |
| 18:00 | Dinner in Oxford: [Gusto Restaurant](https://gustorestaurants.com/restaurants/oxford/) | — |

**Hands-on notebooks (Tuesday):**

- [The dataset](https://github.com/FLUX-pipeline/Cerca/blob/main/TheDataset.ipynb)  
- [A first look at the data](https://github.com/FLUX-pipeline/Cerca/blob/main/AFirstLook.ipynb)  
- [Artefact attenuation by HFC](https://github.com/FLUX-pipeline/Cerca/blob/main/ArtefactSuppressionHFC.ipynb)  
- [Annotating muscle and ocular artefacts](https://github.com/FLUX-pipeline/Cerca/blob/main/ArtefactAnnotation.ipynb)  
- [ICA for attenuating artefacts](https://github.com/FLUX-pipeline/Cerca/blob/main/ICA.ipynb)

---

### Wednesday 15th July

| Time | Session | Speaker |
| :---- | :---- | :---- |
| 09:30–10:30 | Oscillations in Cognition | Ole Jensen |
| 10:30–11:10 | The Fourier Transform | Andrew Quinn |
| 11:10–11:40 | Flashtalks | — |
| 11:40–12:15 | Poster session and tea/coffee break | — |
| 12:15–13:00 | The Power Spectrum and Time Frequency Representations of power | Andrew Quinn |
| 13:00–14:00 | Lunch | — |
| 14:00–15:00 | Keynote: TBC | — |
| 15:00–17:00 | OPM-FLUX hands-on | — |
| 18:00 | Social Activities: Punting from St Catz College | — |
| 18:30 | Walking tour with [Uncomfortable Oxford Tours](https://www.uncomfortableoxford.com/) from Carfax Tower | — |

**Hands-on notebooks (Wednesday):**

- [Education: Discrete Fourier Transform](https://github.com/Neuronal-Oscillations/Education/blob/main/DiscreteFourierTransformation.ipynb)  
- [Education: Time-frequency Representation of Power](https://github.com/Neuronal-Oscillations/Education/blob/main/TimeFreqPower.ipynb)  
- [Extracting condition-specific trials](https://github.com/FLUX-pipeline/Cerca/blob/main/ConditionSpecificTrials.ipynb)  
- [Event-related fields](https://github.com/FLUX-pipeline/Cerca/blob/main/EventRelatedFields.ipynb)  
- [Time-frequency representations of power](https://github.com/FLUX-pipeline/Cerca/blob/main/TimeFrequencyPower.ipynb)

---

### Thursday 16th July

| Time | Session | Speaker |
| :---- | :---- | :---- |
| 09:30–10:00 | Forward Model | Robert Seymour |
| 10:00–10:30 | Source Analysis | Robert Seymour |
| 10:30–11:00 | Flashtalks | — |
| 11:00–11:45 | Poster session and tea/coffee break | — |
| 11:45–12:45 | Multivariate Pattern Analysis | Oscar Ferrante |
| 13:00–14:00 | Lunch | — |
| 14:00–14:20 | Large-scale cortical functional networks are organised in structured cycles | Mats van Es |
| 14:20–14:40 | Neural representation of reasoning in language comprehension | Jiaqi Li |
| 14:40–15:00 | Poster judging session and award ceremony | — |
| 15:00–17:00 | OPM-FLUX hands-on | — |

**Hands-on notebooks (Thursday):**

- [Constructing the forward model](https://github.com/FLUX-pipeline/Cerca/blob/main/ForwardModel.ipynb)  
- [Source modelling using DICS beamforming](https://github.com/FLUX-pipeline/Cerca/blob/main/DICSbeamforming.ipynb)  
- [Multivariate pattern analysis](https://github.com/FLUX-pipeline/Cerca/blob/main/Classification.ipynb)

---

## Recommended Reading Materials

*(Ask organisers for PDFs you cannot find)*

### MEG and OPM Instrumentation

- Hari, R. (2004) Magnetoencephalography in Clinical Neurophysiological Assessment of Human Cortical Functions. In *Niedermeyer's Electroencephalography*.  
- Hämäläinen et al. (1993) Magnetoencephalography — theory, instrumentation, and applications. *Reviews of Modern Physics* 65(2), 413\.  
- Brookes et al. (2022) Magnetoencephalography with optically pumped magnetometers (OPM-MEG): the next generation of functional neuroimaging. *Trends Neurosci.* 45(8):621–634.  
- Kowalczyk et al. (2021) Detection of human auditory evoked brain signals with a resilient nonlinear optically pumped magnetometer. *Neuroimage.* 226:117497.  
- WOPM2024 — Peter Schwindt — [Introduction to optically pumped magnetometers (YouTube)](https://youtu.be/VSlhxn1GRfs?si=RO-SJ0bcG0SfTwCf)

### Physiology

- Lopes da Silva, F.H. (2010) Electrophysiological Basis of MEG Signals. In *MEG: An Introduction to Methods*.  
- Buzsáki, G., Anastassiou, C.A., and Koch, C. (2012) The origin of extracellular fields and currents. *Nat Rev Neurosci.* 13(6):407–20.

### Event-Related Responses in Cognition

- Woodman G.F. (2010) A brief introduction to the use of event-related potentials. *Atten Percept Psychophys.* 72(8):2031–46.  
- Luck, S.J. (2014) *An Introduction to the Event-Related Potential Technique* (2nd ed.). MIT Press.

### Oscillations in Cognition

- Jensen, O., and Hanslmayr (2020) The Role of Alpha Oscillations for Attention and Working Memory. In *The Cognitive Neurosciences*. MIT Press.  
- Jensen, O., Spaak, E., and Zumer, J.M. (2014) Human Brain Oscillations. In *Magnetoencephalography*. Springer.  
- Jensen, O. (2024) Distractor inhibition by alpha oscillations. *Commun Psychol.* 2(1):36.  
- Buzsaki, G. (2011) *Rhythms of the Brain*. Oxford University Press.  
- Jensen, O. (2023) Rhythms and Cognition. *Brain Inspired* podcast, episode 160\.

### Spectral Analysis

- Smith, S.W. (1997) The Discrete Fourier Transform. Ch. 8 in *The Scientist and Engineer's Guide to DSP*.  
- Smith, S.W. (1997) Applications of the DFT. Ch. 9\. [PDF](https://www.dspguide.com/CH9.PDF)  
- Percival, D.B. and Walden, A.T. (1993) *Spectral Analysis for Physical Applications*. Cambridge University Press.  
- Bruns, A. (2004) Fourier-, Hilbert- and wavelet-based signal analysis. *J Neurosci Methods.* 137(2):321–32.

### Multivariate Pattern Analysis

- Cichy et al. (2014) Resolving human object recognition in space and time. *Nature Neuroscience* 17:455–462.  
- Guggenmos et al. (2018) Multivariate pattern analysis for MEG. *NeuroImage* 173:434–447.  
- King & Dehaene (2014) Characterizing the dynamics of mental representations. *Trends in Cognitive Sciences* 18(4):203–210.

### Source Modelling

- Baillet, S. (2017) Magnetoencephalography for brain electrophysiology and imaging. *Nat Neurosci.* 20(3):327–339.  
- Baillet S, Mosher JC, Leahy RM (2001) Electromagnetic brain mapping. *IEEE SP MAG*.  
- Dale et al. (2000) Dynamic statistical parametric mapping: combining fMRI and MEG. *Neuron* 26(1):55–67.  
- Van Veen et al. (1997) Localization of brain electrical activity via linearly constrained minimum variance spatial filtering. *IEEE Trans Biomed Eng.* 44(9):867–880.  
- Jensen, O., and Hesse, C. (2001) Estimating Distributed Representation of Evoked Responses. In *MEG: An Introduction to Methods*.

---

## Organizing Committee

- **Tara Ghafari**  
- **Arnab Rakshit**  
- **Jenny Anisimova**  
- **Ole Jensen**

*Supported by NIHR Oxford Health Biomedical Research Centre (NIHR203316). The views expressed are those of the author(s) and not necessarily those of the NIHR or the Department of Health and Social Care.*

---

## Speakers

| Name | Role |
| :---- | :---- |
| Prof. Ole Jensen | Professor in Translational Neuroscience |
| Dr. Andrew Quinn | Assistant Professor in Psychology |
| Dr. Katja Kornysheva | Assistant Professor in Human Neuroscience |
| Dr. Yulia Wilson-Bezsudnova | Postdoc |
| Dr. Tommy Clausner | Postdoc |
| Dr. Clayton Hickey | Associate Professor in Psychology |
| Dr. Anna Kowalczyk | Assistant Professor |
| Dr. Tara Ghafari | Postdoc |
| Dr. Alicia Rybicki | Postdoc |
| Lijuan Wang | PhD Candidate |
| Dr. Hyojin Park | Assistant Professor in Psychology |
| Dr. Kyungmin An | Assistant Professor in Psychology |
| Dr. Oscar Ferrante | Postdoc |
| Dr. Arnab Rakshit | Postdoc |
| Damiano Grignolio | PhD Candidate |

---

*Source: [neuosc.com/fluxtoolkit2026](https://www.neuosc.com/fluxtoolkit2026)*  
