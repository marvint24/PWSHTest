Set-StrictMode -Version Latest

function Get-Test {
    Write-Host "Test successful"    
}

Export-ModuleMember @("Get-Test")