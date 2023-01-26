#!/bin/bash
# 
function menu () {
	while [ true ]; do
		echo "User management program"
		echo ""
		echo "A) Create a user account"
		echo "B) Delete a user account"
		echo "C) Change a user group"
		echo "D) Change account expiration date for a user account"
		echo "E) Create a group"
		echo "F) Delete a group"
		echo "Q) Quit"
		echo ""
		echo -n "Enter the letter for the option you want to pick: "
		read choice
		
		if [ $choice = "A" ] || [ $choice = "a" ]; then
			
			createUser

		elif [ $choice = "B" ] || [ $choice = "b" ]; then

			deleteUser

		elif [ $choice = "C" ] || [ $choice = "c" ]; then

			changeGroupUser
		elif [ $choice = "D" ] || [ $choice = "d" ]; then
                	
			changeExpireDate
		elif [ $choice = "E" ] || [ $choice = "e" ]; then

		        createGroup	
		elif [ $choice = "F" ] || [ $choice = "f" ] ; then
		       
			deleteGroup

		elif [ $choice = "Q" ] || [ $choice = "q" ]; then
			clear

			exit 1 
		else
		
			clear
			echo "Error: Please select a valid option from the list."
			echo ""
		fi
	done
}


function createUser() { 
	clear
	echo "Creating A User Setup"
	echo ""
	echo -n "Please enter a username for the user: "
	read username
	echo ""
	echo -n "Please enter the users role :  "
	read role
	echo ""
	echo -n "Please enter the users work group: "
	read group
# you must create the group first.
	useradd -c "$role" -G $group  $username &&  sudo passwd $username

	echo "The user account has been created. Press any key to continue."
        read 
	clear

	echo "do you want to create another user?( y/n ) "
	read choice2

	if [ $choice2 = y ] ; then
		  
		createUser
	

	else
		clear
	fi

	clear
}

function deleteUser() {
	clear
	echo "Delete A User Setup"
	echo ""
	echo -n "Please enter the username you would like to delete: "
	read username

		userdel  $username
	
	

	echo "The user has been deleted. Press any key to continue."
	read
	clear
	echo " do you want to delete another user ?( y/n) "
	read choice2
	if [$choice2 = y ] ; then
		deelteUser
	else
		clear
	fi
	clear
}

function createGroup() {
	clear
	echo "Create A Group"
	echo ""
	echo "Please enter the the Group name you want to create:"
	read groupname

	     groupadd $groupname
	   
	echo "The group has been created . Press any key to continue."
   	read
	clear
	echo " do you want to create another group ? ( y/n) "
	read choice2 
	if [ $choice2 = y ] ; then 
		createGroup
	else
		clear
	fi
	
}
function changeExpireDate() {
	clear
	echo "Change Expiration Date For User Setup"
	echo ""
	echo -n "Please enter the username : "
	read username
	echo -n "Please enter a expiration date in the format YYYY-MM-DD : "
	read expire
	usermod -e $expire $username
	echo "the date has been chnaged. Press any key to continue."
	read
	clear
	echo "do you want to change another user expire date ? (y / n ) "
	read choice2
	if [ $choice2 = y ] ; then
		changeExpireDate
	else
		clear
	fi

}
function changeGroupUser() {
	clear
	echo "Change User Group Setup"
	echo ""
	echo -n "Please enter the username you would like to change the inital group: "
	read username
	echo -n "Please enter the group name to add to the account: "
	read group
	echo ""
	usermod -G $group $username
	echo "The user has been modified. Press any key to continue."
	read
	clear
	echo " do you want to change another  user group ? ( y / n ) "
	read choice2
	if [ $choice2 = y ] ; then
		changeGroupUser
	else
		clear
	fi
}

function deleteGroup() {
	clear
	echo " Delete Group Setup "
	echo " "
	echo -n "please enter the group name "
	read groupname
	echo " "
	groupdel -f $groupname 
	echo " the group has been deleted. Press any key to continue. "
	read
	clear
	echo " do you want to delete another group ? ( y / n ) "
	read choice2
	if [ $choice2 = y ] ; then
		deleteGroup
	else
		clear
	fi
}
menu 
