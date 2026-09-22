{{/*
SPDX-FileCopyrightText: 2026 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
*/}}

{{/*
Fully qualified domain name of this impress instance.

"global.fqdn" is the single source of truth for every URL this chart builds: the CSRF origins and
Django site, the links in outgoing mail, the collaboration endpoints and the default ingress hosts.
Helm does not treat it as required, so leaving it unset renders values like "https://" or an empty
nginx "server_name" without any error -- a release that installs cleanly and only fails later, as
broken mail links or a backend rejecting its own requests. Demand it here instead, while the
message can still name what is missing.
*/}}
{{- define "impress.frontend.fqdn" -}}
{{- required "global.fqdn is required: set it to the fully qualified domain name of this impress instance, e.g. notes.example.org" .Values.global.fqdn -}}
{{- end -}}
