# Author:        irenicus09
# Program:       BPass.sh
# Version:       0.1
# License:       GPLv3
# Dependencies:  Bash, Openssl, Shred
# Last Modified: Fri Nov 11, 2016
#
# BPASS - Simple Bash Based Password Manager
# Copyright © 2016 F474A
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


EncryptedFile="$HOME/.bpass.bin";
DecryptedFile="$HOME/.bpass.txt";
PASSWORD_CURRENT="";

EncryptBinary(){ openssl enc -aes-256-cbc -salt -in \
    $DecryptedFile -out $EncryptedFile \
    -pass pass:$PASSWORD_CURRENT 2>/dev/null;
}

DecryptBinary(){ openssl enc -aes-256-cbc -d -in \
    $EncryptedFile > $DecryptedFile \
    -pass pass:$PASSWORD_CURRENT 2>/dev/null;
}

Cleanup(){ shred -vzn 3 $DecryptedFile 2>/dev/null; }

#########################################################

# Reading Input Password
echo -n "[+] Enter Decryption Password: ";
read -s PASSWORD_CURRENT;
echo "";

# Decryption Process
if [[ ! -f $EncryptedFile ]]; then
    echo "[+] No previous file exists, creating new one!";
    touch $DecryptedFile;
else
    DecryptBinary;
fi

if [[ $? -eq 1 ]]; then
    echo '[!] Incorrect Password :-{';
    exit 1;
fi

# Manual Password Storing / Editing Process
$EDITOR $DecryptedFile ;

# Re-Encryption process
if [[ -s $DecryptedFile ]]; then
    EncryptBinary && Cleanup;
    echo "[+] Finished cleaning up :]";
fi

