#!/bin/bash

setup(){
    if ! command -v az &>/dev/null; then
        echo "Azure CLI installing..."
        curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
        exit 1
    fi

    if ! az account show &>/dev/null; then
        echo "Login to your Azure account"
        az login
    fi

    if ! az account show &>/dev/null; then
        echo "Login failed.."
        exit 1
    fi

    echo "Azure Authentication Successfull"
}

check_path_exists(){
    if [ -z "$1" ]; then
        echo "File path is missing"
        exit 1
    fi
}

check_file_exists(){
    if [ ! -f "$1" ]; then
        echo "File: not found"
        exit 1
    fi
}

check_storageaccount_exists(){
    if ! az storage account show --name "$1" &>/dev/null; then
        echo "Storage Account "$1" does not exist"
        exit 1
    fi
}

check_container_exists(){
    if ! az storage container exists --name "$2" --account-name "$1" &>/dev/null; then
        echo "Creating container $2 in $1"
        az storage container create --name "$2" --account-name "$1"
    fi
}

upload_file(){
    echo "Uploading $1 to container $3 ..."
    if az storage blob exists --container-name "$3" --name "$(basename "$1")" --account-name "$2" &>/dev/null; then
        read -p "The specified blob already exists. Do you want to overwrite it? (yes/no): " overwrite_decision
        if [[ "$overwrite_decision" == "yes" ]]; then
            az storage blob upload --container-name "$3" --file "$1" --name "$(basename "$1")" --account-name "$2" --overwrite
            echo "Upload Successful (Overwritten)"
        else
            echo "Upload aborted. Exiting..."
            exit 1
        fi
    else
        az storage blob upload --container-name "$3" --file "$1" --name "$(basename "$1")" --account-name "$2"
        echo "Upload Successful"
    fi
}


FILE_PATH="$1"

setup
check_path_exists "$FILE_PATH"
check_file_exists "$FILE_PATH"
read -p "Enter Storage Account name: " storage_account;
check_storageaccount_exists "$storage_account"
read -p "Enter Container name: " container;
check_container_exists "$storage_account" "$container"
upload_file "$FILE_PATH" "$storage_account" "$container"

