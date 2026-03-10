# birdie69-infra

> Terraform infrastructure as code for **birdie69** on Azure, following the Brick → Blueprint → Env pattern.

**Status:** Scaffold complete (Day 4 — B69-5)

---

## Overview

All Azure resources are managed via Terraform. No manual resource creation.

## Structure

```
birdie69-infra/
├── bricks/              # Reusable Terraform modules
│   ├── container_app/
│   ├── postgres/
│   ├── redis/
│   ├── key_vault/
│   ├── blob_storage/
│   └── container_registry/
├── blueprints/
│   └── app/             # Full birdie69 stack composition
└── envs/
    ├── dev/             # Development environment
    ├── staging/         # Staging environment
    └── prod/            # Production environment
```

## Architecture

See [ADR-004: Infra Container Apps](https://github.com/birdie69/birdie69-docs/blob/main/adrs/ADR-004-infra-container-apps.md)

## Prerequisites

- Terraform >= 1.6
- Azure CLI (authenticated)
- Azure subscription

## Usage

```bash
cd envs/dev
terraform init
terraform plan
terraform apply
```

To validate without a backend (e.g. in CI or before first apply):

```bash
cd envs/dev
terraform init -backend=false
terraform validate
```

### Injecting the PostgreSQL admin password

The default placeholder meets Azure complexity so `terraform apply` can run, but **do not use it in production**. Override with a real secret at apply time:

- **Environment variable:** `export TF_VAR_postgres_admin_password='YourSecurePassword1!'` (then run `terraform apply`)
- **CI/CD:** Set `TF_VAR_postgres_admin_password` as a secret in GitHub Actions (or your pipeline) and run apply in that job.

Never commit the real password to the repo.

## Jira

[B69 Project](https://narwhal.atlassian.net/projects/B69) — Ticket: B69-5
