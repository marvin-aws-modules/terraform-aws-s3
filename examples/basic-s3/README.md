
# 🧪 Example: basic-s3

This example shows how to deploy a simple s3 module using the \$exampleName\ module.

## 🚀 Usage

```bash
terraform init
terraform apply
```

## ⚙️ Required Variables

Defined in ``terraform.tfvars``:

```hcl
name                  = "basic-s3"
bucket_name = "<your-value>"
default_tags = "<your-value>"
enable_bucket_policy = "<your-value>"
enable_versioning = "<your-value>"
kms_key_id = "<your-value>"
logging_target_bucket = "<your-value>"
sse_algorithm = "<your-value>"
```

## 📚 Full Documentation

See [s3 readme](../../README.md) for all inputs, outputs, and configuration options.
