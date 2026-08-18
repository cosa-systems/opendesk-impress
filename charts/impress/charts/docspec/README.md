<!--
SPDX-FileCopyrightText: 2026 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-License-Identifier: Apache-2.0
-->
# docspec

A Helm chart for deploying the docSpec conversion service used by Impress

## Installing the Chart

To install the chart with the release name `my-release`, you have two options:

### Install via Repository
```console
helm repo add opendesk-impress https://gitlab.opencode.de/api/v4/projects/5478/packages/helm/stable
helm install my-release --version 1.1.3 opendesk-impress/docspec
```

### Install via OCI Registry
```console
helm repo add opendesk-impress oci://registry.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress
helm install my-release --version 1.1.3 opendesk-impress/docspec
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
| affinity | object | `{}` | Affinity for pod assignment. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity |
| configuration.healthPath | string | `"/health"` | HTTP path used by the container probes. |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Enable container privileged escalation. |
| containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | Security capabilities for container. |
| containerSecurityContext.enabled | bool | `true` | Enable security context. |
| containerSecurityContext.privileged | bool | `false` | Run container in privileged mode |
| containerSecurityContext.readOnlyRootFilesystem | bool | `false` | Mounts the container's root filesystem as read-only. Left writable: the OTP release writes its runtime state below the release directory, not only to /tmp. Flip to true once that is verified upstream. |
| containerSecurityContext.runAsGroup | int | `1000` | Process group id. |
| containerSecurityContext.runAsNonRoot | bool | `true` | Run container as a user. |
| containerSecurityContext.runAsUser | int | `1000` | Process user id. The upstream image ships an Elixir/OTP release running as uid 1000. |
| containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` | Disallow custom Seccomp profile by setting it to RuntimeDefault. |
| debug | bool | `false` | Enable debugging |
| enabled | bool | `true` | Deploy the docSpec conversion service. Required for DOCX import; without it the DOCX -> BlockNote conversion leg has nowhere to run and Word uploads fail. |
| extraEnvVars | list | `[]` | Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"  |
| extraVolumeMounts | list | `[]` | Optionally specify an extra list of additional volumeMounts. |
| extraVolumes | list | `[]` | Optionally specify an extra list of additional volumes. |
| fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources. |
| image.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. "Never" => The kubelet does not try fetching the image.  |
| image.registry | string | `"ghcr.io"` | Container registry address. This setting has higher precedence than global.registry. docSpec is published on the GitHub container registry, not on Docker Hub. |
| image.repository | string | `"docspecio/api"` | Container repository string. |
| image.tag | string | `"3.0.1@sha256:0b9effae9045cee5ebda80280c8bc5a075b5e368d741309f98aec0ff259a802d"` | Define image tag. |
| imagePullSecrets | list | `[]` | Credentials to fetch images from private registry. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| lifecycleHooks | object | `{}` | Lifecycle to automate configuration before or after startup. |
| livenessProbe.enabled | bool | `true` | Enables kubernetes LivenessProbe. |
| livenessProbe.failureThreshold | int | `3` | Number of failed executions until container is terminated. |
| livenessProbe.initialDelaySeconds | int | `10` | Delay after container start until LivenessProbe is executed. |
| livenessProbe.periodSeconds | int | `10` | Time between probe executions. |
| livenessProbe.successThreshold | int | `1` | Number of successful executions after failed ones until container is marked healthy. |
| livenessProbe.timeoutSeconds | int | `1` | Timeout for command return. |
| nameOverride | string | `""` | String to partially override release name. |
| nodeSelector | object | `{}` | Node labels for pod assignment. Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| pdb | object | `{"enabled":true,"maxUnavailable":null,"minAvailable":1}` | Pod disruption budget Ref.: https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| pdb.enabled | bool | `true` | Whether PodDisruptionBudget for the docSpec should be enabled |
| pdb.maxUnavailable | string | `nil` | How many pods can be unavailable at any given time |
| pdb.minAvailable | int | `1` | How many pods need to be available at any given time |
| podAnnotations | object | `{}` | Pod Annotations. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
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
| resources.requests.memory | string | `"256Mi"` | The number of RAM which has to be available on the scheduled node. |
| service.annotations | object | `{}` | Additional custom annotations. |
| service.enabled | bool | `true` | Enable kubernetes service creation. |
| service.ports.http.containerPort | int | `4000` | Internal port. |
| service.ports.http.port | int | `80` | Accessible port. |
| service.ports.http.protocol | string | `"TCP"` | Service protocol. |
| service.type | string | `"ClusterIP"` | Choose the kind of Service, one of "ClusterIP", "NodePort" or "LoadBalancer". docSpec is only ever called by the backend from inside the cluster. |
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
| topologySpreadConstraints | list | `[]` | Topology spread constraints rely on node labels to identify the topology domain(s) that each Node is in. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/ |
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

Copyright (C) 2026 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
