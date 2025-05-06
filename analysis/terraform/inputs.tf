variable "username" {
  type = string
  description = "string, username to launch either as 'user' or 'user@xsede.org' (xsede.org or any email)"
}

variable "project" {
  type = string
  description = "project name"
}

variable "region" {
  type = string
  description = "string, openstack region name; default = IU"
  default = "IU"
}

variable "instance_name" {
  type = string
  description = "name of instance"
}

variable "instructor_username" {
  type = string
  description = "string, username of instructor account that will be setup on all instructor instances; default = 'instructor'"
  default = "instructor"
}

variable "instance_instructor_count" {
  type = number
  description = "number of instances to launch for instructor"
  default = 1
}

variable "students_per_instance" {
  type = number
  description = "number, number of students to assign per instance"
  default = 1
}

variable "min_instances" {
  type = number
  description = "number, minimum number of instances to start"
  default = 1
}

variable "image" {
  type = string
  description = "string, image id; image will have priority if both image and image name are provided"
  default = ""
}

variable "image_name" {
  type = string
  description = "string, name of image; image will have priority if both image and image name are provided"
  default = ""
}

variable "flavor" {
  type = string
  description = "flavor or size of instance to launch"
  default = "m1.tiny"
}

variable "keypair" {
  type = string
  description = "keypair to use when launching"
  default = ""
}

variable "power_state" {
  type = string
  description = "power state of instance"
  default = "active"
}

variable "ip_pool" {
  type = string
  description = "deprecated"
  default = "public"
}

variable "user_data" {
  type = string
  description = "cloud init script"
  default = ""
}

variable "security_groups" {
  type = list(string)
  description = "array of security group names, either as a a comma-separated string or a list(string). The default is ['default', 'cacao-default']. See local.security_groups"
  default = ["default", "cacao-default"]
}

variable "student_usernames" {
  type = any
  description = "array of student_usernaes, either as a comma-separated string or a list(string); default is []; see local.jupyterhub_allowed_users"
  default = []
}

variable "share_name" {
  type = string
  description = "string, the name of a pre-provisioned share, which includes the name + random string; if share_name == '', then share won't be activated"
  default = ""
}

variable "share_mount_path" {
  type = string
  description = "string, the path within the vms to mount the share, only valid if share_name is provided; no default"
  default = "/mnt/class_data"
}

variable "share_access_key" {
  type = string
  description = "string, the access key generated when creating the openstack access"
  default = ""
}

variable "share_access_level" {
  type = string
  description = "string, the share access level, rw or ro; default = rw"
  default = "rw"
}

variable "share_access_to" {
  type = string
  description = "string, the name of the access_to field of share access; if not set, will default to share_name + _access_ + share_access_level"
  default = ""
}

variable "do_ansible_execution" {
  type = bool
  description = "boolean, whether to execute ansible"
  default = true
}

variable "instructors_ssh_keys_base64" {
  type = any
  description = "any, either a comma-separated string or list of base64-encoded public ssh keys"
  default = []
}

# variable "do_generate_local_csv" {
#   type = bool
#   description = "boolean, whether to generate local csv file; default = false"
#   default = false
# }

variable "csv_email" {
  type = string
  description = "email to send csv"
  default = ""
}

variable "csv_assignments_upload_location" {
  type = string
  description = "string, location to upload student-to-vm assignments csv on every instructor instance"
  default = "/opt/student_assignments.csv"
}

variable "fip_associate_timewait" {
  type = string
  description = "number, time to wait before associating a floating ip in seconds; needed for jetstream; will not be exposed to downstream clients"
  default = "30s"
}

variable "root_storage_source" {
  type = string
  description = "string, source currently supported is image; future values will include volume, snapshot, blank"
  default = "image"
}

variable "root_storage_type" {
  type = string
  description = "string, type is either local or volume"
  default = "local"
}

variable "root_storage_size" {
  type = number
  description = "number, size in GB"
  default = -1
}

variable "root_storage_delete_on_termination" {
  type = bool
  description = "bool, if true delete on termination"
  default = true
}