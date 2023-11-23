# cloudflare-tunnel

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Creation of a cloudflared deployment - a reverse tunnel for an environment

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | list | `[]` |  |
| cloudflare.account | string | `""` |  |
| cloudflare.enableWarp | bool | `false` |  |
| cloudflare.ingress | list | `[]` |  |
| cloudflare.secret | string | `""` |  |
| cloudflare.tunnelId | string | `""` |  |
| cloudflare.tunnelName | string | `""` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"cloudflare/cloudflared"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podDisruptionBudget | object | `{"minAvailable":1}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `65532` |  |
| replicaCount | int | `2` |  |
| resources | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
