##
## 1. CONNECT TO GOOGLE CLOUD VM FROM LOCAL
##

# Gen key 
ssh-keygen -t ed25519 -C "duyng2512@gmail.com"
# Connect to VM gcp
cat /Users/lap15740-local/.ssh/id_ed25519.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIICLUnuch1UQ9yn2lwONvH/pDnotXmDRKwSITKdaiZpT duyng2512@gmail.com
# Then copy public key to meta data 
ssh -i ~/.ssh/id_ed25519 duyng2512@34.126.149.122

