# First we need to prompt the user for the info of the new employee
$fName = Read-Host "What is the First name?"
$lName = Read-Host "Now the last name?"


# Then we use that info to create a display name for the user 
$dName = "$fName $lName"


# Next we will display their new display name 
Write-Host "Display Name: $dName"


# Get their email 
$eMail = Read-Host "What is the email?"


# Department
# $dPart = Read-Host "What department are they in?"


# Role
$tRole = Read-Host "What is their role?"


# State
# $sName = Read-Host "What state do they live in?"


# Now we put it all together and create the new user
New-ADUser -Name $dName -GivenName $fName -Surname $lName -EmailAddress $eMail -Title $tRole -AccountPassword (ConvertTo-SecureString "P@ssword123" -AsPlainText -Force) -Enabled $true
