# Criação do Cloudspace
resource "spot_cloudspace" "kubelab_cloudspace" {
  cloudspace_name     = "kubelab"
  region             = "us-east-iad-1"
  hacontrol_plane    = false
  preemption_webhook = var.preemption_webhook
  wait_until_ready   = true
}

# Criação do Spot Node Pool com autoscaling
resource "spot_spotnodepool" "kubelab_nodepool" {
  cloudspace_name = resource.spot_cloudspace.kubelab_cloudspace.cloudspace_name
  server_class    = "gp.vs1.medium-iad"
  bid_price       = 0.001
  desired_server_count = 2

#  autoscaling = {
#    min_nodes = 2
#    max_nodes = 2
#}

}

# Obtendo kubeconfig
data "spot_kubeconfig" "kubelab_kubeconfig" {
  cloudspace_name = resource.spot_cloudspace.kubelab_cloudspace.cloudspace_name
}
