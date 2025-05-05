Following the [Rose/Bud/Thorn model](https://www.panoramaed.com/blog/rose-bud-thorn-activity-and-worksheet#:~:text=%22Rose%2C%20Bud%2C%20Thorn%22%20is%20a%20mindful%20design%2D,day%2C%20week%2C%20or%20month.)
### Date:
Week of March 17, 2025

Log entry on March 21, 2025

### Number of hours:
10 hours towards research + familiarizing ourselves with the toolset and tech stake, business analysis + requirements gathering meetings with stakeholders, proof of concept for a
solution

### Rose:
Highlight for me was meeting people, learning the proiblems faced by the people we are trying to assist with pose estimation
(Anna, who is doing social insects with bees and ants, and Martha, who is doing neuro diseases with flies and mice)
Our project is starting materialize and become clear; We are enabling their work with a state of the art toolset, utilization containerization, cloud computing, 
reproducible environments, and simple but effecive onboarding docs.

### Bud:
It seems like these initial requirements are very high value and low ish effort; So we should be able to make a large impact for them in a short amount of time,
pending a successful proof of concept and MVP.

### Thorn:
Even though we got a lot of information, really pinpointing what it is we want to accomplish, something that is realistic, reproducible, expandable, and high value given
our timeline, expertise, etc, has been ahrd. I think we are close, but not quite there, which is frustrating given how far into the semester we are. 

### Additional thought
Still need to finalize project proposal and then flesh out a timeline now that requirements are materializing -> "This is what we are doing, so how are we going to do it, and when do we need to do it by?"

Overall I think this week was productive and we are moving in a good direction, but we need to accelerate in order to hit both our teams learning goals and the stakeholders' needs

---

### Date:
Week of March 24, 2025

Log entry on March 30, 2025

### Number of hours:
15 hours towards research + familiarizing ourselves with the toolset and tech stake, business analysis + requirements gathering meetings with stakeholders, proof of concept for a solution

### Rose:
Wrapping up our project proposal, have a clear direction for what we need to be doing, timelines, deliverables, lines of communication with stakeholders. It is daunting yet valuable and achievable

### Bud:
The containers are coming along nicely; For myself, I was working on the sleep one. We got the image to build and the container to run. This is good progress and will be foundational for then getting these tools and workflows into scalable cloud environments for the stakeholders

### Thorn:
There were a lot of issues with the container, including the base image and how that affects our ability to use the GUI portion of the app we are containerizing. We are working through that but due to the compleixty of the apps, the dockerizing process is taking longer than I would like

### Additional thoughts
Overall I think the team dynamic is developing nicely, people are settling into roles and tasks, and we have a good direction charted towards our final deliverable. I think going forward we will need to be more concerned with pace than direction or how we distribute work.

---

### Date:
Week of March 31, 2025

Log entry on April 7, 2025

### Number of hours:
25 hours towards research and troubleshooting our SLEAP and Diplomat dockerfiles + builds

### Rose:
Finished proposal, met with a lot of stakeholders, made some working images with just SLEAP or just DLC. Also pushed some of those working containers to registries so others can pull them.

### Bud:
Made some good progress settings up SLEAP with Diplomat and GPU enhancement. 

### Thorn:
Issues with dependencies, environment setups, python version. Diplomat uses a higher version of python than what is offered by installing SLEAP with Conda or Mamba. So we are struggling with having one or multiple environments, one or multiple package managers, and making sure all dependencies and versions thereof behave nicely together

### Additional thoughts
I think that we can provide immense value to stakeholders with that we have, but the value is exponential if we can get all components of our proposal working nicely together. It is proving harder than anticpated, so there will be definitely be a dash near the end of the project to get everything together for a demo and onboarding for our stakeholders to use the tools we have brought together for them.

---

### Date:
Week of  April 7, 2025

Log entry on April 13, 2025

### Number of hours:
25 hours towards research and troubleshooting our SLEAP and Diplomat dockerfiles + builds

### Rose:
Finally got a functional container with SLEAP and Jupyter, as well as necessary GPU dependencies.

### Bud:
Have meetings to get the image into cyverse and to work through Dplomat issues

### Thorn:
Still no luck resolving dependency issues with Diplomat and SLEAP. Either the python versions are misaligned, or dependency versions (for example, Tensorflow, Keras, etc) are misaligned. 

### Additional thoughts
I want to transition towards software use documentation and model explanations for our users soon; The technical difficulties are far more time consuming than we would have liked

---

### Date:
Week of  April 14, 2025

Log entry on April 20, 2025

### Number of hours:
20 hours towards research and troubleshooting our SLEAP and Diplomat dockerfiles + builds

### Rose:
Got functional SLEAP and DLC containers running in cyverse

### Bud:
Working on getting snapshot for functional apps in Jetstream. Working on documentation final product and iShowcase poster

### Thorn:
Ran into some issues regarding GPU on cyverse; The training and inference stage takes a while, not confident it is actually utilizing the GPU like we want


---

### Date:
Week of  April 21, 2025

Log entry on April 27, 2025

### Number of hours:
20 hours towards meetings, writing documentation, working on poster, working through technical issues

### Rose:
Poster nearly done, documentation nearly done. Tool verified working in both cyverse and jetstream

### Bud:
Have some meetings to get some end user feedback; Have the opportunity to get one more "nice to have" into the tool with diplomat

### Thorn:
Still some issues regarding GPU on Cyverse; We can do the training of single videos we believe with SLEAP, however when we try to do a batch predict, it seems like on Cyverse we don't have enough RAM. We get farther into the training (Later Epoch) on jetstream, so we need to reach out to our Cyverse contact to ensure we have the proper resource allocation for every instance of our tool launching. 

---

### Date:
Week of  April 28, 2025

Log entry on May 5, 2025

### Number of hours:
15 hours towards meetings, writing documentation, working on poster, working through technical issues

### Rose:
Poster done, documentation nearly done. App functionality nearly complete (all tools users need installed). Turned in a lot of auxillary things (e.g., team eval)

### Bud:
Working towards a solution with cacaco, terraform, and being able to let students launch workflows in jetstream with little to no setup on their end. 
Also making sure we can get model output into usable format for end users.

### Thorn:
Still some issues regarding GPU on Cyverse; We determined that we might not have enough RAM or vRAM to do SLEAP analysis , even after we manually upped our resources. We are trying a different version of SLEAP to see if that can't yield a full analysis with our resource specs, otherwise we might just write off SLEAP as incompatible with cyverse resource config. 


---
