#!/usr/bin/env bash

separators="==============================================================="

userDashboard() {
    username=$1
    echo -e "Welcome ${username} \nYou have successfully logIn"
    exit
}

logInProcess() {
    echo -e "\n${separators} \n\t\t\tLogIn Interface \n${separators}\n\n"

    #get user credentials
    echo -e "Please enter username: "
    read -r username
    echo -e "Please enter password: " 
    read -r password 

    # Read the credentials from the file
    stored_credentials=$(grep "^$username:" credential.txt)
  
    # Extract the stored username, password, and ID
    stored_username=$(echo "$stored_credentials" | cut -d: -f1)
    stored_password=$(echo "$stored_credentials" | cut -d: -f2)
  
  # Compare the entered and stored credentials
    if [[ "$username" == "$stored_username" && "$password" == "$stored_password" ]]; then
        userDashboard "$stored_username"
    else
        echo -e "❌ ERROR: ACCESS DENIED \n\n"
    fi
}


bothoPortalHomePage() {
    while true; do
        echo -e "${separators} \n\t\t\tBotho Portal Homepage \n${separators} \n" 
        echo -e "0. Exit \n1. LogIn \nChoice -> "
        read -r choice

        if [[ "$choice" -eq 0 ]]; then
            break
        else 
            logInProcess
        fi
    done
}

bothoPortalHomePage