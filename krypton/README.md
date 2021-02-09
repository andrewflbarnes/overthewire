# krypton

Visit the [website][1].

Server details:
```
url:   krypton.labs.overthewire.org
port:  2231
user:  krypton<level>
```

For convenience use
```bash
./connect.sh <level>
```

### Storing solutions

Once you have a password add it to a `passwords` file in the form `<level> <password`. When you run the `./connect.sh`
script it will print the password for the level if it exists so you can easily copy and paste it.  
For example
```
0 krypton0
1 1234567890abcdef
2 fedcba0987654321
```

In the case where you get the private key for a level store it in a file named `krypton<level>_key` e.g. if you have found
the key for `krypton24` store it in the file `krypton24_key`. This key will be used automatically when running the
`./connect.sh` script for that level (e.g. `./connect.sh 24`).

### Levels

Instructions can be found for each level at URLs like below:
```
https://overthewire.org/wargames/krypton/krypton<level>.html
```

Files which require decoding for the next level can be found in `/kypton/krypton<current level>/krypton<next level>` e.g.
if you are on level 1 then you will find the ciphertext in `/krypton/krypton1/krypton2`

##### 0

Decode the password from the [level 0 page][2]

##### 1

Standard ROT13
`tr 'A-Z' 'N-ZA-M' < /krypton/krypton1/krypton2`

##### 2




[1]: <https://overthewire.org/wargames/krypton/> "krypton wargames landing page"
[2]: <https://overthewire.org/wargames/krypton/krypton0> "krypton level 0"
