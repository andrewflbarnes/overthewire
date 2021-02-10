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

Most commonly occurring english letters:
```
Concise Oxford dictionary:  EARIOTNSLCUDPMHGBFYWKVXZJQ
Lewand:                     ETAOINSHRDLCUMWFGYPBVKJXQZ
```

##### 0

Decode the password from the [level 0 page][2]

##### 1

Standard ROT13
`tr 'A-Z' 'N-ZA-M' < /krypton/krypton1/krypton2`

##### 2

Use the program to work out what the subsitution is then reverse it a la `tr`.

```bash
mkdir /tmp/andrewflbarnes2
cd /tmp/andrewflbarnes2
cp /krypton/krypton2/encrypt .
echo {A..Z} | tr -d ' ' > keyfile.dat
./encrypt keyfile.dat
sub=$(cat ciphertext)
tr "$sub" "A-Z" < /krypton/krypton2/krypton3
```

Note: Looks like you need to copy the encrypt binary as well or it won't be able to write to the file - probably some issue
with the EUID.

##### 3

Use the below for an initial guess with Lewand subsitution and then iterate. Alternatively use something like [this crypto site][3]
```bash
cd /krypton/krypton3

guess=$(for i in {A..Z}
do
    printf "%d %s\n" $(fgrep -o $i <(cat found*) | wc -l) $i
done \
| sort -rn \
| awk '{printf $2}')

echo $guess

# iterate on the below making adjustments to guess
tr $guess ETAOINSHRDLCUMWFGYPBVKJXQZ < <(cat found*)

# once the above is solved
tr $solved_guess ETAOINSHRDLCUMWFGYPBVKJXQZ < krypton4
```

##### 4

We know the key length is 6 so we can do frquency analysis on each group of every 6th letter. We don't
need to do "full" analysis here - as long as we can find an offset such that within the first few letters
we find some or most of those expected we have worked it out.

For example if we had frequency analysis for one of the groups where the first few letters are
```
WHDR...
```
we can be reasonably sure the offset is 3/C since this maps those first few letters to
```
TEAO...
```
which seems like a reasonable approximation of Lewand (`ETAOIN...`).

```bash
cd /krypton/krypton4

for i in {0..5}
do
    freq=$(sed 's/ //g;s/\(.\)/\1\n/g' < <(cat found*) \
    | awk -v mod=6 -v r=$i 'NR%mod==r' \
    | sort \
    | uniq -c \
    | sort -nr \
    | awk '{printf $2}')

    echo $freq
done
```

[1]: <https://overthewire.org/wargames/krypton/> "krypton wargames landing page"
[2]: <https://overthewire.org/wargames/krypton/krypton0> "krypton level 0"
[3]: <https://crypto.interactive-maths.com/frequency-analysis-breaking-the-code.html> "Frequency analysis online"
