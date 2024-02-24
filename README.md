# CloudUploader CLI

## Overview

CloudUploader CLI is a Bash-based command-line tool designed to simplify the process of uploading files to Azure Blob Storage. Whether you're a developer managing large datasets or a business handling customer files, this tool streamlines the upload process and enhances productivity.

## Blog Post

Check out my detailed blog post on Hashnode to learn more about the CloudUploader CLI project and my journey with Linux and Bash Scripting:
[Link to Blog Post](https://chaitanyapadalkar.hashnode.dev/capstone-project-building-a-bash-based-cli-tool-for-uploading-files-to-azure-blob-storage)

## Features

- **Authentication**: Authenticate with your Azure account using Azure CLI.
- **File Upload**: Upload single or multiple files to Azure Blob Storage.
- **Overwrite Prompt**: Prompt users to confirm overwrite if the file already exists in the destination container.
- **Progress Bar**: Real-time progress bar using the `pv` command.
- **Error Handling**: Gracefully handle errors and provide informative messages to users.

## Installation

1. Ensure you have Azure CLI installed. If not, you can install it by following the instructions [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
2. Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/CloudUploader-CLI.git
```

## Usage

1. Navigate to the cloned repository:

```bash
cd CloudUploader-CLI
```

2. Run the `clouduploader` script with the desired file(s) and destination container:

```bash
./clouduploader /path/to/file.txt container-name
```

3. Follow the prompts to authenticate with your Azure account and confirm the upload.

## Future Enhancements

While the current version of CloudUploader CLI provides essential functionality, there are opportunities for future enhancements, such as:

- Support for additional cloud providers (AWS S3, Google Cloud Storage).
- Enhanced error handling and logging.
- Integration with CI/CD pipelines for automated deployment.
- Advanced options for file synchronization and encryption.

## Contributing

Contributions are welcome! If you have any ideas for improvements or new features, feel free to open an issue or submit a pull request.
