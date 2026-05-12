<!--
SPDX-FileCopyrightText: 2025 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
-->
# impress

A chart for deploying La Suite Docs : Collaborative Text Editing

## Installing the Chart

To install the chart with the release name `my-release`, you have two options:

### Install via Repository
```console
helm repo add opendesk-impress https://gitlab.opencode.de/api/v4/projects/5478/packages/helm/stable
helm install my-release --version 1.1.2 opendesk-impress/impress
```

### Install via OCI Registry
```console
helm repo add opendesk-impress oci://registry.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress
helm install my-release --version 1.1.2 opendesk-impress/impress
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | backend | * |
|  | frontend | * |
|  | y-provider | * |
| https://charts.bitnami.com/bitnami | common | ^2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.collaborationServerSecret.existingSecret.key | string | `"collaborationServerSecret"` | Key where collaboration server secret is stored |
| global.collaborationServerSecret.existingSecret.name | string | `""` | Name of existing secret containing collaboration server secret, overrides provided value |
| global.collaborationServerSecret.value | string | `""` | Value of collaboration server secret |
| global.fqdn | string | `""` | fully qualified domain name of this impress instance |
| global.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. If the kubelet has a container image with that exact digest cached             locally, the kubelet uses its cached image; otherwise, the kubelet pulls the image with the resolved             digest, and uses that image to launch the container. "Never" => The kubelet does not try fetching the image. If the image is somehow already present locally, the            kubelet attempts to start the container; otherwise, startup fails.  |
| global.imagePullSecrets | list | `[]` | Credentials to fetch images from private registry. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| global.imageRegistry | string | `"docker.io"` | Container registry address. |
| global.s3 | object | `{"accessKeyId":{"existingSecret":{"key":"awsS3AccessKeyId","name":""},"value":""},"bucketName":"notes","host":"","port":443,"regionName":"","secretAccessKey":{"existingSecret":{"key":"awsS3SecretAccessKey","name":""},"value":""}}` | S3-compatible object store configuration shared by backend and frontend. Setting values here overrides the individual backend/frontend sub-chart values. |
| global.s3.accessKeyId | object | `{"existingSecret":{"key":"awsS3AccessKeyId","name":""},"value":""}` | S3 Access Key ID |
| global.s3.accessKeyId.existingSecret.key | string | `"awsS3AccessKeyId"` | Key inside the existing secret. |
| global.s3.accessKeyId.existingSecret.name | string | `""` | Name of an existing secret containing the Access Key ID; overrides value above. |
| global.s3.accessKeyId.value | string | `""` | Plain-text value; ignored when existingSecret.name is set. |
| global.s3.bucketName | string | `"notes"` | Bucket name. Must be identical between backend (AWS_STORAGE_BUCKET_NAME) and the frontend nginx media proxy — set it once here instead of in both sub-charts separately. |
| global.s3.host | string | `""` | Hostname of the S3-compatible endpoint (e.g. s3.eu-central-2.wasabisys.com). Used by the frontend nginx proxy (Host header + proxy_pass) and to derive AWS_S3_ENDPOINT_URL for the backend. |
| global.s3.port | int | `443` | Port of the S3-compatible endpoint. |
| global.s3.regionName | string | `""` | S3 region name (AWS_S3_REGION_NAME). |
| global.s3.secretAccessKey | object | `{"existingSecret":{"key":"awsS3SecretAccessKey","name":""},"value":""}` | S3 Secret Access Key |
| global.s3.secretAccessKey.existingSecret.key | string | `"awsS3SecretAccessKey"` | Key inside the existing secret. |
| global.s3.secretAccessKey.existingSecret.name | string | `""` | Name of an existing secret containing the Secret Access Key; overrides value above. |
| global.s3.secretAccessKey.value | string | `""` | Plain-text value; ignored when existingSecret.name is set. |
| global.tlsSecretName | string | `""` | TLS secret name |
| global.yProviderApiKey.existingSecret.key | string | `"yProviderApiKey"` | Key where Y Provider API key is stored |
| global.yProviderApiKey.existingSecret.name | string | `""` | Name of existing secret containing Y Provider API key, overrides provided value |
| global.yProviderApiKey.value | string | `""` | Value of Y Provider API key |
| backend.additionalAnnotations | object | `{}` | Additional custom annotations to add to all deployed objects. |
| backend.additionalLabels | object | `{}` | Additional custom labels to add to all deployed objects. |
| backend.affinity | object | `{}` | Affinity for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity Note: podAffinityPreset, podAntiAffinityPreset, and nodeAffinityPreset will be ignored when it's set. |
| backend.cleanup.deletePodsOnSuccess | bool | `false` | Whether to delete successfully run pods (e.g. jobs) |
| backend.configuration.ai.allowReachFrom | string | `""` | Allow AI requests from public, authenticated or restricted |
| backend.configuration.ai.apiKey.existingSecret.key | string | `"aiApiKey"` | Key where AI API Key is stored |
| backend.configuration.ai.apiKey.existingSecret.name | string | `nil` | Name of existing secret containing AI API key, overrules provided value |
| backend.configuration.ai.apiKey.value | string | `""` | Value of AI API Key |
| backend.configuration.ai.baseUrl | string | `""` | Base URL of AI |
| backend.configuration.ai.enabled | bool | `false` | Toggle AI feature |
| backend.configuration.ai.model | string | `""` | AI Model |
| backend.configuration.args | list | `[]` | Override default args |
| backend.configuration.collaboration.apiUrl | string | `""` | Collaboration API URL |
| backend.configuration.collaboration.wsUrl | string | `""` | Collaboration websocket URL |
| backend.configuration.command | list | `[]` | Override default command |
| backend.configuration.database.engine | string | `""` | Database engine, default django.db.backends.postgresql_psycopg2 |
| backend.configuration.database.host | string | `"localhost"` | Database hostname or ip address |
| backend.configuration.database.name | string | `"notes"` | Database name |
| backend.configuration.database.password.existingSecret.key | string | `"dbPassword"` | Key where database password is stored |
| backend.configuration.database.password.existingSecret.name | string | `nil` | Name of existing secret containing database password, overrules provided value |
| backend.configuration.database.password.value | string | `""` | Value of database password |
| backend.configuration.database.port | int | `5432` | Database port |
| backend.configuration.database.user.existingSecret.key | string | `"dbUser"` | Key where database user is stored |
| backend.configuration.database.user.existingSecret.name | string | `nil` | Name of existing secret with database user, overrules provided value |
| backend.configuration.database.user.value | string | `"dinum"` | Value of database user |
| backend.configuration.django.allowedHosts | string | `"*"` | List of strings representing the host/domain names that this Django site can serve |
| backend.configuration.django.configuration | string | `"Production"` | Django configuration |
| backend.configuration.django.csrfTrustedOrigins | string | `""` | List of trusted origins for unsafe requests (e.g. POST) |
| backend.configuration.django.secretKey.existingSecret.key | string | `"djangoSecretKey"` | Key where Django secret key is stored |
| backend.configuration.django.secretKey.existingSecret.name | string | `nil` | Name of existing secret containing Django secret key, overrules provided value |
| backend.configuration.django.secretKey.value | string | `""` | Value of Django secret key |
| backend.configuration.django.settingsModule | string | `"impress.settings"` | Django settings module |
| backend.configuration.django.siteDomain | string | `""` | Domain of this site, will default to global.fqdn |
| backend.configuration.django.siteName | string | `""` | Name of this site |
| backend.configuration.django.superuserEmail.existingSecret.key | string | `"djangoSuperuserEmail"` | Key where superuser email is stored |
| backend.configuration.django.superuserEmail.existingSecret.name | string | `nil` | Name of existing secret containing the superuser email, overrules provided value |
| backend.configuration.django.superuserEmail.value | string | `"admin@default"` | Email of superuser |
| backend.configuration.django.superuserPassword.existingSecret.key | string | `"djangoSuperuserPassword"` | Key where superuser password is stored |
| backend.configuration.django.superuserPassword.existingSecret.name | string | `nil` | Name of existing key containing superuser password, overrules provided value |
| backend.configuration.django.superuserPassword.value | string | `""` | Superuser password |
| backend.configuration.documentImageMaxSize | string | `nil` | Max size of images in bytes |
| backend.configuration.email.brandName | string | `""` | Email brand name |
| backend.configuration.email.from | string | `""` | From address |
| backend.configuration.email.host | string | `"postfix"` | SMTP relay server |
| backend.configuration.email.logoImage | string | `""` | Path to email logo |
| backend.configuration.email.password.existingSecret.key | string | `"djangoEmailHostPassword"` | Key where email password is stored |
| backend.configuration.email.password.existingSecret.name | string | `nil` | Name of existing secret containing the password of the user, overrules provided value |
| backend.configuration.email.password.value | string | `""` | Value of email user password |
| backend.configuration.email.port | int | `25` | SMTP relay port |
| backend.configuration.email.useSSL | string | `"False"` | Use SSL |
| backend.configuration.email.useTLS | string | `"False"` | Use TLS |
| backend.configuration.email.user.existingSecret.key | string | `"djangoEmailHostUser"` | Key where email user is stored |
| backend.configuration.email.user.existingSecret.name | string | `nil` | Name of existing secret containing the email user name, overrules provided value |
| backend.configuration.email.user.value | string | `""` | Value of email user to authenticate with |
| backend.configuration.frontendTheme | string | `""` | Name of the frontend theme |
| backend.configuration.init.createSuperuser.command | string | `"python manage.py createsuperuser --email \"${DJANGO_SUPERUSER_EMAIL}\" --password \"${DJANGO_SUPERUSER_PASSWORD}\"\n"` | Command to create a superuser, ${DJANGO_SUPERUSER_EMAIL} and ${DJANGO_SUPERUSER_PASSWORD} env vars need to be set |
| backend.configuration.init.createSuperuser.enabled | bool | `true` | Whether if a superuser should be created |
| backend.configuration.init.migrate.command | string | `"python manage.py migrate --no-input\n"` | Command for migrations |
| backend.configuration.init.migrate.enabled | bool | `true` | Whether to enable migration |
| backend.configuration.init.restartPolicy | string | `"Never"` | Init job restart policy |
| backend.configuration.mediaBaseUrl | string | `""` | Media Base URL |
| backend.configuration.oidc.allowDuplicateEmails | string | `"False"` | Whether to allow duplicate emails |
| backend.configuration.oidc.allowLogoutGetMethod | string | `"True"` | Allow logout request with `GET` |
| backend.configuration.oidc.authRequestExtraParams | string | `"{}"` | Auth Request extra parameters |
| backend.configuration.oidc.createUser | string | `"True"` | Whether to create User |
| backend.configuration.oidc.enabled | bool | `false` | Whether to enable OIDC |
| backend.configuration.oidc.essentialClaims | string | `"email"` | Essential claims |
| backend.configuration.oidc.fallbackToEmailForIdentification | string | `"True"` | Fallback to email for identification |
| backend.configuration.oidc.fullnameFields | string | `"first_name last_name"` | Fields to full name |
| backend.configuration.oidc.loginRedirectUrl | string | `""` | Redirect URL after login |
| backend.configuration.oidc.loginRedirectUrlFailure | string | `""` | Redirect URL on failure |
| backend.configuration.oidc.logoutRedirectUrl | string | `""` | Redirect URL after logout |
| backend.configuration.oidc.opAuthorizationEndpoint | string | `""` | Authorization endpoint |
| backend.configuration.oidc.opJWKSEndpoint | string | `""` | JWKS endpoint |
| backend.configuration.oidc.opLogoutEndpoint | string | `""` | Logout endpoint |
| backend.configuration.oidc.opTokenEndpoint | string | `""` | Token endpoint |
| backend.configuration.oidc.opUserEndpoint | string | `""` | User endpoint |
| backend.configuration.oidc.redirectAllowedHosts | string | `"[]"` | Allowed Hosts to redirect to |
| backend.configuration.oidc.redirectRequireHTTPS | string | `"False"` | Require HTTPS for redirects |
| backend.configuration.oidc.rpClientId.existingSecret.key | string | `"oidcRpClientId"` | Key where client ID is stored |
| backend.configuration.oidc.rpClientId.existingSecret.name | string | `nil` | Name of existing secret containing client ID, overrules provided value |
| backend.configuration.oidc.rpClientId.value | string | `"impress"` | Relying Party client ID |
| backend.configuration.oidc.rpClientSecret.existingSecret.key | string | `"oidcRpClientSecret"` | Key where client secret is stored |
| backend.configuration.oidc.rpClientSecret.existingSecret.name | string | `nil` | Name of existing secret containing client secret, overrules provided value |
| backend.configuration.oidc.rpClientSecret.value | string | `""` | Relying Party client secret |
| backend.configuration.oidc.rpScopes | string | `"openid email"` | Relying Party scopes |
| backend.configuration.oidc.rpSignAlgo | string | `"RS256"` | Relying Party signature algorithm, default `RS256` |
| backend.configuration.oidc.shortnameField | string | `"first_name"` | Field to short name |
| backend.configuration.oidc.storeIDToken | string | `"True"` | Whether to store ID token |
| backend.configuration.oidc.useNonce | string | `"True"` | Use Nonce |
| backend.configuration.redisUrl.existingSecret.key | string | `"redisUrl"` | Key where Redis URL is stored |
| backend.configuration.redisUrl.existingSecret.name | string | `nil` | Name of existing secret containing Redis URL, overrules provided value |
| backend.configuration.redisUrl.value | string | `""` | Value of Redis URL, e.g. redis://user:password@redis:6379/1 |
| backend.configuration.trashbinCutoffDays | string | `"30"` | Days after items in trash will be permamently deleted |
| backend.configuration.yProvider.apiBaseUrl | string | `""` | API Base URL |
| backend.containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Enable container privileged escalation. |
| backend.containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | Security capabilities for container. |
| backend.containerSecurityContext.enabled | bool | `true` | Enable security context. |
| backend.containerSecurityContext.privileged | bool | `false` | Run container in privileged mode |
| backend.containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Mounts the container's root filesystem as read-only. |
| backend.containerSecurityContext.runAsGroup | int | `1001` | Process group id. |
| backend.containerSecurityContext.runAsNonRoot | bool | `true` | Run container as a user. |
| backend.containerSecurityContext.runAsUser | int | `1001` | Process user id. |
| backend.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` | Disallow custom Seccomp profile by setting it to RuntimeDefault. |
| backend.extraEnvVars | list | `[]` | Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"  |
| backend.extraVolumeMounts | list | `[]` | Optionally specify an extra list of additional volumeMounts. |
| backend.extraVolumes | list | `[]` | Optionally specify an extra list of additional volumes. |
| backend.fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources. |
| backend.image.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. If the kubelet has a container image with that exact digest cached             locally, the kubelet uses its cached image; otherwise, the kubelet pulls the image with the resolved             digest, and uses that image to launch the container. "Never" => The kubelet does not try fetching the image. If the image is somehow already present locally, the            kubelet attempts to start the container; otherwise, startup fails.  |
| backend.image.registry | string | `""` | Container registry address. This setting has higher precedence than global.registry. |
| backend.image.repository | string | `"lasuite/impress-backend"` | Container repository string. |
| backend.image.tag | string | `"v3.3.0@sha256:64b070ba83df9af83c5e6163a1a309f6ec3ad8c5be31e1fbc8212379fccf6e6e"` | Define image tag. |
| backend.imagePullSecrets | list | `[]` | Credentials to fetch images from private registry. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| backend.ingress.annotations | object | `{}` | Define custom ingress annotations. annotations:   nginx.ingress.kubernetes.io/rewrite-target: / |
| backend.ingress.enabled | bool | `true` | Enable creation of Ingress. |
| backend.ingress.host | string | `""` | Define the Fully Qualified Domain Name (FQDN) where application should be reachable. |
| backend.ingress.ingressClassName | string | `"nginx"` | The Ingress controller class name. |
| backend.ingress.path | string | `"/api"` | Define the Ingress path. |
| backend.ingress.pathType | string | `"Prefix"` | Each path in an Ingress is required to have a corresponding path type. Paths that do not include an explicit pathType will fail validation. There are three supported path types:  "ImplementationSpecific" => With this path type, matching is up to the IngressClass. Implementations can treat this                             as a separate pathType or treat it identically to Prefix or Exact path types. "Exact" => Matches the URL path exactly and with case sensitivity. "Prefix" => Matches based on a URL path prefix split by /.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| backend.ingress.tls | object | `{"enabled":true,"secretName":""}` | Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| backend.ingress.tls.enabled | bool | `true` | Enable TLS/SSL/HTTPS for Ingress. |
| backend.ingress.tls.secretName | string | `""` | The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided. |
| backend.ingressAdmin.annotations | object | `{}` | Define custom ingress annotations. annotations:   nginx.ingress.kubernetes.io/rewrite-target: / |
| backend.ingressAdmin.enabled | bool | `false` | Enable creation of Ingress. |
| backend.ingressAdmin.host | string | `""` | Define the Fully Qualified Domain Name (FQDN) where application should be reachable. |
| backend.ingressAdmin.ingressClassName | string | `"nginx"` | The Ingress controller class name. |
| backend.ingressAdmin.path | string | `"/admin"` | Define the Ingress path. |
| backend.ingressAdmin.pathType | string | `"Prefix"` | Each path in an Ingress is required to have a corresponding path type. Paths that do not include an explicit pathType will fail validation. There are three supported path types:  "ImplementationSpecific" => With this path type, matching is up to the IngressClass. Implementations can treat this                             as a separate pathType or treat it identically to Prefix or Exact path types. "Exact" => Matches the URL path exactly and with case sensitivity. "Prefix" => Matches based on a URL path prefix split by /.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| backend.ingressAdmin.tls | object | `{"enabled":true,"secretName":""}` | Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| backend.ingressAdmin.tls.enabled | bool | `true` | Enable TLS/SSL/HTTPS for Ingress. |
| backend.ingressAdmin.tls.secretName | string | `""` | The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided. |
| backend.lifecycleHooks | object | `{}` | Lifecycle to automate configuration before or after startup. |
| backend.livenessProbe.enabled | bool | `true` | Enables kubernetes LivenessProbe. |
| backend.livenessProbe.failureThreshold | int | `10` | Number of failed executions until container is terminated. |
| backend.livenessProbe.initialDelaySeconds | int | `15` | Delay after container start until LivenessProbe is executed. |
| backend.livenessProbe.periodSeconds | int | `20` | Time between probe executions. |
| backend.livenessProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| backend.livenessProbe.timeoutSeconds | int | `5` | Timeout for command return. |
| backend.nameOverride | string | `""` | String to partially override release name. |
| backend.nodeSelector | object | `{}` | Node labels for pod assignment. Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| backend.pdb | object | `{"enabled":true,"maxUnavailable":null,"minAvailable":1}` | Pod disruption budget Ref.: https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| backend.pdb.enabled | bool | `true` | Whether PodDisruptionBudget for the backend should be enabled |
| backend.pdb.maxUnavailable | string | `nil` | How many pods can be unavailable at any given time |
| backend.pdb.minAvailable | int | `1` | How many pods need to be available at any given time |
| backend.podAnnotations | object | `{}` | Pod Annotations. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| backend.podAnnotationsCreateUser | object | `{}` | Pod Annotations for Create User Job. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| backend.podAnnotationsMigrate | object | `{}` | Pod Annotations for Migrate Job. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| backend.podLabels | object | `{}` | Pod Labels. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| backend.podSecurityContext.enabled | bool | `true` | Enable security context. |
| backend.podSecurityContext.fsGroup | int | `1000` | If specified, all processes of the container are also part of the supplementary group. |
| backend.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Change ownership and permission of the volume before being exposed inside a Pod. |
| backend.readinessProbe.enabled | bool | `true` | Enables kubernetes ReadinessProbe. |
| backend.readinessProbe.failureThreshold | int | `10` | Number of failed executions until container is terminated. |
| backend.readinessProbe.initialDelaySeconds | int | `15` | Delay after container start until ReadinessProbe is executed. |
| backend.readinessProbe.periodSeconds | int | `20` | Time between probe executions. |
| backend.readinessProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| backend.readinessProbe.timeoutSeconds | int | `5` | Timeout for command return. |
| backend.replicaCount | int | `1` | Set the amount of replicas of deployment. |
| backend.resources.limits.cpu | int | `1` | The max number of CPUs to consume. |
| backend.resources.limits.memory | string | `"1Gi"` | The max number of RAM to consume. |
| backend.resources.requests.cpu | string | `"100m"` | The number of CPUs which has to be available on the scheduled node. |
| backend.resources.requests.memory | string | `"512Mi"` | The number of RAM which has to be available on the scheduled node. |
| backend.service.annotations | object | `{}` | Additional custom annotations. |
| backend.service.enabled | bool | `true` | Enable kubernetes service creation. |
| backend.service.ports.http.containerPort | int | `8000` | Internal port. |
| backend.service.ports.http.port | int | `80` | Accessible port. |
| backend.service.ports.http.protocol | string | `"TCP"` | Service protocol. |
| backend.service.type | string | `"ClusterIP"` | Choose the kind of Service, one of "ClusterIP", "NodePort" or "LoadBalancer". |
| backend.serviceAccount.annotations | object | `{}` | Additional custom annotations for the ServiceAccount. |
| backend.serviceAccount.automountServiceAccountToken | bool | `false` | Allows auto mount of ServiceAccountToken on the serviceAccount created. Can be set to false if pods using this serviceAccount do not need to use K8s API. |
| backend.serviceAccount.create | bool | `true` | Enable creation of ServiceAccount for pod. |
| backend.serviceAccount.labels | object | `{}` | Additional custom labels for the ServiceAccount. |
| backend.startupProbe.enabled | bool | `true` | Enables kubernetes StartupProbe. |
| backend.startupProbe.failureThreshold | int | `10` | Number of failed executions until container is terminated. |
| backend.startupProbe.initialDelaySeconds | int | `15` | Delay after container start until StartupProbe is executed. |
| backend.startupProbe.periodSeconds | int | `20` | Time between probe executions. |
| backend.startupProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| backend.startupProbe.timeoutSeconds | int | `5` | Timeout for command return. |
| backend.terminationGracePeriodSeconds | string | `""` | In seconds, time the given to the pod needs to terminate gracefully. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| backend.tolerations | list | `[]` | Tolerations for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| backend.topologySpreadConstraints | list | `[]` | Topology spread constraints rely on node labels to identify the topology domain(s) that each Node is in. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/  topologySpreadConstraints:   - maxSkew: 1     topologyKey: failure-domain.beta.kubernetes.io/zone     whenUnsatisfiable: DoNotSchedule |
| backend.updateStrategy.type | string | `"RollingUpdate"` | Set to Recreate if you use persistent volume that cannot be mounted by more than one pods to make sure the pods are destroyed first. |
| frontend.additionalAnnotations | object | `{}` | Additional custom annotations to add to all deployed objects. |
| frontend.additionalLabels | object | `{}` | Additional custom labels to add to all deployed objects. |
| frontend.affinity | object | `{}` | Affinity for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity Note: podAffinityPreset, podAntiAffinityPreset, and nodeAffinityPreset will be ignored when it's set. |
| frontend.configuration.backendHost | string | `"impress-backend"` | Internal backend service hostname (Kubernetes service DNS name, e.g. "impress-backend") |
| frontend.configuration.backendPort | int | `80` | Internal backend service port |
| frontend.configuration.port | int | `8080` | Container port to listen on |
| frontend.configuration.webserver | object | `{"loglevel":"info","workerProcesses":"4"}` | Webserver specific configuration |
| frontend.configuration.webserver.loglevel | string | `"info"` | nginx loglevel  Ref.: https://docs.nginx.com/nginx/admin-guide/monitoring/logging/ |
| frontend.configuration.webserver.workerProcesses | string | `"4"` | Set nginx worker_processes. Setting it to "auto" will spawn one process per vCPU on the K8s node, this can be too much in most cases.  Ref.: https://nginx.org/en/docs/ngx_core_module.html#worker_processes |
| frontend.containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Enable container privileged escalation. |
| frontend.containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | Security capabilities for container. |
| frontend.containerSecurityContext.enabled | bool | `true` | Enable security context. |
| frontend.containerSecurityContext.privileged | bool | `false` | Run container in privileged mode |
| frontend.containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Mounts the container's root filesystem as read-only. |
| frontend.containerSecurityContext.runAsGroup | int | `1000` | Process group id. |
| frontend.containerSecurityContext.runAsNonRoot | bool | `true` | Run container as a user. |
| frontend.containerSecurityContext.runAsUser | int | `1000` | Process user id. |
| frontend.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` | Disallow custom Seccomp profile by setting it to RuntimeDefault. |
| frontend.extraEnvVars | list | `[]` | Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"  |
| frontend.extraVolumeMounts | list | `[]` | Optionally specify an extra list of additional volumeMounts. |
| frontend.extraVolumes | list | `[]` | Optionally specify an extra list of additional volumes. |
| frontend.fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources. |
| frontend.image.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. If the kubelet has a container image with that exact digest cached             locally, the kubelet uses its cached image; otherwise, the kubelet pulls the image with the resolved             digest, and uses that image to launch the container. "Never" => The kubelet does not try fetching the image. If the image is somehow already present locally, the            kubelet attempts to start the container; otherwise, startup fails.  |
| frontend.image.registry | string | `""` | Container registry address. This setting has higher precedence than global.registry. |
| frontend.image.repository | string | `"lasuite/impress-frontend"` | Container repository string. |
| frontend.image.tag | string | `"v3.3.0@sha256:bb885099bc867ea0a3febdf293542abb6d34474c53150313e1327f6a4c15060f"` | Define image tag. |
| frontend.imagePullSecrets | list | `[]` | Credentials to fetch images from private registry. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| frontend.ingress.annotations | object | `{}` | Define custom ingress annotations. annotations:   nginx.ingress.kubernetes.io/rewrite-target: / |
| frontend.ingress.enabled | bool | `true` | Enable creation of Ingress. |
| frontend.ingress.host | string | `""` | Define the Fully Qualified Domain Name (FQDN) where application should be reachable. |
| frontend.ingress.ingressClassName | string | `"nginx"` | The Ingress controller class name. |
| frontend.ingress.path | string | `"/"` | Define the Ingress path. |
| frontend.ingress.pathType | string | `"Prefix"` | Each path in an Ingress is required to have a corresponding path type. Paths that do not include an explicit pathType will fail validation. There are three supported path types:  "ImplementationSpecific" => With this path type, matching is up to the IngressClass. Implementations can treat this                             as a separate pathType or treat it identically to Prefix or Exact path types. "Exact" => Matches the URL path exactly and with case sensitivity. "Prefix" => Matches based on a URL path prefix split by /.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| frontend.ingress.tls | object | `{"enabled":true,"secretName":""}` | Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| frontend.ingress.tls.enabled | bool | `true` | Enable TLS/SSL/HTTPS for Ingress. |
| frontend.ingress.tls.secretName | string | `""` | The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided. |
| frontend.lifecycleHooks | object | `{}` | Lifecycle to automate configuration before or after startup. |
| frontend.nameOverride | string | `""` | String to partially override release name. |
| frontend.nodeSelector | object | `{}` | Node labels for pod assignment. Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| frontend.pdb | object | `{"enabled":true,"maxUnavailable":null,"minAvailable":1}` | Pod disruption budget Ref.: https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| frontend.pdb.enabled | bool | `true` | Whether PodDisruptionBudget for the frontend should be enabled |
| frontend.pdb.maxUnavailable | string | `nil` | How many pods can be unavailable at any given time |
| frontend.pdb.minAvailable | int | `1` | How many pods need to be available at any given time |
| frontend.podAnnotations | object | `{}` | Pod Annotations. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| frontend.podLabels | object | `{}` | Pod Labels. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| frontend.podSecurityContext.enabled | bool | `true` | Enable security context. |
| frontend.podSecurityContext.fsGroup | int | `1000` | If specified, all processes of the container are also part of the supplementary group. |
| frontend.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Change ownership and permission of the volume before being exposed inside a Pod. |
| frontend.probes.liveness.enabled | bool | `true` | Enable liveness probe. |
| frontend.probes.liveness.failureThreshold | int | `3` | Minimum consecutive failures for the probe to be considered failed. |
| frontend.probes.liveness.httpGet.path | string | `"/healthz"` | Path for the liveness probe. |
| frontend.probes.liveness.httpGet.port | string | `"http"` | Port name for the liveness probe. |
| frontend.probes.liveness.initialDelaySeconds | int | `10` | Number of seconds after the container has started before probes are initiated. |
| frontend.probes.liveness.periodSeconds | int | `10` | How often (in seconds) to perform the probe. |
| frontend.probes.liveness.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful. |
| frontend.probes.liveness.timeoutSeconds | int | `5` | Number of seconds after which the probe times out. |
| frontend.probes.readiness.enabled | bool | `true` | Enable readiness probe. |
| frontend.probes.readiness.failureThreshold | int | `3` | Minimum consecutive failures for the probe to be considered failed. |
| frontend.probes.readiness.httpGet.path | string | `"/healthz"` | Path for the readiness probe. |
| frontend.probes.readiness.httpGet.port | string | `"http"` | Port name for the readiness probe. |
| frontend.probes.readiness.initialDelaySeconds | int | `5` | Number of seconds after the container has started before probes are initiated. |
| frontend.probes.readiness.periodSeconds | int | `5` | How often (in seconds) to perform the probe. |
| frontend.probes.readiness.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful. |
| frontend.probes.readiness.timeoutSeconds | int | `3` | Number of seconds after which the probe times out. |
| frontend.probes.startup.enabled | bool | `true` | Enable startup probe. |
| frontend.probes.startup.failureThreshold | int | `6` | Minimum consecutive failures for the probe to be considered failed. Combined with periodSeconds, this gives the container 30s to start (6 * 5s). |
| frontend.probes.startup.httpGet.path | string | `"/healthz"` | Path for the startup probe. |
| frontend.probes.startup.httpGet.port | string | `"http"` | Port name for the startup probe. |
| frontend.probes.startup.periodSeconds | int | `5` | How often (in seconds) to perform the probe. |
| frontend.probes.startup.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful. |
| frontend.probes.startup.timeoutSeconds | int | `3` | Number of seconds after which the probe times out. |
| frontend.replicaCount | int | `1` | Set the amount of replicas of deployment. |
| frontend.resources.limits.cpu | int | `1` | The max number of CPUs to consume. |
| frontend.resources.limits.memory | string | `"1Gi"` | The max number of RAM to consume. |
| frontend.resources.requests.cpu | string | `"100m"` | The number of CPUs which has to be available on the scheduled node. |
| frontend.resources.requests.memory | string | `"512Mi"` | The number of RAM which has to be available on the scheduled node. |
| frontend.service.annotations | object | `{}` | Additional custom annotations. |
| frontend.service.enabled | bool | `true` | Enable kubernetes service creation. |
| frontend.service.ports.http.containerPort | int | `8080` | Internal port. |
| frontend.service.ports.http.port | int | `80` | Accessible port. |
| frontend.service.ports.http.protocol | string | `"TCP"` | Service protocol. |
| frontend.service.type | string | `"ClusterIP"` | Choose the kind of Service, one of "ClusterIP", "NodePort" or "LoadBalancer". |
| frontend.serviceAccount.annotations | object | `{}` | Additional custom annotations for the ServiceAccount. |
| frontend.serviceAccount.automountServiceAccountToken | bool | `false` | Allows auto mount of ServiceAccountToken on the serviceAccount created. Can be set to false if pods using this serviceAccount do not need to use K8s API. |
| frontend.serviceAccount.create | bool | `true` | Enable creation of ServiceAccount for pod. |
| frontend.serviceAccount.labels | object | `{}` | Additional custom labels for the ServiceAccount. |
| frontend.terminationGracePeriodSeconds | string | `""` | In seconds, time the given to the pod needs to terminate gracefully. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| frontend.tolerations | list | `[]` | Tolerations for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| frontend.topologySpreadConstraints | list | `[]` | Topology spread constraints rely on node labels to identify the topology domain(s) that each Node is in. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/  topologySpreadConstraints:   - maxSkew: 1     topologyKey: failure-domain.beta.kubernetes.io/zone     whenUnsatisfiable: DoNotSchedule |
| frontend.updateStrategy.type | string | `"RollingUpdate"` | Set to Recreate if you use persistent volume that cannot be mounted by more than one pods to make sure the pods are destroyed first. |
| y-provider.additionalAnnotations | object | `{}` | Additional custom annotations to add to all deployed objects. |
| y-provider.additionalLabels | object | `{}` | Additional custom labels to add to all deployed objects. |
| y-provider.affinity | object | `{}` | Affinity for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity Note: podAffinityPreset, podAntiAffinityPreset, and nodeAffinityPreset will be ignored when it's set. |
| y-provider.configuration.collaborationBackendBaseUrl | string | `""` | Collaboration Backend base URL, defaults to `https://<global.fqdn>` |
| y-provider.configuration.collaborationServerOrigin | string | `""` | Collaboration server origin, defaults to `https://<global.fqdn>` |
| y-provider.containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Enable container privileged escalation. |
| y-provider.containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | Security capabilities for container. |
| y-provider.containerSecurityContext.enabled | bool | `true` | Enable security context. |
| y-provider.containerSecurityContext.privileged | bool | `false` | Run container in privileged mode |
| y-provider.containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Mounts the container's root filesystem as read-only. |
| y-provider.containerSecurityContext.runAsGroup | int | `1001` | Process group id. |
| y-provider.containerSecurityContext.runAsNonRoot | bool | `true` | Run container as a user. |
| y-provider.containerSecurityContext.runAsUser | int | `1001` | Process user id. |
| y-provider.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` | Disallow custom Seccomp profile by setting it to RuntimeDefault. |
| y-provider.debug | bool | `false` | Enable debugging |
| y-provider.extraEnvVars | list | `[]` | Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"  |
| y-provider.extraVolumeMounts | list | `[]` | Optionally specify an extra list of additional volumeMounts. |
| y-provider.extraVolumes | list | `[]` | Optionally specify an extra list of additional volumes. |
| y-provider.fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources. |
| y-provider.image.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. If the kubelet has a container image with that exact digest cached             locally, the kubelet uses its cached image; otherwise, the kubelet pulls the image with the resolved             digest, and uses that image to launch the container. "Never" => The kubelet does not try fetching the image. If the image is somehow already present locally, the            kubelet attempts to start the container; otherwise, startup fails.  |
| y-provider.image.registry | string | `"docker.io"` | Container registry address. This setting has higher precedence than global.registry. |
| y-provider.image.repository | string | `"lasuite/impress-y-provider"` | Container repository string. |
| y-provider.image.tag | string | `"v2.4.0@sha256:329d47f5cda80941a7f0812969c3194ba68da3e7e1ef38e3d08c266fc97555c1"` | Define image tag. |
| y-provider.imagePullSecrets | list | `[]` | Credentials to fetch images from private registry. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| y-provider.ingressCollaborationApi.annotations | object | `{}` | Define custom ingress annotations. annotations:   nginx.ingress.kubernetes.io/rewrite-target: / |
| y-provider.ingressCollaborationApi.enabled | bool | `true` | Enable creation of Ingress. |
| y-provider.ingressCollaborationApi.host | string | `""` | Define the Fully Qualified Domain Name (FQDN) where application should be reachable. |
| y-provider.ingressCollaborationApi.ingressClassName | string | `"nginx"` | The Ingress controller class name. |
| y-provider.ingressCollaborationApi.path | string | `"/collaboration/api/"` | Define the Ingress path. |
| y-provider.ingressCollaborationApi.pathType | string | `"ImplementationSpecific"` | Each path in an Ingress is required to have a corresponding path type. Paths that do not include an explicit pathType will fail validation. There are three supported path types:  "ImplementationSpecific" => With this path type, matching is up to the IngressClass. Implementations can treat this                             as a separate pathType or treat it identically to Prefix or Exact path types. "Exact" => Matches the URL path exactly and with case sensitivity. "Prefix" => Matches based on a URL path prefix split by /.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| y-provider.ingressCollaborationApi.tls | object | `{"enabled":true,"secretName":""}` | Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| y-provider.ingressCollaborationApi.tls.enabled | bool | `true` | Enable TLS/SSL/HTTPS for Ingress. |
| y-provider.ingressCollaborationApi.tls.secretName | string | `""` | The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided. |
| y-provider.ingressCollaborationWs.annotations | object | `{}` | Define custom ingress annotations. annotations:   nginx.ingress.kubernetes.io/rewrite-target: / |
| y-provider.ingressCollaborationWs.defaultAnnotations | bool | `true` | Use default annotations for nginx, if set to false you probably need to specify your own annotations |
| y-provider.ingressCollaborationWs.enabled | bool | `true` | Enable creation of Ingress. |
| y-provider.ingressCollaborationWs.host | string | `""` | Define the Fully Qualified Domain Name (FQDN) where application should be reachable. |
| y-provider.ingressCollaborationWs.ingressClassName | string | `"nginx"` | The Ingress controller class name. |
| y-provider.ingressCollaborationWs.path | string | `"/collaboration/ws/"` | Define the Ingress path. |
| y-provider.ingressCollaborationWs.pathType | string | `"ImplementationSpecific"` | Each path in an Ingress is required to have a corresponding path type. Paths that do not include an explicit pathType will fail validation. There are three supported path types:  "ImplementationSpecific" => With this path type, matching is up to the IngressClass. Implementations can treat this                             as a separate pathType or treat it identically to Prefix or Exact path types. "Exact" => Matches the URL path exactly and with case sensitivity. "Prefix" => Matches based on a URL path prefix split by /.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| y-provider.ingressCollaborationWs.tls | object | `{"enabled":true,"secretName":""}` | Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| y-provider.ingressCollaborationWs.tls.enabled | bool | `true` | Enable TLS/SSL/HTTPS for Ingress. |
| y-provider.ingressCollaborationWs.tls.secretName | string | `""` | The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided. |
| y-provider.lifecycleHooks | object | `{}` | Lifecycle to automate configuration before or after startup. |
| y-provider.livenessProbe.enabled | bool | `true` | Enables kubernetes LivenessProbe. |
| y-provider.livenessProbe.failureThreshold | int | `3` | Number of failed executions until container is terminated. |
| y-provider.livenessProbe.initialDelaySeconds | int | `10` | Delay after container start until LivenessProbe is executed. |
| y-provider.livenessProbe.periodSeconds | int | `10` | Time between probe executions. |
| y-provider.livenessProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| y-provider.livenessProbe.timeoutSeconds | int | `1` | Timeout for command return. |
| y-provider.nameOverride | string | `""` | String to partially override release name. |
| y-provider.nodeSelector | object | `{}` | Node labels for pod assignment. Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| y-provider.pdb | object | `{"enabled":true,"maxUnavailable":null,"minAvailable":1}` | Pod disruption budget Ref.: https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| y-provider.pdb.enabled | bool | `true` | Whether PodDisruptionBudget for the Y-Provider should be enabled |
| y-provider.pdb.maxUnavailable | string | `nil` | How many pods can be unavailable at any given time |
| y-provider.pdb.minAvailable | int | `1` | How many pods need to be available at any given time |
| y-provider.podAnnotations | object | `{}` | Pod Annotations. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| y-provider.podLabels | object | `{}` | Pod Labels. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| y-provider.podSecurityContext.enabled | bool | `true` | Enable security context. |
| y-provider.podSecurityContext.fsGroup | int | `1001` | If specified, all processes of the container are also part of the supplementary group. |
| y-provider.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Change ownership and permission of the volume before being exposed inside a Pod. |
| y-provider.readinessProbe.enabled | bool | `true` | Enables kubernetes ReadinessProbe. |
| y-provider.readinessProbe.failureThreshold | int | `10` | Number of failed executions until container is terminated. |
| y-provider.readinessProbe.initialDelaySeconds | int | `15` | Delay after container start until ReadinessProbe is executed. |
| y-provider.readinessProbe.periodSeconds | int | `20` | Time between probe executions. |
| y-provider.readinessProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| y-provider.readinessProbe.timeoutSeconds | int | `5` | Timeout for command return. |
| y-provider.replicaCount | int | `1` | Set the amount of replicas of deployment. |
| y-provider.resources.limits.cpu | int | `1` | The max number of CPUs to consume. |
| y-provider.resources.limits.memory | string | `"1Gi"` | The max number of RAM to consume. |
| y-provider.resources.requests.cpu | string | `"100m"` | The number of CPUs which has to be available on the scheduled node. |
| y-provider.resources.requests.memory | string | `"512Mi"` | The number of RAM which has to be available on the scheduled node. |
| y-provider.service.annotations | object | `{}` | Additional custom annotations. |
| y-provider.service.enabled | bool | `true` | Enable kubernetes service creation. |
| y-provider.service.ports.http.containerPort | int | `4444` | Internal port. |
| y-provider.service.ports.http.port | int | `443` | Accessible port. |
| y-provider.service.ports.http.protocol | string | `"TCP"` | Service protocol. |
| y-provider.service.type | string | `"ClusterIP"` | Choose the kind of Service, one of "ClusterIP", "NodePort" or "LoadBalancer". |
| y-provider.serviceAccount.annotations | object | `{}` | Additional custom annotations for the ServiceAccount. |
| y-provider.serviceAccount.automountServiceAccountToken | bool | `false` | Allows auto mount of ServiceAccountToken on the serviceAccount created. Can be set to false if pods using this serviceAccount do not need to use K8s API. |
| y-provider.serviceAccount.create | bool | `true` | Enable creation of ServiceAccount for pod. |
| y-provider.serviceAccount.labels | object | `{}` | Additional custom labels for the ServiceAccount. |
| y-provider.startupProbe.enabled | bool | `true` | Enables kubernetes StartupProbe. |
| y-provider.startupProbe.failureThreshold | int | `10` | Number of failed executions until container is terminated. |
| y-provider.startupProbe.initialDelaySeconds | int | `15` | Delay after container start until StartupProbe is executed. |
| y-provider.startupProbe.periodSeconds | int | `20` | Time between probe executions. |
| y-provider.startupProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| y-provider.startupProbe.timeoutSeconds | int | `5` | Timeout for command return. |
| y-provider.terminationGracePeriodSeconds | string | `""` | In seconds, time the given to the pod needs to terminate gracefully. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| y-provider.tolerations | list | `[]` | Tolerations for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| y-provider.topologySpreadConstraints | list | `[]` | Topology spread constraints rely on node labels to identify the topology domain(s) that each Node is in. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/  topologySpreadConstraints:   - maxSkew: 1     topologyKey: failure-domain.beta.kubernetes.io/zone     whenUnsatisfiable: DoNotSchedule |
| y-provider.updateStrategy.type | string | `"RollingUpdate"` | Set to Recreate if you use persistent volume that cannot be mounted by more than one pods to make sure the pods are destroyed first. |

## Uninstalling the Chart

To uninstall the release with name `my-release`:

```bash
helm uninstall my-release
```

## Signing

Helm charts are signed with helm native signing method.

You can verify the chart against [the public GPG key](../../files/gpg-pubkeys/opendesk.gpg).

## License

This project uses the following license: Apache-2.0

## Copyright

Copyright (C) 2025 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
