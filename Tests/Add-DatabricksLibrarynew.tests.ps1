Import-Module "$PSScriptRoot\..\azure.databricks.cicd.tools.psm1" -Force

$BearerToken = "dapid868cb026259cb66d86122a1fb7f0f40"  # Create this file in the Tests folder with just your bearer token in
$Region = "westus"
Set-Location $PSScriptRoot

$ClusterId = "0131-120540-stow780"

Describe "Add-DatabricksLibrary" {
    BeforeAll{
        $cluster = Get-DatabricksClusters -BearerToken $BearerToken -Region $Region
        $state = ($cluster | Where-Object {$_.cluster_id -eq $ClusterId }).state
        if ($state -eq "TERMINATED"){
            Start-DatabricksCluster -Region $Region -BearerToken $BearerToken -ClusterId $ClusterId
        }
    }
}

databricks fs ls dbfs:/FileStore/jars/
