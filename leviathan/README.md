# Leviathan

Visit the [website][1].

Server details:
```
url:   leviathan.labs.overthewire.org
port:  2223
user:  leviathan<level>
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
0 leviathan0
1 1234567890abcdef
2 fedcba0987654321
```

In the case where you get the private key for a level store it in a file named `leviathan<level>_key` e.g. if you have found
the key for `leviathan24` store it in the file `leviathan24_key`. This key will be used automatically when running the
`./connect.sh` script for that level (e.g. `./connect.sh 24`).

The starting password for level `0` is `leviathan0`.

### Levels

There are no instructions for any levels though pages do exist for them
```
https://overthewire.org/wargames/leviathan/leviathan<level>.html
```

##### 0

`grep password ./backups/bookmarks.html`


[1]: <https://overthewire.org/wargames/leviathan/> "Leviathan wargames landing page"
