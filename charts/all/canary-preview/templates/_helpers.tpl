{{/*
Expand the name of the chart.
*/}}
{{- define "canary-preview.name" }}
{{- range .Values.canary }}
{{/*
{{- if has "preview" .name }}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}-preview
{{- else if has "production" .name }}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}-production
{{- else }}
*/}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}-{{ .name }}
{{- end }}
{{- end }}
{{/*
{{- end }}
*/}}
{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "canary-preview.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "canary-preview.labels" -}}
app:  {{ include "canary-preview.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "canary-preview.selectorLabels" -}}
app.kubernetes.io/name: {{ include "canary-preview.name" . }}
app:  {{ include "canary-preview.name" . }}
{{- end }}

{{/*
Service Spec
*/}}
{{- define "canary-preview.serviceSpec" }}
  - port: {{ .Values.service.port }}
    targetPort: {{ .Values.service.targetPort }}
    protocol: {{ .Values.service.protocol }}
{{- end }}