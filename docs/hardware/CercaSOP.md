# OPM-MEG Lab Recording Steps

## 1. Booking the testing session 

1. Make sure to screen the participant at least a week prior to experimentation - *This allows you to consult a MEG Physicist about any unclear metal items*
2. Ensure that a trained OPM-MEG scan operator and an experienced researcher are available to be present for the entire testing session
3. Ensure that the lab will have the correct helmet size installed on the day of your recording
4. Book the lab on Calpendo only for the time that your experiment (and preparation beforehand) will actually take - *please avoid booking the lab for an entire day* 
 
## 2. Before participant arrives (~30 min prior)
 
### Setup
 
1. Turn on the OPMs and coil cabinets (switch at the wall and the switch under the MSR chair)
2. Turn on the projector and the DataPixx (button is near the MSR) and ResponsePixx, if using
3. Turn on the lights inside the MSR, the intercom volume and webcam, *check that all equipment is functioning prior to the participant's arrival.*
4. Turn off the central HVAC in the SQUID-MEG lab (the switch is on the left handside just as you enter)
5. Place the "Do not disturb" sign on the OPM-MEG lab door 
6. On stim PC: load the experiment and be ready to enter the participant ID — *the experiment code should already be ready before the participant arrives, so they don't have to wait while you set things up.*
7. Close the curtain — *blocks outside light from interfering with the projector, especially important when the stimulus background is dark.*
8. Check the display setting (duplicated vs. extended screen) and speaker setting (which speaker, volume) — *confirms the stimulus presentation will behave as expected during the run.*
### Empty-room recording
 
1. Move the helmet to the center of the room and close the MSR door — *required baseline condition for an empty-room recording.*
2. Open the Cerca SOP available on OxCIN Hub → OPM Users → SOPs
3. Select the correct helmet
4. Turn on "Filter Powerline" and HFC
5. Run the standard steps (auto start (takes ~2 mins) → degauss → field-zero → calibration → close loop) and record empty room for at least 1 min — *establishes the noise floor and system state before the participant goes in.*
6. Check the signal before and after HFC powerline filtering — *catches sensor or system issues before the participant is in the helmet.* (Rob prepared MATLAB signal-check code under /document.)
---
 
## 3. When participant arrives
 
### Informed consent
 
1. Explain the experiment task, including the time frame (number of blocks, task per block, total expected duration) — *ensure that the participant is fully aware of the task demands and has enough time to ask questions*
2. Present the consent form and have the participant sign — *must be done before any procedure.*
3. Explain to the participant that they have the right to withdraw their consent *at any time* without explation or repercussions 
### Before going to the MSR
 
1. Ask whether they need the bathroom or water — *aim for ~1 hour comfortable inside the MSR without leaving, since leaving requires re-degaussing.*
2. As the participant to remove any items containing metal (common things that are forgotten: underwired bra, belts, earrings) — *metal disturbs the OPM signal and degaussing.*
3. If the participant is wearing mascara, provide them with a makeup remover wipe - *in the cabinet above the sink*
4. Provide the participant with a hair net — *Do not stuff all the hair into the net, as this adds bulk. The net is mainly for hygiene.*
5. Ask participant to remove shoes — *reduces metal/dirt brought into the MSR.*
6. Move the screen back to make space for the participant to enter — *keeps the entry path clear.*
### Enter the MSR and prepare for recording
 
1. Enter the MSR and have the participant sit in the chair.
2. Ask whether they need a footrest — *helps them sit relaxed for the full session.*
3. With the participant relaxed, place the helmet centered on the head — stable, not slipped to one side. Ask if it's comfortable and adjust as needed — *helmet position directly affects sensor-to-scalp distance and signal quality.*
### Get ready for the experiment
 
1. Position the screen so the participant can see it clearly (measure viewing distance if needed to set stimulus size) — *ensures stimuli subtend the intended visual angle.*
2. Instruct the participant to stay relaxed and try to keep the head still during recording — *reduces movement artifacts.*
3. Make sure to inform the participant about any action to be taken (e.g., if you are to close the MSR door or turn the lights down)
4. Before closing the MSR door, test the intercom (you must be able to hear the particpant, and they - you) and the webcam 

---
 
## 4. Starting recording
 
1. Standard recording-start steps: (degauss → field zero → calibration → close loop).
2. Inform the participant once setup is complete and recording is about to start — *so they can get ready and focus.*
3. **Press record** — *without this, no data will be saved.*
4. Run some practice trials before the official trials — *lets the participant get familiar with the task and reduces early-trial errors.*
5. During each block break, check in with the participant and acknowledge their engagement — *maintains motivation and gives you a chance to catch any issues.*
6. Make sure to field zero and calibrate before each block starts - *participants tend to move during breaks - these steps are vital for the system to re-set after any movement.*
---
 
## 5. During breaks
 
1. If the door is opened for any reason (drink, break outside), re-run degaussing and repeat the relevant setup steps before resuming — *opening the door disturbs the magnetic environment; degaussing restores it.*
---
 
## 6. Finishing the experiment
 
1. As soon as the experiment ends, use the speaker to inform the participant that you'll come into the MSR to remove the helmet — *make sure to tell the participant to not remove the helmet themselves as that will prevent coregistration.*
2. If the MSR was dark during the experiment, open the door slowly — *gives the participant time to adjust gradually to the brighter environment.*
3. Turn the OPMs off by pressing "reboot all" in the Cerca GUI
4. Perform a 3D head scan (see below)
5. Take the helmet off the participant's head carefully and place it onto its mount
6. Escort the participant out of the MSR, make sure they are okay
7. Provide them with a tight-fitting head covering to take a head-only 3D head scan
8. Debrief and reimburse the participant
    
## 7. 3D head scan

1. Turn on the Einscan software
2. Portrait mode → IR mode → Enable texture flashing (*unless participant is sensitive to flashing, in that case, turn it off*) → 1mm resolution (for White-typical hair texture) → turn *off* Hair mode → turn *on* Data Quality Indicator
3. *Instruct the participant to keep their eyes closed during the scan!*
4. Start scanning the face and ensure good resolution. Move on to scanning both temporal zones and the top of the head/helmet. Make sure to scan the face angling the scanner upwards to avoid mesh holes under the nose.
5. If the tracking is lost, regain it by bringing the handheld IR scanner to the origin postionposition, i.e.,. in front of the face scanning the face again.
6. Avoid scanning the face and the sides of the head for longer than 10s at a time due to excessive flashing
7. Ensure that you scan from the chin upwards to avoid holes in the mesh
8. Bring the participant out of the MSR and seat them in the chair for the head-only 3D scan. Clear the area around the chair so you can move fully around it, including behind — *needed to capture the complete head geometry.*
