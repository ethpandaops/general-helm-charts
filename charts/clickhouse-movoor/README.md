# clickhouse-movoor

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A ClickHouse storage tiering operator that moves cold MergeTree partitions to colder disks

**Homepage:** <https://github.com/ethpandaops/clickhouse-movoor>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| savid | andrew.davis@ethereum.org |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| args | list | `[]` | Command arguments |
| config.clickhouse.dialTimeout | string | `"5s"` | Dial timeout (standard Go duration) |
| config.clickhouse.nodes | list | See `values.yaml` | ClickHouse nodes (required). Each entry is one physical ClickHouse node, do not use comma-separated failover DSNs or load-balanced addresses here. DSNs are environment-expanded, so ${CLICKHOUSE_PASSWORD} injected via secretEnv is supported |
| config.clickhouse.queryTimeout | string | `"30s"` | Query timeout (standard Go duration) |
| config.frontend.addr | string | `":8080"` | Address to serve the frontend on |
| config.frontend.enabled | bool | `true` | Enable or disable the frontend UI/API service |
| config.healthCheckAddr | string | `":8081"` | Health check server address |
| config.logging | string | `"info"` | Logging level: debug, info, warn/warning, or error |
| config.metricsAddr | string | `":9090"` | Metrics server address |
| config.tiering.defaults | object | See `values.yaml` | Defaults copied into every watch that has a tier block. A watch without a tier block remains observe-only |
| config.tiering.interval | string | `"5m"` | Pause between reconcile cycles |
| config.tiering.mode | string | `"plan"` | Tiering mode. "off" observes only, plan computes decisions without ALTERs, enforce applies movement/optimization decisions |
| config.watches | list | `[]` | Tables to watch. A watch without a tier block is observe-only |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the clickhouse-movoor container |
| customCommand | list | `[]` | Command replacement for the clickhouse-movoor container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | clickhouse-movoor container pull policy |
| image.repository | string | `"ethpandaops/clickhouse-movoor"` | clickhouse-movoor container image repository |
| image.tag | string | `"latest"` | clickhouse-movoor container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.http.annotations | object | `{}` | Annotations for Ingress |
| ingress.http.className | string | `""` |  |
| ingress.http.enabled | bool | `false` | Ingress resource for the HTTP frontend |
| ingress.http.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | Ingress host |
| ingress.http.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| lifecycle | object | `{}` | Lifecycle hooks. The default image is distroless, so exec hooks like /bin/sleep are not available |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Number of replicas. clickhouse-movoor is a singleton operator, you almost certainly want to keep this at 1 |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{}` | Secret env variables injected via a created secret. DSNs in the config are environment-expanded, so you can keep credentials out of the config, e.g. CLICKHOUSE_PASSWORD referenced as ${CLICKHOUSE_PASSWORD} |
| securityContext | object | See `values.yaml` | The security context for pods |
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
| terminationGracePeriodSeconds | int | `60` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | See `values.yaml` | Update strategy for the StatefulSet |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
