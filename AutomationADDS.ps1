# Full Script:
# Set the Static IP address
New-NetIPAddress -IPAddress 192.168.1.204 -InterfaceIndex 3 -PrefixLength 24 -DefaultGateway 192.168.1.1

# Set the DNS Server for the windows server vm
Set-DnsClientServerAddress -InterfaceIndex 3 -ServerAddresses "192.168.1.1"

# Rename the Windows Server VM and restart the computer
Rename-Computer -NewName "EnergyWise-Ser"
Restart-Computer -Timeout 60 -Delay 2

# Wait for the computer to restart before running the next commands

# Install AD-Domain-Services
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
# Create a new Active Directory forest
$adminPassword = ConvertTo-SecureString "L3tM3In" -AsPlainText -Force
Install-ADDSForest -DomainName "EnergyWise.com" -DomainNetbiosName "EnergyWiseBio" -ForestMode WinThreshold -InstallDns -SafeModeAdministratorPassword $adminPassword -Force:$true
$domainController = "DC01.globex.com"

# Create Organizational Units (OU)
# Operations Department
$OUOperation = New-ADOrganizationalUnit -Name "Operations" -path "DC=EnergyWise,DC=com"
# Sales Department
$OUSales = New-ADOrganizationalUnit -Name "Sales" -path "DC=EnergyWise,DC=com"
# Marketing Department
$OUMarketing = New-ADOrganizationalUnit -Name "Marketing" -path "DC=EnergyWise,DC=com"
# Engineering Department
$OUEngineering = New-ADOrganizationalUnit -Name "Engineering" -path "DC=EnergyWise,DC=com"
# Create a list of the OUs
$OUList = @(
    $OUOperation.Name,
    $OUSales.Name,
    $OUMarketing.Name,
    $OUEngineering.Name
)

# Restart the computer again
Restart-Computer -Timeout 60 -Delay 2

# Wait for the computer to restart before running the next command

# Resume the script after the computer restarts
New-ADUser -GivenName "Sarah" -Surname "Patel" -Department $OUOperation -Company "Energy-Wise" -Title "Director" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Maria" -GivenName "Maria" -Surname "Rodriguez" -Department $OUOperation -Company "Energy-Wise" -Title "Administrative Manager" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Abdullahi" -GivenName "Abdullahi" -Surname "Osei" -Department $OUOperation -Company "Energy-Wise" -Title "CS Manager" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Aisha" -GivenName "Aisha" -Surname "Mbeki" -Department $OUOperation -Company "Energy-Wise" -Title "Technical Support Manager" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Juanita" -GivenName "Juanita" -Surname "Chavez" -Department $OUOperation -Company "Energy-Wise" -Title "Production Coordinator" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Sanaa" -GivenName "Sanaa" -Surname "Ahmed" -Department $OUSales -Company "Energy-Wise" -Title "Director" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Jaden" -GivenName "Jaden" -Surname "Patel" -Department $OUSales -Company "Energy-Wise" -Title "Manager" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Omar" -GivenName "Omar" -Surname "Ali" -Department $OUSales -Company "Energy-Wise" -Title "Business Development Manager" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Fatima" -GivenName "Fatima" -Surname "Kaur" -Department $OUSales -Company "Energy-Wise" -Title "Account Manager" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Nia" -GivenName "Nia" -Surname "Jones" -Department $OUSales -Company "Energy-Wise" -Title "Sales Representitive" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Nabil" -GivenName "Nabil" -Surname "Mwangi" -Department $OUSales -Company "Energy-Wise" -Title "Sales Coordinator" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Ava" -GivenName "Ava" -Surname "Huang" -Department $OUMarketing -Company "Energy-Wise" -Title "Director" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Yara" -GivenName "Yara" -Surname "Ramirez" -Department $OUMarketing -Company "Energy-Wise" -Title "Manager" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Ahmed" -GivenName "Ahmed" -Surname "Zaidi" -Department $OUMarketing -Company "Energy-Wise" -Title "Digital Marketing Manager" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Zoe" -GivenName "Zoe" -Surname "Nguyen" -Department $OUMarketing -Company "Energy-Wise" -Title "Content Writer" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Ade" -GivenName "Ade" -Surname "Adeyemi" -Department $OUMarketing -Company "Energy-Wise" -Title "Graphic Designer" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Leila" -GivenName "Leila" -Surname "Sow" -Department $OUMarketing -Company "Energy-Wise" -Title "Marketing Coordinator" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Maya" -GivenName "Maya" -Surname "Singh" -Department $OUEngineering -Company "Energy-Wise" -Title "CTO" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Juma" -GivenName "Juma" -Surname "Mwamba" -Department $OUEngineering -Company "Energy-Wise" -Title "Energy Auditor" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Karima" -GivenName "Karima" -Surname "Mbeki" -Department $OUEngineering -Company "Energy-Wise" -Title "Energy Auditor" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Emeka" -GivenName "Emeka" -Surname "Okonkwo" -Department $OUEngineering -Company "Energy-Wise" -Title "Energy Auditor" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Dikeledi" -GivenName "Dikeledi" -Surname "Patel" -Department $OUEngineering -Company "Energy-Wise" -Title "Energy Auditor" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Ndidi" -GivenName "Ndidi" -Surname "Adeyemi" -Department $OUEngineering -Company "Energy-Wise" -Title "Senor Energy Auditor" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Anwar" -GivenName "Anwar" -Surname "Hassan" -Department $OUEngineering -Company "Energy-Wise" -Title "Senor Energy Auditor" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Amara" -GivenName "Amara" -Surname "Sow" -Department $OUEngineering -Company "Energy-Wise" -Title "Senor Energy Auditor" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Ismaila" -GivenName "Ismaila" -Surname "Diop" -Department $OUEngineering -Company "Energy-Wise" -Title "Senor Energy Auditor" -AccountPassword (ConvertTo-SecureString "L3tM3InN0w" -AsPlainText -Force) -Enabled $true
