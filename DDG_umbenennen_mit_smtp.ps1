$oldSmtp = "cld.ddg.wf.alle@dew21.de"
$newSmtp = "cld.ddg.Wwf.alle@dew21.de"

$g = Get-DynamicDistributionGroup -Identity "DDG-Gruppenname"

# 1) Name/Anzeige/Alias
Set-DynamicDistributionGroup -Identity $g.Identity `
  -Name "CLD.DDG.WWF.Alle" `
  -DisplayName "CLD.DDG.WWF.Alle" `
  -Alias "CLD.DDG.WWF.Alle"

# 2) Primary SMTP umstellen
Set-DynamicDistributionGroup -Identity "CLD.DDG.WWF.Alle" `
  -PrimarySmtpAddress $newSmtp

# 3) alte Adresse als Alias hinzufügen (separater Befehl)
Set-DynamicDistributionGroup -Identity "CLD.DDG.WWF.Alle" `
  -EmailAddresses @{ Add = "smtp:$oldSmtp" }

