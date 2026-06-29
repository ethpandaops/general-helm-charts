{{/* Pod template (metadata + spec) shared by deployment.yaml and statefulset.yaml; include under `template:` with nindent 4. */}}
{{- define "wagie.podSpec" -}}
{{- $hasDataVct := false -}}
{{- range .Values.volumeClaimTemplates }}
{{- if eq (dig "metadata" "name" "" .) "data" }}{{- $hasDataVct = true }}{{- end }}
{{- end }}
metadata:
  labels:
    {{- include "wagie.selectorLabels" . | nindent 4 }}
    {{- with .Values.podLabels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  annotations:
    checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
    {{- if .Values.secretEnv }}
    checksum/secrets: {{ include (print $.Template.BasePath "/secret.yaml") . | sha256sum }}
    {{- end }}
    {{- with .Values.podAnnotations }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
spec:
  serviceAccountName: {{ include "wagie.serviceAccountName" . }}
  {{- with .Values.priorityClassName }}
  priorityClassName: {{ . }}
  {{- end }}
  {{- with .Values.securityContext }}
  securityContext:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.imagePullSecrets }}
  imagePullSecrets:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.initContainers }}
  initContainers:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  containers:
    - name: {{ .Chart.Name }}
      image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
      imagePullPolicy: {{ .Values.image.pullPolicy }}
      {{- with .Values.customCommand }}
      command:
        {{- toYaml . | nindent 8 }}
      {{- else }}
      command:
        - /usr/local/bin/wagie
        - --target
        - {{ .Values.target }}
        - --config
        - /config/config.yaml
        {{- with .Values.args }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      {{- end }}
      {{- with .Values.customArgs }}
      args:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.containerSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      volumeMounts:
        - name: config
          mountPath: /config/config.yaml
          subPath: config.yaml
          readOnly: true
        - name: data
          mountPath: /data
        {{- with .Values.extraVolumeMounts }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      ports:
        - name: http
          containerPort: {{ include "wagie.httpPort" . }}
          protocol: TCP
        {{- with .Values.extraPodPorts }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      {{- with .Values.livenessProbe }}
      livenessProbe:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.readinessProbe }}
      readinessProbe:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.resources }}
      resources:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        {{- range $key := (.Values.secretEnv | keys | sortAlpha) }}
        - name: {{ $key }}
          valueFrom:
            secretKeyRef:
              name: {{ include "wagie.fullname" $ }}-env
              key: {{ $key }}
        {{- end }}
        {{- with .Values.extraEnv }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
  {{- with .Values.extraContainers }}
  {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.nodeSelector }}
  nodeSelector:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.affinity }}
  affinity:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.tolerations }}
  tolerations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.topologySpreadConstraints }}
  topologySpreadConstraints:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  terminationGracePeriodSeconds: {{ .Values.terminationGracePeriodSeconds }}
  volumes:
    {{- with .Values.extraVolumes }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
    - name: config
      configMap:
        name: {{ include "wagie.fullname" . }}
    {{- if not $hasDataVct }}
    - name: data
      emptyDir: {}
    {{- end }}
{{- end }}
