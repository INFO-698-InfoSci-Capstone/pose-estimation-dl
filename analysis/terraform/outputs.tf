# output "instance_instructor_ips" {
#   value = tolist(openstack_networking_floatingip_v2.instructor_floatingips.*.address)
# }
# output "instance_student_ip" {
#   value = tolist(openstack_networking_floatingip_v2.student_floatingips.*.address)
# }
# output "student_usernames" {
#   value = var.student_usernames
# }
# output "student_passwords" {
#   value = tolist(random_pet.random_password_student.*.id)
# }
output "csv" {
  # value = setproduct(var.student_usernames, random_pet.random_password_student.*.id)
  value = local.csv_content
}
output "csv_base64" {
  # value = setproduct(var.student_usernames, random_pet.random_password_student.*.id)
  value = base64encode (local.csv_content)
}

output "csv_assigment_location_msg" {
  value = format("A csv of the student assignments are located in every instructor instance in %s (use scp to copy locally).", var.csv_assignments_upload_location)
}
