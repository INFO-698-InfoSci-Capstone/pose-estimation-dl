# openstack info
project = "myproject" 
security_groups = ["default","cacao-default"]
instance_name = "myworkshop"
username = "myusername"

image_name = "Pose-Estimation"
flavor = "m3.tiny"
keypair = "mykeypair"
ip_pool = "public"
user_data = ""
do_ansible_execution=true

# if there is shared storage, set to share_name to "" if none
share_name = "myworkshop-share"
share_access_key="access-key-provided-by-openstack"
share_mount_path="where-to-mount-in-vm-like /mnt/myworkshop-share"

# Note, you can change the power_state to "shutoff" to temporarily turn the instances off
power_state = "active"

# Total student
instance_instructor_count = 1
student_usernames=["user1","user2","user3"]
students_per_instance=2
instructors_ssh_keys_base64="insert-base64-encoded-publicsshkey-here1,insert-base64-encoded-publicsshkey-here2"
