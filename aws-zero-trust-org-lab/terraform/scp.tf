resource "aws_organizations_policy" "deny_cloudtrail" {
  name        = "DenyCloudTrailTampering"
  description = "Prevents CloudTrail logging tampering"
  type        = "SERVICE_CONTROL_POLICY"

  content = file("${path.module}/policies/deny-cloudtrail.json")
}

resource "aws_organizations_policy_attachment" "attach_deny_cloudtrail" {
  policy_id = aws_organizations_policy.deny_cloudtrail.id

  # Attach to workloads OU
  target_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_policy" "deny_region" {
  name        = "DenyOutsideMumbai"
  description = "Restricts actions outside ap-south-1"
  type        = "SERVICE_CONTROL_POLICY"

  content = file("${path.module}/policies/deny-region.json")
}

resource "aws_organizations_policy_attachment" "attach_deny_region" {
  policy_id = aws_organizations_policy.deny_region.id

  # Attached to ROOT for testing
  target_id = aws_organizations_organization.org.roots[0].id
}