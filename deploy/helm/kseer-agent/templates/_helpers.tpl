{{/* Expand the name of the chart. */}}
{{- define "kseer-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels, including app.kubernetes.io/name so
`kubectl logs -n monitoring -l app.kubernetes.io/name=kseer-agent`
selects the POC pod.
*/}}
{{- define "kseer-agent.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 }}
{{ include "kseer-agent.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "kseer-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kseer-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
