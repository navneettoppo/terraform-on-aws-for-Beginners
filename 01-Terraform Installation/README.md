# Terraform & AWS cli Installation (Linux, Windows and Mac) 

## Linux Installation https://www.terraform.io/downloads
- Ubuntu/Debian
```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# aws-cli installation
sudo apt-get update
sudo apt-get -y install awscli
aws --version

# configure awscli
aws configure
```
- Amazon Linux
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# aws-cli installation
sudo yum update
sudo yum -y install awscli
aws --version

# configure awscli
aws configure
```
- CentOS/RHEL
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# aws-cli installation
sudo dnf install python3-pip
sudo pip3 install awscli --upgrade --user
aws --version

# configure awscli
aws configure
```

## Windows Installation https://www.terraform.io/downloads
- Windows
```
windows_386 https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_windows_386.zip
windows_amd64 https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_windows_amd64.zip

# awscli installation
AWS CLI MSI installer for Windows (64-bit): https://s3.amazonaws.com/aws-cli/AWSCLI64PY3.msi
AWS CLI MSI installer for Windows (32-bit): https://s3.amazonaws.com/aws-cli/AWSCLI32PY3.msi
AWS CLI combined setup file for Windows: https://s3.amazonaws.com/aws-cli/AWSCLISetup.exe (includes both the 32-bit and 64-bit MSI installers, and automatically installs the correct version)

# cmd/ powershell
aws configure
```

## Mac Installation https://www.terraform.io/downloads
- PACKAGE MANAGER
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
- MACOS BINARY DOWNLOAD
```
amd64 https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_darwin_amd64.zip
arm64 https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_darwin_arm64.zip

mkdir /Users/<YOUR-USER>/Documents/terraform-install
unzip terraform_0.14.3_darwin_amd64.zip
echo $PATH
mv terraform /usr/local/bin
terraform version

# awscli installation
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target \
                -target CurrentUserHomeDirectory \
                -applyChoiceChangesXML choices.xml
$ sudo ln -s /folder/installed/aws-cli/aws /usr/local/bin/aws
$ sudo ln -s /folder/installed/aws-cli/aws_completer /usr/local/bin/aws_completer
which aws
aws configure
```