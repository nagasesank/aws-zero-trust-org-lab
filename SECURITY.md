# Security Policy

Do not commit credentials, private keys, local environment files, Terraform state, Terraform plans, AWS account contact data, or unredacted cloud-console evidence containing sensitive identifiers.

Use synthetic or redacted evidence for documentation. If a credential or sensitive identifier is exposed, rotate credentials where applicable, remove the current-tree artifact, and purge sensitive Git history when required.

Automated secret scanning runs on pushes and pull requests.
