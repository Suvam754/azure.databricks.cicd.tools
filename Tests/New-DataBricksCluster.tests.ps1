Import-Module "$PSScriptRoot\..\azure.databricks.cicd.tools.psm1" -Force
echo $1
BearerToken=$1
$Region = "westeurope" 
$ClusterName="vsdsfafasfasf"
$SparkVersion="4.0.x-scala2.11"
$NodeType="Standard_D3_v2"
$MinNumberOfWorkers=1
$MaxNumberOfWorkers=1
$Spark_conf = '{"spark.speculation": true, "spark.streaming.ui.retainedBatches": 5}'
# $InitScripts = '{"key": "Script1", "value": "dbfs:/script/script1"}', '{"key":"Script2","value":"dbfs:/script/script2"}'
$SparkEnvVars = '{"key": "SPARK_WORKER_MEMORY", "value": "29000m"}', '{"key":"SPARK_LOCAL_DIRS","value":"/local_disk0"}'
$AutoTerminationMinutes = 15
$PythonVersion = 2

Describe "New-DatabricksCluster" {
    It "Create basic cluster"{
        $ClusterId = New-DatabricksCluster  -BearerToken $BearerToken -Region $Region -ClusterName $ClusterName -SparkVersion $SparkVersion -NodeType $NodeType `
            -MinNumberOfWorkers $MinNumberOfWorkers -MaxNumberOfWorkers $MaxNumberOfWorkers `
            -Spark_conf $Spark_conf -AutoTerminationMinutes $AutoTerminationMinutes `
            -Verbose -SparkEnvVars $SparkEnvVars -PythonVersion $PythonVersion   # -UniqueNames -Update
    }
}
