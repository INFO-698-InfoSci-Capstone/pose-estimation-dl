# Weekly/Bi-Weekly Log

## Prompts
Following the [Rose/Bud/Thorn](https://www.panoramaed.com/blog/rose-bud-thorn-activity-and-worksheet#:~:text=%22Rose%2C%20Bud%2C%20Thorn%22%20is%20a%20mindful%20design%2D,day%2C%20week%2C%20or%20month.) model:

### Date: 
Week of March 17, 2025
Date: March 22, 2025


### Number of hours: 
10 hours towards reviewing and researching platforms and tools (Docker, Ubuntu, GitHub resources), meeting with stakeholders narrowing the specifics of what the researchers are looking for from us, and starting to shape the content that will make up our proposal.

### Rose:
The highlight of this past week was being able to be directly involved in the meetings with the stakeholders and hearing what exactly they would like from us. Up to this point we had been receiving summaries of what the researchers were looking for, so it was nice to be able to hear directly from the researchers and get a clearer vision of the issues they face, and also allow us to get a better idea of how our proposal will start to take form.

In the previous weeks leading up to now, the biggest highlight was being able to successfully use the Ubuntu Desktop on CyVerse to install both DeepLabCut and SLEAP, and also document the installation process to allow consistent installation in the future. 

### Bud: 
I am looking forward to containerizing SLEAP and DeepLabCut for a couple reasons. The first reason is that this will be my first time working with Docker and I am looking forward to getting hands on experience after reviewing multiple resources, and the second reason is because one of the researchers we met with with this week, Anna Dornhaus, expressed excitement that we were able to efficiently install the tools as this has been a significant struggle for her students. She seemed very excited about us being able to create a container to remove the troubles with installation and setup, so I am looking forward to being able to do this for her.

### Thorn: 
A challenge I faced was that although I was able to install SLEAP and DeepLabCut with Ubuntu, I was unable to do so on my local device. I ran into troubles as a result of having multiple environments and conflicting dependencies and have been unable to resolve this issue thus far. 

## Additional thought
I would like to be able to install SLEAP and DeepLabCut on my local device, however Carlos and Nirav have wanted us to use Ubuntu so I will continue to move forward with that. 

---

### Date: 
Week of March 24, 2025
Date: March 31, 2025


### Number of hours:
15 hours towards creating and modifying the Gantt chart for our project timeline, revising our project proposal based on feedback from our mentor, and the majority of the time being spent on the containerization of the Diplomat and DeepLabCut pose estimation tools. 


### Rose:
The highlight of this week was being able to successfully get a container running for an environment that supplies the use of Diplomat with DeepLabCut as the front-end. I think our proposal is also looking good, and I am happy we were able to get feedback from our mentors to make the necessary revisions that they would like to see.

### Bud:
After completing the Diplomat-DeepLabCut container and getting it into a state that is ready for user acceptance testing, I am looking forward to working on the Diplomat-SLEAP container. Although there is still some work left to be done on the Diplomat-DeepLabCut container, it has been nice to see the progress that has been made especially considering that the dockerization of these tools was rather daunting when work first began.

### Thorn: 
A challenge that I am working through is getting Diplomat's GUI to function properly. When running Diplomat on my local machine, I was able to display and use the GUI successfully upon the appropriate prompt in the terminal, however when running Diplomat in the container the GUI does not appear as it should when prompted in the container's terminal. I am working on creating a Kasm Desktop environment and hoping that when using the desktop's terminal the GUI will appear and function successfully.

## Additional thought
I am hoping the dockerization of these tools is not still giving us significant issues beyond the week of the 31st, I would like to begin user acceptance testing with the stakeholders' videos by the end of the week to feel good about our timeline, but I do feel as though we have the proper guidance and assistance from our mentors to keep us in good shape. 
---

### Date: 
Week of March 31, 2025
Date: April 9, 2025


### Number of hours:
25 hours towards improving and building upon our existing Docker containers, meeting with stakeholders, and meeting with members of the Data Lab for assistance with our containers. 


### Rose:
The highlight of this week was meeting with multiple stakeholders and gaining more in-depth feedback from them, as well as meeting with Michele Cosi and collaborating with him which allowed me to gain more high-level insight into the containers we are creating as well as assistance regarding the problems we are currently facing.

### Bud:
We are making progress towards getting a SLEAP environment that also has Diplomat installed, and our stakeholders showed enthusiasm after seeing the demo that we walked them through showing how the software can be used to help their research process.

### Thorn: 
It seems as though one of the biggest issues we face right now is not being able to successfully install SLEAP using Python 3.9 or 3.10 (for Diplomat compatibility) which is becoming a bit frustrating as we continue to troubleshoot to no avail. We have found new people to contact, specifically the developers of Diplomat, so this will be helpful in solving our problem.

---