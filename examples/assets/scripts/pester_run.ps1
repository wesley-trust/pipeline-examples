param(
  [Parameter(Mandatory = $true)][string]$TestsPath,
  [Parameter(Mandatory = $true)][string]$ResultsFile,
  [string]$ResultsFormat = 'NUnitXml'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

try {
  if (-not (Get-Module -ListAvailable -Name Pester)) {
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
    Install-Module Pester -Scope CurrentUser -Force
  }
  Import-Module Pester

  $dir = Split-Path -Path $ResultsFile -Parent
  if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }

  Set-Location self

  # Install the Az module if not already available
  if (-not (Get-Module -ListAvailable -Name Az)) {
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
    Install-Module -Name Az -Scope CurrentUser -Force
  }

  # Output all environmental variables for debugging purposes
  Get-ChildItem Env: | Sort-Object Name | ForEach-Object { Write-Host $($_.Name) }

  # Using ENVironment variables set by the AzureCLI@2 task
  Connect-AzAccount -ServicePrincipal `
    -Tenant $ENV:AZURE_TENANT_ID `
    -ApplicationId $ENV:AZURE_CLIENT_ID `
    -FederatedToken $ENV:AZURE_FEDERATED_TOKEN `
    -Subscription $ENV:AZURE_SUBSCRIPTION_ID

  Invoke-Pester -Path $TestsPath -OutputFormat $ResultsFormat -OutputFile $ResultsFile -EnableExit
}
catch {
  Write-Error $_
  throw
}