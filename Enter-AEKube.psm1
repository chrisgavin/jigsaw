Function Enter-AEKube {
	[CmdletBinding()]
	Param(
		[Parameter(Mandatory=$true, HelpMessage="The subscription the cluster is in.")]
		[string]$subscriptionId,
		[Parameter(Mandatory=$true, HelpMessage="The resource group the cluster is in.")]
		[string]$resourceGroupName
	)

	$clusterName = "ghae"
	$namespace = "ghae"
	Connect-AzAccount
	Set-AzContext -SubscriptionId $subscriptionId
	Import-AzAksCredential -ResourceGroupName $resourceGroupName -Name $clusterName
	$env:Path += ";$Env:ProgramFiles\Kubectl\"
	kubectl config set-context --current --namespace="$namespace"
}
