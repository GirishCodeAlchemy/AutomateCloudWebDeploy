package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/k8s"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestKubernetesResources(t *testing.T) {
	t.Parallel()

	// Path to the Terraform directory
	terraformDir := "../terraform/"

	// Set up Terraform options with random suffix to avoid conflicts
	configmapName := "test-configmap"
	deploymentName := "test-deployment"
	serviceName := "test-service"
	ingressName := "test-ingress"
	TestNamespace := "candidate-f"
	dnsName := "terratest.test-subaccount-1-v02.test-subaccount-1.rr.mu"
	kubeConfig := os.Getenv("KUBECONFIG")

	kubeConfigContent, err := os.ReadFile(kubeConfig)
	if err != nil {
		t.Fatalf("Error reading kubeconfig file: %v", err)
	}

	// Convert kubeconfig content to string
	kubeConfigContentString := string(kubeConfigContent)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		Vars: map[string]interface{}{
			"configmap_name":      configmapName,
			"deployment_name":     deploymentName,
			"service_name":        serviceName,
			"ingress_name":        ingressName,
			"dns_name":            dnsName,
			"KUBE_CONFIG_CONTENT": kubeConfigContentString,
		},
	}

	// Destroy Terraform resources at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// Deploy Terraform resources
	terraform.InitAndApply(t, terraformOptions)

	kubectlOptions := k8s.NewKubectlOptions("", kubeConfig, TestNamespace)

	// Verify that the ConfigMap resource exists
	configmap := k8s.GetConfigMap(t, kubectlOptions, configmapName)
	fmt.Println(configmap)
	assert.NotNil(t, configmap)

	// Verify that the Deployment resource exists
	deployment := k8s.GetDeployment(t, kubectlOptions, deploymentName)
	assert.NotNil(t, deployment)

	// Verify that the Service resource exists
	service := k8s.GetService(t, kubectlOptions, serviceName)
	assert.NotNil(t, service)

	// Verify that the Ingress resource exists
	ingress := k8s.GetIngress(t, kubectlOptions, ingressName)
	assert.NotNil(t, ingress)
}
