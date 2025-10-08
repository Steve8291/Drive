# lvl 0
How to get into the wire
```bash 
ssh -p 2220 bandit0@bandit.labs.overthewire.org 
# (the password is bandit0)
```
How to get the password for lvl 1 (the current pass is: `ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If`)
```bash
ls # (it should say the only file in directory is "readme")
cat readme
ssh -p 2220 bandit1@bandit.labs.overthewire.org # then use the new password
```
# lvl 1
How to get the password for lvl 2 (current pass is: `263JGJPfgU6LtdEvgfWU1XP5yac29mFx`)
```bash
ls -l # (to get a list of the current directory)
cat ./- # (have to do the thing for running a thing to show the computer that you want the dash to be the name not the part of a command)
ssh -p 2220 bandit2@bandit.labs.overthewire.org # (with  the current password)
```
# lvl 2
How to get the password for lvl 3 (current password is: `MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx`)
```bash
ls -l # (same reason as last)
cat './--spaces in this filename--' # (the quotes are like parenthesis ind math, it keeps everything inside)
ssh -p 2220 bandit3@bandit.labs.overthewire.org # (then use the next password)
```
# lvl 3
how to get the password for lvl 4 (current password is: `2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ`)
```bash
ls -l
cd inhere # (Its a folder so we gotta go into it)
ls -l # (find nothing there so assume its hidden with . ..)
cat './...Hiding-From-You' # (to read the file you just found)
ssh -p 2220 bandit4@bandit.labs.overthewire.org
```
# lvl 4
how to get the password for lvl 5 (current password is: `4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw`)
```bash
cd ~/inhere # (to get into the correct directory)
find . -type f -exec file {} + | grep "ASCII text" # (checks the output of `find . -type f -exec file {} and greps and shows which one says ASCII text which is a human readable)
cat " output from previous " # to see the password
ssh -p 2220 bandit5@bandit.labs.overthewire.org
```
`-exec` makes it so find can do a list of files
# lvl 5
how to get the password for lvl 6 (the current password is: `HWasnPhtq9AVKe0dmk45nxy20cvUa6EG`)
```bash
cd ./inhere # (get into the directory)
find ./* -size 1033c # (to find the correct size from the hint, you can use any number)
cat "the output" # (there should be the pass)
ssh -p 2220 bandit6@bandit.labs.overthewire.org
```
# lvl 6
how to get the password for lvl 7 (the current password is: `morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj`)
```bash
cd / # (go to top directory)
find -size 33c -group bandit6 -user bandit7 | grep -v "Permission denied" # (grep really didnt work here but basically find something that has the size of 33c and is owned by the group bandit6 and owned by the user bandit7)
cat ./var/lib/dpkg/info/bandit7.password # (this is where the password is stored)
ssh -p 2220 bandit7@bandit.labs.overthewire.org
```
# lvl 7
how to get the password to lvl 8 (current password is: `dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc`)
```bash
ls -l # (should show data.txt)
grep 'millionth' data.txt # (should show the password next to millionth since they are on the same line)
ssh -p 2220 bandit8@bandit.labs.overthewire.org
```
# lvl 8
how to get password to lvl 9 (current password is: `4CKMh1JI91bUIZZPXDqGanal4xvAg0JM`)
```bash
ls -l # (find data.txt again)
sort data.txt | uniq -u # (sort sorts everything together, uniq filters out the multiples, -u filters out the ones that are duplicates)
ssh -p 2220 bandit9@bandit.labs.overthewire.org
```
# lvl 9
find the password to lvl 10 (current password is: `FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey`)
```bash
ls -l # (find data.txt again)
grep -a '=======' data.txt | strings # (this will show any string of human letters that is preceded by equal signs)
ssh -p 2220 bandit10@bandit.labs.overthewire.org
```
# lvl 10
how to find the password for lvl 11 (current password is: `dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr`)
```bash
ls # (find all in directory)
base64 -d data.txt # (base64 decodes the binary file turns into text, -d takes away the junk binary that would mess it all up)
ssh -p 2220 bandit11@bandit.labs.overthewire.org
```
# lvl 11