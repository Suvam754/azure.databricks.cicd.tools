    param
(
    [Parameter(Mandatory)]
    [String]$Databrickstokennn

)
Set-Location $PSScriptRoot
Import-Module "$PSScriptRoot\..\azure.databricks.cicd.tools.psm1" -Force
$Region = "West US" 
$ClusterName="dbrclstredhqa"
$SparkVersion="4.0.x-scala2.11"
$NodeType="Standard_DS3_v2"
$MinNumberOfWorkers=1
$MaxNumberOfWorkers=1
$Spark_conf = '{"spark.speculation": true, "spark.streaming.ui.retainedBatches": 5}'
#$CustomTags = '{"key": "CreatedBy", "value": "suvam"}' , '{"key":"Date","value":"12th Dec 2018"}'
# $InitScripts = '{"key": "Script1", "value": "dbfs:/script/script1"}', '{"key":"Script2","value":"dbfs:/script/script2"}'
$SparkEnvVars = '{"key": "SPARK_WORKER_MEMORY", "value": "29000m"}', '{"key":"SPARK_LOCAL_DIRS","value":"/local_disk0"}'
$AutoTerminationMinutes = 10
$PythonVersion = 2

Describe "New-DatabricksCluster" {
    It "Create basic cluster"{
        $ClusterId = New-DatabricksCluster  -BearerToken $Databrickstokennn -Region $Region -ClusterName $ClusterName -SparkVersion $SparkVersion -NodeType $NodeType `
            -MinNumberOfWorkers $MinNumberOfWorkers -MaxNumberOfWorkers $MaxNumberOfWorkers `
            -AutoTerminationMinutes $AutoTerminationMinutes `
            -Verbose -PythonVersion $PythonVersion   # -UniqueNames -Update
    }
}
