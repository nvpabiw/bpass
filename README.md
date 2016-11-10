# BPass
Simple Password Manager based on Bash



Why BPass?
===============================================
- **Simplicity**: Main goal is to make the process of storing passwords 
  as simpleas possible for the average user without 
  going through a big learning curve on how to use it

- **Portability**: User doesn't need to go through the hassle
  of importing gpg keys, etc. as just having a copy of 
  the encrypted password file should be enough

- Bash is everywhere on Linux/Unix based systems
  so BPass should work out of the box as long as 
  Openssl package is installed. 

- Password file is automatically encrypted & decrypted
  each time bpass is used.

- Decrypted file that is no longer in use is securely 
  erased to make it unrecoverable

- No meta data related to encrypted file is leaked



Features
========
- [x] Uses openssl for encryption and decryption                                                       
- [x] Maintains one single file for storing password                                                
- [x] Automatically & Securely erases decrypted file
- [ ] Can insert user provided information into existing password file
- [ ] Can search for specific sites using input keyword        
- [ ] Show a list of found password for sites matched according to keyword 
- [ ] Copy password to clipboard for specific site selected by user                                        
- [ ] Automatically remove copied password from clipboard after a minute has expired
- [ ] Generate and store secure passwords for specific sites                                     
- [ ] Change master password of BPass
- [ ] Update password of an existing site                                                                           
- [ ] Support for storing & syncing with cloudbased storage
- [ ] Status bar showing number of sites, average password length, 
      if a password is longer than one year, etc. after successful 
      decryption

