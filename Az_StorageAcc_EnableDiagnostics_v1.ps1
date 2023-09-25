

$reso = Get-Content "E:\kuppu\ASCBulk\reso.txt"

$Env = Read-Host "Enter the environment - NONPROD or PROD?"


If($Env -eq "NONPROD")
{

$EventHubNamespaceEAS = "mfcehubns-eas-stoac-nonprod-01"
$EventHubNamespaceSEA = "mfcehubns-sea-stoac-nonprod-01"
$EventHubNamespaceJPE = "mfcehubns-jpe-stoac-nonprod-01"
$EventHubNamespaceJPW = "mfcehubns-jpw-stoac-nonprod-01"

$EventHubNameEAS = "eventhub-asia-stoac-nonprod-eas"
$EventHubNameSEA = "eventhub-asia-stoac-nonprod-sea"
$EventHubNameJPE = "eventhub-asia-stoac-nonprod-jpe"
$EventHubNameJPW = "eventhub-asia-stoac-nonprod-jpw"

$RuleEAS = "ETSDiagSAS-NonProd-EAS"
$RuleSEA = "ETSDiagSAS-NonProd-SEA"
$RuleJPE = "ETSDiagSAS-NonProd-JPE"
$RuleJPW = "ETSDiagSAS-NonProd-JPW"

#$resource = "etscldstoacc01"

foreach($resource in $reso) {


$res = Get-AzResource -Name $resource | where {$_.Location -eq "eastasia" -or ($_.Location -eq "southeastasia") -or ($_.Location -eq "japaneast") -or ($_.Location -eq "japanwest")} -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

$Ids = @($res.ResourceId + "/blobServices/default"
        $res.ResourceId + "/fileServices/default"
        $res.ResourceId + "/queueServices/default"
        $res.ResourceId + "/tableServices/default"
)
##Enable Diagnostic Settings

        if($res.Location -eq "eastasia")
           {		     
            # Enables all Logs/Metrics on the current resource, if supported
			$diagname = $res.ResourceType.split('/')[-1] + "-diagnostics"
			$diagset = Set-AzDiagnosticSetting -Name $diagname -ResourceId $res.ResourceId -Enabled $true -EventHubName $EventHubNameEAS -EventHubAuthorizationRuleId /subscriptions/d30a19ac-3368-45c4-b19c-a602a3e64ce2/resourcegroups/monitoring-asia-nonprod-eas/providers/microsoft.eventhub/namespaces/$EventHubNamespaceEAS/authorizationrules/$RuleEAS -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            $Ids | ForEach-Object {
            $diagset1 = Set-AzDiagnosticSetting -Name $diagname -ResourceId $_ -Enabled $true -EventHubName $EventHubNameEAS -EventHubAuthorizationRuleId /subscriptions/d30a19ac-3368-45c4-b19c-a602a3e64ce2/resourcegroups/monitoring-asia-nonprod-eas/providers/microsoft.eventhub/namespaces/$EventHubNamespaceEAS/authorizationrules/$RuleEAS -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }
            write-host "Diagnostic settings enabled on: " -NoNewline;
            write-host $res.Name -ForegroundColor Green		
            }	
				  
        if($res.Location -eq "southeastasia")
           {		     
            # Enables all Logs/Metrics on the current resource, if supported
			$diagname = $res.ResourceType.split('/')[-1] + "-diagnostics"
			$diagset = Set-AzDiagnosticSetting -Name $diagname -ResourceId $res.ResourceId -Enabled $true -EventHubName $EventHubNameSEA -EventHubAuthorizationRuleId /subscriptions/d30a19ac-3368-45c4-b19c-a602a3e64ce2/resourcegroups/monitoring-asia-nonprod-sea/providers/microsoft.eventhub/namespaces/$EventHubNamespaceSEA/authorizationrules/$RuleSEA -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            $Ids | ForEach-Object {
            $diagset1 = Set-AzDiagnosticSetting -Name $diagname -ResourceId $_ -Enabled $true -EventHubName $EventHubNameSEA -EventHubAuthorizationRuleId /subscriptions/d30a19ac-3368-45c4-b19c-a602a3e64ce2/resourcegroups/monitoring-asia-nonprod-sea/providers/microsoft.eventhub/namespaces/$EventHubNamespaceSEA/authorizationrules/$RuleSEA -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }
            write-host "Diagnostic settings enabled on: " -NoNewline;
            write-host $res.Name -ForegroundColor Green 		
            }	
			
        if($res.Location -eq "japaneast")
           {		     
            # Enables all Logs/Metrics on the current resource, if supported
			$diagname = $res.ResourceType.split('/')[-1] + "-diagnostics"
			$diagset = Set-AzDiagnosticSetting -Name $diagname -ResourceId $res.ResourceId -Enabled $true -EventHubName $EventHubNameJPE -EventHubAuthorizationRuleId /subscriptions/d30a19ac-3368-45c4-b19c-a602a3e64ce2/resourcegroups/monitoring-asia-nonprod-jpe/providers/microsoft.eventhub/namespaces/$EventHubNamespaceJPE/authorizationrules/$RuleJPE -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            $Ids | ForEach-Object {
            $diagset1 = Set-AzDiagnosticSetting -Name $diagname -ResourceId $_ -Enabled $true -EventHubName $EventHubNameJPE -EventHubAuthorizationRuleId /subscriptions/d30a19ac-3368-45c4-b19c-a602a3e64ce2/resourcegroups/monitoring-asia-nonprod-jpe/providers/microsoft.eventhub/namespaces/$EventHubNamespaceJPE/authorizationrules/$RuleJPE -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }
            write-host "Diagnostic settings enabled on: " -NoNewline;
            write-host $res.Name -ForegroundColor Green
            }	
			
        if($res.Location -eq "japanwest")
           {		     
            # Enables all Logs/Metrics on the current resource, if supported
			$diagname = $res.ResourceType.split('/')[-1] + "-diagnostics"
			$diagset = Set-AzDiagnosticSetting -Name $diagname -ResourceId $res.ResourceId -Enabled $true -EventHubName $EventHubNameJPW -EventHubAuthorizationRuleId /subscriptions/d30a19ac-3368-45c4-b19c-a602a3e64ce2/resourcegroups/monitoring-asia-nonprod-jpw/providers/microsoft.eventhub/namespaces/$EventHubNamespaceJPW/authorizationrules/$RuleJPW -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            $Ids | ForEach-Object {
            $diagset1 = Set-AzDiagnosticSetting -Name $diagname -ResourceId $_ -Enabled $true -EventHubName $EventHubNameJPW -EventHubAuthorizationRuleId /subscriptions/d30a19ac-3368-45c4-b19c-a602a3e64ce2/resourcegroups/monitoring-asia-nonprod-jpw/providers/microsoft.eventhub/namespaces/$EventHubNamespaceJPW/authorizationrules/$RuleJPW -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }
            write-host "Diagnostic settings enabled on: " -NoNewline;
            write-host $res.Name -ForegroundColor Green		
            }	

}
}

If($Env -eq "PROD")
{

$EventHubNamespaceEAS = "mfcehubns-eas-stoac-prod-01"
$EventHubNamespaceSEA = "mfcehubns-sea-stoac-prod-01"
$EventHubNamespaceJPE = "mfcehubns-jpe-stoac-prod-01"
$EventHubNamespaceJPW = "mfcehubns-jpw-stoac-prod-01"

$EventHubNameEAS = "eventhub-asia-stoac-prod-eas"
$EventHubNameSEA = "eventhub-asia-stoac-prod-sea"
$EventHubNameJPE = "eventhub-asia-stoac-prod-jpe"
$EventHubNameJPW = "eventhub-asia-stoac-prod-jpw"

$RuleEAS = "ETSDiagSAS-prod-EAS"
$RuleSEA = "ETSDiagSAS-prod-SEA"
$RuleJPE = "ETSDiagSAS-prod-JPE"
$RuleJPW = "ETSDiagSAS-prod-JPW"

#$resource = "etscldstoacc01"

foreach($resource in $reso) {


$res = Get-AzResource -Name $resource | where {$_.Location -eq "eastasia" -or ($_.Location -eq "southeastasia") -or ($_.Location -eq "japaneast") -or ($_.Location -eq "japanwest")} -InformationAction SilentlyContinue

$Ids = @($res.ResourceId + "/blobServices/default"
        $res.ResourceId + "/fileServices/default"
        $res.ResourceId + "/queueServices/default"
        $res.ResourceId + "/tableServices/default"
)
##Enable Diagnostic Settings

        if($res.Location -eq "eastasia")
           {		     
            # Enables all Logs/Metrics on the current resource, if supported
			$diagname = $res.ResourceType.split('/')[-1] + "-diagnostics"
			$diagset = Set-AzDiagnosticSetting -Name $diagname -ResourceId $res.ResourceId -Enabled $true -EventHubName $EventHubNameEAS -EventHubAuthorizationRuleId /subscriptions/889b8de5-5b6d-4d11-a693-d48e77e6e900/resourcegroups/monitoring-asia-prod-eas/providers/microsoft.eventhub/namespaces/$EventHubNamespaceEAS/authorizationrules/$RuleEAS -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            $Ids | ForEach-Object {
            $diagset1 = Set-AzDiagnosticSetting -Name $diagname -ResourceId $_ -Enabled $true -EventHubName $EventHubNameEAS -EventHubAuthorizationRuleId /subscriptions/889b8de5-5b6d-4d11-a693-d48e77e6e900/resourcegroups/monitoring-asia-prod-eas/providers/microsoft.eventhub/namespaces/$EventHubNamespaceEAS/authorizationrules/$RuleEAS -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }
            write-host "Diagnostic settings enabled on: " -NoNewline;
            write-host $res.Name -ForegroundColor Green		
            }	
				  
        if($res.Location -eq "southeastasia")
           {		     
            # Enables all Logs/Metrics on the current resource, if supported
			$diagname = $res.ResourceType.split('/')[-1] + "-diagnostics"
			$diagset = Set-AzDiagnosticSetting -Name $diagname -ResourceId $res.ResourceId -Enabled $true -EventHubName $EventHubNameSEA -EventHubAuthorizationRuleId /subscriptions/889b8de5-5b6d-4d11-a693-d48e77e6e900/resourcegroups/monitoring-asia-prod-sea/providers/microsoft.eventhub/namespaces/$EventHubNamespaceSEA/authorizationrules/$RuleSEA -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            $Ids | ForEach-Object {
            $diagset1 = Set-AzDiagnosticSetting -Name $diagname -ResourceId $_ -Enabled $true -EventHubName $EventHubNameSEA -EventHubAuthorizationRuleId /subscriptions/889b8de5-5b6d-4d11-a693-d48e77e6e900/resourcegroups/monitoring-asia-prod-sea/providers/microsoft.eventhub/namespaces/$EventHubNamespaceSEA/authorizationrules/$RuleSEA -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }
            write-host "Diagnostic settings enabled on: " -NoNewline;
            write-host $res.Name -ForegroundColor Green 		
            }	
			
        if($res.Location -eq "japaneast")
           {		     
            # Enables all Logs/Metrics on the current resource, if supported
			$diagname = $res.ResourceType.split('/')[-1] + "-diagnostics"
			$diagset = Set-AzDiagnosticSetting -Name $diagname -ResourceId $res.ResourceId -Enabled $true -EventHubName $EventHubNameJPE -EventHubAuthorizationRuleId /subscriptions/889b8de5-5b6d-4d11-a693-d48e77e6e900/resourcegroups/monitoring-asia-prod-jpe/providers/microsoft.eventhub/namespaces/$EventHubNamespaceJPE/authorizationrules/$RuleJPE -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            $Ids | ForEach-Object {
            $diagset1 = Set-AzDiagnosticSetting -Name $diagname -ResourceId $_ -Enabled $true -EventHubName $EventHubNameJPE -EventHubAuthorizationRuleId /subscriptions/889b8de5-5b6d-4d11-a693-d48e77e6e900/resourcegroups/monitoring-asia-prod-jpe/providers/microsoft.eventhub/namespaces/$EventHubNamespaceJPE/authorizationrules/$RuleJPE -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }
            write-host "Diagnostic settings enabled on: " -NoNewline;
            write-host $res.Name -ForegroundColor Green
            }	
			
        if($res.Location -eq "japanwest")
           {		     
            # Enables all Logs/Metrics on the current resource, if supported
			$diagname = $res.ResourceType.split('/')[-1] + "-diagnostics"
			$diagset = Set-AzDiagnosticSetting -Name $diagname -ResourceId $res.ResourceId -Enabled $true -EventHubName $EventHubNameJPW -EventHubAuthorizationRuleId /subscriptions/889b8de5-5b6d-4d11-a693-d48e77e6e900/resourcegroups/monitoring-asia-prod-jpw/providers/microsoft.eventhub/namespaces/$EventHubNamespaceJPW/authorizationrules/$RuleJPW -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            $Ids | ForEach-Object {
            $diagset1 = Set-AzDiagnosticSetting -Name $diagname -ResourceId $_ -Enabled $true -EventHubName $EventHubNameJPW -EventHubAuthorizationRuleId /subscriptions/889b8de5-5b6d-4d11-a693-d48e77e6e900/resourcegroups/monitoring-asia-prod-jpw/providers/microsoft.eventhub/namespaces/$EventHubNamespaceJPW/authorizationrules/$RuleJPW -InformationAction SilentlyContinue -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }
            write-host "Diagnostic settings enabled on: " -NoNewline;
            write-host $res.Name -ForegroundColor Green		
            }	

}
}









