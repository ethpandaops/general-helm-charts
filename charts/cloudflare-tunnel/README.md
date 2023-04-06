# cloudflare-tunnel

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Creation of a cloudflared deployment - a reverse tunnel for an environment

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| cloudflare.account | string | `""` |  |
| cloudflare.enableWarp | bool | `false` |  |
| cloudflare.ingress | list | `[]` |  |
| cloudflare.secret | string | `""` |  |
| cloudflare.tunnelId | string | `""` |  |
| cloudflare.tunnelName | string | `""` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"cloudflare/cloudflared"` |  |
| image.tag | string | `"2023.2.2"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
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
