package tests

import (
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// TestSmoke_s3 runs the smoke fixture for s3 using the tfvars file in the fixture directory.
func TestSmoke_s3(t *testing.T) {
	t.Parallel()

	fixtureDir := filepath.Join("..", "tests", "fixtures", "smoke")
	terraformOptions := &terraform.Options{
		TerraformDir: fixtureDir,
		// Terraform will automatically pick up any *.tfvars file in the directory
		// If you want to explicitly specify one, uncomment the line below:
		// VarFiles: []string{"smoke.auto.tfvars"},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
