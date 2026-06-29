# wagie

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A modular project orchestration platform

**Homepage:** <https://github.com/ethpandaops/wagie>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| config | object | `{"data-dir":"/data"}` | Wagie config (/config/config.yaml). Only data-dir set by default; supply the rest per deployment. |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the wagie container |
| customCommand | list | `[]` | Command replacement for the wagie container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | wagie container pull policy |
| image.repository | string | `"ethpandaops/wagie"` | wagie container image repository |
| image.tag | string | `"latest"` | wagie container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| kind | string | `"Deployment"` | Workload controller kind: Deployment (default) or StatefulSet |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| persistentVolumeClaimRetentionPolicy | object | `{}` | StatefulSet only: PVC retention policy (whenScaled/whenDeleted). Empty = default Retain/Retain. |
| podAnnotations | object | `{}` | Pod annotations |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | StatefulSet only: pod management policy (OrderedReady or Parallel) |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Replicas. Set null to omit the field so an HPA/KEDA owns the count. |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{}` | Secret env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.enabled | bool | `true` | Create a Service. Set false for outbound-only workers (no inbound ports). |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"15s"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| serviceName | string | `""` | StatefulSet only: governing service name (defaults to the chart fullname) |
| target | string | all | Wagie target modules to run (comma-separated) |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{}` | StatefulSet only: update strategy |
| volumeClaimTemplates | list | `[]` | StatefulSet only: PVC templates. A `data` template backs /data and persists per ordinal. |
