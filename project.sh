#!/bin/bash
# 
function menu () {
	while [ true ]; do
		echo "    WELCOME TO THE USER & GROUP MANAGMENT PROGRAM     " 
		echo ""
		echo " type any key to continue. "
 
		read
	       clear	
		echo ""
		echo "          User&Group managemnt program                "
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
	echo "" 
	
	
	echo " are you sure you want to create the user: $username  ? ( y / n )" 
	read choice1
	if [ $choice1 = y ] || [ $choice1 = Y ] ; then

# you must create the group first.
	useradd -c "$role" -G $group  $username &&  sudo passwd $username
else
	menu
	clear
	fi 
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
	echo "" 
	echo " are you sure you want to delete the user  ? ( y / n )   "
	read choice1
	if [ $choice1 = y ] ||[ $choice1 = Y ] ; then


		userdel  $username
	else menu 
		clear
	fi
	

	echo "The user has been deleted. Press any key to continue."
	read
	clear
	echo " do you want to delete another user ?( y/n) "
	read choice2
	if [$choice2 = y ] ; then
		deleteUser
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
	echo ""
	echo " are you sure you want to add the Group ? ( y/n )  "
read choice1
if [ $choice1 = y ] || [ $choice1 = Y ] ; then 


	     groupadd $groupname
     else
	 menu 
       clear
fi        
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
	ech " are you sure you want to commit the changes ? ( y/ n )  "
	read choice1
	if [ $choice1 = y ] ||[ $choice1 = Y ] ; then 
	usermod -e $expire $username
	 else  menu
		 clear
	fi
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
	echo " are you sure you want to commit the changes ? ( y / n ) "
	read choice1
	if [ $choice1 = y ] || [ $choic1 = Y ] ; then 
	usermod -G $group $username
else menu
	clear 
	fi
	echo "The user has been modified. Press any key to continue."
	read
	clear
	echo " do you want to change another  user group ? ( y / n ) "
	read choice2
	if [ $choice2 = y ] || [ $choice2 = Y ]  ; then
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
	echo " are you sure you want to delete the group ( Y / N)  "
	read choice1 
	if [ $choice1 = y ] || [ $choice1 = Y ]  ; then  groupdel -f $groupname 
	else 
	 menu
	fi 	 
	echo " the group has been deleted. Press any key to continue. "
	read
	clear
	echo " do you want to delete another group ? ( y / n ) "
	read choice2
	if [ $choice2 = y ] || [ $choice2 = Y ] ; then
		deleteGroup
	else
		clear
	fi
}
menu 
