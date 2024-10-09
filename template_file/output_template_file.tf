output "userdata_rendered" {
    value = data.template_file.conf.rendered
}
