$ErrorActionPreference="Stop"
Set-StrictMode -Version Latest

$TOKEN=$args[0]
$GITEA_URL=$args[1]
$OWNER=$args[2]

$env:DOTNET_CLI_UI_LANGUAGE="en_US"
if(Get-PSRepository "Gitea" -ErrorAction SilentlyContinue){
    Unregister-PSRepository -Name "Gitea"
}

Register-PSRepository -Name "Gitea" `
-PublishLocation "$GITEA_URL/api/packages/$OWNER/nuget/index.json" `
-SourceLocation "$GITEA_URL/api/packages/$OWNER/nuget/index.json" `
-PackageManagementProvider NuGet `
-InstallationPolicy Trusted
Publish-Module -Path "." -Repository "Gitea" -NuGetApiKey $TOKEN -Verbose
