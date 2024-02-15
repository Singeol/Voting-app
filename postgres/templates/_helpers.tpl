{{- define "postgres-chart.mounts" -}}
- name: db-data
  mountPath: /var/lib/postgresql/data
{{- end -}}