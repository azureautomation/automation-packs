workflow AzureAlertContext
{
	
    param ( 
        [object]$WebhookData
    )
	
    # If runbook was called from Webhook, WebhookData will not be null.
    if ($WebhookData -ne $null) {   

        # Collect properties of WebhookData.
        $WebhookName    =   $WebhookData.WebhookName
        $WebhookHeaders =   $WebhookData.RequestHeader
        $WebhookBody    =   $WebhookData.RequestBody

        # Collect individual headers.
        $From = $WebhookHeaders.From
        Write-Output "Runbook started from webhook $WebhookName by $From."
		
		# Display data passed through.
		$Data = (ConvertFrom-Json -InputObject $WebhookBody)
		Write-Output $Data
    }
    else {
        Write-Error "Runbook meant to be started only from webhook." 
    } 
}

	