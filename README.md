# Terraform S3 Static Website

This project provisions an Amazon S3 bucket configured to host a static website using Terraform.

## Project Structure

```
terraform-s3-static-website
├── modules
│   └── s3_bucket
│       ├── main.tf          # Main configuration for the S3 bucket
│       ├── variables.tf     # Input variables for the S3 bucket module
│       └── outputs.tf       # Outputs for the S3 bucket module
├── main.tf                  # Entry point for the Terraform configuration
├── variables.tf             # Input variables for the root module
├── outputs.tf               # Outputs for the root module
├── provider.tf              # Provider configuration for AWS
└── README.md                # Project documentation
```

## Requirements

- Terraform 0.12 or later
- AWS account with permissions to create S3 buckets

## Setup Instructions

1. **Clone the repository**:
   ```
   git clone <repository-url>
   cd terraform-s3-static-website
   ```

2. **Configure AWS credentials**:
   Ensure your AWS credentials are configured. You can set them up using the AWS CLI or by creating a `~/.aws/credentials` file.

3. **Modify variables**:
   Update the `variables.tf` file in the root directory to set your desired AWS region and any other configurations.

4. **Initialize Terraform**:
   Run the following command to initialize the Terraform project:
   ```
   terraform init
   ```

5. **Plan the deployment**:
   Generate an execution plan with:
   ```
   terraform plan
   ```

6. **Apply the configuration**:
   Deploy the S3 bucket by running:
   ```
   terraform apply
   ```

7. **Access your static website**:
   After the deployment is complete, you can access your static website using the URL provided in the outputs.

## Cleanup

To remove the resources created by this project, run:
```
terraform destroy
``` 

This will delete the S3 bucket and any associated resources.

## Preventing Large File Errors

**Important:**  
Do **not** commit the `.terraform` directory or any provider binaries to your repository.  
Add a `.gitignore` file with the following content to avoid this error:

```
.terraform/
*.tfstate
*.tfstate.*
crash.log
*.log
*.backup
*.exe
```

If you have already committed large files, remove them from git history using [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) or `git filter-branch`.  
See [GitHub's documentation](https://docs.github.com/en/repositories/working-with-files/managing-large-files/removing-files-from-a-repositorys-history) for details.