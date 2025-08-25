# General Helm Charts

[![Release Helm Charts](https://github.com/ethpandaops/general-helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/ethpandaops/general-helm-charts/actions/workflows/release.yaml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/general-helm-charts)](https://artifacthub.io/packages/search?repo=general-helm-charts)

A collection of generic [Helm](https://helm.sh/) charts used and managed by the EthPandaOps team. We have a separate repository for our [ethereum specific helm charts](https://github.com/ethpandaops/ethereum-helm-charts).

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```sh
helm repo add ethpandaops-general-helm-charts https://ethpandaops.github.io/general-helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run the following command to see the charts.

```sh
helm search repo ethpandaops-general-helm-charts
```

## List of charts

- [`asynqmon`](charts/asynqmon)
- [`cbt`](charts/cbt)
- [`cloudflare-tunnel`](charts/cloudflare-tunnel)
- [`chproxy`](charts/chproxy)
- [`panda-pulse`](charts/panda-pulse)
- [`raw-configmap`](charts/raw-configmap)

## Development

### Prerequisites

- [`pre-commit`](https://pre-commit.com/) - Used to setup pre-commit git hooks
- [`docker`](https://www.docker.com/) - Used by many Makefile targets

### Pre-commit hooks

This repository used [`pre-commit`](https://pre-commit.com/) to manage and run certain git hooks. Hook definitions can be found within the [`.pre-commit-config.yaml`](.pre-commit-config.yaml) file.

Run the following to add the hooks to your local repository:

```sh
make init
```

### Useful commands

The `README` for every chart is auto generated using [helm-docs](https://github.com/norwoodj/helm-docs). This is defined as a pre-commit hook. If you want to run it manually, you can run:

```sh
make docs
```

The [CT (Chart Testing)](https://github.com/helm/chart-testing) tool is used to lint and validate charts. You can run this via:

```sh
make lint
```

## License

[MIT License](LICENSE)
