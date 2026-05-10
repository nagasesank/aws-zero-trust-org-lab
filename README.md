# AWS Multi-Account Zero-Trust Architecture Lab

## Overview

This project demonstrates the design, implementation, validation, and teardown of a secure multi-account AWS landing zone using:

- AWS Organizations
- Service Control Policies (SCPs)
- Centralized CloudTrail logging
- Blast-radius isolation
- Cross-account access control
- GuardDuty delegated administration
- Terraform Infrastructure as Code
- AWS CLI validation testing

The objective is to engineer and validate a Zero-Trust multi-account architecture while proving enforcement behavior through real attack simulations, preventive controls, audit logging, and Terraform drift detection.

---

# Architecture

## Organizational Structure

```text
Root
 ├── Security OU
 │    ├── Security Account
 │    └── Log Archive Account
 │
 └── Workloads OU
      ├── Prod Account
      └── Dev Account
```

---

# Core Security Objectives

| Objective | Implementation |
|---|---|
| Blast Radius Isolation | Multi-account segmentation |
| Preventive Governance | SCP enforcement |
| Centralized Audit Logging | Organization CloudTrail |
| Explicit Trust Model | Cross-account IAM roles |
| Least Privilege | Permission boundaries |
| Drift Detection | Terraform reconciliation |
| Security Monitoring | GuardDuty delegation |

---

# Technology Stack

| Category | Services / Tools |
|---|---|
| Cloud Platform | AWS |
| Governance | AWS Organizations |
| Security Controls | SCPs, IAM, Permission Boundaries |
| Logging | CloudTrail, S3 |
| Detection | GuardDuty |
| IaC | Terraform |
| Validation | AWS CLI |
| Verification | AWS Console |

---

# Repository Structure

```text
aws-zero-trust-org-lab/
│
├── README.md
│
├── architecture/
│   ├── diagrams/
│   └── screenshots/
│
├── terraform/
│   ├── providers.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── organizations.tf
│   ├── cloudtrail.tf
│   ├── scp.tf
│   ├── iam.tf
│   ├── guardduty.tf
│   ├── outputs.tf
│   │
│   └── policies/
│       ├── deny-cloudtrail.json
│       └── deny-region.json
│
├── validation/
│   ├── cli-tests.md
│   ├── failure-tests.md
│   ├── drift-tests.md
│   └── test-matrix.md
│
└── evidence/
    ├── terraform-apply/
    ├── gui-verification/
    ├── failures/
    ├── cloudtrail/
    └── terraform-destroy/
```

---

# Security Controls Implemented

## Service Control Policies (SCPs)

### Deny CloudTrail Tampering
Prevents:
- cloudtrail:StopLogging
- cloudtrail:DeleteTrail

### Region Restriction Policy
Restricts resource deployment outside approved AWS regions.

---

# Validation Methodology

The environment is validated using:

1. Terraform deployment output
2. AWS Console verification
3. AWS CLI attack simulation
4. CloudTrail audit evidence
5. Terraform drift detection

---

# Attack Simulations

| Test Case | Expected Result |
|---|---|
| Stop CloudTrail logging | Denied |
| Delete CloudTrail trail | Denied |
| Launch EC2 outside approved region | Denied |
| Launch EC2 inside approved region | Allowed |
| Unauthorized cross-account AssumeRole | Denied |
| Authorized Security AssumeRole | Allowed |

---

# Terraform Lifecycle

## Initialize

```bash
terraform init
```

## Validate

```bash
terraform validate
```

## Plan

```bash
terraform plan
```

## Apply

```bash
terraform apply
```

## Destroy

```bash
terraform destroy
```

---

# Evidence Collection

This repository contains evidence for:

- Terraform deployment
- SCP enforcement
- AWS Console verification
- CloudTrail audit logs
- Drift detection
- Failure simulations
- Environment teardown

---

# Key Engineering Concepts Demonstrated

- Zero-Trust architecture
- Multi-account governance
- SCP enforcement hierarchy
- Preventive vs detective controls
- Blast-radius reduction
- Infrastructure drift management
- Centralized security visibility
- Infrastructure as Code governance

---

# Future Enhancements

- AWS Control Tower comparison
- Advanced SCP enforcement
- S3 public access prevention
- IAM privilege escalation testing
- Security Hub aggregation
- CI/CD Terraform pipeline
- OPA / Checkov policy validation

---

# Disclaimer

This project is intended for security engineering, governance validation, and educational purposes within controlled AWS environments.
