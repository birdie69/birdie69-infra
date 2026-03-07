# birdie69-infra

> Terraform infrastructure as code for **birdie69** on Azure, following the Brick → Blueprint → Env pattern.

**Status:** Scaffold pending (Day 4)

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

See [ADR-004: Infra Container Apps](https://github.com/learn-claude/birdie69-docs/blob/main/adrs/ADR-004-infra-container-apps.md)

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

## Jira

[B69 Project](https://narwhal.atlassian.net/projects/B69) — Ticket: B69-5, B69-20
