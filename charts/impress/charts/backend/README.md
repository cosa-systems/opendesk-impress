<!--
SPDX-FileCopyrightText: 2025 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
-->
# backend

A Helm chart for deploying the Impress backend services

## Installing the Chart

To install the chart with the release name `my-release`, you have two options:

### Install via Repository
```console
helm repo add opendesk-impress https://gitlab.opencode.de/api/v4/projects/5478/packages/helm/stable
helm install my-release --version 1.1.1 opendesk-impress/backend
```

### Install via OCI Registry
```console
helm repo add opendesk-impress oci://registry.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress
helm install my-release --version 1.1.1 opendesk-impress/backend
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | ^2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalAnnotations | object | `{}` | Additional custom annotations to add to all deployed objects. |
| additionalLabels | object | `{}` | Additional custom labels to add to all deployed objects. |
| affinity | object | `{}` | Affinity for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity Note: podAffinityPreset, podAntiAffinityPreset, and nodeAffinityPreset will be ignored when it's set. |
| cleanup.deletePodsOnSuccess | bool | `false` | Whether to delete successfully run pods (e.g. jobs) |
| configuration.ai.allowReachFrom | string | `""` | Allow AI requests from public, authenticated or restricted |
| configuration.ai.apiKey.existingSecret.key | string | `"aiApiKey"` | Key where AI API Key is stored |
| configuration.ai.apiKey.existingSecret.name | string | `nil` | Name of existing secret containing AI API key, overrules provided value |
| configuration.ai.apiKey.value | string | `""` | Value of AI API Key |
| configuration.ai.baseUrl | string | `""` | Base URL of AI |
| configuration.ai.model | string | `""` | AI Model |
| configuration.args | list | `[]` | Override default args |
| configuration.collaboration.apiUrl | string | `""` | Collaboration API URL |
| configuration.collaboration.wsUrl | string | `""` | Collaboration websocket URL |
| configuration.command | list | `[]` | Override default command |
| configuration.database.engine | string | `""` | Database engine, default django.db.backends.postgresql_psycopg2 |
| configuration.database.host | string | `"localhost"` | Database hostname or ip address |
| configuration.database.name | string | `"notes"` | Database name |
| configuration.database.password.existingSecret.key | string | `"dbPassword"` | Key where database password is stored |
| configuration.database.password.existingSecret.name | string | `nil` | Name of existing secret containing database password, overrules provided value |
| configuration.database.password.value | string | `""` | Value of database password |
| configuration.database.port | int | `5432` | Database port |
| configuration.database.user.existingSecret.key | string | `"dbUser"` | Key where database user is stored |
| configuration.database.user.existingSecret.name | string | `nil` | Name of existing secret with database user, overrules provided value |
| configuration.database.user.value | string | `"dinum"` | Value of database user |
| configuration.django.allowedHosts | string | `"*"` | List of strings representing the host/domain names that this Django site can serve |
| configuration.django.configuration | string | `"Production"` | Django configuration |
| configuration.django.csrfTrustedOrigins | string | `""` | List of trusted origins for unsafe requests (e.g. POST) |
| configuration.django.secretKey.existingSecret.key | string | `"djangoSecretKey"` | Key where Django secret key is stored |
| configuration.django.secretKey.existingSecret.name | string | `nil` | Name of existing secret containing Django secret key, overrules provided value |
| configuration.django.secretKey.value | string | `""` | Value of Django secret key |
| configuration.django.settingsModule | string | `"impress.settings"` | Django settings module |
| configuration.django.siteDomain | string | `""` | Domain of this site, will default to global.fqdn |
| configuration.django.siteName | string | `""` | Name of this site |
| configuration.django.superuserEmail.existingSecret.key | string | `"djangoSuperuserEmail"` | Key where superuser email is stored |
| configuration.django.superuserEmail.existingSecret.name | string | `nil` | Name of existing secret containing the superuser email, overrules provided value |
| configuration.django.superuserEmail.value | string | `"admin@default"` | Email of superuser |
| configuration.django.superuserPassword.existingSecret.key | string | `"djangoSuperuserPassword"` | Key where superuser password is stored |
| configuration.django.superuserPassword.existingSecret.name | string | `nil` | Name of existing key containing superuser password, overrules provided value |
| configuration.django.superuserPassword.value | string | `""` | Superuser password |
| configuration.documentImageMaxSize | string | `nil` | Max size of images in bytes |
| configuration.email.brandName | string | `""` | Email brand name |
| configuration.email.from | string | `""` | From address |
| configuration.email.host | string | `"postfix"` | SMTP relay server |
| configuration.email.logoImage | string | `""` | Path to email logo |
| configuration.email.password.existingSecret.key | string | `"djangoEmailHostPassword"` | Key where email password is stored |
| configuration.email.password.existingSecret.name | string | `nil` | Name of existing secret containing the password of the user, overrules provided value |
| configuration.email.password.value | string | `""` | Value of email user password |
| configuration.email.port | int | `25` | SMTP relay port |
| configuration.email.useSSL | string | `"False"` | Use SSL |
| configuration.email.useTLS | string | `"False"` | Use TLS |
| configuration.email.user.existingSecret.key | string | `"djangoEmailHostUser"` | Key where email user is stored |
| configuration.email.user.existingSecret.name | string | `nil` | Name of existing secret containing the email user name, overrules provided value |
| configuration.email.user.value | string | `""` | Value of email user to authenticate with |
| configuration.frontendTheme | string | `""` | Name of the frontend theme |
| configuration.init.createSuperuser.command | string | `"python manage.py createsuperuser --email \"${DJANGO_SUPERUSER_EMAIL}\" --password \"${DJANGO_SUPERUSER_PASSWORD}\"\n"` | Command to create a superuser, ${DJANGO_SUPERUSER_EMAIL} and ${DJANGO_SUPERUSER_PASSWORD} env vars need to be set |
| configuration.init.createSuperuser.enabled | bool | `true` | Whether if a superuser should be created |
| configuration.init.migrate.command | string | `"python manage.py migrate --no-input\n"` | Command for migrations |
| configuration.init.migrate.enabled | bool | `true` | Whether to enable migration |
| configuration.init.restartPolicy | string | `"Never"` | Init job restart policy |
| configuration.mediaBaseUrl | string | `""` | Media Base URL |
| configuration.oidc.allowDuplicateEmails | string | `"False"` | Whether to allow duplicate emails |
| configuration.oidc.allowLogoutGetMethod | string | `"True"` | Allow logout request with `GET` |
| configuration.oidc.authRequestExtraParams | string | `"{}"` | Auth Request extra parameters |
| configuration.oidc.createUser | string | `"True"` | Whether to create User |
| configuration.oidc.enabled | bool | `false` | Whether to enable OIDC |
| configuration.oidc.essentialClaims | string | `"email"` | Essential claims |
| configuration.oidc.fallbackToEmailForIdentification | string | `"True"` | Fallback to email for identification |
| configuration.oidc.fullnameFields | string | `"first_name last_name"` | Fields to full name |
| configuration.oidc.loginRedirectUrl | string | `""` | Redirect URL after login |
| configuration.oidc.loginRedirectUrlFailure | string | `""` | Redirect URL on failure |
| configuration.oidc.logoutRedirectUrl | string | `""` | Redirect URL after logout |
| configuration.oidc.opAuthorizationEndpoint | string | `""` | Authorization endpoint |
| configuration.oidc.opJWKSEndpoint | string | `""` | JWKS endpoint |
| configuration.oidc.opLogoutEndpoint | string | `""` | Logout endpoint |
| configuration.oidc.opTokenEndpoint | string | `""` | Token endpoint |
| configuration.oidc.opUserEndpoint | string | `""` | User endpoint |
| configuration.oidc.redirectAllowedHosts | string | `"[]"` | Allowed Hosts to redirect to |
| configuration.oidc.redirectRequireHTTPS | string | `"False"` | Require HTTPS for redirects |
| configuration.oidc.rpClientId.existingSecret.key | string | `"oidcRpClientId"` | Key where client ID is stored |
| configuration.oidc.rpClientId.existingSecret.name | string | `nil` | Name of existing secret containing client ID, overrules provided value |
| configuration.oidc.rpClientId.value | string | `"impress"` | Relying Party client ID |
| configuration.oidc.rpClientSecret.existingSecret.key | string | `"oidcRpClientSecret"` | Key where client secret is stored |
| configuration.oidc.rpClientSecret.existingSecret.name | string | `nil` | Name of existing secret containing client secret, overrules provided value |
| configuration.oidc.rpClientSecret.value | string | `""` | Relying Party client secret |
| configuration.oidc.rpScopes | string | `"openid email"` | Relying Party scopes |
| configuration.oidc.rpSignAlgo | string | `"RS256"` | Relying Party signature algorithm, default `RS256` |
| configuration.oidc.shortnameField | string | `"first_name"` | Field to short name |
| configuration.oidc.storeIDToken | string | `"True"` | Whether to store ID token |
| configuration.oidc.useNonce | string | `"True"` | Use Nonce |
| configuration.redisUrl.existingSecret.key | string | `"redisUrl"` | Key where Redis URL is stored |
| configuration.redisUrl.existingSecret.name | string | `nil` | Name of existing secret containing Redis URL, overrules provided value |
| configuration.redisUrl.value | string | `""` | Value of Redis URL, e.g. redis://user:password@redis:6379/1 |
| configuration.trashbinCutoffDays | string | `"30"` | Days after items in trash will be permamently deleted |
| configuration.yProvider.apiBaseUrl | string | `""` | API Base URL |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Enable container privileged escalation. |
| containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | Security capabilities for container. |
| containerSecurityContext.enabled | bool | `true` | Enable security context. |
| containerSecurityContext.privileged | bool | `false` | Run container in privileged mode |
| containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Mounts the container's root filesystem as read-only. |
| containerSecurityContext.runAsGroup | int | `1001` | Process group id. |
| containerSecurityContext.runAsNonRoot | bool | `true` | Run container as a user. |
| containerSecurityContext.runAsUser | int | `1001` | Process user id. |
| containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` | Disallow custom Seccomp profile by setting it to RuntimeDefault. |
| extraEnvVars | list | `[]` | Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"  |
| extraVolumeMounts | list | `[]` | Optionally specify an extra list of additional volumeMounts. |
| extraVolumes | list | `[]` | Optionally specify an extra list of additional volumes. |
| fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources. |
| image.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. If the kubelet has a container image with that exact digest cached             locally, the kubelet uses its cached image; otherwise, the kubelet pulls the image with the resolved             digest, and uses that image to launch the container. "Never" => The kubelet does not try fetching the image. If the image is somehow already present locally, the            kubelet attempts to start the container; otherwise, startup fails.  |
| image.registry | string | `""` | Container registry address. This setting has higher precedence than global.registry. |
| image.repository | string | `"lasuite/impress-backend"` | Container repository string. |
| image.tag | string | `"v3.3.0@sha256:64b070ba83df9af83c5e6163a1a309f6ec3ad8c5be31e1fbc8212379fccf6e6e"` | Define image tag. |
| imagePullSecrets | list | `[]` | Credentials to fetch images from private registry. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| ingress.annotations | object | `{}` | Define custom ingress annotations. annotations:   nginx.ingress.kubernetes.io/rewrite-target: / |
| ingress.enabled | bool | `true` | Enable creation of Ingress. |
| ingress.host | string | `""` | Define the Fully Qualified Domain Name (FQDN) where application should be reachable. |
| ingress.ingressClassName | string | `"nginx"` | The Ingress controller class name. |
| ingress.path | string | `"/api"` | Define the Ingress path. |
| ingress.pathType | string | `"Prefix"` | Each path in an Ingress is required to have a corresponding path type. Paths that do not include an explicit pathType will fail validation. There are three supported path types:  "ImplementationSpecific" => With this path type, matching is up to the IngressClass. Implementations can treat this                             as a separate pathType or treat it identically to Prefix or Exact path types. "Exact" => Matches the URL path exactly and with case sensitivity. "Prefix" => Matches based on a URL path prefix split by /.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| ingress.tls | object | `{"enabled":true,"secretName":""}` | Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| ingress.tls.enabled | bool | `true` | Enable TLS/SSL/HTTPS for Ingress. |
| ingress.tls.secretName | string | `""` | The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided. |
| ingressAdmin.annotations | object | `{}` | Define custom ingress annotations. annotations:   nginx.ingress.kubernetes.io/rewrite-target: / |
| ingressAdmin.enabled | bool | `false` | Enable creation of Ingress. |
| ingressAdmin.host | string | `""` | Define the Fully Qualified Domain Name (FQDN) where application should be reachable. |
| ingressAdmin.ingressClassName | string | `"nginx"` | The Ingress controller class name. |
| ingressAdmin.path | string | `"/admin"` | Define the Ingress path. |
| ingressAdmin.pathType | string | `"Prefix"` | Each path in an Ingress is required to have a corresponding path type. Paths that do not include an explicit pathType will fail validation. There are three supported path types:  "ImplementationSpecific" => With this path type, matching is up to the IngressClass. Implementations can treat this                             as a separate pathType or treat it identically to Prefix or Exact path types. "Exact" => Matches the URL path exactly and with case sensitivity. "Prefix" => Matches based on a URL path prefix split by /.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| ingressAdmin.tls | object | `{"enabled":true,"secretName":""}` | Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| ingressAdmin.tls.enabled | bool | `true` | Enable TLS/SSL/HTTPS for Ingress. |
| ingressAdmin.tls.secretName | string | `""` | The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided. |
| lifecycleHooks | object | `{}` | Lifecycle to automate configuration before or after startup. |
| livenessProbe.enabled | bool | `true` | Enables kubernetes LivenessProbe. |
| livenessProbe.failureThreshold | int | `10` | Number of failed executions until container is terminated. |
| livenessProbe.initialDelaySeconds | int | `15` | Delay after container start until LivenessProbe is executed. |
| livenessProbe.periodSeconds | int | `20` | Time between probe executions. |
| livenessProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| livenessProbe.timeoutSeconds | int | `5` | Timeout for command return. |
| nameOverride | string | `""` | String to partially override release name. |
| nodeSelector | object | `{}` | Node labels for pod assignment. Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| pdb | object | `{"enabled":true,"maxUnavailable":null,"minAvailable":1}` | Pod disruption budget Ref.: https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| pdb.enabled | bool | `true` | Whether PodDisruptionBudget for the backend should be enabled |
| pdb.maxUnavailable | string | `nil` | How many pods can be unavailable at any given time |
| pdb.minAvailable | int | `1` | How many pods need to be available at any given time |
| podAnnotations | object | `{}` | Pod Annotations. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podAnnotationsCreateUser | object | `{}` | Pod Annotations for Create User Job. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podAnnotationsMigrate | object | `{}` | Pod Annotations for Migrate Job. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podLabels | object | `{}` | Pod Labels. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| podSecurityContext.enabled | bool | `true` | Enable security context. |
| podSecurityContext.fsGroup | int | `1000` | If specified, all processes of the container are also part of the supplementary group. |
| podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Change ownership and permission of the volume before being exposed inside a Pod. |
| readinessProbe.enabled | bool | `true` | Enables kubernetes ReadinessProbe. |
| readinessProbe.failureThreshold | int | `10` | Number of failed executions until container is terminated. |
| readinessProbe.initialDelaySeconds | int | `15` | Delay after container start until ReadinessProbe is executed. |
| readinessProbe.periodSeconds | int | `20` | Time between probe executions. |
| readinessProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| readinessProbe.timeoutSeconds | int | `5` | Timeout for command return. |
| replicaCount | int | `1` | Set the amount of replicas of deployment. |
| resources.limits.cpu | int | `1` | The max number of CPUs to consume. |
| resources.limits.memory | string | `"1Gi"` | The max number of RAM to consume. |
| resources.requests.cpu | string | `"100m"` | The number of CPUs which has to be available on the scheduled node. |
| resources.requests.memory | string | `"512Mi"` | The number of RAM which has to be available on the scheduled node. |
| service.annotations | object | `{}` | Additional custom annotations. |
| service.enabled | bool | `true` | Enable kubernetes service creation. |
| service.ports.http.containerPort | int | `8000` | Internal port. |
| service.ports.http.port | int | `80` | Accessible port. |
| service.ports.http.protocol | string | `"TCP"` | Service protocol. |
| service.type | string | `"ClusterIP"` | Choose the kind of Service, one of "ClusterIP", "NodePort" or "LoadBalancer". |
| serviceAccount.annotations | object | `{}` | Additional custom annotations for the ServiceAccount. |
| serviceAccount.automountServiceAccountToken | bool | `false` | Allows auto mount of ServiceAccountToken on the serviceAccount created. Can be set to false if pods using this serviceAccount do not need to use K8s API. |
| serviceAccount.create | bool | `true` | Enable creation of ServiceAccount for pod. |
| serviceAccount.labels | object | `{}` | Additional custom labels for the ServiceAccount. |
| startupProbe.enabled | bool | `true` | Enables kubernetes StartupProbe. |
| startupProbe.failureThreshold | int | `10` | Number of failed executions until container is terminated. |
| startupProbe.initialDelaySeconds | int | `15` | Delay after container start until StartupProbe is executed. |
| startupProbe.periodSeconds | int | `20` | Time between probe executions. |
| startupProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| startupProbe.timeoutSeconds | int | `5` | Timeout for command return. |
| terminationGracePeriodSeconds | string | `""` | In seconds, time the given to the pod needs to terminate gracefully. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| tolerations | list | `[]` | Tolerations for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| topologySpreadConstraints | list | `[]` | Topology spread constraints rely on node labels to identify the topology domain(s) that each Node is in. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/  topologySpreadConstraints:   - maxSkew: 1     topologyKey: failure-domain.beta.kubernetes.io/zone     whenUnsatisfiable: DoNotSchedule |
| updateStrategy.type | string | `"RollingUpdate"` | Set to Recreate if you use persistent volume that cannot be mounted by more than one pods to make sure the pods are destroyed first. |

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
