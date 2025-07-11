# Weekly/Bi-Weekly Log

## Prompts
Following the [Rose/Bud/Thorn](https://www.panoramaed.com/blog/rose-bud-thorn-activity-and-worksheet#:~:text=%22Rose%2C%20Bud%2C%20Thorn%22%20is%20a%20mindful%20design%2D,day%2C%20week%2C%20or%20month.) model:

### Date: 
Week of March 17, 2025

Date of entry: March 22, 2025


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

Date of entry: March 31, 2025


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
Week of April 7, 2025

Date of entry: April 14, 2025


### Number of hours:
25 hours towards getting a better working understanding of DeepLabCut by attempting to perform and analysis with it, along with continued work on containerizing DeepLabCut and Diplomat.

### Rose:
The highlight of this week was getting to work with the software itself, up to this point I had been focusing entirely on the containerization of it so I didn’t have a strong understanding of when the stakeholders would talk about the technical use details.

### Bud:
We now have working containers for both DeepLabCut and SLEAP, we just need to confirm they work correctly on Jetstream and CyVerse.

### Thorn: 
We are still facing significant issues installing Diplomat in the containers, which has resulted at us likely shifting away from Diplomat installation and leaving that for a future group.

---

### Date: 
Week of April 14, 2025

Date of entry: April 21, 2025


### Number of hours:
20 hours towards completing the containerization of DeepLabCut and SLEAP on CyVerse, testing their functionality, and beginning the deployment on Jetstream.

### Rose:
The highlight of this week was getting both containers completely working on CyVerse. It felt good to successfully get the containers deployed on one platform giving us an MVP. After a couple weeks of frustration it seems like we're finally getting to where we want to be, or at least starting to, and having a product that we can show to our stakeholders.

### Bud:
We have found an approach to the Jetstream deployment (virtual snapshots) that has given us optimism seeing that the original approach was off to a rocky start. Also, after pretty much abandoning Diplomat we have gotten assistance from Isaac Robinson (from Travis Wheeler's lab) and he has informed us he was able to get working containers with DeepLabCut-Diplomat and SLEAP-Diplomat. After making a couple modifications we should be able to deploy these on CyVerse and hopefully Jetstream. 

### Thorn: 
When going through a demo using SLEAP we ran into some issues which were also experienced by our stakeholders, but our stakeholders were able to resolve this issue so we are hoping to hear back from them to inform them we have working containers on CyVerse and also see how they handled the issues.

---

### Date: 
Week of April 21, 2025

Date of entry: April 27, 2025


### Number of hours:
20 hours towards creating video demos highlighting the ease of access our apps provide to SLEAP and DeepLabCut as well as a full DeepLabCut analysis walk through. Worked on conducting a full SLEAP analysis and troubleshooting technical issues that arose during this process, and also attended the poster presentations of students who used SLEAP from Martha Bhattacharya’s course. I was able to consult with these students and discuss their process, the issues they faced using SLEAP, and the improvements they would like to see to enhance their analyses.

### Rose:
The highlight of this week was getting to actually test the functionality of our tools/apps, up till now we had been stuck on the construction of them and unable to conduct any deployment testing. 

### Bud:
One of our stakeholders has invited us to join their lab session this coming week to have the students test our tools. This will be very useful in getting feedback directly from the end users.

### Thorn: 
When trying to go through a full SLEAP analysis on CyVerse we ran into a lot of issues, some of which seemed to be caused by SLEAP and others caused by CyVerse. We were able to get a little future in the analysis when using Jetstream, however we still faced an issue and were not able to complete the analysis so I am hoping by going to the lab with the students this week they will be able to use their experience with SLEAP to resolve the issues we faced.

---

### Date: 
Week of April 28, 2025

Date of entry: May 5, 2025


### Number of hours:
15 hours towards meeting with students and stakeholders to get end-user feedback, troubleshooting app configuration issues in CyVerse, and adding desktop shortcuts to our CyVerse and Jetstream apps/images.

### Rose:
The highlight of this week was being able to get direct feedback from end-users. We met with one of the students who was able to walk through the entire analysis process using our CyVerse DeepLabCut app, and I was also able to go to one of the undergraduate student lab sessions to get feedback there as well. 

### Bud:
We are very close to the end now and just putting the finishing touches on our product.

### Thorn: 
We are facing an issue when trying to add desktop shortcuts to our CyVerse apps because modifications were made to the base image that we originally used to construct our container. Because of this, when I went to build another image with additional features CyVerse was unable to pull the newly built image from Docker Hub. I am working with Michele to resolve this and hopefully we will be able to put these final touches on our product in the next couple days.

---