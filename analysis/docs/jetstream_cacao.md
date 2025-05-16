# Creating a Terraform Template for CACAO 

## Create a base image for the template

1. Before creating a Terraform template for CACAO use, create a snapshot image containing the desired software and features that will be used in the template. Refer to the [Jetstream instance creation](jetstream_instance_creation.md) instructions to do this.

2. Ensure that the snapshot image is acccessible by users outside of the project that it was created in. Refer to [Jetstream's documentation](https://docs.jetstream-cloud.org/ui/cli/snapshot-image/?h=sharing+image#sharing-an-image) on how this is done.

## Create the Terraform template

1. Find an existing repository containing Terraform files that create a template for an application similar to yours
    - Choose a template whose configuration parameters are similar to those that will be necessary for your application
        - For example if your deployment will require the specification of how many virtual machines will be needed for students, student usernames, etc., then choose an existing template with these parameters
    - The [cacao-tf-os-ops](https://gitlab.com/cyverse/cacao-tf-os-ops) project provides a collection of OpenStack Terraform templates 
    - The Terraform files used in this repository were copied from the [vms4workshop](https://gitlab.com/cyverse/cacao-tf-os-ops/-/tree/main/vms4workshop?ref_type=heads) repository with the exception of the ui.json file

2. If the Terraform files you copied do not contain a ui.json file in the `.cacao` directory, find a repository that contains a ui.json file and copy it into yours

![Create ui.json](images/terraform_uijson.png)

- The ui.json file in this repository was copied from the [cacao-tf-os-ops single-image](https://gitlab.com/cyverse/cacao-tf-os-ops/-/tree/main/single-image?ref_type=heads) repository

3. Modify the ui.json file to include the necessary configuration parameters, ensuring that any parameters listed in the ui.json file are also present in the metadata.json file.

![Matching ui.json and metadata.json parameters](images/terraform_ui_metadata_json.png)

4. After making the necessary modifications to the ui.json and metadata.json files, open a terminal and set the working directory to the folder containing the Terraform files. 