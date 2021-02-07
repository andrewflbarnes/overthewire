# Bandit

Visit the [website][1].

Server details:
```
url:   bandit.labs.overthewire.org
port:  2220
user:  bandit<level>
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
0 bandit0
1 1234567890abcdef
2 fedcba0987654321
```

In the case where you get the private key for a level store it in a file named `bandit<level>_key` e.g. if you have found
the key for `bandit24` store it in the file `bandit24_key`. This key will be used automatically when running the
`./connect.sh` script for that level (e.g. `./connect.sh 24`).

The starting password for level `0` is `bandit0`.

### Levels

Instructions for each level can be found at
```
https://overthewire.org/wargames/bandit/bandit<level>.html
```

##### 0

`cat readme`

##### 1

`cat ./-`

##### 2

`cat` the filename

##### 3

`cat` the filename

##### 4

`grep . -- inhere/*`

##### 5

`find . -type f -size 1033c | xargs cat`

##### 6

`find / -type f -size 33c -group bandit6 -user bandit7 2>/dev/null | xargs cat`

##### 7

`grep millionth data.txt`

##### 8

`sort data.txt | uniq -u`

##### 9

`strings data.txt | grep "="`

##### 10

`base64 -d data.txt`

##### 11

`tr "[a-zA-Z]" "[n-za-mN-ZA-M]" < data.txt`

##### 12

```bash
tmp=/tmp/boooooooooom
mkdir $tmp
cd $tmp

cp ~/data.txt .
xxd -r data.txt > data2.bin.gz
gzip -d data2.bin.gz
bzip2 -d data2.bin
mv data2.bin.out data4.bin.gz
gzip -d data4.bin.gz
tar -xvf data4.bin
tar -xvf data5.bin
bzip2 -d data6.bin
tar -xvf data6.bin.out
mc data8.bin data9.bin.gz
gzip -d data9.bin.gz
cat data9.bin
```

##### 13

Copy the key to `bandit14_key` locally - `connect.sh` will pick this up automatically :)

##### 14

`cat /etc/bandit_pass/bandit14 | nc localhost 30000`

##### 15

`(cat /etc/bandit_pass/bandit15; sleep 1) | openssl s_client -connect :30001`

##### 16

Copy the output from below to `bandit17_key`.

```bash
ports=$(nc -zv localhost 31000-32000 2>&1 | awk '{ print $3 }')
key_found=0

for i in $ports
do
    (cat /etc/bandit_pass/bandit16; sleep 1) \
    | openssl s_client -connect :$i 2>/dev/null
done \
| while read line
    do
        if grep -q 'BEGIN RSA PRIVATE KEY' <<< $line
        then
            key_found=1
        fi
        if [ "${key_found}" -eq "1" ]
        then
            echo $line
        fi
        if grep -q 'END RSA PRIVATE KEY' <<< $line
        then
            key_found=0
        fi
    done
```

##### 17

`diff passwords.new passwords.old`

##### 18

```bash
# connect and set the command to sh e.g.
./connect 18 sh
# or
ssh ..... sh

cat readme
```

##### 19

`./bandit20-do cat /etc/bandit_pass/bandit20`

##### 20

```bash
cat /etc/bandit_pass/bandit20 | nc -lp 33333 &
./suconnect 33333
```

##### 21

```bash
# get the script name being run
cat /etc/cron.d/cronjob_bandit22
# find the temp file being created in the script and cat it
cat $(grep -o "/tmp/.*" /usr/bin/cronjob_bandit22.sh | uniq)
```

##### 22

```bash
# get the script name being run
cat /etc/cron.d/cronjob_bandit23
# regenerate the name and cat it
cat /tmp/$(echo I am user bandit23 | md5sum | cut -d ' ' -f 1
```

##### 23

```bash
cronfile=/var/spool/bandit24/andrewflbarnes24
outdir=/tmp/andrewflbarnes24
outfile=${outdir}/password

# add a shell script which the cronjob /etc/cron.d/cronjob_bandit24 will execute
cat << EOF > ${cronfile}
# make the output directory
mkdir -p ${outdir}
# copy the password file for bandit 24
cp /etc/bandit_pass/bandit24 ${outfile}
# make sure the file is readable
chmod 777 ${outfile}
EOF

# make sure the cron job file is executable
chmod a+x ${cronfile}

# wait for the output file to be created
while ! ls ${outfile} 2>/dev/null
do
    sleep 1
    echo "$(date -R) Checking for existence of ${outfile}"
done

# get the password!
cat ${outfile}

```

##### 24

```bash
for i in {0..9999}
do
    printf "%s %04d\n" $pass $i
done \
| nc localhost 30002 \
| grep -Ev "(Wrong|I am the pincode checker)"
```

##### 25

Copy SSH key

##### 26

Check the shell in use while logged in as `bandit25` e.g. `grep bandit26 /etc/passwd`.

Collapse your terminal real smallllllll so that `more` shows up, then you can
```
v
set shell=/bin/bash
:shell
./bandit27-do cat /etc/bandit_pass/bandit27
```

##### 27

```bash
mkdir -p /tmp/andrewflbarnes27
cd /tmp/andrewflbarnes27
git clone ssh://bandit27-git@localhost/home/bandit27-git/repo
# enter yes
# enter bandit27 password
cd repo
cat README
```

##### 28

```bash
mkdir -p /tmp/andrewflbarnes28
cd /tmp/andrewflbarnes28
git clone ssh://bandit28-git@localhost/home/bandit28-git/repo
# enter yes
# enter bandit28 password
cd repo

git log -p | grep "^+.*password:" | grep -vE "(xxxxxx|TBD)"
```

##### 29

```bash
mkdir -p /tmp/andrewflbarnes29
cd /tmp/andrewflbarnes29
git clone ssh://bandit29-git@localhost/home/bandit29-git/repo
# enter yes
# enter bandit29 password
cd repo

git log --all -p | grep "^+.*password:" | grep -v "no passwords"
```

##### 30

```bash
mkdir -p /tmp/andrewflbarnes30
cd /tmp/andrewflbarnes30
git clone ssh://bandit30-git@localhost/home/bandit30-git/repo
# enter yes
# enter bandit30 password
cd repo

git tag -l
# ohh look, a secret tag
git show secret
```

##### 31

```bash
mkdir -p /tmp/andrewflbarnes31
cd /tmp/andrewflbarnes31
git clone ssh://bandit31-git@localhost/home/bandit31-git/repo
# enter yes
# enter bandit31 password
cd repo

echo "May I come in?" > key.txt
> .gitignore
git commit -m "Get me the password :)"
git push
```

##### 32

```
# re-execute the shell - but why does this work?
$0

cat /etc/bandit_pass/bandit33
```

##### 33

Done!



[1]: <https://overthewire.org/wargames/bandit/> "Bandit wargames landing page"
