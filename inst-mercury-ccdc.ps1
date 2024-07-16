# This task installs the free version of Mercury and CCDC in Science Chem Lab #415
#      note that the two installer files (are 
#      saved in the SCCM applications area b/c they are too big to store in G/H

$public = "c:\temp"
# mkdir "$public\SS415"
$workdir="C:\Program Files\CCDC\Mercury"

# Get rid of any previously=existing files
rm -Recurse -Force $workdir
mkdir $workdir
cd $workdir
rm -force .\cos18.0.1.exe

# Unzip rezipped COS (for mercury stuff...)
Expand-Archive .zip -DestinationPath "${workdir}" -Force

# Install 2.3 CSD Suite
Start-Process ${workdir}\CSDInstallerOnline-windows.exe -ArgumentList "--mode unattended --unattendedmodeui none --Licensing notnow"  -Wait
Start-Process ${workdir}\"Software Activation.exe" -ArgumentList "0a -c -A"  -Wait