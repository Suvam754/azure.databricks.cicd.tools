Import-Module "$PSScriptRoot\..\azure.databricks.cicd.tools.psm1" -Force


echo "Hello World" > suvam.txt

Get-AzureRmEventHub -ResourceGroup vishalvvv -NamespaceName nmspcestageproddd| grep Name|grep -v CaptureDescription.Destination| awk '{print $3}' > suvamnew.txt

