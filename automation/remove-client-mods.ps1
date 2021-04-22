# List of Mods to remove for the Server
# In the format @("filename", "filename")
$CLIENT_MODS_TO_REMOVE_FROM_SERVER_FILES = @(
	"Ding", 
	"ReAuth", 
	"moreoverlays",
	"Neat", 
	"Toast-Control", 
	"PackMenu"
)

$modFolder = "$PSScriptRoot/../mods"

Write-Host
Write-Host "Removing client only mods..." -ForegroundColor Cyan
Get-ChildItem $modFolder -Name -Filter  "*.jar" | ForEach-Object {
	foreach ($clientOnlyMod in $clientOnlyMods) {
		if ($_.StartsWith($clientOnlyMod)) {
			Remove-Item "$modfolder/$_" -Force
			Write-Host "Removed the client mod $clientOnlyMod"
		}
	}
}