{{- define "redis-chart.selectorLabels" -}}
app: demo-voting-app
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "redis-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "redis-chart.labels" -}}
helm.sh/chart: {{ include "redis-chart.chart" . }}
{{ include "redis-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "redis-chart.mounts" -}}
- name: data
  mountPath: /data
{{- end -}}