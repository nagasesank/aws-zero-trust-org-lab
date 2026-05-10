resource "aws_organizations_organization" "org" {
  feature_set = "ALL"

  lifecycle {
    ignore_changes = [
      enabled_policy_types
    ]
  }
}

# =========================
# TOP LEVEL OUs
# =========================

resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = aws_organizations_organization.org.roots[0].id
}

# =========================
# SECURITY CHILD OUs
# =========================

resource "aws_organizations_organizational_unit" "logarchive" {
  name      = "LogArchive"
  parent_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_organizational_unit" "audit" {
  name      = "Audit"
  parent_id = aws_organizations_organizational_unit.security.id
}

# =========================
# WORKLOAD CHILD OUs
# =========================

resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_organizational_unit" "dev" {
  name      = "Dev"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

# =========================
# OUTPUTS
# =========================

output "organization_id" {
  value = aws_organizations_organization.org.id
}

output "root_id" {
  value = aws_organizations_organization.org.roots[0].id
}

output "security_ou_id" {
  value = aws_organizations_organizational_unit.security.id
}

output "workloads_ou_id" {
  value = aws_organizations_organizational_unit.workloads.id
}

output "logarchive_ou_id" {
  value = aws_organizations_organizational_unit.logarchive.id
}

output "audit_ou_id" {
  value = aws_organizations_organizational_unit.audit.id
}

output "prod_ou_id" {
  value = aws_organizations_organizational_unit.prod.id
}

output "dev_ou_id" {
  value = aws_organizations_organizational_unit.dev.id
}