output "kubeconfig" {
  value = data.spot_kubeconfig.kubelab_kubeconfig.raw
  sensitive = true
}