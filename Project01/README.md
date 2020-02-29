# CS-1XA3 | PROJECT-01           |  <sandhk8>
**The repository CS1XA3 has a running bash script which is in the file CS1XA3/Project01/project_analyze.sh**

There is a fun prompt just to make the user engaged by testing the typing speed of the user. This inspiration was taken from [Link](http://linuxcommand.org/lc3_wss0100.php)

**NOTE - IFS is set to `$'\n'`**


## Usage
- Make the project_analyze.sh executable with :
  `chmod +x CS1XA3/Project01/project_analyze.sh`
- To run the script , use command :
`./CS1XA3/Project01/project_analyze`
- There are no such arguments , User input is taken as feature 6.1

## FEATURE 6.1
>Description: This is the script input feature which requests user to enter a feature code corresponding to the desired feature. To run enter code

### -EXECUTION      
- **FEATURE 6.2 --> 2**
- **FEATURE 6.5 --> 5**
- **FEATURE 6.6 --> 6**
- **FEATURE 6.7 --> 7**
- **FEATURE 6.8 --> 8**
- **CUSTOM FEATURE 1 --> 11**
- **CUSTOM FEATURE 2 --> 12**
## FEATURE 6.2
>Description: The FIXME Log feature, searches through the repo and the file fixme.log is overwritten (created if not present) with the names of the files that contain the keyword **#FIXME** in the last line of the file.
The `find ` command finds the desired files , `tail -1` and `grep` is used to filter the files that match the conditions and only those **filenames** are written whose **exit status** `$?` for `grep` is 0 .
### -EXECUTION
- Enter feature code -> **2** and press enter.
-  The lines containing #FIXME at the end of the file will be displayed.
- ALL the files corresponding to these files will be written in `CS1XA3/Project01/fixme.log`
- Within directory `CS1XA3/Project01`, use `ls` and check the contents of fixme.log using `cat`
## FEATURE 6.5
>Description: The FILE TYPE feature counts the number of files with extension input by the user , in the entire repository. The `read` command takes the file extension as input and `find $file_path/ -name "*.$ext"` finds only those file in repo that has the given extension.
The `for` loop counts the number of such files.
### -EXECUTION
- Enter the feature code -> **5** and press enter
- Enter the extension (py, jpeg,txt,log) and press enter.
 - The number of files with the desired extension in the repo is given as output
- If no file is found, it returns 0.
## FEATURE 6.6
>Description: The find Tag command creates a file `CS1XA3/Project01/"$Tag".log` '(overwrites it if it already exists) and writes the name of the files with the extension ".py"  which has the keyword `$tag` and begins with a `#` into `CS1XA3/Project01/"$Tag".log`
The command `find $file_path/ -name "*.py"` finds all files with extension with "py" . `for` loop is applied to each output of find and command `grep -E '^#' $item  | grep $Tag` is passed to each item of loop which matches line containing "#" and "$Tag" . The lines having exit status `$?` 0 are written in `CS1XA3/Project01/"$Tag".log`
### -EXECUTION
- Run the feature by entering feature code -> **6** and pressing Enter.
- Input the desired tag you want to search for and press enter.
- use the ls command to check if file `CS1XA3/Project01/"$Tag".log`
- use `cat CS1XA3/Project01/"$Tag".log` and all the desired comments with tag will be in the output .
## CUSTOM FEATURE 1
### -Encrypt numeric key
>Objective -This feature will search for a particular file extension and in that  search for the **"key combination"** which contains (a lower case alphabet)(numeric digit)(a higher case alphabet) in succession. All these combinations from various files will be saved in a file with .safe extension and the **"numeric digit"** digit will be replaced by **"#"**
### -EXECUTION
- For execution create various files with extension 'pass' and enter some passwords line by line , along with some special passwords which contains contains a lower case alphabet as first character ,numeric digit as second ,an uppercase  alphabet in succession . For instance the file should be like
   ```
      wdj231%dd
      p@ssW0RD
      a3A 
      c2B
      B4a
      random passwords
                      ```
- Now run the feature by entering code -> **11** and pressing enter.
- The `grep` command will pick those special passwords and put them in a safe file(safe.t) with the numeric digit replaced by a '#' with the help of `sed` command using regex patterns.
- Now check the original files with extensions , which will have the special passwords deleted using `sed` command.
                

## CUSTOM FEATURE 2
### -seperate keys and values
This feature takes 1 input for filename(without extension) and makes 2
files , the script will include  an array with the value associated with each key and it will print out values in one file and the corresponding keys into the other.
### -EXECUTION
- Execute this command with code **12**
- Enter the desired filename 
-The keys in the array(which is in the script) will be written in `$filename.key` line by line.
- The values for corresponding keys will be written in another file called `$filename.value`.
>> The format for array was referenced from [link](https://stackoverflow.com/questions/14370133/is-there-a-way-to-create-key-value-pairs-in-bash-script/23697848)
## FEATURE 6.7
>Description : This feature finds all the file in the repo that have extension 'sh' and provides 2 options
>1. change the permissions of the files to enable executable permissions for those people who have write permissions.
>2. restore - restores the original file permissions which are specified in "permissions.log"
### -EXECUTION
**WARNING ENTER ONLY THE SPECIFIC COMMAND MENTIONED-"Change" or "Restore"**
- Execute this feature by entering code **7**
- You will have a prompt for 2 options , either **"Change"** or **"Restore"** 
- IF "Change" command is run then it creates a file "permissions.log" or overwrites it if it exists  , for all files in repo that have extension 'sh' along with their original permissions.
- The permissions will be changed in a way that those people who have write permission by default will have execute permission enabled.
- The `stat` function gives the information of the file and the file permissions(along with the code) are cut along.
- Then using conditional statements and `chmod` the desired permissions are changed. 
- IF 'Restore' command is run , then all the original permissions of the files (as mentioned in permissions.log) will be restored.
- The `cut` command selects the code for originals permissions and restores the corresponding permissions using `chmod #code #filename`




>>The idea of `stat` was taken from [link](https://www.computerhope.com/unix/stat.htm) 
## FEATURE 6.8
>Description : This feature has 2 options -
>1. "Backup" - It finds all the files in repo that has extension 'tmp' and copies them to the folder "backup" and deletes the files from their original locations. Also a file called "restore.log" is created in backup directory that contains list of filepaths to the original locations of the files.
>2. "Restore" - It restores all the deleted files and their contents that had a backup.
### EXECUTION
**WARNING ENTER ONLY THE SPECIFIC COMMAND MENTIONED-"Backup" or "Restore"** 
- Execute this feature by entering feature code **8**
- If "Backup" command is run , then "CS1XA3/Project01/backup" directory will be created if it does not exists, and emptied if it does exists.
- Then all the files with 'tmp' extension will be copied to the backup folder and  along with their file paths in 'restore.log' and the files will be removed from their original locations.
**WARNING - DO NOT RUN THE 'Backup' COMMAND TWO CONSECUTIVE TIMES WITHOUT RESTORING ONCE, IT WILL REMOVE ALL 'tmp' FILES FROM REPO**
- IF "Restore" command is run , then all the tmp files in the backup folder will be restored  in the repo.
**WARNING - If the 'backup' directory does not exists , it will give an error message.**
**WARNING - If the file 'restore.log' does not exists , it will give an error message ,"backup cannot be made".**
**WARNING - If file path of the file exists in "restore.log" but the corresponding file is absent in the backup folder , it will give a error message for that particular file.**

