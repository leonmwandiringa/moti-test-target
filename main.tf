
#!/ [http: module.Jenkins_CI_CD]
module "Jenkins_CI_CD" {
    source = "./modules/Jenkins"
    global_tags = var.global_tags
    instance_sg_rules_egress = var.jenkins_sg_rules_egress
    instance_sg_rules_ingress = var.jenkins_sg_rules_ingress
    private_ip = var.jenkins_private_ip
    instance_type = var.jenkins_instance_type
    instance_ami = var.jenkins_instance_ami
    instance_keys = var.jenkins_instance_keys
    user_data = file("./UserData/jenkins-user-data.sh")
}