<!--
SPDX-FileCopyrightText: 2025 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
-->
# frontend

A Helm chart for deploying the Impress frontend services

## Installing the Chart

To install the chart with the release name `my-release`, you have two options:

### Install via Repository
```console
helm repo add opendesk-impress https://gitlab.opencode.de/api/v4/projects/5478/packages/helm/stable
helm install my-release --version 1.1.1 opendesk-impress/frontend
```

### Install via OCI Registry
```console
helm repo add opendesk-impress oci://registry.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress
helm install my-release --version 1.1.1 opendesk-impress/frontend
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
| configuration.backendHost | string | `"impress-backend"` | Internal backend service hostname (Kubernetes service DNS name, e.g. "impress-backend") |
| configuration.backendPort | int | `80` | Internal backend service port |
| configuration.port | int | `8080` | Container port to listen on |
| configuration.webserver | object | `{"loglevel":"info","workerProcesses":"4"}` | Webserver specific configuration |
| configuration.webserver.loglevel | string | `"info"` | nginx loglevel  Ref.: https://docs.nginx.com/nginx/admin-guide/monitoring/logging/ |
| configuration.webserver.workerProcesses | string | `"4"` | Set nginx worker_processes. Setting it to "auto" will spawn one process per vCPU on the K8s node, this can be too much in most cases.  Ref.: https://nginx.org/en/docs/ngx_core_module.html#worker_processes |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Enable container privileged escalation. |
| containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | Security capabilities for container. |
| containerSecurityContext.enabled | bool | `true` | Enable security context. |
| containerSecurityContext.privileged | bool | `false` | Run container in privileged mode |
| containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Mounts the container's root filesystem as read-only. |
| containerSecurityContext.runAsGroup | int | `1000` | Process group id. |
| containerSecurityContext.runAsNonRoot | bool | `true` | Run container as a user. |
| containerSecurityContext.runAsUser | int | `1000` | Process user id. |
| containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` | Disallow custom Seccomp profile by setting it to RuntimeDefault. |
| extraEnvVars | list | `[]` | Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"  |
| extraVolumeMounts | list | `[]` | Optionally specify an extra list of additional volumeMounts. |
| extraVolumes | list | `[]` | Optionally specify an extra list of additional volumes. |
| fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources. |
| image.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. If the kubelet has a container image with that exact digest cached             locally, the kubelet uses its cached image; otherwise, the kubelet pulls the image with the resolved             digest, and uses that image to launch the container. "Never" => The kubelet does not try fetching the image. If the image is somehow already present locally, the            kubelet attempts to start the container; otherwise, startup fails.  |
| image.registry | string | `""` | Container registry address. This setting has higher precedence than global.registry. |
| image.repository | string | `"lasuite/impress-frontend"` | Container repository string. |
| image.tag | string | `"v3.3.0@sha256:bb885099bc867ea0a3febdf293542abb6d34474c53150313e1327f6a4c15060f"` | Define image tag. |
| imagePullSecrets | list | `[]` | Credentials to fetch images from private registry. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| ingress.annotations | object | `{}` | Define custom ingress annotations. annotations:   nginx.ingress.kubernetes.io/rewrite-target: / |
| ingress.enabled | bool | `true` | Enable creation of Ingress. |
| ingress.host | string | `""` | Define the Fully Qualified Domain Name (FQDN) where application should be reachable. |
| ingress.ingressClassName | string | `"nginx"` | The Ingress controller class name. |
| ingress.path | string | `"/"` | Define the Ingress path. |
| ingress.pathType | string | `"Prefix"` | Each path in an Ingress is required to have a corresponding path type. Paths that do not include an explicit pathType will fail validation. There are three supported path types:  "ImplementationSpecific" => With this path type, matching is up to the IngressClass. Implementations can treat this                             as a separate pathType or treat it identically to Prefix or Exact path types. "Exact" => Matches the URL path exactly and with case sensitivity. "Prefix" => Matches based on a URL path prefix split by /.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| ingress.tls | object | `{"enabled":true,"secretName":""}` | Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| ingress.tls.enabled | bool | `true` | Enable TLS/SSL/HTTPS for Ingress. |
| ingress.tls.secretName | string | `""` | The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided. |
| lifecycleHooks | object | `{}` | Lifecycle to automate configuration before or after startup. |
| nameOverride | string | `""` | String to partially override release name. |
| nodeSelector | object | `{}` | Node labels for pod assignment. Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| pdb | object | `{"enabled":true,"maxUnavailable":null,"minAvailable":1}` | Pod disruption budget Ref.: https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| pdb.enabled | bool | `true` | Whether PodDisruptionBudget for the frontend should be enabled |
| pdb.maxUnavailable | string | `nil` | How many pods can be unavailable at any given time |
| pdb.minAvailable | int | `1` | How many pods need to be available at any given time |
| podAnnotations | object | `{}` | Pod Annotations. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podLabels | object | `{}` | Pod Labels. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| podSecurityContext.enabled | bool | `true` | Enable security context. |
| podSecurityContext.fsGroup | int | `1000` | If specified, all processes of the container are also part of the supplementary group. |
| podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Change ownership and permission of the volume before being exposed inside a Pod. |
| probes.liveness.enabled | bool | `true` | Enable liveness probe. |
| probes.liveness.failureThreshold | int | `3` | Minimum consecutive failures for the probe to be considered failed. |
| probes.liveness.httpGet.path | string | `"/healthz"` | Path for the liveness probe. |
| probes.liveness.httpGet.port | string | `"http"` | Port name for the liveness probe. |
| probes.liveness.initialDelaySeconds | int | `10` | Number of seconds after the container has started before probes are initiated. |
| probes.liveness.periodSeconds | int | `10` | How often (in seconds) to perform the probe. |
| probes.liveness.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful. |
| probes.liveness.timeoutSeconds | int | `5` | Number of seconds after which the probe times out. |
| probes.readiness.enabled | bool | `true` | Enable readiness probe. |
| probes.readiness.failureThreshold | int | `3` | Minimum consecutive failures for the probe to be considered failed. |
| probes.readiness.httpGet.path | string | `"/healthz"` | Path for the readiness probe. |
| probes.readiness.httpGet.port | string | `"http"` | Port name for the readiness probe. |
| probes.readiness.initialDelaySeconds | int | `5` | Number of seconds after the container has started before probes are initiated. |
| probes.readiness.periodSeconds | int | `5` | How often (in seconds) to perform the probe. |
| probes.readiness.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful. |
| probes.readiness.timeoutSeconds | int | `3` | Number of seconds after which the probe times out. |
| probes.startup.enabled | bool | `true` | Enable startup probe. |
| probes.startup.failureThreshold | int | `6` | Minimum consecutive failures for the probe to be considered failed. Combined with periodSeconds, this gives the container 30s to start (6 * 5s). |
| probes.startup.httpGet.path | string | `"/healthz"` | Path for the startup probe. |
| probes.startup.httpGet.port | string | `"http"` | Port name for the startup probe. |
| probes.startup.periodSeconds | int | `5` | How often (in seconds) to perform the probe. |
| probes.startup.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful. |
| probes.startup.timeoutSeconds | int | `3` | Number of seconds after which the probe times out. |
| replicaCount | int | `1` | Set the amount of replicas of deployment. |
| resources.limits.cpu | int | `1` | The max number of CPUs to consume. |
| resources.limits.memory | string | `"1Gi"` | The max number of RAM to consume. |
| resources.requests.cpu | string | `"100m"` | The number of CPUs which has to be available on the scheduled node. |
| resources.requests.memory | string | `"512Mi"` | The number of RAM which has to be available on the scheduled node. |
| service.annotations | object | `{}` | Additional custom annotations. |
| service.enabled | bool | `true` | Enable kubernetes service creation. |
| service.ports.http.containerPort | int | `8080` | Internal port. |
| service.ports.http.port | int | `80` | Accessible port. |
| service.ports.http.protocol | string | `"TCP"` | Service protocol. |
| service.type | string | `"ClusterIP"` | Choose the kind of Service, one of "ClusterIP", "NodePort" or "LoadBalancer". |
| serviceAccount.annotations | object | `{}` | Additional custom annotations for the ServiceAccount. |
| serviceAccount.automountServiceAccountToken | bool | `false` | Allows auto mount of ServiceAccountToken on the serviceAccount created. Can be set to false if pods using this serviceAccount do not need to use K8s API. |
| serviceAccount.create | bool | `true` | Enable creation of ServiceAccount for pod. |
| serviceAccount.labels | object | `{}` | Additional custom labels for the ServiceAccount. |
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
