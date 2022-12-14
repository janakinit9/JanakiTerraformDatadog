
resource "datadog_monitor" "beacon" {
  name               = "Kubernetes Pod Health"
  type               = "metric alert"
  message            = "Kubernetes Pods are not in an optimal health state. Notify: @operator"
  escalation_message = "Please investigate the Kubernetes Pods, @operator"

  query = "max(last_1m):sum:docker.containers.running{short_image:beacon} <= 1"


  notify_no_data = true

  tags = ["app:beacon", "env:demo"]
}



