Import-Module "$PSScriptRoot\..\azure.databricks.cicd.tools.psm1" -Force
$BearerToken = "dapi30a0cadc441633bf539aa4925bbaf34d" # Create this file in the Tests folder with just your bearer token in
$Region = "Central US" 

#TODO - Create dummy cluster
$ClusterId = "0103-085624-rick134"

Describe "Get-DatabricksLibraries" {
    It "Simple fetch" {
        $json = Get-DatabricksLibraries -BearerToken $BearerToken -Region $Region -ClusterId $ClusterId
        $json.Count | Should -BeGreaterThan 0
    }
}

