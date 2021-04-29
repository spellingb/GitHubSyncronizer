[CmdletBinding( SupportsShouldProcess, ConfirmImpact = 'High')]
Param(
    
    [ValidateSet('ent2git','git2ent')]
    $SyncDirection
)

#$location = $pwd.Path
$location = $PSScriptRoot

Set-Location -Path $location

$config = Get-Content -Path $location\Config.json | ConvertFrom-Json

if ( $config.Primary -eq 'GitHub' ) {
    $Origin = $config.GitHubRepo
    $Secondary = $config.EnterpriseRepo
} else {
    $Origin = $config.EnterpriseRepo
    $Secondary = $config.GitHubRepo

}
Write-Verbose "Origin: $Origin"
Write-Verbose "Secondary: $Secondary"

$OriginPath = Split-Path $Origin -Leaf

$OriginDirectory = Join-Path $location $OriginPath

#Setup Directory
if ( Test-Path $OriginDirectory ) {
    Remove-Item $OriginDirectory -Force -Recurse -Confirm:$false
}

#Clone Origin
cmd /c "git clone --mirror $Origin --verbose 2>&1"
    
Set-Location $OriginDirectory

#Config Secondary
cmd /c "git remote add --mirror=fetch secondary $Secondary 2>&1"

# Sync:
switch ( $SyncDirection ) {
    ent2git {  
        if ( $PSCmdlet.ShouldProcess( "Enterprise --> GitHub", 'Sync Repos:') ) {
            if ( $config.Primary -eq 'Enterprise' ) {
                cmd /c "git fetch origin --verbose 2>&1"
                cmd /c "git push secondary --all --verbose 2>&1"
            } else {
                cmd /c "git fetch secondary --verbose 2>&1"
                cmd /c "git push origin --verbose 2>&1"
            }
        }
    }
    git2ent {
        if ( $PSCmdlet.ShouldProcess( "GitHub --> Enterprise", 'Sync Repos:') ) {
            if ( $config.Primary -eq 'Enterprise' ) {
                cmd /c "git fetch secondary --verbose 2>&1"
                cmd /c "git push origin --verbose 2>&1"
            } else {
                cmd /c "git fetch origin --verbose 2>&1"
                cmd /c "git push secondary --all --verbose 2>&1"
            }
        }
    }

    Default {
        Write-Warning 'Invalid Option. No changes made to repos.'
    }
}

Set-Location $location
Remove-Item $OriginDirectory -Force -Recurse -Confirm:$false