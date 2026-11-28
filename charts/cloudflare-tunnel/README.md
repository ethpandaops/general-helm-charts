# cloudflare-tunnel

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Creation of a cloudflared deployment - a reverse tunnel for an environment

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | list | `[]` |  |
| cloudflare.account | string | `""` |  |
| cloudflare.enableWarp | bool | `false` |  |
| cloudflare.existingSecret | string | `""` | Name of an existing Secret holding the tunnel credentials in a `credentials.json` key; when set, the chart creates no Secret. |
| cloudflare.ingress | list | `[]` |  |
| cloudflare.secret | string | `""` |  |
| cloudflare.tunnelId | string | `""` |  |
| cloudflare.tunnelName | string | `""` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"cloudflare/cloudflared"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| initContainers | list | `[]` | Init containers to add to the pod, rendered as given. They run before cloudflared starts. |
| minReadySeconds | int | `0` | Minimum seconds a new pod must stay Ready before the Deployment counts it as available. 0 leaves it unset. |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podDisruptionBudget | object | `{"minAvailable":1}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `65532` |  |
| readinessProbe | object | `{"failureThreshold":1,"httpGet":{"path":"/ready","port":2000},"periodSeconds":2}` | Readiness probe for the cloudflared container. `/ready` returns 200 only while cloudflared has an active connection to the Cloudflare edge. |
| replicaCount | int | `2` |  |
| resources | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
