# Terraform GCP VPC Modular Structure

This repository provides a modular Terraform setup for managing GCP VPCs across multiple environments (dev, stage, prod) using GitOps principles.

## Structure

```
modules/
  vpc/         # Reusable VPC module
    main.tf
    variables.tf
    outputs.tf
envs/
  dev/         # Dev environment
    main.tf
  stage/       # Stage environment
    main.tf
  prod/        # Prod environment
    main.tf
```

## Usage

1. **Configure your environment:**
   - Set your GCP project ID and region in the respective `main.tf` files under `envs/`.
   - Optionally, use a `.tfvars` file or environment variables for secrets.

2. **Initialize and apply:**
   ```sh
   cd envs/dev   # or stage/prod
   terraform init
   terraform plan -var="project_id=YOUR_PROJECT_ID"
   terraform apply -var="project_id=YOUR_PROJECT_ID"
   ```

3. **GitOps Workflow:**
   - Make changes via pull requests.
   - Use CI/CD to run `terraform plan` and `terraform apply` on merge.

## Remote State (Recommended)

To enable remote state, add a `backend` block to each environment's `main.tf`:

```
terraform {
  backend "gcs" {
    bucket  = "YOUR_TF_STATE_BUCKET"
    prefix  = "envs/dev"
  }
}
```

## Authentication

- Use a GCP service account with the necessary IAM roles.
- Authenticate via `GOOGLE_APPLICATION_CREDENTIALS` environment variable or workload identity.

---

Feel free to extend the module and environments as needed!
