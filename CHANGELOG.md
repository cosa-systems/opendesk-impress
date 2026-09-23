# [1.3.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.2.0...v1.3.0) (2026-09-23)


### Bug Fixes

* **backend:** Read the database password from its existingSecret ([99ba72c](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/99ba72c8ebd518af565f809868d83e0ae8fa51bd))


### Features

* **backend:** Configure Redis from its parts ([89bd470](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/89bd47053b2579a2fc82fd0ba5fcbfba3259dad7))

# [1.2.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.1.4...v1.2.0) (2026-09-22)


### Bug Fixes

* Ensure global.fqdn is set ([5566e0c](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/5566e0c94657b6d4d120f8dfd6052e6f13cdaf73))
* Set `readOnlyRootFilesystem` for docspec ([9a30e95](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/9a30e9536204c903ea957a944153501530435e62))
* Set missing pipe ([1c82bd5](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/1c82bd5cbbb125d38562f625b16825d3aa0ca407))
* **worker:** Complete probes ([488b11a](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/488b11a22dfa8557ae6367ff9d04f12c4ff0718b))


### Features

* **backend:** Deploy a Celery worker ([d9af5ab](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/d9af5ab127472d03c51ced48131b0b5bfb60b8a3))
* **chart:** Update to Docs v5.4.1 and deploy docSpec ([7a1f536](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/7a1f53620e1dafb70f81cdf43d0d81b9ce72e6e2))
* Upgrade from v5.4.1 to v5.6.1 ([2b41369](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/2b4136936c7bc38393d65890938a5ad8dbae3be7))

## [1.1.4](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.1.3...v1.1.4) (2026-09-22)


### Bug Fixes

* **ci:** Migrate to new pipeline template ([80795c2](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/80795c2d1b7d93dfdf19e4019f45561cad3a92df))

## [1.1.3](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.1.2...v1.1.3) (2026-06-24)


### Bug Fixes

* **init:** Ensure jobs stops on failure ([55044c8](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/55044c8badfae2335ca123d3627f0862e55957c9))

## [1.1.2](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.1.1...v1.1.2) (2026-05-12)


### Bug Fixes

* **backend:** Add AI feature toggle ([d31c850](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/d31c8501248f622896d1bd3ea41ac3fcd277b14c))

## [1.1.1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.1.0...v1.1.1) (2026-03-19)


### Bug Fixes

* Non default bucket names and s3 config consolidation ([4f705a8](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/4f705a87d056d630daa23c789b3d22a6479195cc))

# [1.1.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.0.5...v1.1.0) (2026-03-10)


### Bug Fixes

* Remove global sections from sub charts ([56fc824](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/56fc824971f1dd3f3ea1fe8407a8e09a4e796692))
* Review feedback, streamline mounts, add nginx.conf ([574a8a4](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/574a8a4baf45f8209424d9ff252289487c35fbd1))
* Set default nginx loglevel to info ([39b4974](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/39b4974e867331b08c34db738ce64e535b0882ec))
* Template configmap directly ([2e25a82](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/2e25a82aafb4bf6c40d67f1f3620eb2d0f18d5d4))


### Features

* Add nginx mediagateway ([729c3f3](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/729c3f3c954be74ef8742f0e3e568031976989fd))
* Media proxy within the frontend nginx ([e761bbe](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/e761bbe97ea11793b0f3d4315fe302e9c31ee5ea))

## [1.0.5](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.0.4...v1.0.5) (2026-02-24)


### Bug Fixes

* **frontend:** Remove unused variables ([2aa98b6](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/2aa98b6a88a9c114a39c0ddc4f2ebf18fc3fad7a))

## [1.0.4](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.0.3...v1.0.4) (2026-01-14)


### Bug Fixes

* Bump copyright headers ([57c80a4](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/57c80a40c58c55396cdb6e5f8d38797b5b5bc8a3))

## [1.0.3](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.0.2...v1.0.3) (2026-01-13)


### Bug Fixes

* **backend:** Add Helm annotations to job to ensure it reruns for executing migrations ([0c2bf49](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/0c2bf4995bb1e13e59e90a9d897c17761748fec5))
* **ci:** Update to gitlab-config 2.5.1 incl. subchart support ([e5522f8](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/e5522f820145a3771044cb44d9dbd79da8336f8d))

## [1.0.2](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.0.1...v1.0.2) (2025-09-02)


### Bug Fixes

* **impress:** Fix default schema for publicApiOrigin ([4d02a2e](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/4d02a2e964c7d10f19f3bd468d4113bbbfe09872))

## [1.0.1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/compare/v1.0.0...v1.0.1) (2025-08-07)


### Bug Fixes

* **impress:** Fix pdb matchLabels ([a732bab](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/a732babd001693516b2c4ddb9f30bd9411e360bf))

# 1.0.0 (2025-07-07)


### Features

* Initial commit ([d0adb5e](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/d0adb5ec0600a56becad7d8f8bcbaa06a59098e1))

# 1.0.0 (2025-06-26)


### Features

* Initial commit ([856a808](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-impress/commit/856a808f0b397a7c2da114bcd2a9e5d9973fffbb))
