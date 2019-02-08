Import-Module "$PSScriptRoot\..\azure.databricks.cicd.tools.psm1" -Force

$BearerToken = "dapi097e322750f9648e47de4f87ae81b8cc"  # Create this file in the Tests folder with just your bearer token in
$Region = "westus"
$ScopeName = "Testscope_creation"
$SecretName = "databrickstestsec"
$SecretValue = "testdatabricksvalue"


Describe "Set-DatabricksSecret" {
    It "Simple test value" {
        Set-DatabricksSecret -BearerToken $BearerToken -Region $Region -ScopeName $ScopeName -SecretName $SecretName -SecretValue $SecretValue  -Verbose
    }
}
