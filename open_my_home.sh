!/bin/bash

user=<your_user_name>
users="ottor lese rakovec boeing brennerj marxa shresthap thober rkumar kaluza"

cd /home

for uu in ${users}; do
    echo "providing rights for user: "${uu}
    setfacl -R -m u:${uu}:r-X -m d:u:${uu}:r-X ${user}
done

# close .ssh folder
chmod -R 700 ${user}/.ssh

echo "Done!"


#Hi all,
#
#WKDV allows us to control our rights of home directories on EVE. Please find attached a bash script to open your directory. Before executing this script on EVE, add your username to the user variable and delete it from the users list. The users list contains the user names of those people that you want to grant access. You can change it as you like. This script also closes the .ssh directory for external access because this contains your .ssh keys. The scripts takes some minutes to run.
#
#Best,
#Stephan
#mail from March 7th
