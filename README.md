# pipeline-examples

Reference consumer pipelines that demonstrate how to call the shared dispatcher (`wesley-trust/pipeline-dispatcher`) which, in turn, extends `wesley-trust/pipeline-common`.

## Purpose
- Provide copy-ready starter pipelines and settings files for each supported technology (Terraform, Bicep, PowerShell, Pester, combined scenarios).
- Illustrate how to compose the `configuration` object and runtime parameters expected by the dispatcher and common templates.
- Supply lightweight IaC/test assets used by the sample pipelines.

## Layout
- `examples/consumer/*.pipeline.yml` – top-level pipeline definitions exposing runtime parameters and triggers.
- `examples/consumer/*.settings.yml` – companion files that declare the dispatcher resource and pass the `configuration` object.
- `examples/consumer/vars/` – sample variable layering aligned with `templates/variables/include.yml` in `pipeline-common`.
- `examples/assets/` – Terraform/Bicep code, scripts, and empty test scaffolding referenced by the sample pipelines.

## Getting Started
1. Copy the relevant `*.pipeline.yml` and `*.settings.yml` pair into your consumer repository.
2. Update resource names (service connections, repositories, variable groups, action groups) to match your environment.
3. Optional: duplicate the assets folder structure if you need seed IaC/test content.
4. Keep the dispatcher/pipeline-common versions in sync with your organisation’s release process.

## Related Repositories
- `wesley-trust/pipeline-common` – shared templates, steps, and documentation.
- `wesley-trust/pipeline-dispatcher` – dispatcher template that references `pipeline-common`.
