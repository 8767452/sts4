#!/bin/bash
set -e -x

workdir=$(pwd)

# Build jdt.ls
cd ${HOME}/git/eclipse.jdt.ls
jdt_ls_repo=$(pwd)
./mvnw -Pserver-distro -Pupdate-site clean package

# Build vscode-java
cd ${HOME}/git/vscode-java
rm -fr server
mkdir server
tar -xvzf ${jdt_ls_repo}/org.eclipse.jdt.ls.product/distro/jdt-language-server-*.tar.gz -C ./server
npm install
rm -fr *.vsix
npm install -D vsce
./node_modules/.bin/vsce package
code --uninstall-extension redhat.java || echo "Not installed redhat.java"
code --install-extension *.vsix

# Build spring boot ls
cd $workdir
npm install
rm -fr *.vsix
npm run vsce-package
code --uninstall-extension Pivotal.vscode-spring-boot || echo "Not installed Pivotal.vscode-spring-boot"
code --install-extension *.vsix
