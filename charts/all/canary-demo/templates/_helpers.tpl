{{/*
Expand the name of the chart.
*/}}
{{- define "canary-demo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "canary-demo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "canary-demo.labels" -}}
app:  {{ include "canary-demo.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "canary-demo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "canary-demo.name" . }}
app:  {{ include "canary-demo.name" . }}
{{- end }}

{{/*
Container Spec
*/}}
{{- define "canary-demo.containerSpec" }}
        - name: http
          containerPort: 8080
          protocol: TCP
        resources:
          requests:
            memory: {{ .Values.resources.requests.memory  }}
            cpu: {{ .Values.resources.requests.cpu  }}
{{- end }}

{{- define "canary-demo.serviceSpec" }}
  - port: {{ .Values.service.port }}
    targetPort: {{ .Values.service.targetPort }}
    protocol: {{ .Values.service.protocol }}
    name: {{ .Values.service.name }}
{{- end }}