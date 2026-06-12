{{/*
Expand the name of the chart.
*/}}
{{- define "clickhouse-movoor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "clickhouse-movoor.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "clickhouse-movoor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "clickhouse-movoor.labels" -}}
helm.sh/chart: {{ include "clickhouse-movoor.chart" . }}
{{ include "clickhouse-movoor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "clickhouse-movoor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "clickhouse-movoor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "clickhouse-movoor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "clickhouse-movoor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "clickhouse-movoor.metricsPort" -}}
{{ (split ":" .Values.config.metricsAddr)._1 | default "9090" }}
{{- end -}}

{{- define "clickhouse-movoor.probePort" -}}
{{- if .Values.config.healthCheckAddr -}}
{{- if hasPrefix ":" .Values.config.healthCheckAddr -}}
{{ trimPrefix ":" .Values.config.healthCheckAddr }}
{{- else -}}
{{ .Values.config.healthCheckAddr }}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "clickhouse-movoor.frontendPort" -}}
{{- if .Values.config.frontend.enabled -}}
{{ (split ":" .Values.config.frontend.addr)._1 | default "8080" }}
{{- end -}}
{{- end -}}
