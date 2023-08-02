#!/usr/bin/bash

#colur table
red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"
blue="\033[0;34m"
cyan="\033[0;36m"
clear="\033[0m"

#menu loop
menu=1
while [[ $menu = "1" ]] ; do
sudo clear

# First menu
echo -e "${green}Type a number to choose from the following:\n(1) User\n(2) Groups\n(3) Information\n(4) Exit${clear}"
read -n1 choice

     if [[ "$choice" = "4" ]] ; then
         echo ""
         exit 
     fi

     if [[ "$choice" = "1" ]] ; then
         clear
         
         # Second menu
         echo -e "${green}User menu:\n(1) Create\n(2) Modify\n(3) Delete\n(4) Back\n(5) Exit${clear}"
         read -n1 choice1
         if [[ "$choice1" = "5" ]] ; then
             echo ""
             exit
         fi
             while [[ "$choice1" = "1" ]] ;
                 do
                    
                     # User creation menu
                     clear
                     echo -e "${green}User creation menu:\n(1) Create User & Group\n(2) Create User & add to existing group\n(3) Create User without Group\n(4) Back\n(5) Exit${clear}"
                     read -n1 choice11
                     if [[ "$choice11" = "4" ]] ; then
                         break
                     fi

                     if [[ "$choice11" = "5" ]] ; then
                         echo ""
                         exit
                     fi
                         
                         # Create a user and group and add the new user to the new group
                         while [[ "$choice11" = "1" ]] ; 
                             do 
                                 check111=0
                                 until [[ "$check111" = 1 ]] ; do
                                     clear

                                     echo -e "${yellow}Group name, must be 3-8 charecters:${clear} " 
                                     read groupname111

                                     if [[ -z "${groupname111//[0-9]}" ]] ; then
                                         echo -e ${red}"\nGroup name ${cyan}$groupname111 ${red}contains only numbers, try again. ${clear}"
                                         sleep 1.5
                                 
                                     elif [[ $groupname111 = *[[:space:]]* ]] ; then
                                         echo -e ${red}"\nGroup name ${cyan}$groupname111 ${red}contains spaces, try again. ${clear}"
                                         sleep 1.5
                                 
                                     elif [[ $(echo "$groupname111" | sed "s/\(.\)/\1\n/g" | grep -c "[[:punct:]]") -gt 1 ]] ; then 
                                         echo -e ${red}"\nGroup name ${cyan}$groupname111 ${red}contains forbidden charecters, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ ${#groupname111} -lt 3 ]] ; then
                                         echo -e ${red}"\nGroup name ${cyan}$groupname111 ${red}too short, try again. ${clear}"
                                         sleep 1.5
                                 
                                     elif [[ ${#groupname111} -gt 8 ]] ; then
                                         echo -e ${red}"\nGroup name ${cyan}$groupname111 ${red}too long, try again. ${clear}"
                                         sleep 1.5
                                
                                     elif grep -qwi "$groupname111" /etc/group
                                         then 
                                             echo -e ${red}"\nGroup $groupname111 already exists, try again. ${clear}"
                                             sleep 1.5
                                     else
                                         check111=1
                                     fi

                                 done

                                 check112=0
                                 until [[ "$check112" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"User name, must be 4-8 charecters : ${clear}" 
                                     read username111
                                     if [[ -z "${username111//[0-9]}" ]] ; then
                                         echo -e ${red}"\nUsername ${cyan}$username111 ${red}contains only numbers, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ $(echo "$username111" | sed "s/\(.\)/\1\n/g" | grep -c "[[:punct:]]") -gt 1 ]] ; then 
                                         echo -e ${red}"\nthe username ${cyan}$username111 ${red}contains forbidden charecters. try again. ${clear}"
                                         sleep 1.5
                                
                                     elif [[ ${#username111} -lt 4 ]] ; then
                                         echo -e ${red}"\nUsername ${cyan}$username111 ${red}too short, try again. ${clear}."
                                         sleep 1.5
                                 
                                     elif [[ ${#username111} -gt 8 ]] ; then
                                         echo -e ${red}"\nUsername ${cyan}$username111 ${red}too long, try again. ${clear}."
                                         sleep 1.5

                                     elif [[ $username111  == */* ]] ; then
                                         echo -e ${red}"\nSpecial charecters are forbidden, try again. ${clear}"
                                         sleep 1.5

                                     elif id -u "$username111" >/dev/null 2>&1 ; then
                                         echo -e ${red}"\nThe username $username111 already exists, try again. ${clear}"
                                         sleep 1.5
                                     else
                                         check112=1
                                     fi

                                 done

                                 check113=0
                                 until [[ "$check113" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"User Password, must be 4-10 charecters: ${clear}" 
                                     read -s password1111

                                     if [[ ${#password1111} -gt 10 ]] ; then
                                         echo -e ${red}"\nThe password is too long, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ ${#password1111} -lt 4 ]] ; then
                                         echo -e ${red}"\nThe password is too short, try again. ${clear}"
                                         sleep 1.5
                                     else 

                                     echo -e ${yellow}"\nConfirm Password: ${clear}"
                                     read -s password1112

                                     if [[ "$password1111" != "$password1112" ]] ; then
                                         echo -e ${red}"\nThe Passwords are not matching, try again. ${clear}"
                                         sleep 1.5
                                     else
                                         check113=1
                                     fi
                                     fi

                                 done

                                 check114=0
                                 until [[ "$check114" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"Choose shell \n(1) bash \n(2) sh ${clear}"
                                     read -p ":" shell1111

                                     if [[ "$shell1111" = "2" ]] || [[ "$shell1111" = "1" ]] ; then
                                         if [[ "$shell1111" = "1" ]]  ; then 
                                             shell1112="/bin/bash"
                                             shell1113="Bash"
                                             check114=1

                                         elif [[ "$shell1111" = "2" ]] ; then 
                                             shell1112="/bin/sh"
                                             shell1113="Sh"
                                             check114=1
                                         fi
                                     else
                                         echo -e ${red}"\nInvalid input ${green}$shell1111${red}, try again. ${clear}"
                                         sleep 1.5
                                     fi

                                 done
                                 
                                 check115=0
                                 until [[ "$check115" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"Path to User directory: for example, ${green}/home/ ${clear}"
                                     read homefolder111
                                     if  [[ -d "$homefolder111$username111" ]] ; then
                                         echo -e ${red}"\nThe directory ${green}$homefolder111$username111 ${red}already exists, try again. ${clear}"
                                         sleep 1.5
                                     else

                                     clear

                                     if  [[ -d "$homefolder111" ]] ;
                                         then
                                         sudo groupadd "$groupname111"
                                         sudo useradd  "$username111" -m -d "$homefolder111""$username111"  -g "$groupname111" -s "$shell1112" -p $(perl -e 'print crypt($ARGV[0], "password")' "$password1111" )
                                         sudo chown -R "$username111" "$homefolder111""$username111"
                                         sudo chmod -R  +t "$homefolder111""$username111"
                                         echo -e ${blue}"User ${cyan}$username111 ${blue}and group ${cyan}$groupname111 ${blue}were created successfully, the user DIR is located at ${green}$homefolder111$username111 ${blue}and using the shell ${green}$shell1113 ${clear}"
                                         sleep 5
                                         check115=1
                                         break
                                     else
                                         echo -e ${red}"The path ${green}$homefolder111 ${red}doesnt exist, try again. ${clear}"
                                         sleep 1.5
                                     fi
                                     fi

                                 done
                                 
                         break
                         done

            
                         # Create a user and add him to an existing group
                         while [[ "$choice11" = "2" ]] ; 
                             do
                                 check121=0
                                 until [[ "$check121" = 1 ]] ; do
                                     clear

                                     

                                     echo -e ${yellow}"User name, must be 4-8 charecters : ${clear}" 
                                     read username112
                                     if [[ -z "${username112//[0-9]}" ]] ; then
                                         echo -e ${red}"\nUsername ${cyan}$username112 ${red}contains only numbers, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ $(echo "$username112" | sed "s/\(.\)/\1\n/g" | grep -c "[[:punct:]]") -gt 1 ]] ; then 
                                         echo -e ${red}"\nThe username ${cyan}$username112 ${red}contains forbidden charecters. try again. ${clear}"
                                         sleep 1.5
                                
                                     elif [[ ${#username112} -lt 4 ]] ; then
                                         echo ""
                                         echo -e ${red}"\nUsername ${cyan}$username112 ${red}too short, try again. ${clear}"
                                         sleep 1.5
                                 
                                     elif [[ ${#username112} -gt 8 ]] ; then
                                         echo ""
                                         echo -e ${red}"\nUsername ${cyan}$username112 ${red}too long, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ $username112  == */* ]] ; then
                                         echo -e ${red}"\nSpecial charecters are forbidden, try again. ${clear}"
                                         sleep 1.5

                                     elif id -u "$username112" >/dev/null 2>&1 ; then
                                         echo -e ${red}"\nThe username $username112 already exists, try again. ${clear}"
                                         sleep 1.5
                                     else
                                         check121=1
                                     fi

                                 done

                                 check122=0
                                 until [[ "$check122" = 1 ]] ; do

                                     clear

                                     echo -e ${yellow}"User Password, must be 4-10 charecters: ${clear}"
                                     read -s password1121

                                     if [[ ${#password1121} -gt 10 ]] ; then
                                         echo ${red}"\nThe password is too long, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ ${#password1121} -lt 4 ]] ; then
                                         echo -e ${red}"\nThe password is too short, try again. ${clear}"
                                         sleep 1.5
                                     else

                                     echo -e ${yellow}"\nConfirm Password: ${clear}" 
                                     read -s password1122

                                     if [[ "$password1121" != "$password1122" ]] ; then
                                         echo -e ${red}"\nThe Passwords are not matching, try again. ${clear}"
                                         sleep 1.5
                                     else
                                         check122=1
                                     fi
                                     fi

                                 done

                                 check123=0
                                 until [[ "$check123" = 1 ]] ; do
                                     clear
                                 
                                     echo -e ${yellow}"Choose shell \n(1) bash \n(2) sh ${clear}"
                                     read -p ":" shell1121

                                     if [[ "$shell1121" = "2" ]] || [[ "$shell1121" = "1" ]] ; then

                                         if [[ "$shell1121" = "1" ]] ; then 
                                             shell1122="/bin/bash"
                                             shell1123="Bash"
                                             check123=1

                                     elif [[ "$shell1121" = "2" ]] ; then
                                             shell1122="/bin/sh"
                                             shell1123="Sh"
                                             check123=1
                                         fi
                                     else
                                         echo -e ${red}"Invalid input ${green}$shell1121${red}, try again. ${clear}"
                                         sleep 1.5
                                     fi

                                 done

                                 check124=0
                                 until [[ "$check124" = 1 ]] ; do 
                                     clear
                                     groups=( $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/group) )

                                     echo -e "${yellow}Add to a group:${clear} " 
                                     select groupname112 in "${groups[@]}"; do
                                         if [[ -z  "$groupname112" ]] ; then
                                             echo -e ${red}"\nNo such option, try again. ${clear}"
                                             unset ${groups[@]}
                                             sleep 1.5
                                             break
                                         else
                                             check124=1
                                             break
                                         fi
                                     done
                                 done

                                 check125=0
                                 until [[ "$check125" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"Path to User directory: for example, ${green}/home/ ${clear}" 
                                     read homefolder112

                                     if  [[ -d "$homefolder112$username112" ]] ; then
                                         echo -e ${red}"\nThe directory ${green}$homefolder112$username112 ${red}already exists, try again. ${clear}"
                                         sleep 1.5
                                     else
                                         check125=1

                                     clear

                                     if  [[ -d "$homefolder112" ]] ; then
                                         sudo useradd  "$username112" -m -d "$homefolder112""$username112"  -g "$groupname112" -s "$shell1122" -p $(perl -e 'print crypt($ARGV[0], "password")' "$password1112" )
                                         sudo chown -R "$username112" "$homefolder112""$username112"
                                         sudo chmod -R  +t "$homefolder112""$username112"
                                         echo -e ${blue}"User ${cyan}$username112 ${blue}was created and add to the group ${cyan}$groupname112 ${blue}successfully, the user DIR is located at ${green}$homefolder112$username112 ${blue}and using the shell ${green}$shell1123 ${clear}"
                                         check125=1
                                         sleep 5
                                         break
                                     else
                                         echo -e ${red}"The path ${green}$homefolder112 ${red}doesnt exist, try again. ${clear}"
                                         sleep 1.
                                     fi
                                     fi
                                 done
                         break
                         done
            
                         
                         # User without group
                         while [[ "$choice11" = "3" ]] ; 
                             do
                                 check131=0
                                 until [[ "$check131" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"User name, must be 4-8 charecters : " 
                                     read username113
                                     if [[ -z "${username113//[0-9]}" ]] ; then
                                         echo -e ${red}"\nUsername ${cyan}$username113 ${red}contains only numbers, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ $(echo "$username113" | sed "s/\(.\)/\1\n/g" | grep -c "[[:punct:]]") -gt 1 ]] ; then 
                                         echo -e ${red}"\nThe username ${cyan}$username113 ${red}contains forbidden charecters. try again. ${clear}"
                                         sleep 1.5
                                
                                     elif [[ ${#username113} -lt 4 ]] ; then
                                         echo -e ${red}"\nUsername ${cyan}$username113 ${red}too short, try again. ${clear}"
                                         sleep 1.5
                                 
                                     elif [[ ${#username113} -gt 8 ]] ; then
                                         echo -e ${red}"\nUsername ${cyan}$username113 ${red}too long, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ $username113  == */* ]] ; then
                                         echo -e ${red}"\nSpecial charecters are forbidden, try again. ${clear}"
                                         sleep 1.5

                                     elif id -u "$username113" >/dev/null 2>&1 ; then
                                         echo -e ${red}"\nThe username $username113 already exists, try again. ${clear}"
                                         sleep 1.5
                                     else
                                         check131=1
                                     fi
                                 done

                                 check132=0
                                 until [[ "$check132" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"User Password, must be 4-10 charecters: ${clear}" 
                                     read -s password1131

                                     if [[ ${#password1131} -gt 10 ]] ; then
                                         echo -e ${red}"\nThe password is too long, try again. ${clear}"
                                         sleep 1.5

                                     elif [[ ${#password1131} -lt 4 ]] ; then
                                         echo -e ${red}"\nThe password is too short, try again. ${clear}"
                                         sleep 1.5
                                     else

                                     echo -e ${yellow}"\nConfirm Password: ${clear}"
                                     read -s password1132

                                     if [[ "$password1131" != "$password1132" ]] ; then
                                         echo -e ${red}"\nthe Passwords are not matching, try again. ${clear}"
                                         sleep 1.5
                                     else
                                         check132=1
                                     fi
                                     fi
                                 done

                                 check133=0
                                 until [[ "$check133" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"Choose shell \n(1) bash \n(2) sh ${clear}"
                                     read shell1131

                                     if [[ "$shell1131" = "2" ]] || [[ "$shell1131" = "1" ]] ; then

                                         if [[ "$shell1131" = "1" ]] ; then 
                                             shell113="/bin/bash"
                                             shell1133="Bash"
                                             check133=1

                                         elif [[ "$shell1131" = "2" ]] ; then
                                             shell113="/bin/sh"
                                             shell1133="Sh"
                                             check133=1
                                         fi
                                     else
                                         echo -e ${red}"\nInvalid option ${green}$shell1131 ${red}try again. ${clear}"
                                         sleep 1.5
                                     fi
                                 done

                                 check134=0
                                 until [[ "$check134" = 1 ]] ; do
                                     clear

                                     echo -e ${yellow}"Path to User directory, for example: ${green}/home/ ${clear}"
                                     read homefolder113

                                     if  [[ -d "$homefolder113$username113" ]] ; then
                                         echo -e ${red}"\nThe directory ${green}$homefolder113$username113 ${red}already exists, try again. ${clear}"
                                         sleep 1.5
                                     else

                                     clear

                                     if  [[ -d "$homefolder113" ]] ; then
                                         sudo useradd  "$username113" -m -d "$homefolder113""$username113" -N -s "$shell113" -p $(perl -e 'print crypt($ARGV[0], "password")' "$password1113" )
                                         sudo chown -R "$username113" "$homefolder113""$username113"
                                         sudo chmod -R  +t "$homefolder113""$username113"
                                         echo -e ${blue}"User ${cyan}$username113 ${blue}was created successfully, the user DIR is located at ${green}$homefolder113$username113 ${blue}and using the shell ${green}$shell1133 ${clear}"
                                         check134=1
                                         sleep 5
                                         break
                                     else
                                     echo -e ${blue}"The path ${green}$homefolder113 doesnt exist, try again. ${clear}"
                                     sleep 1.5

                                     fi
                                     fi

                                 done
                                 
                         break
                         done

                 done                 
             

                 # User modification menu
                 while [[ "$choice1" = "2" ]] ; do

                     clear
                     users=( $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/passwd) )
                     groups=( $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/group) )
                     echo -e "${green}(1) Change username\n(2) Change user password\n(3) Change user primary group\n(4) Add user to secondary group\n(5) Move home DIR\n(6) Lock account\n(7) Unlock account\n(8) Change user shell\n(9) Back${clear}"
                     read -n2 -p ":" choice12

                     # Change username
                     if [[ $"$choice12" = "1" ]] ; then
                         clear
                         select user1 in "${users[@]}"; 
                             do 
                                 if [[ -z  "$user1" ]] ; then
                                     echo -e ${red}"\nNo such option, going back. ${clear}"
                                     sleep 1.5
                                     break
                                 fi

                                 clear

                                 echo -e ${yellow}"Type new name, must be 3-8 charecters: ${clear}"
                                 read name121
                                 if [[ -z "${name121//[0-9]}" ]] ; then
                                     echo -e ${red}"\nUsername ${cyan}$name121 ${red}contains only numbers, starting over${clear}"
                                     sleep 2
                                     break

                                 elif [[ $(echo "$name121" | sed "s/\(.\)/\1\n/g" | grep -c "[[:punct:]]") -gt 1 ]] ; then 
                                     echo -e ${red}"\nThe username ${cyan}$name121 ${red}contains forbidden charecters. starting over ${clear}"
                                     sleep 2
                                     break
                                
                                 elif [[ ${#name121} -lt 3 ]] ; then
                                     echo -e ${red}"\nUsername ${cyan}$name121 ${red}too short, starting over. ${clear}"
                                     sleep 2
                                     break
                                 
                                 elif [[ ${#name121} -gt 8 ]] ; then
                                     echo -e ${red}"\nUsername ${cyan}$name121 ${red}too long, starting over. ${clear}"
                                     sleep 2
                                     break

                                 elif [[ $name121  == */* ]] ; then
                                     echo -e ${red}"\nSpecial charecters are forbidden, starting over. ${clear}"
                                     sleep 2
                                     break

                                 elif id -u "$name121" >/dev/null 2>&1 ; then
                                     echo -e ${red}"\nThe username already exists, starting over. ${clear}"
                                     sleep 2
                                     break
                                 else
                                 
                                 clear
                                 sudo usermod -l "$name121" "$user1"

                                 echo -e ${blue}"Username ${cyan}$user1 ${blue}was change successfully to ${cyan}$name121 ${clear}"
                                 unset "${users[@]}"
                                 sleep 5
                                 break

                                 fi
                         break  
                         done

                     fi

                     # Change user password
                     if [[ "$choice12" = "2" ]] ; then
                         clear
                         select user2 in "${users[@]}"; do 
                             
                             if [[ -z  "$user2" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             clear

                             echo -e ${yellow}"Type your new password: ${clear}"
                             read -s user2pass
                             if [[ ${#user2pass} -gt 10 ]] ; then
                                 echo -e ${red}"\nThe password is too long, starting over. ${clear}"
                                 sleep 2
                                 break

                             elif [[ ${#user2pass} -lt 4 ]] ; then
                                 echo -e ${red}"\nThe password is too short, starting over ${clear}."
                                 sleep 1.5
                                 sleep 2
                                 break
                             fi

                             echo -e ${yellow}"\nConfirm Password: ${clear}"
                             read -s user2pass2

                             if [[ "$user2pass" != "$user2pass2" ]] ; then
                                 echo -e ${red}"\nThe Passwords are not matching, starting over. ${clear}"
                                 sleep 2
                                 break
                             else
                             
                             clear
                             sudo usermod "$user2" -p $(perl -e 'print crypt($ARGV[0], "password")' "$user2pass" )

                             echo -e ${blue}"The password to ${cyan}$user2 ${blue}was successfully changed, going back. ${clear}"
                             sleep 5
                             break

                             fi
                         break
                         done

                     fi

                     # Change user primary group
                     if [[ "$choice12" = "3" ]] ; then
                         clear
                         select user3 in "${users[@]}"; do 

                             if [[ -z  "$user3" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             echo -e ${yellow}"Primary group of User ${cyan}$user3 ${yellow}is: ${cyan}"
                             groups "$user3" | cut -d ' ' -f3
                             echo -e "${clear}"
                             echo -e ${yellow}"\nTo which Primary group would you like to add ${cyan}$user3${yellow}? ${clear}"
                             sleep 3
                             select group123 in "${groups[@]}"; do

                                if [[ -z  "$group123" ]] ; then
                                     echo -e ${red}"\nNo such option, going back. ${clear}"
                                     unset "${groups[@]}"
                                     sleep 1.5
                                     break
                                 fi

                                 clear
                                 sudo usermod "$user3" -G "$group123"

                                 echo -e ${blue}"Successfully changed primary group for ${cyan}$user3 ${blue}to ${cyan}$group123 ${clear}"
                                 sleep 5
                                 break
                             done
                         break
                         done

                     fi

                     # Add user to secondary group
                     if [[ "$choice12" = "4" ]] ; then
                         clear
                         select user4 in "${users[@]}"; do 
                             
                             if [[ -z  "$user4" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             echo -e ${yellow}"Currently ${cyan}$user4 ${yellow}is a member of these secondary groups :${cyan}"
                             groups "$user4" | cut -d ' ' -f4,5,6,7,8,9,10
                             echo -e "${clear}"
                             sleep 3
                             echo -e ${yellow}"\nTo which secondary group would you like to add ${cyan}$user4 ${clear}"
                             select group124 in "${groups[@]}"; do

                                 if [[ -z  "$group124" ]] ; then
                                     echo -e ${red}"\nNo such option, going back. ${clear}"
                                     sleep 1.5
                                     break
                                 fi

                                 clear
                                 sudo usermod "$user4" -aG "$group124"

                                 echo -e ${blue}"Successfully addeed ${cyan}$user4 ${blue}to ${cyan}$group124 ${blue}as a secondary group ${clear}"
                                 unset "${groups[@]}"
                                 sleep 5
                                 break
                             done
                         break
                         done

                     fi

                     # Move home DIR
                     if [[ "$choice12" = "5" ]] ; then
                         clear
                         select user5 in "${users[@]}"; do 

                             if [[ -z  "$user5" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             
                             echo -e ${yellow}"\nPath to new home, without username: for example, ${green}/home/ ${clear}"
                             read mvhome125
                             if  [[ -d "$mvhome125" ]] ; then

                                 clear
                                 sudo usermod -d "$mvhome125""$user5" -m "$user5"
                                 echo -e ${blue}"User's ${cyan}$user5 ${blue}home directory was successfully moved to ${green}$mvhome125$user5 ${clear}"
                                 sleep 5
                                 break
                             else
                                  echo -e ${red}"\nThe directory ${green}$mvhome ${red}does not exist, starting over... ${clear}"
                                  sleep 2.5
                                  break
                             fi


                         break
                         done

                     fi

                     # Lock account
                     if [[ "$choice12" = "6" ]] ; then
                         clear
                         select user6 in "${users[@]}"; do

                             if [[ -z  "$user6" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             clear
                             sudo usermod -L "$user6"

                             echo -e ${blue}"Successfully locked user ${cyan}$user6 ${clear}"
                             sleep 5
                             break
                            
                         break
                         done

                     fi

                     # Unlock account
                     if [[ "$choice12" = "7" ]] ; then
                         clear
                         select user7 in "${users[@]}"; do 
                             
                             if [[ -z  "$user7" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             clear
                             sudo usermod -U "$user7"

                             echo -e ${blue}"Successfully unlocked user ${cyan}$user7 ${clear}"
                             sleep 5
                             break
                         break
                         done

                     fi

                     # change user shell
                     if [[ "$choice12" = "8" ]] ; then
                         clear
                         select user8 in "${users[@]}"; do
                             
                             if [[ -z  "$user8" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             clear
                             
                             echo -e ${green}"Choose shell \n(1) bash \n(2) sh ${clear}"
                             read -p ":" shell128

                             if [[ "$shell128" = "2" ]] || [[ "$shell128" = "1" ]] ; then

                                 if [[ "$shell128" = "1" ]] ; then
                                     cut /etc/passwd -d ':' -f1,7 | grep -qx "$user8":/bin/bash
                                     if [[ $? -eq 0 ]] ; then
                                         echo -e ${red}"\nThe user ${cyan}$user8 ${red}is already using ${green}bash ${clear}"
                                         sleep 1.5
                                         break
                                     fi
                                 fi
                                 
                                 if [[ "$shell128" = "2" ]] ; then
                                     cut /etc/passwd -d ':' -f1,7 | grep -qx "$user8":/bin/sh
                                     if [[ $? -eq 0 ]] ; then
                                         echo -e ${red}"\nThe user ${cyan}$user8 ${red}is already using ${green}sh ${clear}"
                                         sleep 1.5
                                         break
                                     fi
                                 fi

                                 if [[ "$shell128" = "1" ]] ; then 
                                     shell1281="/bin/bash"
                                     shell1282="Bash"

                                 elif [[ "$shell128" = "2" ]] ; then
                                     shell1281="/bin/sh"
                                     shell1282="Sh"
                                 fi
                             

                                 clear
                                 sudo usermod "$user8" -s "$shell1281"

                                 echo -e ${blue}"Shell for user ${cyan}$user8 ${blue}was changed Successfully to ${cyan}$shell1282 ${clear}"
                                 sleep 5
                                 break
                             else 
                                 echo -e ${red}"\ninvalid option ${cyan}$shell128${red}, starting over. ${clear}"
                                 sleep 1.5
                                 break
                             fi
                         break
                         done
                         
                         
                             
                     fi

                     # Exit
                     if [[ "$choice12" = "9" ]] ; then
                         break

                     fi
                 break
                 done



                 # Delete Users
                 while [[ "$choice1" = "3" ]] ; do

                     echo -e "${yellow}"
                     clear
                     select choice31 in "Delete user" "Delete user and his directory"; do
                     echo -e "${clear}"
                     

                     if [[ -z  "$choice31" ]] ; then
                         echo -e ${red}"\nNo such option, going back. ${clear}"
                         sleep 1.5
                         break
                     fi

                     clear
                     users=( $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/passwd) )
                     echo -e "${yellow}Which user would you like to delete?: ${clear}"

                     if [[ "$choice31" = "Delete user" ]] ; then
                         select userdel1 in "${users[@]}"; do

                             if [[ -z  "$userdel1" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             clear

                             echo -e ${yellow}"Are you sure you want to delete ${cyan}$userdel1${yellow}? type ${green}yes${yellow} if you want to continue: ${clear}"
                             read lastchance31
                             if [[ "$lastchance31" = "yes" ]] ; then

                                 clear
                                 
                                 sudo userdel "$userdel1"

                                 echo -e ${blue}"User ${cyan}$userdel1 ${blue}was deleted successfully. ${clear}"
                                 unset "${users[@]}"
                                 sleep 5
                                 break

                             else 
                                 echo -e ${green}"\n$lastchance31 ${red}is not ${green}yes${red}, canceling the deletion of ${cyan}$userdel1. ${clear}"
                                 sleep 2.5
                                 break
                             fi

                         break
                         done
                     fi

                     if [[ "$choice31" = "Delete user and his directory" ]] ; then
                         clear
                         select userdel2 in "${users[@]}"; do

                             if [[ -z  "$userdel2" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             echo -e ${yellow}"Are you sure you want to delete ${cyan}$userdel2 ${yellow}and his home directory?, type ${green}yes${yellow} if you want to continue: ${clear}"
                             read lastchance32
                             if [[ "$lastchance32" = "yes" ]] ; then

                                 clear

                                 grep "$userdel2" /etc/passwd | cut -d ':' -f6 | xargs sudo rm -rf
                                 sudo userdel "$userdel2"

                                 echo -e ${blue}"User ${cyan}$userdel2 ${blue}and his directory ware deleted successfully. ${clear}"
                                 unset "${users[@]}"
                                 sleep 5
                                 break

                             else 
                                 echo -e ${green}"\n$lastchance32 ${red}is not ${green}yes${red}, canceling the deletion of ${cyan}$userdel2. ${clear}" 
                                 sleep 2.5
                                 break
                                 fi

                         break
                         done
                     fi



                     break
                     done

                 break
                 done
     fi    


 #groups menu
 if [[ "$choice" = "2" ]] ;
     then
         clear
         echo -e "${green}Grups menu\n(1) Create\n(2) Modify\n(3) Delete\n(4) Back \n(5) Exit\n${clear}"
         read -n1 choice2
         if [[ "$choice2" = "5" ]] ; then
             echo ""
             exit
         fi 
            
            # Grup creation menu
             while [[ "$choice2" = "1" ]] ; do
                 clear
                 echo -e "${green}(1) Create a regular group\n(2) Create a group with a passwod\n(3) Back\n(4) Exit${clear}"
                 read group21
                 
                 #create a regular group
                 while [[ "$group21" = "1" ]] ; do
                     clear
                     echo -e ${yellow}"Group name, must be 3-8 charecters:${clear} " 
                     read groupname21

                     if [[ -z "${groupname21//[0-9]}" ]] ; then
                         echo -e ${red}"\nGroup name ${cyan}$groupname21 ${red}contains only numbers, starting over.${clear}"
                         sleep 1.5
                                 
                     elif [[ $groupname21 = *[[:space:]]* ]] ; then
                         echo -e ${red}"\nGroup name ${cyan}$groupname21 ${red}contains spaces, starting over. ${clear}"
                         sleep 1.5
                                 
                     elif [[ $(echo "$groupname21" | sed "s/\(.\)/\1\n/g" | grep -c "[[:punct:]]") -gt 1 ]] ; then 
                         echo -e ${red}"\nGroup name ${cyan}$groupname21 ${red}contains forbidden charecters. starting over. ${clear}"
                         sleep 1.5

                     elif [[ ${#groupname21} -lt 3 ]] ; then
                         echo -e ${red}"\nGroup name ${cyan}$groupname21 ${red}too short, starting over.${clear}"
                         sleep 1.5
                                 
                     elif [[ ${#groupname21} -gt 8 ]] ; then
                         echo -e ${red}"\nGroup name ${cyan}$groupname21 ${red}too long, starting over. ${clear}"
                         sleep 1.5
                                
                     elif grep -qwi "$groupname21" /etc/group
                         then
                             echo -e ${red}"\nGroup ${cyan}$groupname21 ${red}already exists, starting over. ${clear}"
                             sleep 1.5
                     else
                     clear
                     sudo groupadd "$groupname21"
                     echo -e ${blue}"Group ${cyan}$groupname21 ${blue}was created successfully. ${clear}"
                     sleep 5
                     break
                     fi

                 done

                 #create a group with a password
                 while [[ "$group21" = "2" ]] ; do
                     clear
                     echo -e ${yellow}"Group name, must be 3-8 charecters: ${clear}" 
                     read groupname22

                     if [[ -z "${groupname22//[0-9]}" ]] ; then
                         echo -e ${red}"\nGroup name $groupname22 contains only numbers, starting over.${clear}"
                         sleep 1.5
                                 
                     elif [[ $groupname21 = *[[:space:]]* ]] ; then
                         echo -e ${red}"\nGroup name ${cyan}$groupname22 ${red}contains spaces, starting over. ${clear}"
                         sleep 1.5
                                 
                     elif [[ $(echo "$groupname22" | sed "s/\(.\)/\1\n/g" | grep -c "[[:punct:]]") -gt 1 ]] ; then 
                         echo -e ${red}"\nGroup name ${cyan}$groupname22 ${red}contains forbidden charecters. starting over ${clear}"
                         sleep 1.5

                     elif [[ ${#groupname22} -lt 3 ]] ; then
                         echo -e ${red}"\nGroup name $groupname22 too short, starting over.${clear}"
                         sleep 1.5
                                 
                     elif [[ ${#groupname22} -gt 8 ]] ; then
                         echo -e ${red}"\nGroup name ${cyan}$groupname22 ${red}too long, starting over. ${clear}"
                         sleep 1.5
                                
                     elif grep -qwi "$groupname22" /etc/group
                         then
                             echo -e ${red}"\nGroup ${cyan}$groupname22 ${red}already exists, starting over. ${clear}"
                             sleep 1.5
                     else
                     clear
                     sudo groupadd "$groupname22"
                     echo -e ${yellow} ""
                     sudo gpasswd "$groupname22"
                     echo -e ${clear}""
                     echo -e ${blue}"Group ${cyan}$groupname22 ${blue}was created successfully ${clear}"
                     sleep 5
                     break
                     fi

                 done

                 if [[ "$group21" = "3" ]] ; then
                     break
                 fi

                 if [[ "$group21" = "4" ]] ; then
                     exit
                 fi
                 
                 
             break
             done

             # Group modification menu
             while [[ "$choice2" = "2" ]] ; do
                 clear
                 # arrays for users and group selection
                 users=( $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/passwd) )
                 groups=( $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/group) )

                 # actual menu
                 echo -e "${green}(1) Rename a group\n(2) Change the password\n(3) Remove the group password\n(4) Add a user to a group\n(5) Remove a user from a group\n(6) Set new admin to the group\n(7) Back\n(8) Exit${clear}"
                 read choice22
                 
                 if [[ "$choice22" = "7" ]] ; then
                     break
                 fi

                 
                 if [[ "$choice22" = "8" ]] ; then
                     echo ""
                     exit
                 fi

                 #rename a group
                 while [[ "$choice22" = "1" ]] ; do
                     clear
                     select group2211 in "${groups[@]}"; do

                         if [[ -z  "$group2211" ]] ; then
                             echo -e ${red}"\nNo such option, going back. ${clear}"
                             sleep 1.5
                             break
                         fi

                         clear
                         echo -e "${yellow}New Group name, must be 3-8 charecters:${clear} " 
                         read group2212

                         if [[ -z "${group2212//[0-9]}" ]] ; then
                             echo -e ${red}"\nGroup name ${cyan}$group2212 ${red}contains only numbers, starting over.${clear}"
                             sleep 1.5
                             break

                                 
                         elif [[ $group2212 = *[[:space:]]* ]] ; then
                             echo -e ${red}"\nGroup name ${cyan}$group2212 ${red}contains spaces, starting over. ${clear}"
                             sleep 1.5
                             break
                                 
                         elif [[ $(echo "$group2212" | sed "s/\(.\)/\1\n/g" | grep -c "[[:punct:]]") -gt 1 ]] ; then 
                             echo -e ${red}"\nGroup name ${cyan}$group2212 ${red}contains forbidden charecters. starting over ${clear}"
                             sleep 1.5
                             break

                         elif [[ ${#group2212} -lt 3 ]] ; then
                             echo -e ${red}"\nGroup name ${cyan}$group2212 ${red}too short, starting over.${clear}"
                             sleep 1.5
                             break
                                 
                         elif [[ ${#group2212} -gt 8 ]] ; then
                             echo -e ${red}"\nGroup name ${cyan}$group2212 ${red}too long, starting over. ${clear}"
                             sleep 1.5
                             break
                                
                         elif grep -qwi "$group2212" /etc/group
                             then
                             echo -e ${red}"\nGroup ${cyan}$group2212 ${red}already exists, starting over. ${clear}"
                             sleep 1.5
                             break
                         else

                         clear
                         sudo groupmod -n "$group2212" "$group2211"
                         echo -e ${blue}"Successfully changed group name ${cyan}$group2211 ${blue}to ${cyan}$group2212 ${clear}"
                         unset "${groups[@]}"
                         sleep 5
                         break
                         break
                         fi

                     done
                 
                 break
                 done
                 
                 #change the passwod of a group
                 while [[ "$choice22" = "2" ]] ; do
                     clear
                     select group22 in "${groups[@]}"; do
                    
                         if [[ -z  "$group22" ]] ; then
                             echo -e ${red}"\nNo such option, going back. ${clear}"
                             sleep 1.5
                             break
                         fi
                         
                         echo -e ${yellow}""
                         sudo gpasswd "$group22"
                         echo -e ${clear}""
                         unset "${groups[@]}"
                         sleep 5
                         break
                     done

                 break
                 done
                 
                 #remove the passwod of group
                 while [[ "$choice22" = "3" ]] ; do
                     clear
                     select group23 in "${groups[@]}"; do

                         if [[ -z  "$group23" ]] ; then
                             echo -e ${red}"\nNo such option, going back. ${clear}"
                             sleep 1.5
                             break
                         fi

                         clear
                         sudo gpasswd -r "$group23"
                         echo -e ${blue}"The password to the group ${cyan}$group23 ${blue}was removed successfully ${clear}"
                         unset "${groups[@]}"
                         sleep 5
                         break
                     done

                 break
                 done
                 
                 #add user to a group
                 while [[ "$choice22" = "4" ]] ; do

                     clear
                     echo -e ${yellow}"Choose a group ${clear}"
                     select group24 in "${groups[@]}"; do

                         if [[ -z  "$group24" ]] ; then
                             echo -e ${red}"\nNo such option, going back. ${clear}"
                             sleep 1.5
                             break
                         fi

                         clear
                         echo -e ${yellow}"Choose a user ${clear}"
                         select user24 in "${users[@]}"; do

                             if [[ -z  "$user24" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 sleep 1.5
                                 break
                             fi

                             clear
                             echo -e ${blue}""
                             sudo gpasswd "$group24" -a "$user24"
                             echo -e ${clear}""
                             echo -e ${blue}"User ${cyan}$user24 ${blue}was added to the group ${cyan}$group24 ${blue}successfully ${clear}"
                             unset "${users[@]}"
                             sleep 5
                             break
                         done

                     unset "${groups[@]}"
                     break
                     done

                 break
                 done
                 
                 #remove a user from a group
                 while [[ "$choice22" = "5" ]] ; do
                     clear
                     echo -e ${yellow}"Choose a user \n${clear}"
                     select user25 in "${users[@]}"; do

                         if [[ -z  "$user25" ]] ; then
                             echo -e ${red}"\nNo such option, going back. ${clear}"
                             sleep 1.5
                             break
                         fi

                         clear
                         echo -e ${yellow}"Currently ${cyan}$user25 ${yellow}is a member of these secondary groups :\n ${clear}"
                         groups "$user25" | cut -d ' ' -f4,5,6,7,8,9,10
                         sleep 3
                         clear
                         echo -e ${yellow}"From which group youd like to remove ${cyan}$user25 ${yellow}from? "
                         select group25 in "${groups[@]}"; do
                             echo -e "${clear}"
                             
                             if [[ -z  "$group25" ]] ; then
                                 echo -e ${red}"\nNo such option, going back. ${clear}"
                                 unset "${groups[@]}"
                                 sleep 1.5
                                 break
                             fi

                             clear
                             sudo gpasswd -A "$user25" "$group25"
                             echo -e ${blue}"User ${cyan}$user25 ${blue}was removed from the group ${cyan}$group25 ${blue}successfully  ${clear}"
                             unset "${groups[@]}"
                             sleep 5
                             break
                         done

                     unset "${users[@]}"
                     break
                     done
                 break
                 done
                 
                 #set new admin to a group
                 while [[ "$choice22" = "6" ]] ; do
                    clear
                     echo -e ${yellow}"Select a group\n ${clear}"
                     select group26 in "${groups[@]}"; do
                     echo -e "${clear}"

                         if [[ -z  "$group26" ]] ; then
                             echo -e ${red}"\nNo such option, going back. ${clear}"
                             sleep 1.5
                             break
                         fi

                         clear
                         echo -e ${yellow}"Select a new admin ${clear}"
                         select user26 in "${users[@]}"; do

                            if [[ -z  "$user26" ]] ; then
                                 echo -e ${red}"\nNo such option, going back.${clear}"
                                 sleep 1.5
                                 break
                             fi

                             clear
                             sudo gpasswd -A "$user26" "$group26"
                             echo -e ${blue}"User ${cyan}$user26 ${blue}was changed to administrator of the group ${cyan}$group26 ${blue}successfully ${clear}"
                             unset "${users[@]}"
                             sleep 5
                             break
                         done

                     unset "${groups[@]}"
                     break
                     done
                 break
                 done
                 

             break
             done

             # Delete a group
             while [[ "$choice2" = "3" ]] ; do

                 groups=( $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/group) )

                 clear
                 echo -e ${red}"Warning, deleting a group will remove all its users from it \n${yellow}\nwhich group do you want to delete? : \n ${clear}"
                 select groupdel in "${groups[@]}"; do

                     if [[ -z  "$groupdel" ]] ; then
                         echo -e ${red}"\nNo such option, going back.${clear}"
                         sleep 1.5
                         break
                     fi

                     clear
                     echo -e ${yellow}"Are you sure you want to delete ${cyan}$groupdel${yellow}? type ${green}yes${yellow} if you want to continue: ${clear}"
                     read lastchance3
                     if [[ "$lastchance3" = "yes" ]] ; then

                         clear
                         sudo groupdel -f "$groupdel"
                         echo -e ${blue}"Group ${cyan} $groupdel ${blue} was deleted successfully.${clear}"
                         unset "${groups[@]}"
                         sleep 5
                         break

                         else 
                             echo -e ${green}"\n$lastchance3 ${red}is not ${green}yes${red}, cancling the deletion of ${cyan}$groupdel ${clear}" 
                             sleep 2.5
                             break
                         fi
                 break
                 done

             break
             done
 fi
 

 #information menu
 if [[ "$choice" = "3" ]] ;
     then

         clear
         echo -e "${green}Information menu\n(1) List users\n(2) Specific user information\n(3) List groups\n(4) Extended details on groups \n(5) Extended details on both\n(6) Back\n(7) Exit${clear}"
         read -n1 choice3
             
             
             if [[ "$choice3" = "6" ]] ; then
                 sleep 0.01
             fi

             if [[ "$choice3" = "7" ]] ; then
                 echo ""
                 exit
             fi 
  
             # Information on users
             while [[ "$choice3" = "1" ]] ; do
                 clear
                 echo -e "${green}Listing ${cyan}users,${green} type anything to go back: \n${clear}"
                 awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/passwd
                 read -sn1 back31
                 if [[ "$back31" != "!($*" ]] ; then
                     break
                 fi
             done

             while [[ "$choice3" = "2" ]] ; do
                 clear
                 users=( $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/passwd) )

                 select userinfo in "${users[@]}"; do 
                     if [[ -z  "$userinfo" ]] ; then
                         echo -e "${red}No such option, going back.${clear}"
                         sleep 1.5
                         break
                     fi
                     echo -e "${cyan}Currently ${green}$userinfo ${cyan}is a member of these groups: ${clear}"
                     groups "$userinfo" | cut -d ' ' -f4,5,6,7,8,9,10
                     echo -e "\n${cyan}The path to his home directory is: ${clear}"
                     grep "$userinfo" /etc/passwd | cut -d ':' -f6
                     echo -e "\n${cyan}The shell the user is using is: ${clear}"
                     grep "$userinfo" /etc/passwd | cut -d ':' -f7
                     echo -e "\n${green}Press anything to go back ${clear}"
                     read -sn1 backtrue32
                         if [[ "$backtrue32" != "!($*" ]] ; then
                             unset "${users[@]}"
                             break
                         fi
                 done

             break
             done



             #Information on groups
             while [[ "$choice3" = "3" ]] ; do
                 clear
                 echo -e "${green}Listing ${cyan}groups,${green} type anything to go back: \n${clear}"
                 awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $1 } }' /etc/group
                 read -sn1 back32
                 if [[ "$back32" != "!($*" ]] ; then
                     break
                 fi
             done
             

             # Extended Information on groups
             while [[ "$choice3" = "4" ]] ; do
                 clear
                 echo -e "${green}Listing ${cyan}groups,${green} type anything to go back: \n${clear}"
                 awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $0 } }' /etc/group
                 read -sn1 back32
                 if [[ "$back32" != "!($*" ]] ; then
                     break
                 fi
             done

             # Information on both users and groups
             while [[ "$choice3" = "5" ]] ; do
                 clear
                 echo -e "${green}Listing ${cyan}users ${green}and ${cyan}groups${green}, type anything to go back:${cyan} \n \nUsers:${clear}"
                 awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $0 } }' /etc/passwd
                 echo -e "${cyan}\nGroups:${clear}"
                 awk -F: '{ if ($3 >= 1000 && $3 <= 60000) { print $0 } }' /etc/group
                 read -sn1 back33
                 if [[ "$back33" != "!($*" ]] ; then
                     break
                 fi
             done
                 
 
 fi
 done
 exit
