{{/*
SPDX-FileCopyrightText: 2026 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
*/}}

{{/*
Environment of the backend containers.

Shared by the backend deployment and the Celery worker deployment so that both always run with the
same configuration. Emitted at the indentation of a container's "env:" list, so include it without
"nindent":

  env:
    {{- include "impress.backend.env" . }}
*/}}
{{- define "impress.backend.env" -}}
            {{- if .Values.configuration.database.engine }}
            - name: "DB_ENGINE"
              value: {{ .Values.configuration.database.engine | quote }}
            {{- end }}
            - name: "DB_NAME"
              value: {{ .Values.configuration.database.name | quote }}
            - name: "DB_USER"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.database.user.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.database.user.existingSecret.key | default "dbUser" | quote }}
            - name: "DB_PASSWORD"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.database.password.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.database.password.key | default "dbPassword" | quote }}
            - name: "DB_HOST"
              value: {{ .Values.configuration.database.host | quote }}
            - name: "DB_PORT"
              value: {{ .Values.configuration.database.port | quote }}
            - name: "REDIS_URL"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.redisUrl.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.redisUrl.existingSecret.key | default "redisUrl" | quote }}
            {{- if or .Values.configuration.celery.broker.url.value .Values.configuration.celery.broker.url.existingSecret.name }}
            - name: "DJANGO_CELERY_BROKER_URL"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.celery.broker.url.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.celery.broker.url.existingSecret.key | default "celeryBrokerUrl" | quote }}
            {{- else if .Values.configuration.celery.broker.host }}
            - name: "CELERY_BROKER_PASSWORD"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.celery.broker.password.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.celery.broker.password.existingSecret.key | default "celeryBrokerPassword" | quote }}
            # The password stays in the secret: kubelet expands "$(VAR)" in an environment value
            # from the variables declared before it, so the URL is only joined in the container.
            - name: "DJANGO_CELERY_BROKER_URL"
              value: {{ printf "%s://%s:$(CELERY_BROKER_PASSWORD)@%s:%v/%v"
                .Values.configuration.celery.broker.scheme
                (.Values.configuration.celery.broker.username | urlquery | replace "+" "%20")
                .Values.configuration.celery.broker.host
                .Values.configuration.celery.broker.port
                .Values.configuration.celery.broker.database | quote }}
            {{- end }}
            - name: "DJANGO_CSRF_TRUSTED_ORIGINS"
              value: {{ .Values.configuration.django.csrfTrustedOrigins | default (printf "https://%s" (include "impress.backend.fqdn" .)) | quote }}
            - name: "DJANGO_SITE_DOMAIN"
              value: {{ .Values.configuration.django.siteDomain | default (include "impress.backend.fqdn" .) | quote }}
            - name: "DJANGO_SITE_NAME"
              value: {{ .Values.configuration.django.siteName | default (include "impress.backend.fqdn" .) | quote }}
            - name: "DJANGO_CONFIGURATION"
              value: {{ .Values.configuration.django.configuration | default "Production" | quote }}
            - name: "DJANGO_ALLOWED_HOSTS"
              value: {{ .Values.configuration.django.allowedHosts | quote }}
            - name: "DJANGO_SECRET_KEY"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.django.secretKey.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.django.secretKey.existingSecret.key | default "djangoSecretKey" | quote }}
            - name: "DJANGO_SETTINGS_MODULE"
              value: {{ .Values.configuration.django.settingsModule | quote }}
            - name: "DJANGO_SUPERUSER_PASSWORD"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.django.superuserPassword.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.django.superuserPassword.existingSecret.key | default "djangoSuperuserPassword" | quote }}
            - name: "DJANGO_EMAIL_BRAND_NAME"
              value: {{ .Values.configuration.email.brandName | quote }}
            - name: "DJANGO_EMAIL_LOGO_IMG"
              value: {{ .Values.configuration.email.logoImage | quote }}
            - name: "DJANGO_EMAIL_FROM"
              value: {{ .Values.configuration.email.from | quote }}
            - name: "DJANGO_EMAIL_URL_APP"
              value: {{ .Values.configuration.email.urlApp | default (printf "https://%s" (include "impress.backend.fqdn" .)) | quote }}
            - name: "DJANGO_EMAIL_HOST"
              value: {{ .Values.configuration.email.host | quote }}
            - name: "DJANGO_EMAIL_PORT"
              value: {{ .Values.configuration.email.port | quote }}
            - name: "DJANGO_EMAIL_USE_SSL"
              value: {{ .Values.configuration.email.useSSL | quote }}
            - name: "DJANGO_EMAIL_HOST_USER"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.email.user.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.email.user.existingSecret.key | default "djangoEmailHostUser" | quote }}
            - name: "DJANGO_EMAIL_HOST_PASSWORD"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.email.password.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.email.password.existingSecret.key | default "djangoEmailHostPassword" | quote }}
            - name: "DJANGO_EMAIL_USE_TLS"
              value: {{ .Values.configuration.email.useTLS | quote }}
            - name: "AI_FEATURE_ENABLED"
              value: {{ .Values.configuration.ai.enabled | quote }}
            - name: "AI_FEATURE_BLOCKNOTE_ENABLED"
              value: "true"
            - name: "AI_FEATURE_LEGACY_ENABLED"
              value: "true"
            - name: "OPENAI_SDK_API_KEY"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.ai.apiKey.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.ai.apiKey.existingSecret.key | default "aiApiKey" | quote }}
            - name: "OPENAI_SDK_BASE_URL"
              value: {{ .Values.configuration.ai.baseUrl | quote }}
            - name: "AI_MODEL"
              value: {{ .Values.configuration.ai.model | quote }}
            - name: "AI_ALLOW_REACH_FROM"
              value: {{ .Values.configuration.ai.allowReachFrom | quote }}
            - name: "AWS_S3_ENDPOINT_URL"
              value: {{ printf "https://%s:%v" .Values.global.s3.host .Values.global.s3.port | quote }}
            - name: "AWS_S3_ACCESS_KEY_ID"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.global.s3.accessKeyId.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.global.s3.accessKeyId.existingSecret.key | quote }}
            - name: "AWS_S3_SECRET_ACCESS_KEY"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.global.s3.secretAccessKey.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.global.s3.secretAccessKey.existingSecret.key | quote }}
            - name: "AWS_S3_REGION_NAME"
              value: {{ .Values.global.s3.regionName | quote }}
            - name: "AWS_STORAGE_BUCKET_NAME"
              value: {{ .Values.global.s3.bucketName | quote }}
            {{- if .Values.configuration.oidc.enabled }}
            - name: "OIDC_CREATE_USER"
              value: {{ .Values.configuration.oidc.createUser | quote }}
            - name: "OIDC_RP_SIGN_ALGO"
              value: {{ .Values.configuration.oidc.rpSignAlgo | quote }}
            - name: "OIDC_RP_CLIENT_ID"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.oidc.rpClientId.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.oidc.rpClientId.existingSecret.key | default "oidcRpClientId" | quote }}
            - name: "OIDC_RP_CLIENT_SECRET"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.configuration.oidc.rpClientSecret.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.configuration.oidc.rpClientSecret.existingSecret.key | default "oidcRpClientSecret" | quote }}
            - name: "OIDC_OP_JWKS_ENDPOINT"
              value: {{ .Values.configuration.oidc.opJWKSEndpoint | quote }}
            - name: "OIDC_OP_AUTHORIZATION_ENDPOINT"
              value: {{ .Values.configuration.oidc.opAuthorizationEndpoint | quote }}
            - name: "OIDC_OP_TOKEN_ENDPOINT"
              value: {{ .Values.configuration.oidc.opTokenEndpoint | quote }}
            - name: "OIDC_OP_USER_ENDPOINT"
              value: {{ .Values.configuration.oidc.opUserEndpoint | quote }}
            - name: "OIDC_OP_LOGOUT_ENDPOINT"
              value: {{ .Values.configuration.oidc.opLogoutEndpoint | quote }}
            - name: "OIDC_AUTH_REQUEST_EXTRA_PARAMS"
              value: {{ .Values.configuration.oidc.authRequestExtraParams | quote }}
            - name: "OIDC_RP_SCOPES"
              value: {{ .Values.configuration.oidc.rpScopes | quote }}
            - name: "LOGIN_REDIRECT_URL"
              value: {{ .Values.configuration.oidc.loginRedirectUrl | default (printf "https://%s/" (include "impress.backend.fqdn" .)) quote }}
            - name: "LOGIN_REDIRECT_URL_FAILURE"
              value: {{ .Values.configuration.oidc.loginRedirectUrlFailure | quote }}
            - name: "LOGOUT_REDIRECT_URL"
              value: {{ .Values.configuration.oidc.logoutRedirectUrl | quote }}
            - name: "OIDC_USE_NONCE"
              value: {{ .Values.configuration.oidc.useNonce | quote }}
            - name: "OIDC_REDIRECT_REQUIRE_HTTPS"
              value: {{ .Values.configuration.oidc.redirectRequireHTTPS | quote }}
            - name: "OIDC_REDIRECT_ALLOWED_HOSTS"
              value: {{ .Values.configuration.oidc.redirectAllowedHosts | quote }}
            - name: "OIDC_STORE_ID_TOKEN"
              value: {{ .Values.configuration.oidc.storeIDToken | quote }}
            - name: "OIDC_FALLBACK_TO_EMAIL_FOR_IDENTIFICATION"
              value: {{ .Values.configuration.oidc.fallbackToEmailForIdentification | quote }}
            - name: "OIDC_ALLOW_DUPLICATE_EMAILS"
              value: {{ .Values.configuration.oidc.allowDuplicateEmails | quote }}
            - name: "USER_OIDC_ESSENTIAL_CLAIMS"
              value: {{ .Values.configuration.oidc.essentialClaims | quote }}
            - name: "OIDC_USERINFO_FULLNAME_FIELDS"
              value: {{ .Values.configuration.oidc.fullnameFields | quote }}
            - name: "OIDC_USERINFO_SHORTNAME_FIELD"
              value: {{ .Values.configuration.oidc.shortnameField | quote }}
            - name: "ALLOW_LOGOUT_GET_METHOD"
              value: {{ .Values.configuration.oidc.allowLogoutGetMethod | quote }}
            {{- end }}
            - name: "Y_PROVIDER_API_KEY"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.global.yProviderApiKey.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.global.yProviderApiKey.existingSecret.key | default "yProviderApiKey" | quote }}
            - name: "Y_PROVIDER_API_BASE_URL"
              value: {{ .Values.configuration.yProvider.apiBaseUrl | default (printf "https://%s/api/" (include "impress.backend.fqdn" .)) | quote }}
            - name: "COLLABORATION_API_URL"
              value: {{ .Values.configuration.collaboration.apiUrl | quote }}
            {{- if or .Values.configuration.docSpec.apiUrl .Values.configuration.docSpec.enabled }}
            - name: "DOCSPEC_API_URL"
              value: {{ .Values.configuration.docSpec.apiUrl | default (printf "http://%s-docspec" .Release.Name) | quote }}
            {{- end }}
            - name: "COLLABORATION_SERVER_SECRET"
              valueFrom:
                secretKeyRef:
                  name: {{ .Values.global.collaborationServerSecret.existingSecret.name | default (include "common.names.fullname" .) | quote }}
                  key: {{ .Values.global.collaborationServerSecret.existingSecret.key | default "collaborationServerSecret" | quote }}
            - name: "COLLABORATION_WS_URL"
              value: {{ .Values.configuration.collaboration.wsUrl | quote }}
            - name: "FRONTEND_THEME"
              value: {{ .Values.configuration.frontendTheme | quote }}
            - name: "MEDIA_BASE_URL"
              value: {{ .Values.configuration.mediaBaseUrl | quote }}
            {{- if .Values.configuration.documentImageMaxSize }}
            - name: "DOCUMENT_IMAGE_MAX_SIZE"
              value: {{ .Values.configuration.documentImageMaxSize | quote }}
            {{- end }}
            - name: "TRASHBIN_CUTOFF_DAYS"
              value: {{ .Values.configuration.trashbinCutoffDays | quote }}
          {{- with .Values.extraEnvVars }}
            {{- . | toYaml | nindent 12 }}
          {{- end }}
{{- end -}}

{{/*
Command probing a Celery worker. It serves no HTTP, so it is asked to answer a ping over the
broker instead. $HOSTNAME is expanded by the shell: a probe's command is passed to exec()
unchanged, so "$(VAR)" would reach Celery verbatim.
*/}}
{{- define "impress.backend.worker.probe" -}}
- "sh"
- "-c"
- "celery --app impress.celery_app inspect ping --destination celery@$HOSTNAME --timeout {{ . }}"
{{- end -}}
