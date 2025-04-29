resource "local_file" "ansible-inventory" {
    count = var.do_ansible_execution && var.power_state == "active" ? 1 : 0

    content = templatefile("${path.module}/hosts.yml.tftpl",
    {
        instructor_instance_ips = openstack_compute_floatingip_associate_v2.instructor_floatingips_associate.*.floating_ip
        instructor_instance_names = openstack_compute_instance_v2.instructor_instance.*.name
        instructor_username = local.temp_instructor_username
        instructor_password = random_pet.random_instructor_password.id
        student_instance_ips = openstack_compute_floatingip_associate_v2.student_floatingips_associate.*.floating_ip
        student_instance_names = openstack_compute_instance_v2.student_instance.*.name
        combined_student_list = local.combined_student_list
        students_per_instance = var.students_per_instance
        instructors_ssh_keys_base64 = local.instructors_ssh_keys_base64
        share_name = var.share_name
        share_access_key = var.share_access_key
        share_mount_path = var.share_mount_path
        share_access_to = local.share_access_to
        share_export_path = local.share_export_path
        cacao_user = var.username
        csv_email = var.csv_email
        csv_assignments_upload_location = var.csv_assignments_upload_location
    })
    filename = "${path.module}/ansible/hosts.yml"
}

resource "null_resource" "ansible-execution" {
    count = var.do_ansible_execution && var.power_state == "active" ? 1 : 0

    triggers = {
        always_run = "${timestamp()}"
    }

    provisioner "local-exec" {
        command = "ansible-galaxy role install -r requirements.yml"
        working_dir = "${path.module}/ansible"
    }

    provisioner "local-exec" {
        command = "ansible-galaxy collection install -r requirements.yml"
        working_dir = "${path.module}/ansible"
    }

    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ANSIBLE_SSH_PIPELINING=True ANSIBLE_CONFIG=ansible.cfg ansible-playbook -i hosts.yml --forks=10 playbook.yml"
        working_dir = "${path.module}/ansible"
    }

    depends_on = [
        local_file.ansible-inventory,
        local_file.student_assignments_csv
    ]
}
